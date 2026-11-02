//
//  FocoViewModel.swift
//  fichaFoco
//
//  Created by COTEMIG on 31/10/26.
//

import SwiftUI
import Combine

// Complete a ficha de foco. O enunciado esta em "00 - Capitulo 5".
class FocoViewModel: ObservableObject {
    @Published var materia = ""
    @Published var minutosAlvo = 25
    @Published var nivelFoco = 0.5
    @Published var somLigado = false
    @Published var dataProva = Date()

    var formularioValido: Bool {
        false
    }

    func reiniciar() {
        materia = ""
        minutosAlvo = 25
        nivelFoco = 0.5
        somLigado = false
        dataProva = Date()
    }
}
