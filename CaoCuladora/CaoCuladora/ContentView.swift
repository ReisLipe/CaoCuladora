//
//  ContentView.swift
//  CaoCuladora
//
//  Created by Joao Filipe Reis Justo da Silva on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    // Esse @ na frente de State é um wrapper. Eu ainda não sei o que é isso :)
    @State var yearsInput: Int? = nil
    @State var monthsInput: Int? = nil
    @State var result: Int?
    @State var porte: String = "Pequeno"
    let portes = ["Grande", "Médio", "Pequeno"]
    @State var porteSelecionado: Porte = .pequeno
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
                .font(.header5)
            
            Text("Anos")
                .font(.body1)
            TextField(
                "Digite a idade em anos completos",
                value: $yearsInput,
                format: .number
            )
            
            Text("Meses")
                .font(.body1)
            TextField(
                "E quatos meses ele tem?",
                value: $monthsInput,
                format: .number
            )
            
            Text("Porte")
                .font(.body1)
            Picker("Porte do cão", selection: $porteSelecionado){
                ForEach(Porte.allCases, id: \.self){ porte in
                    // Texto é o que estará escrito e tag é o valor que ele atribuirá a variável
                    // em evidência
                    Text(porte.rawValue.capitalized)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            
            Divider()
            
            if let result {
                Text("Seu cachorro tem em idade humana...")
                    .font(.body1)
                Text("\(result) anos")
                    .font(.display)
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
                            .font(.body1)
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
        
        result = porteSelecionado.conversaoDeIdade(
            anos: yearsInput,
            meses: monthsInput
        )
    }
}

#Preview {
    ContentView()
}
