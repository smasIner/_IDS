// Generic class with extension using generic
class Box<T: Equatable> {
    var value: T
    
    init(value: T) {
        self.value = value
    }
}

extension Box {
    func isSameValueAs(_ otherBox: Box<T>) -> Bool {
        return self.value == otherBox.value
    }
}

// Type-erase
class AnyPrintableBox {
    private let _printContent: () -> Void
    
    init<T: Printable>(_ printable: T) {
        _printContent = printable.printContent
    }
    
    func printContent() {
        _printContent()
    }
}

// Protocol with associated types
protocol Printable {
    associatedtype ContentType
    
    var content: ContentType { get }
    
    func printContent()
}


// Class and protocol example usage
struct StringPrintableBox: Printable {
    typealias ContentType = Box<String>
    
    var content: Box<String>
    
    init(value: String) {
        self.content = Box(value: value)
    }
    
    func printContent() {
        print("Box content: \(content.value)")
    }
}

struct IntPrintableBox: Printable {
    typealias ContentType = Box<Int>
    
    var content: Box<Int>
    
    init(value: Int) {
        self.content = Box(value: value)
    }
    
    func printContent() {
        print("Box content: \(content.value)")
    }
}

// Example usage
let stringBox1 = StringPrintableBox(value: "Hello")
let stringBox2 = StringPrintableBox(value: "World")

let intBox1 = IntPrintableBox(value: 42)
let intBox2 = IntPrintableBox(value: 42)

stringBox1.printContent()
stringBox2.printContent()

intBox1.printContent()
intBox2.printContent()

print("Are string boxes equal? \(stringBox1.content.isSameValueAs(stringBox2.content) ? "Yes" : "No")")
print("Are int boxes equal? \(intBox1.content.isSameValueAs(intBox2.content) ? "Yes" : "No")")

print("//////////// type erased example")
// Example usage of type-erased PrintableBox
let anyStringBox = AnyPrintableBox(stringBox1)
let anyIntBox = AnyPrintableBox(intBox1)
// Now, you can use AnyPrintableBox without knowing the underlying types
anyStringBox.printContent()
anyIntBox.printContent()
