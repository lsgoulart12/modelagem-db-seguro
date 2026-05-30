# Modelagem de Banco de Dados Seguro (RBAC & Auditoria)

Este projeto foi desenvolvido de forma independente para consolidar e demonstrar conhecimentos em Engenharia de Software e Segurança da Informação, focando na estruturação e proteção de dados em repouso. Trata-se da modelagem de um banco de dados relacional que implementa controle de acessos e trilhas de auditoria.

## 🚀 Funcionalidades da Arquitetura

- **Controle de Acesso Baseado em Funções (RBAC):** Estruturação de permissões segmentadas através de tabelas relacionais de funções (`funcoes`) e usuários (`usuarios`), garantindo o princípio do menor privilégio.
- **Trilha de Auditoria de Segurança (Audit Log):** Implementação de uma tabela dedicada (`logs_auditoria`) para registrar ações críticas, mapeando o autor da ação, tabela afetada, data/hora e o IP de origem do evento.
- **Simulação de Práticas Seguras:** Estrutura pronta para o armazenamento de credenciais utilizando técnicas de hashing (criptografia de senhas).
- **Queries de Auditoria:** Inclusão de consultas SQL prontas para extração de relatórios e monitoramento de atividades suspeitas no sistema.

## 🛠️ Tecnologias Utilizadas

- **SQL / Bancos de Dados Relacionados**
- **Constraints de Integridade** (Chaves Primárias e Chaves Estrangeiras para relacionamentos seguros).
