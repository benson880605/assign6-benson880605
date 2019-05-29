class Cabbage extends Item{
	// Requirement #1: Complete Cabbage Class

  void display() {
    image(cabbage,x,y); 
  }
  
  void checkCollision(Player player){
    if( isHit( x , y , w , h , player.x , player.y , player.w , player.h ) && player.health < player.PLAYER_MAX_HEALTH ){
      player.health++;
      isAlive = false;
    }
    }
  
  Cabbage( float x, float y ){
    super(x , y);
  }
  
}
