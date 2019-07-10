/**
 * WebService.swift
 *
 * Esta é a classe WebService. Aqui será configurada o ponto em comum de entrada de requests e retorno de das responses
 *
 */

import Foundation

// ------------------------------------------------------------------
// Development Point 01:
// ------------------------------------------------------------------
//
// Desenvolver o corpo do WebService para que possa enviar os rquests e tratar as respostas
//

class WebService {
    
    typealias Completion = (Data?, Error?) -> Void
    
    // Declarar uma Session para executar os requests
    
    func execute(request:URLRequest, completion:@escaping Completion) {
        
        // Cria uma task baseada em um REQUEST
        
        // Executa a task criada
        
    }
}
