//
//  CityWeatherService.swift
//  SimpleWeatherApp
//
//  Created by robert on 30/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation


protocol CityWeatherService{
    
     func getCityWeatherData(cityID:String,onSuccess:@escaping(_ responseData:CityWeatherData,_ cityID:String)->Void,onError:@escaping (Error)->Void)
    
}
