[top]
components : plano

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
initialCellsValue : plano.val
localtransition : reglas 

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
