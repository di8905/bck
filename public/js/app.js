$(document).ready(function(){
  $("button").click(function(){
    $("#div1").load("/play",function(responseTxt,statusTxt,xhr){
      /* if(statusTxt=="success") alert("External content loaded successfully!"); */
      if(statusTxt=="error")
        alert("Error: "+xhr.status+": "+xhr.statusText);
    });
  });
  $("#number_input").on("change paste keyup", function () {
    $.ajax({
      url: "/find",
      type: "get",
      data: {number: $(this).val()},
      success: function (response) { $('#result').text(response) },
      erros: function (xhr) {}
    });
  });
});

