package states
{
	import actors.Player;
	import actors.Character;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	
	import states.EndState;
	
	public class KillerState extends FlxState
	{
		[Embed(source="../data/mapCSV_Group1_KillerMap.csv", mimeType="application/octet-stream")]
		private var CSV_bg:Class;
		[Embed(source="../assets/tiles.png")]
		private var Img_bg:Class;
		
		private var l1bg:Class;
		private var playText:FlxText;
		private var player:Player;
		private var bgTileMap:FlxTilemap;
		private var fr1:Character;
		private var fr2:Character;
		private var fr3:Character;
		private var fr4:Character;
		private var fr5:Character;
		private var fr6:Character;
		private var charCount:int;
		
		public function KillerState()
		{
			super();
		}
		
		override public function create():void
		{
			createWorld();
			createPlayer();
			createObjects();
			
			FlxG.play(l3, 1.0, true, false);
		}
		
		private function createWorld():void
		{
			bgTileMap = new FlxTilemap;
			bgTileMap.loadMap(new CSV_bg, Img_bg, 16, 16, FlxTilemap.OFF);
			bgTileMap.setTileProperties(10, FlxObject.ANY, null, null, 1);
			bgTileMap.setTileProperties(11, FlxObject.NONE, null, null, 1);
			bgTileMap.setTileProperties(12, FlxObject.NONE, null, null, 1);
			bgTileMap.setTileProperties(13, FlxObject.ANY, null, null, 1);
			add(bgTileMap);
		}
		
		private function createObjects():void
		{
			fr1 = new Character();
			fr1.x = 120
			fr1.y = 50;
			add(fr1);
			
			fr2 = new Character();
			fr2.x = 300;
			fr2.y = 140;
			add(fr2);
			
			fr3 = new Character();
			fr3.x = 200;
			fr3.y = 50;
			add(fr3);
			
			fr4 = new Character();
			fr4.x = 40;
			fr4.y = 130;
			add(fr4);
			
			fr5 = new Character();
			fr5.x = 180;
			fr5.y = 200;
			add(fr5);
			
			fr6 = new Character();
			fr6.x = 69;
			fr6.y = 60;
			add(fr6);
			
			charCount = 6;
			
			playText = new FlxText(10, 10, 300, "YEAR 40:\nThis world and those within it are unfit for continued survival. I will strike down the people and consume their flesh. All will fall before my hand.");
			add(playText);
		}
		
		private function createPlayer():void
		{
			player = new Player();
			player.x = FlxG.width/2-8;
			player.y = FlxG.height/2-8;
			add(player);
			player.changePlayer();
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(player, bgTileMap);
			FlxG.collide(fr1, bgTileMap);
			FlxG.collide(fr2, bgTileMap);
			FlxG.collide(fr3, bgTileMap);
			FlxG.collide(fr4, bgTileMap);
			FlxG.collide(fr5, bgTileMap);
			FlxG.collide(fr6, bgTileMap);
			
			
			if(FlxG.keys.justPressed("SPACE"))
			{
				if(player.overlaps(fr1) && fr1.ok)
				{
					fr1.kill();
					playText.text = "Every person. Every object. An irritation to be be removed...";
					charCount--;
				}
				else if(player.overlaps(fr2) && fr2.ok)
				{
					fr2.kill();
					playText.text = "I had become not just indifferent to the world. I now wished to overcome it through blood...";
					charCount--;
				}
				else if(player.overlaps(fr3) && fr3.ok)
				{
					fr3.kill();
					playText.text = "A new thrill I had not experienced since childhood. Each death brings a flutter of joy to my heart...";
					charCount--;
				}
				else if(player.overlaps(fr4) && fr4.ok)
				{
					fr4.kill();
					playText.text = "I am death incarnate. My fellow man had become my hunted pleasure...";
					charCount--;
				}
				else if(player.overlaps(fr5) && fr5.ok)
				{
					fr5.kill();
					playText.text = "As the familar faces of my friends opened in terror, I absorb their emotions and used them to drive me on...";
					charCount--;
				}
				else if(player.overlaps(fr6) && fr6.ok)
				{
					fr6.kill();
					playText.text = "Everything drenched in blood. After removing these swine - I will become the destroyer of earth herself...";
					charCount--;
				}
			}
			
			if(charCount == 0)
			{
				FlxG.fade(0x440000, 4.0, transitionLevel);
			}
		}
		
		private function transitionLevel():void
		{
			FlxG.switchState(new EndState);
		}
		
	}
}