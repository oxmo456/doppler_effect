package doppler {
	public class Wave {
		private var x : Number = 0;
		private var y : Number = 0;
		private var vx : Number = 0;
		private var vy : Number = 0;
		private var ttl : uint = 0;
		private var startTTL : uint;

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

		public function setTTL(i : uint) : void {
			startTTL=ttl = i;
		}

		public function getTTL() : uint {
			return ttl;
		}

		public function decreaseTTL() : void {
			ttl--;
		}

		public function getAge() : uint {
			return startTTL - ttl;
		}
	}
}
