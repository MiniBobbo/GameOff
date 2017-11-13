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
		super(48, 48, playState);
		makeGraphic(48, 48, FlxColor.GRAY);
		
	}
	
}