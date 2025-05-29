import SwiftUI

struct FlashcardListView: View {
    let collection: Collection
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(collection.subject)
                    .font(.largeTitle)
                    .foregroundStyle(Color("titleRed"))
                    .padding(.trailing, 8)
                
                Button {
                    print("Edit !!")
                } label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .scaledToFit()
                }
            }
            .padding(.leading, 24)
            .padding(.top, 24)
            
            List {
                NavigationLink {
                    FlashcardDetailView(front: "One")
                } label: {
                    Text("One")
                        .padding(8)
                }
                
                NavigationLink {
                    FlashcardDetailView(front: "Two")
                } label: {
                    Text("Two")
                        .padding(8)
                }
                
                NavigationLink {
                    FlashcardDetailView(front: "Three")
                } label: {
                    Text("Three")
                        .padding(8)
                }
                
                NavigationLink {
                    FlashcardDetailView(front: "Four")
                } label: {
                    Text("Four")
                        .padding(8)
                }
            }
            .font(.title2)
            .offset(y: -32) // BWORK
            .scrollContentBackground(.hidden)
        }
        .background {
            Color.bgTan
                .ignoresSafeArea()
        }
    }
}

#Preview {
    let collection = ModelData().collections.first!
    FlashcardListView(collection: collection)
}
