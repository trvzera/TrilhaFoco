//
//  ContentView.swift
//  fichaFoco
//
//  Created by COTEMIG on 31/10/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var foco = FocoViewModel()
    @State private var mostrarAjustes = false
    @State private var mostrarAlerta = false
    @State private var isEditing = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(foco.materia == "" ? "Sem matéria" : foco.materia)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .navigationTitle(Text("Foco"))
                Text(foco.minutosAlvo == 0 ? "Sem tempo alvo" : "\(String(foco.minutosAlvo)) minutos")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                Text(foco.nivelFoco == 0 ? "Sem nível de foco" : "Nível: \(String(foco.nivelFoco))%")
                    .font(.subheadline)
                    .foregroundColor(.gray.opacity(0.7))
                    .fontWeight(.bold)
                Text("Nível de foco")
                Slider(value: $foco.nivelFoco,in: 0...100,step: 5, onEditingChanged:
                        { editing in
                    isEditing = editing
                }
                )
            }
            .padding(50)
            HStack {
                Button("Reiniciar"){
                    foco.reiniciar()
                }
                .frame(width: 150, height: 50)
                .foregroundStyle(Color.secondary)
                .fontWeight(.bold)
                .background(Color.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                NavigationLink{
                    AjustesFocoView(foco: foco, mostrarAlerta: $mostrarAlerta)
                }label: {
                    Text("Ajustes")
                        .frame(width: 150, height: 50)
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
