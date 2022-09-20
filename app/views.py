from crypt import methods
from app import app 
from flask import render_template , request , session
import pymysql

connection = pymysql.connect(host = 'localhost', user = 'root', password = '', database = 'guardians')
cursor = connection.cursor()
app.secret_key = 'mysecretkey'

@app.route('/')
def index():
    return render_template('public/index.html')

@app.route('/home')
def home():
    return render_template('public/dashboardUsers.html')

@app.route('/login',methods=['GET','POST'])
def login():
    msg = ''
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cursor.execute('SELECT * FROM user WHERE username = %s AND passwords = %s', (username, password))
        account = cursor.fetchone()

        role = cursor.execute('SELECT is_admin FROM user WHERE username = %s AND passwords = %s', (username, password))
        role = cursor.fetchone()

        signature_registered = cursor.execute('SELECT signature_registered FROM user WHERE username = %s AND passwords = %s', (username, password))
        signature_registered = cursor.fetchone()

        signature_comparison = cursor.execute('SELECT signature_comparison FROM user WHERE username = %s AND passwords = %s', (username, password))
        signature_comparison = cursor.fetchone()

        document_verified = cursor.execute('SELECT document_verified FROM user WHERE username = %s AND passwords = %s', (username, password))
        document_verified = cursor.fetchone()

        if account:
            session['loggedin'] = True
            session['id'] = account[0]
            session['username'] = account[1]
            if role[0] == 1:
                return render_template('admin/dashboard.html',sgn= signature_registered[0],sgn_cmp=signature_comparison[0],doc= document_verified[0])
            else:
                return render_template('public/dashboardUsers.html',sgn= signature_registered[0],sgn_cmp=signature_comparison[0],doc= document_verified[0])
        else:
            msg = 'Incorrect username/password!'
    return render_template('public/index.html',msg=msg)

@app.route('/logout')
def logout():
    session.pop('loggedin',None)
    session.pop('username',None)
    return render_template('public/index.html')


