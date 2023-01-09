//
//  ContentView.swift
//  UserLoginView
//
//  Created by Furkat Ethan on 2023/01/08.
//

import SwiftUI

struct SignUpView: View {
    
    //アプリユーザログイン情報
    @State private var userName = ""
    @State private var userEmail = ""
    @State private var userPassword = ""
    
    @State private var showingHomeView = false
    @State private var showingLoginView = false
    
    enum Views: String {
        case HomeView, LoginView
    }
    
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
                    Text("Sign Up")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    //ユーザ名欄
                    TextField("UserName", text: $userName)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                        
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
                        Button("Sign Up"){
                            /*
                             入力情報を格納
                             既存の登録がない
                             
                             問題ない場合、ホーム画面遷移
                            */
                            
                            autheticateUser(name: userName, password: userPassword, email: userEmail)
                        }
                        .frame(width: 200, height: 50)
                        .foregroundColor(Color.white)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.top, 40)
                    }
                    
                    HStack{
                        Text("if you already have account tap")
                        NavigationLink(destination: LogInView(), label:{Text("here")})
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func autheticateUser(name: String, password: String, email: String){
        
        if name != "" && password != "" && email != "" {
            //三つの項目全部パスしてスルー判定
            showingHomeView = true
        }
        else {
            showingHomeView = false
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
