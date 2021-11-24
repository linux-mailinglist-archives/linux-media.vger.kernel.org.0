Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12D245C34F
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 14:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350363AbhKXNhU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 08:37:20 -0500
Received: from mga14.intel.com ([192.55.52.115]:14971 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352183AbhKXNfQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 08:35:16 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="235514396"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="235514396"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 05:20:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; 
   d="scan'208";a="591566564"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2021 05:20:58 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Nov 2021 05:20:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 24 Nov 2021 05:20:57 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 24 Nov 2021 05:20:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P620Ha5a2g0NF2A6qbML4C5jDLJUVhdXaKxfAR86BQFC6qcEtI2bxWkHxDxGW+oyc9DFsB/zN/8zCXi+/53coj9Ijy0pqtCKWgnpq0a4N1DeIrv6yscHBVY7I0CFStKM1xCVWkE2VeNqFS35RHb0BvQxMwJeg0v/E/+AWL4B+JyGU89s7jCv72pgdR97rIPri5HWrV4zqkrBbGOqcm19zzWxo1a73rEh0CUnSF38Vfiy51vxdc+4mXK8oy16eDgmHScUP+SFfmEpFiATpGJVCSuDOdjDlYBNY99h5wKYyj+yMFvv1sav1BtbFW8ZgOwdEpOJjxOMlhAhDgw+MPyiUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBzVvDI4TIti+PWYjAI9yacQefaPrgzUdA4mhsKDjaM=;
 b=KUZB+aNlBI5a4UWlVxm/yL/dDBYYdpWWY9NHy55H7yrPOOfwecYTGbhNZgp6hciwP1VtO8t6mTUXhVpsHWv/NhixO2Ire/C6xG3nQuhmIX/oBAIRgegDJjOMR3pfecw0YWAw3RWmtW33wWM0rGxlV9ZoM1yNojIgP1RlMtmz4h8XJjajqO8ihHfA8mwrQY6pyaTRoyny3fnMHQSnMleMlJ5GKvdNrYAv9dB6dj+CYTBzXI1+8TInSkTDfLq8NSyoh6LXoonDQXW9br72lf0tksEPr4gaThxlWzsK/1Y35KrKcAzdkX4zSdcmCyFI6c0Jdt5SPFlIk9BjkN9f8bE3yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBzVvDI4TIti+PWYjAI9yacQefaPrgzUdA4mhsKDjaM=;
 b=GF2RlI0SguAC752XKkDbfDc6HcK7DFhR5NAi9GkbMUDK0p8K+m0edS7Awujs1kjigTcAh1GJ0en13koUeVBHyKbNdsqdxF6ofIXMXW5bgGrzSvPj+rM6Z6ztXbJIMOtsphW6CiJnlhbbZVWDkckKM6yg1OK1B37gV47ECO8O8TM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 DM5PR11MB1946.namprd11.prod.outlook.com (2603:10b6:3:10c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Wed, 24 Nov 2021 13:20:56 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::a94a:21d4:f847:fda8%7]) with mapi id 15.20.4690.027; Wed, 24 Nov 2021
 13:20:56 +0000
Message-ID: <1927728f-0f08-52df-be44-bfb5a8544cfb@intel.com>
Date:   Wed, 24 Nov 2021 14:20:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH] s5c73m3: adding gpiod support for the s5c73m3
Content-Language: en-US
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <s.nawrocki@samsung.com>
References: <YWXmB3yHDeR9ORN7@fedora>
 <88ea0b6a-bcb4-94dc-d9c9-a0caa9b9b6e2@xs4all.nl>
From:   Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <88ea0b6a-bcb4-94dc-d9c9-a0caa9b9b6e2@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR0801CA0062.eurprd08.prod.outlook.com
 (2603:10a6:4:2b::30) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
Received: from [192.168.0.29] (88.156.143.198) by DB6PR0801CA0062.eurprd08.prod.outlook.com (2603:10a6:4:2b::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend Transport; Wed, 24 Nov 2021 13:20:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3abd070d-be83-45fb-c97a-08d9af4d3f7b
X-MS-TrafficTypeDiagnostic: DM5PR11MB1946:
X-Microsoft-Antispam-PRVS: <DM5PR11MB1946329D8A54BA72D9A102AAEB619@DM5PR11MB1946.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJ1c8OnBCOCK9nt+VCHTimkMqQDBF4QTDxWpH/h1Ir+/DKLASvWFzAEdxCMsIFpMWuswnO3SvlUAvGEFHT9NnzruO+nMPSVRKX0rjJ7zb6kpU/cHCUpRKbW/65NKNNiwKh1RW5HC0r9soBoWybGH6BmN/JxYtr7ztQIRgAyhE3TFXIiFg5auAqxCo4temLsbsZu0C4dLxr7oeFH0VZxG7bOIIgXqZ1uR0iG32GLcHFgQQN4DX+oHRW8fDFzddNLFIWUO7Z0UkO6sTKrMkbOF09uNMGvWQJyJ4g/+CxWk99vqnYRRJ0HydGb+MIG5hmvzPCxJMESTQxYW++RXongWjaygbRdFAh8/FmnsamIbz3j7lOgLzGVRr8ddy18YZc2sK2qQXQgly2m3Mfm4XFCfU3ieVcZyor8zrgGTTJApQ8Ej4Gij3CX7O65ADyQFV5oXWBYOIlx6uZuE7xW7m41RtB5QG8j58uirLej3S/LT3fJbFcdEwTaa33mHXLajfV8bLRAxJMq/+RWQozL3aK/Xp1i3aDnZiPPNJJ3NZiPY+QyTCZRdibYIqkwk+qYEReZ4bfhegeAPuoc/HBlG8vp2fPQk2pVrriU8hiYlKPVtygocaJIAOGefllf2nfnMmcEyP7pPW+cq8SOrupbA3+rtpIUDDIdxDtVexxYmYpfln3J1AeBMx1H/oCIDc1zuMd9i3nTcQUj8iW285MGk92cCj99MAQg1d0fAzTs1iwJnkbgsBzwNFWmMVSF3NO8ZHskIkU2wS4iFq/VrKMwxj1z2WCZzNllQwl58cPiBo9Q1fJ91XVHqk/OxP3kuAzAWhIte
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3180.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(31696002)(86362001)(83380400001)(6486002)(5660300002)(36916002)(4326008)(44832011)(186003)(2906002)(66476007)(2616005)(36756003)(6666004)(38100700002)(316002)(66946007)(66574015)(8676002)(956004)(82960400001)(53546011)(31686004)(8936002)(66556008)(16576012)(110136005)(508600001)(138113003)(98903001)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amhGUVRlcmNnd0ZFb2pKWGVKNE05UU9UT01OL1VVbGZzRytVV3ZIT2t0cSt2?=
 =?utf-8?B?TW8vYnRwT1U1c2I1aFJ2ZGxlQzRMSXBpei8vbnJCeHRIWHBYZjJadGREOXdS?=
 =?utf-8?B?NXI5VzJCcWJ3cmdCbzRLSmwySzl1L1oybmtUUVMzVzhIUU9WeC8zbldpelVy?=
 =?utf-8?B?YklHOGRWdjlVR1c3SmUvYUFiUUdURnI2ZUpjZ3BMMkNCbXhyckFWWGpDV2hI?=
 =?utf-8?B?Lzg0TzVXY0xtaHE5SGJHaUswMEpod1MwWGxndzU4UXdwOWRQeWdPWWNYSUlx?=
 =?utf-8?B?YzBiVjVmSnNtS050eUN0ZUsxYUI1bHVuY2dkL2grOFQvQTh3RGRodHRCMTZs?=
 =?utf-8?B?KzA2dTgrZjd4VERYaVJRZ0k2WXdaY011VzZ2OU8vT2pnSEJxc2oyc2hPOUN5?=
 =?utf-8?B?R3hWTE9zZlVybnJZanYxa0F5L3MxbSswTk9IT0g4T2pGSmNnei9KT0gyWURB?=
 =?utf-8?B?cHl3NFIvcEFxMlh5SWI5cXpncnhsVFNUckRsakFhNEdvR3VKYzhvOU8vNHlr?=
 =?utf-8?B?aHJpQ2dWN3RubUpxUnA5OThKR1pUb20vZDFLVmZoTUZVeVp1cjNzYTlzckV3?=
 =?utf-8?B?Wng4SHg4K1ZPMTE2TDVNUW9wS2laL1duWjdYcjZUdW1UaTN4MStHVzVRZDZB?=
 =?utf-8?B?bzdIbmM4cktqbnM4MHhPNXRwbTVHc3BMSDZVNDFGYytUWFhtbHdiZHp6Y2FU?=
 =?utf-8?B?dzFwUWo0Z1J2ZjdLamttQ041ZWxWc1J0aHFqVW12L3dCMjZQcEFDOGk4bDUz?=
 =?utf-8?B?d2Rzd2F3K1gyMEZ0UCthYXdIcW0zaHdmYVpYZEVaYmNRallaMVc4WDJIYWx5?=
 =?utf-8?B?dVIxaVBEVmtSQ2huUDVIbExDODc1R3JOQjZYT1Bnamt0Y0ZJYmxUUktSWjJu?=
 =?utf-8?B?NmhBakUrNFM2OUlNNFI1ZHdLMHUzd25QWHZHV0tnWTdicjhSTVFNNjdyck5I?=
 =?utf-8?B?SUk3UFh3WHA2OXdkenMvbmUxaVdNeENnVXZKeW9QRTVtM25uRnh3d3FjV0pG?=
 =?utf-8?B?QW9hbE1RNDZFaThJRXhFOHgvdEJYZHgvVDBxbS8zYSthV3FONm1zdDNPTUtN?=
 =?utf-8?B?VXdYSExpZWFudkdoL0JlVWZyTEhWMXpHdlFJUXZUcGIxWFRzVzZsYnU4Vk5G?=
 =?utf-8?B?VUgvNXY0NEcwS2ZEMkdaekhlWk1BTlFHNEpoQ0hmM3NodjJ1WUY5bGpZU0xN?=
 =?utf-8?B?VnRrZUM5QzIzckVyUEpROU95QzhuT2dLZDd4WGlNTVZXdW1rb2IzTWt5bWY5?=
 =?utf-8?B?SkxaWlAwcm5XK1l4QWxQek9YMnZhVW83aE5xNkRuZlBUUXA4d0t4c1lUR2ha?=
 =?utf-8?B?dHp6cStXS3dNREQ3RzA5TkJ6UW8yL1pPUUhYMDIvSndzYlpuc0duMUZJNjNZ?=
 =?utf-8?B?U3VIem4yekZmZDlGc01BT005V085bWN6d2luQUhYcDcxQTFKK1AxdFJTdVdm?=
 =?utf-8?B?cEdYNGhjVGVOTVZMNlFYa05CNlBUUnI4dWlLWDl3TzlXZ1hTaDFUSUc0RldB?=
 =?utf-8?B?OEJDYjNwSnpOODFXcjhhUHpxTEd1VGRaWTNPNDVBY1NkeFpXRkxIN0F4ekxQ?=
 =?utf-8?B?U1AybTcwSDIwMEhqWmtONE1jb25TMW1lTXJ2U3dXU0I3S0lrZGFwTW9nR3Rq?=
 =?utf-8?B?dUNUMEVuWkJTb3NudUp4clpOZG1MZWpXUmhDcmcrSklianZ1aTBZb2hUS0dS?=
 =?utf-8?B?WlFTdUxEMzloTmZvbmdPMEpkNW5MdWNBRHJaSnhUeEFXRWVkSnhTVStoWGFu?=
 =?utf-8?B?MXRYaUVsejhjSlZQSTg4bG5lS2d4K3ZkMTRhTE5SUXV0SUVJQk81VzRKZ1h0?=
 =?utf-8?B?cUdMSUhZa0JIT0srRHl0dVBiMVV4M0pIbUxIeXF3aHJSMGdTaE9vcmUzTG9s?=
 =?utf-8?B?bFJ0OUp2OW1UalBpWElITENTSGYxQlRjTkFPMzU3R291NmdnMmJRS3VxRk5z?=
 =?utf-8?B?Q25Yb0I5WGZ4bmFCYW9yZ3c2RldQSzhCc3VpNXVodktEMXExUlJQRjUvcnZ0?=
 =?utf-8?B?dklQTHBHRzV5S0hFUmRuWnN0NzB6dmxONDNRQndzQjFkZ0haaEpFcmEzanlX?=
 =?utf-8?B?OUtOL2JYYlJGSTl2UWdocXY4WUV5c3IzRjdML2x4M3FaNHRCL2RMdGloanBS?=
 =?utf-8?B?eHA1eUZvYlRxRmVNMGk1Q1ZpMEY3M3hrTm45R0toVEJ5R1dNME9BQkw3aW9N?=
 =?utf-8?Q?Dj3Xle4N7fIuR+1Yt/wtnbI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abd070d-be83-45fb-c97a-08d9af4d3f7b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 13:20:56.4064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0hDYuQjlAyG+AVeSpP8uCf4/Sh4z3ndlwYSgug9jLEajSIGJ9tHcPc3AOYg6YIbZUp3BTHTO9XGi4chmCVjoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1946
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Maíra, Hans,


On 24.11.2021 12:25, Hans Verkuil wrote:
> Hi Maíra,
>
> On 12/10/2021 21:46, Maíra Canal wrote:
>> Removing old gpiod interface and replacing it for the gpiod consumer
>> interface.
> Has this been tested? I feel a bit uncomfortable to merged this without
> knowing that it works. Andrzej, what do you think about this patch?


This is step into good direction(thanks Maira), but I would suggest go 
further, all this gpio stuff in s5cc73m3 is obsolete. You could remove 
all the code which is already handled by gpiod framework:

- s5c73m3_gpio,

- s5c73m3_parse_gpios,

- s5c73m3_gpio_set_value.


Regards

Andrzej



>
> Maíra, is there a specific reason why you made this patch?
>
> Regards,
>
> 	Hans
>
>> Signed-off-by: Maíra Canal <maira.canal@usp.br>
>> ---
>>   drivers/media/i2c/s5c73m3/s5c73m3-core.c | 25 +++++++++++++-----------
>>   include/media/i2c/s5c73m3.h              |  3 ++-
>>   2 files changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
>> index e2b88c5e4f98..0c69a3fc7ebe 100644
>> --- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
>> +++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
>> @@ -10,7 +10,7 @@
>>   #include <linux/clk.h>
>>   #include <linux/delay.h>
>>   #include <linux/firmware.h>
>> -#include <linux/gpio.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/i2c.h>
>>   #include <linux/init.h>
>>   #include <linux/media.h>
>> @@ -1349,9 +1349,9 @@ static int s5c73m3_oif_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
>>   
>>   static int s5c73m3_gpio_set_value(struct s5c73m3 *priv, int id, u32 val)
>>   {
>> -	if (!gpio_is_valid(priv->gpio[id].gpio))
>> +	if (!priv->gpio[id].gpio)
>>   		return 0;
>> -	gpio_set_value(priv->gpio[id].gpio, !!val);
>> +	gpiod_set_value(priv->gpio[id].gpio, !!val);
>>   	return 1;
>>   }
>>   
>> @@ -1548,20 +1548,24 @@ static int s5c73m3_configure_gpios(struct s5c73m3 *state)
>>   	static const char * const gpio_names[] = {
>>   		"S5C73M3_STBY", "S5C73M3_RST"
>>   	};
>> +	static const char * const prop_names[] = {
>> +		"standby", "xshutdown",
>> +	};
>> +
>>   	struct i2c_client *c = state->i2c_client;
>>   	struct s5c73m3_gpio *g = state->gpio;
>> -	int ret, i;
>> +	int i;
>>   
>>   	for (i = 0; i < GPIO_NUM; ++i) {
>> -		unsigned int flags = GPIOF_DIR_OUT;
>> +		unsigned int flags = GPIOD_OUT_LOW;
>>   		if (g[i].level)
>> -			flags |= GPIOF_INIT_HIGH;
>> -		ret = devm_gpio_request_one(&c->dev, g[i].gpio, flags,
>> -					    gpio_names[i]);
>> -		if (ret) {
>> +			flags = GPIOD_OUT_HIGH;
>> +		g[i].gpio = devm_gpiod_get_optional(&c->dev, prop_names[i],
>> +				flags);
>> +		if (IS_ERR(g[i].gpio)) {
>>   			v4l2_err(c, "failed to request gpio %s\n",
>>   				 gpio_names[i]);
>> -			return ret;
>> +			return PTR_ERR(g[i].gpio);
>>   		}
>>   	}
>>   	return 0;
>> @@ -1586,7 +1590,6 @@ static int s5c73m3_parse_gpios(struct s5c73m3 *state)
>>   				prop_names[i]);
>>   			return -EINVAL;
>>   		}
>> -		state->gpio[i].gpio = ret;
>>   		state->gpio[i].level = !(of_flags & OF_GPIO_ACTIVE_LOW);
>>   	}
>>   	return 0;
>> diff --git a/include/media/i2c/s5c73m3.h b/include/media/i2c/s5c73m3.h
>> index a51f1025ba1c..41e2235f0626 100644
>> --- a/include/media/i2c/s5c73m3.h
>> +++ b/include/media/i2c/s5c73m3.h
>> @@ -17,6 +17,7 @@
>>   #ifndef MEDIA_S5C73M3__
>>   #define MEDIA_S5C73M3__
>>   
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/videodev2.h>
>>   #include <media/v4l2-mediabus.h>
>>   
>> @@ -26,7 +27,7 @@
>>    * @level: indicates active state of the @gpio
>>    */
>>   struct s5c73m3_gpio {
>> -	int gpio;
>> +	struct gpio_desc *gpio;
>>   	int level;
>>   };
>>   
>>
