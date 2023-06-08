[top]
components : plano lluvia@generator
link : out@lluvia input@plano

[lluvia]
distribution : constant
value : 2
initial : 1
increment : 0

[plano]
type : cell
dim : (25,25)
delay : transport
defaultDelayTime : 1000
border : nonwrapped
neighbors : plano(-1,-1) plano(-1,0) plano(-1,1)
neighbors : plano(0,-1)  plano(0,0)  plano(0,1)
neighbors : plano(1,-1)  plano(1,0)  plano(1,1)
initialValue : 0
in : input
link : input in@plano(10,10)
localtransition : reglas 
portInTransition : in@plano(10,10) poner-agua

[reglas]
rule : { (0,0) -
         if( ((-1,0) != ?) and ((-1,0)>= 0), 
             ((0,0) - (-1,0)) / 9, 
             0
           ) -
         if( ((-1,1) != ?) and ((-1,1)>= 0), 
             ((0,0) - (-1,1)) / 9, 
             0
           ) -
         if( ((0,1) != ?) and ((0,1)>= 0), 
             ((0,0) - (0,1)) / 9, 
             0
           ) -
         if( ((1,1) != ?) and ((1,1)>= 0), 
             ((0,0) - (1,1)) / 9, 
             0
           ) -
         if( ((1,0) != ?) and ((1,0)>= 0), 
             ((0,0) - (1,0)) / 9, 
             0
           ) -
         if( ((1,-1) != ?) and ((1,-1)>= 0), 
             ((0,0) - (1,-1)) / 9, 
             0
           ) -
         if( ((0,-1) != ?) and ((0,-1)>= 0), 
             ((0,0) - (0,-1)) / 9, 
             0
           ) -
         if( ((-1,-1) != ?) and ((-1,-1)>= 0), 
             ((0,0) - (-1,-1)) / 9, 
             0
           )            
       } 1000 { (0,0) >= 0 }
rule : { (0,0) } 1000 { t }

[poner-agua]
rule : {(0,0) + 1} 0 { t }
