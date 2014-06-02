//
//  Task.m
//  iTodo
//
//  Created by Jyrki Rajala on 2014-05-11.
//  Copyright (c) 2014 Jyrki Rajala. All rights reserved.
//

#import "Task.h"

@implementation Task

-(instancetype) initWithTitle:(NSString *)title andDescription:(NSString *)todoText{
	self = [ super init];
	
	if (self ) {
		self.Title = title;
		self.TodoText = todoText;
	}
	
	return self;
}

@end
