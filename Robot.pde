class Robot extends Enemy {
	// Requirement #5: Complete Dinosaur Class
  
  Laser laser;
  float currentSpeed = 2f ;
  int laserTimer = 180 ;
	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;

  void display(){
    
    pushMatrix();
      translate(x, y);
      if (currentSpeed > 0 ) {
        scale(1, 1);
        image(robot, 0, 0, w, h); 
      } else {
        scale(-1, 1);
        image(robot, -w, 0, w, h); 
      }
    popMatrix();
    
    laser.display();

  }
  
  void update(){
    
    laser.update();
    laser.checkCollision(player);
    
    boolean checkY = false;
    boolean checkX = false;
    
    if( currentSpeed > 0 && x < player.x || currentSpeed < 0 && x > player.x ){
      checkX = true;
    }

    if( player.y >= y - PLAYER_DETECT_RANGE_ROW * SOIL_SIZE && player.y <= y + PLAYER_DETECT_RANGE_ROW * SOIL_SIZE){
      checkY = true ;
    }else{
      checkY = false;
    }    
  
    if( checkX && checkY ){
      
      if(laserTimer == LASER_COOLDOWN){ 
        laser.fire ( x + HAND_OFFSET_X_FORWARD , y + HAND_OFFSET_Y , player.x + SOIL_SIZE / 2 , player.y + SOIL_SIZE / 2 );
        laserTimer = 0 ;
      }
      
      if(laserTimer < LASER_COOLDOWN ){laserTimer++;}
      
      return;
      }else{
        
      x += currentSpeed ;
      if( x+SOIL_SIZE >= width || x <= 0){
      currentSpeed *= -1;
      
      }
    }
    
  }

  Robot(float x, float y){
  super(x,y);
    laser = new Laser();
  }
}
  
