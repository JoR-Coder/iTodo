//
//  Task.m
//  iTodo
//
//  Created by Jyrki Rajala on 2014-05-11.
//  Copyright (c) 2014 Jyrki Rajala. All rights reserved.
//

#import "Task.h"

@implementation Task

-(instancetype) initWithTitle:(NSString *)title andDescription:(NSString *)description{
	self = [ super init];
	
	if (self ) {
		self.title = title;
		self.description = description;
	}
	
	return self;
}

@end
