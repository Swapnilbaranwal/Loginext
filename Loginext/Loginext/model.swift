// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct APIResponseData: Codable {
    let status: Int
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let banners: [Banner]
    let foodCategories: [FoodCategory]
    let numberOfActiveVouchers: Int
    let offerCollections: [Offer]
    let restaurantCollections: [RestaurantCollection]

    enum CodingKeys: String, CodingKey {
        case banners
        case foodCategories = "food_categories"
        case numberOfActiveVouchers = "number_of_active_vouchers"
        case offerCollections = "offer_collections"
        case restaurantCollections = "restaurant_collections"
    }
}

// MARK: - Banner
struct Banner: Codable,Identifiable {
    let image_url: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case image_url = "image_url"
        case id
    }
}

// MARK: - FoodCategory
struct FoodCategory: Codable,Identifiable {
    let name: String
    let id: Int
    let icon: String
}

// MARK: - Offer
struct Offer: Codable,Identifiable {
    let name: String
    let id: Int
    let image: String?
    let textcolor, background: String?
}

// MARK: - RestaurantCollection
struct RestaurantCollection: Codable,Identifiable{
    let id = UUID()
    let name: String
    let priority: Int
    let restaurants: [Restaurant]
    
}

// MARK: - Restaurant
struct Restaurant: Codable,Identifiable {
    let id: Int
    let name, displayDistance: String
    let rating: Double
    let imageURL: String
    let offers: [Offer]
    let additionalOffer: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case displayDistance = "display_distance"
        case rating
        case imageURL = "image_url"
        case offers
        case additionalOffer = "additional_offer"
    }
}
