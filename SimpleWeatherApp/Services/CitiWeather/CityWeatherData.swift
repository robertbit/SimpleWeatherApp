//
//  CitiWeatherData.swift
//  SimpleWeatherApp
//
//  Created by robert on 29/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation
import UIKit

class CityWeatherData{
    
    //supporting the following attributes:  city name, weather description, current weather icon, current temperature, today's low and high temperature
    private(set) var cityName:String?
    
    private(set) var weatherDescription:String?
    
    private(set) var currentWeatherIconID:String?
    
    private(set) var currentTemperature:Double?
    
    private(set) var todayLow:Double?
    
    private(set) var todayHigh:Double?
    
    var uiImage:UIImage?
    
    
    
    
    
    // fill the model from json map
    func fillModel(data:[AnyHashable: Any]){
        
        
        if let dataArray = data["weather"] as? [Any]{
            let data = dataArray.first
            
            if let valDict:[AnyHashable: Any] = (data as? [AnyHashable: Any]){
                self.weatherDescription = valDict["description"] as! String?
                self.currentWeatherIconID = valDict["icon"] as! String?
            }
        }else{
            NSLog("Failed to fill city details, couldnt find key \"Weather\" ")
        }
        
        if let dataMain = data["main"] as? [AnyHashable: Any]{
           
            self.currentTemperature = (dataMain["temp"] as! Double?)
            self.todayLow = dataMain["temp_min"] as! Double?
            self.todayHigh = dataMain["temp_max"] as! Double?
        }
        
        self.cityName = data["name"] as? String
        
        
    }
    
    
    
    
}
