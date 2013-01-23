package states
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class HelpState extends FlxState
	{
		[Embed(source="../assets/l0bg.png")]
		private var l0bg:Class;
		
		private var bg:FlxSprite;
		private var startButton:FlxButton;
		private var introText:FlxText;
		private var creditText:FlxText;
		
		public function HelpState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.mouse.show();
			
			startButton = new FlxButton(120, 190, "Back to Title", transitionLevel);
			
			var splash:FlxSprite = new FlxSprite(0, 0);
			splash.loadGraphic(l0bg);
			
			introText = new FlxText(10, 10, 300, "Play as the nameless protagonist as he transitions from innocent child - to delusioned youth - to heartless killer!\n\nUse the ARROW keys to walk around the world.\n\nUse the SPACEBAR key to interact with others.");
			introText.alignment = "center";
			introText.size = 13;
			creditText = new FlxText(10, 220, 300, "August 2012 - Joseph Labrecque - #LD48");
			creditText.alignment = "center";
			
			add(splash);
			add(introText);
			add(creditText);
			add(startButton);
			
			FlxG.play(menu, 1.0, true, false);
		}
		
		private function transitionLevel():void
		{
			FlxG.fade(0x000000, 0.5, goTitle);
		}
		
		private function goTitle():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new MenuState);
		}
	}
}