!searchGold.
//!printPos.

+!printPos: pos(X,Y) <- .println("Moje pozice x:",X," y:",Y).
+!searchGold: moves_left(0) <- !searchGold.
+!searchGold: gold(X,Y) <- .print("Vidim zlato na pozici x: ",X," y: ",Y); do(skip); !searchGold.
+!searchGold: pos(X ,Y) <-
  .print("Nevidim zlato bloudim dal, pozice : ",X," y:", Y);
  do(down);
  !searchGold.
  
  
