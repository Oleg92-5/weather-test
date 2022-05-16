//
//  NetworkWeathrManager.swift
//  Weather_
//
//  Created by Олег Рубан on 12.04.2022.
//

import Foundation

struct NetworkWeathrManager {
    var apiKey = "67cfb488-04e3-4011-a6e6-e6e2ab14b6c2"
    
    func fetchWeather(latitude: Double, longitude: Double, completionHandler: @escaping (Weather) -> Void) {
        let url = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: url) else { return }

        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return }
            if let weather = self.parseJson(withData: data) {
                completionHandler(weather)
            }
//            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
    }
    
    func parseJson(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else {
                return nil
                
            }
            return weather
            
        } catch let error as NSError {
            print(error.localizedDescription)
            print(String(describing: error))
        }
        return nil
    }
}

