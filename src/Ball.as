package
{
	import flash.display.MovieClip;
	import flash.text.*;
	
	public class Ball extends MovieClip
	{
		private var _xSpeed:Number;
		private var _ySpeed:Number;
		
		private var speed:Number;
		
		private var angleX:Number;
		private var angleY:Number;
		private var angle:Number;
		
		
		var angleChange:Number;


		
		public function Ball()
		{
			x = 320;
			y = 240;
			
			angleX = 90;
			angleY = 90;
			angle = 90;
			
			speed = 10;
			//angleChange = null;
			
		
		}
		
		public function ballAnimate()
		{
	
			_xSpeed = (speed * (Math.cos((angleX) * Math.PI / 180)));
			_ySpeed = (speed * (Math.sin((angleY) * Math.PI / 180)));
			
			
			x += _xSpeed;
			y += _ySpeed;
			
		
		}
		public function ballPadHit(padX:Number)
		{
				

					if (x > padX)
					{

							angleX = -((((padX + 57)- x)/57)* 90) + 360;
							angleY = angleX;
							y = 412;
							
							
					
							
					}
					
					if (x < padX)
					{

							angleX = (((x-(padX - 57))/57)* 90) + 180;
							angleY = angleX;
							y = 412;
						

					}	

					
					

		}
		public function angleXFlip()
		{
			angleX = angleX - 180;
		}
		public function angleYFlip()
		{
			angleY = angleY - 180;
		}
		
		
		public function ballWallHit()
		{
			// angleChange
			//0 = pad;
			//1 = left wall
			//2 = right wall
			//3 = top wall
			//4 = brick
			
			if (x >= 631)
			{
				angleX = angleX - 180;
				x = 629;
		

			}
			if (x <= 0)
			{
				angleX = angleX - 180;
				x = 1;
				
			}
			
			if (y <= -25)
			{
				angleY = angleY - 180;
				y = 1;
					
			}

			
			
		}
		public function getSpeed():Number
		{
			return speed;
			
		}
		public function setSpeed(num:Number)
		{
			speed = num;
			
		}
		public function getX()
		{
			return x;	
		}
		
		public function getY()
		{
			return y;
		}
		
		public function resetBall()
		{
			x = 320;
			y = 240;
			
			angleX = 90;
			angleY = 90;
			angle = 90;
			

		}
			 
		
	}
}