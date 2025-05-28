import SwiftUI

struct CollectionListView: View {
    @State private var isEditing: Bool = false
    @State private var showingNewCollectionAlert: Bool = false
    @State private var showFlashcardDetail: Bool = false
    
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
            
            NavigationLink(
                isActive: $showFlashcardDetail,
                destination: { FlashcardListView(title: nil) },
                label: {
                    EmptyView()
            })
            // BWORK -- deprecated :(
        }
        
        
        .alert(
            "Create New Collection",
            isPresented: $showingNewCollectionAlert
        ) {
            Button("Create") {
                showFlashcardDetail.toggle()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Enter the subject of your new collection")
        }

        
        .toolbar {
            ToolbarItem {
                Button {
                    showingNewCollectionAlert.toggle()
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
    NavigationView {
        CollectionListView()
    }
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
