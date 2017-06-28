package controller
{
	import flash.display.DisplayObjectContainer;

	public class MainController
	{
		private var _parent:DisplayObjectContainer;
		
		public function MainController(parent:DisplayObjectContainer)
		{
			_parent = parent;
		}
	}
}