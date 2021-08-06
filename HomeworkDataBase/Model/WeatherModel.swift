//
//  WeatherModel.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import Foundation

import Foundation
struct FiveDayModel:Decodable {
    var list: [List]

}
struct List: Decodable {
    var dt_txt: String
    var main: [String: Double]
}



