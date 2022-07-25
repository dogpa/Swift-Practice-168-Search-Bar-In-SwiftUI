//
//  SearchViewModel.swift
//  Swift Practice 168 Search Bar In SwiftUI
//
//  Created by Dogpa's MBAir M1 on 2022/7/21.
//

import Foundation

final class SearchViewModel : ObservableObject {
    
    //欲搜尋的字串，對應使用者搜尋的字，若值有改變則執行自定義的filterName Function
    @Published var searchString = "" {
        didSet {
            self.filterName()
        }
    }
    
    //存放透過createRandomNameList建立的原始資料
    @Published var nameArray: [Name] = []
    
    //儲存透過搜尋名字過濾後的資料
    @Published var filterNameArray: [Name] = []
    
    //百家姓的姓氏Array
    var hundredTaiwanLastName = [
        "陳", "林", "黃", "張", "李", "王", "吳", "劉", "蔡", "楊", "許", "鄭", "謝", "洪", "郭", "邱", "曾", "廖", "賴", "徐",
        "周", "葉", "蘇", "莊", "呂", "江", "何", "蕭", "羅", "高", "潘", "簡", "朱", "鍾", "游", "彭", "詹", "胡", "施", "沈",
        "余", "盧", "梁", "趙", "顏", "柯", "翁", "魏", "孫", "戴", "范", "方", "宋", "鄧", "杜", "傅", "侯", "曹", "薛", "丁",
        "卓", "阮", "馬", "董", "温", "唐", "藍", "石", "蔣", "古", "紀", "姚", "連", "馮", "歐", "程", "湯", "黄", "田", "康",
        "姜", "白", "汪", "鄒", "尤", "巫", "鐘", "黎", "涂", "龔", "嚴", "韓", "袁", "金", "童", "陸", "夏", "柳", "凃", "邵"
    ]
    
    //台灣常見菜市場名
    var topTenGivenName = [
        "志明", "俊傑", "建宏", "俊宏", "志豪", "志偉", "文雄", "承翰", "冠宇", "淑芬", "淑惠", "美玲", "雅婷", "美惠", "麗華", "淑娟", "淑貞", "怡君", "淑華","威霆", "佑睿",
        "柏漢", "柏宇", "昭鴻", "紘禧", "佑文", "正偉", "正豪", "志成", "永明", "雅文", "金蘭", "金葉", "婉貞", "亮婕", "汶玲", "瑜婷", "怡婷", "雅琪", "婉君",  "思穎"
    ]
    
    
    ///透過迴圈與隨機方式建立台灣姓名Array
    func createRandomNameList () {
        nameArray = []
        for _ in 0...3000 {
            nameArray.append(Name(name: "\(hundredTaiwanLastName[Int.random(in: 0..<hundredTaiwanLastName.count)])\(topTenGivenName[Int.random(in: 0..<topTenGivenName.count)])"))
        }
        filterNameArray = nameArray
    }
    
    ///過濾姓名的Function
    ///若搜尋字串searchString為空字串則顯示原始的資料nameArray
    ///若搜尋字串searchString有值則顯示過濾nameArray後的結果
    func filterName () {
        if searchString.isEmpty {
            filterNameArray = nameArray
        }else{
            filterNameArray = nameArray.filter {$0.name.contains(searchString)}
        }
    }
    
}
