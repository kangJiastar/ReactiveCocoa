//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by apple on 15/7/3.
//  Copyright (c) 2015年 cloud7. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"
#import <ReactiveCocoa.h>



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFiled;
@property (weak, nonatomic) IBOutlet UIButton *userName;
@property (weak, nonatomic) IBOutlet UIButton *passWord;


@property (nonatomic,strong)NSString *name;

@property (nonatomic,assign)NSInteger d ;


@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    RACChannelTerminal *channelA = RACChannelTo(self, valueA);
//    RACChannelTerminal *channelB = RACChannelTo(self, valueB);
//    
//    [[channelA map:^id(NSString *value) {
//        if ([value isEqualToString:@"西"]) {
//            return @"东";
//        }
//        return value;
//    }] subscribe:channelB];
//    
//    [[channelB map:^id(NSString *value) {
//        if ([value isEqualToString:@"左"]) {
//            return @"右";
//        }
//        return value;
//    }] subscribe:channelA];
//    
//    [[RACObserve(self, valueA) filter:^BOOL(id value) {
//        return value ? YES : NO;
//    }] subscribeNext:^(NSString* x) {
//        NSLog(@"你向%@", x);
//    }];
//    
//    [[RACObserve(self, valueB) filter:^BOOL(id value) {
//        return value ? YES : NO;
//    }] subscribeNext:^(NSString* x) {
//        NSLog(@"他向%@", x);
//    }];
//    
//    self.valueA = @"西";
//    self.valueB = @"左";
   
   
}


//RACObserve() 参数为对象名和属性名，新建一个Signal并对对象的属性的值进行观察，当值变化时Signal会发出事件
- (void)demo1
{
    self.name = @"123";
    
    //相当于 - (id)valueForKey:(NSString *)key;
    //注意:没有根据路径查找数据的能力.也就是不能根据KeyPath访问属性详见KVC
    [RACObserve(self, name) subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
    
    //并不会起作用
    /*
    [RACObserve(self, textFiled.text) subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
     */
    
    self.name = @"456";
    
    self.name = @"6789";
}

//单边
//范例解释: 你唱歌，我就跳舞。
- (void)demo2
{
    //map:的作用很简单，对sendNext的value做一下处理，返回一个新的值。
    //RAC() 可以将Signal发出事件的值赋值给某个对象的某个属性，其参数为对象名和属性名  例RAC(self, name) 就是将事件返回的值给到self.name
    
    //常见使用:  textField的内容长度隐射成BOOL值，绑定到confirmButton的enable属性上面，当textField输入内容不为空的时候，confirmButton的enable = YES。
    
    
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id subscriber) {
        [subscriber sendNext:@"唱歌"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //map后的block中的value的值就是signalA中所赋予的值
    RAC(self, name) = [signalA map:^id(NSString* value) {
        if ([value isEqualToString:@"唱歌"]) {
            return @"跳舞";
        }
        return @"";
    }];
    
    
    NSLog(@"%@",self.name);
}

@end
