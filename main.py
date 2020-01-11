from bottle import route, run, template, request, response, redirect, static_file,error
import requests as req
import culqipy
import uuid
import sys
import os
#import pyodbc


culqipy.public_key = 'pk_test_juKtZ4MFGEHRVGdl' 
culqipy.secret_key = 'sk_test_qYNhzwh710OmVKcg'

#server_name = 'DESKTOP-0QOV6IS\SQLEXPRESS'

#cnxn = pyodbc.connect(driver='{SQL Server}', server=server_name, database='practice',               
#               trusted_connection='yes')

@route('/')
def index():
    return template("index")

@route('/buy', method = 'POST')
def buy():
    token = request.forms.get('_token')
    print("Token: ", token)
    charge = culqipy.Charge.create({    
        "amount": 1000,
        "currency_code": "PEN",
        "email": "alrus2797@gmail.com",
        "source_id": token
    })
    print("Charge: ", charge)
    return charge

@route('/test')
def test():
    return 'test'

   
# run (host="192.168.0.2",port=8000,debug=True,reloader=True)
if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1] == "local":
        run(host="localhost", port=8000, debug=True, reloader=True)
    else:
        run(host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))

#run(host="localhost", port=8000, debug=True, reloader=True)
