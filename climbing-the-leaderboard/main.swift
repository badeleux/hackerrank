import Foundation

public extension Sequence where Element: Hashable {

    /// Return the sequence with all duplicates removed.
    ///
    /// i.e. `[ 1, 2, 3, 1, 2 ].uniqued() == [ 1, 2, 3 ]`
    ///
    /// - note: Taken from stackoverflow.com/a/46354989/3141234, as
    ///         per @Alexander's comment.
    func uniqued() -> [Element] {
        var seen = Set<Element>()
        return self.filter { seen.insert($0).inserted }
    }
}

// Complete the climbingLeaderboard function below.
public func climbingLeaderboard(scores: [Int], alice: [Int]) -> [Int] {
    let uniqueScores = scores.uniqued()
    var position: Int = uniqueScores.count + 1
    return alice.map { aliceScore in
        for score in uniqueScores.reversed().suffix(position-1) {
            if aliceScore < score {
                return position
            }
            position -= 1
        }
        return position
    }
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let scoresCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let scoresTemp = readLine() else { fatalError("Bad input") }
let scores: [Int] = scoresTemp.split(separator: " ").map {
    if let scoresItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return scoresItem
    } else { fatalError("Bad input") }
}

guard scores.count == scoresCount else { fatalError("Bad input") }

guard let aliceCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let aliceTemp = readLine() else { fatalError("Bad input") }
let alice: [Int] = aliceTemp.split(separator: " ").map {
    if let aliceItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return aliceItem
    } else { fatalError("Bad input") }
}

guard alice.count == aliceCount else { fatalError("Bad input") }

let result = climbingLeaderboard(scores: scores, alice: alice)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
