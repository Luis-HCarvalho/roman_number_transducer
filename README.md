## Transdutor
T = { Q, Σ, Δ, δ, q, F }

* Q --> Estados
* Σ --> Alfabeto de entrada
* Δ --> Alfabeto de saída
* δ --> Regras de transição
* q --> Estado inicial
* F --> Estados de aceitação

Este transdutor tem como objetivo converter valores representados em números 
romanos para números indo-arábicos. Para isso, a emissão de símbolos segue uma 
abordagem inspirada no funcionamento de uma máquina de Mealy, conforme 
ilustrado no diagrama de estados (mermaid) disponível em 
`docs/transducer_graph.md`. Dito isso, a geração dos valores de saída considera tanto
o estado do sistema quanto o símbolo de entrada processado.

PS.: O transdutor suporta numeros até 3999

### Etados
Q = { qX, q0, q1, q2, q3, q4, q5, q6, q7, q8, q9,
      q00, q10, q20, q30, q40, q50, q60, q70, q80, q90,
      q000, q100, q200, q300, q400, q500, q600, q700, q800, q900,
      q0000, q1000, q2000, q3000 
    }

### Alfabeto
* Entrada: Σ = { I, V, X, L, C, D, M }
* Saída: Δ = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }

### Regras de transição
`docs/transducer_graph.md`

### Estado Inicial
qX ou `[*] -->` no diagrama em `docs/transducer_graph.md`

### Estados de aceitação
F = { q1, q2, q3, q4, q5, q6, q7, q8, q9,
        q10, q20, q30, q40, q50, q60, q70, q80, q90,
        q100, q200, q300, q400, q500, q600, q700, q800, q900,
        q1000, q2000, q3000 
    }
