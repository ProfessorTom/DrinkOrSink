//
//  DrinkOrSinkUITests.swift
//  DrinkOrSinkUITests
//
//  Created by Jean Mainguy on 08.03.18.
//  Copyright © 2018 eGym. All rights reserved.
//

import XCTest

class ViewControllerUITests: XCTestCase {
    
    var app: XCUIApplication!
    lazy var gameLabel = {
        return app.staticTexts["GameLabel"]
    }()
    lazy var playButton = {
        return app.buttons["PlayButton"]
    }()
    lazy var drinkButton = {
        return app.buttons["DrinkButton"]
    }()
    lazy var sinkButton = {
        return app.buttons["SinkButton"]
    }()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testStartAndDrinkSucceeds() {
        XCTAssertEqual(gameLabel.label, "Drink or Sink: You choose...")
        XCTAssertEqual(playButton.label, "START")
        playButton.tap()
        
        XCTAssertEqual(gameLabel.label, "One shot of tequilla sunrise!")
        XCTAssertEqual(drinkButton.label, "DRINK")
        drinkButton.tap()
        
        XCTAssertEqual(gameLabel.label, "Well Done! Beverages are no secret for you!")
        XCTAssertEqual(playButton.label, "CONTINUE")
    }
    
    func testStartAndSinkSucceeds() {
        XCTAssertEqual(gameLabel.label, "Drink or Sink: You choose...")
        XCTAssertEqual(playButton.label, "START")
        playButton.tap()
        
        XCTAssertEqual(gameLabel.label, "One shot of tequilla sunrise!")
        XCTAssertEqual(sinkButton.label, "SINK")
        sinkButton.tap()
        
        XCTAssertEqual(gameLabel.label, "You sink... You're weak...")
        XCTAssertEqual(playButton.label, "RESTART")
    }
    
}
