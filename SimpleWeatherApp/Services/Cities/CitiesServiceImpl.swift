//
//  CitiesServiceImpl.swift
//  SimpleWeatherApp
//
//  Created by robert on 28/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation

class CitiesServiceImpl:CitiesService{
    
    private var cities:Array<Citi>?
    
    // abstraction for object that will get the loaded cities data
    private var citiLoader:CitiDataLoader
    
    init(){
        citiLoader = CitiDataLoader()
        cities = citiLoader.loadCitiData()?.sorted(by: {$0.0.name<$0.1.name})
    
    }
    
    func getCities()->Array<Citi>?{
        
        return cities
    }
    
    
    
 
    
    
      
}
