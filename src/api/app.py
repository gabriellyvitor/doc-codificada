# Serviço Flask/FastAPI para simulação da API

from flask import Flask, jsonify
import random
import time

app = Flask(__name__)

# Simulação de banco de dados em memória
dados_ganhos = {
    "123": {"id": 123, "ganhos": 150.75, "pedidos": 10},
    "456": {"id": 456, "ganhos": 200.50, "pedidos": 15}
}

# 📌 DN1 - Endpoint para verificar disponibilidade do sistema
@app.route("/status", methods=["GET"])
def status():
    # Simulação de falha ocasional para testes
    if random.random() < 0.005:  # Simula falha 0.5% das vezes
        return jsonify({"status": "indisponível"}), 500
    return jsonify({"status": "operacional"}), 200

# 📌 DN2 - Endpoint para buscar ganhos do entregador
@app.route("/ganhos/<user_id>", methods=["GET"])
def get_ganhos(user_id):
    user_data = dados_ganhos.get(user_id)
    if user_data:
        return jsonify(user_data), 200
    return jsonify({"erro": "Usuário não encontrado"}), 404

# 📌 DN2 - Endpoint para verificar dados diretamente no banco de dados (simulação)
@app.route("/ganhos_db/<user_id>", methods=["GET"])
def get_ganhos_db(user_id):
    user_data = dados_ganhos.get(user_id)
    if user_data:
        return jsonify(user_data), 200
    return jsonify({"erro": "Usuário não encontrado"}), 404

# Executa a API Flask
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
