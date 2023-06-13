import SwiftUI


struct AsyncImage: View {
    let url: String

    var body: some View {
        if let imageURL = URL(string: url), let imageData = try? Data(contentsOf: imageURL), let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
        }
    }
}
