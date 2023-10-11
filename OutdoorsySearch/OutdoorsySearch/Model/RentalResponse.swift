//
//  RentalResponse.swift
//  OutdoorsySearch
//
//  Created by Nikolay Raychev on 17/09/2023.
//

struct RentalResponse: Codable {
    var data: [Rental]
    var included: [ImageInfo]?
}
