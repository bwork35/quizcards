import SwiftUI

struct CollectionListView: View {
    private var titles = ["pink", "yellow", "blue", "green"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bgTan
                    .ignoresSafeArea()
                ScrollView {
                    ForEach(titles, id: \.self) { title in
                        NavigationLink {
                            FlashcardListView(title: title)
                        } label: {
                            CollectionCellView(title: title)
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    CollectionListView()
}
