

import Foundation


protocol HandleLocationSearch {
    func getWeatherFor(location: String, latitude: Double, longitude: Double)
}
