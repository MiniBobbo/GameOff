package objs;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import inputhelper.InputHelper;

/**
 * ...
 * @author Dave
 */
class Player extends Entity
{

	//This variable keeps track of which side the player should fire from.
	var fireRight:Bool = false;
	var fireDelay:Float = 0;

	public function new(playState:PlayState)
	{
		super(C.GAME_UNIT_SIZE_X, C.GAME_UNIT_SIZE_Y, playState);
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/entities.png', 'assets/data/entities.json');
		frames = atlasFrames;
		animation.addByPrefix('stand', 'cowboy_stand', 12, true);
		animation.play('stand');
		centerOrigin();
		offset.set((C.GAME_GRAPHIC_SIZE_X - C.GAME_UNIT_SIZE_X) / 2, (C.GAME_GRAPHIC_SIZE_Y - C.GAME_UNIT_SIZE_Y));
		setSize(C.GAME_UNIT_SIZE_X, C.GAME_UNIT_SIZE_Y);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		//if (playState.gs == GState.PLAYING) {
		movePlayer();
		fireDelay -= elapsed;
		//}
	}

	private function movePlayer()
	{
		var I = InputHelper;

		velocity.set();

		if (I.isButtonPressed('left'))
			velocity.x -= C.PLAYER_MOVE_SPEED;
		if (I.isButtonPressed('right'))
			velocity.x += C.PLAYER_MOVE_SPEED;

		//Only fire if the mouse is pressed, the fire delay isn't still on, and the mouse is below the player (minus the cheat value)
		if (FlxG.mouse.pressed && fireDelay <= 0 && FlxG.mouse.y < y - C.PLAYER_FIRE_CHEAT)
		{
			fireBullet();

		}
	}

	private function fireBullet()
	{
		var offsetX:Float;
		if (fireRight)
		{
			offsetX = C.PLAYER_OFFSET_RIGHT;
		}
		else
		{
			offsetX = C.PLAYER_OFFSET_LEFT;
		}
		//Switch the next shot to come from the other hand
		fireRight = !fireRight;

		playState.playerFireBullet(FlxPoint.weak(this.x + offsetX, this.y + C.PLAYER_OFFSET_DOWN), FlxG.mouse.getScreenPosition());
		//playState.playerFireBullet(FlxPoint.weak(this.x , this.y), FlxG.mouse.getScreenPosition());
		fireDelay = C.PLAYER_FIRE_DELAY;
	}
}