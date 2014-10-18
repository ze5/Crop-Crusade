package  
{
	import flash.net.SharedObject;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author zez
	 */
	public class savemonkey 
	{
		public var UserData:Object = new Object();
		public var multiplayer:Boolean = false;
		private var local:SharedObject;
		private var server:URLRequest;
		private var phpbackend:String;
		public function savemonkey() 
		{
			if (multiplayer == false)
			{
				local = SharedObject.getLocal("crpcrs");
				if (local.data != null)
				{
					trace(local.data.var6 ); // if we did find data...
					loadData(local.data); // ...load the data
				}
			}
			else
			{
				server = URLRequest(phpbackend);
				server.method = "POST";
			}
		}
		public function changeData(varname : String, variable : Object):void
		{
			UserData[varname] = variable;
		}
		private function mergeVars(Data:Object):void
		{
			for (var thing:String in UserData)
			{
				Data[thing] = UserData[thing];
			}
		}
		public function saveData():void
		{
			if (!multiplayer)
			{
				mergeVars(local.data);
				local.flush();
			}
		}
		public function loadData(data:Object):void
		{
			UserData = data;
		}
	}

}