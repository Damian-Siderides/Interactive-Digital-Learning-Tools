import sqlite3
from bottle import route, run, debug, template, request, static_file, get, post, response, redirect

@route('/')
@route('/home')
def home():
    return template('home', status="no")

@route('/problems')
def problem():
    return template('problems')

@get('/<name>')
def page(name):
    return template(name, status="no")

@post('/<name>')
def page(name):

    right = "right" + name
    wrong = "wrong" + name
    total = "total" + name

    #there's a chance that python doesn't have scoping
    #which means the next line isn't needed
    user = None

    if request.get_cookie('username') == None:
        user = "Anonymous"
    else:
        user = request.get_cookie('username')

    if request.forms.get('answer').upper() == request.forms.get('guess').upper():
        
        conn = sqlite3.connect('data.db')
        c = conn.cursor()
        conn.execute("UPDATE data SET {} = {} + 1 WHERE username IS ?".format(right, right), (user,))
        conn.execute("UPDATE data SET {} = {} + 1 WHERE username IS ?".format(total, total), (user,))
        conn.execute("UPDATE data SET {} = {} + 1 WHERE username IS ?".format(right, right), ('GLOBAL',))
        conn.execute("UPDATE data SET {} = {} + 1 WHERE username IS ?".format(total, total), ('GLOBAL',))
        conn.commit()
        c.close()
        #status = "success"
        return template(name, status = "success")


    else:
        
        conn = sqlite3.connect('data.db')
        c = conn.cursor()
        conn.execute("UPDATE data SET {} = {} + 1 WHERE username IS ?".format(wrong, wrong), (user,))
        conn.execute("UPDATE data SET {} = {} + 1 WHERE username IS ?".format(total, total), (user,))
        conn.execute("UPDATE data SET {} = {} + 1 WHERE username IS ?".format(wrong, wrong), ('GLOBAL',))
        conn.execute("UPDATE data SET {} = {} + 1 WHERE username IS ?".format(total, total), ('GLOBAL',))
        conn.commit()
        c.close()
        #status = "wrong"
        return template(name, status="wrong")


#slides

@route('/stats')
def stats():
    return template('stats')

@route('/cookie')
def cookie():
    if request.get_cookie('username') == None:
        return 'no cookie'
    return request.get_cookie('username')

@route('/slides/<name>')
def slides(name):
    return static_file(name, root='./slides')

@route('/images/<name>')
def images(name):
    return static_file(name, root='./images')

@route('/logout')
def logout():
    response.delete_cookie('username')
    return 'cookie deleted'

@get('/login')
def login():
    return template('login', status="no")

@post('/login')
def login():
    username = request.forms.get('username')
    password = request.forms.get('password')

    conn = sqlite3.connect('data.db')
    c = conn.cursor()
    c.execute("SELECT password FROM data WHERE username IS ?", (username,))
    cur_data = c.fetchone()
    c.close()
    
    if cur_data == None:
        return template('login', status="wrong")

    if password == cur_data[0]:
        response.set_cookie('username', username)
        #return template('You have entered the correct username and password. and your username is {{test}}', test = request.get_cookie('username'))
        #if u log in again this will tell u the username of the previous person
        return template('home', status="success")
    return template('login', status="wrong")

@get('/register')
def register():
    return template('register', status="no")

@post('/register')
def register():
    username = request.forms.get('username')
    password = request.forms.get('password')
    
    conn = sqlite3.connect('data.db')
    c = conn.cursor()

    fields = "(username, password, rightkmap, wrongkmap, totalkmap, rightkmap2, wrongkmap2, totalkmap2, rightkmap3, wrongkmap3, totalkmap3, rightkmap4, wrongkmap4, totalkmap4, rightvhdl, wrongvhdl, totalvhdl, rightvhdl2, wrongvhdl2, totalvhdl2, rightvhdl3, wrongvhdl3, totalvhdl3, rightvhdl4, wrongvhdl4, totalvhdl4, rightvhdl5, wrongvhdl5, totalvhdl5, rightfsm, wrongfsm, totalfsm, rightfsm2, wrongfsm2, totalfsm2, rightfsm3, wrongfsm3, totalfsm3, rightfsm4, wrongfsm4, totalfsm4)"
    values = "0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0"

    conn.execute("INSERT INTO data {} VALUES (?, ?, {})".format(fields, values), (username, password))
    conn.commit()
    c.close()
    
    return template('login', status="success")

    #bare in mind values are in url bar

#run(reloader=True, port=8080, debug=True, server='cherrypy')
run(reloader=True, port=8080, debug=True)