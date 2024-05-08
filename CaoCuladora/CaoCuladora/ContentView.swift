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
    @State var result: Int?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
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
            
            Text("Porte")
            // Segmented control aqui
            
            if let result {
                Text("Seu cachorro tem em idade humana...")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable() // quero que a imagem redimensione
                    .scaledToFit() // quero sempre mantenha suas proporções originais
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                .shadow(radius: 20)
            }
            
            Button(
                action: {
                    result = 23
                },
                label: {
                    ZStack{
                        Color.indigo
                        Text("Cãocular")
                            .foregroundStyle(.white)
                    }
            })
            .frame(height: 50) // frame do botão
            .cornerRadius(10)
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
