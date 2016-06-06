
$(document).ready(function() {
  loadWeather(userLocation,''); //@params location, woeid
});

function loadWeather(location, woeid) {
  $.simpleWeather({
    location: location,
    woeid: woeid,
    unit: 'c',
    success: function(weather) {
      html = '<h3><i class="icon-'+weather.code+'"></i> '+weather.temp+'&deg;'+weather.units.temp+'</h3>';
      html += '<ul><li>Location: '+weather.city+', '+weather.region+'</li>';
      html += '<li class="currently"> Sky: '+weather.currently+'</li>';
      html += '<li>Wind: '+weather.wind.direction+' '+weather.wind.speed+' '+weather.units.speed+'</li></ul>';

      $("#weather").html(html);
    },
    error: function(error) {
      $("#weather").html('<p>'+error+'</p>');
    }
  });
}
