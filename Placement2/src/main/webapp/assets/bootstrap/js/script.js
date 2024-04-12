function handleSelection(selectionType) {
    var selectedOption = document.getElementById(selectionType + "Dropdown").value;
    if (selectionType === "store") {
        // Do something with the selected store option, if needed
    }
}

function saveSelection() {
    var town = document.getElementById("townDropdown").value;
    var store = document.getElementById("storeDropdown").value;
    var rank = document.getElementById("rankDropdown").value;
    var product = document.getElementById("productDropdown").value;
    var facings = document.getElementById("additionalInfoInput").value;

    // Make an AJAX call to send the data to the server
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "saveSelection", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // Handle the response if needed
            console.log(xhr.responseText);
        }
    };
    var data = "town=" + encodeURIComponent(town) + "&store=" + encodeURIComponent(store) + "&rank=" + encodeURIComponent(rank) + "&product=" + encodeURIComponent(product) + "&additionalInfo=" + encodeURIComponent(facings);
    xhr.send(data);
}/**
 * 
 */