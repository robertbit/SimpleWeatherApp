//
//  CitiDataLoaderTest.swift
//  SimpleWeatherApp
//
//  Created by robert on 29/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation

import XCTest
@testable import SimpleWeatherApp


class CityDataLoaderTest: XCTestCase {
    
    func testLoader(){
        let dataLoader:CitiDataLoader = CitiDataLoader()
        
        guard let cities = dataLoader.loadCitiData()
        else{
            XCTAssertTrue(false)// fail the test
            return
        }
        
        XCTAssertTrue(cities.count > 10)
        
        // make sure that london is there and not empty
        var foundIt = false
        for citi in cities{
            if citi.name == "London" && citi.id == "2643743"{
                foundIt = true
            }
        }
        
        XCTAssertTrue(foundIt)
        
        
    }
    
}
