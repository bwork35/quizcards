import SwiftUI

struct CollectionListView: View {
    @State private var isEditing: Bool = false
    
    var titles = ["Pink", "Yellow", "Blue", "Green"]
    
    var body: some View {
        ZStack {
            Color.bgTan
                .ignoresSafeArea()
            ScrollView {
                ForEach(titles, id: \.self) { title in
                    NavigationLink {
                        FlashcardListView(title: title)
                    } label: {
                        CollectionCellView(isEditing: $isEditing, title: title)
                    }
                    .foregroundStyle(.primary)
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItem {
                NavigationLink {
                    FlashcardListView(title: nil)
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    isEditing.toggle()
                } label: {
                    Text(isEditing ? "Done" : "Edit")
                }
            }
        }
    }
}

#Preview {
    CollectionListView()
}

// BWORK -- XX
struct CollectionToolbar: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItem {
            NavigationLink {
                FlashcardListView(title: nil)
            } label: {
                Image(systemName: "plus")
            }
        }
        
        ToolbarItem(placement: .topBarLeading) {
            Button {
                print("EDIT !!")
            } label: {
                Text("Edit")
            }
        }
    }
}
