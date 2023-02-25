# WebFetch

WebFetch is a Swift package for fetching data from a web API. It provides a convenient method for fetching JSON data from a given URL. `WebFetch` provides one public method, `fetch`, which takes a URL as input parameter. This makes it easy to use and understand.

WebFetch has no external dependencies. It only relies on the built-in Foundation framework, which makes it easy to integrate into any Swift project without worrying about managing external dependencies.

### Installation

You can install WebFetch using Swift Package Manager. Add the following line to your `Package.swift` file:

```swift
.package(url: "https://github.com/ishaanbedi/WebFetch.git", from: "1.0.0")
```

### Usage

To use WebFetch, simply create an instance of the `WebFetch` class and call its `fetch` method with the URL of the API and a completion handler. The completion handler will be called with a `Result<Any, Error>` object containing either the fetched data or an error.

```swift
let fetcher = WebFetch()
fetcher.fetch(url: "https://example.com/api/data") { result in
    switch result {
    case .success(let json):
        print(json)
    case .failure(let error):
        print(error)
    }
}
```

If the URL is invalid or no data is returned from the API, the completion handler will be called with an appropriate error.

### Using WebFetch in a SwiftUI Application

To use WebFetch in a SwiftUI application, you can create an instance of the `WebFetch` class in your SwiftUI view and call its `fetch` method to retrieve data from the API. You can then use the retrieved data to update your view.

Here's an example of how to use WebFetch in a SwiftUI view:

```swift
import SwiftUI
import WebFetch

struct ContentView: View {
    @State var data: Any?

    var body: some View {
        VStack {
            if let data = data {
                Text("Data: \(data)")
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            let fetcher = WebFetch()
            fetcher.fetch(url: "https://example.com/api/data") { result in
                switch result {
                case .success(let json):
                    self.data = json
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
```

Note: It's important to handle the JSON data returned by the API properly, as the structure and content of the JSON data can vary depending on the API you're using. The above code snippet is just an example of how to use WebFetch in a SwiftUI application. The code snippet does not handle the JSON data returned by the API properly.

Check out the [Kanye-Said-WebFetch-Example](https://github.com/ishaanbedi/Kanye-Said-WebFetch-Example) example application to learn how to use `WebFetch` to retrieve a random Kanye West quote from an API and display it in a SwiftUI view.

Link: https://github.com/ishaanbedi/Kanye-Said-WebFetch-Example


When using `WebFetch` in a SwiftUI application, make sure to parse the JSON data returned by the API properly and handle any errors that may occur during the process by keeping in mind that the `fetch` method of the `WebFetch` class returns a `Result<Data, Error>` object, where Data represents the raw data returned by the API and Error represents any error that occurred during the fetch operation and how you can manipulate this structure and the raw data returned by the API to extract the data you need as per the requirements of your application using your understanding of Swift and JSON logic.

### License

WebFetch is released under the MIT license. See [LICENSE](LICENSE) for details.
