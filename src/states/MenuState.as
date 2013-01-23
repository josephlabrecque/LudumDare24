package states
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class MenuState extends FlxState
	{
		[Embed(source="../assets/l0bg.png")]
		private var l0bg:Class;
		
		private var bg:FlxSprite;
		private var startButton:FlxButton;
		private var helpButton:FlxButton;
		private var introText:FlxText;
		private var creditText:FlxText;
		
		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			
			startButton = new FlxButton(120, 160, "D'evilution!", transitionLevel);
			helpButton = new FlxButton(120, 185, "How to Play", transitionHelp);
			
			var splash:FlxSprite = new FlxSprite(0, 0);
			splash.loadGraphic(l0bg);
			
			introText = new FlxText(10, 10, 300, "An evolution of thought.\nA light shining in the darkness.\nA spark born only to die.\nAll my children shall descend into this most terrible madness.\nAs all flesh will suffer before me.");
			introText.alignment = "center";
			introText.size = 13;
			creditText = new FlxText(10, 220, 300, "August 2012 - Joseph Labrecque - #LD48");
			creditText.alignment = "center";
			
			add(splash);
			add(introText);
			add(creditText);
			add(startButton);
			add(helpButton);
			
			FlxG.play(menu, 1.0, true, false);
		}
		
		private function transitionHelp():void
		{
			FlxG.fade(0x000000, 0.5, startHelp);
		}
		
		private function startHelp():void
		{
			FlxG.switchState(new HelpState);
		}
		
		private function transitionLevel():void
		{
			FlxG.fade(0x000000, 1.5, startGame);
		}
		
		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState);
		}
	}
}