//
//  NSDate+HTTP_date.m
//

/*
 Copyright (c) 2013 Niklas Berglund
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import "NSDate+HTTP_date.h"

@implementation NSDate (HTTP_date)

+ (NSDate *)dateFromHTTPDate:(NSString *)httpDate
{
    NSDate *date = nil;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]]; // in case
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]]; // HTTP-date is always in GMT
    
    // RFC1123
    [dateFormatter setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"];
    date = [dateFormatter dateFromString:httpDate];
    
    // RFC3339
    if (date == nil) {
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
        date = [dateFormatter dateFromString:httpDate];
    }
    
    // asctime-date
    if (date == nil) {
        [dateFormatter setDateFormat:@"EEE MMM d HH':'mm':'ss yyyy"];
    }
    
    // RFC850
    if (date == nil) {
        [dateFormatter setDateFormat:@"EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z"];
    }
    
    return date;
}


- (NSString *)httpDateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]]; // HTTP-date is specified in English
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]]; // HTTP-date is always specified in GMT
    [dateFormatter setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"]; // RFC1123 format. HTTP-date is always in RFC1123 format in response headers.
    
    return [dateFormatter stringFromDate:self];
}

@end
