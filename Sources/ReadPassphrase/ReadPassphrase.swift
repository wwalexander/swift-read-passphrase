import Foundation

public struct ReadPassphraseOptions: OptionSet {
    public let rawValue: CInt

    public init(rawValue: CInt) {
        self.rawValue = rawValue
    }

    public static var echo: ReadPassphraseOptions { .init(rawValue: 1 << 0) }
    public static var requireTTY: ReadPassphraseOptions { .init(rawValue: 1 << 1) }
    public static var forceLower: ReadPassphraseOptions { .init(rawValue: 1 << 2) }
    public static var forceUpper: ReadPassphraseOptions { .init(rawValue: 1 << 3) }
    public static var stripHighBit: ReadPassphraseOptions { .init(rawValue: 1 << 4) }
    public static var readFromStdin: ReadPassphraseOptions { .init(rawValue: 1 << 5) }
}

public func readPassphrase(
    prompt: String = "",
    options: ReadPassphraseOptions = [],
    count: Int = 1024
) -> String {
    precondition(count >= 0)
    var buf: [CChar] = .init(repeating: 0, count: count + 1)
    readpassphrase(prompt, &buf, buf.count, options.rawValue)
    return String(cString: &buf)
}
