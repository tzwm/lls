// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  var visited_time = $.now();

  var getOnlineTime = function() {
    return Math.floor(($.now() - visited_time) / 1000 / 60);
  };

  $(window).unload(function() {
    var container = $('#logined-text');
    if (!container.length) {
      return;
    }

    var sign_in_time = getOnlineTime();

    $.ajax({
      method: "post",
      url: "/users/add_sign_in_time",
      data: {
        sign_in_time: sign_in_time
      },
      async : false
    });
  });


  var setOnlineTime = function() {
    var container = $('#online-time');
    if (container.length) {
      container.text(getOnlineTime());
    }
  };

  setInterval(setOnlineTime, 1000);

});
