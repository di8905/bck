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
  $.fn.inputFilter = function(inputFilter) {
    return this.on("input keydown keyup mousedown mouseup select contextmenu drop", function() {
      if (inputFilter(this.value)) {
        this.oldValue = this.value;
        this.oldSelectionStart = this.selectionStart;
        this.oldSelectionEnd = this.selectionEnd;
      } else if (this.hasOwnProperty("oldValue")) {
        this.value = this.oldValue;
        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
      } else {
        this.value = "";
      }
    });
  };
  $("#number_input").inputFilter(function(value) { return /^-?\d*$/.test(value); });

});
