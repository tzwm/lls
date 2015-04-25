// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var visited_time = $.now();

  $(window).unload(function() {
    var now = $.now();
  });


  var setOnlineTime = function() {
    var container = $('#online-time');
    var onlineTime = ($.now() - visited_time) / 1000 / 60;
    container.text(Math.floor(onlineTime));
  };

  setInterval(setOnlineTime, 1000);

});
