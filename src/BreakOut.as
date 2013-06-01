package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.text.*;
	import flash.ui.Keyboard;

	public class BreakOut extends MovieClip
	{
		private var ball:Ball = new Ball();
		private var brickM:BrickM = new BrickM();
		private var power:SpeedPower = new SpeedPower();
		
		private var scoreNum:Number;
		private var liveNum:Number;
		
		
		var start:Boolean = false;
		
		
		public function BreakOut()
		{
			
			
			scoreNum = 0;
			liveNum = 3;
			Lives.text = liveNum.toString();
			addChild(ball);
			
			power.start();
			
			
			addChild(power);
			this.addEventListener(Event.ENTER_FRAME, animate);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, downKeyboard);
			brickM.creatBricks();
			
			addChild(brickM);
			
			//stage.addEventListener(KeyboardEvent.KEY_UP, upKeyboard);
	
			function animate(e:Event):void 
			{
				//checks to see when the end comes
				if (brickM.getBrickCount() == 0)
				{
					start = false;
					power.setLevel(power.getLevel()+1);
					ball.resetBall();
					brickM.creatBricks();
					
					
				}
				
				//checks to see if u loose a life
				if (ball.getY() >= 480)
				{
					start = false;
					liveNum -= 1;
					Lives.text = liveNum.toString();
					
					ball.resetBall();
					
				}
				
				//lives == 0 restart game
				if (liveNum == 0)
				{
					
					for (var m:Number = 0; m <= brickM.getBrickCount(); ++m)
					{

						brickM.removeBrick(m);
						trace(m);
						m = 0;
						
					}
					for (var j:Number = 0; j < power.getPowerCount(); ++j)
					{
						power.removePower(j);
						//j=0;
					}
					
				
					start = false;
					ball.resetBall();
					ball.setSpeed(10);
					brickM.resetBrickCount();
					brickM.creatBricks();
					power.resetPower();
					

					//reset lives / score
					liveNum = 3;
					scoreNum = 0;
					
					Score.text = scoreNum.toString();
					Lives.text = liveNum.toString();
					

					
				}
				

				
				//if true animate ball
				if (start == true)
				{
					ball.ballAnimate();	
					
				}
				
				//ball/pad hittest
				if (ball.hitTestObject(pad))
				{
				ball.ballPadHit(pad.x);
				}
				
				//loop thro power
				for (var j:Number = 0; j < power.getPowerCount(); ++j)
				{

					
					//call animate Power
					power.powerAnimate(j);

					
					//If power Hits Pad
					if(pad.hitTestObject(power.getPower(j)))
					{
						power.removePower(j);
						
						//every level the speed doubles
						ball.setSpeed(ball.getSpeed() + (power.getLevel()*power.getSpeedIn()));
						power.decPowerCount();
						j = 0;
						
					}
					//if Power goes off screen remove
					else if (power.getPower(j).y >= 480)
					{
						power.removePower(j);
						
						power.decPowerCount();
						j = 0;
					}
					

						
				}
				
				//Brick Loop
				for (var i:Number = 0; i < brickM.getBrickCount(); i++)
				{
					
					//ball/hit Brick
					if(ball.hitTestObject(brickM.getBrick(i)))
					{
						
						//hit test X
						if (+(ball.x - brickM.getBrick(i).x) > 16)
						{
							
							power.creatPower(brickM.getBrick(i).x, brickM.getBrick(i).y);
							
							brickM.removeBrick(i);
							ball.angleXFlip();
							trace("X" + i);
							i = 0;
						
						}
						//hit test Y
						else
						{
							power.creatPower(brickM.getBrick(i).x, brickM.getBrick(i).y);
							brickM.removeBrick(i);
							ball.angleYFlip();
							trace("Y" + i);
							i = 0;
						
						}
						
						//gets score
						scoreNum += ((ball.getSpeed()/10)*10) 
						
						//Score Text
						Score.text = scoreNum.toFixed(0);
			
						
						

					}
				}

			
				ball.ballWallHit();

	
				
			}
			
			function downKeyboard(key:KeyboardEvent):void 
			{
				switch (key.keyCode) 
				{
				case Keyboard.SPACE:
					start = true;
					break
				}
				
			}

		}
	}
}

