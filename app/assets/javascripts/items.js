function reviewButton(){
	$("#item-reviews-button").on("click", function(e){
		var itemId = $(this).attr("data-itemId")
		$.ajax({
			url: "/items/" + itemId + "/reviews",
			dataType: 'script'	
		})
		e.preventDefault();
	})
}

function detailButton(){
	$("#item-detail-button").on("click", function(e){
		var itemId = $(this).attr("data-itemId")
		$.ajax({
			url: "/items/" + itemId,
			dataType: 'script'	
		})
		e.preventDefault();
	})
}

$( document ).on('turbolinks:load', function() {
  reviewButton();
	detailButton();
})
