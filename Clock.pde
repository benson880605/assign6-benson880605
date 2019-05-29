class Clock extends Item{
	// Requirement #2: Complete Clock Class
  
  void display() {
    image(clock,x,y);
  }
  
  void checkCollision(Player player){
    if( isHit( x , y , w , h , player.x , player.y , player.w , player.h ) ){
    gameTimer += CLOCK_BONUS_SECONDS*60 ;
    isAlive = false;
    }
  }
  
  Clock( float x, float y ){
    super(x , y);
  }
}
