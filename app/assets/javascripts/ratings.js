// $(function(){
//   $('.button_to').on('submit',function(e){
//     e.preventDefault();
//     e.stopPropagation();
//     // What type of request should I fire and where should I fire it to?
//     var form_method = $(this).attr("method");
//     var form_action = $(this).attr("action");
//     // Fire the Request
//     $.ajax(form_action, {
//       type: form_method,
//       data: $(this).serialize(),
//       dataType: "script"
//     });
//   });
// });

$(function(){

  $('#cbp-spmenu-s1 a').click(function(e) {
    $(this).children().click();
  });
  
  $('#cbp-spmenu-s1 a span').click(function(e) {
    e.preventDefault();
    e.stopPropagation();
  });

  var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
      showLeft = document.getElementById( 'showLeft' ),
      body     = document.body;
   
  showLeft.onclick = function(e) {
      e.preventDefault();
      e.stopPropagation();
      classie.toggle( this, 'active' );
      classie.toggle( menuLeft, 'cbp-spmenu-open' );
      disableOther( 'showLeft' );
  };
   
  function disableOther( button ) {
      if( button !== 'showLeft' ) {
          classie.toggle( showLeft, 'disabled' );
      }
  }

  $('#list-footer').hide();

  $('#emailMe').on('click', function(){
    $('#list-footer').slideToggle();
    $(this).blur();
  });

});