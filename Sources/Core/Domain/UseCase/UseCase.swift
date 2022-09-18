//
//  File.swift
//  
//
//  Created by Maitri Vira on 20/05/22.
//

import RxSwift

public protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> Observable<Response>
    
}
