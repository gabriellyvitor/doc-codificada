workspace {
    
    model {
        # 🎯 Usuários
        entregador = person "Entregador" "Usuário que realiza entregas pela plataforma Rappi e consulta ganhos e pedidos."
        suporte = person "Equipe de Suporte" "Equipe que auxilia os entregadores e monitora falhas."

        # 🎯 Sistema principal
        rappi_entregadores = softwareSystem "RappiEntregadores" "Aplicativo móvel utilizado pelos entregadores para gerenciar entregas e visualizar informações." {
            
            # 🏗️ Containers principais
            container_app = container "Aplicativo Rappi Entregadores" "Interface móvel utilizada pelos entregadores." "Flutter"
            container_api = container "API Backend" "Processa requisições do aplicativo e gerencia dados de pedidos e ganhos." "Flask/FastAPI"
            container_db = container "Banco de Dados" "Armazena pedidos, pagamentos e informações dos entregadores." "PostgreSQL"
            
            # 🔍 Monitoramento (DN1)
            container_monitoramento = container "Sistema de Monitoramento" "Monitora a disponibilidade do sistema e gera alertas automáticos." "Prometheus + Grafana"
            container_logs = container "Sistema de Logs" "Armazena logs de eventos e acessos ao sistema." "ElasticSearch + Kibana"
            
            # 📊 Validação e Precisão (DN2)
            container_validacao = container "Módulo de Validação de Dados" "Garante que as informações exibidas no app estão corretas." "Python + Logs"
            container_recon = container "Sistema de Reconciliação" "Compara ganhos processados e ganhos exibidos para detectar erros." "Airflow + Pandas"
            
            # 💰 Integração com Pagamentos
            container_pagamentos = container "Gateway de Pagamento" "Processa os pagamentos dos entregadores." "Stripe/PayPal API"

            # 📩 Notificações e Comunicação
            container_notificacoes = container "Sistema de Notificações" "Envia alertas para os entregadores via push/SMS." "Firebase Cloud Messaging"
            
            # 🔒 Segurança e Autenticação
            container_auth = container "Serviço de Autenticação" "Gerencia autenticação e permissões dos entregadores." "OAuth2 + JWT"
        }

        # 🔗 Relacionamentos (Fluxo de dados)
        entregador -> container_app "Utiliza para aceitar pedidos e visualizar ganhos"
        container_app -> container_api "Solicita dados e operações"
        container_api -> container_db "Consulta e atualiza informações de pedidos e ganhos"
        container_api -> container_monitoramento "Envia métricas de disponibilidade e erros (DN1)"
        container_api -> container_logs "Armazena logs de operações"
        container_api -> container_validacao "Valida dados antes de exibir no app (DN2)"
        container_validacao -> container_recon "Compara valores processados e exibidos"
        container_api -> container_pagamentos "Processa pagamentos para os entregadores"
        container_api -> container_notificacoes "Envia notificações de novos pedidos e pagamentos"
        container_app -> container_auth "Autentica entregador na plataforma"
        
        suporte -> container_monitoramento "Monitora falhas e indisponibilidade (DN1)"
        suporte -> container_logs "Analisa logs de problemas no sistema"
    }
    
    views {
        systemContext rappi_entregadores {
            include *  
            autolayout lr
        }
        
        container rappi_entregadores {
            include *
            autolayout lr
        }
    }
}
