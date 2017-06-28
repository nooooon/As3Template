package utils.loader
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class XMLLoader extends EventDispatcher
	{
		public static const LOAD_COMPLETE:String = "xmlLoadComplete";
		
		private var _xml:XML;
		
		public function XMLLoader(path:String)
		{
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, xmlCompleteHandler);
			urlLoader.load(new URLRequest(path));
		}
		
		private function xmlCompleteHandler(event:Event):void 
		{
			_xml = XML(event.target.data);
			
			dispatchEvent(new Event(LOAD_COMPLETE));	
		}
		
		public function getXml():XML
		{
			return _xml
		}
	}
}