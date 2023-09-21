import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }
    app.get("order") { req async in
        return Order(price: 12, currency: "ll", product: "llk", customer_email: "")
    }
    
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    try app.register(collection: OrderController())
    
    app.post("postNewOrder") { req -> Future<String> in
        return try req.content.decode(Order.self).map { orderRequest in
            let newOrder = Order()
            newOrder.latitude = orderRequest.latitude
            newOrder.longitude = orderRequest.longitude
            Order.append(newOrder)
            return newOrder.id.uuidString
            // if id is String then simply
            // return newOrder.id
            // if id is UUID then this way
            // return newOrder.id.uuidString
        }
    }
   
}
