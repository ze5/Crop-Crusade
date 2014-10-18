package

{

	import org.flixel.*;

	[SWF(width="640", height="480", backgroundColor="#1a6f2f")]

	[Frame(factoryClass="Preloader")]



	public class cropcrusade extends FlxGame

	{
		public static var save:savemonkey = new savemonkey();
		public function cropcrusade()

		{

			super(320,240,MenuState,2, 60, 60);
			forceDebugger = true;
		}

	}

}

