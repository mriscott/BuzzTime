//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi as Ui;

class BuzzTimeMenuDelegate extends Ui.MenuInputDelegate {
    function onMenuItem(item) {
        var period=0;
        if (item == :m5) {
            period=5;
        } else if (item == :m10) {
            period=10;
        } else if (item == :m15) {
            period=15;
        } else if (item == :m20) {
            period=20;
        } else if (item == :m30) {
            period=30;
        } else if (item == :m60) {
            period=60;
        }
	if (period!=0) {
	Application.getApp().setPeriod(period);
	}
    }
}
