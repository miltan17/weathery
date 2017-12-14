

import Foundation

class CurrentWeather{
    
    var temperature: Double?
    var humidity: Int?
    var summary: String?
    var precipProbability: Int?
    
    init(weatherDictionary: [String: Any]) {
        temperature = weatherDictionary[WeatherKeys.temperature] as? Double
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double{
            humidity = Int(humidityDouble * 100)
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double{
            precipProbability = Int(precipDouble * 100)
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
    }
 }

struct WeatherKeys {
    static let temperature = "temperature"
    static let humidity = "humidity"
    static let precipProbability = "precipProbability"
    static let summary = "summary"
}


/*
 {
 "time": 1509993277,
 "summary": "Drizzle",
 "icon": "rain",
 "nearestStormDistance": 0,
 "precipIntensity": 0.0089,
 "precipIntensityError": 0.0046,
 "precipProbability": 0.9,
 "precipType": "rain",
 "temperature": 66.1,
 "apparentTemperature": 66.31,
 "dewPoint": 60.77,
 "humidity": 0.83,
 "pressure": 1010.34,
 "windSpeed": 5.59,
 "windGust": 12.03,
 "windBearing": 246,
 "cloudCover": 0.7,
 "uvIndex": 1,
 "visibility": 9.84,
 "ozone": 267.44
 }
 
 */
