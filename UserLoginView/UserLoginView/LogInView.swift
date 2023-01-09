//
//  LogInView.swift
//  UserLoginView
//
//  Created by Furkat Ethan on 2023/01/08.
//

import SwiftUI

struct LogInView: View {
        //アプリユーザログイン情報
        @State private var userEmail = ""
        @State private var userPassword = ""
        
        @State private var LoginSuccess = false
        
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                //ログイン画面背景作成
                Color.red
                    .ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(Color.white.opacity(0.15))
                Circle()
                    .scale(1.3)
                    .foregroundColor(Color.white)
                
                VStack{
                    //画面画面コントロール作成
                    //タイトル
                    Text("log In")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    SecureField("UserPassword", text: $userPassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    
                    TextField("UserEmail", text: $userEmail)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                    
                    NavigationLink(destination: HomeView()) {
                        Button("Log In"){
                            /*
                             入力情報を格納
                             既存の登録がない
                             
                             問題ない場合、ホーム画面遷移
                            */
                            
                            autheticateUser(password: userPassword, email: userEmail)
                        }
                        .frame(width: 200, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.top, 40)
                    }
                    
                    HStack{
                        Text("if you do not have account tap")
                        NavigationLink(destination: SignUpView(), label:{Text("here")})
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
    }
        
    func autheticateUser(password: String, email: String){
        
        if password != "" && email != "" {
            //三つの項目全部パスしてスルー判定
            LoginSuccess = true
        }
        else {
            LoginSuccess = false
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
