package states
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class EndState extends FlxState
	{
		[Embed(source="../assets/lxbg.png")]
		private var lxbg:Class;
		
		private var bg:FlxSprite;
		private var startButton:FlxButton;
		private var introText:FlxText;
		private var creditText:FlxText;
		
		public function EndState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			
			startButton = new FlxButton(120, 160, "Play Again", startGame);
			
			var splash:FlxSprite = new FlxSprite(0, 0);
			splash.loadGraphic(lxbg);
			
			introText = new FlxText(10, 10, 300, "The land is laid waste and the world erupts in darkness.\nThis is the fate of every man.\nTo find a glorious, blood-drenched end so far from his origin...");
			introText.alignment = "center";
			introText.size = 13;
			creditText = new FlxText(10, 220, 300, "August 2012 - Joseph Labrecque - #LD48");
			creditText.alignment = "center";
			
			add(splash);
			add(introText);
			add(creditText);
			add(startButton);
			
			FlxG.play(end, 1.0, false, false);
		}
		
		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.fade(0x000000, 0.5, transitionLevel);
		}
		
		private function transitionLevel():void
		{
			FlxG.switchState(new MenuState);
		}
		
	}
}