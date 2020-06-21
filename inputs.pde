/**
 * Player Controls
 */

boolean Left = false;
boolean Right = false;
boolean Space = false;

void keyPressed()
{
    if (keyCode == LEFT)
        Left = true;
    if (keyCode == RIGHT)
        Right = true;
    if (key == ' ')
        Space = true;
}

void keyReleased() 
{
    if (keyCode == LEFT)
        Left = false;
    if (keyCode == RIGHT)
        Right = false;
    if (key == ' ')
        Space = false;
}
