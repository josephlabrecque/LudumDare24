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
	
	import states.KillerState;
	
	public class AdultState extends FlxState
	{
		[Embed(source="../data/mapCSV_Group1_AdultMap.csv", mimeType="application/octet-stream")]
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
		private var charCount:int;
		
		public function AdultState()
		{
			super();
		}
		
		override public function create():void
		{
			createWorld();
			createPlayer();
			createObjects();
			
			
			FlxG.play(l2, 0.7, true, false);
		}
		
		private function createWorld():void
		{
			bgTileMap = new FlxTilemap;
			bgTileMap.loadMap(new CSV_bg, Img_bg, 16, 16, FlxTilemap.OFF);
			bgTileMap.setTileProperties(5, FlxObject.ANY, null, null, 1);
			bgTileMap.setTileProperties(6, FlxObject.NONE, null, null, 1);
			bgTileMap.setTileProperties(7, FlxObject.NONE, null, null, 1);
			bgTileMap.setTileProperties(8, FlxObject.ANY, null, null, 1);
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
			
			charCount = 4;
			
			playText = new FlxText(10, 10, 300, "YEAR 20:\nAs I find myself in adulthood, the wonder of youth lies broken at my feet. The world offers nothing but shadows and the people are filled with deciet and greed.");
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
			
			if(FlxG.keys.justPressed("SPACE"))
			{
				if(player.overlaps(fr1) && fr1.ok)
				{
					fr1.kill();
					playText.text = "My former friends were full of lies and deciet...";
					charCount--;
				}
				else if(player.overlaps(fr2) && fr2.ok)
				{
					fr2.kill();
					playText.text = "Lost soul after lost soul. There is no redeption for any of us...";
					charCount--;
				}
				else if(player.overlaps(fr3) && fr3.ok)
				{
					fr3.kill();
					playText.text = "Everything is so cold. Everything is so grey...";
					charCount--;
				}
				else if(player.overlaps(fr4) && fr4.ok)
				{
					fr4.kill();
					playText.text = "We are all alone. We live and die through cruelty and abandonment...";
					charCount--;
				}
			}
			
			if(charCount == 0)
			{
				FlxG.fade(0x000000, 3.0, transitionLevel);
			}
		}
		
		private function transitionLevel():void
		{
			FlxG.switchState(new KillerState);
		}
		
	}
}