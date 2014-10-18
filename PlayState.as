package
{

	import org.flixel.*;

	public class PlayState extends FlxState
	{
		private var player:FlxSprite;
		override public function create():void
		{
			player = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
			if (cropcrusade.save.UserData.plx is Number)
			{
				player.x = cropcrusade.save.UserData.plx;
				player.y = cropcrusade.save.UserData.ply;
			}
			player.makeGraphic(16, 16);
			player.maxVelocity.x = player.maxVelocity.y = 60;
			player.drag.x = player.drag.y = 60;
			add(player);
		}
		
		override public function update():void
		{
			if (FlxG.mouse.pressed())
			{
				player.acceleration.x = FlxG.mouse.x - player.x;
				player.acceleration.y = FlxG.mouse.y - player.y;
			}
			if (FlxG.keys.justPressed("S"))
			{
				cropcrusade.save.changeData("plx", player.x);
				cropcrusade.save.changeData("ply", player.y);
				cropcrusade.save.saveData();
			}
			super.update();
		}
	}
}

