package;
import flixel.input.FlxAccelerometer;

/**
 * ...
 * @author Dave
 */
class C 
{
	//Player bullet count
	public static var pBullets:Int = 100;
	//Enemy bullet count
	public static var eBullets:Int = 100;
	
	//Player start location
	public static var playerXStart:Float = 220;
	public static var playerYStart:Float = 245;
	
	//Base graphic size.
	public static var GAME_GRAPHIC_SIZE_X:Int = 48;
	public static var GAME_GRAPHIC_SIZE_Y:Int = 48;
	
	//Base game unit size.  This should be smaller than the graphic.
	public static var GAME_UNIT_SIZE_X:Int = 30;
	public static var GAME_UNIT_SIZE_Y:Int = 20;
	
	public static var PLAYER_OBSTACLE_Y:Float = 245;
	public static var PLAYER_MOVE_SPEED:Float = 200;
	public static var PLAYER_ROLL_SPEED:Float = 200;
	public static var PLAYER_OFFSET_LEFT:Float = 10; 
	public static var PLAYER_OFFSET_RIGHT:Float = 30;
	public static var PLAYER_OFFSET_DOWN:Float = 0;
	public static var PLAYER_FIRE_DELAY:Float = .4;
	//This value doesn't allow the player to fire unless the mouse is this far above the player's y position. 
	//Basically doesn't allow firing backwards or directly to the side.
	public static var PLAYER_FIRE_CHEAT:Float = .4;
	
	public static var BULLET_NORMAL_SPEED:Float = 300;
	public static var BULLET_NORMAL_LIFESPAN:Float = 10;
	
	
}