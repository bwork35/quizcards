import SwiftUI

struct CollectionCellView: View {
    @Binding var isEditing: Bool
    let title: String
    
    var body: some View {
        ZStack {
            Image("flashcard")
                .border(.black)
            
            HStack {
                if isEditing {
                    Button {
                        print("delete !!")
                    } label: {
                        Image(systemName: "trash")
                            .foregroundStyle(.red)
                            .background(Color.red.opacity(0.2))
                    }
                }
                
                Text(title)
                    .font(.title)
                    .frame(width: 200)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
// BWORK -- test for really long names that expand vertically

#Preview {
    CollectionCellView(isEditing: .constant(false), title: "States and Capitals")
}
