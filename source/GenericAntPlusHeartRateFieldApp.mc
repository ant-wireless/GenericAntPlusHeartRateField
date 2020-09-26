using Toybox.Application;

class GenericAntPlusHeartRateFieldApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
        return false;
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
        return false;
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new GenericAntPlusHeartRateFieldView() ];
    }
    
    // Triggered by settings change in GCM
    function onSettingsChanged() { 
	     HeartRateSensor.getInstance().pair();
	}
	
	function getSettingsView() {
		return [ new AppSettingsView(), new AppSettingsDelegate() ];
	}
}
