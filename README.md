# HashList

Existem vários casos onde surge a necessidade de termos uma lista hash de algum atributo primitivo, e através dessa lista hash fazermos uso do Contains para verificar se determinado valor consta na lista.

O problema que nos deparamos utilizando uma TList<TIPO> para esse tipo de situação, é que o contains é muito mal otimizado.
Para obtermos um melhor desempenho e solucionar nosso problema, é necessário implementarmos algum dicionário onde a KEY é o tipo primitivo. Mas daí surge outro problema que seria a necessidade de ficarmos definido um valor para o dicionário que nem vai ser utilizado.

Diante disso, surgiu a ideia de criar essa classe para facilitar o nosso dia a dia, onde é apenas preciso declarar a classe e seu tipo.
Ganhos:
- Facilidade de implementação da mesma forma que a TList<Tipo>.
- Desempenho do constains que o dicionário nos proporciona.
