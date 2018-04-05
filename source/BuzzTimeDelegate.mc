//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi as Ui;

class InputDelegate extends Ui.BehaviorDelegate {

    function initialize() {
        Ui.BehaviorDelegate.initialize();
    }

    function onNextPage() {
    	     Ui.pushView(new Rez.Menus.BuzzTimeMenu(), new BuzzTimeMenuDelegate(), Ui.SLIDE_UP);
	     return true;
    }
}
