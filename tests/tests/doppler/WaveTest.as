package tests.doppler {
	import asunit.asserts.assertTrue;
	import asunit.asserts.assertThrows;
	import asunit.asserts.assertNotNull;
	import asunit.asserts.assertEquals;

	import doppler.Wave;

	public class WaveTest {
		private var wave : Wave;

		[Before]
		public function setUp() : void {
			wave = new Wave();
		}

		[After]
		public function tearDown() : void {
			wave = null;
		}

		[Test]
		public function create() : void {
			assertNotNull(wave);
			assertEquals(0, wave.getX());
			assertEquals(0, wave.getY());
			assertEquals(0, wave.getVX());
			assertEquals(0, wave.getVY());
		}

		[Test]
		public function setX() : void {
			wave.setX(10.5);
			assertEquals(10.5, wave.getX());
			wave.setX(-20.5);
			assertEquals(-20.5, wave.getX());
		}

		[Test]
		public function setY() : void {
			wave.setY(10.5);
			assertEquals(10.5, wave.getY());
			wave.setY(-20.5);
			assertEquals(-20.5, wave.getY());
		}

		[Test]
		public function setVX() : void {
			wave.setVX(10.5);
			assertEquals(10.5, wave.getVX());
			wave.setVX(-20.5);
			assertEquals(-20.5, wave.getVX());
		}

		[Test]
		public function setVY() : void {
			wave.setVY(10.5);
			assertEquals(10.5, wave.getVY());
			wave.setVY(-20.5);
			assertEquals(-20.5, wave.getVY());
		}

		[Test]
		public function setTTL() : void {
			wave.setTTL(100);
			assertEquals(100, wave.getTTL());
			wave.setTTL(10);
			assertEquals(10, wave.getTTL());
			wave.setTTL(-10);
			assertTrue(wave.getTTL()>=0);
		}

		[Test]
		public function getAge():void {
			wave.setTTL(100);
			wave.decreaseTTL();
			assertEquals(1, wave.getAge());
			wave.decreaseTTL();
			assertEquals(2, wave.getAge());
		}

		[Test]
		public function decreaseTTL():void {
			wave.setTTL(100);
			wave.decreaseTTL();
			assertEquals("un appel a la methode decrease TTL réduit de 1 la valeur du TTL", 99, wave.getTTL());
		}
	}
}
