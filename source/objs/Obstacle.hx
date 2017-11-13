package objs;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class Obstacle extends Entity 
{

	public function new(width:Int, height:Int, playState:PlayState) 
	{
		super(width, height, playState);
		makeGraphic(width, height, FlxColor.MAGENTA);
		
	}
	
}