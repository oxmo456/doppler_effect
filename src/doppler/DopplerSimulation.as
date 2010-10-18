package doppler {
	public class DopplerSimulation {
		private static const MIN_WAVE_TTL : int = 0;
		private var waveTTL : int;
		private var waveEmitter : WaveEmitter;
		private var waves : Vector.<Wave>;
		private var width : Number = 0;
		private var height : Number = 0;
		private var emitterMaxVX : int = 1;
		private var emitterMaxVY : int = 1;

		public function DopplerSimulation() {
			waveEmitter = new WaveEmitter();
			waves = new Vector.<Wave>();
		}

		public function setWaveTTL(value : int) : void {
			waveTTL = Math.max(MIN_WAVE_TTL, value);
		}

		public function getWaveTTL() : int {
			return waveTTL;
		}

		public function getWaves() : Vector.<Wave> {
			return waves;
		}

		public function stepForward() : void {
			waveEmitter.move();
			if(waveEmitter.getX() > width) {
				waveEmitter.setVX(-waveEmitter.getVX());
				waveEmitter.setX(width);
			} else if(waveEmitter.getX() < 0) {
				waveEmitter.setVX(-waveEmitter.getVX());
				waveEmitter.setX(0);
			}
			if(waveEmitter.getY() > height) {
				waveEmitter.setVY(-waveEmitter.getVY());
				waveEmitter.setY(height);
			} else if(waveEmitter.getY() < 0) {
				waveEmitter.setVY(-waveEmitter.getVY());
				waveEmitter.setY(0);
			}
			var wave : Wave;
			var length : int = waves.length;
			var deadWaves : Array = [];
			for (var i : int = 0; i < length; i++) {
				wave = waves[i];
				wave.decreaseTTL();
				if(wave.getTTL() <= 0)
					deadWaves.push(i);
			}
			for each (var k : int in deadWaves) {
				waves.splice(k, 1);
			}
			wave = waveEmitter.emitt();
			wave.setTTL(waveTTL);
			waves.push(wave);
		}

		public function getWaveEmitter() : WaveEmitter {
			return waveEmitter;
		}

		public function setSize(width : Number, height : Number) : void {
			this.width = width;
			this.height = height;
		}

		public function getWidth() : Number {
			return width;
		}

		public function getHeight() : Number {
			return height;
		}

		public function initialize() : void {
			waveEmitter.setX(width * 0.5);
			waveEmitter.setY(height * 0.5);
			waveEmitter.setVX((Math.random() * emitterMaxVX) - (emitterMaxVX * 0.5));
			waveEmitter.setVY((Math.random() * emitterMaxVY) - (emitterMaxVY * 0.5));
			waves.length = 0;
		}
		
	}
}
