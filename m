Return-Path: <linux-media+bounces-48658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78339CB752C
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 23:56:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FA10300E3D3
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 22:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD78823AB88;
	Thu, 11 Dec 2025 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wN3Y6UfM"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011039.outbound.protection.outlook.com [52.101.62.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F1883F;
	Thu, 11 Dec 2025 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765493762; cv=fail; b=FiTbvnNidm7crZrGNOG2r4/Y8aTTzeWbY2Ol1UozgxmNeuqyg1xngr1do7s1Ts0yt1wXQJWoCYz9xWzPKPKa9V9yDkZaTOtTLdWlrGvXUOz75TPqW+oCKFQz4cA57eAYU5oLUHLhpMGpVEFlu5iV4Lc1/LZmFd0GJkDrGjaqEm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765493762; c=relaxed/simple;
	bh=xB71pij2vjtgJUWw0FyxeUPuvNHWYAVqOevxRGkGK6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=od1C0oCyparxHv4NB2uhgL8Lm4CkImLQ+oXuAmn5UL003eHqOEx5nrcHWfa8JPumiJ+pRUbFJTRJRvR4cQBpONgQDY719yDPHPxfWoRfigbtOJP01pzC+V4RWk9x7hPvR2Li80C6nsf2w8uEU21dlPTsGc71gTE2k6WgoQJjfmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wN3Y6UfM; arc=fail smtp.client-ip=52.101.62.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3tE5bPzdiSRFuybrq8/fcn89E+djHPdWGQrwjHEDsNmnDAvUGJqEV8hQUR6s9iv7VBx3CKL4VR8UkoP+8UIKWDp5JDqtUloxZjG3myRuncy/GAonwOClLiQI4o6WDTy/2uISKvjZOumdgbfRdLHd6Ci1GDRWSA1fWPAOgsLSweAmH+fF9dbOnf3II5hxVRYgEDoDNAwxZCrX/+4y0TQzP6KwoNB91nxDVIkqD6fAQQh2mijL5xYKKCZJvO/E/KZOP4ZT2FbAikd2m1cXkLy/LqikiTUEp2ciwct/YEOrMg1omZs+/ZwNQ6ZBeMiNa/58Y54fvmC26jeeBNR/FmuGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VBslZE4njw/dKeChKjPxqlOts6SpxlBR51dKthCSzc=;
 b=EUpxtCxTldGeWvp4AUH62Q9PIVGE7TlMka0B2sMsxaJUCdfAqy72Wgn4OxQTT9Jw9n6/UytrQbhoAse78XRpPlLKbn/avPI1Q8SJiGtvUnQmpAqiFhOgf+3q7OKABMAHn+3BfOq9nrJH92iHCb+Mq/ZyNlJarqIr9+/ZD17QaecncQw4hrjDbJCgmPhtP3RECKwoMpN35XLC0o4CXaF+1JNKqG/nMqX5vQ63jmIudysR6UdrTibEba2KDJ59Bmev00xYiRHReX8shfUJtxU5iAT2/vU+igeExhNmPynTsK9Uc5lHfJpqDE65nx5lyjyY0WUE50l4XJ/V5Hyolsf7lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VBslZE4njw/dKeChKjPxqlOts6SpxlBR51dKthCSzc=;
 b=wN3Y6UfMy95fWZZYSmLtGqlfOaodhNKwHEgCGmtzuq8WK6sGPBrpX2QzHwDI90fNZAvYbo/10pgxdrc6fhChaDWyq9p76/M8unG32bKz3qazcOK7XIzOuEGPtMaBlcUMhHk7DDZJRyB3AnLE8A9C/bO0b9Pa0ecaLqs+BO51DWM=
Received: from CH0PR13CA0012.namprd13.prod.outlook.com (2603:10b6:610:b1::17)
 by IA1PR10MB7515.namprd10.prod.outlook.com (2603:10b6:208:450::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 22:55:57 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::a) by CH0PR13CA0012.outlook.office365.com
 (2603:10b6:610:b1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Thu,
 11 Dec 2025 22:55:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 11 Dec 2025 22:55:57 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 16:55:50 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 16:55:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 16:55:50 -0600
Received: from [10.247.25.212] (lt5cg2132ltw.dhcp.ti.com [10.247.25.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BBMtouK1205271;
	Thu, 11 Dec 2025 16:55:50 -0600
Message-ID: <a31b4b65-66ae-416a-ae93-33ade8e9ef39@ti.com>
Date: Thu, 11 Dec 2025 16:55:50 -0600
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
 <8ea74bbf-b796-41ac-8500-1956a8a46ba8@ti.com>
 <b17ccc682c636df47055678dacef1c435155f190.camel@collabora.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <b17ccc682c636df47055678dacef1c435155f190.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|IA1PR10MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c72fdd6-ff5d-49c9-3189-08de39087243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHdjY1NsSmVodWh1c09Id1NPM1gyMGJDaFd0aHBUWEdkbDNQTjhBZEdIYTJu?=
 =?utf-8?B?YitLM05pSC81S2JXd3RRdkx1ZFV1TkFtS01JQkY2MDFEVnVwQkxkMkVSWE5G?=
 =?utf-8?B?T0pHMnljY1RiWHpOYzduWVFzM09mMFZqQTRwODVXakFKTkJUMy9kU0pYaTVn?=
 =?utf-8?B?S0lFWncvckRyRWpLbG02YXN2R1pJSG9oTUJQcUx4WFMrTDVka1JsZFg4enhZ?=
 =?utf-8?B?eUxaRTFaUmZaekVJZ2JCSUZuWUkvRG9wdzV5NVBXSWRnWWpZMlgzQW9CWUJu?=
 =?utf-8?B?UXhSMWlZbUVOUEJ2dk9DWWZXeEg4alNZak96UitkYlBIYUNPUHdZU09nMjE5?=
 =?utf-8?B?UmtKczFCYTFBeG83TERtRDB2eDN5NXJnUGRnd1cvdC9KODBua2J1Tk5TMGlG?=
 =?utf-8?B?ZDRWRHRYVjVaT3RLZTdCdUJiRVRPZk5FbnhNOTVOYmZZU0YzblpXeks2T0tL?=
 =?utf-8?B?a3NXTGR4OC9ueFBzTnluZUduMFVpVGJ6enhSYUIzR2FXbEEyRjVJcGlHd2p1?=
 =?utf-8?B?TTN5MjZDWStOdDREREcxbCs5dExpQk9PeGJIVkRINzV6VzVCcVpQK0VMc21I?=
 =?utf-8?B?eE95NXlFY2pSamR6OHY2SWZOcllVRUNHSnVJVFliMmpSMGpkVXlKK2FPMGVw?=
 =?utf-8?B?SVkwcytWcENhN3NQOUN0d1RyR09yTE1LRFl6K25WMjBwUkllOXhrUVpGR1VD?=
 =?utf-8?B?NzlkdEI1ajNzSTVvSFpPVHJpSm1YbmYzRmdPL1JKTWVLVlV4MUZqUDNjdVp4?=
 =?utf-8?B?VVZSTG0rU2QvbzlBMFJpN3NxdGs0QklZeDF5S0NhVVcwZ3kySWs0MEdCQWNw?=
 =?utf-8?B?bEdBZXk3Vmk4bE56T0M4OTdBS2dRM1JicmxCT3diT1Rvc2NLV2FGZmZMcUo1?=
 =?utf-8?B?ZVErNStYWm5pcDl5bUpIQmZTdWgrd1cvL0hHeVJsK2Z0K2xDSzVzUmp2SXg0?=
 =?utf-8?B?ajNHL2pYYmgrR09zWXJzTVMyQlhCMCttTEZsTzErckpZcTBrb3FIVjVKcXJn?=
 =?utf-8?B?MmJEcnYzeldVZkpDK2hlSS8yN2x4Z0ZxSnRxL2hXTEtaQlQ2cXp0NFVNbG1q?=
 =?utf-8?B?VUhZZFp0cERUb1kyeGQrMW5QMVowQ3VNVmVjKzVUNDFpQWw3ZUdyMFd0M241?=
 =?utf-8?B?aU9lVlJYVEdib3RBbGZ5MVgvSW1TZ1hqdkZZRlhPb29UbGY2TWR0SEs4czVr?=
 =?utf-8?B?TVZ4dHFPM08yN3lwSjNRQWxnbHNUR2JMeG9PM3hsVmt1bTN1VUg1QnRDVWRJ?=
 =?utf-8?B?SzZxcGRzZ0tzTGRWa090SmRZVTdaWEVRdGFBZlh2MzBVSzhNOUE1Ymx4ZzdZ?=
 =?utf-8?B?MUVPeWlJNXZES1hZb3BCRHFCZTRZNFRVME96dHVOeFUzNFkwYklrV0pwM0hX?=
 =?utf-8?B?TWd4K1pJRHJaRlhSNWdzeXIycUc2bmQ3OEFIRVBEUVBWQ1dDbDg5Nmo0ZFJS?=
 =?utf-8?B?VXRNcWRIc3FjMTUycUlFZVdrRVppam9PVVgxSUtrd3gwSWFKdTBCZUhHVWRz?=
 =?utf-8?B?cDJQUlM4dmFCTkpIeE56dWV3VDhiZVJnS0JzNHN5Y0h2eGVoSkwyTjhxeDJi?=
 =?utf-8?B?cGovZktYUHFHYU8rdjVHTXZiMW5WN3M3M0hnejBZbEJmME1WcU1qRWcydXBB?=
 =?utf-8?B?V3VST0NuZEdab3E3ZXMxUVRRbEY5bTJHQ2E0T1lCVGwwdU5rbGN3V2MrSWFp?=
 =?utf-8?B?WnRsazBhMU1lU3JkUTZ0Q0pMK1VvanVVdGgxaVBmTUZhQ3JkZS9qUWExRlZt?=
 =?utf-8?B?TXlCOS9wTS95WnhJZWdFYTQ1TU1xQlUvdWtZQXRvcXg5TjJxM0N0MFRLVElx?=
 =?utf-8?B?OEtZS1BrSHZRZGhhQS90RVliVHF1KzIxNmhtRkRZRDJ6TSsxb3FCSWl3M1RQ?=
 =?utf-8?B?dFdDZ3BncmQ1QW40OTJRcHRHRE03NzdwL2l6WUZhK3FuWlYwUDRicGFXTjdp?=
 =?utf-8?B?TmZaUmJJVWRackVCRVNKa09rMzBEbk5MQmQ2UnloRGVycWt0dWpjUDZBd0lz?=
 =?utf-8?B?SlNlUjhDTHFEWko4eUw3VU43dlZYWHpxUnFNcFZMVjEvdTRMbzQzb1FuY1dp?=
 =?utf-8?B?dlprWFErV3gxV2dEbENrZFRaQWxjeWdzUlpsNTBCVmZvanRneGw2NUIxeGto?=
 =?utf-8?Q?8Mxs=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:55:57.1979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c72fdd6-ff5d-49c9-3189-08de39087243
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7515

Hi,

On 12/11/2025 3:51 PM, Nicolas Dufresne wrote:
> Le jeudi 11 décembre 2025 à 15:36 -0600, Brandon Brnich a écrit :
>>>>
>>>> err_irq_release:
>>>> 	if (dev->irq < 0) {
>>>> 		kthread_destroy_worker(dev->worker);
>>>> 		hrtimer_cancel(&dev->hrtimer);
>>>> 	}
>>>> err_vdi_release:
>>>
>>> That's seems more then just a suggestion, I see that err_vdi_release: is reached
>>> on worker creation failure. Checking the kthread code, this will cause a use
>>> after free instead of a leak.
>>
>> Agreed with all above statements. I will update to fix use after free
>> that I introduced in v1.
>>
>>>
>>> An additional question, aren't we are supposed to also cleanup irq_thread ? We
>>> have this code being introduced in the remove function now:
>>>
>>>
>>> 		if (dev->irq_thread) {
>>> 			kthread_stop(dev->irq_thread);
>>> 			up(&dev->irq_sem);
>>> 			dev->irq_thread = NULL;
>>> 		}
>>
>> This portion of code is being introduced in Jackson's performance
>> series. I did not base my patch on this series since it hasn't been
>> accepted yet. I assumed my patch would make it in before since this is
>> easier to review than that series. Apologies if I need to base on that
>> series. Can rebase this in v2 if requested.
>>
>> Otherwise, I suggest Jackson to add irq_thread cleanup in next iteration
>> of performance series.
> 
> I see, this is good point. I discourage writing code against my upcoming PR
> branch, its not a proper tree, but for this one you may just base you patch
> against it, since it will all be sent together ideally.
> 
> https://gitlab.freedesktop.org/linux-media/users/ndufresne/-/tree/for-6.20

Will do. Since I am rebasing on this tree I will also just handle the 
irq thread cleanup in my v2.

Best,
Brandon

> 
> regards,
> Nicolas
> 

