//
//  CitiWeatherTest.swift
//  SimpleWeatherApp
//
//  Created by robert on 29/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//


import Foundation

import XCTest
@testable import SimpleWeatherApp

class CityWeatherTest: XCTestCase{
    
    
    
    func testCityWeatherFillData(){
        let util = LoadJsonUtil()
        let bundle = Bundle(for: type(of: self))
        if let data:[AnyHashable: Any] = util.loadFileData(fileName: "citiesWeatherTest",bundle: bundle){
            print("found city test data \(data)")
            let cityWeather:CityWeatherData = CityWeatherData()
            cityWeather.fillModel(data: data)
            
            // check that all the attributes were filled properly
            XCTAssertEqual(cityWeather.cityName, "London")
            XCTAssertEqual(cityWeather.currentTemperature,-1.55)
            XCTAssertEqual(cityWeather.currentWeatherIconID, "50n")
            XCTAssertEqual(cityWeather.todayHigh, 1)
            XCTAssertEqual(cityWeather.todayLow, -3)
            XCTAssertEqual(cityWeather.weatherDescription, "mist")
            
        }else{
            
            // failed to load the data from file
            XCTAssertTrue(false)
        }

        
        
        
    }
    
}
