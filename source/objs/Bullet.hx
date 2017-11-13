package objs;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class Bullet extends Entity 
{

	public function new(width:Int, height:Int, playState:PlayState) 
	{
		super(width, height, playState);
		makeGraphic(width, height, FlxColor.RED);
	}
	
	override public function signalMe(signal:String, data:Dynamic) 
	{
		switch (signal) 
		{
			case 'hit':
				this.kill();
			default:
				
		}
	}
}