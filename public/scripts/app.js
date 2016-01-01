
//push input text onto array
//add input text onto page using jquery <li>
//clear input field
var items_in_list = [];

$(document).ready(function(){
  $("#field").keypress(function( event ) {
  if (event.keyCode == 13) {
     event.preventDefault();
     var input = $(this).val();
     pushInput(input);
     addItemToPage(input);
     clearInputField();
   }
 });

 $("#submit").click(function( event ) {
   $("#items").val(JSON.stringify(items_in_list));
 });


});

function pushInput(input){
  //TODO: - figure out duplicates
  items_in_list.push(input);
};

function addItemToPage(input){
  $("#list").append($("<li>").text(input));
};

function clearInputField(){
  $('#field').val("");
};
