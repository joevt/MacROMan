//
//  BytesValueTransformer.m
//  Mac ROMan
//
//  Created by Giancarlo Mariot on 25/10/2013.
//  Copyright (c) 2013 Giancarlo Mariot. All rights reserved.
//
//------------------------------------------------------------------------------
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  - Redistributions of source code must retain the above copyright notice,
//    this list of conditions and the following disclaimer.
//  - Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//  POSSIBILITY OF SUCH DAMAGE.
//
//------------------------------------------------------------------------------

#import "BytesValueTransformer.h"

@implementation BytesValueTransformer

+ (Class)transformedValueClass {
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation { 
    return NO; 
}

- (id)transformedValue:(id)value {    
    
    float floatSize = [value floatValue];
    int intSize = [value intValue];
    
    if (intSize == 0)
        return @"";

	if (floatSize<1023)
		return [NSString stringWithFormat:@"%d bytes", intSize];
    
	floatSize = floatSize / 1024;
    intSize   = intSize / 1024;

	if (floatSize<1023){
        if (floatSize == intSize) {
            return [NSString stringWithFormat:@"%d KB", intSize];
        } else {
            return [NSString stringWithFormat:@"%1.1f KB", floatSize];
        }
    }
    
	floatSize = floatSize / 1024;
    intSize   = intSize / 1024;
    
	if (floatSize<1023) {
        if (floatSize == intSize) {
            return [NSString stringWithFormat:@"%d MB", intSize];
        } else {
            return [NSString stringWithFormat:@"%1.1f MB", floatSize];
        }
    }
    
	floatSize = floatSize / 1024;
    intSize = intSize / 1024;
    if (floatSize == intSize) {
		return [NSString stringWithFormat:@"%d GB", intSize];
    } else {
        return [NSString stringWithFormat:@"%1.1f GB", floatSize];
    }
    
}

@end
