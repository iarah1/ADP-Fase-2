# -*- coding: utf-8 -*-
"""
Created on Mon May 15 21:17:49 2023

@author: carlo
"""


import pandas as pd
import numpy as np

# IMPORT THE SQALCHEMY LIBRARY's CREATE_ENGINE METHOD
from sqlalchemy import create_engine

 
# DEFINE THE DATABASE CREDENTIALS
user = 'root'
password = ''
host = '127.0.0.1'
port = 3306
database = 'pruebapython'
 
# PYTHON FUNCTION TO CONNECT TO THE MYSQL DATABASE AND
# RETURN THE SQLACHEMY ENGINE OBJECT
def get_connection():
    return create_engine(
        url="mysql+pymysql://{0}:{1}@{2}:{3}/{4}".format(
            user, password, host, port, database
        )
    )
 
 
if __name__ == '__main__':
 
    try:
       
        # GET THE CONNECTION OBJECT (ENGINE) FOR THE DATABASE
        engine = get_connection()
        print(
            f"Connection to the {host} for user {user} created successfully.")
        
    except Exception as ex:
        print("Connection could not be made due to the following error: \n", ex)
        

        
query = "select * from tabla1 where flag_enviar=1;"
clientes = pd.read_sql_query(query,engine)
    
info_correo = clientes.loc[clientes["flag_enviar"] == 1]
correos = info_correo["correo"].values.tolist()
    



import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders


for x in correos:

    email_user = 'tlcrar23@gmail.com'
    email_password = 'tffplfxecykqbdsu'
    email_send = x
    
    subject = 'Coincidencias para su busqueda de carros ' #+ Tiempo
    msg = MIMEMultipart()
    msg['From'] = email_user
    msg['To'] = email_send
    msg['Subject'] = subject
    
    q_cliente = "select anio,marca,modelo,danio,precio,puja,estado,numero_lote from tabla1 where flag_enviar=1 and correo='" + x +"';"
    info_cuerpo_correo = pd.read_sql_query(q_cliente,engine)
    #info_cuerpo_correo_lst=info_cuerpo_correo.values.tolist()
    # el mensaje del correo dira: Coincidencias para su busqueda de carros
    # body = 'Hola, Este correo contiene un cuadro con carros en oferta! \n\n' + info_cuerpo_correo.to_html()
    html = """\
    <html>
      <head></head>
      <body>
        {0}
      </body>
    </html>
    """.format(info_cuerpo_correo.to_html())
    
    #msg.attach(MIMEText(body,'plain'))
    msg.attach(MIMEText(html, 'html'))
    
    #filename='exp' + Tiempo + '.html'
    #attachment  =open(filename,'rb')
    
    #part = MIMEBase('application','octet-stream')
    #part.set_payload((attachment).read())
    #encoders.encode_base64(part)
    #part.add_header('Content-Disposition',"attachment; filename= "+filename)
    
    #msg.attach(part)
    text = msg.as_string()
    server = smtplib.SMTP('smtp.gmail.com',587)
    server.starttls()
    server.login(email_user,email_password)
    
    server.sendmail(email_user,email_send,text)
    server.quit()


#cerrando conexion de DB
engine.dispose()