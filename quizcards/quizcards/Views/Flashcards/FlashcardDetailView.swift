import SwiftUI

struct FlashcardDetailView: View {
    var front: String?
    
    var body: some View {
        ZStack {
            Color.bgTan
                .ignoresSafeArea()
            
            Text(front ?? "New Card")
                .font(.largeTitle)
        }
    }
}

#Preview {
    FlashcardDetailView(front: "Yellow")
}
