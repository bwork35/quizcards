import SwiftUI

struct CollectionCellView: View {
    var body: some View {
        ZStack {
            Image("flashcard")
                .border(.black)
                
            
            Text("pink")
                .font(.title)
        }
    }
}

#Preview {
    CollectionCellView()
}
