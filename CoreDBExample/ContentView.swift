//
//  ContentView.swift
//  CoreDBExample
//
//  Created by Esat Gözcü on 2023/05/10.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(sortDescriptors: []) var cars: FetchedResults<Cars>
    @Environment(\.managedObjectContext) var moc

    var addData = ["Hyundai", "KIA", "Genesis", "SsangYong"]
    var updateData = ["Toyota", "Honda", "Nissan", "Mazda"]

    var body: some View {
        VStack {
            ScrollView{
                ForEach(cars){ car in
                    VStack(spacing: 5){
                        //MARK: READ
                        Text("\(car.name ?? "Unknown")")
                        HStack{
                            Text("DELETE").onTapGesture {
                                //MARK: DELETE
                                moc.delete(car)
                                try? moc.save()
                            }.foregroundColor(.red)
                            Text("UPDATE").onTapGesture {
                                //MARK: UPDATE
                                car.name = "\(updateData.randomElement() ?? "") ✏️"
                                try? moc.save()
                            }.foregroundColor(.blue)
                        }
                    }.padding()
                    Divider()
                }
            }
            Text("ADD ➕").onTapGesture {
                //MARK: CREATE
                let car = Cars(context: moc)
                car.id = UUID()
                car.name = addData.randomElement()
                try? moc.save()
            }.frame(alignment: .bottom)
        }.padding()
    }
}
