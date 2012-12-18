$(document).ready(function() {
  initPlayer();
  
  $('img').click(function() {
    var videoId = $(this).attr('data-youtube');
    play(videoId);
  });
  
});

function initPlayer(){
	jQuery("#player").tubeplayer({
		width: 560,
		height:315,
    showControls: 0, // whether the player should have the controls visible, 0 or 1
    showRelated: 0, // show the related videos when the player ends, 0 or 1 
    autoPlay: false, // whether the player should autoplay the video, 0 or 1
    autoHide: true, 
    showinfo: false, // if you want the player to include details about the video
    modestbranding: false, // specify to include/exclude the YouTube watermark
    wmode: "transparent", // note: transparent maintains z-index, but disables GPU acceleration
    swfobjectURL: "http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js",
    iframed: true, // iframed
		onPlayerPlaying: function(){}
	});
};

jQuery.tubeplayer.defaults.afterReady = function(){
	//jQuery("#player").tubeplayer("cue", " ");
};

function play() {
  jQuery("#player").tubeplayer("play");
};

function play(videoId) {
  if (videoId == "") {
    play();
  } else {
    stop();
    jQuery("#player").tubeplayer("play", videoId);
  }
};

function pause() {
  jQuery("#player").tubeplayer("pause");
};

function playAtTime(videoId, time) {
  if (videoId == "") {
    play();
  } else if (time == 0) {
    play(videoId);
  } else {
    jQuery("#player").tubeplayer("play", {id: videoId, time: time});
  }
};

function stop() {
  jQuery("#player").tubeplayer("stop");
};

function seek(amount) {
  jQuery("#player").tubeplayer("seek", amount);  
};

function mute() {
  jQuery("#player").tubeplayer("mute");  
};

function unmute() {
  jQuery("#player").tubeplayer("unmute");
};

function isMuted() {
  jQuery("#player").tubeplayer("isMuted");
};

function volume() {
  jQuery("#player").tubeplayer("volume");
};

function setVolume(amount) {
  jQuery("#player").tubeplayer("volume", amount);
};

function currentTrack() {
  jQuery("#player").tubeplayer("videoId");
};



