//
//  File.swift
//  
//
//  Created by Emmanuel James Bejer on 9/20/23.
//

import Fluent

struct CreateOrders: Migration {
    func prepare(on database: Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("orders")
            .id()
            .field("price", .double, .required)
            .field("currency", .string, .required)
            .field("product", .string, .required)
            .field("customer-email", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("orders").delete()
    }
    
}
