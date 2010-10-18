package tests.doppler {
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertNotNull;

	import doppler.Wave;
	import doppler.WaveEmitter;

	public class WaveEmitterTest {
		private var waveEmitter : WaveEmitter;

		[Before]
		public function setUp() : void {
			waveEmitter = new WaveEmitter();
		}

		[After]
		public function tearDown() : void {
			waveEmitter = null;
		}

		[Test]
		public function create() : void {
			assertNotNull(waveEmitter);
			assertEquals(0, waveEmitter.getX());
			assertEquals(0, waveEmitter.getY());
			assertEquals(0, waveEmitter.getVX());
			assertEquals(0, waveEmitter.getVY());
		}

		[Test]
		public function setX() : void {
			waveEmitter.setX(10.5);
			assertEquals(10.5, waveEmitter.getX());
			waveEmitter.setX(20.5);
			assertEquals(20.5, waveEmitter.getX());
		}

		[Test]
		public function setY() : void {
			waveEmitter.setY(10.5);
			assertEquals(10.5, waveEmitter.getY());
			waveEmitter.setY(10.50);
			assertEquals(10.50, waveEmitter.getY());
		}

		[Test]
		public function setVX() : void {
			waveEmitter.setVX(10.5);
			assertEquals(10.5, waveEmitter.getVX());
			waveEmitter.setVX(10.50);
			assertEquals(10.50, waveEmitter.getVX());
		}

		[Test]
		public function setVY() : void {
			waveEmitter.setVY(10.5);
			assertEquals(10.5, waveEmitter.getVY());
			waveEmitter.setVY(-10.50);
			assertEquals(-10.50, waveEmitter.getVY());
		}

		[Test]
		public function emitt() : void {
			assertNotNull(waveEmitter.emitt());
			waveEmitter.setX(1);
			waveEmitter.setY(2);
			waveEmitter.setVX(3);
			waveEmitter.setVY(4);
			var wave : Wave = waveEmitter.emitt();
			assertEquals(1, wave.getX());
			assertEquals(2, wave.getY());
			assertEquals(3, wave.getVX());
			assertEquals(4, wave.getVY());
		}

		[Test]
		public function move():void {
			waveEmitter.setX(10);
			waveEmitter.setY(20);
			waveEmitter.setVX(5);
			waveEmitter.setVY(5);
			waveEmitter.move();
			assertEquals(15, waveEmitter.getX());			assertEquals(25, waveEmitter.getY());
		}
	}
}
