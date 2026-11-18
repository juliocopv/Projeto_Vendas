
from airflow.decorators import dag, task
from airflow.providers.postgres.hooks.postgres import PostgresHook

from datetime import datetime


@dag(
    dag_id="dag_teste_postgres",
    description="Testa a conexão com PostgreSQL",
    start_date=datetime(2026, 1, 1),
    schedule=None,
    catchup=False,
    tags=["olist", "postgres"]
)

def dag_teste_postgres():

    @task
    def testar_conexao():

        postgres = PostgresHook(
            postgres_conn_id="postgres_olist"
        )

        resultado = postgres.get_first("""
            SELECT
                current_database(),
                current_user,
                version();
        """)

        print(f"Banco conectado: {resultado[0]}")
        print(f"Usuário: {resultado[1]}")
        print(f"Versão: {resultado[2]}")

    testar_conexao()


dag_teste_postgres()
