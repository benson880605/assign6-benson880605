class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class
  float currentSpeed = 1f ;
  float TRIGGERED_SPEED_MULTIPLIER = 5;
  
  Dinosaur(float x, float y){
  super(x,y);
  }
  
  void display(){
    pushMatrix();
      translate(x, y);
      if (currentSpeed > 0 ) {
        scale(1, 1);
        image(dinosaur, 0, 0, w, h); 
      } else {
        scale(-1, 1);
        image(dinosaur, -w, 0, w, h); 
      }
    popMatrix();
     
  }
  
  void update(){
    x += currentSpeed ;
    
    if( x+SOIL_SIZE >= width || x <= 0){
      currentSpeed *= -1;
      TRIGGERED_SPEED_MULTIPLIER *= -1;
    }
    
    if( y == player.y && currentSpeed > 0 && x < player.x || y == player.y && currentSpeed < 0 && x > player.x){
        x += TRIGGERED_SPEED_MULTIPLIER;
    }else{
      x += currentSpeed ;
    }
  }
}
