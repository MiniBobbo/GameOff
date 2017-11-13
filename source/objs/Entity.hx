package objs;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Dave
 */
class Entity extends FlxSprite 
{

	var playState:PlayState;
	
	public function new(width:Int, height:Int, parentState:PlayState) 
	{
		super();
		playState = parentState;
		makeGraphic(width, height, FlxColor.BLUE);
	}
	
	public function signalMe(signal:String, data:Dynamic) {
		
	}
	
}