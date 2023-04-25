from flask import Flask, request,render_template
#import requests
import os
import random
from flask_mysqldb import MySQL
from decimal import Decimal

dir_path = os.path.dirname(os.path.realpath(__file__))
template_dir = os.path.join(dir_path, "Website/src/html")
staticDir=os.path.join(dir_path, "Website/src/static")
app = Flask(__name__,template_folder=template_dir,static_folder=staticDir)

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='spicelounge2'

mysql=MySQL(app)

class Post:
    def __init__(self):
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
    def loadRow(self,queryRow):
        self.id=queryRow[0]
        self.title=queryRow[1]
        self.short_description=queryRow[2]
        self.image=queryRow[3]
        #This will be a datetime obj
        self.date=queryRow[4].strftime('%Y-%m-%d')
        self.userid=queryRow[5]
        self.username=queryRow[6]

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
        posts.append(posttmp)
        # id=random.random()*1000
        # title = 'My Awesome Post'
        # username = 'johndoe'
        # date = '2022-05-01'
        # rating = 4.5
        # image = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80'
        # short_description = 'This is a short description of my post'
        # ingredients = ['Ingredient 1', 'Ingredient 2', 'Ingredient 3']
        # equipment = ['Equipment 1', 'Equipment 2', 'Equipment 3']
        # steps = ['Step 1', 'Step 2', 'Step 3']

    return render_template("index.html",posts=posts)

#Account directories --------------------------------------------------------

# This brings up a specific account specified in a query
@app.route("/account")
def viewAccount():
    # get the username query parameter from the URL
    username = request.args.get("username")
    return render_template("login.html")

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
@app.route("/account/create")
def createAccount():
    return render_template("login.html")

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


    title = 'My Awesome Post'
    username = 'johndoe'
    date = '2022-05-01'
    rating = 4.5
    image = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80'
    short_description = 'This is a short description of my post'
    ingredients = ['Ingredient 1', 'Ingredient 2', 'Ingredient 3']
    equipment = ['Equipment 1', 'Equipment 2', 'Equipment 3']
    steps = ['Step 1', 'Step 2', 'Step 3']

    post = Post(title, username, date, rating, image, short_description, ingredients, equipment, steps,id)

    return render_template("post.html",post=post)

@app.route("/post/create")
def createPost():
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
