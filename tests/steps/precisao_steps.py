# Steps do Behave para DN2

from behave import given, when, then
import requests

API_URL = "https://api.rappi.com/entregadores"

@given("o entregador acessa a tela de ganhos")
def step_impl(context):
    context.response = requests.get(f"{API_URL}/ganhos?user_id=123")

@when("as informações são exibidas")
def step_impl(context):
    context.dados_tela = context.response.json()

@then("os valores devem ser idênticos ao banco de dados")
def step_impl(context):
    db_response = requests.get(f"{API_URL}/ganhos_db?user_id=123")
    dados_db = db_response.json()
    assert context.dados_tela == dados_db, f"Discrepância detectada: {context.dados_tela} vs {dados_db}"
