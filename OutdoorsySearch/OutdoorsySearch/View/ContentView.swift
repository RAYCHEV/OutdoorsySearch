//
//  ContentView.swift
//  OutdoorsySearch
//
//  Created by Nikolay Raychev on 17/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var searchKeyword: String = ""
    @ObservedObject private var viewModel = RentalsViewModel()

    @State private var selectedLimitIndex: Int = 0
    @State private var selectedOffsetIndex: Int = 0

    let limitOptions: [Int] = [8, 16, 24, 32]
    let offsetOptions: [Int] = [8, 16, 24, 32]

    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            Text("Keyword Search").font(.title).padding()
            HorizontalRule()
            TextField("Search Rentals", text: $searchKeyword, onCommit: {
                viewModel.searchRentals(with: searchKeyword,
                                        limit: limitOptions[selectedLimitIndex],
                                        offset: offsetOptions[selectedOffsetIndex])
            }).customTextFieldStyle()

            List {
                ForEach(viewModel.rentals, id: \.attributes.name) { rental in
                    HStack {
                        if let imageUrl = viewModel.images[rental.relationships.primary_image.data.id] {
                            AsyncImage(url: imageUrl) { image in
                                image.slightlyRoundedImageStyle()
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        Text(rental.attributes.name)
                    }
                }
            }.listStyle(PlainListStyle())
        }
        HStack {
            VStack(spacing: 0){
                Text("Limit")
                Picker("Limit", selection: $selectedLimitIndex) {
                    ForEach(limitOptions.indices, id: \.self) { index in
                        Text("\(limitOptions[index])").tag(index)
                    }
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(width: 100)
            
            VStack(spacing: 0){
                Text("Offset")
                Picker("Offset", selection: $selectedOffsetIndex) {
                    ForEach(offsetOptions.indices, id: \.self) { index in
                        Text("\(offsetOptions[index])").tag(index)
                    }
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(width: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
