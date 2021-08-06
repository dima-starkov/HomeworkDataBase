//
//  WeatherManager.swift
//  HomeworkDataBase
//
//  Created by Дмитрий Старков on 06.08.2021.
//

import Foundation

class WeatherManager {
    
    static let shared = WeatherManager()

    func loadWeather(completion: @escaping (Result<FiveDayModel,Error>)-> Void) {
        let urlStr = "https://api.openweathermap.org/data/2.5/forecast?q=Moscow&appid=71934bd60fcbe86c04ac7578b6db5800&units=metric&lang=ru"
        guard let url = URL(string: urlStr ) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                
                do{
                    let lists = try JSONDecoder().decode(FiveDayModel.self, from: data)
                    completion(.success(lists))
                }catch let jsonError{
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
                
            }
        }.resume()
    
    }
    
    func fetchData() {
        loadWeather { result in
            switch result{
            case .success(let model):
                
                print(model)
                
            case.failure(let error):
                print(error)
            }
            
           
        
        }
    }
}
