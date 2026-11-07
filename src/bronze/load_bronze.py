import os

import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()


class carrega_bronze:
    def __init__(self):
        usuario = os.getenv("db_usuario")
        senha = os.getenv("db_senha")
        host = os.getenv("db_host")
        porta = os.getenv("db_porta")
        nome = os.getenv("db_nome")

        self.engine = create_engine(
            f"postgresql+psycopg2://{usuario}:{senha}@{host}:{porta}/{nome}"
        )

    def carregar(self, arquivo, tabela):
        df = pd.read_csv(arquivo)
        df.to_sql(
            tabela,
            self.engine,
            schema="bronze",
            if_exists="replace",
            index=False,
        )
        print(f"{arquivo} carregado em bronze.{tabela}")


## Carregando os arquivos
carregador = carrega_bronze()

carregador.carregar("data/orders.csv", "orders")
carregador.carregar("data/customers.csv", "customers")
carregador.carregar("data/products.csv", "products")
carregador.carregar("data/order_items.csv", "order_items")
carregador.carregar("data/order_payments.csv", "order_payments")
carregador.carregar("data/order_reviews.csv", "order_reviews")
carregador.carregar("data/sellers.csv", "sellers")
carregador.carregar("data/product_category_name_translation.csv", "product_category_name_translation")
carregador.carregar("data/geolocation.csv", "geolocation")