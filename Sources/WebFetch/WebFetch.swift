import Foundation
class WebFetch {
    /// - Parameters:
    ///   - url: The URL of the web API to fetch data from
    ///   - completion: The completion handler to call with the fetched data or an error
    func fetch(url: String, completion: @escaping (Result<Any, Error>) -> Void) {
        guard let url = URL(string: url) else {
            let error = NSError(domain: "com.example.app", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "com.example.app", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data returned from API"])
                completion(.failure(error))
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                completion(.success(json))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
