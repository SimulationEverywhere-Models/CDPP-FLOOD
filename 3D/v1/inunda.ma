#include(inunda.inc)

[top]
components : inunda lluvia@generator
link : out@lluvia input@inunda

[lluvia]
distribution : constant
value : 2
initial : 1
increment : 0

[inunda]
type : cell
dim : (5,10,10)
delay : transport
defaultDelayTime : 1000
border : nonwrapped
neighbors :                 inunda(-1,0,0)
neighbors : inunda(0,-1,-1) inunda(0,-1,0) inunda(0,-1,1)
neighbors : inunda(0,0,-1)  inunda(0,0,0)  inunda(0,0,1)
neighbors : inunda(0,1,-1)  inunda(0,1,0)  inunda(0,1,1)
neighbors : inunda(1,-1,-1) inunda(1,-1,0) inunda(1,-1,1)
neighbors : inunda(1,0,-1)  inunda(1,0,0)  inunda(1,0,1)
neighbors : inunda(1,1,-1)  inunda(1,1,0)  inunda(1,1,1)
initialValue : 0
initialCellsValue : inunda.val
in : input
link : input in@inunda(0,0,0)
localtransition : reglas 
portInTransition : in@inunda(0,0,0) poner-agua
zone : reglas_inf { (4,0,0)..(4,9,9) }
zone : cielo { (0,0,0)..(0,9,9) }

[reglas]
rule : { min((-1,0,0),(4 - (0,0,0))) + 
         if( (-1,0,0) > 4,
             (-1,0,0) - 4,
             0
         ) +
         (0,0,0) - 
         if( (1,0,0)>=0,
             min((0,0,0),(4 - (1,0,0))),
             0
           ) -
         if( ((0,-1,0) != ?) and ((0,-1,0)>= 0), 
             ( #macro(SobraAguaMia) - #macro(SobraAguaN)) / 9, 
             0
           ) -
         if( ((0,-1,-1) != ?) and ((0,-1,-1)>= 0), 
             ( #macro(SobraAguaMia) - #macro(SobraAguaNE)) / 9, 
             0
           ) -           
         if( ((0,0,1) != ?) and ((0,0,1)>= 0), 
             ( #macro(SobraAguaMia) - #macro(SobraAguaE)) / 9, 
             0
           ) -           
         if( ((0,1,1) != ?) and ((0,1,1)>= 0), 
             ( #macro(SobraAguaMia) - #macro(SobraAguaSE)) / 9,
             0
           ) -
         if( ((0,1,0) != ?) and ((0,1,0)>= 0), 
             ( #macro(SobraAguaMia) - #macro(SobraAguaS)) / 9,
             0
           ) -           
         if( ((0,1,-1) != ?) and ((0,1,-1)>= 0), 
             ( #macro(SobraAguaMia) - #macro(SobraAguaSO)) / 9,
             0
           ) -
         if( ((0,0,-1) != ?) and ((0,0,-1)>= 0), 
             ( #macro(SobraAguaMia) - #macro(SobraAguaO)) / 9,
             0
           ) - 
         if( ((0,-1,-1) != ?) and ((0,-1,-1)>= 0), 
             ( #macro(SobraAguaMia) - #macro(SobraAguaNO)) / 9,
             0
           )
       } 1000 { (0,0,0) < 4 and (0,0,0) >= 0}
rule : { 4 } 1000 { (0,0,0) > 4 }
rule : {(0,0,0)} 1000 {t}

[reglas_inf]
rule : { min((-1,0,0), (4 - (0,0,0))) + 
         (0,0,0) -
         if( ((0,-1,0) != ?) and ((0,-1,0)>= 0), 
             ((0,0,0) - (0,-1,0)) / 9, 
             0
           ) -
         if( ((0,-1,1) != ?) and ((0,-1,1)>= 0), 
             ((0,0,0) - (0,-1,1)) / 9, 
             0
           ) -
         if( ((0,0,1) != ?) and ((0,0,1)>= 0), 
             ((0,0,0) - (0,0,1)) / 9, 
             0
           ) -
         if( ((0,1,1) != ?) and ((0,1,1)>= 0), 
             ((0,0,0) - (0,1,1)) / 9, 
             0
           ) -
         if( ((0,1,0) != ?) and ((0,1,0)>= 0), 
             ((0,0,0) - (0,1,0)) / 9, 
             0
           ) -
         if( ((0,1,-1) != ?) and ((0,1,-1)>= 0), 
             ((0,0,0) - (0,1,-1)) / 9, 
             0
           ) -
         if( ((0,0,-1) != ?) and ((0,0,-1)>= 0), 
             ((0,0,0) - (0,0,-1)) / 9, 
             0
           ) -
         if( ((0,-1,-1) != ?) and ((0,-1,-1)>= 0), 
             ((0,0,0) - (0,-1,-1)) / 9, 
             0
           )            
       } 1000 { (0,0,0) >= 0 and (0,0,0) < 4 }
rule : { 4 } 1000 { (0,0,0) > 4 }       
rule : {(0,0,0)} 1000 {t}

[cielo]
%rule : 1 1000 { (0,0,0) = 0 }
%rule : 0 1000 { (0,0,0) = 1 }
rule : {(0,0,0)} 1000 {t}

[poner-agua]
rule : {(0,0,0) + 1} 0 { t }
