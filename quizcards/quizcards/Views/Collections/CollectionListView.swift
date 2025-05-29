import SwiftUI

struct CollectionListView: View {
    @Environment(ModelData.self) var modelData
    
    @State private var isEditing: Bool = false
    @State private var showingNewCollectionAlert: Bool = false
    @State private var showFlashcardDetail: Bool = false
    @State private var newSubject: String = ""
    // BWORK -- doesn't reset after creating new -- but maybe after creating newFlashcard, we can be safe to reset
    
    var body: some View {
        ZStack {
            Color.bgTan
                .ignoresSafeArea()
            
            ScrollView {
                ForEach(modelData.collections, id: \.self) { collection in
                    NavigationLink {
                        FlashcardListView(collection: collection)
                    } label: {
                        CollectionCellView(isEditing: $isEditing, title: collection.subject)
                    }
                    .foregroundStyle(.primary)
                }
            }
            .padding()
            
            NavigationLink(
                isActive: $showFlashcardDetail,
                destination: {
                    FlashcardListView(collection: createNewCollection())
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
    
    private func createNewCollection() -> Collection {
        let newCollection = Collection(subject: newSubject)
        
        // modelData.collections.insert(newCollection, at: 0)

        return newCollection
    }
}

#Preview {
    NavigationView {
        CollectionListView()
            .environment(ModelData())
    }
}








// BWORK -- XX
//struct CollectionToolbar: ToolbarContent {
//    var body: some ToolbarContent {
//        ToolbarItem {
//            NavigationLink {
//                FlashcardListView(collection: ModelData().collections.first!)
//            } label: {
//                Image(systemName: "plus")
//            }
//        }
//        
//        ToolbarItem(placement: .topBarLeading) {
//            Button {
//                print("EDIT !!")
//            } label: {
//                Text("Edit")
//            }
//        }
//    }
//}
