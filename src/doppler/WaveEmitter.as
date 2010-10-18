package doppler {
	public class WaveEmitter {
		private var x : Number = 0;
		private var y : Number = 0;
		private var vx : Number = 0;
		private var vy : Number = 0;

		public function setX(i : Number) : void {
			x = i;
		}

		public function getX() : Number {
			return x;
		}

		public function setY(i : Number) : void {
			y = i;
		}

		public function getY() : Number {
			return y;
		}

		public function setVX(i : Number) : void {
			vx = i;
		}

		public function getVX() : Number {
			return vx;
		}

		public function setVY(i : Number) : void {
			vy = i;
		}

		public function getVY() : Number {
			return vy;
		}

		public function emitt() : Wave {
			var wave : Wave = new Wave();
			wave.setX(x);
			wave.setY(y);
			wave.setVX(vx);
			wave.setVY(vy);
			return wave;
		}

		public function move() : void {
			x += vx;
			y += vy;
		}
	}
}
