/**
 * Class Asteroid to draw and move asteroids
 */
 
class Asteroid
{
    float   x;
    float   y;
    float   xv;
    float   yv;
    PImage  asteroid; 
  
    /**
     * Initial asteroid parameters
     */
    Asteroid()
    {
        x  = 1100;
        y  = random(100, 668);
        xv = random(-24, -16);
        yv = random(-4, 4);
        asteroid = loadImage ("__asteroid.png");
    }
    
    void Draw()
    {
        image (asteroid, x, y);
        Move();
    }
    
    void Move()
    {
        /**
         * apply velocity to position 
         */
        x += xv;
        y += yv; 
        
        /**  
         * if asteroid x position is past player, reset x position
         * and give new velocity parameters
         */
        if (x < -32)
        {
            x  = 1100;
            y  = random(100, 668);
            xv = random(-30, -18);
            yv = random(-6, 6);
        }
        
        /**  
         * if asteroid y position is off-screen, reset y position to opposite edge
         */
        if (y < -30)
            y = 748;
        if (y > 748)
            y = -30;
    }
}
