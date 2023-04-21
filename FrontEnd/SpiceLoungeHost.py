from flask import Flask, request,render_template
import requests
import os
from flask_mysqldb import MySQL

dir_path = os.path.dirname(os.path.realpath(__file__))
template_dir = os.path.join(dir_path, "Website/src/html")
app = Flask(__name__,template_folder=template_dir)

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='class'

mysql=MySQL(app)

@app.route("/validate")
def test():
    username=request.args.get("user")
    password=request.args.get("password")
    cursor=mysql.connection.cursor()
    cursor.execute(''' SELECT COUNT(*) FROM USER_INFO WHERE BINARY USERNAME = '%s' AND BINARY PASSWORD = '%s' ;'''%(username,password))
    mysql.connection.commit()
    res=cursor.fetchone()[0]

    if res>0:
        return render_template("success.html")
    else:
        return "Failed Login"
    
#Home Page
@app.route("/")
@app.route("/home")
def home():
    return render_template("index.html")

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

#End of Account Directories -------------------------------------------------





if __name__  == '__main__':
    #doesnt work with reloader for some reason
    app.run(debug=True,port=5001,use_reloader=False)
