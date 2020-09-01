using Toybox.Application;
using GenericChannelHeartRateBarrel as HrBarrel;

class HeartRateSensor {

	hidden var mHrChannel = null;
    
    hidden static var instance = null;
    static function getInstance() {
        if(instance == null) {
            instance = new HeartRateSensor();
        }
        return instance;
	}
	
	private function initialize() {
	}
	
	function pair() {
	
		if(mHrChannel != null) {
			mHrChannel.release();
			mHrChannel = null;
		}
	
        var deviceNumber = Application.getApp().getProperty("deviceNumber");
        var proximityPairing = Application.getApp().getProperty("proximityPairing");

        mHrChannel = new HrBarrel.AntPlusHeartRateSensor(deviceNumber, proximityPairing);
        mHrChannel.open();
	}
	
	function getHeartRate() {
        return mHrChannel.data.computedHeartRate;
    }
}
