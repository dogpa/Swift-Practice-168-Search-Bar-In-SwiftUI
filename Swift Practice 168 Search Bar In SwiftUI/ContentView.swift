//
//  ContentView.swift
//  Swift Practice 168 Search Bar In SwiftUI
//
//  Created by Dogpa's MBAir M1 on 2022/7/21.
//

import SwiftUI

struct ContentView: View {
    
    //使用SearchViewModel()
    @StateObject var vm = SearchViewModel()
    
    //取得螢幕長寬
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        
        //透過.searchable(text: $vm.searchString)當作搜尋欄
        NavigationView {
            VStack{
                VStack{
                    ScrollView {
                        ForEach( 0..<$vm.filterNameArray.count, id:\.self) {name in
                            NavigationLink (destination: Text(vm.filterNameArray[name].name)) {
                                VStack {
                                    Text("\(vm.filterNameArray[name].name)")

                                }.frame(width: width, height: 100, alignment: .center)
                                    .foregroundColor(.black)
                                    .background(.yellow)
                            }
                        }
                    }
                    .navigationTitle("隨機百家姓")
                    .searchable(text: $vm.searchString)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .onAppear {
            vm.createRandomNameList()
        }
        
        
//
//         //透過TextField當作搜尋欄使用
//         NavigationView {
//             VStack{
//                 VStack{
//                     HStack {
//                         Image(systemName: "magnifyingglass")
//                             .foregroundColor(.gray).font(.headline)
//                         TextField("輸入搜尋名稱...", text:$vm.searchString)
//                     }.textFieldStyle(.automatic)
//
//                         .padding()
//                         .overlay(
//                             RoundedRectangle(cornerRadius: 13)
//                                 .stroke(.cyan, lineWidth: 1)
//                         )
//                         .padding(.horizontal)
//
//
//                     ScrollView {
//                         ForEach( 0..<$vm.filterNameArray.count, id:\.self) {name in
//                             NavigationLink (destination: Text(vm.filterNameArray[name].name)) {
//                                 VStack {
//                                     Text("\(vm.filterNameArray[name].name)")
//
//                                 }.frame(width: width, height: 100, alignment: .center)
//                                     .foregroundColor(.black)
//                                     .background(.cyan)
//                             }
//                         }
//                     }
//                     .navigationTitle("隨機百家姓")
//                     .navigationBarTitleDisplayMode(.inline)
//                 }
//             }
//         }
//         .onAppear {
//             vm.createRandomNameList()
//         }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
