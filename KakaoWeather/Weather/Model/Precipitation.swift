//
//  Precipitation.swift
//  KakaoWeather
//
//  Created by Susan Kim on 07/08/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import Foundation

struct Precipitation {
    let type: PrecipitationType?
    let intensity: Double?
    let probability: Double?
}

enum PrecipitationType: String {
    case rain
    
    case snow
    
    case sleet
}
