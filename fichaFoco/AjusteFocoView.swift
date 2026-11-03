//
//  AjusteFocoView.swift
//  fichaFoco
//
//  Created by COTEMIG on 31/10/26.
//

import SwiftUI

struct AjustesFocoView: View {
    @ObservedObject var foco: FocoViewModel
    @Binding var mostrarAlerta: Bool
    @Environment(\.dismiss) private var dismiss


    var body: some View {
        VStack {
            Text("")
                .navigationTitle("Ajustes")
            HStack {
                Text("Matéria")
                Spacer()
                TextField("", text: $foco.materia)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundStyle(Color.secondary)
            }
            HStack {
                Text("Minutos")
                Spacer()
                Stepper {
                    Text(String(foco.minutosAlvo))
                } onIncrement: {
                    foco.minutosAlvo += 1
                } onDecrement: {
                    foco.minutosAlvo -= 1
                }
            }
            HStack {
                Text("Som ao terminar:")
                Toggle(isOn: $foco.somLigado) {
                    }
            }
            HStack{
                Text("Data da prova:")
                DatePicker(
                        "",
                        selection: $foco.dataProva,
                        displayedComponents: [.date]
                    )
            }
            Button("Salvar", action: {
                mostrarAlerta = true
            })
            .alert("Pronto", isPresented: $mostrarAlerta) {
                Button("OK", role: .cancel) {
                    dismiss()
                }
            } message: {
                Text("Sessão de \(foco.materia) pronta: \(foco.minutosAlvo) min.")
            }
        }
        .padding(50)
    }
}

