//
//  TemperatureCalculatorView.swift
//  WeSplit
//
//  Created by Deanne Chance on 9/9/22.
//

import SwiftUI

struct TemperatureCalculatorView: View {
    
    @State private var defaultTemperature = 100.0
    @State private var defaultUnit = "Farenheit"
    @State private var unitsTemperature = ["Celsius", "Farenheit"]
    
    @FocusState private var defaultTemperatureIsFocused: Bool
    
    var convertedTemperature : Double {
        if defaultUnit == "Celsius" {
            return 1.8 * defaultTemperature + 32
        } else {
            return 5 / 9 * (defaultTemperature - 32)
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select units", selection: $defaultUnit) {
                        ForEach(unitsTemperature, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Enter current temp", value: $defaultTemperature, format: .number)
                        .keyboardType(.numberPad)
                        .focused($defaultTemperatureIsFocused)
                }
                header: {
                    Text("Enter current temperature")
                }
                Section {
                    Text(convertedTemperature, format: .number)

                } header: {
                    if defaultUnit == "Celsius" {
                        Text("Temperature Farenheit")
                    } else {
                        Text("Temperature Celsius")
                    }
                }
            }
            .navigationTitle("Temperature")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        defaultTemperatureIsFocused = false
                    }
                }
            }
        }
    }
}

struct TemperatureCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureCalculatorView()
    }
}
