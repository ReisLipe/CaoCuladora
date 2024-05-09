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
    @State var yearsInput: Int? = nil
    @State var monthsInput: Int? = nil
    @State var result: Int?
    @State var porte: String = "Pequeno"
    let portes = ["Grande", "Médio", "Pequeno"]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
                .font(.system(size: 24))
            
            Text("Anos")
            TextField(
                "Digite a idade em anos completos",
                value: $yearsInput,
                format: .number
            )
            .padding()
            
            Text("Meses")
            TextField(
                "E quatos meses ele tem?",
                value: $monthsInput,
                format: .number
            )
            .padding()
            
            Text("Porte")
            Picker("Porte do cão", selection: $porte){
                ForEach(portes, id: \.self){ porte in
                    // Texto é o que estará escrito e tag é o valor que ele atribuirá a variável
                    // em evidência
                    Text(porte)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
            
            if let result {
                Text("Seu cachorro tem em idade humana...")
                Text("\(result) anos")
                    .font(.system(size: 40))
            } else {
                Image(ImageResource.clarinha)
                    .resizable() // quero que a imagem redimensione
                    .scaledToFit() // quero sempre mantenha suas proporções originais
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 20)
                    .padding()
            }
            
            
            
            Button(
                action: processYears, label: {
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
    
    func processYears() -> Void {
        guard
            let yearsInput,
            let monthsInput
        else {
            // Caso anosInput seja um nil e o else não é o ultimo elemento da função, um
            // return deve ser adicionado para que o funcionamento da função seja enterrompido.
            print("Campo de entrada não preenchido!")
            return Void()
        }
        
        guard yearsInput > 0 || monthsInput > 0 else {
            print("Algum campo tem que ser maior que zero!")
            return Void()
        }
        
        // meu resultado vai ser years * 7 mais a fração de meses do ano * 7
        result = yearsInput * 7 + (monthsInput * 7) / 12
    }
}

#Preview {
    ContentView()
}
