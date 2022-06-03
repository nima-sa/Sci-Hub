const isChrome = !window["browser"] && !!chrome;
const browser = isChrome ? chrome : window["browser"];

function sendMessageToContent(message) {
    browser.tabs.query({ active: true }).then(function (currentTabs) {
        if (currentTabs[0].id >= 0) {
            browser.tabs.sendMessage(currentTabs[0].id, message);
        }
    });
}

function onSelectElementClicked() {
    browser.runtime.sendNativeMessage("application.id", {request: "sci-hub path"}, function(response) {
        let url = response["url"]
        sendMessageToContent({
            request: "redirectToScihub",
            args: [url]
        });
    });
    window.close();
}


document.getElementById("btn").addEventListener("click", onSelectElementClicked);
let a = setTimeout(() => {
    onSelectElementClicked();
    clearTimeout(a);
}, 0.1);
