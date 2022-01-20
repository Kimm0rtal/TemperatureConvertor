//
//  ContentView.swift
//  UnitConverter
//
//  Created by Kimmortal on 20.1.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputTemperatureUnit = "Celsius"
    @State private var outputTemperatureUnit = "Fahrenheit"
    @State private var temperature = 0.0
    let temperatureUnits = ["Celsius", "Fahrenheit","Kelvin"]
    @FocusState private var amountIsFocused: Bool
    
    var CelToKel: Double {
        let temp = Double(temperature)
        let conversion = temp + 273.15
        
        return conversion
    }
    var CelToFah: Double {
        let temp = Double(temperature)
        let conversion = temp * 1.8 + 32
        
        return conversion
    }
    
    var FahToKel: Double {
        let temp = Double(temperature)
        let conversion = temp + 459.67 * 5/9
        
        return conversion
    }
    
    var FahToCel: Double {
        let temp = Double(temperature)
        let conversion = temp  - 32 / 1.8
        
        return conversion
    }
    
    var KelToCel: Double {
        let temp = Double(temperature)
        let conversion = temp - 273.15
        
        return conversion
    }
    
    var KelToFah: Double {
        let temp = Double(temperature)
        let conversion = temp * 9/5 - 459.67
        
        return conversion
    }
    
    var body: some View {
        NavigationView {
            Section {
                Form {
                    
                    Section {
                        Picker("Temperature unit", selection: $inputTemperatureUnit) {
                            ForEach(temperatureUnits, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        TextField("Temperature", value: $temperature, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    } header: {
                        
                        Text("Degrees in \(inputTemperatureUnit)")
                        
                    }
                    
                    Section {
                        Picker("Temperature unit", selection: $outputTemperatureUnit) {
                            ForEach(temperatureUnits, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("Choose the Unit you want convert to")
                    }
                    
                    if inputTemperatureUnit == "Celsius" {
                        if outputTemperatureUnit == "Kelvin"{
                            Section {
                                Text("\(CelToKel, format: .number) K")
                            } header: {
                                Text("\(temperature .formatted(.number))° Celsius in Kelvin is:")
                            }
                        } else if outputTemperatureUnit == "Fahrenheit" {
                            Section {
                                Text("\(CelToFah, format: .number)° F")
                            } header: {
                                Text("\(temperature .formatted(.number))° Celsius in Fahrenheit is:")
                            }
                        } else {
                            Section {
                                Text("\(temperature, format: .number)° C")
                            } header: {
                                Text("\(temperature .formatted(.number))° Celsius in Celsius is:")
                            }
                        }
                    } else if inputTemperatureUnit == "Fahrenheit" {
                        if outputTemperatureUnit == "Kelvin"{
                            Section {
                                Text("\(FahToKel, format: .number) K")
                            } header: {
                                Text("\(temperature .formatted(.number))° Fahrenheit in Kelvin is:")
                            }
                        } else if outputTemperatureUnit == "Celsius" {
                            Section {
                                Text("\(FahToCel, format: .number)° C")
                            } header: {
                                Text("\(temperature .formatted(.number))° Fahrenheit in Celsius is:")
                            }
                        } else {
                            Section {
                                Text("\(temperature, format: .number)° F")
                            } header: {
                                Text("\(temperature .formatted(.number))° Fahrenheit in Fahrenheit is:")
                            }
                        }
                    } else if inputTemperatureUnit == "Kelvin" {
                        if outputTemperatureUnit == "Celsius"{
                            Section {
                                Text("\(KelToCel, format: .number)° C")
                            } header: {
                                Text("\(temperature .formatted(.number)) Kelvin in Celsius is:")
                            }
                        } else if outputTemperatureUnit == "Fahrenheit" {
                            Section {
                                Text("\(KelToFah, format: .number)° F")
                            } header: {
                                Text("\(temperature .formatted(.number)) Kelvin in Fahrenheit is:")
                            }
                        } else {
                            Section {
                                Text("\(temperature, format: .number) K")
                            } header: {
                                Text("\(temperature .formatted(.number))° Kelvin in Kelvin is:")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Temperature Converter")
            .toolbar {
                
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
