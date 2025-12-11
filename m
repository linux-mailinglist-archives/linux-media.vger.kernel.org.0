Return-Path: <linux-media+bounces-48655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C947BCB7396
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 22:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16208301E1A2
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 21:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5592D23A3;
	Thu, 11 Dec 2025 21:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hp5CLknB"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69B7221FD0;
	Thu, 11 Dec 2025 21:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765489000; cv=fail; b=hx94ES3x+aSb9Dnl+V6Q+CL0ly+IL0ftHga1LsT6oWbB8MGH2tJL9DNeIxLbXyeFpPqRoju5cTEl5UWEFb3hPAgTyAV2GbGvHdykiM3U/sZkMexX/4/FD39uSGNGAWWXMxeiDeHhKplaxN97eeq+5mN6+Q3Hlial9xWmGlkzQjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765489000; c=relaxed/simple;
	bh=/0HkkNH+WhDDOFhs5786O6KgJBshfQPrOFnXFIW4PR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r/2mjQ2y8fioodyF9IQG8jOArhJJGR7bUexgZ6A4Tpu7ogOWvI5IR8IHDFibMikcDJyXA6XAEM9T7sd2OAWL54uiqCGOXsE5EENbXLuDjEpFk6oHYUsRpnDKEqL4TXPK1SMKS/qZ0Fc5KnzEMrUEd1OXLX9hHYE8SI1zQkljJp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hp5CLknB; arc=fail smtp.client-ip=52.101.46.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9qumx+TJL3gNTHR04MJ7PgDD2h4aMtwkYfBADWMUSFz2HuVdCrGV/t2dLaGkZrYQRc9cE5ktYh3orNO10sJAFWwxD8O/abY9Z+XorifVGlnaELfbxzs9kC0+/dV69nLXR4DYKyX/LAfr3mS0omEgypW/pETlNtZSeb4CE6yVcHl0ksFlbrEOjH17kUWkX5/gAIY8AirtIam4UOBBx0V2fpY7z/IuCbUbBj7lrjcbyHE9O7cKAzK1a0M0HKT3CG4YqJWrV/b7lRNiTw0stTDkCsff+4QZ//wSTgfUSQCdrYofIQRZsPr7lua4qO9VD/Qze8BM4YTfzr/vw4wDUPTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtmimK+tDdG/ZqvmAwgiBvdK6fSdG05syi9B8Jt7LIE=;
 b=Duk2WbtWvA16dBS+mbYbeQuhMRJ6z7mW75EAtUhDCLkaNJo8TeYzVtISx0EihBLxF1072iNb1lnMRatghFkP9n8ayX+AN8Gnn/VmK3hKDLJ8jTgzlxjUVaqNpgMJeIVlVJBJeVr95bscWseSoYNPuiS/GYhT0I1B5ajLHGYAxSiQXd1VIcotIWxaxIr9PVf1/gvzHPV2ToUI3t0DBFuNHLXsJ17QRmtgpwRL6GNOWmaNKBn2kSvAPHiNQ57u+WFdiLqtX6ulygkKX3za90CkZAZCCBzbEO3z+gkOVOJyxlorRS0kDjBswMVTgTYJLSCBb8Eu6kD1j7mc3g4gLsOVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtmimK+tDdG/ZqvmAwgiBvdK6fSdG05syi9B8Jt7LIE=;
 b=hp5CLknBDcNU6I+SbvRyw+Unhq5w64MFPlrpgtac+hihw6toBrhuP27nriJgJkoseaYSfS8KLfsCqxppSQBS/QEVcSldxJrSJ2GsRlv7EIDNGyUtDSbZsh68bzidlmn6i0GmpN+D06kFY06GZWL1YcW1N68aotwzjV4dSt87224=
Received: from SJ0PR03CA0335.namprd03.prod.outlook.com (2603:10b6:a03:39c::10)
 by DM4PR10MB5918.namprd10.prod.outlook.com (2603:10b6:8:ab::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.9; Thu, 11 Dec 2025 21:36:34 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::76) by SJ0PR03CA0335.outlook.office365.com
 (2603:10b6:a03:39c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Thu,
 11 Dec 2025 21:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 11 Dec 2025 21:36:34 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 15:36:30 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 15:36:30 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 15:36:30 -0600
Received: from [10.247.25.212] (lt5cg2132ltw.dhcp.ti.com [10.247.25.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBLaUpQ1112276;
	Thu, 11 Dec 2025 15:36:30 -0600
Message-ID: <8ea74bbf-b796-41ac-8500-1956a8a46ba8@ti.com>
Date: Thu, 11 Dec 2025 15:36:30 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: chips-media: wave5: Fix Potential Probe Resource
 Leak
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, jackson.lee
	<jackson.lee@chipsnmedia.com>, Nas Chung <nas.chung@chipsnmedia.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Darren Etheridge <detheridge@ti.com>
References: <20251119213152.1442329-1-b-brnich@ti.com>
 <SLXP216MB1148CE2E7ABF4280D6C27B44EDD8A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
 <fb603b6159766bbba606260d44080733786d290f.camel@collabora.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <fb603b6159766bbba606260d44080733786d290f.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|DM4PR10MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 46607a54-454d-413d-d763-08de38fd5b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlVkOHdzaEZZSzFTb0E0NDdJbVpKVXcxa3c1UVQ5MTFlQWs5TzBmUW9tOXNX?=
 =?utf-8?B?WlVNeGJzb0pNMnVVMFl3U2NDNWtpVWZ2L2ZBVzNtYU15cFV5WXM3cEtkSS8w?=
 =?utf-8?B?S2NpK1Q1aDhXd05mQjRnNDI3dGk5UFM2bzRvSFUwZHZpbzgyUFdRd01nYmh5?=
 =?utf-8?B?TVZuYmJScXY3cHN0VXAxekRPazRKclUrRVIrNHVmQU8xTE5hVEpiVHdqdXpj?=
 =?utf-8?B?eHgrMTZHZ1VJL0xFd0NpLytxTC9jYzRPZGdob09KZ0w1MVdnWEZMT3Q5bkxQ?=
 =?utf-8?B?Q2hyVVlsZS9GTU40T0dLaDZQRllvNkRYSUUvQW5oU29DazU3SFlWUXhrVUFy?=
 =?utf-8?B?Qk00ZHFJRmg2ZzNDL1FER0VtT0U5bjEvRGh0MUFGR2ZBVU9UbEtsS0phblNX?=
 =?utf-8?B?ODZPWDduV1JZb212aTl5M3Z4R1NvR3BoZktXTW1Eb3gvMmwrb0RQbFhPc1li?=
 =?utf-8?B?UzVMeWQ5ck9ndG5TTmdDZU42US9tMGtmRk9sZUVpK0tlWWNHZEF1YVM0NGo1?=
 =?utf-8?B?eEwyM0JubGxEQnA1OWdzbnVzbDY5NlVMRGR3T2ZDSUtpZGhSUExmd25IWWFC?=
 =?utf-8?B?aWhBbThoTnFuYXZGK2VYai9VZTVjTk1ObWVMWnRBQnY0OUtNazM1SWErdnky?=
 =?utf-8?B?M0k4SXZhTlBYQlhxU0xDTGFMZE0xc3VLRk1tbGFySG9QbFg4QWV1T2pBd3FR?=
 =?utf-8?B?QmI3bUlmaHljdEY2azJWRTl6VGlCTGxRdm1vNWM5TWlibkF2S0FqQkMyanBQ?=
 =?utf-8?B?RVF0UkhSellIblJIZGtVS1BPWkx3NFh3TTFNVEZMdHhKd0hmaU5pYkZrRWlu?=
 =?utf-8?B?dU9NeVcvNStYUGpxNFM0WnEzc0dSTWxNZlRJaU5INzZrczNNM3pxZnMrazFB?=
 =?utf-8?B?M0lQN0ErUHJPelJIVVo5cGJ0OHRNK3kwKzhQenlyckwwV1ZKeTB2bU1BZ1R1?=
 =?utf-8?B?ZStoKzE4YkRNcDdYTmIxQkY3ajNiOVgxT1lnOTR1dGswNklSamFORXNuTjU4?=
 =?utf-8?B?MDlIbjlNeUNUTUE5a0MvSXFNU3FHc2FsekRvOVdzcUN1RnVTV0JTYUQ0cTdM?=
 =?utf-8?B?cmNZdEFmTmd6QUJxOGVFWjFoT2hyaS9rTkNlZm1MZDR4MHBnNTNlbGluTEhi?=
 =?utf-8?B?L293c2VwTStzWW9mdCs5WXZuQ1NSNHdZWmlDb1ZUNzNmMDJ1V2hJRnNoUUdv?=
 =?utf-8?B?WDdLWUw1S2pIcFkrcUNEMnUxSEpxc04yUEsraE1FUml3L3RTZUNHbHhaTzE3?=
 =?utf-8?B?eVVjU1E5NFFSRFdTVWVmREF6VjBzWGhZTmdXaTVjOW9HWXU0OElLdzZkczd1?=
 =?utf-8?B?eFJhM1NMWmdOaGNJdHZ3ZktTVkpPcTcrU3NwQ0NwL1hYOTZISldwcmJOMy9m?=
 =?utf-8?B?WDhJSmVIdS8zM0ZMMFRqMHhUQVYrbENqRk5vanpCTjhWYVNZaFAya1pCZC82?=
 =?utf-8?B?UE1ZTzB0M1NGbGJwTUpwa2FiTytTS0htbW1aRDlIUHlvdWtEeVp4VERHRm5B?=
 =?utf-8?B?aTJiaFZhWEdTbytDb3JHREQ4U3hUczFpMGsvYmdqNmFveElMYWREQ2F1QVFY?=
 =?utf-8?B?M2RFUW52SDJ0YldTNE1kNUV4Wnl2SVBoSWZ1QitlSDgvWDRJMDU4eEtLby9V?=
 =?utf-8?B?M3ZYUmpPWVdyTHRaLzZFSmFLcTU3enAyQ1V1YTMxaExIZGNMWXFrVlJsbk02?=
 =?utf-8?B?ZGVuRVM4RG5hVStyU3ZXT2tJS0JCZ0pnMUQvMmh1NGliUFhtRmV4eDIrRHhq?=
 =?utf-8?B?dnIvdzNEWHZjVG1hTXFnTUZ6dVBURVRZVjFvSUx1ZkRLZ1Jkd2hTNlBMaGtP?=
 =?utf-8?B?VXoyRldmMnJSM0s2M05tTkVld0NJbDlJMW4ranVMbDlyVFVWRjY3OC9Jc3RE?=
 =?utf-8?B?NmFFenZLU0g1ME1xR1Fwa1JpNkJGbktXOFFpakJabEhDZE5zMjZhMXZiSjlz?=
 =?utf-8?B?eW15ZkxuSkx3ZUFTRGhRZXZWblZwVFR1OGVzQ1dtYkpkeEE3UGZuSlVhaVNu?=
 =?utf-8?B?QURUMkZReEhHTEZOdXlZUjhyd1dISTE1QVNFSUMwWmFGaEk0R1BabVQ0U3Yx?=
 =?utf-8?B?OGRNb1JnSms1VWN6b2l0UTVWQ1hTQThNejRDRWZHeVFwdmR1V1RaVUhqSzhM?=
 =?utf-8?Q?QW9g=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 21:36:34.4531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46607a54-454d-413d-d763-08de38fd5b79
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5918

Hi Jackson and Nicolas,

On 12/11/2025 9:04 AM, Nicolas Dufresne wrote:
> Hi,
> 
> Le mardi 02 décembre 2025 à 02:06 +0000, jackson.lee a écrit :
>> Hi Brandon
>>
>>
>>> -----Original Message-----
>>> From: Brandon Brnich <b-brnich@ti.com>
>>> Sent: Thursday, November 20, 2025 6:32 AM
>>> To: Nas Chung <nas.chung@chipsnmedia.com>; jackson.lee
>>> <jackson.lee@chipsnmedia.com>; Mauro Carvalho Chehab <mchehab@kernel.org>;
>>> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Nicolas
>>> Dufresne <nicolas.dufresne@collabora.com>
>>> Cc: Darren Etheridge <detheridge@ti.com>; Brandon Brnich <b-brnich@ti.com>
>>> Subject: [PATCH] media: chips-media: wave5: Fix Potential Probe Resource
>>> Leak
>>>
>>> After kthread creation during probe sequence, a handful of other failures
>>> could occur. If this were to happen, the kthread is never explicitly
>>> deleted which results in a resource leak. Add explicit cleanup of this
>>> resource.
>>>
>>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>>> ---
>>>
>>> I am aware that all the dev attributes would be freed since it is
>>> allocated using the devm_* framework. But I did not believe that this
>>> framework would recursively free the thread and stop the timer. These
>>> would just be dangling resources unable to get killed unless deliberately
>>> removed in the probe function.
>>>
>>>   drivers/media/platform/chips-media/wave5/wave5-vpu.c | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>>> b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>>> index e1715d3f43b0..f027b4ac775a 100644
>>> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>>> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
>>> @@ -339,6 +339,11 @@ static int wave5_vpu_probe(struct platform_device
>>> *pdev)
>>>   	v4l2_device_unregister(&dev->v4l2_dev);
>>>   err_vdi_release:
>>>   	wave5_vdi_release(&pdev->dev);
>>> +
>>> +	if (dev->irq < 0) {
>>> +		kthread_destroy_worker(dev->worker);
>>> +		hrtimer_cancel(&dev->hrtimer);
>>> +	}
>>
>> I'd like to change the above to as below.
>> I think we have to distinguish failure between registering IRQ handler and
>> registering v4l2_device_register.
>>
>> err_irq_release:
>> 	if (dev->irq < 0) {
>> 		kthread_destroy_worker(dev->worker);
>> 		hrtimer_cancel(&dev->hrtimer);
>> 	}
>> err_vdi_release:
> 
> That's seems more then just a suggestion, I see that err_vdi_release: is reached
> on worker creation failure. Checking the kthread code, this will cause a use
> after free instead of a leak.

Agreed with all above statements. I will update to fix use after free 
that I introduced in v1.

> 
> An additional question, aren't we are supposed to also cleanup irq_thread ? We
> have this code being introduced in the remove function now:
> 
> 
> 		if (dev->irq_thread) {
> 			kthread_stop(dev->irq_thread);
> 			up(&dev->irq_sem);
> 			dev->irq_thread = NULL;
> 		}

This portion of code is being introduced in Jackson's performance 
series. I did not base my patch on this series since it hasn't been 
accepted yet. I assumed my patch would make it in before since this is 
easier to review than that series. Apologies if I need to base on that 
series. Can rebase this in v2 if requested.

Otherwise, I suggest Jackson to add irq_thread cleanup in next iteration 
of performance series.

Best,
Brandon

> 
> 
> 
> regards,
> Nicolas
> 
> 
>>
>> thanks
>> Jackson
>>
>>
>>>   err_clk_dis:
>>>   	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
>>>   err_reset_assert:
>>> --
>>> 2.34.1
>>


