$(document).ready(function(){
  $("#field").keypress(function( event ) {
  if (event.keyCode == 13) {
     event.preventDefault();
     var input = $(this).val();
     saveItemToList(input);
     clearInputField();
   }
 });
})

function saveItemToList(input){
  $.post(
          "/item/new",
          { name: $('#field').val(), list_id: $("#id").val() },
          function(data) {
            addItemToPage(input, data.id);
          }
       );
}

function clearInputField(){
  $('#field').val("");
}

function addItemToPage(input, id){
    var div = $("<div id=" + id + "></div>")
    var label = $("<label>").text(input + " ");
    var button = $('<button/>',
        { text: 'Delete',
          click: function (e) {
            e.preventDefault();
            $.post(
              "/item/delete",
              { item_id: id},
              function(innerData) {
                deleteItemFromPage(innerData.id);
              }
            );
        }
      });
    $("#list").append(div);
    $("#" + id).append(label);
    $("#" + id).append(button.addClass("btn-default"));
}

function deleteItemFromPage(id) {
 $("#" + id).remove();
}
