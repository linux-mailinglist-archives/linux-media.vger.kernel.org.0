Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62634363C8
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 16:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhJUOLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 10:11:47 -0400
Received: from mga12.intel.com ([192.55.52.136]:45329 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230283AbhJUOLn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 10:11:43 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="209147755"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="209147755"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2021 07:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; 
   d="scan'208";a="495164022"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP; 21 Oct 2021 07:08:52 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Oct 2021 07:08:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Oct 2021 07:08:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 21 Oct 2021 07:08:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 21 Oct 2021 07:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bxn4413B6booHbhgXMPWQQX/qsumMeDnG1ZKc0Nwg4p4ZtzkTSc8tCPyebFOpkEJMyqVjY3pihp3smwftYU96JNMGOE3gjbrRpy85Fd9btijN18rDqewrusCznsqVonNyTUPaXga1SEbA71q6+fPlwpwO2pkSwx7BEnealEynpUaqGcb11dWeE2e4IVETVakhhWmu/BZ64fZnMdXz5N1qwYgOsGuDivvse9XdqhrIyRCqvi6qIrrJRMZyijJUTLPmZjhhFYMvzLztOHYJahaQusw1KlTxNgIpVSZqckkqbTlUrl4IFl1cq/gY4JA7kQRNAFLGrLGzGV0bep2bm7yeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4PRmccTTxroQlWRuz3fc0V1/DK26ItQKQsJcvwXsiQ=;
 b=j7FfZAKnSYbyQDyiwVLOlQ9LFb8kkUfv/LQeKp6mAg0yyTrmCXuoI+9/aEk/uYD/UTu4VraFkF+NXkK2OyZdmhqvj58Am3yQQzwH3hmOvtfXDOO5mhJ7tb/mak/DQt1kfDI+Z+frHNgmK+5zqbU2JJ8euL8EKrSneSGA4C8ze6UlvS8vc0tSnXRjZLgeKZIkesERRHLBLO5DoCX+kdVAkmyuA8lXjGOfoFzBAzqUMY+IxVik/GcJxAaADzBvrKUT0k96Df77/qGzGShUj1VcBPzWcHXFnMztzLO86iy+9LRtWgc7dvtwjbCbbJDNRwKL+yIfbkzwPcayrayUgkTRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4PRmccTTxroQlWRuz3fc0V1/DK26ItQKQsJcvwXsiQ=;
 b=TfzRa8f29sp1ZD2rU0a+RuVlasWhkYVy9b5BrwxLfeAcYK8Y97XygGkGK+jcpszgOHNWhXd8GoAFhGPayuXvGUJlpaclpX3Ds6KUaAo1xuiXLW4vYjGsBnVbTI5Vr+Sl7UIR9Vw10lCQWQnsCbLodOxs3OXASCqdOjgxRinv4Do=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3182.namprd11.prod.outlook.com (2603:10b6:805:bf::30)
 by SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 21 Oct
 2021 14:08:44 +0000
Received: from SN6PR11MB3182.namprd11.prod.outlook.com
 ([fe80::8165:c7:af1e:438e]) by SN6PR11MB3182.namprd11.prod.outlook.com
 ([fe80::8165:c7:af1e:438e%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 14:08:44 +0000
Message-ID: <be94762f-4518-6bdc-e280-41dba484f377@intel.com>
Date:   Thu, 21 Oct 2021 16:08:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: Re: [PATCH] [media] s5c73m3: Drop empty spi_driver remove callback
Content-Language: en-US
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
CC:     <linux-media@vger.kernel.org>, <kernel@pengutronix.de>
References: <20211021062547.51989-1-u.kleine-koenig@pengutronix.de>
 <163481464506.2663858.16090359620223699606@Monstersaurus>
From:   Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <163481464506.2663858.16090359620223699606@Monstersaurus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR02CA0031.eurprd02.prod.outlook.com
 (2603:10a6:10:52::44) To SN6PR11MB3182.namprd11.prod.outlook.com
 (2603:10b6:805:bf::30)
MIME-Version: 1.0
Received: from [192.168.0.29] (95.160.158.79) by DB7PR02CA0031.eurprd02.prod.outlook.com (2603:10a6:10:52::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend Transport; Thu, 21 Oct 2021 14:08:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2390b63f-0a9b-495a-a65e-08d9949c4adc
X-MS-TrafficTypeDiagnostic: SA2PR11MB5003:
X-Microsoft-Antispam-PRVS: <SA2PR11MB50032B544AED881DCF356725EBBF9@SA2PR11MB5003.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b6s0VIrsNezlxsxeOoNydDtu0cjUTyoQ102M2RlNxaHAh5Q6xHk5XdkaI2B1DPTFFW0hF6BBcQpOtvV0Z/T0zgjG4LHGjXC88qd4f/grOcNd0NvJ58UtC4NukBYIEnNZXM2EG+zGJwEEjqigr884k7Ni9eV+NuXLDNTQaqol7bekI3D5PrPgQlCEP3fGF+g0fm+/L/0A1op9Z13RfKCVyPQHvQ0E9i63XCoX8X7HiEgMLiQCUoRBTF24FEQaKhHeZNAR0mXOc5E6SxahX8wEUcPvtMzy04M4zAMBuO0OSddWMwM1er/lvwMQrrBMpkQ/JO9b0E8ipaU/TdGxsMYzgUlb2HnMZWEb0Vsl0Zz4Lw52wjOpVIeVmtd1mskxkIy5R6umxrdwtrrrgUoDb7PAksWRLnCxTzpWfQwOBLhV1kVOfZ3pvbsCPPRfcBcBY6N3Lm5/JlzTOuotQ9hvFXR1SXFsR2zQxRheBuwFoD+5tVZNwi+ryzWWEf8rxMDIVhDpTr/v5gVvzK4OOMchxFkl0Usm+UUDOwMrKDLNwY7SKqcWBiV1sU9vOPtwu79jL3fZGeXOdhctCC5ickLiPRLiqWBbBxBG/mg/E4B08LyABuV8uXZJRWtk0CR1+94yI51oKjBVP9HtFLhHHeEUCs3TmGJ3Y89a0DBKSQw7SI/kzhOOz8UclFH02dRMGWmhiYwnu92LRmqcTV93S+jzafO3UoFCS1Ly3J6mNIXXWJQzo8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3182.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(36756003)(66946007)(2616005)(66476007)(186003)(26005)(5660300002)(66556008)(6666004)(4326008)(2906002)(82960400001)(4001150100001)(956004)(44832011)(53546011)(8676002)(6486002)(66574015)(16576012)(316002)(83380400001)(36916002)(110136005)(38100700002)(86362001)(31696002)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEpWTG1neXJFUER5MjdRYVBFQnU1V2kxcGNJOHpEdmhpZ0N2L0VyYnJna3JW?=
 =?utf-8?B?YnhHU2FtdjQzM2tPbmljRDN2M3R5WHVRQlgvQkorQ29GeisyTFNCbEwwT21j?=
 =?utf-8?B?ZDZBOVJEUTloUHdDdU5ycjN4SlpkbHN5S1J6em95WHV0UXViVEJtOURERTNj?=
 =?utf-8?B?YWEvZFBncXlaQ0p5NGdOaktIRHh5MGhCWHNaa05Sb216THJKRkZMOUNGNjJu?=
 =?utf-8?B?eTZyM3RvMmE0NnhLQWZZSTZ0cGVSa1REdERIQndvekZjWmJvd0R3cWQvN0Vo?=
 =?utf-8?B?ZWdKS3dGSGxuVFcwU3M4dDlIWDlKY01HbUVtR09zS0s2YVMzM2trRTF3SEFP?=
 =?utf-8?B?QmE5VzdMd1hWbmp5NHdFZzdpUnFoczZpUE1zb2t2T1ZiUDRzd3FJSnZ4MDcy?=
 =?utf-8?B?MjVLek5JbWVjTlQxeTNNVXRSRlZPSVErdzIrQW1OOEtnd0xPZTRFenR3b0FE?=
 =?utf-8?B?bVF6elo2d0RjclB0UGtVU2h0TW1nb0tmVThKUFFrU0FVVUlETVhjQzk3bERr?=
 =?utf-8?B?dHh3THJOMWFkNjZCUU1vSVlEU0xaRmZsYUVaWnNZUUhUNTYwMkNUcnJDeG9n?=
 =?utf-8?B?SnphQnArOElYbGVmZXVOa0g4czZsOHF3UzE5WGxJb01STFhwQ0RjMTFxaWR1?=
 =?utf-8?B?cnZiaDF2aExQQTI0NktaVHR0MVRCVW1vdVRYSTJXVjBucjBWVkZSWkw0T2s2?=
 =?utf-8?B?ZmpBM0RlZEpMZmVDUTh4bTVxeTJDSlJMK0lZaVVWZlFSS3Q3bVl5RUQ3UURR?=
 =?utf-8?B?YkhSRytETFAyTWpXcDUwclRnMk8rdWZxQ3Y2aXBlUXoxZUJaUjIrQWV0M25a?=
 =?utf-8?B?bUxmS0JkcStjc3FwdmFFVkVzZGk2MkZSemNiSzF3U21EcWIyTXBpaFdENVdS?=
 =?utf-8?B?RTlHV1MrN1d1SFZBRFJ3bzJCeFp0ZG5TRWlJVEd5cm9lcGtndVYyeHVNRFFu?=
 =?utf-8?B?WWpPV3lPM3JJb3NXc2pwSGN2dXFsVWZNNkoxUmxkbzZqU0ZtdGllK1NQeE9v?=
 =?utf-8?B?SjZlVVpBVGZWdFZlR2ErQVJqZHU3RkdKRzh0K3RNY2c1Zmh0OGpDckpnbHBN?=
 =?utf-8?B?dDBXampoRzcyYVpPU1N1RGJFeFpjS0J4Zmc1eitWcGFFVmxGQWtPTTNETmkx?=
 =?utf-8?B?V1J4cEhLTTNWV1E2Y3pJbFpyb21FcWU3MWJBRVB3VzdDenZoUWVVSldvVHlE?=
 =?utf-8?B?MGlyZS82dlNhL3R1MHJvdzl4cndhUG1IY253MjNnMHAwQnZnK1NVM1o5ckZS?=
 =?utf-8?B?QjFQQWlieER1K2N1cUVmRFZ6Q2ZNRFU1ZHhoVjV4TVBiM0pqNm9RVVlEWEVx?=
 =?utf-8?B?VFczUktlTHR2aEsxMFRIVmhCUS9sUUwxL1FtdFFwcjFUWHVtZmRQNm50K0lx?=
 =?utf-8?B?V2dOSTdSbVFhSVpmdkpzV29rWlhJN2tvTG1tSmlrRFN1NjdUVHlwT21MbnF3?=
 =?utf-8?B?TWt3Zk1hVFZVUDJ2RndVUTRjODZjVllpNnBnRlY2aTgvU1AzL29MVHZOdkF2?=
 =?utf-8?B?MDgrWTc2Rk9mUTJ6c0lOYWVsNWNIbmZxUlNBbCsxMFZQeW5XRTZjalVGYmsr?=
 =?utf-8?B?dFJOVmtBbm1uMmJ4K3o4S2QzekQ5MWVySXNhVG5pUytoQnJiVk5NSVluTmox?=
 =?utf-8?B?S2R2b0J2SzM4bm1KTHJZUFlnciszK0dGSGhTWWVmTU52bXVzNlVwazJBWkdm?=
 =?utf-8?B?VERwZ2k4WXRreWJ5cnJhS01sbVlpelR1a1lFZTVaK2RpOXNyWWg3K1l6TkN4?=
 =?utf-8?B?R1Naa2dsWmhKdzhmdDAzWTBvRGIvYmxRZklTSU1ITW5WcUkrdmc1SnJpY3VP?=
 =?utf-8?B?M01mSE9sZjI1YUVVTFN0TndKWDZmNGxhM1VXcU9PV0VHdDdOZWVwL2JCYUx6?=
 =?utf-8?B?dzVia1dFNEExQXh2Vk1DR0cwTFVUL3pXc3VENkFpOHZrcTNmVEMvRGJxVjdy?=
 =?utf-8?Q?cZuWetuPOpSQ6387gADAg9uvNa9QR3Ba?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2390b63f-0a9b-495a-a65e-08d9949c4adc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 14:08:44.4957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: andrzej.hajda@intel.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 21.10.2021 13:10, Kieran Bingham wrote:
> - To: Updated Andrzej's e-mail address
Thx for update :)
>
> Quoting Uwe Kleine-König (2021-10-21 07:25:47)
>> A driver with a remove callback that just returns 0 behaves identically
>> to a driver with no remove callback at all. So simplify accordingly.
> Looks fine to me though.
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards

Andrzej

>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>>   drivers/media/i2c/s5c73m3/s5c73m3-spi.c | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-spi.c b/drivers/media/i2c/s5c73m3/s5c73m3-spi.c
>> index c102c6bbc118..7fe61187a2f8 100644
>> --- a/drivers/media/i2c/s5c73m3/s5c73m3-spi.c
>> +++ b/drivers/media/i2c/s5c73m3/s5c73m3-spi.c
>> @@ -130,16 +130,10 @@ static int s5c73m3_spi_probe(struct spi_device *spi)
>>          return 0;
>>   }
>>   
>> -static int s5c73m3_spi_remove(struct spi_device *spi)
>> -{
>> -       return 0;
>> -}
>> -
>>   int s5c73m3_register_spi_driver(struct s5c73m3 *state)
>>   {
>>          struct spi_driver *spidrv = &state->spidrv;
>>   
>> -       spidrv->remove = s5c73m3_spi_remove;
>>          spidrv->probe = s5c73m3_spi_probe;
>>          spidrv->driver.name = S5C73M3_SPI_DRV_NAME;
>>          spidrv->driver.of_match_table = s5c73m3_spi_ids;
>> -- 
>> 2.30.2
>>
