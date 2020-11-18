window.onload = function() {
  document.getElementById("search-form").onsubmit = function() {
    var search = document.getElementById("search-field").value;

    if (search == '') {
      alert("Please enter a value in the search field");
    } else {      
      var req_url = "https://www.googleapis.com/books/v1/volumes?q=isbn:" + search;
      var req = new XMLHttpRequest();

      req.onreadystatechange = function() {    
        if (this.readyState == 4 && this.status == 200) {
          var obj = JSON.parse(this.responseText);
          console.log(obj);          

          var authors = obj.items[0].volumeInfo.authors[0];
          var title = obj.items[0].volumeInfo.title;
          
          document.getElementById("author").innerHTML = authors;
          document.getElementById("title").innerHTML = title;
          document.getElementById("cover").src = cover;
        }    
      };

      req.open("GET", req_url, false);
      req.send();
    }
    
    return false;
  }
}
