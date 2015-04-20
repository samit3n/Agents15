!searchGold.



+!searchGold: moves_left(0) <- !searchGold.
+!searchGold: gold(X,Y) <- .print("Vidim zlato na pozici x: ",X," y: ",Y); !move(X,Y); !action(pick); !go_home; !action(drop); !searchGold.
+!searchGold: pos(XX,YY) & YY==(0) & moveUp <- 
  do(right);
  -moveUp; 
  !searchGold.
  
+!searchGold: grid_size(X,Y) & pos(XX,YY) & YY==(Y-1) & not moveUp <-
  do(right);
  +moveUp; 
  !searchGold.
  
+!searchGold: pos(X ,Y) & moveUp <-
  .print("Nevidim zlato bloudim dal, pozice : ",X," y:", Y);
  do(up);
  !searchGold.
  
+!searchGold: pos(X ,Y) & grid_size(XX,YY) <-
  .print("Nevidim zlato bloudim dal, pozice : ",X," y:", Y);
  .print("Grid Size : ",XX," y:", YY);
  do(down);
  !searchGold.
  
+!go_home: depot(X,Y) <- !move(X,Y).

+!move(X,Y): moves_left(0) <- !move(X,Y).
+!move(X,Y): pos(XX,YY)& Y-YY < 0 <- do(up); !move(X,Y).
+!move(X,Y): pos(XX,YY)& Y-YY > 0 <- do(down); !move(X,Y).
+!move(X,Y): pos(XX,YY)& Y-YY == 0 & X-XX < 0 <- do(left); !move(X,Y).
+!move(X,Y): pos(XX,YY)& Y-YY == 0  & X-XX > 0 <- do(right); !move(X,Y).
+!move(X,Y): pos(XX,YY)& Y-YY == 0  & X-XX == 0.
+!move(X,Y): true <- .print("chci sebrat zlatou cihlu").

+!action(X): moves_left(0) <- !action(X).
+!action(X): moves_left(Z) & Z < 3 <- do(skip); !action(X).
+!action(X): true <- do(X).
  
