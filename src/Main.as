package {
	import flash.events.MouseEvent;
	import flash.display.StageQuality;

	import doppler.Wave;

	import flash.events.Event;

	import doppler.WaveEmitter;
	import doppler.DopplerSimulation;

	import flash.display.Sprite;

	public class Main extends Sprite {
		public function Main() {
			stage.quality = StageQuality.LOW;
			stage.frameRate = 52;
			var S : Number = 10;
			var WAVE_TTL : int = 200;
			var EMITTER_VY : Number = Math.random() * S - (S * 0.5);
			var EMITTER_VX : Number = Math.random() * S - (S * 0.5);
			var K : Number = Math.random() * S - (S * 0.5);

			var dopplerSimulation : DopplerSimulation = new DopplerSimulation();
			dopplerSimulation.setSize(500, 500);
			dopplerSimulation.setWaveTTL(WAVE_TTL);
			var emitter : WaveEmitter = dopplerSimulation.getWaveEmitter();
			emitter.setVX(EMITTER_VX);
			emitter.setVY(EMITTER_VY);
			//
			addEventListener(Event.ENTER_FRAME, function():void {
				dopplerSimulation.stepForward();
				var waves : Vector.<Wave> = dopplerSimulation.getWaves();
				graphics.clear();
				for each (var wave : Wave in waves) {
					graphics.lineStyle(0, 0, wave.getTTL() / WAVE_TTL);
					graphics.drawCircle(wave.getX(), wave.getY(), wave.getAge()*K);
				}
			});
			stage.addEventListener(MouseEvent.CLICK, function():void {
				emitter.setVX((mouseX / 500) * S);
				emitter.setVY((mouseY / 500) * S);
			});
		}
	}
}
