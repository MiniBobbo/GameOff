package objs;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class Player extends Entity 
{

	public function new(playState:PlayState) 
	{
		super(0, 0, playState);
		makeGraphic(48, 48, FlxColor.GRAY);
		
	}
	
}