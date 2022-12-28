
let N = Int(readLine()!)!
var S = [Character](), ans = ""

for _ in 0..<N {
    S.append(Character(readLine()!))
}

for i in 1...N {
    var lo = 0, hi = S.count-1
    while lo <= hi && S[lo] == S[hi] {
        lo += 1; hi -= 1
    }
    ans.append(lo > hi ? S.popLast()! : S[lo] < S[hi] ? S.removeFirst() : S.popLast()!)
    if i % 80 == 0 { ans += "\n" }
}

print(ans)