package objs;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class Obstacle extends Entity 
{

	/**
	 * Create a new obstacle
	 * @param	width		Width of obstacle's hitbox.  Graphic independent.
	 * @param	height		Height of obstacle's hitbox.  Graphic independent.
	 * @param	playState	The playstate
	 */
	public function new(width:Int, height:Int, playState:PlayState) 
	{
		super(width, height, playState);
		makeGraphic(width, height, FlxColor.MAGENTA);
	}
	
	/**
	 * Resets the obstacle in a particular position.  Also resets the state of the obstacle (HP, properties) depending on its type.
	 * @param	type			The type of obstacle to create.  'barrel', 'door' etc.
	 * @param	position		The LOWER LEFT of the obstacle.  
	 */
	public function resetObstacle(type:String, position:FlxPoint) {
		reset(position.x, position.y - height);
	}
	
}