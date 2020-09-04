import Foundation

let pre = [
        [[8, 1, 6], [3, 5, 7], [4, 9, 2]],
        [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
        [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
        [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
        [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
        [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
        [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
        [[2, 7, 6], [9, 5, 1], [4, 3, 8]],
        ]

func cost(s: [[Int]], s2: [[Int]]) -> Int {
    var cost = 0
    for r in 0...2 {
        for c in 0...2 {
            cost += abs(s[r][c] - s2[r][c])
        }
    }
    return cost
}

// Complete the formingMagicSquare function below.
func formingMagicSquare(s: [[Int]]) -> Int {
    return pre.map { cost(s: s, s2: $0) }.min() ?? 0
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

let s: [[Int]] = AnyIterator{ readLine() }.prefix(3).map {
    let sRow: [Int] = $0.split(separator: " ").map {
        if let sItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return sItem
        } else { fatalError("Bad input") }
    }

    guard sRow.count == 3 else { fatalError("Bad input") }

    return sRow
}

guard s.count == 3 else { fatalError("Bad input") }

let result = formingMagicSquare(s: s)

print("result", result)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
