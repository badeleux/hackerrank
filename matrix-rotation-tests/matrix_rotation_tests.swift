//
//  matrix_rotation_tests.swift
//  matrix-rotation-tests
//
//  Created by Kamil Badyla on 07/09/2020.
//  Copyright © 2020 Kamil Badyla. All rights reserved.
//

import XCTest

class matrix_rotation_tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSnakeFirstRing() throws {
        let snake = snakes(matrix: [[1, 2, 3], [4, 5, 6], [7,8,9], [10, 11, 12]])[0]
        XCTAssertEqual(snake, [1, 2, 3, 6, 9, 12, 11, 10, 7, 4])
    }
    
    func testSnakeSecondRing() throws {
        let snake = snakes(matrix: [[1, 2, 3], [4, 5, 6], [7,8,9], [10, 11, 12]])[1]
        XCTAssertEqual(snake, [5,8])
    }
    
    func testMatrixFromSnakes() throws {
        let snks = snakes(matrix: [[1, 2, 3], [4, 5, 6], [7,8,9], [10, 11, 12]])
        let matrix = buildMatrixFromSnakes(snakes: snks, n: 3, m: 4)
        XCTAssertEqual(matrix[0], [1,2,3])
    }
    
    func testShift() throws {
        XCTAssertEqual(shift(array: [1,2,3,4,5,6], n: 3), [4,5,6,1,2,3])
    }

    func testRotationFirstRow() throws {
        let matrix = matrixRotation(matrix: [[1, 2, 3], [4, 5, 6], [7,8,9], [10, 11, 12]], r: 1)
        XCTAssertEqual(matrix[0], [2, 3, 6])
    }
    
    func testRotationSecondRow() throws {
        let matrix = matrixRotation(matrix: [[1, 2, 3], [4, 5, 6], [7,8,9], [10, 11, 12]], r: 1)
        XCTAssertEqual(matrix[1], [1, 6, 9])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
