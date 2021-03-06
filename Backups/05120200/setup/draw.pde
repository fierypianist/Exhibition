 void draw(){ //gets called each frame
 
 //--OPENING SCREEN--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 if(gameRunning == false){
   background(255);
   if(keyPressed == true && key == ' '){
     gameRunning = true;
     playerAlive = true;
   }
 }
 //--IN GAME*********************************************************************************************************************************************************************************************
 if(gameRunning == true){
   if(playerAlive == true){
      background(0); //resets the background EACH FRAME
      //CREATE WALLS
      spawn.wallsAroundTiles();
      room1.wallsAroundTiles();
      room2.wallsAroundTiles();
      //END CREATE WALLS

      player.move(); //moves the player
      
      //WALL COLLISION
      for(int i=0;i<wall1V.length;i++){
         wall1V[i].hit();
      }
      for(int i=0;i<wall1H.length;i++){
        wall1H[i].hit();
      }
      //END WALL COLLISION
      
      //--PUT ANY PLAYER COLLISION BEFORE THIS LINE-- (also anything you want to not be translated (GUI, etc))
      player.follow(); //camera follow
      
      playerHitBox.setPos(); //sets the position of the hitbox to the player 
      
      //DRAW TILES
      spawn.display();
      room1.display();
      room2.display();
      //END DRAW TILES
      
      //playerHitBox.display(); //draws the hitbox REMOVE THIS LATER
      
      //DRAW WALLS
      for(int i=0; i < (wall1V.length);i++){
        wall1V[i].build();
      }
      for(int i=0; i < (wall1H.length);i++){
        wall1H[i].build();
      }

      //ALL GOBLIN COMMANDS WHILE LIVING
      for (int i = 0; i < goblin.length; i++){
        if(goblin[i].living == true){
          goblin[i].patrol(goblin[i].initxPos,goblin[i].inityPos,goblin[i].initxPos+100,goblin[i].inityPos + 100); //GOBLIN PATROL
          goblin[i].autoAttack();                                                                                  //GOBLIN AUTO ATTACK
          goblin[i].gifAssign();                                                                                   //GOBLIN GIF ASSIGNd
          goblin[i].collide();                                                                                     //GOBLIN COLLIDE
          goblin[i].hpDisplay();                                                                                   //GOBLIN HP DISPLAY
        }
        //GOBLIN DEATH
        if(goblin[i].HP <= 0){
          image(goblin_deathGif, goblin[i].xPos, goblin[i].yPos);
          goblin[i].death(i);
          player.kills +=1; //adds to stats
        }
      }
     
      player.display(); 
      player.gifAssign(); //ALWAYS LAST besides lighting
      darkness1.shroud();
      lightTest.on();
      //torchTest.lit();
        //LITCHECK
      spawn.lit();
      room1.lit();
      //END LITCHECK
      player.hpDisplay();
      gui.display();
  }//end IF PLAYERALIVE == TRUE
    if(playerAlive == false){
     }//END IF PLAYERALIVE == FALSE
   }//end IF GAME RUNNING
}//end draw
