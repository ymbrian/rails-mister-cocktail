// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require select2-full
//= require_tree .

$(document).on('ready turbolinks:load', function() {
  $( "#dose_ingredient_id" ).select2({
    // placeholder: "Select an ingredient",
    theme: "classic"
  });
  // $("#autocomplete_ingredient").on('keyup', function(e) {
  //   console.log()
  //   $.get('/ingredients/autocomplete', {query: $(this).val()}, function(data) {
  //     console.log("data is ", data)
  //   })
  // })

  // $("#autocomplete_ingredient").select2({
  //   ajax: {
  //     url: "/ingredients/autocomplete",
  //     dataType: 'json',
  //     delay: 250,
  //     data: function (params) {
  //       // return console.log("params", params);
  //       return {query: params.term}
  //       // return {
  //       //   q: params.term, // search term
  //       //   page: params.page
  //       // };
  //     },
  //     processResults: function (data, params) {
  //       console.log("data is ", data)
  //       // console.log("params is ", params)
  //       // parse the results into the format expected by Select2
  //       // since we are using custom formatting functions we do not need to
  //       // alter the remote JSON data, except to indicate that infinite
  //       // scrolling can be used
  //       // params.page = params.page || 1;

  //       return {
  //         results: data.results,
  //         // pagination: {
  //         //   more: (params.page * 30) < data.total_count
  //         // }
  //       };
  //     },
  //     // cache: true
  //   },
  // // templateResult: formatRepo, // omitted for brevity, see the source of this page
  // // templateSelection: formatRepoSelection // omitted for brevity, see the source of this page
  // });
});
