//
//  Porte.swift
//  CaoCuladora
//
//  Created by Joao Filipe Reis Justo da Silva on 10/05/24.
//


import Foundation


enum Porte: String, CaseIterable {
    case pequeno
    case médio
    case grande
    
    func conversaoDeIdade(anos: Int, meses: Int) -> Int {
        let result: Int
        let multiplicador: Int
        
        switch self {
            case .pequeno:
                multiplicador = 6
            case .médio:
                multiplicador = 7
            case .grande:
                multiplicador = 8
        }
        
        result = anos * multiplicador + meses * multiplicador / 12
        return result
    }
}
