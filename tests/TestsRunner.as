package {
	import asunit.core.TextCore;

	import flash.display.Sprite;

	public class TestsRunner extends Sprite {

		private var textCore : TextCore;

		public function TestsRunner() {
			textCore = new TextCore();
			textCore.start(AllTests, null, this);			
		}
	}
}
