# Estratégia de Testes

A estratégia de testes garante que os requisitos de disponibilidade e precisão sejam validados.

📌 Estratégia para DN1 (Disponibilidade do Sistema)
✅ Testes principais:

Testar comportamento do sistema em alta carga.
Simular falhas na API e verificar tempo de recuperação.
Monitorar tempo médio de resposta.
📌 Massa de Testes:

10.000 requisições simultâneas nos endpoints críticos.
100 falhas simuladas na API para validar tempo de recuperação.
📌 Estratégia para DN2 (Precisão das Informações Exibidas)
✅ Testes principais:

Comparação automática entre valores exibidos e dados armazenados no banco.
Validação automatizada da interface do usuário.
📌 Massa de Testes:

500 consultas de ganhos verificadas automaticamente.
50 cenários de inconsistência forçada para avaliar detecção de erros.