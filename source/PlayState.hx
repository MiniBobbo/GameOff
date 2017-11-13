package;

import defs.LevelDef;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import inputhelper.InputHelper;
import objs.BG;
import objs.Bullet;
import objs.Entity;
import objs.Obstacle;
import objs.Player;

enum GState {
	PLAYING;
	PAUSED;
}

class PlayState extends FlxState
{
	//Shorthand reference to the InputHelper static object that handles player input.
	var I = InputHelper;
	
	//Game state variable
	public var gs:GState;
	
	//Groups for object pools and collisions
	var entities:FlxTypedGroup<Entity>;
	var enemies:FlxTypedGroup<Entity>;
	var pBullets:FlxTypedGroup<Bullet>;
	var eBullets:FlxTypedGroup<Bullet>;
	var pObs:FlxTypedGroup<Obstacle>;
	var eObs:FlxTypedGroup<Obstacle>;
	
	var bgImage:BG;
	var player:Player;
	
	override public function create():Void
	{
		super.create();
		//Create groups and initialize the game variables.
		init();	
		
		//Create all the object pools we will need for the game.
		createPools();	
		
		initLevel({levelType:'saloon'});
		
		testStuff();
		
	}

	override public function update(elapsed:Float):Void
	{
		//Store a copy of the keys that are pressed because they will be cleared by the super.update() call.
		I.updateKeys();
		super.update(elapsed);
	}
	
	function init():Void 
	{
		//Create the groups
		entities = new FlxTypedGroup<Entity>();
		enemies = new FlxTypedGroup<Entity>();
		pBullets = new FlxTypedGroup<Bullet>(C.pBullets);
		eBullets = new FlxTypedGroup<Bullet>(C.eBullets);
		pObs = new FlxTypedGroup<Obstacle>();
		eObs = new FlxTypedGroup<Obstacle>();
		
		//Create the player.
		player = new Player(this);
		entities.add(player);
		
		bgImage = new BG();
		//Set the gamestate to paused first for a screen transition.
		//TODO - Screen transition state
		gs = GState.PLAYING;
	
		//Add based on the draw order
		add(bgImage);
		add(eBullets);
		add(enemies);
		add(eObs);
		add(pBullets);
		add(pObs);
		add(player);
		
	}
	
	function createPools():Void 
	{
		for (i in 0...C.pBullets) {
			var b = new Bullet(10, 10, this);
			b.kill();
			pBullets.add(b);
			entities.add(b);
		}
		for (i in 0...C.eBullets) {
			var b = new Bullet(10, 10, this);
			b.kill();
			eBullets.add(b);
			entities.add(b);
		}
		
	
	}
	public function signalMe(signal:String, data:Dynamic) {
		switch (signal) 
		{
				
				
			default:
				
		}
	}
	
	public function initLevel(levelDef:LevelDef) {
		player.reset(C.playerXStart, C.playerYStart);
		bgImage.setType(levelDef.levelType);
				
	}
	
	public function playerFireBullet(origin:FlxPoint, destination:FlxPoint) {
		var b = pBullets.getFirstDead();
		
		b.resetBullet(origin, BulletType.NORMAL, destination);

		
	}
	
	/**
	 * This is the test function that I will try stuff out in.
	 */
	function testStuff() {
		var b = pBullets.getFirstDead();
		b.resetBullet(FlxPoint.weak(100, 100), BulletType.NORMAL, FlxPoint.weak(200, 100));
		
		var o = new Obstacle(40, 20, this);
		o.resetObstacle('barrel', FlxPoint.weak(0, C.PLAYER_OBSTACLE_Y));
		pObs.add(o);
	}
}
