//
//  ServiceProvicer.swift
//  SimpleWeatherApp
//
//  Created by robert on 01/12/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation

// this class behaves as a dependency injection abstraction, in real life it will be done by library like typhoon

class ServiceProvider{
    private(set) var cityWeatherService:CityWeatherService
    
    private(set) var citiesService:CitiesService
    
    private(set) var imageService:ImageService
    
    
    public init(){
        cityWeatherService = CityWeatherServiceImpl()
        citiesService = CitiesServiceImpl()
        imageService = ImageServiceImpl()
        
    }
    
    
}
