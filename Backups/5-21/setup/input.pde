void keyTyped() {
  if(gameRunning == true){
    if (key == 'w' || key == 'W') {
      up = true;
      playerMovement = 1;
    }
    if (key == 'a' || key == 'A') {
      left = true;
      playerMovement = 2;
    }
    if (key == 's' || key == 'S') {
      dn = true;
      playerMovement = 3;
    }
    if (key == 'd' || key == 'D') {
      right = true;
      playerMovement = 4;
    }
    if (key == 'e' || key == 'E'){
      playerMovement = 0;
    }
  }
  if(gameRunning == false){
    if(key == 'w'|| key == 'W'){
      if(startScreenSelectorYPos>300){
        startScreenSelectorYPos-=20;
      }else{
        startScreenSelectorYPos=340;
      }
    }
    if(key == 's' || key == 'S'){
      if(startScreenSelectorYPos<340){
        startScreenSelectorYPos+=20;
      }else{
        startScreenSelectorYPos=300;
      }
    }
    if((key == ENTER || key == RETURN) && startScreenSelectorYPos == 300){
      gameRunning = true;
      playerAlive = true;
    }
    if((key == ENTER || key == RETURN) && startScreenSelectorYPos == 340){
      exit();
    }
    if((key == ENTER || key == RETURN) && startScreenSelectorYPos == 320){
      showSaves = true;
    }
    if((key == ENTER || key == RETURN) && showSaves == true){
      if(startScreenSelectorYPos == 580){
        showSaves = false;
        startScreenSelectorYPos = 300;
      }
    }
  }
  if(gameRunning == true && playerAlive == false &&(key == ENTER || key == RETURN)){
    player.tempX = player.xPos;
    player.tempY = player.yPos;
    player.xPos = 384;
    player.yPos = 284;
    player.follow();
    playerAlive = true;
    player.hp = 80;
    if(player.lvl>1){
      player.lvl-=1;
      player.xp=0;
    }
  }
}//end of keyPressed

void keyReleased() {

  if (key == 'w' || key == 'W') {
    up = false;
    playerMovement = 0;
  }
  if (key == 'a' || key == 'A') {
    left = false;
    playerMovement = 0;
  }
  if (key == 's' || key == 'S') {
    dn = false;
    playerMovement = 0;
  }
  if (key == 'd' || key == 'D') {
    right = false;
    playerMovement = 0;
  }
  if (key == 'e' || key == 'E'){
    playerMovement = 0;
  }
  if (key == 'i' || key == 'I'){
    gui.isInvOpen ^= true;
  }
  if (key == 'r' || key == 'R'){
    playerMovement = 0;
    HPPotion();
  }
  if (key == 'j' || key == 'J'){
    if(player.speed <3){
      player.speed += 5;
    }
    else{
      player.speed = 1;
    }
  }
  /*if (key == 'q' || key == 'Q'){ //change weapon
    if(player.activeWeapon == "Axe"){
        player.activeWeapon = "Sword";
    }
    if(player.activeWeapon == "Sword"){
        player.activeWeapon = "Axe";
    }
        
  }*/
  if (key == 'h' || key == 'H'){
    gameRunning = false;
  }
}

void mousePressed() {
  if(mouseButton == LEFT){
  for (int i = 0; i < goblin.length; i++) {
    if (  player.xPos > goblin[i].xPos - player.sizeX - player.range
       && player.xPos < goblin[i].xPos + goblin[i].size + player.range
       && player.yPos > goblin[i].yPos - player.range - player.sizeY
       && player.yPos < goblin[i].yPos + goblin[i].size + player.range
       && timer - player.autoTimer > 200
      ) {
      goblin[i].HP -= player.damage;
      player.autoTimer = timer;
    }
  }
  }
  for (int i = 0; i < ogre.length; i++) {
    if (  player.xPos > ogre[i].xPos - player.sizeX - player.range
       && player.xPos < ogre[i].xPos + ogre[i].size + player.range
       && player.yPos > ogre[i].yPos - player.range - player.sizeY
       && player.yPos < ogre[i].yPos + ogre[i].size + player.range
       && timer - player.autoTimer > 200
      ) {
      ogre[i].HP -= player.damage;
      player.autoTimer = timer;
    }
  }
}//end mousePressed

