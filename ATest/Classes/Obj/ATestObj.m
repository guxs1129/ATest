//
//  ATestObj.m
//  ATest
//
//  Created by 顾新生 on 2018/6/13.
//

#import "ATestObj.h"
#import <AFNetworking/AFNetworking.h>
#import "NSString+Test.h"
@implementation ATestObj
-(void)runTest{
    NSLog(@"%s",__func__);
    
    NSBundle *libBundle=[NSBundle bundleForClass:[self class]];
    NSString *reBundlePath=[libBundle pathForResource:@"ATest_bundle" ofType:@"bundle"];
    NSString *filePath=[reBundlePath stringByAppendingPathComponent:@"IBMessageViewController.json"];
    [filePath testString];
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    NSError *error;
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if(error){
        NSLog(@"%@",error.localizedDescription);
    }else{
        NSLog(@"%@",dict);
    }
    
    [[AFHTTPSessionManager manager]GET:@"https://jsonplaceholder.typicode.com/posts/1" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
    
}
@end
