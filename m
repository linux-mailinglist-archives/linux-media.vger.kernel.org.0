Return-Path: <linux-media+bounces-1066-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 306B37F9A1A
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 07:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB35D280E7B
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 06:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6B0D507;
	Mon, 27 Nov 2023 06:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaysBNge"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AF718B
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 22:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701067185; x=1732603185;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U5TEtSaVb9b8vFYDt8rsDjqQ4m4L1Xnut1xgCbx3m1s=;
  b=JaysBNgexzG5ZdkXniDmFHREHsN5nbxgC+3+oXSOr++/JpEn/dDTm9xd
   BJYNHo/j+EzeoZrR4SQHm17/kuPYmJHSwUzhRRDMNpJ2O1Nc4/n7UgMDO
   3xwMIWYf9X5aWbcMCL7J04WQwyddYo9sJI6m8SDbOSeez1r7k1BSw4sr7
   JDARaWvgCfd/HjmaDj6rMGpHMTkK+8yRPKrF94bkv6NceBkS89afHve3T
   a2NbUL5CLYmWz01UMSdf/XSdjPv+Nyll4pKXkz1rWEOcK77BKRBsHgpJp
   akVREKbGqCS01t9OlFyK4RCh8U4sM77WcNu+kd7ALev1P+2ShJforD7h6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372801984"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="372801984"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 22:39:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="885911916"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="885911916"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Nov 2023 22:39:44 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 22:39:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 22:39:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 22:39:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B90Q4DfXTPe6mj82ykPeYuWRvcXKlkBBtHav7lOKDqEgxo31kLnuNVKdCHeeT4I9GlSrCHMIRcOwMjfXxMeDRAWO2cIc+MlpQ5lHIHRReeYhgRqBPhtVVGk9nN7sXmpgui3VmqqHJsd7EVx00eTzpddy6b09tWQE0Wy2+eFUkC/lof1JTlpIEIN078rrb0LOKpzEYGnuGwT2dRdl3kS2UEiH6rdqeRc1HUccrgI/jfSt4zBKTKvkDIbTph0yScgf3uqdGu3A1rp1Uqb4tnuq2g5/sO9afzy7A/wozpth0cQQzv1wlDL1RF6tuMDHfyMklWuMaXCIL477yLg1aF86Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAmrY2Y6I9CM8rExBA384FJeR/0eItqMWFUNtXWLlfc=;
 b=lT9JaegoZArTRBn34g6QzgSekRToEHxrsHYSLQ2byKy+B5nPa8Cg9pdyh/c/RjhC1FgaD7tJRTBit3ek3SKqFbEtkTwkflJKt7l5mOf9zzIP7Zm6ukJfTVWkcn7i4vZ45/IsJLf5WZjkGvluWkGZhTsJ42GY0nq+41vz21/Cpve7fjoMb/OMHajvBULMzYfMRkhfDjJHQQdUSLlSHWly8ZiBlZ8GNrTJAth16K4tICKOaPZXq1NxMQOnH9MqKyz0zE4KlFAOfzM1pHGdVPzKAjyOOjEx6Wx/jBNNVfNc0I6HMJt4MAAHDEMQEbhdGmUiNHkbohNeD5ZhYydKHizuJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4071.namprd11.prod.outlook.com (2603:10b6:a03:18c::28)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Mon, 27 Nov
 2023 06:39:37 +0000
Received: from BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::9661:77fe:ef12:6189]) by BY5PR11MB4071.namprd11.prod.outlook.com
 ([fe80::9661:77fe:ef12:6189%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 06:39:36 +0000
Message-ID: <8da923c3-03e4-49a0-ace5-0b62e6a6a20d@intel.com>
Date: Mon, 27 Nov 2023 14:39:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] media: ov2740: Add a sleep after resetting the
 sensor
Content-Language: en-US
To: Bingbu Cao <bingbu.cao@linux.intel.com>, Hans de Goede
	<hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, "Tianshu
 Qiu" <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
	<linux-media@vger.kernel.org>
References: <20231126141517.7534-1-hdegoede@redhat.com>
 <20231126141517.7534-9-hdegoede@redhat.com>
 <493daf1a-373d-ed48-8136-0aab3ab925f4@linux.intel.com>
From: Hao Yao <hao.yao@intel.com>
In-Reply-To: <493daf1a-373d-ed48-8136-0aab3ab925f4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To BY5PR11MB4071.namprd11.prod.outlook.com
 (2603:10b6:a03:18c::28)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4071:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abd6ef5-4313-4101-e556-08dbef139fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zl7kM1YLgnh6F5EBgzncDgaFrFYI0/bMiA0at/oRHV3EJ/YorfQwMFaY9wAlFXHzjUjBeUXJrs1dd5pGPgObO21R3P9yCNWT3V4Tp55gXuTbuorP71cASPjwEigy07wPmV3cGjzBRpkq1QDbkkNWJ5N6JxHHTA7QYNRMN4ycH3BJA1fgDrwwCe/bdyKxAhQup213ioW665pSfgimNDoAt/DpNVSCupZiLqRB1okWbiTQV7nmmv9DqZp32CprN8sBV6J11APe6TOoaFDuJATO48GuPh8v8uwPzTYVlNE3aDyL3Ld1eVQDlPOcPgziGXYOwSuOTL5ylpKJSn1KEZz4ZQ8ORhCxGRuAq+FEGIvCb3PwwKzDLEFzJ/qDyScT/zsgxaUUKjVwcV4C1if6/zzLoEfTY0NZlMGIYtafsWn1gNpk2+ANgHIDOddi3wjpz+in0ftuD3ah9PwW7svQAEZMOyZbFnxxRVUJAwYZL0Z3A3wd4rathkOQ4+xqhj4IKDZPVWpf5ulXBZWFPFrBVvWleUuI/A59wY9tg1sgd257BQOwaHxkcvkFxYWkAfRJuor2BipFGj0mW/EKk87QBX/tHZrZhJYBW1KBVemPssbCzVYH9fq2CYf/SXGUY9RYfwmiOoBkE8lI8TcTUkH1G/kQR9m34PU/xDKxR+BbupVse2bWhz5QwwT8c1eWsD4Km+5j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4071.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(83380400001)(6486002)(966005)(478600001)(6506007)(6512007)(31686004)(6666004)(82960400001)(53546011)(26005)(2616005)(6636002)(54906003)(66946007)(316002)(66556008)(66476007)(44832011)(110136005)(86362001)(5660300002)(2906002)(31696002)(41300700001)(4326008)(8936002)(36756003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUVSNFRKaDgvcmJFUXplY0hxRXJYcitLYmJxaUhuTnN0WmRnRSsvMVdIQ0ZN?=
 =?utf-8?B?eE9id1BRcFBnbThwemJQZGN4SHErcnpmQ0RVajVJSFhZd1NJRFFiS2ZleXh1?=
 =?utf-8?B?ZHJTeVVTZllQQk9pR1hnZVpNVmNTa3VYY2dEWFdUbkkyZFJBMWFicm14ZWZ1?=
 =?utf-8?B?UnJyazNnVnJQNVN3a3BrUzdBS0lqZ2xzOThwOTlPemVtUnpkUGdwWTJqWjFJ?=
 =?utf-8?B?d1BJUFliS2VTM3Iwa2xVVmR4ZkVYdlpqMUF2WGNuMmZmNGJCTFNLbnZHRXMw?=
 =?utf-8?B?MGdIM3RBalhjUUV5UVpoU1BJV01ML2w4aEplcGI0RUZEV0hCQ3UzbHorV1pp?=
 =?utf-8?B?Wi93ZEJudXdzOXhnYW1HcXY0T01wSzlqajEwV1QrdVZvTk5kWDJLSERRdFZv?=
 =?utf-8?B?dmNPWEdXVWg1SHdjaHcrdkhqLzNCMENUTnh3ZVR0VE5ySTFqY0N2Zy95blk0?=
 =?utf-8?B?QlJpbWttRnZwazVuamE4dUxNdjdhZTE1bUFLbGk1S0loKzU3ejAvaWw1Und5?=
 =?utf-8?B?a0Z4R0lvUFlQMHZSQU5XS1NqOENzWlBGZFpPY1I1OWJ3VnVTZEV4OEtGMUor?=
 =?utf-8?B?UXhSeGV5Lys0SFhFL0JTejhsOW51ektMbjFrV29rT1FkYUR5dlNIajRMakEy?=
 =?utf-8?B?UVBtSUVhRTB0a3JldTRnaDRId2N6R0ROb09TQ0NZWm5mWXdqTFdwaGlsUmJV?=
 =?utf-8?B?SGM2VzNmU0tkdjFtNVF1ak9jUHlXSjZzUXB1a1RxaUdCcUV6cUhOemliSTFq?=
 =?utf-8?B?aVZqeWVScEFBZzUvc05aUVdueFpWNytTNldueG1Bc0Z4TUh3OFRqK29HdWtw?=
 =?utf-8?B?Smxmc3lzcnd3bmNSaGJibDJUYWw3L3ROeWs3WjE1N2RQaEE1OS9ONnp3dDlJ?=
 =?utf-8?B?VjI1S0FoSGE0UmNOWVRab25WbjFUb1d0b2UxMk9NZ1QxQnhoeXNSRVpuV2xI?=
 =?utf-8?B?ZDVhYUtxV3c2eDJzeUJNaDRsWmpodjY0ZmFVRm95cndDYmZHcjhPNytPWkNP?=
 =?utf-8?B?QjF6R29sUFNabGVuNmZTSXZFOTR5U3pyVzc5bHNFN0xiYTVJK044UU1lUCs0?=
 =?utf-8?B?TGVnWXpNaGtpSlVydUJKL2JpZCtZaWlUdHJqRXlJeENIajJYSlhITlM5UEk0?=
 =?utf-8?B?UmRuV2d1amdsZFh0ZXpOQUZPQThTeGxrNzlkUnIvaDBvdmQ3aGdIb3NnbmFW?=
 =?utf-8?B?NFUweXhFbGhiRXdPWExCVWNZN3VNTE1KWlluK1RtN21qemVtSC93Qjd6dEFh?=
 =?utf-8?B?TFkxRm4vUS90NGI5THJsazViOG45THdRMFJSbllwbVNZN3JDKzM0eERTMGpz?=
 =?utf-8?B?NWJwMXRHRHZvK0M3NWtMOVh4eGRiN2I1Uy81anZFaEt0dWFWUDJjQkFrL25P?=
 =?utf-8?B?SlJIai9SY2ZFVHRZdThFbm85Q0k5NjR5Qi9FN1Ivai8rc2tUdm8xZjNGWFU4?=
 =?utf-8?B?Q2lWeVZhZWNKRU01dU9maVJZOEJVcTJOcEhQcUxTY3ZpTlFacWh5YVZmb3ZR?=
 =?utf-8?B?NXFsNFpEVEZwRzUzOTErVmtCRjFLOUFWdG9hL1ZBejRFSXJuNVNCZGFsWk1S?=
 =?utf-8?B?SHFOSDhpdVZIanFOVTZna3BQbTJSZVR3Zmx1RVhValFwUlI1RkJ4QmZUbDhz?=
 =?utf-8?B?ZDhOenVxYTJWNE9OZitEaHB4VnlhNUdKQlM5ZWpoR3NoZ28wNFdhUFQ0aEN4?=
 =?utf-8?B?MEx3T0s1dGpxTG1qQlhJQUhTK2hkT0UzQTRRN1dtL21XcHAxN3I2bjlhVXdw?=
 =?utf-8?B?VEVjU3lKYXk0Zy9GcFdBRTZTWUM3SGVWYjBGUmo1SHJPSzRmR3F5bnYzd0dx?=
 =?utf-8?B?cUZPSVBPN1c1U0MyRVE5T3hUQnVQeWF5RWFzR2xZNUo2UDV2UmN5Rk4vajJC?=
 =?utf-8?B?S2FFM2Z3UUVXWCtiZVBoQ2JmM1k5d1pISFFuN0I3Z2htSXAvM083M2RUYUdW?=
 =?utf-8?B?STBSV2xrN3lscmgrbnVQN0pHUHMxQmVYWEZRU0haYUorbmtWb0UyU2lSbERJ?=
 =?utf-8?B?SlBXeVYvTGk2SlkyaVNlMWtTSWFKMllQc0VTb2NqL0NpVmpQT04rYUN0VEov?=
 =?utf-8?B?L0J0RDZBYzRrVmd0RGY0cHZFd1U1TTFmM3hqcTVtRitiMVc0QWMvUEJ5RGJU?=
 =?utf-8?Q?hBjELEq3fzNw6tORa3+Sj++Lx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abd6ef5-4313-4101-e556-08dbef139fc6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 06:39:36.8361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mq6lJBz+ELfpcB7lI9ggRybfvzO38rkPcNqspgmlpgP6usrqeVwJ0TUfBhXPpD27CMLwS+CesG1ZQl9qSklJKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
X-OriginatorOrg: intel.com

Hi Bingbu, Hans,

On 2023/11/27 12:15, Bingbu Cao wrote:
> 
> Hans,
> 
> On 11/26/23 10:15 PM, Hans de Goede wrote:
>> Split the resetting of the sensor out of the link_freq_config reg_list
>> and add a delay after this.
>>
>> This hopefully fixes the stream sometimes not starting, this was
>> taken from the ov2740 sensor driver in the out of tree IPU6 driver:
> 
> Thanks for your patch.
> 
> I don't know the details for ov2740 here, we met some similar issues
> with another OminiVision camera sensor, it is somehow related to the
> OTP read. Unfortunately, we didn't find the root-cause.
> 
> Maybe you can remove the OTP read to check, I think the OTP is useless
> if I don't forget anything.
> 
> Hao, do you have any details for this issue?
> 

Are we talking about this Github issue?
https://github.com/intel/ipu6-drivers/issues/187

I remembered that I added sleep after the power on/off. As for software 
resetting, I encountered similar issue when I worked on HM2170 sensor. 
It hangs if we transfer I2C messages immediately after software reset. 
Even OV2740 document didn't say anything about delay after software 
reset, I think it's worth a try.

I didn't use the OTP feature so I didn't look into it on OV2740.


Best Regards,
Hao Yao

>>
>> https://github.com/intel/ipu6-drivers/
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/media/i2c/ov2740.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index 8f5c33f68d42..a49c065c6cf4 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -128,7 +128,6 @@ struct ov2740_mode {
>>   };
>>   
>>   static const struct ov2740_reg mipi_data_rate_720mbps[] = {
>> -	{0x0103, 0x01},
>>   	{0x0302, 0x4b},
>>   	{0x030d, 0x4b},
>>   	{0x030e, 0x02},
>> @@ -137,7 +136,6 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
>>   };
>>   
>>   static const struct ov2740_reg mipi_data_rate_360mbps[] = {
>> -	{0x0103, 0x01},
>>   	{0x0302, 0x4b},
>>   	{0x0303, 0x01},
>>   	{0x030d, 0x4b},
>> @@ -935,6 +933,15 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
>>   	if (ov2740->nvm)
>>   		ov2740_load_otp_data(ov2740->nvm);
>>   
>> +	/* Reset the sensor */
>> +	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to reset\n");
>> +		return ret;
>> +	}
>> +
>> +	usleep_range(10000, 15000);
>> +
>>   	link_freq_index = ov2740->cur_mode->link_freq_index;
>>   	reg_list = &link_freq_configs[link_freq_index].reg_list;
>>   	ret = ov2740_write_reg_list(ov2740, reg_list);
>>
> 

