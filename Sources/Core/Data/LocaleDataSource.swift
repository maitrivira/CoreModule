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
    
    func getRestaurants() -> Observable<[Response]>
    func getRestaurant(request id: Int) -> Observable<Bool>
    func addRestaurant(entities: Request) -> Observable<Bool>
    func removeRestaurant(id: Int) -> Observable<Bool>
    
}
