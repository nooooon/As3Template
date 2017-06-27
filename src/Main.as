import flash.display.MovieClip;
import flash.events.Event;
import flash.ui.Mouse;
import utils.loader.XMLLoader;

public static var DEBUG_MODE:int; //0:release 1:debug

private const SETUP_XML_URL:String = "setup.xml";

private var xmlLoader:XMLLoader;

private function onCreationComplete():void
{
	trace("onCreationComplete");
	Mouse.hide();
	addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	
	function onAddedToStage(e:Event):void
	{
		fullScreenMode(true);
		
		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
	}
	
	this.addEventListener(Event.RESIZE, resizeHandler, false, 0, true);
	
	loadSetting();
}

private function loadSetting():void
{
	//xml読み込み
	xmlLoader = new XMLLoader(SETUP_XML_URL);
	xmlLoader.addEventListener(XMLLoader.LOAD_COMPLETE, loadedXML);
}

private function loadedXML(event:Event):void
{
	DEBUG_MODE = xmlLoader.Debug();
	
	startContents();
}

private function fullScreenMode(bool:Boolean):void
{
	if(bool){
		stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
	}else{
		stage.displayState = StageDisplayState.NORMAL;
	}
}

private function resizeHandler(event:Event):void
{
	// resize();
}

private function startContents():void
{
	// start
}

private function keyDown(e:KeyboardEvent):void
{
	var key_code:uint = e.keyCode;
	trace(key_code);
}