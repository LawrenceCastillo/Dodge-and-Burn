/**
 * Title:  DodgeAndBurn.pde
 * Author: Lawrence Gabriel Castillo
 * Date:   2019-Apr-13
 * Desc:   Game: avoid asteroids in a retro-arcade style endless
 *         platformer. Use Left and Right keys to control your ship
 *         and use the Spacebar to give yourself a boost.
 * Usage:  Processing 3.5.2
 */

/**
 * stage attributes
 */
PImage  title;
PImage  background;
float   clock;
int     score;
float   bonus;
int     hi_score;
color   text_color;
String  score_text;
String  hi_score_text;
boolean game_over;

/**
 * Scene attributes
 */
PImage[] background_space = new PImage[60];
float    loop;
Asteroid a;
Asteroid b;
Asteroid c;

/**
 * player attributes 
 */
PVector pilot_location;
PVector pilot_velocity;
PImage  pilot;

void setup() 
{
    /**
     * initialize stage
     */
    size (1024, 768);
    title         = loadImage ("__title.png");
    clock         = 0;
    text_color    = color (255, 255, 255);
    noStroke();
    score         = 0;
    bonus         = 0;
    hi_score      = 0;
    score_text    = "score";
    hi_score_text = "high";
    game_over     = true;

    a = new Asteroid();
    b = new Asteroid();
    c = new Asteroid();
    
    /**
     * initialize scene attributes
     */
    smooth();
    background_space[0] = loadImage ("__space01.png");
    background_space[1] = loadImage ("__space02.png");
    background_space[2] = loadImage ("__space03.png");
    background_space[3] = loadImage ("__space04.png");
    background_space[4] = loadImage ("__space05.png");
    background_space[5] = loadImage ("__space06.png");
    background_space[6] = loadImage ("__space07.png");
    background_space[7] = loadImage ("__space08.png");
    background_space[8] = loadImage ("__space09.png");
    background_space[9] = loadImage ("__space10.png");
    background_space[10] = loadImage ("__space11.png");
    background_space[11] = loadImage ("__space12.png");
    background_space[12] = loadImage ("__space13.png");
    background_space[13] = loadImage ("__space14.png");
    background_space[14] = loadImage ("__space15.png");
    background_space[15] = loadImage ("__space16.png");
    background_space[16] = loadImage ("__space17.png");
    background_space[17] = loadImage ("__space18.png");
    background_space[18] = loadImage ("__space19.png");
    background_space[19] = loadImage ("__space20.png");
    background_space[20] = loadImage ("__space21.png");
    background_space[21] = loadImage ("__space22.png");
    background_space[22] = loadImage ("__space23.png");
    background_space[23] = loadImage ("__space24.png");
    background_space[24] = loadImage ("__space25.png");
    background_space[25] = loadImage ("__space26.png");
    background_space[26] = loadImage ("__space27.png");
    background_space[27] = loadImage ("__space28.png");
    background_space[28] = loadImage ("__space29.png");
    background_space[29] = loadImage ("__space30.png");
    background_space[30] = loadImage ("__space31.png");
    background_space[31] = loadImage ("__space32.png");
    background_space[32] = loadImage ("__space33.png");
    background_space[33] = loadImage ("__space34.png");
    background_space[34] = loadImage ("__space35.png");
    background_space[35] = loadImage ("__space36.png");
    background_space[36] = loadImage ("__space37.png");
    background_space[37] = loadImage ("__space38.png");
    background_space[38] = loadImage ("__space39.png");
    background_space[39] = loadImage ("__space40.png");
    background_space[40] = loadImage ("__space41.png");
    background_space[41] = loadImage ("__space42.png");
    background_space[42] = loadImage ("__space43.png");
    background_space[43] = loadImage ("__space44.png");
    background_space[44] = loadImage ("__space45.png");
    background_space[45] = loadImage ("__space46.png");
    background_space[46] = loadImage ("__space47.png");
    background_space[47] = loadImage ("__space48.png");
    background_space[48] = loadImage ("__space49.png");
    background_space[49] = loadImage ("__space50.png");
    background_space[50] = loadImage ("__space51.png");
    background_space[51] = loadImage ("__space52.png");
    background_space[52] = loadImage ("__space53.png");
    background_space[53] = loadImage ("__space54.png");
    background_space[54] = loadImage ("__space55.png");
    background_space[55] = loadImage ("__space56.png");
    background_space[56] = loadImage ("__space57.png");
    background_space[57] = loadImage ("__space58.png");
    background_space[58] = loadImage ("__space59.png");
    background_space[59] = loadImage ("__space60.png");
    
    /**
     * initialize player attributes
     */
    pilot_location = new PVector (100, height/2);
    pilot_velocity = new PVector (14, 14);
    pilot = loadImage ("__pilot.png");
}

void draw()
{  
    /** 
     * Title Screen 
     */
    if (game_over)
    {
        image (title, 0, 0);
        if (Space)
            game_over = false;
    }
    /**
     * Gameplay
     */
    else
       game_play(); 
}

void game_play()
{
    /**
     * draw moving background 
     */
    image (background_space[frameCount%59], 0, 0);
   
    clock += .01667;
    score = (int)(clock*10) + (int)bonus;
   
    /** 
     * draw pilot and set position, set pilot controls, set pilot boundaries 
     */
    image (pilot, pilot_location.x, pilot_location.y );
    if (Left)
        pilot_location.y -= 12;
    if (Right)
        pilot_location.y += 12;
    if (Space)
    {
        pilot_location.x += 4;
        bonus += .5;
    }
    if (!Space)
        pilot_location.x -= 4;
    
    if (pilot_location.x < 100)
        pilot_location.x += 4;
    if (pilot_location.x > 824)
        pilot_location.x -= 4;
    if (pilot_location.y < -30)
        pilot_location.y = 748;
    if (pilot_location.y > 748)
        pilot_location.y = -30;
    
    /**
     * Draw 3 asteroids at: begin, 10 sec, 20 sec 
     */
    a.Draw();
    if (clock > 10)
        b.Draw();
    if (clock > 20)
        c.Draw();
    
    /**
     * on collision reset game attributes to start 
     */
    if ((pilot_location.x - (a.x+40) < 0  &&
         pilot_location.x - (a.x-40) > 0  &&
         pilot_location.y - (a.y+40) < 0  &&
         pilot_location.y - (a.y-40) > 0) ||
        (pilot_location.x - (b.x+40) < 0  &&
         pilot_location.x - (b.x-40) > 0  &&
         pilot_location.y - (b.y+40) < 0  &&
         pilot_location.y - (b.y-40) > 0) ||
        (pilot_location.x - (c.x+40) < 0  &&
         pilot_location.x - (c.x-40) > 0  &&
         pilot_location.y - (c.y+40) < 0  &&
         pilot_location.y - (c.y-40) > 0))
    { 
        game_over = true; 
        clock = 0; 
        pilot_location.x = 100;
        pilot_location.y = height/2;
        
        a.x = 1100; 
        a.y = random(100, 668);
        a.x = 1100; 
        a.y = random(100, 668);
        b.x = 1100; 
        b.y = random(100, 668);
        b.x = 1100; 
        b.y = random(100, 668);
        c.x = 1100; 
        c.y = random(100, 668);
        c.x = 1100; 
        c.y = random(100, 668);
        
        /**
         * if player scored better than high score, update value and reset score 
         */
        if (hi_score < score)
        { 
            hi_score = score;
            score = 0;
            bonus = 0;
        }
        /**
         * reset player score 
         */
        else 
            score = 0;
            bonus = 0;
    }

    textAlign (CENTER);
    
    /**
     * display player high score
     */
    fill (text_color);
    textSize (48);
    text (hi_score, 900, 120);
    textSize (18);
    text (hi_score_text, 900, 72);
    
    /**
     * display player score
     */
    fill (text_color);
    textSize (48);
    text (score, 760, 120);
    textSize (18);
    text (score_text, 758, 72);
}
