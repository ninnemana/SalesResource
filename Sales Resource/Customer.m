//
//  CustomerAuthentication.m
//  Customer Resource
//
//  Created by Alex Ninneman on 12/28/12.
//  Copyright (c) 2012 CURT Manufacturing. All rights reserved.
//

#import "Customer.h"

@implementation Customer

@synthesize Id;
@synthesize Name;
@synthesize Email;
@synthesize Address;
@synthesize Address2;
@synthesize City;
@synthesize StateAbbreviation;
@synthesize State;
@synthesize Country;
@synthesize CountryAbbreviation;
@synthesize PostalCode;
@synthesize Phone;
@synthesize Fax;
@synthesize ContactPerson;
@synthesize Latitude;
@synthesize Longitude;
@synthesize Website;
@synthesize Parent;
@synthesize SearchUrl;
@synthesize Logo;
@synthesize DealerType;
@synthesize DealerTier;
@synthesize CustomerRepresentative;
@synthesize CustomerRepresentativeCode;
@synthesize MapixCode;
@synthesize MapixDescription;
@synthesize Key;
@synthesize Locations;
@synthesize Users;

- (void) dealloc
{
    [Id release];
    [Name release];
    [Email release];
    [Address release];
    [Address2 release];
    [City release];
    [StateAbbreviation release];
    [State release];
    [Country release];
    [CountryAbbreviation release];
    [PostalCode release];
    [Phone release];
    [Fax release];
    [ContactPerson release];
    [Latitude release];
    [Longitude release];
    [Website release];
    [Parent release];
    [SearchUrl release];
    [Logo release];
    [DealerType release];
    [DealerTier release];
    [CustomerRepresentative release];
    [CustomerRepresentativeCode release];
    [MapixCode release];
    [MapixDescription release];
    [Key release];
    [Locations release];
    [Users release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[Customer alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Id = [dictionary objectForKey:@"Id"];
        Name = [dictionary objectForKey:@"Name"];
        Email = [dictionary objectForKey:@"Email"];
        Address = [dictionary objectForKey:@"Address"];
        Address2 = [dictionary objectForKey:@"Address2"];
        City = [dictionary objectForKey:@"City"];
        StateAbbreviation = [dictionary objectForKey:@"StateAbbreviation"];
        State = [dictionary objectForKey:@"State"];
        Country = [dictionary objectForKey:@"Country"];
        CountryAbbreviation = [dictionary objectForKey:@"CountryAbbreviation"];
        PostalCode = [dictionary objectForKey:@"PostalCode"];
        Phone = [dictionary objectForKey:@"Phone"];
        Fax = [dictionary objectForKey:@"Fax"];
        ContactPerson = [dictionary objectForKey:@"ContactPerson"];
        Latitude = [dictionary objectForKey:@"Latitude"];
        Longitude = [dictionary objectForKey:@"Longitude"];
        Website = [dictionary objectForKey:@"Website"];
        Parent = [dictionary objectForKey:@"Parent"];
        SearchUrl = [dictionary objectForKey:@"SearchUrl"];
        Logo = [dictionary objectForKey:@"Logo"];
        DealerType = [dictionary objectForKey:@"DealerType"];
        DealerTier = [dictionary objectForKey:@"DealerTier"];
        CustomerRepresentative = [dictionary objectForKey:@"CustomerRepresentative"];
        CustomerRepresentativeCode = [dictionary objectForKey:@"CustomerRepresentativeCode"];
        MapixCode = [dictionary objectForKey:@"MapixCode"];
        MapixDescription = [dictionary objectForKey:@"MapixDescription"];
        Key = [dictionary objectForKey:@"Key"];
        
        NSArray* temp =  [dictionary objectForKey:@"Locations"];
        Locations =  [[NSMutableArray alloc] init];
        for (NSDictionary *d in temp) {
            [Locations addObject:[CustomerLocation objectWithDictionary:d]];
        }
        
        temp =  [dictionary objectForKey:@"Users"];
        Users =  [[NSMutableArray alloc] init];
        for (NSDictionary *d in temp) {
            [Users addObject:[CustomerUser objectWithDictionary:d]];
        }
    }
    return self;
}


@end


@implementation CustomerLocation

@synthesize Id;
@synthesize Name;
@synthesize Address;
@synthesize City;
@synthesize State;
@synthesize StateAbbreviation;
@synthesize Country;
@synthesize CountryAbbreviation;
@synthesize PostalCode;
@synthesize Email;
@synthesize Phone;
@synthesize Fax;
@synthesize Latitude;
@synthesize Longitude;
@synthesize CustomerId;
@synthesize ContactPerson;
@synthesize IsPrimary;
@synthesize ShippingDefault;

- (void) dealloc
{
    [Id release];
    [Name release];
    [Address release];
    [City release];
    [State release];
    [StateAbbreviation release];
    [Country release];
    [CountryAbbreviation release];
    [PostalCode release];
    [Email release];
    [Phone release];
    [Fax release];
    [Latitude release];
    [Longitude release];
    [CustomerId release];
    [ContactPerson release];
    [IsPrimary release];
    [ShippingDefault release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[CustomerLocation alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Id = [dictionary objectForKey:@"Id"];
        Name = [dictionary objectForKey:@"Name"];
        Address = [dictionary objectForKey:@"Address"];
        City = [dictionary objectForKey:@"City"];
        State = [dictionary objectForKey:@"State"];
        StateAbbreviation = [dictionary objectForKey:@"StateAbbreviation"];
        Country = [dictionary objectForKey:@"Country"];
        CountryAbbreviation = [dictionary objectForKey:@"CountryAbbreviation"];
        PostalCode = [dictionary objectForKey:@"PostalCode"];
        Email = [dictionary objectForKey:@"Email"];
        Phone = [dictionary objectForKey:@"Phone"];
        Fax = [dictionary objectForKey:@"Fax"];
        Latitude = [dictionary objectForKey:@"Latitude"];
        Longitude = [dictionary objectForKey:@"Longitude"];
        CustomerId = [dictionary objectForKey:@"CustomerId"];
        ContactPerson = [dictionary objectForKey:@"ContactPerson"];
        IsPrimary = [dictionary objectForKey:@"IsPrimary"];
        ShippingDefault = [dictionary objectForKey:@"ShippingDefault"];
    }
    return self;
}


@end


@implementation CustomerUser

@synthesize Email;
@synthesize Name;
@synthesize DateAdded;
@synthesize Active;
@synthesize Sudo;
@synthesize Location;

- (void) dealloc
{
    [Email release];
    [Name release];
    [DateAdded release];
    [Active release];
    [Sudo release];
    [Location release];
    [super dealloc];
}

+ (id) objectWithDictionary:(NSDictionary*)dictionary
{
    id obj = [[[CustomerUser alloc] initWithDictionary:dictionary] autorelease];
    return obj;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    self=[super init];
    if(self)
    {
        Email = [dictionary objectForKey:@"Email"];
        Name = [dictionary objectForKey:@"Name"];
        DateAdded = [dictionary objectForKey:@"DateAdded"];
        Active = [dictionary objectForKey:@"Active"];
        Sudo = [dictionary objectForKey:@"Sudo"];
        Location = [dictionary objectForKey:@"Location"];
    }
    return self;
}


@end
