var currentSlide = 0;

function changeSlide(direction) {
    if (direction == 1) {
        getSlide(currentSlide).style.display = "none";
        getSlide(++currentSlide).style.display = "block";
    } else {
        getSlide(currentSlide).style.display = "none";
        getSlide(--currentSlide).style.display = "block";
    }
}

function getSlide(n) {
    array = document.getElementsByClassName("slide");
    if (!array.length > 1) {
        return array[0];
    }
    if (n == array.length) {
        currentSlide = 0
        return array[currentSlide];
    }
    if (n == -1) {
        currentSlide = array.length-1
        return array[currentSlide];
    }
    return array[n];
}