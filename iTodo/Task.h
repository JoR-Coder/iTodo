//
//  Task.h
//  iTodo
//
//  Created by Jyrki Rajala on 2014-05-11.
//  Copyright (c) 2014 Jyrki Rajala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic) NSString *Title;
@property (nonatomic) NSString *TodoText;

-(instancetype) initWithTitle:(NSString *) title andDescription:(NSString *)todoText;

@end
