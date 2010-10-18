package {
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
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
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 30;

			var S : Number = 10;
			var WAVE_TTL : int = 200;
			var EMITTER_VY : Number = Math.random() * S - (S * 0.5);
			var EMITTER_VX : Number = Math.random() * S - (S * 0.5);
			var K : Number = Math.random() * S - (S * 0.5);

			var dopplerSimulation : DopplerSimulation = new DopplerSimulation();
			dopplerSimulation.setSize(stage.stageWidth, stage.stageHeight);
			dopplerSimulation.setWaveTTL(WAVE_TTL);

			var emitter : WaveEmitter = dopplerSimulation.getWaveEmitter();
			emitter.setVX(EMITTER_VX);
			emitter.setVY(EMITTER_VY);

			addEventListener(Event.ENTER_FRAME, function() : void {
				dopplerSimulation.stepForward();
				var waves : Vector.<Wave> = dopplerSimulation.getWaves();
				graphics.clear();
				for each (var wave : Wave in waves) {
					graphics.lineStyle(0, 0x000000, wave.getTTL() / WAVE_TTL);
					graphics.drawCircle(wave.getX(), wave.getY(), wave.getAge() * K);
				}
			});

			stage.addEventListener(MouseEvent.CLICK, function() : void {
				emitter.setVX((mouseX / 500) * S);
				emitter.setVY((mouseY / 500) * S);
			});

			stage.addEventListener(Event.RESIZE, function() : void {
				dopplerSimulation.setSize(stage.stageWidth, stage.stageHeight);
			});
		}
	}
}
