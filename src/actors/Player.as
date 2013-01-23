package actors
{
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	import states.AdultState;
	import states.KillerState;
	
	public class Player extends FlxSprite
	{
		[Embed(source="../assets/player.png")]
		private var playerImage:Class;
		
		[Embed(source="../assets/player2.png")]
		private var player2Image:Class;
		
		[Embed(source="../assets/player3.png")]
		private var player3Image:Class;
		
		public function Player()
		{
			super(0, 0);
			createPlayer();
		}
		
		private function createPlayer():void
		{
			loadGraphic(playerImage, true, false, 16, 16);
			
			addAnimation("idle", [0,1], 1, true);
			addAnimation("up", [2,3], 4, true);
			addAnimation("down", [4,5], 4, true);
			addAnimation("left", [6,7], 4, true);
			addAnimation("right", [8,9], 4, true);
			
			play("idle");
		}
		
		public function changePlayer():void
		{
			if(String(FlxG.state) == "AdultState")
			{
				loadGraphic(player2Image, true, false, 16, 16);
			}
			else if(String(FlxG.state) == "KillerState")
			{
				loadGraphic(player3Image, true, false, 16, 16);
			}
			play("idle");
		}
		
		override public function update():void
		{
			updateMovement();
			updatePlayer();
			
			super.update();
		}
		
		private function updateMovement():void
		{
			velocity.x = 0;
			velocity.y = 0;
			acceleration.x = 0;
			acceleration.y = 0;
			drag.x = 0;
			drag.y = 0;
			
			if(FlxG.keys.LEFT)
			{
				velocity.x = -50;
			}
			else if(FlxG.keys.RIGHT)
			{
				velocity.x = 50;
			}
			
			if(FlxG.keys.UP)
			{
				velocity.y = -50;
			}
			else if(FlxG.keys.DOWN)
			{
				velocity.y = 50;
			}
			
			
			if(x > FlxG.width-16)
			{
				x = FlxG.width-16;
			}
			else if(x < 0)
			{
				x = 0;
			}
			
			if(y > FlxG.height-16)
			{
				y = FlxG.height-16;
			}
			else if(y < 0)
			{
				y = 0;
			}
		}
		
		private function updatePlayer():void
		{
			if(FlxG.keys.justPressed("UP"))
			{
				play("up");
			}
			if(FlxG.keys.justPressed("DOWN"))
			{
				play("down");
			}
			if(FlxG.keys.justPressed("LEFT"))
			{
				play("left");
			}
			if(FlxG.keys.justPressed("RIGHT"))
			{
				play("right");
			}
			
			
			
			if(FlxG.keys.justReleased("UP"))
			{
				play("idle");
			}
			if(FlxG.keys.justReleased("DOWN"))
			{
				play("idle");
			}
			if(FlxG.keys.justReleased("LEFT"))
			{
				play("idle");
			}
			if(FlxG.keys.justReleased("RIGHT"))
			{
				play("idle");
			}
		}
		
	}
}