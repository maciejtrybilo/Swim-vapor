import Swim

extension Node {
    func render() -> String {
        var string: String = ""
        write(to: &string)
        return string
    }
}
