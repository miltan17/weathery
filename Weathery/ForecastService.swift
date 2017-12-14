
import Foundation


class ForecastService{
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init() {
        self.forecastAPIKey = "e1c9196a907fccdc1f7d7f17f5e279f2"
        self.forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(self.forecastAPIKey)")
    }
    
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void){
        
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)"){
            
            let networkProcessor = NetworkProcessor(url: forecastURL)
            networkProcessor.downloadJSONFromURL({ (jsonDictionary) in
                
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: Any]{
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    completion(currentWeather)
                }else{
                    completion(nil)
                }
            })
        }
    }
    
}
