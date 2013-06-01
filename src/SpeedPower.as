package
{
	import flash.display.MovieClip;

	public class SpeedPower extends MovieClip
	{
		private var lev:Number;
		private var speedIn:Number;
		
		private var power:Vector.<Power>;
		
		private var powerCount:Number;
		
		public function SpeedPower()
		{
			super();
			
		}
		public function start()
		{
			resetPower();
			power = new Vector.<Power>();
			
			
		}

		public function creatPower(brickX:Number, brickY:Number)
		{
			
			var p:Power = new Power();
					
			p.x = brickX;
			p.y = brickY;
										
			addChild(p);
			power.push(p);
			powerCount++;
			
		}
		public function resetPower()
		{
			lev = 1;
			speedIn = .05;
			powerCount = 0;
		}
		
		
		public function setLevel(num:Number)
		{
			lev = num;
			
		}
		public function getLevel():Number
		{
			return lev;
			
		}
		public function setSpeedIn(num:Number)
		{
			lev = num;
		}
		public function getSpeedIn():Number
		{
			 return speedIn;
			
		}
		public function getPowerCount():Number
		{
			return powerCount;
			
		}
		public function getPower(index:Number):MovieClip
		{
			return power[index];
			
		}
		public function powerAnimate(index:Number)
		{
			power[index].y = power[index].y + 7;
						
		}
		public function removePower(index:Number)
		{
			if (this.contains(power[index])) 
			{			
				
				removeChild(power[index]);
				power.splice(index, 1);	
				
				
				
			}
			else 
			{
				trace("oops");
			}

		}
		public function decPowerCount()
		{
			powerCount--;
			
		}
		
		
	}
}