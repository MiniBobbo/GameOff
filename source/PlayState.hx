package;

import defs.LevelDef;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import inputhelper.InputHelper;
import objs.Bullet;
import objs.Entity;
import objs.Obstacle;
import objs.Player;

enum GState{
	PLAYING;
	PAUSED;
}

class PlayState extends FlxState
{
	//Shorthand reference to the InputHelper static object that handles player input.
	var I = InputHelper;
	
	//Game state variable
	var gs:GState;
	
	//Groups for object pools and collisions
	var entities:FlxTypedGroup<Entity>;
	var pBullets:FlxTypedGroup<Bullet>;
	var eBullets:FlxTypedGroup<Bullet>;
	var pObs:FlxTypedGroup<Obstacle>;
	var eObs:FlxTypedGroup<Obstacle>;
	
	var player:Player;
	
	override public function create():Void
	{
		super.create();
		//Create groups and initialize the game variables.
		init();	
		
		//Create all the object pools we will need for the game.
		createPools();	
		
		
		
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
		pBullets = new FlxTypedGroup<Bullet>(C.pBullets);
		eBullets = new FlxTypedGroup<Bullet>(C.eBullets);
		pObs = new FlxTypedGroup<Obstacle>();
		eObs = new FlxTypedGroup<Obstacle>();
		
		//Create the player.
		player = new Player(this);
		entities.add(player);
		
		//Set the gamestate to paused first for a screen transition.
		//TODO - Screen transition state
		gs = GState.PAUSED;
	
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
		
	}
}
