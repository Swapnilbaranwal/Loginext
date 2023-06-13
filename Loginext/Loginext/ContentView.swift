import SwiftUI

struct ContentView: View {
    @State private var responseData: APIResponseData? = nil

    var body: some View {
        TabView {
            if let responseData = responseData {
                HomeView(responseData: responseData)
                    .tabItem {
                        Image(systemName: "house")
                            .foregroundColor(Color.red)
                        Text("Home")
                    }
            } else {
                ProgressView()
                    .tabItem {
                        Image(systemName: "house")
                            .foregroundColor(Color.red)
                        Text("Home")
                    }
            }

            OrderView()
                .tabItem {
                    Image(systemName: "list.clipboard")
                    Text("Order")
                }

            Text("Empty Tab")
                .tabItem {
                    Image(systemName: "person.circle")
                    
                    Text("Account")
                }
        }
        .onAppear {
            fetchData()
        }
    }

    private func fetchData() {
        guard let url = URL(string: "https://mocki.io/v1/0c5d380f-972a-44c9-bd11-ca5a2f154019") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(APIResponseData.self, from: data)
                    DispatchQueue.main.async {
                    
                        self.responseData = decodedData
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
}
