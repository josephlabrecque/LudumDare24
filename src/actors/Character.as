package actors
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxU;
	
	public class Character extends FlxSprite
	{
		[Embed(source="../assets/char.png")]
		private var characterImage:Class;
		
		private var walkComplete:Boolean = true;
		private var walkX:Number = 0;
		private var walkY:Number = 0;
		private var walkSpeed:Number = 16;
		private var movementTimer:Timer;
		public var ok:Boolean = true;
		
		public function Character()
		{
			super(0, 0);
			createCharacter();
		}
		
		private function createCharacter():void
		{
			loadGraphic(characterImage, true, false, 16, 16);
			
			var walkTimerLength:int = int(Math.random() * (20000 - 5000) + 5000)
			movementTimer = new Timer(walkTimerLength);
			movementTimer.addEventListener(TimerEvent.TIMER, resetWalk);
		}
		
		protected function resetWalk(event:TimerEvent):void
		{
			walkComplete = true;
		}
		
		override public function update():void
		{
			updateMovement();
			
			super.update();
		}
		
		public override function kill():void
		{
			ok = false;
			
			if(String(FlxG.state) == "KillerState")
			{
				FlxG.play(char);
				FlxG.shake();
				this.flicker(0.5);
				FlxG.flash(0x440000, 0.7, removeCharacter);
			}
			else
			{
				this.flicker(0.5);
				this.alpha = 0.5;
			}
		} 
		
		private function removeCharacter():void
		{
			super.kill();
		}
		
		private function updateMovement():void
		{
			if (walkComplete)
			{
				walkX = int(Math.random() * (FlxG.width - 0) + 0);
				walkY = int(Math.random() * (FlxG.height - 0) + 0);
				walkComplete = false;
				movementTimer.start();
			}
			else
			{
				var dx:Number = int(walkX - x);
				var dy:Number = int(walkY - y);
				
				if (int(x) == walkX)
				{
					velocity.x = 0;
				}
				else if (int(x) > walkX)
				{
					velocity.x = -walkSpeed;
				}
				else if (int(x) < walkX)
				{
					velocity.x = walkSpeed;
				}
				else 
				{
					velocity.x = 0;
				}
				
				if (int(y) == walkY)
				{
					velocity.y = 0;
				}
				else if (int(y) > walkY)
				{
					velocity.y = -walkSpeed;
				}
				else if (int(y) < walkY)
				{
					velocity.y = walkSpeed;
				}
				else 
				{
					velocity.y = 0;
				}
				
				if (dx == 0 && dy == 0)
				{
					walkComplete = true;
				}
			}
		}
		
	}
}