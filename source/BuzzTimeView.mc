//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Timer as Timer;

var timer1;
var lastvibe=1;
var period=20;

class BuzzTimeView extends Ui.View {

    
    function initialize() {
        Ui.View.initialize();
	period=Application.getApp().getProperty("period");	
    }

    function setPeriod(p) {
       period=p;
       Application.getApp().setProperty("period",p);
    }

    function callback1() {
        Ui.requestUpdate();
    }



    function onLayout(dc) {
        timer1 = new Timer.Timer();

        timer1.start(method(:callback1), 59000, true);
    }

    function onUpdate(dc) {
        var string;	

        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();

	var now=System.getClockTime();
	string = now.hour.format("%02d") + ":" + 
	   now.min.format("%02d") ;
	   	
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
	var font = Gfx.FONT_SYSTEM_NUMBER_THAI_HOT; 
        dc.drawText(dc.getWidth()/2, (dc.getHeight() / 2 - Gfx.getFontHeight(font)/2) ,font,  string, Gfx.TEXT_JUSTIFY_CENTER);
	font = Gfx.FONT_SYSTEM_SMALL; 
        dc.drawText(dc.getWidth()/2, (dc.getHeight() / 8 * 7 - Gfx.getFontHeight(font)/2) ,font,  "Buzztime: "+period, Gfx.TEXT_JUSTIFY_CENTER);

	if (now.min%period == 0 && lastvibe!=now.min) {
	   Attention.vibrate([new Attention.VibeProfile(100,2000)]);
	   lastvibe=now.min;
	}
    }

}
