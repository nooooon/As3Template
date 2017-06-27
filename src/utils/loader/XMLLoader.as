package utils.loader
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class XMLLoader extends EventDispatcher
	{
		public static const LOAD_COMPLETE:String = "xmlLoadComplete";
		
		private var setupXML:XML;
		private var debug:int;
		
		public function XMLLoader(path:String)
		{
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, xmlCompleteHandler);
			urlLoader.load(new URLRequest(path));
		}
		
		private function xmlCompleteHandler(event:Event):void 
		{
			setupXML = XML(event.target.data);
			debug = setupXML.child("debug")[0];
			
			dispatchEvent(new Event(LOAD_COMPLETE));	
		}
		
		public function Debug():int
		{
			return debug;
		}
	}
}