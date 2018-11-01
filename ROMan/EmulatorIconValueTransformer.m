//
//  EmulatorIconValueTransformer.m
//  Mac ROMan
//
//  Created by Giancarlo Mariot on 19/09/2013.
//  Updated by Em Adespoton on 30/10/2018.
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

#import "EmulatorIconValueTransformer.h"
#import "RomFileController.h"

@implementation EmulatorIconValueTransformer

+ (Class)transformedValueClass {
    return [NSImage class]; 
}

+ (BOOL)allowsReverseTransformation { 
    return NO; 
}

- (id)transformedValue:(id)value {
    
    int iconValue = [value intValue];
    
    // 0 = None
    // 1 = vMacNormal
    // 2 = vMacSpecial
    // 3 = BasiliskII
    // 4 = vMacBasilisk
    // 5 = Sheepshaver
    // 6 = QEMU
    // 7 = SheepshaverQEMU
    // 8 = Unsupported
    
    switch (iconValue) {
        case vMacNormal:
            return [NSImage imageNamed:@"vMac.png"];
        case vMacSpecial:
            return [NSImage imageNamed:@"vMac.png"];
        case BasiliskII:
            return [NSImage imageNamed:@"BasiliskII.png"];
        case vMacBasilisk:
            return [NSImage imageNamed:@"BasiliskII.png"];
        case Sheepshaver:
            return [NSImage imageNamed:@"Sheepshaver.png"];
        case QEMU:
            return [NSImage imageNamed:@"QEMU.png"];
        case SheepshaverQEMU:
            return [NSImage imageNamed:@"Sheepshaver.png"];
        case Unsupported:
            return [NSImage imageNamed:@"None.png"];
    }
    
    return nil;

}

@end
