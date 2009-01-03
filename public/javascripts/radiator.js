// 
// radiator frame control
//

var urls = new Array(
    "http://www.google.com", 
    "http://www.lonelyplanet.com"
    );
var nextUrlIndex = 0;

function nextUrl() {
    showUrl(urls[nextUrlIndex]);
    nextUrlIndex++;
    if (nextUrlIndex > urls.length) { nextUrlIndex = 0 };
    window.setTimeout(function() {
        nextUrl();
    }, 3000);
}

function showUrl(url) {
    $("#radiator_frame").attr("src", url);
}

//
// build status monitor
//

function updateBuildStatuses() {
    json = $.getJSON("/build_plans.json", function(results) {
        div = $("<div><ul></ul></div>");
        combined_status = "green";
        $.each(results, function(i, result) {
            build_plan = result.build_plan;
            li = $("<li>" + build_plan.name + "</li>").addClass("buildStatus").addClass(build_plan.status + "Status");
            div.append(li);
            if (build_plan.status == "red") {
                combined_status = "red";
            }
        });
        $("#build_statuses").children().remove();
        $("#build_statuses").append(div);
        $("#build_statuses").addClass(combined_status + "BodyStatus");
    });
    window.setTimeout(function() {
        updateBuildStatuses();
    }, 5000);
}

//
// initialize
//

function initialize_radiator() {
    //nextUrl();
    updateBuildStatuses();
}


