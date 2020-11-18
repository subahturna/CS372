window.onload = function() {
  document.getElementById("search-form").onsubmit = function() {
    var search = document.getElementById("search-field").value;

    if (search == '') {
      alert("Please enter a value in the search field");
    } else {
      var req_url = "https://www.googleapis.com/books/v1/volumes?q=" + search;
      var req = new XMLHttpRequest();
      req.open("GET", req_url, false);
      req.send(null);
      console.log(req.responseText);
    }
    
    return false;
  }
}
