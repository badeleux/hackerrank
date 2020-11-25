import Foundation

func shift(array: [Int], n: Int) -> [Int] {
    let rotation = n % array.count
    let last = array.count - rotation
    
    let first = Array(array.suffix(last))
    let second = Array(array.prefix(rotation))
    return first + second
}

func snakes(matrix: [[Int]]) -> [[Int]] {
    let r = min(matrix.count, matrix[0].count) / 2
    let count = matrix.count
    return Array(0...r).map { i in
        let min = i
        let max = count - i - 1
        let rows = matrix[min...max].map { row in Array(row.dropFirst(i).dropLast(i)) }
        
        let top = rows[0]
        let verticalEnds = rows.dropFirst().dropLast().map { row in row.last! }
        let verticalStarts = rows.dropFirst().dropLast().map { row in row.first! }.reversed()
        let bottom = rows.last!.reversed()
        
        return top + verticalEnds + bottom + verticalStarts
    }
}

func buildMatrixFromSnakes(snakes: [[Int]], n: Int, m: Int) -> [[Int]] {
    var matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
    for (i, snake) in snakes.enumerated() {
        for (j, x) in snake.enumerated() {
            
        }
        
    }
    matrix[1][2] = 5
    return matrix
}

func rotateLeft(matrix: [[Int]]) -> [[Int]] {
    return Array(0...matrix.count).map {
        switch $0 {
        case 0:
            return matrix[0].suffix(matrix[0].count - 1) + [matrix[1].last!]
            
        default:
            return []
        }
    }
}

// Complete the matrixRotation function below.
public func matrixRotation(matrix: [[Int]], r: Int) -> [[Int]] {
    return rotateLeft(matrix: matrix)


}

guard let mnrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let mnr = mnrTemp.split(separator: " ").map{ String($0) }

guard let m = Int(mnr[0])
else { fatalError("Bad input") }

guard let n = Int(mnr[1])
else { fatalError("Bad input") }

guard let r = Int(mnr[2])
else { fatalError("Bad input") }

let matrix: [[Int]] = AnyIterator{ readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) }.prefix(m).map {
    let matrixRow: [Int] = $0.split(separator: " ").map {
        if let matrixItem = Int($0) {
            return matrixItem
        } else { fatalError("Bad input") }
    }

    guard matrixRow.count == n else { fatalError("Bad input") }

    return matrixRow
}

guard matrix.count == m else { fatalError("Bad input") }

matrixRotation(matrix: matrix, r: r)
 
