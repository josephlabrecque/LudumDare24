package
{
	import org.flixel.FlxGame;
	
	import states.MenuState;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	
	public class EvolutionGame extends FlxGame
	{
		public function EvolutionGame()
		{
			super(320, 240, MenuState, 2);
			forceDebugger = true;
		}
	}
}