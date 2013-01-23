package states
{
	import actors.Character;
	import actors.Player;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	
	public class PlayState extends FlxState
	{
		[Embed(source="../data/mapCSV_Group1_ChildMap.csv", mimeType="application/octet-stream")]
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
		private var charCount:int;
		
		public function PlayState()
		{
			super();
		}
		
		override public function create():void
		{
			createWorld();
			createPlayer();
			createObjects();
			
			FlxG.play(l1, 0.4, true, false);
		}
		
		private function createWorld():void
		{
			bgTileMap = new FlxTilemap;
			bgTileMap.loadMap(new CSV_bg, Img_bg, 16, 16, FlxTilemap.OFF);
			bgTileMap.setTileProperties(0, FlxObject.ANY, null, null, 1);
			bgTileMap.setTileProperties(1, FlxObject.NONE, null, null, 1);
			bgTileMap.setTileProperties(2, FlxObject.NONE, null, null, 1);
			bgTileMap.setTileProperties(3, FlxObject.ANY, null, null, 1);
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
			
			charCount = 3;
			
			playText = new FlxText(10, 10, 300, "YEAR 1:\nI was a fool to think these idyllic moments would last.\nThat they would not be swept away in the wind like dead leaves.");
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
			
			if(FlxG.keys.justPressed("SPACE"))
			{
				if(player.overlaps(fr1) && fr1.ok)
				{
					fr1.kill();
					playText.text = "Those friends I interacted with were just as cluesless as myself...";
					charCount--;
				}
				else if(player.overlaps(fr2) && fr2.ok)
				{
					fr2.kill();
					playText.text = "We were all just wanderings souls thrust into the wide world...";
					charCount--;
				}
				else if(player.overlaps(fr3) && fr3.ok)
				{
					fr3.kill();
					playText.text = "Everything was exciting. Everything was new...";
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
			FlxG.switchState(new AdultState);
		}
		
	}
}