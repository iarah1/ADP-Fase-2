# -*- coding: utf-8 -*-
"""
Created on Sun May  7 18:38:44 2023

@author: carlo
"""

import pandas as pd
import numpy as np

# import mysql.connector

# mydb = mysql.connector.connect(
#   host='127.0.0.1',
#   user="root",
#   password="",
#   database="pruebapython"
# )

# mycursor = mydb.cursor()

# sql = "INSERT INTO tabla1 (codigo, nombre, precio, existencia, flag_enviar, correos) VALUES (%s, %s, %s, %s, %s, %s)"
# val = ("13124", "Juan M. Miguel", "14.5", "7", "1","tlcrar23@gmail.com")
# mycursor.execute(sql, val)

# mydb.commit()

# print(mycursor.rowcount, "record inserted.")


import os

file_list = os.listdir("C:/Users/carlo/OneDrive/WebScrapping/Databases")

lista_bases=sorted(file_list,  key=None, reverse=True)

frame = pd.read_html("C:/Users/carlo/OneDrive/WebScrapping/Databases/" + lista_bases[0])

frame2=frame[0]

frame2[['Anio', 'Marca', 'Modelo']] = frame2.Anio_marca_modelo.str.split(pat=None, n=2, expand = True)

frame3 = frame2[['Numero_lote','Anio_marca_modelo','Danio','Locacion', 'Oferta', 'PrecioYa','PaginaOrigen']]



from sqlalchemy import create_engine
my_conn = create_engine("mysql+mysqlconnector://root:@localhost/pruebapython")

frame3.to_sql(con=my_conn, name='tabla2', if_exists='replace',index=False)