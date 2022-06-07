//
//  File.swift
//  
//
//  Created by Maitri Vira on 20/05/22.
//

import RxSwift
 
public protocol DataSource {
    associatedtype Request
    associatedtype Response
    
    func getRestaurants(request: Request?) -> Observable<Response>
    
}
