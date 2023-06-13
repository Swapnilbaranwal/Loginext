import SwiftUI
import Foundation

struct HomeView: View {
    let responseData: APIResponseData
    let gridItems = [GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        NavigationView {
            VStack{
                // MARK: Header
                ZStack{
                    
                    VStack{
                        HStack{
                            Image(systemName: "mappin")
                            Text("Home")
                            Spacer()
                        }
                        HStack {
                            // Search Box
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                            Spacer()
                        }
                        .padding(5)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }.padding()
                    .background(Color.red)
                ScrollView{
                    VStack(alignment: .leading) {
                        // Banners
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(responseData.data.banners) { banner in
                                    AsyncImage(url: banner.image_url)
                                        .frame(width: 250, height: 100)
                                        .cornerRadius(10)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }
                        
                        // Food Categories
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(responseData.data.foodCategories) { category in
                                    VStack {
                                        AsyncImage(url: category.icon)
                                            .frame(width: 70, height: 60)
                                            .cornerRadius(30)
                                        Text(category.name)
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                        HStack{
                            Image(systemName: "gift")
                                .foregroundColor(.orange)
                            Text("You have \(responseData.data.numberOfActiveVouchers) vouchers here")
                                .foregroundColor(.orange)
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundColor(.orange)
                                .padding(3)
                        }
                        .background(Color(red: 255/255, green: 213/255, blue: 181/255))
                        .cornerRadius(5)
                        .padding(5)
                        VStack(alignment:.leading){
                                                        Text("Collections")
                                                            .font(.headline)
                                                        LazyVGrid(columns: gridItems, spacing: 10){
                                                            ForEach(responseData.data.offerCollections){ offers in
                                                                HStack{                                           AsyncImage(url: offers.image ?? "")
                                                                        .frame(width: 50, height: 50)
                                                                        .cornerRadius(10)
                                                                    Text(offers.name)
                                                                    Spacer()
                                                                }.padding(3)
                                                                    .border(Color.gray.opacity(2),width:0.3)
                                                                    .cornerRadius(15)
                                                            }
                                                        }
                                                    }
                        VStack{
                            ForEach(responseData.data.restaurantCollections) { swapnil in
                                HStack{
                                    Text(swapnil.name)
                                        .font(.headline)
                                        .multilineTextAlignment(.leading)
                                        .padding(.init(top: 0, leading: 5, bottom: 0, trailing: 0))
                                    Spacer()
                                    Text("View all")
                                        .font(.system(size: 14))
                                        .fontWeight(.ultraLight)
                                        .foregroundColor(Color.gray)
                                        
                                }
                                ScrollView(.horizontal) {
                                    HStack {
                                        
                                        ForEach(swapnil.restaurants){ resturant in
                                            VStack(alignment:.leading){
                                                AsyncImage(url:resturant.imageURL )
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(10)
                                                    .padding(.horizontal, 5)
                                                Text(resturant.name)
                                                    .font(.system(size: 14))
                                                    .fontWeight(.bold)
                                                HStack{
                                                    Text(resturant.displayDistance)
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(Color.yellow)
                                                    Text(String(format: "%.1f", resturant.rating))

                                                    
                                                }
                                                .font(.system(size: 12))
                                                .fontWeight(.ultraLight)
                                                
                                            }
                                        }
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(5)
                    
                    }
                }
                .padding(5)
            }
            
        }
    }
}
