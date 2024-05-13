# Modelo  de banco de dados
## Visualização

<div align="center">
<sub>Figura 1 - Modelo banco de dados </sub>
<img src="/assets/modelo_bancodedados.png" width="100%" >
<sup>Fonte: Fernanda Correia (2024)</sup>
</div>

## Explicação

Em poucas palavras, o modelo criado para atender às expectativas do cliente sugere a existência de usuários que respondem a formulários dentro da aplicação web. 
<br></br>

Os usuários podem ser categorizados como:
1. Estudantes
2. Tutores


Sendo que cada uma dessas possibilidades abrange atributos exclusivos, mas possuem todos os da entidade usuário. Os estudantes naturalmente possuem mais informações a serem cadastradas devido a expectativa de gerar uma maior integração entre os jogadores do Cesim Business Game. Os tutores possuem a maior parte de suas informações associadas ao jogo, mas possuem um espaço para escreverem uma biografia caso desejem interagir mais com os estudantes.
<br></br>
Os estudantes estão associados a um único grupo (entidade grupo que possui mais outros 4 estudantes como atributos), caracterizado pelo universo no qual ele se encontra. Ao contrário desses, os tutores podem estar associados a mais de um grupo, e isso é marcado pela tabela intermediária tutor_grupo. 
<br></br>
Os estudantes são os usuários responsáveis pelo preenchimento dos formulários, e seus tutores são os observadores dessas respostas. Dessa forma, a entidade respostas_formularios, que recebe chaves estrangeiras de outras entidades:

1. round (que armazena informações sobre o número do round, sua data de início e fim)
2. formularios (guarda o nome do formulário e o round a qual ele está associado)
3. questoes_formularios (possui atributos relacionados ao formulário e suas perguntas)

possui uma chave primária ligada a uma tabela intermediária estudante_resposta_formularios que liga o id do estudante as seguintes informações:
1. Suas respostas em cada formulário associado a respostas_formularios
2. O universo_grupo, que determina quais jogadores do Cesim podem acessar suas respostas.
3. O id_tutor_grupo, que determina qual tutor do Cesim pode acessar suas respostas.

Da mesma forma, a entidade medidor_de_felicidade é avaliada pelo estudante e sua resposta é guardada em estudante_medidor_de_felicidade, que associa os valores, as informações do estudante, seu grupo e seu respectivo tutor.

Por último, é importante destacar a existência dos relacionamentos 1:N e N:N nas ligações entre as tabelas, por exemplo em:
- 1:N - Relacionamento de um para muitos, observada entre estudante e grupo: Um estudante possui apenas um grupo, mas um grupo está associado a diversos estudantes. Dessa dorma, a entidade estudante recebe uma chave estrangeira da entidade grupo com o atributo universo_grupo, indicando a presença em apenas um grupo.
- N:N - Relacionamento de muitos para muitos, observada entre estudantes e respostas_formularios: Um estudante pode responder diversos formulários, e da mesma forma, um formulário pode ser preenchido por diversos estudantes. Para isso, é criada uma tabela intermediária estudante_respostas_formularios, que associa o id do estudante às suas respostas de um formulário específico, identificado por id_respostas_formularios.




