//
//  Weather.swift
//  Weather_
//
//  Created by Олег Рубан on 12.04.2022.
//

import Foundation
import UIKit

class Weather {
    var name: String = ""
    var temperature: Int = 0
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    var condirionCode: String = ""
    var url: String = ""
    var condition: String = ""
    var presureMm: Int = 0
    var windSpeed: Double = 0.0
    var tempMin: Int = 0
    var tempMax: Int = 0
    var humidity: Int = 0
    var precType: Int = 0
    
    var conditionString: String {
        switch condition {
        case "clear"                    : return "ясно"
        case "partly-cloudy"            : return "малооблачно"
        case "cloudy"                   : return "облачно с прояснениями"
        case "overcast"                 : return "пасмурно"
        case "drizzle"                  : return "морось"
        case "light-rain"               : return "небольшой дождь"
        case "rain"                     : return "дождь"
        case "moderate-rain"            : return "умеренно сильный дождь"
        case "heavy-rain"               : return "сильный дождь"
        case "continuous-heavy-rain"    : return "длительный сильный дождь"
        case "showers"                  : return "ливень"
        case "wet-snow"                 : return "дождь со снегом"
        case "light-snow"               : return "небольшой снег"
        case "snow"                     : return "снег"
        case "snow-showers"             : return "снегопад"
        case "hail"                     : return "град"
        case "thunderstorm"             : return "гроза"
        case "thunderstorm-with-rain"   : return "дождь с грозой"
        case "thunderstorm-with-hail"   : return "гроза с градом"
        default:
            return "Загрузка..."
        }
    }
    
    var precTypeString: String {
        switch precType {
        case 0: return "без осадков"
        case 1: return "дождь"
        case 2: return "дождь со снегом"
        case 3: return "снег"
        case 4: return "град"
        default: return "Загрузка..."
        }
    }
    
    init?(weatherData: WeatherData) {
        temperature = weatherData.fact.temp
        condirionCode = weatherData.fact.icon
        url = weatherData.info.url
        condition = weatherData.fact.condition
        presureMm = weatherData.fact.pressureMm
        humidity = weatherData.fact.humidity
        
        windSpeed = weatherData.fact.windSpeed
        tempMin = weatherData.forecasts.first!.parts.day.tempMin!
        tempMax = weatherData.forecasts.first!.parts.day.tempMax!
        precType = weatherData.fact.precType
    }
    
    init() {
        
    }
}
