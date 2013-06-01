package
{
	import flash.display.MovieClip;

	public class BrickM extends MovieClip
	{
		
		private var brickV:Vector.<Brick>;
		
		
		private var brickCount:Number;
		
		
		public function BrickM()
		{
			brickCount = 0;
			super();
		}
		public function resetBrickCount()
		{
			brickCount = 0;
		}
		public function creatBricks()
		{
			
			brickV = new Vector.<Brick>();
			
			for (var i:Number = 0; i < 5; i++)
			{
				for(var j:Number = 0; j < 9; j++)
				{
					var a:Brick = new Brick();
					
					a.x = 85.75+j*58;
					a.y = 47+i*20;
										
					addChild(a);
					brickV.push(a);
					brickCount++;
					
				}		
			}
				
		}
		public function getBrick(index:Number):MovieClip
		{
			return 	brickV[index];
		
		}
		public function getBrickCount()
		{
			return brickCount;
		}
		public function removeBrick(index:Number)
		{
			if (this.contains(brickV[index])) 
			{				
				removeChild(brickV[index]);
				brickV.splice(index, 1);
				brickCount--;
				
				
			}

		}
		public function decbrickCount()
		{
			
			
		}
		

		
	}
}