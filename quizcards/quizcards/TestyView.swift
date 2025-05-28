import SwiftUI

// BWORK 
struct TestyView: View {
    @State private var alertIsPresented = false
    @State private var navLinkActive = false
    
    var body: some View {
        VStack{
            Button("Present alert") {
                alertIsPresented = true
            }
            
            
            .alert("End of available content", isPresented: $alertIsPresented) {
                Button("Navigate") {
                    navLinkActive = true
                }
            }
            
            
            NavigationLink(isActive: $navLinkActive, destination: { SearchView() }, label: {
                EmptyView()
            })
            
        }
    }
}

struct SearchView : View {
    var body: some View {
        Text("Search")
    }
}

#Preview {
    NavigationView {
        TestyView()
    }
}
