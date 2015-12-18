/**
 * Created by Den on 16/09/15.
 */
var text = document.getElementById("firstString");
var number = document.getElementById("number");
var checkValidate = function() {
    if(text.value.isEqual("")){
        text.setCustomValidity("Введите строку");
    } else {
        text.setCustomValidity("");
    }
    if(number.value<0){
        number.setCustomValidity("Число не должно быть отрицательным");
    } else if(number.value > text.value.length){
        number.setCustomValidity("Число не должно превосходить кол-во символов строки");
    } else{
        number.setCustomValidity("");
    }
};
text.addEventListener("change", checkValidate, false);
number.addEventListener("change", checkValidate, false);

var form = document.getElementById("myForm");
form.addEventListener("change", function() {
    checkValidate();
    if(!this.checkValidity()){
        event.preventDefault();
    }
}, false);