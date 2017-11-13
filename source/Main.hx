package;

import flixel.FlxGame;
import inputhelper.InputHelper;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		InputHelper.init();
		InputHelper.allowWASD();
		InputHelper.addButton('fire');
		InputHelper.addButton('dodge');
		InputHelper.addButton('reload');
		
		
		addChild(new FlxGame(0, 0, PlayState));
	}
}
