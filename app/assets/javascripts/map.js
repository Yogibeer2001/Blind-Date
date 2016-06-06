// api key = AIzaSyCLgiN4FsgQpX5qKRkstK0I8nk1AydYW-4
// <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCLgiN4FsgQpX5qKRkstK0I8nk1AydYW-4&callback=initMap" async defer>

function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {zoom: 10});
        var geocoder = new google.maps.Geocoder;
        geocoder.geocode({'address': userLocation,}, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            new google.maps.Marker({
              map: map,
              position: results[0].geometry.location
            });
          } else {
            window.alert('Geocode was not successful for the following reason: ' +
                status);
          }
        });
      }
