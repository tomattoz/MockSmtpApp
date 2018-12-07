//
//  RawTextHighlighter.m
//  MockSmtp
//
//  Created by Oleg Shnitko on 01/03/2010.
//  Copyright 2010 Natural Devices, Inc.. All rights reserved.
//

#import "RawTextHighlighter.h"


@implementation RawTextHighlighter

+ (Class)transformedValueClass
{
    return [NSAttributedString class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

- (NSColor *)textColor {
    return [NSColor blackColor];
}

- (id)transformedValue:(id)value
{
    if (![value isKindOfClass:[NSString class]])
    {
        return nil;
    }
    
    NSString *string = (NSString *)value;
    return [[NSAttributedString alloc] initWithString:string
                                           attributes:
            @{
              NSFontAttributeName : [NSFont fontWithName:@"Monaco" size:12.0f],
              NSForegroundColorAttributeName : self.textColor
              }];
}

- (id)reverseTransformedValue:(id)value
{
    if (![value isKindOfClass:[NSAttributedString class]])
    {
        return nil;
    }
    
    NSAttributedString *attrString = (NSAttributedString *)value;
    return [attrString string];
}

@end


@implementation RawSystemTextHighlighter

- (NSColor *)textColor {
    return [NSColor textColor];
}

@end
