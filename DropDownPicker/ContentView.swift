//
//  ContentView.swift
//  DropDownPicker
//
//  Created by Abdullah Karaboğa on 8.01.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State private var selection: String = "String"

    var body: some View {

        VStack {

            DropDown(content: ["String", "Int", "Double", "Float"],
                     selection: $selection,
                     activeTint: .primary.opacity(0.1),
                     inActiveTint: .white.opacity(0.05))
            .frame(width: 130)

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .environment(\.colorScheme, .dark)
            .background {
            Color(.black)
                .ignoresSafeArea()
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct DropDown: View {

    var content: [String]
    @Binding var selection: String
    var activeTint: Color
    var inActiveTint: Color

    @State private var expandView: Bool = false

    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(content,id: \.self) { title in
                    RowView(title, size)
                    
                }
            }
        }
            .frame (height: 55)
    }
    
    @ViewBuilder
    func RowView(_ title: String, _ size: CGSize)-> some View{
     
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .padding(.horizontal)
    }
}
