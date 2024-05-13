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
    @State var porteSelecionado: Porte = .pequeno
    @State var failedInput: Bool = false
    @State var zeroInput: Bool = false
    let noInputAlertTitle: String = "Preencha os anos e meses"
    let zeroInputAlert: String = "Pelo menos um dos campos deve ter valor diferente de zero"
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20.0) {
                    
                    // Título
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                        .padding(.vertical)
                    
                    // Campo Anos
                    VStack(alignment: .leading, spacing: 8.0){
                        Text("Anos")
                            .font(.body1)
                        TextField(
                            "Digite a idade em anos completos",
                            value: $yearsInput,
                            format: .number
                        )
                    }
                    
                    // Campo Meses
                    VStack(alignment: .leading, spacing: 8.0){
                        Text("Meses")
                            .font(.body1)
                        TextField(
                            "E quatos meses ele tem?",
                            value: $monthsInput,
                            format: .number
                        )
                    }
                    
                    // Seletor de Porte
                    VStack(alignment: .leading, spacing: 8.0){
                        Text("Porte")
                            .font(.body1)
                        Picker("Porte do cão", selection: $porteSelecionado){
                            ForEach(Porte.allCases, id: \.self){ porte in
                                Text(porte.rawValue.capitalized)
                                    .tag(porte)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Divider()
                    Spacer()
                    
                    if let result {
                        Text("Seu cachorro tem em idade humana...")
                            .font(.body1)
                            .frame(maxWidth: .infinity)
                        Text("\(result) anos")
                            .contentTransition(.numericText())
                            .font(.display)
                            .frame(maxWidth: .infinity)
                    } else {
                        Image(ImageResource.clarinha)
                            .resizable() // quero que a imagem redimensione
                            .scaledToFit() // quero sempre mantenha suas proporções originais
                            .frame(maxHeight: 150)
                            .frame(maxWidth: .infinity)
                            .shadow(radius: 20)
                            .padding()
                    }
                    Spacer()
                    
                    
                    Button(
                        action: processYears, label: {
                            ZStack{
                                Color.indigo600

                                Text("Cãocular")
                                    .foregroundStyle(.white)
                                    .font(.body1)
                            }
                    })
                    .frame(height: 50) // frame do botão
                    .cornerRadius(10)
                }
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder) // modificador do TextField
                .keyboardType(.numberPad)   // modificador do TextField
                .bold()
                .fontDesign(.rounded)
                .padding()
                .navigationTitle("Cãoculadora")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.indigo600, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .alert(noInputAlertTitle, isPresented: $failedInput){
                    Button("OK", role: .cancel, action: {})
                }
                .alert(zeroInputAlert, isPresented: $zeroInput){
                    Button("OK", role: .cancel, action: {})
                }
                .animation(.easeOut, value: result)
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
    
    func processYears() -> Void {
        guard
            let yearsInput,
            let monthsInput
        else {
            failedInput = true
            print("Campo de entrada não preenchido!")
            return Void()
        }
        
        guard yearsInput > 0 || monthsInput > 0 else {
            zeroInput = true
            print("Algum campo tem que ser maior que zero!")
            return Void()
        }
        
        withAnimation(.easeInOut.speed(0.5)) {
            result = porteSelecionado.conversaoDeIdade(
                anos: yearsInput,
                meses: monthsInput
            )
        }
    }
}

#Preview {
    ContentView()
}
