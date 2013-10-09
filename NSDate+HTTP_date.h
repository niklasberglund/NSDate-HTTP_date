//
//  NSDate+HTTP_date.h
//
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

/*
 This NSDate category adds HTTP-date support. HTTP-date is the date format used in HTTP headers.
 Example: Sun, 06 Oct 2013 07:31:05 GMT
 For more info on HTTP-date refer to http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1
*/

#import <Foundation/Foundation.h>

@interface NSDate (HTTP_date)

/**
 * Create a NSDate object from a HTTP-date string. Valid HTTP-date is in RCF1123, RFC850 or asctime format. See http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1
 *
 * @param HTTPdate HTTP-date string representation of a date in RFC1123, RFC850 or asctime format. E.g. Sun, 06 Nov 1994 08:49:37 GMT
 *
 * @returns NSDate object with time as specified by HTTPdate string. Returns null if the string is not valid HTTP-date format.
 */
+ (NSDate *)dateFromHTTPDate:(NSString *)httpDate;

/**
 * HTTP-date string representation of this NSDate object.
 *
 * @returns NSString representing this NSDate's time in RFC1123 format.
 */
- (NSString *)httpDateString;

@end
