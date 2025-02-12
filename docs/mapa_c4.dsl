workspace {
    model {
        user = person "Entregador" "Usuário que realiza entregas pela plataforma Rappi e consulta ganhos e pedidos."

        rappi_system = softwareSystem "RappiEntregadores" "Aplicativo móvel utilizado pelos entregadores para gerenciar entregas e visualizar informações." {
            container_app = container "Aplicativo Rappi Entregadores" "Interface móvel utilizada pelos entregadores." "Flutter"
            container_api = container "API Backend" "Processa requisições do aplicativo e gerencia dados de pedidos e ganhos." "Spring Boot"
            container_db = container "Banco de Dados" "Armazena pedidos, pagamentos e informações dos entregadores." "PostgreSQL"
            container_monitoramento = container "Sistema de Monitoramento" "Monitora a disponibilidade do sistema e gera alertas para DN1." "Prometheus"
            container_validacao = container "Módulo de Validação de Dados" "Garante que as informações exibidas no app estão corretas (DN2)." "Python"

            container_app -> container_api "Solicita dados e operações"
            container_api -> container_db "Consulta e atualiza informações de pedidos e ganhos"
            container_api -> container_monitoramento "Reporta disponibilidade e erros críticos (DN1)"
            container_api -> container_validacao "Envia dados para verificação antes de exibir no app (DN2)"
        }

        user -> container_app "Utiliza para aceitar pedidos e visualizar ganhos"
    }
    
    views {
        systemContext rappi_system {
            include *  
            autolayout lr
        }
        
        container rappi_system {
            include *
            autolayout lr
        }
    }
}
