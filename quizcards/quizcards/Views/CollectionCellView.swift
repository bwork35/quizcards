import SwiftUI

struct CollectionCellView: View {
    let title: String
    
    var body: some View {
        ZStack {
            Image("flashcard")
                .border(.black)
                
            
            Text(title)
                .font(.title)
        }
    }
}

#Preview {
    CollectionCellView(title: "pink")
}
