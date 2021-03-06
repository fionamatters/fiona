using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class flowerKeyApp extends App.AppBase {

	hidden var mView;
    //! onStart() is called on application start up
    function onStart() {
   // mView.color=Toybox.Graphics.COLOR_RED;
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    Sys.println("onStop");
    	saveView();
    }

	function setupView(){
	   var view=new flowerKeyView();
    	view.setupImages();
    	var value=getProperty("imgHistory");
    	if( (value instanceof (Toybox.Lang.Dictionary)) && value.hasKey("main")){
    	   	value["showing"]=null;
    		view.imgHistory=value;
    	}
    	else{
    	    view.setupImgHistory();
			saveView();
    	}
    	return view;
	}
	

    //! Return the initial view of your application here
    function getInitialView() {
    Sys.println("initial");
    mView=setupView();
     var mDelegate=new flowerKeyDelegate();
     mDelegate.attachView(mView);
    	
        return [ mView, mDelegate ];
    }
    
    function saveView(){
        	var value=mView.imgHistory;
    	    value["showing"]=null;
    		setProperty("imgHistory", value);
    		saveProperties();
    		Sys.println("value "+value);
    }  

}
