//
//  tests.swift
//  tests
//
//  Created by Kamil Badyla on 04/09/2020.
//  Copyright © 2020 Kamil Badyla. All rights reserved.
//

import XCTest

class ClimbingTheLeaderboardTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAliceIsFirst() throws {
        XCTAssertEqual(climbingLeaderboard(scores: [100, 100, 50, 40, 40, 20, 10], alice: [125]).first, 1)
    }
    
    func testAliceIsSecond() throws {
        XCTAssertEqual(climbingLeaderboard(scores: [100, 100, 50, 40, 40, 20, 10], alice: [60]).first, 2)
    }
    
    func testAliceIsSecondWhileBeingEqual() throws {
        XCTAssertEqual(climbingLeaderboard(scores: [100, 100, 50, 40, 40, 20, 10], alice: [50]).first, 2)
    }
    
    func testLeaderboardSequence() throws {
        XCTAssertEqual(climbingLeaderboard(scores: [100, 100, 50, 40, 40, 20, 10], alice: [5, 25, 50, 120]), [6, 4, 2, 1])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
