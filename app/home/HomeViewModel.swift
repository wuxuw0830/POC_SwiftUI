//
//  HomeViewModel.swift
//  BottomBar
//
//  Created by Kelly on 2024/8/28.
//

import Foundation
class HomeViewModel:ObservableObject{
    @Published var isShowButton: Bool = false
    func validResult(tvPwd:String,tvName:String)->Bool{
       return validePwd(text: tvPwd)&&valideUserName(text: tvName)
    }
    func valideUserName(text:String) -> Bool{
        if text=="Kelly"
        {
            return true
        }
        else
        {
            return false
        }
    }

    func validePwd(text:String)->Bool{
        if text=="0123" {
            return true
        }else{
            return false
        }
    }
}
