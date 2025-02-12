# Steps do Behave para DN1

from behave import given, when, then
import requests
import time

API_URL = "https://api.rappi.com/entregadores"

@given("o sistema está em operação")
def step_impl(context):
    context.start_time = time.time()

@when("um grande volume de requisições simultâneas é enviado")
def step_impl(context):
    context.responses = []
    for _ in range(10000):  # Simulação de alta carga
        try:
            response = requests.get(f"{API_URL}/status", timeout=5)
            context.responses.append(response.status_code)
        except requests.exceptions.RequestException:
            context.responses.append(500)  # Simulação de falha

@then("a disponibilidade deve ser de pelo menos 99.95%")
def step_impl(context):
    success_rate = (context.responses.count(200) / len(context.responses)) * 100
    assert success_rate >= 99.95, f"Disponibilidade abaixo do esperado: {success_rate}%"
