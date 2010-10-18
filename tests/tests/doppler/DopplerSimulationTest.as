package tests.doppler {
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertNotNull;
	import asunit.asserts.assertNotSame;

	import doppler.DopplerSimulation;
	import doppler.WaveEmitter;

	public class DopplerSimulationTest {
		private var dopplerSimulation : DopplerSimulation;

		[Before]
		public function setUp() : void {
			dopplerSimulation = new DopplerSimulation();
		}

		[After]
		public function tearDown() : void {
			dopplerSimulation = null;
		}

		[Test]
		public function create() : void {
			assertNotNull(dopplerSimulation);
			assertEquals(0, dopplerSimulation.getWaveTTL());
			assertEquals(0, dopplerSimulation.getWidth());
			assertEquals(0, dopplerSimulation.getHeight());
		}

		[Test]
		public function setTTL() : void {
			dopplerSimulation.setWaveTTL(100);
			assertEquals(100, dopplerSimulation.getWaveTTL());
			dopplerSimulation.setWaveTTL(200);
			assertEquals(200, dopplerSimulation.getWaveTTL());
			dopplerSimulation.setWaveTTL(-100);
			assertEquals(0, dopplerSimulation.getWaveTTL());
		}

		[Test]
		public function setSize():void {
			dopplerSimulation.setSize(100, 200);
			assertEquals(100, dopplerSimulation.getWidth());
			assertEquals(200, dopplerSimulation.getHeight());
			dopplerSimulation.setSize(99, 1245);
			assertEquals(99, dopplerSimulation.getWidth());
			assertEquals(1245, dopplerSimulation.getHeight());
		}

		[Test]
		public function getWaveEmitter():void {
			dopplerSimulation.setSize(100, 100);
			var waveEmitter : WaveEmitter = dopplerSimulation.getWaveEmitter();
			assertNotNull("la simulation retourne dans tous les cas un wave emitter", waveEmitter);
		}

		[Test]
		public function getWaves():void {
			assertEquals("il doit y a voir 0 element au lancement de la simulation", 0, dopplerSimulation.getWaves().length);
		}

		[Test]
		public function stepForward():void {
			dopplerSimulation.setSize(100, 100);
			dopplerSimulation.setWaveTTL(10);
			dopplerSimulation.stepForward();
			assertEquals("a chaque étape une onde est émise et ajoutée au tableau des ondes", 1, dopplerSimulation.getWaves().length);
			assertEquals("le TTL de l'onde créée doit être égale au TTL definit dans la simulation", 10, dopplerSimulation.getWaves()[0].getTTL());
			dopplerSimulation.stepForward();
			assertEquals("a chaque étape une onde est émise et ajoutée au tableau des ondes", 2, dopplerSimulation.getWaves().length);
			assertEquals("la premiere onde émise doit avoir son ttl réduit de 1", 9, dopplerSimulation.getWaves()[0].getTTL());
			dopplerSimulation.stepForward();
			assertEquals(8, dopplerSimulation.getWaves()[0].getTTL());
			assertEquals(9, dopplerSimulation.getWaves()[1].getTTL());
			dopplerSimulation.stepForward();
			dopplerSimulation.stepForward();
			dopplerSimulation.stepForward();
			dopplerSimulation.stepForward();
			dopplerSimulation.stepForward();
			dopplerSimulation.stepForward();
			dopplerSimulation.stepForward();
			dopplerSimulation.stepForward();
			assertEquals("lorsque le TTL d'une onde tombe a 0 elle est retirée de la liste", 10, dopplerSimulation.getWaves().length);
			dopplerSimulation.stepForward();
			assertEquals(10, dopplerSimulation.getWaves().length);
			dopplerSimulation.stepForward();
			assertEquals(10, dopplerSimulation.getWaves().length);
			dopplerSimulation.stepForward();
			assertEquals(10, dopplerSimulation.getWaves().length);
			dopplerSimulation.initialize();
			assertEquals(0, dopplerSimulation.getWaves().length);
			var prevX : Number = dopplerSimulation.getWaveEmitter().getX();
			var prevY : Number = dopplerSimulation.getWaveEmitter().getY();
			dopplerSimulation.stepForward();
			assertEquals("Le wave emitter doit ce déplacer de sa valeur VX", prevX + dopplerSimulation.getWaveEmitter().getVX(), dopplerSimulation.getWaveEmitter().getX());
			assertEquals("Le wave emitter doit ce déplacer de sa valeur VY", prevY + dopplerSimulation.getWaveEmitter().getVY(), dopplerSimulation.getWaveEmitter().getY());
			assertEquals("l'onde emise doit être a la nouvelle position du wave emitter", dopplerSimulation.getWaves()[0].getX(), dopplerSimulation.getWaveEmitter().getX());
			assertEquals("l'onde emise doit être a la nouvelle position du wave emitter", dopplerSimulation.getWaves()[0].getY(), dopplerSimulation.getWaveEmitter().getY());
			dopplerSimulation.getWaveEmitter().setX(500);
			dopplerSimulation.getWaveEmitter().setY(500);
			var prevVX : Number = dopplerSimulation.getWaveEmitter().getVX();
			var prevVY : Number = dopplerSimulation.getWaveEmitter().getVY();
			dopplerSimulation.stepForward();
			assertEquals("si la position X est plus grande que la largeur du simulateur, la valeur VX est inversée", prevVX, -dopplerSimulation.getWaveEmitter().getVX());
			assertEquals("si la position Y est plus grande que la hauteur du simulateur, la valeur VY est inversée", prevVY, -dopplerSimulation.getWaveEmitter().getVY());
			assertEquals("la position x est ajustée si elle est plus grande que la largeur du simulateur", 100, dopplerSimulation.getWaveEmitter().getX());
			assertEquals("la position y est ajustée si elle est plus grande que la hauteur du simulateur", 100, dopplerSimulation.getWaveEmitter().getY());
			dopplerSimulation.getWaveEmitter().setX(-10);
			dopplerSimulation.getWaveEmitter().setY(-10);
			prevVX = dopplerSimulation.getWaveEmitter().getVX();
			prevVY = dopplerSimulation.getWaveEmitter().getVY();
			dopplerSimulation.stepForward();
			assertEquals("si la position X est plus petite que 0, la valeur VX est inversée", prevVX, -dopplerSimulation.getWaveEmitter().getVX());
			assertEquals("si la position Y est plus petite que 0, la valeur VY est inversée", prevVY, -dopplerSimulation.getWaveEmitter().getVY());
			assertEquals("la position X du WaveEmitter est ajustée sur 0 si elle est inferieur a 0", 0, dopplerSimulation.getWaveEmitter().getX());
			assertEquals("la position Y du WaveEmitter est ajustée sur 0 si elle est inferieur a 0", 0, dopplerSimulation.getWaveEmitter().getY());
		}

		[Test]
		public function initialize():void {
			dopplerSimulation.setSize(100, 240);
			dopplerSimulation.initialize();
			assertEquals("Apres initialisation, l'émetteur est placé au centre de la scene", 50, dopplerSimulation.getWaveEmitter().getX());
			assertEquals("Apres initialisation, l'émetteur est placé au centre de la scene", 120, dopplerSimulation.getWaveEmitter().getY());
			var prevVX : Number = dopplerSimulation.getWaveEmitter().getVX();
			var prevVY : Number = dopplerSimulation.getWaveEmitter().getVY();
			// initialize() peux être appelé plusieurs fois.
			dopplerSimulation.initialize();
			assertNotSame("Apres l'initialisation, l'éméteur a un nouveau VX", prevVX, dopplerSimulation.getWaveEmitter().getVX());
			assertNotSame("Apres l'initialisation, l'éméteur a un nouveau VY", prevVY, dopplerSimulation.getWaveEmitter().getVY());
		}
	}
}
