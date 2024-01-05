import SwiftUI

struct NavigatorView: View {
    var body: some View {
        TabView{
           
                HomeView()
                .tabItem { Image(systemName: "house.circle") }
            
            Text("Tab 1")
                .tabItem { /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Item Label@*/Text("Label")/*@END_MENU_TOKEN@*/ }
        }
    }
}

#Preview {
    NavigatorView()
}
