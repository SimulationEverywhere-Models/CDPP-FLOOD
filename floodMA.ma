[top]
components : plane

[plane]
type : cell
dim : (25,25)
delay : transport
defaultDelayTime : 1000
border : nonwrapped
neighbors : plane(-1,-1) plane(-1,0) plane(-1,1)
neighbors : plane(0,-1)  plane(0,0)  plane(0,1)
neighbors : plane(1,-1)  plane(1,0)  plane(1,1)

initialValue : 0
initialCellsValue : flood.val
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
