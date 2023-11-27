Return-Path: <linux-media+bounces-1069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 032CE7F9B00
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 08:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE21F280CC6
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 07:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B04107BD;
	Mon, 27 Nov 2023 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4b9KG4A"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6C612F;
	Sun, 26 Nov 2023 23:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701070294; x=1732606294;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gtQ80KsDToORt7lKjdUpnw79pkC2wloyzOLRHXg4Skk=;
  b=J4b9KG4AX3A/9g/jvP2PrDOuewdOWXhlOORGUM97TwUOm56J1OVl9YVI
   GTPsi1nEy/lE3TSOfinrJ3hWg+n73dQ3oqCekD0+CL9U3aL0CBtbX98+t
   1dbg4S4NeTS/bMfITwYL+zlrvfEIT7EjccXWWgk/YOsWtX9X5JPmiKgiJ
   1s+yE9k4E+LqMAZ+E9xrbg/I8iFxlaK75bR3m+0yJhHwceEle41KYe4P6
   u77s1NURaU6mqMYNNfYxOXmsC/YkJ+EkEZi8jQX4ImES+FGKH8WN29q1L
   AMYJVOoW9lIbLJAnu0b98C0oWAbE2clSt9expeZg4J9+BwlocyBGiIkOs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="395469568"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="395469568"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 23:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="9695814"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Nov 2023 23:31:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 23:31:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 23:31:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 23:31:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIsPIe4hYWVEjdmPl4NJ7sPbz/W684jITH/aPgUX0j6Nfqcyhga9VgBqcLXO9DkzEG2M/+iR/ukol5ZtMKpWfmzMtrSiB0i2Q6gZ64Z5jtKjkRr1IaL+CU+KIZmtSU4izsBPl/oeAqGkEDNXBG8bplVMGkg1Y8CJlVDGBHB9VsC4JnKvINHNdJn7jcDg/iUW8GKo5Imqy+pyNmQ6d6cfDP6s0/8N8/HL1VLjRhbG0EiMWISjCfVigz7rd+kbIyj/a6XABQFuyzTQbmif1hE9zXsoWTgSrpx0Vz2gDAAFdcSkTA9UUjxueRB6tVAqfpBXZPwgluRXyi5dgu5tOgmjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dZM2XIGgVS0E4D6EmDrBUwgGimYBEZSwFJxKVA0pzU=;
 b=A/YxNVb2592Y7H3Fnw3oxXIp1+uIhFPx/AcbBQog5o5fkMQoSXBNveBGOLTw3Or0jwoisjT52lPoFtRDw0QSczeI7vOxXMWNmHfWLv5oxol13pXu0ouzImeQ6Xup5gRUY2EDQUP4BUZXT3bzcJQQ1l+QPFJKBXriVZNwR+nH3/yM5UaYezknCgUfdKNcjhnwiiWVTWayZ2twNn46YamJQhwxxnpK47jCfU2xb+rG4RnT1sCSsfPGOyrRD2Q8+4ZIwKcZs6u3YwsAq8cQvF43V1gUIQfh787wwHRe4ZkBlDGajJvZ5PKD2jZJmju/Q0ZAOoVzSUzm7sPkldtsqKsuwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4071.namprd11.prod.outlook.com (2603:10b6:a03:18c::28)
 by PH8PR11MB8015.namprd11.prod.outlook.com (2603:10b6:510:23b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 07:31:20 +0000
Received: from BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::9661:77fe:ef12:6189]) by BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::9661:77fe:ef12:6189%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 07:31:20 +0000
Message-ID: <8d401a84-6142-41d7-8094-0bfc680fa9a8@intel.com>
Date: Mon, 27 Nov 2023 15:31:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: int3472: Add handshake GPIO function
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Dan Scally
	<dan.scally@ideasonboard.com>, <djrscally@gmail.com>, Sakari Ailus
	<sakari.ailus@intel.com>
CC: Bingbu Cao <bingbu.cao@intel.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-media@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
References: <20231007021225.9240-1-hao.yao@intel.com>
 <186830d2-dd18-7948-b2c5-bcda934ad3e8@redhat.com>
From: Hao Yao <hao.yao@intel.com>
In-Reply-To: <186830d2-dd18-7948-b2c5-bcda934ad3e8@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To BY5PR11MB4071.namprd11.prod.outlook.com
 (2603:10b6:a03:18c::28)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4071:EE_|PH8PR11MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: b2daa2d8-a470-4637-c8b5-08dbef1ad94d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xk+YpU/X48KM0rncrt84ene30by5GBIF5100LkaoTU/c43D5O+Mk/LaqBeYz6vdGOQ+Y90+M1tcK9Tib1vrsTez7jOj2RCJzmfHSFPU2+gTyNRrOxY45Vliuqg892WNMBpYNAxNqJCefbBvsIe0TG/H4e2CRHe1ht8/uwZ6Rde47qqy6m9I1qfKaqGy07Bn+TiPPYz7fziudkdZGS/ewJq+x1QId4OsWbNIhXRZGSaf+Wo+2A6n0aPY4DLZz/3HPrS/IsrUKTyVEWczgi8wCKCXGm81EM20TK/rd3QH0dRrCvAUZ2n7+gcuAYQDewoqB4cWSvdlC3tv+YZ3MONUj9ZAfONMcP4ees8+YX3UZnjXDf5QICakNCYzE8EW9iBW9TGmdyZnO6/fvGI+ICq8U7v4T6HXEndj5NUa5DMAPHgn+teZwgfj2e3cNj91CopxHhz3mLQQbuIcU28Ak8Fn24W1OLrE7jzjSDkmhfRYdWoAdUS0iq+IOfnM0wOvb61M+evaJTf7j8Zhrs0f2FT4hG+Xjr0ug8hZmvGvumRuBVZk0PYO//Aj85y7DpWQppQ+dspqrCr4f4qIBmxYG0rXxXH+MeqNfFPufVSQn5yZoA4tEP97Wx6L0cLDrWYxNwPahIgvGKXOPnE/8RvcgUCt6rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4071.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(41300700001)(36756003)(31686004)(2906002)(83380400001)(5660300002)(82960400001)(26005)(86362001)(2616005)(44832011)(66476007)(6512007)(53546011)(6506007)(8936002)(6666004)(8676002)(31696002)(4326008)(478600001)(6486002)(6636002)(66556008)(66946007)(110136005)(54906003)(66899024)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVVvMVZ1anpSZTZBempwQ1BuejVFZ25jOWNpc0NmNHZlRmI1dU1OZDl0dTFk?=
 =?utf-8?B?OGpMbXZyTWhXS1ovaGd5SWRZbVdobUV2L3VPa3krYUJWWnVxSC91L2p1TzJn?=
 =?utf-8?B?dTUySFFiUjFGWXpXU0IxY3dJeWE3Sk5lWmtOT2dsc3IzQUY3akdvSlBpdjlt?=
 =?utf-8?B?ZlcvNEFQanNMSHBKOENscmdJWU5oS2ROZGozYzk5RlZNRzhvTEc4cTlhU0kr?=
 =?utf-8?B?bURhZ3BlTzZrTmZEWm85elBZM3B0Nm8yc3k1MTMxUnl2d1Q2LzhBS3lIdmd0?=
 =?utf-8?B?bExCaTZLdG03MEowai8rVWZ5ZlFTLzVhM2hNL05LT1JvM2RTTGZmcGFYSkVp?=
 =?utf-8?B?b0x5b2s1Q1ZLR1ZQL2JTeW9ENkNxZFRHZDZndHJ5bDl2MVhnM0xwMkljRE9i?=
 =?utf-8?B?NVFZNE9adW9paHB3a1pRMHBLa0RlSlp3azl0Y1lUYmxUL09NOFRMMUVyZjZ2?=
 =?utf-8?B?MzF4V2xkRTN1bXUyakt6TDl3VjBSbU1mc0hQd0xTTmpyS0tCM0FSalhuV2ZX?=
 =?utf-8?B?UUJrNmRqTVI0dStQREcxdW5WekV5TGgyM3QreHRpU2krOHdkN3MzaUhkTU10?=
 =?utf-8?B?aThEQnpGUlRWeTVKQm5GMHZQNHF6dWZXYll0dzJlL2VnR3FjWDhVTEQxcHEy?=
 =?utf-8?B?THlmckcrd2RXRnk2VGFjbnUzNWRlc00yamlTQ3hCNThFK0hRTzczMnZQa0dF?=
 =?utf-8?B?OWJQVjA0MVpzWnZIZGZQQzZZcDI3eUMvZlo5UlRyK2lOZ0F4emVhYVd6REd3?=
 =?utf-8?B?OHRyTDdIK1lnT0pyQkJYSDh0bW1ZbUpTUWhGTi92UEQzazZzbWhjOXVtSEVa?=
 =?utf-8?B?N0xiTDRlcXhQRm04MC91djd1MXl5Q3licjlmNS9saWVES1lwVFJKcUc5RjdQ?=
 =?utf-8?B?VXY2bGtRTU0rNDBSTUtYeUxGcmNtTlp0a1BtOHRsTmUwci9JYzNQSHl6VUgx?=
 =?utf-8?B?Um45TGRDRzRBTFdITHoxWFB1c3hzMXhrdTA1NkRBbUx4UTM2S0VnM21adVAx?=
 =?utf-8?B?RmhkREMra1J1MDA0VzlxSjRZc2Q5ZjYwbTNOeTVOd1hNUm5CL3Vjb0t4ZVEz?=
 =?utf-8?B?ZlJYNEhHRzhKekZuaTd2VHBiLzFRUzh0YkhSWWVzUk50VGlXVm1BWDZwN1or?=
 =?utf-8?B?R0dEUFJUcnRDZzZRWmdlbFJiQzgzRnRqbTgwUGFLYWduOG4rV1Bid1FSbEsx?=
 =?utf-8?B?Nm0rOFhRZFg4cm9TQlpYcForN0tmZUNSY1VJN1Jjb3UrNHZ3b1IwR25QbGhl?=
 =?utf-8?B?cnA5UlRYVVlaL0RRVDJhSitOMG01M1dNZFJjYVVpQ253TEU5UWhWMDBCU2xn?=
 =?utf-8?B?Sk5Za3VlWjBBSUNYWHE2bDRPK0xTU3JHU3Q4bUJaOVlFV2xZR21wbU10ZzNX?=
 =?utf-8?B?aGZrdjltUzFWTSs1RjA1V0NJc1E0bm94eGNqS1JDNGxIVC85d0VSUWJlWENi?=
 =?utf-8?B?ejlWOXk1cDE2eDQycHB2VDdFZm9tdWs5b0kyNHNjektRMStoRzkwRFZNeXVy?=
 =?utf-8?B?S2pCMU01YnR5Vzl2ZGhqVWFLOUIxdEdtRVVkZTQzcG5yaVdYMXdtd0pYcDFJ?=
 =?utf-8?B?cUpJc3NMcnhvaXZFRXNjWFRKR0NOUkkzRDJZbmxaMlFidVRxdVV6NE41SzNK?=
 =?utf-8?B?WDVENGttV0Z3ckZxcmNkU3NNV0EwV1VKTDIwMGZWUEtJNkpkdWJnNlBsRnRo?=
 =?utf-8?B?WkJlTmJCM0c1MzdwMjd4NHF3NlB2OGN4RWhrdmNXaVQ1QmtWekVDcHNQdEd2?=
 =?utf-8?B?Mi9Jd0ZHVUdWK0d4eFRFZTk5MmRKVmVoS0FxK0trNURmeG9nMVhoRnZGR05C?=
 =?utf-8?B?VEhyU3R6KzN2K2JGdXp5UmxrNklHTUIyWUJCQkpOUWpycW5nODkvWmNFWUpM?=
 =?utf-8?B?OXk0dXFWa2NrVTlyL0MyODdQRzIwRllNZDY5MUdKemduTURObUNoelRtVmRD?=
 =?utf-8?B?RGpNMnhSZWQrd1NXREdiU1hRYVVORjJoZWtINTF3WTNxOVdjUnBINnZEZG12?=
 =?utf-8?B?aG5UTm1ZUU9NQThKZzIvWEg3RDRkU1hIaTBWaWd2aVpUNkxScXpieEE4akpl?=
 =?utf-8?B?eTZOZlBuU2J0RFJWbXNkcU5ZejdlMjhuQUxzdU5lSTJpRmErL2UxblZLaFll?=
 =?utf-8?Q?fsOKNNSCbKoaFzeG3RdzOtfEN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2daa2d8-a470-4637-c8b5-08dbef1ad94d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 07:31:20.0250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88xP3XwMMOQclgI4qTzalV16YGtrzfVTj9pvzwiilDCizm305nrk/hEhM4jXlr6VKSqvfLvrUvrZD9g0Bn1oSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8015
X-OriginatorOrg: intel.com

Hans,

Sorry for the late response.

The power control logic settings in ACPI table are the same between 
Windows OS and Linux, so I directly add another "handshake" pin handling 
to Linux power control driver as what Windows power control driver did.

On 2023/10/12 20:22, Hans de Goede wrote:
> Hi,
> 
> On 10/7/23 04:12, Hao Yao wrote:
>> Handshake pin is used for Lattice MIPI aggregator to enable the
>> camera sensor. After pulled up, recommend to wail ~250ms to get
>> everything ready.
> > If this is a pin on the "Lattice MIPI aggregator" and
> not on the sensor itself then this really should be
> modeled as such and should not be registered as a GPIO
> consumed by the sensor since the actual sensor does not
> have a handshake pin at all.
> 

Yes. This pin is actually connects to Lattice, not sensor.

> Also we really don't want to need to patch all involved
> sensor drivers to toggle a handshake pin, especially since
> the sensor itself does not physically have this pin.

I agree. Adding GPIO pin controlling code in all sensor drivers is not a 
good idea.

> Can you explain a bit more:
> 
> 1. What the "Lattice MIPI aggregator" is

It actually manages all MIPI lanes, both RGB and IR cameras. It is 
something like the iVSC + LJCA combination which are in kernel v6.6 
mainline.

> 2. What its functions are, does this control reset + pwdn
>     GPIOs for the sensor? Voltages to the sensor? Clk
>     to the sensor ?

It starts outputing MIPI packages when we pull handshake pins high. It 
also has USB-IO function which can supply virtual I2C and GPIO for host 
to control the camera (not physically as actually Lattice handles them). 
I didn't get the schematics, but I believe the GPIOs/Voltages/clocks are 
all controlled by Lattice.

> 3. How the aggregator is connected to both the main
>     CPU/SoC as well as how it is connected to the sensor ?
>     Some example diagram would be really helpful here.

In this case Lattice stands between host SoC and camera sensors. All 
MIPI lanes from sensor and all reset/power pins are managed by Lattice. 
Once one of the "handshake" pins on Lattice is pulled high, Lattice 
start to passthrough MIPI packages from corresponding sensor to host SoC.

> Then with this info in hand we can try to come up
> with a way how to model this.
> 
> Assuming this controls the entire power-up sequence
> for the sensor then I think it could be modelled
> as a GPIO regulator. This also allows making the
> regulator core take care of the necessary delay
> between setting the GPIO and trying to talk to
> the sensor.
> 
> Regards,
> 
> Hans
> 
> 
> 
>>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>>   drivers/platform/x86/intel/int3472/common.h   | 1 +
>>   drivers/platform/x86/intel/int3472/discrete.c | 5 +++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
>> index 655ae3ec0593..3ad4c72afb45 100644
>> --- a/drivers/platform/x86/intel/int3472/common.h
>> +++ b/drivers/platform/x86/intel/int3472/common.h
>> @@ -23,6 +23,7 @@
>>   #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>>   #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>>   #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
>> +#define INT3472_GPIO_TYPE_HANDSHAKE				0x12
>>   
>>   #define INT3472_PDEV_MAX_NAME_LEN				23
>>   #define INT3472_MAX_SENSOR_GPIOS				3
>> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
>> index b644ce65c990..4753161b4080 100644
>> --- a/drivers/platform/x86/intel/int3472/discrete.c
>> +++ b/drivers/platform/x86/intel/int3472/discrete.c
>> @@ -111,6 +111,10 @@ static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polar
>>   		*func = "power-enable";
>>   		*polarity = GPIO_ACTIVE_HIGH;
>>   		break;
>> +	case INT3472_GPIO_TYPE_HANDSHAKE:
>> +		*func = "handshake";
>> +		*polarity = GPIO_ACTIVE_HIGH;
>> +		break;
>>   	default:
>>   		*func = "unknown";
>>   		*polarity = GPIO_ACTIVE_HIGH;
>> @@ -201,6 +205,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>>   	switch (type) {
>>   	case INT3472_GPIO_TYPE_RESET:
>>   	case INT3472_GPIO_TYPE_POWERDOWN:
>> +	case INT3472_GPIO_TYPE_HANDSHAKE:
>>   		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
>>   		if (ret)
>>   			err_msg = "Failed to map GPIO pin to sensor\n";
> 

Best Regards,
Hao Yao

