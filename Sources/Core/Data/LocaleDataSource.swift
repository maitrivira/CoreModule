//
//  File.swift
//  
//
//  Created by Maitri Vira on 20/05/22.
//

import RxSwift

public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func getRestaurants() -> Observable<[Request]>
    func getRestaurant(request id: Int) -> Observable<Response>
    func addRestaurant(entities: Request) -> Observable<Response>
    func removeRestaurant(id: Int) -> Observable<Response>
    
}
