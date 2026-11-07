
import psycopg2

conexao = psycopg2.connect(
    host='localhost',
    database='dw_ecommerce',
    user='postgres',
    password='julio',
    port=5432,
    
)

print('Conexao realizada com sucesso')