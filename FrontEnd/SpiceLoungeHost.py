from flask import Flask, request,render_template,redirect,jsonify
import requests
import os
import random
from flask_mysqldb import MySQL,MySQLdb
from decimal import Decimal
import base64
from datetime import datetime

dir_path = os.path.dirname(os.path.realpath(__file__))
template_dir = os.path.join(dir_path, "Website/src/html")
staticDir=os.path.join(dir_path, "Website/src/static")
app = Flask(__name__,template_folder=template_dir,static_folder=staticDir)

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='spicelounge2'

mysql=MySQL(app)

class User:
    def __init__(self):
        self.userid=None
        self.username="Default User"
        self.bio="No bio yet..."
    def loadFromQuery(self,userid):
        cursor=mysql.connection.cursor()
        cursor.execute(''' select display_name,bio From userprofile where user_id=%s; ''',(userid,))
        mysql.connection.commit()
        res=cursor.fetchone()
        self.userid=userid
        self.username=res[0]
        self.bio=res[1]

class Ingredient:
    def __init__(self):
        self.name=None
        self.amount=None
        self.nutrition=None
        self.unit=None
    def loadIngredientFromQuery(self,ingredientArray):
        self.name=ingredientArray[2]
        self.amount=ingredientArray[0]
        self.nutrition=ingredientArray[3]
        self.unit=ingredientArray[1]
class Instruction:
    def __init__(self):
        self.stepNum=None
        self.instruction=None
    def loadFromQueryResult(self,instruction):
        self.stepNum=instruction[0]
        self.instruction=instruction[1]
class Post:
    def __init__(self):
        self.title = None
        self.username = None
        self.date = None
        self.rating = None
        self.image = None
        self.short_description = None
        self.ingredients = []
        self.equipment = []
        self.steps = []
        self.id=None
        self.userid=None
    def loadRow(self,queryRow):
        self.id=queryRow[0]
        self.title=queryRow[1]
        self.short_description=queryRow[2]
        self.image=base64.b64encode(queryRow[3]).decode('utf-8')

        #This will be a datetime obj
        self.date=str(queryRow[4])
        self.userid=queryRow[5]
        self.username=queryRow[6]
    def loadIngredients(self,ingredientsResult):
        for ingredient in ingredientsResult:
            tmp=Ingredient()
            tmp.loadIngredientFromQuery(ingredient)
            self.ingredients.append(tmp)
    def loadInstructions(self,instructionResults):
        for instruction in instructionResults:
            tmp=Instruction()
            tmp.loadFromQueryResult(instruction)
            self.steps.append(tmp)

    
    def loadFullPost(self,queryResults):
        self.title = None
        self.username = None
        self.date = None
        self.rating = None
        self.image = None
        self.short_description = None
        self.ingredients = None
        self.equipment = None
        self.steps = None
        self.id=None
        self.userid=None

@app.route("/validate")
def test():
    username=request.args.get("user")
    password=request.args.get("password")
    cursor=mysql.connection.cursor()
    cursor.execute(''' SELECT COUNT(*) FROM USER_INFO WHERE BINARY USERNAME = '%s' AND BINARY PASSWORD = '%s' ;'''%(username,password))
    mysql.connection.commit()
    res=cursor.fetchone()[0]

    if res>0:
        return render_template("login-success.html")
    else:
        return "Failed Login"
    
#Home Page
@app.route("/")
@app.route("/home")
def home():
    cursor=mysql.connection.cursor()
    cursor.execute(''' SELECT * FROM recent_posts_view_with_displayname; ''')
    mysql.connection.commit()
    res=cursor.fetchall()
    posts=[]
    for post in res:
        posttmp=Post()
        posttmp.loadRow(post)
        cursor.execute(''' SELECT AVG(rating) FROM rated where Post_ID=%s; ''',(posttmp.id,))
        mysql.connection.commit()
        res2=cursor.fetchone()[0]
        
        posttmp.rating=str(res2)[:3]
        if posttmp.rating=="Non":
            posttmp.rating="N/A"
        posts.append(posttmp)
    return render_template("index.html",posts=posts)

#Account directories --------------------------------------------------------

# This brings up a specific account specified in a query
@app.route("/account")
def viewAccount():
    try:
        user=User()
        user.loadFromQuery(request.args.get("userid"))
    except MySQLdb.IntegrityError:
        return "Cuenta no existe :( , o otro error"

    return render_template("user-profile.html",user=user)

# This brings up the edit account for currently signed in user
@app.route("/account/edit")
def editAccount():
    # get the username query parameter from the URL
    # should also probably include a session token stored as cookie.
    username = request.args.get("username")
    
    return render_template("login.html")

# Brings up the login page, regardless of user login status
@app.route("/account/login")
def login():
    return render_template("login.html")

# Brings up account creation page
@app.route("/account/create",methods=["GET","POST"])
def createAccount():
    if request.method == 'POST':
        print(request.values)
        email = request.values.get('email')
        username = request.values.get('username') # Your form's
        password = request.values.get('password') # input names

        #Verify UserNameNotTaken
        cursor=mysql.connection.cursor()
        cursor.execute(''' SELECT count(email) from userprofile where email=%s; ''',(email,))
        mysql.connection.commit()
        res=cursor.fetchone()[0]
        if res!=0:
            return jsonify({'error': 'Email already in use'}), 409
        #SQL QUERY TO ADD NEW USER
        else:
            success=False
            randId="user"+str(int(random.random() * 10000000000))
            while not success:
                try:
                    cursor=mysql.connection.cursor()
                    cursor.execute(''' insert into userprofile value (%s, %s, %s,%s,%s); ''',(randId,username,"Placeholder bio",password,email,))
                    mysql.connection.commit()
                    success=True
                except MySQLdb.IntegrityError:
                    randId="user"+str(int(random.random() * 10000000000))
            return redirect("/account?userid="+randId)
        
    else:
        return render_template("createaccount.html")

# Brings up account settings, verified by session ideally
@app.route("/account/settings")
def settings():
    return render_template("login.html")

# Temp route to test various pages
@app.route("/temp")
def temp():
    return render_template("post-create-success.html")

#End of Account Directories -------------------------------------------------

#Posts ----------------------------------------------------------------------


@app.route("/post/<id>")
def viewPost(id):
    #SQL Query For Getting a Post by ID
    cursor=mysql.connection.cursor()
    cursor.execute(''' SELECT Post_ID,Title,Description,Images,Posted_On,User_ID,display_name FROM post NATURAL JOIN userprofile where post_id=%s; ''',(id,))
    mysql.connection.commit()
    res=cursor.fetchone()
    posttmp=Post()
    posttmp.loadRow(res)
    cursor.execute(''' select Step_Num,Step_Description from instructions where Post_ID=%s; ''',(id,))
    mysql.connection.commit()
    res=cursor.fetchall()
    posttmp.loadInstructions(res)
    cursor.execute(''' SELECT Amount, Unit, distinct_food,food.Nutritional_Info FROM ingredients NATURAL join food where Post_ID=%s; ''',(id,))
    mysql.connection.commit()
    res=cursor.fetchall()
    posttmp.loadIngredients(res)
    cursor.execute(''' SELECT AVG(rating) FROM rated where Post_ID=%s; ''',(posttmp.id,))
    mysql.connection.commit()
    res2=cursor.fetchone()[0]
    posttmp.rating=str(res2)[:3]
    

    return render_template("post.html",post=posttmp)

@app.route("/post/create",methods=["GET","POST"])
def createPost():
    if request.method == 'POST':
        success=False
        randId="post"+str(int(random.random() * 10000000000))
        title=request.values.get("title")
        description=request.values.get("description")
        postedOn=datetime.now()
        postedOn=postedOn.strftime('%Y-%m-%d')
        img=request.values.get("image")

        cursor=mysql.connection.cursor()
        cursor.execute("START TRANSACTION")
        while not success:
            try:
                
                cursor.execute(''' insert into post value (%s, %s, %s,%s,%s,%s); ''',(randId,title,description,img,postedOn,"user1",))
                mysql.connection.commit()
                success=True
            except MySQLdb.IntegrityError:
                randId="user"+str(int(random.random() * 10000000000))
        foods=request.values.getlist('food[][name]')
        amts=request.values.getlist('food[][amount]')
        for food in range (foods.__len__()):
            foodId="food"+str(int(random.random() * 10000000000))
            
            cursor.execute(''' insert into food value (%s, %s, %s,%s); ''',(foodId,foods[food],"Meat","USER SUBMITTED IGNORE CATEGORY",))
            mysql.connection.commit()
            
            cursor.execute(''' insert into ingredients value (%s, %s, %s,%s); ''',(foodId,randId,amts[food],""))
            mysql.connection.commit()
        equipment=request.values.getlist("equipment[]")
        for item in equipment:
            cursor=mysql.connection.cursor()
            cursor.execute(''' insert into postequipment value (%s, %s); ''',(item,randId,))
            mysql.connection.commit()
        steps=request.values.getlist("steps[]")
        for num in range(steps.__len__()):
            cursor=mysql.connection.cursor()
            cursor.execute(''' insert into instructions value (%s, %s, %s); ''',(randId,num,steps[num],))
            mysql.connection.commit()
        mysql.connection.commit()
        cursor.close()
        return render_template("post-create-success.html")
    return render_template("recipe-submit.html")

# Post submission form here, may toss on different server
@app.route("/post/create/submission")
def submissionStatus():
    return render_template("post-create-success.html")

#End of posts ---------------------------------------------------------------
#Search ---------------------------------------------------------------------
# Post submission form here, may toss on different server
@app.route("/results/<query>",methods=["POST","GET"])
def search(query):
    dat="FAKE"
    return render_template("searchResults.html",query=dat)
#End of search --------------------------------------------------------------

if __name__  == '__main__':
    #doesnt work with reloader for some reason
    app.run(debug=True,port=5001,use_reloader=False)
