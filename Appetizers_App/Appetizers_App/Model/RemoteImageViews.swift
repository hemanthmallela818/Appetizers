// RemoteImageViews.swift
// Contains ImageLoader, RemoteImage, and AppetizerRemoteImage for asynchronous image loading.

import SwiftUI
import Combine

final class ImageLoader : ObservableObject {
    @Published var image : Image? = nil

    func load(fromURLString urlString: String) {
        Task {
            if let uiImage = await NetworkManager.shared.loadImage(from: urlString) {
                await MainActor.run {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }
    }
}

struct RemoteImage : View {
    var image: Image?
    var body: some View {
        image?.resizable()  ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage : View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString)}
    }
}

