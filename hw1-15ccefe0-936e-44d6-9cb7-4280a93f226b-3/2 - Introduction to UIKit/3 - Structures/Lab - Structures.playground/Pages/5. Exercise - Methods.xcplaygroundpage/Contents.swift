/*:
## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    
    func description() {
            print("title: \(title)")
            print("author: \(author)")
            print("pages: \(pages)")
            print("price: $\(price)")
        }
    
}

let theBookIStruggledOn = Book(title: "Modern Operating Systems", author: "Andrew S. Tenenbaum", pages: 1137, price: 62)
theBookIStruggledOn.description()
//:  A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
struct Post {
    
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    
    mutating func like() {
            likes += 1
        }

}
print("\n") // I know that is double new line
var zapreshenobookPost = Post(message: "How to use VPN?", likes: 544, numberOfComments: 900)
print(zapreshenobookPost.likes)
zapreshenobookPost.like()
print(zapreshenobookPost.likes)


/*:
[Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
 */
