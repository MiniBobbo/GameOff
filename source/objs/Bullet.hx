package objs;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;

enum BulletType
{
	NORMAL;
}

/**
 * ...
 * @author Dave
 */
class Bullet extends Entity
{

	//Holds the current bullet type.
	var currentBulletType:BulletType;
	
	//The lifespan of the bullet.  If this is exceeded, the bullet will kill itself.
	var lifeSpan:Float;

	public function new(width:Int, height:Int, playState:PlayState)
	{
		super(width, height, playState);
		var atlasFrames  = FlxAtlasFrames.fromTexturePackerJson('assets/data/entities.png', 'assets/data/entities.json');
		frames = atlasFrames;
		animation.addByPrefix('normal', 'bullets_bullet', 12, true);
		animation.play('normal');
		setSize(10, 10);
		centerOffsets();
		
		
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

	/**
	 * Resets the bullet to a specific type.  Revives it, plays the correct animation, and places it in the correct spot.
	 * This should be overwritten for each specific bullet type to determine how it moves.
	 * @param	origin			The origin point of the bullet.
	 * @param	bulletType		What type of bullet should be created?
	 * @param	target			What point should this bullet target?
	 */
	public function resetBullet(origin:FlxPoint, bulletType:BulletType, target:FlxPoint)
	{
		centerOrigin();
		angle = origin.angleBetween(target) - 90;
		reset(origin.x, origin.y);
		currentBulletType = bulletType;

		switch (bulletType)
		{
			case BulletType.NORMAL:
				//animation.play('normal');
				//setSize(10,10);
				//centerOffsets();
				velocity = new FlxPoint(0, -C.BULLET_NORMAL_SPEED);
				velocity.rotate(FlxPoint.weak(), origin.angleBetween(target));
				//FlxG.log.add('frame height: ' + frameHeight);
				lifeSpan = C.BULLET_NORMAL_LIFESPAN;
			default:

		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		lifeSpan -= elapsed;
		
		if (lifeSpan <= 0) {
			this.kill();
		}
	}
}