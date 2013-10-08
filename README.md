NSDate+HTTP_date
================
An NSDate category adding support for HTTP-date. HTTP-date is the date format used in HTTP headers.
Example: Sun, 06 Oct 2013 07:31:05 GMT
For more info on HTTP-date refer to http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1


Use _- (NSString *)httpDateString_ to get an NSString in HTTP-date format, and use _(NSDate *)dateFromHTTPDate:(NSString *)httpDate_ to create an NSDate object from a HTTP-date formatted NSString.
See function documentation below.


__(NSDate *)dateFromHTTPDate:(NSString *)httpDate__

    /**
     * Create a NSDate object from a HTTP-date string. Valid HTTP-date is in RCF1123, RFC850 or asctime format. See http://www.w3.org/Protocols/rfc2616/rfc2616-sec3.html#sec3.3.1
     *
     * @param HTTPdate HTTP-date string representation of a date in RFC1123, RFC850 or asctime format. E.g. Sun, 06 Nov 1994 08:49:37 GMT
     *
     * @returns NSDate object with time as specified by HTTPdate string. Returns null if the string is not valid HTTP-date format.
     */

__- (NSString *)httpDateString__

    /**
     * HTTP-date string representation of this NSDate object.
     *
     * @returns NSString representing this NSDate's time in RFC1123 format.
     */
