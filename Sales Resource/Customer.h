//
//  CustomerAuthentication.h
//  Customer Resource
//
//  Created by Alex Ninneman on 12/28/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <RestKit/RKNSJSONSerialization.h>


@class CustomerLocation;
@class CustomerUser;

@interface Customer : NSObject
{
    NSNumber * Id;
    NSString * Name;
    NSString * Email;
    NSString * Address;
    NSString * Address2;
    NSString * City;
    NSString * StateAbbreviation;
    NSString * State;
    NSString * Country;
    NSString * CountryAbbreviation;
    NSString * PostalCode;
    NSString * Phone;
    NSString * Fax;
    NSString * ContactPerson;
    NSNumber * Latitude;
    NSNumber * Longitude;
    NSString * Website;
    NSString * Parent;
    NSString * SearchUrl;
    NSString * Logo;
    NSString * DealerType;
    NSString * DealerTier;
    NSString * CustomerRepresentative;
    NSNumber * CustomerRepresentativeCode;
    NSString * MapixCode;
    NSString * MapixDescription;
    NSString * Key;
    NSMutableArray * Locations;
    NSMutableArray * Users;
}

@property(nonatomic,retain) NSNumber * Id;
@property(nonatomic,retain) NSString * Name;
@property(nonatomic,retain) NSString * Email;
@property(nonatomic,retain) NSString * Address;
@property(nonatomic,retain) NSString * Address2;
@property(nonatomic,retain) NSString * City;
@property(nonatomic,retain) NSString * StateAbbreviation;
@property(nonatomic,retain) NSString * State;
@property(nonatomic,retain) NSString * Country;
@property(nonatomic,retain) NSString * CountryAbbreviation;
@property(nonatomic,retain) NSString * PostalCode;
@property(nonatomic,retain) NSString * Phone;
@property(nonatomic,retain) NSString * Fax;
@property(nonatomic,retain) NSString * ContactPerson;
@property(nonatomic,retain) NSNumber * Latitude;
@property(nonatomic,retain) NSNumber * Longitude;
@property(nonatomic,retain) NSString * Website;
@property(nonatomic,retain) NSString * Parent;
@property(nonatomic,retain) NSString * SearchUrl;
@property(nonatomic,retain) NSString * Logo;
@property(nonatomic,retain) NSString * DealerType;
@property(nonatomic,retain) NSString * DealerTier;
@property(nonatomic,retain) NSString * CustomerRepresentative;
@property(nonatomic,retain) NSNumber * CustomerRepresentativeCode;
@property(nonatomic,retain) NSString * MapixCode;
@property(nonatomic,retain) NSString * MapixDescription;
@property(nonatomic,retain) NSString * Key;
@property(nonatomic,retain) NSMutableArray * Locations;
@property(nonatomic,retain) NSMutableArray * Users;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface CustomerLocation : NSObject
{
    NSNumber * Id;
    NSString * Name;
    NSString * Address;
    NSString * City;
    NSString * State;
    NSString * StateAbbreviation;
    NSString * Country;
    NSString * CountryAbbreviation;
    NSString * PostalCode;
    NSString * Email;
    NSString * Phone;
    NSString * Fax;
    NSNumber * Latitude;
    NSNumber * Longitude;
    NSNumber * CustomerId;
    NSString * ContactPerson;
    NSString * IsPrimary;
    NSString * ShippingDefault;
}

@property(nonatomic,retain) NSNumber * Id;
@property(nonatomic,retain) NSString * Name;
@property(nonatomic,retain) NSString * Address;
@property(nonatomic,retain) NSString * City;
@property(nonatomic,retain) NSString * State;
@property(nonatomic,retain) NSString * StateAbbreviation;
@property(nonatomic,retain) NSString * Country;
@property(nonatomic,retain) NSString * CountryAbbreviation;
@property(nonatomic,retain) NSString * PostalCode;
@property(nonatomic,retain) NSString * Email;
@property(nonatomic,retain) NSString * Phone;
@property(nonatomic,retain) NSString * Fax;
@property(nonatomic,retain) NSNumber * Latitude;
@property(nonatomic,retain) NSNumber * Longitude;
@property(nonatomic,retain) NSNumber * CustomerId;
@property(nonatomic,retain) NSString * ContactPerson;
@property(nonatomic,retain) NSString * IsPrimary;
@property(nonatomic,retain) NSString * ShippingDefault;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end


@interface CustomerUser : NSObject
{
    NSString * Email;
    NSString * Name;
    NSString * DateAdded;
    NSString * Active;
    NSString * Sudo;
    NSString * Location;
}

@property(nonatomic,retain) NSString * Email;
@property(nonatomic,retain) NSString * Name;
@property(nonatomic,retain) NSString * DateAdded;
@property(nonatomic,retain) NSString * Active;
@property(nonatomic,retain) NSString * Sudo;
@property(nonatomic,retain) NSString * Location;

+ (id) objectWithDictionary:(NSDictionary*)dictionary;
- (id) initWithDictionary:(NSDictionary*)dictionary;

@end

//JsonModel.h End

