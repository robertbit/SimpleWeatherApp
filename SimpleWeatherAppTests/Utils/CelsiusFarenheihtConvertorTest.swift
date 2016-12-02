//
//  CelsiusFarenheihtConvertorTest.swift
//  SimpleWeatherApp
//
//  Created by robert on 02/12/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import XCTest
@testable import SimpleWeatherApp

import Foundation



class CelsiusFarenheihtConvertorTest: XCTestCase {
    
    
    func testCesiusToFe(){
        
  
        
        XCTAssertEqual(59, CelciusFarenheitConvertor.convertTofahrenheit(celsius: 15))
        
        
    }
    
    
}
