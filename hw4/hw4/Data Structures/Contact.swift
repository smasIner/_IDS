import UIKit

struct Contact {
    var name: String
    var number: String
    var image: UIImage

    init(name: String, number: String, image: UIImage? = nil) {
        self.name = name
        self.number = number
        if let image = image {
            self.image = image
        } else {
            self.image = UIImage(named: "noimage")!
        }
    }
}
