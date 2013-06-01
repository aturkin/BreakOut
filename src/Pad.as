package
{
import flash.display.MovieClip;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.ui.Mouse;

	public class Pad extends MovieClip
	{
		//private var x:Number;
		//private var y:Number;
		
		public function Pad()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			Mouse.hide();
			
		}
		private function onAddedToStage(e:Event) : void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
		private function init() : void 
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, animate);

		}
		
		private function animate(e:MouseEvent) : void 
		{
			x = e.stageX;
	
		}
		

	}
}