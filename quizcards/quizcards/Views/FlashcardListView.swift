import SwiftUI

struct FlashcardListView: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .foregroundStyle(Color("titleRed"))
                .padding()
            
            List {
                Text("one")
                Text("two")
                Text("three")
                Text("four")
            }
            .scrollContentBackground(.hidden)
        }
        .background {
            Color.bgTan
                .ignoresSafeArea()
        }
    }
}

#Preview {
    FlashcardListView(title: "pink")
}
