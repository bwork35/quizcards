import SwiftUI

struct CollectionListView: View {
    @State private var isEditing: Bool = false
    @State private var showingNewCollectionAlert: Bool = false
    @State private var showFlashcardDetail: Bool = false
    @State private var newSubject: String = ""
    // BWORK -- doesn't reset after creating new -- but maybe after creating newFlashcard, we can be safe to reset
    
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
                destination: {
                    FlashcardListView(title: newSubject)
                },
                label: {}
            )
            // BWORK -- deprecated :(
        }
        
        
        .alert(
            "Create New Collection",
            isPresented: $showingNewCollectionAlert
        ) {
            TextField("Subject", text: $newSubject)
            Button("Create") {
                showFlashcardDetail.toggle()
            }
            .disabled(newSubject.isEmpty)
            Button("Cancel", role: .cancel) {
                newSubject = ""
            }
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
