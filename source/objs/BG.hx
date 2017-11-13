package objs;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Dave
 */
class BG extends FlxSprite 
{

	public function new() 
	{
		super();
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/entities.png', 'assets/data/entities.json');
		frames = atlasFrames;
		animation.addByPrefix('saloon', 'saloon');
		
	}
	
	/**
	 * Sets the background to a specific image
	 * @param	bgType		The type of image to set the bg to.  'saloon', 'road', etc
	 */
	public function setType(bgType:String) {
		switch (bgType) 
		{
			case 'saloon':
			animation.play('saloon');
			default:
				
		}
		
	}
	
}