

import Foundation

class NetworkProcessor{
    
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    
    var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONDictionaryHandler = (([String: Any]?) -> Void)
    
    func downloadJSONFromURL(_ completion: @escaping JSONDictionaryHandler){
        let request = URLRequest(url: self.url)
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil{
                
                if let HTTPResponse = response as? HTTPURLResponse{
                    switch HTTPResponse.statusCode{
                    case 200:
                        if let data = data{
                            do{
                                let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                completion(jsonDictionary as? [String: Any])
                            }catch let error as NSError{
                                print("Error processing json data: \(error.localizedDescription)")
                            }
                        }
                        
                    default:
                        print("Status Code: \(HTTPResponse.statusCode)")
                    }
                }
            }else{
                print("Error \(error?.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}
