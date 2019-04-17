import Foundation

struct AppStoreClient
{
    func fetchApps(withTerm term: String, inEntity entity: String, completion: @escaping ([App]?) -> Void)
    {
        print("2")
       
        let searchEndpoint = AppStoreEndpoint.search(term: term, entity: entity)
        let searchUrlRequest = searchEndpoint.request
        
       
        let networkProcessor = NetworkProcessor(request: searchUrlRequest)
        networkProcessor.downloadJSON { (jsonResponse, httpResponse, error) in
            
            
            DispatchQueue.main.async {
                // 3. get the array of app dictionaries
                guard let json = jsonResponse,
                    let resultDictionaries = json["results"] as? [[String : Any]] else {
                        completion(nil)
                        return
                }
                print("Hello")
                print(resultDictionaries)
                
                // 4. create an array of apps
                let apps = resultDictionaries.flatMap({ appDictionary in
                    return App(dictionary: appDictionary)
                })
                print("Hello")
                print(apps)
                
                
                completion(apps)
            }
        }
    }
}
