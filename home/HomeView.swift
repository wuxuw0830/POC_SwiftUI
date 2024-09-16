//
//  HomeView.swift
//  BottomBar
//
//  Created by Reed on 2024/8/26.
//

import SwiftUI

struct HomeView: View {
    @State private var name = ""
    @State private var pwd = ""
    @StateObject private var viewModel = HomeViewModel()

    @State var shouldPresentSheet = false
    
    var body: some View {
        VStack(){
            Text(NSLocalizedString("user_name", comment: ""))
            TextField("", text: $name, prompt: Text("Enter your  Name").foregroundColor(.gray))
                .frame(minHeight: 50)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 1) }
                .onChange(of: name) { text in
                    //                    valideUserName(text : text)
                    //                    print(valideUserName(text:text))
                }
            
            Text(NSLocalizedString("user_password", comment: ""))
            TextField("", text: $pwd, prompt: Text(NSLocalizedString("enter_your_password", comment: "")).foregroundColor(.gray))
                .frame(minHeight: 50)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 1) }
            let isShowButton = viewModel.validResult(tvPwd: pwd, tvName: name)
            //let isShowButton = valideUserName(text: name) && validePwd(text: pwd)
            if isShowButton{
                Spacer().frame(height:20)
                Button {
                    shouldPresentSheet.toggle()
                    // TODO:
                } label: {
                    Text(NSLocalizedString("sign_in", comment: ""))
                        .font(.system(size: 14))
                        .padding()
                        .foregroundStyle(.blue)
                        .clipShape(
                               RoundedRectangle(cornerRadius: 12)
                           )
                }
                .buttonStyle(.borderedProminent)
                .tint(.white)
                
                .sheet(isPresented: $shouldPresentSheet){
                    print("Sheet dismissed")
                } content:{
                    sheetContent()
                }
            }
            
            
        }
        .padding(.leading,26).padding(.trailing,26)
    }
    
}
@ViewBuilder func sheetContent()->some View{
    Text("OMG Queen Card")
    var systemInfo = utsname()

}

#Preview {
    HomeView()
}
