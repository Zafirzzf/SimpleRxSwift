//
//  ViewController.swift
//  SimpleRxSwift
//
//  Created by 周正飞 on 2019/1/25.
//  Copyright © 2019年 Zafir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupObservable()
    }
    
    func setupObservable() {
        let observer = AnyObserver<String> { (event) in
            print("观察者收到了事件--", event)
        }
        
        let observable = Observable<String>.create { (observer) -> Disposable in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                observer.onNext("zzf")
            })
            return Disposables.create()
        }
        observable.subscribe(observer)
        
    }
}

extension ViewController {
    func setupUI() {
        for i in 0 ..< 4 {
            let button = UIButton(frame: CGRect(x: 50, y: 100 + i * 50, width: 100, height: 40))
            button.setTitle(String(i), for: .normal)
            button.backgroundColor = UIColor.blue
            button.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
            view.addSubview(button)
        }
    }
    
    @objc func clickButton(_ button: UIButton) {
        let number = Int(button.titleLabel!.text!)!
    }
}

