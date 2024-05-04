# Known bugs

A NBR 14724:2011 exige que *títulos que ocupem mais de uma linha devem ser, a partir da segunda linha, alinhados abaixo da primeira letra da primeira palavra do título*. Não há uma forma de implementar isso usando a classe memoir para os títulos dos capítulos, embora esse problema não seja aparente com os títulos padrão do modelo.

Apesar dos melhores esforços, e tendo investido um considerável tempo para retificação, entre minha "solução" do *bug* no Sumário (onde o Anexo é chamado de Apêndice) e o lançamento da versão 1.0.0, o *bug* ressurgiu na cópia final.

No melhor das minhas investigações, acredito ser um *bug* na própria implementação da classe memoir. Já estou trabalhando em uma solução.
