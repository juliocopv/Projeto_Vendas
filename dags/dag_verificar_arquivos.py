
from airflow.decorators import dag, task
from datetime import datetime
import os


@dag(
    dag_id="dag_verificar_arquivos",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False
)

def verificar_arquivos():

    @task
    def verificar_pastas():

        caminhos = [
            "/usr/local/airflow/src",
            "/usr/local/airflow/dbt_ecommerce",
            "/usr/local/airflow/data"
        ]

        for caminho in caminhos:

            if os.path.exists(caminho):
                print(f"ENCONTRADO: {caminho}")
                print(os.listdir(caminho))
            else:
                print(f"NAO ENCONTRADO: {caminho}")

    verificar_pastas()


verificar_arquivos()
