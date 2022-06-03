browser.runtime.onMessage.addListener((message, sender, sendResponse) => {
    let request = message['request']
    
    if(request === 'redirectToScihub') {
        let url = message['args'][0]
        let path = url + '/' + window.location.href
        window.location.href = path
    } else {
        console.log("Received request: ", request);
    }
});
