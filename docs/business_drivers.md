# Direcionadores de Negócio

# **📌 Documentação Detalhada dos Business Drivers - DN1 e DN2**  

## **1️⃣ Introdução**  
Os **business drivers** representam os fatores críticos de sucesso que direcionam as decisões técnicas e estratégicas do projeto **Rappi Entregadores**. Nesta documentação, detalhamos dois business drivers fundamentais para a operação do aplicativo:  

- **DN1 - Disponibilidade do Sistema**  
- **DN2 - Precisão das Informações Exibidas para Entregadores**  

A implementação e monitoramento desses direcionadores garantem que o sistema seja confiável e eficiente, minimizando impactos negativos na experiência dos entregadores.  

---

## **2️⃣ DN1 - Disponibilidade do Sistema**  

### **📍 Descrição**  
A disponibilidade do sistema é essencial para garantir que os entregadores possam acessar o aplicativo, aceitar pedidos e visualizar informações sem interrupções. Falhas na infraestrutura ou nos microsserviços podem prejudicar a operação, resultando em **perda de entregas, queda na confiabilidade e insatisfação dos usuários**.  

### **📍 Requisitos**  
✅ Garantir **alta disponibilidade do sistema**, minimizando indisponibilidades que afetem os entregadores.  
✅ Criar **mecanismos de monitoramento automático**, identificando falhas e disparando alertas rapidamente.  
✅ Implementar **estratégias de recuperação**, garantindo a continuidade da operação.  

### **📍 Métrica de Qualidade**  
📊 **Disponibilidade da plataforma ≥ 99,95% do tempo.**  
Isso significa que, em um mês de 30 dias, o sistema pode ficar indisponível por **no máximo 21 minutos**.  

### **📍 Estratégia de Monitoramento**  
🔍 **Alertas Automáticos** para detectar indisponibilidades superiores a **5 minutos**.  
📋 **Registro de incidentes** com logs detalhados sobre falhas no sistema.  
📡 **Mecanismo de Failover** para garantir continuidade do serviço em caso de falhas críticas.  

### **📍 Solução Técnica**  
✔ Implementação de um **Sistema de Monitoramento (Prometheus/Grafana)** para rastrear tempo de resposta e disponibilidade.  
✔ **Testes de carga** para avaliar como o sistema se comporta sob alto tráfego.  
✔ **Deploy escalável** com **balanceamento de carga** para reduzir impacto de falhas em servidores individuais.  
✔ **API Health Check**: Endpoint específico para verificar se os serviços estão operacionais.  

---

## **3️⃣ DN2 - Precisão das Informações Exibidas**  

### **📍 Descrição**  
A precisão das informações exibidas no aplicativo é crucial para a transparência da relação entre a **Rappi** e os **entregadores**. Informações incorretas sobre **valores de ganhos, pedidos e repasses** podem gerar **conflitos, reclamações e perda de confiança**.  

### **📍 Requisitos**  
✅ Evitar a apresentação de **informações erradas sobre ganhos e pedidos**.  
✅ Implementar **mecanismos de validação automática**, garantindo que os dados exibidos são consistentes com o banco de dados.  
✅ Criar **testes automatizados** para evitar erros na exibição de informações críticas.  

### **📍 Métrica de Qualidade**  
📊 **99,95% das consultas de ganhos devem apresentar informações precisas e atualizadas.**  
Isso significa que, para cada **10.000 consultas**, no máximo **5 podem conter informações incorretas**.  

### **📍 Estratégia de Monitoramento**  
📝 **Logs de inconsistências** para registrar qualquer divergência nos dados exibidos.  
🔍 **Testes automatizados de exibição de dados**, garantindo que a informação processada pela API seja a mesma que aparece para o entregador.  
⚠ **Alertas de inconsistência** para detectar divergências entre o banco de dados e os valores exibidos no aplicativo.  

### **📍 Solução Técnica**  
✔ Implementação de um **Módulo de Validação de Dados** que compara as informações exibidas no app com os registros do banco de dados.  
✔ **Testes automatizados com Behave**, simulando múltiplos cenários para garantir que os ganhos e pedidos são exibidos corretamente.  
✔ **Endpoint de Auditoria**, permitindo verificações manuais quando necessário.  
✔ **Versionamento de dados e logs de alteração**, garantindo rastreabilidade das informações.  

---

## **4️⃣ Resumo das Soluções Técnicas**  

| Business Driver | Solução Técnica Implementada |
|---------------|--------------------------------|
| **DN1 - Disponibilidade do Sistema** | Sistema de monitoramento com Prometheus/Grafana, Health Checks, Failover e Balanceamento de Carga. |
| **DN2 - Precisão das Informações Exibidas** | Módulo de Validação de Dados, Logs de inconsistência, Testes automatizados e Auditoria de dados. |

Essas implementações garantem um sistema **confiável, transparente e altamente disponível** para os entregadores da Rappi. 🚀