//
//  ContentView.swift
//  CaoCuladora
//
//  Created by Joao Filipe Reis Justo da Silva on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    // Em SwiftUi, os structs são constatemente criados e destrídos. Para evitar que uma
    // variável perca o seu valor quando o struct for destruído, ela é marcada com um State
    // para que o SwiftUi entenda que ela deve ser mantida.
    
    // Esse @ na frente de State é um wrapper. Eu ainda não sei o que é isso :)
    @State var anosInput: Int? = nil
    @State var mesesInput: Int? = nil
    
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField(
                "Digite a idade em anos completos",
                value: $anosInput,
                format: .number
            )
            .padding()
            
            Text("Meses")
            TextField(
                "E quatos meses ele tem?",
                value: $mesesInput,
                format: .number
            )
            .padding()
        }
        .textFieldStyle(.roundedBorder) // modificador do TextField
        .keyboardType(.numberPad)   // modificador do TextField
        .bold()
        .fontDesign(.rounded)
        .padding()
    }
}

#Preview {
    ContentView()
}
