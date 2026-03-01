Return-Path: <linux-media+bounces-54002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FK8ANPfo2lPQwUAu9opvQ
	(envelope-from <linux-media+bounces-54002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 07:42:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5391C1CEA8B
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 07:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8214D301E215
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 06:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C9F3176EB;
	Sun,  1 Mar 2026 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="mDK3Pid8"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61D12D0C97;
	Sun,  1 Mar 2026 06:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772347339; cv=fail; b=piUqmIWZlKuIk7yhj768f+db90jVUU2EeOMZPV+gUYZbryaGaYHZ6sEvCry4D0mVddnIvcPDSE2kC9+xKzhp9ehH4BiDyEh2fAdiok1IMtcw8kGc4pjTRZ3LBkjJho42vHG65MoGsKWZDC6ZwBNXDfckg+WrEFStfnQ9grw5rHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772347339; c=relaxed/simple;
	bh=c4RuwBIUeVwmMCkRJIh6PFXqrm6pBCAkMKFI4yzwuDk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HFa26c31O0ouLFeqtitYa59eqhAmEhbI8JCzoSWfcjban9UT5SgaLZbEN0WhIRKFP+Q8MLVLhdLguf2qnubmG2EuiKWRDoysr5TlG0Q+/KygYi/cF2sssM9BbGgIa00yMAsczqsRI4i/tz/Uqk0eo9NwK+a8/XC4d8SrecYxMoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=mDK3Pid8; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6216VWe73358588;
	Sat, 28 Feb 2026 22:41:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=skVx3xiRdzmQQ5etFbU5ddd+LHn00KoklYbTj90rQvY=; b=
	mDK3Pid8apEjOexMDgWtueE1RQCJNgcnzs1idKNMeK/icml3mjeLaKRK9JsV5o0u
	4pbVdEOHfc919suUgbJqVm9lxvy+Y8Up++moURFixulj2yhLEao+6lp6PjIdzm8j
	ne9MTuNz+wbvbmD/XBy3v6iLTjQG9f/o07uDYa7HiMoJRAsiEJEsCZZpVehlwje7
	ZIr7qzX7Dffnp+swb0D4CbeBH+nm+Km+AQQTi7pfgFw2WarkTYj6i/AC+wvxJiIa
	ceka8RQgUMk7KwnTDrNltUebjKPIWOMw1vxF0FWFRf53W2/4ohkr69TU+sd4dusJ
	x4H4aRGeOZ4ZnaF5zHTT3Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011003.outbound.protection.outlook.com [40.107.208.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh40xvy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 22:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCvl12t8i4kBDq3nYOuXvy+LdBP3pZAOGWC051T+IHFYlMTLM5natfNx6WgK4h/w9cCMOBPubnQXaymE+B4ZBJ1nefE49Vzl2iEyxEpGZIrojOF71XTGqGSLwCjXs8nYxizGeNeLKRqE7qnHwPUkxkqrfqpmc4kTwkYOOH19G+rJM4ij8NO58hMTeKw4Qftjk1hfc6hYr50I6xI4DpQcRoyBDSdfx/DGO0HisqMxwxT2amMbwlPGyTTA9vgflCEKE53nwmkCJ06kJfGej/9bYol4FcvLGqW4z/yoSBXgPl0T4mnReHrP36HXeaYKUG3vkiSAhQtDuvkzd4CbHhzdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skVx3xiRdzmQQ5etFbU5ddd+LHn00KoklYbTj90rQvY=;
 b=QxZfzF9RPZh+l/l25NEVfmRURcC8g+blxS+uyv2JKGfopp+FjFLF7Xvd4KfcO7eYRmUhZZCIS7FxaM8rhYCJiYr/ZC+ZHWRV7KhH/hgda8uKr1V8JVLkViDvUe6iZo+eXO6MQl9mfMflEKeJe8RG+UIyxFGuu9mhtzfYK8/AAMZ5ba6UIC1Cx45ILccvbj8rfbyMAkztqaqjX42l8FCNIcPwCqLmZBo9aDHPvIS3AdD8Up6ovaly6WxlOyLE2+SjajK47PwhATwfe103MutjsyiCjUOKLqbPanftrTewK6lVy36nF2Hqhl0jJ2DnsXmoJDiy0/TVGWKRg3haDX70Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DS4PPF07B018B9F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Sun, 1 Mar
 2026 06:41:51 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 06:41:51 +0000
Message-ID: <51285e7b-4618-4ca2-a917-4335bdf6677b@windriver.com>
Date: Sun, 1 Mar 2026 14:40:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: i2c: ov9282: switch to
 {enable,disable}_streams
To: Tarang Raval <tarang.raval@siliconsignals.io>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
        "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "jai.luthra@ideasonboard.com" <jai.luthra@ideasonboard.com>,
        "richard.leitner@linux.dev" <richard.leitner@linux.dev>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260228083401.1007434-1-xiaolei.wang@windriver.com>
 <20260228083401.1007434-4-xiaolei.wang@windriver.com>
 <PN3P287MB18298EA8C75E3E5C03F3D4F08B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <PN3P287MB18298EA8C75E3E5C03F3D4F08B70A@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DS4PPF07B018B9F:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed2ba24-b51c-42e4-9232-08de775d9e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	TbNKw3DTePGoXYRHIWYb6YGsMOSa6D4xbZlmnNKZ+RhlZliKJ7pqwo1hTT4XMCIlEHBlvgbZdTb5B7K4FZ+FOGbkP1b9ioXAgLqiUA8Fzu7ZVpbP0urilB0oziPES3dvT2NJwZyAxntQAPZELqfJGQl93jKMGBWnzUc/KxbwonTTZpf+ERCV4N5ybiPyP2nXIAT+zIJkf0eJY/QzVJP7YkBpb5OHVQEjJp7ffowLyFGBqTwiiOt3z29zL+ULV/ToDCrsn58LGZd0JnYsQcZykQYm+0l0eKJyJREv+aj9lv6yujSvFqynHeJWYAzYQgcW8POjv4N0Jcov0AVGznv5Ozn9v5Z46xoFBwOPqZZ85MyvFJ8kViDXGYf7c7i9KKEXPH4DevAjtjNe9w70DkIBrN9cVUtyOZ1EFX69BC3Ph77jo+mk0q7k6YklMyY4gd40wjJ+KCNlYOUzguPdemnonw/HjKQanHFBh/ChVC9N/1lCCJBWntLw1VQkc3fAl3pECXG11ua9o2vhJ5CzqZv1tbkChtgD94zAzW10AzxIbAZqxOSC9+CAWo3/ylgGgAJwm/55DRdAVqjMGY75YBK4GKmURdOJLHYOCMWWbF28uiNNFggGnYgZpPuA0LsjCXoGlyR4GsOZWRYGbbDEa1C8YzuXkVjuQvoYvk5y5fzkPln/pUuMYlMYoFGZW3I/F6diflHIyBXnqT/kLjZXaNrvgtPVMmLMAdZ9fFcrbS0Hpaa+fxwPMQv8EfcWY533YvoFVkCPL2f6eSVmgca648gtEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGZEWERyQXo5YXJuNDVmZkgyTkx5bzBKM0dIdU5WVEZJNDVKV2NIYUFITUFK?=
 =?utf-8?B?QmNNQytSVnM5TUxTTEZpbSs4K2Z3bk1FU1Q1Q1ZYZkJkK1BPOHVYMTJ0MWVh?=
 =?utf-8?B?N0JyUEdmRW5kSnZJOW9XOWpxMmZ0bnQ5QXFzSThkakRpdHZLVG13dllQRUFW?=
 =?utf-8?B?cytjd2pJWDk0VGE3aCtoa3FvM3RQUEwvakZ3TFltckJDeklGckVWUk91U0pI?=
 =?utf-8?B?eFJxakVsb3l1aWdCRlNtRzI0cGp0Z3B4VXpsc1RLalZGaWtOdWE3WkdReFhM?=
 =?utf-8?B?aDVsOUFLTi9TRWJKY0xPSGFxYi94c3FPaUtaUnRlRVJRelFFdlhoL29zODRw?=
 =?utf-8?B?Q21ZTzhRVUFzZjdGcHlLTk1UNkt0ZkR0WmN4Ri9jV2VPRlhNZ0xJc1VueWht?=
 =?utf-8?B?MktvZjZnUkVTbmwzRXAreUJNeEx6WkdZbkg3YmczZVFRWTBVRVNaK24vaGJO?=
 =?utf-8?B?MXQrQ1VncDR3MWdjOW5scVM0WlhSbGR4alFTdUZGZUNTeDV3djlqS2lWZWFy?=
 =?utf-8?B?dERGdmdrYXE1VUdub0RUUVo2UTZjTWJTQm90eHkrWTM0OXBqMWlQajBzbzkx?=
 =?utf-8?B?RUg3bGdSczYzTTIrSU91K0I1VVZkYzJ6WlVsNTUwNEpEcmRyRDJFU2hFeUxo?=
 =?utf-8?B?RThqSTlldVJrWHhvMTZuZ2x2bS81RlYwbHVyeU9MN1RsdXEyanh3cmFQaEdp?=
 =?utf-8?B?VWhGWDd3dTR2NkIvL1Axc3pEdlA1U3Y4Q1F3UTRJOWd4TEhFQmVpSUxwdG9K?=
 =?utf-8?B?SWhLM2xiVzcyRTk3SkZQK1M5RTdlaWxtMGpGZTdTb1JWZjRGZXFjcmVncWFv?=
 =?utf-8?B?Y2x4R3BVL0ZPeHQwMUJOQzFORUJBUWlkNXJVSWZyYmMzaXFNT0FmWnYvMGR4?=
 =?utf-8?B?T3NGTEI5WEtTSjBMS05pTXRFeFM5Q2xJQWVoa3hJMm9TdmxVQlE5QmdNMWxH?=
 =?utf-8?B?RU5nY0xSU2hORHd0a0xEV1lFVUVXQ0pyRlV3WmJJQUJvV0laWG1wWVlNemlD?=
 =?utf-8?B?elpwb01IT2VBd092NGZ0OWtsSlVhSmhSckdieTI5YUlpMEw2ckdUMnUxTGVM?=
 =?utf-8?B?Q3B0TWpZbFNJdHNaNjRTb2g2QnNUNFFnQXc3a3hqYWdYVlpHelM3YU5wNGk3?=
 =?utf-8?B?OFZkaHNBY3FjUGp3enAzbDZaZU9RMGVqRUJvT3A4dnZ0VHh4cjRUYmRtM1NR?=
 =?utf-8?B?SDJONWdhcFVtdFFwZXNqZTdNUlJjOGlwZ1dJVmpaeHZtb3NpZHk0cUQvY0N0?=
 =?utf-8?B?OExZai94ZW1SQXZpVVJ1UzFzZ3d6dzBoV0lLYzZiVjU1S2ZwUTd3UnFWOTU0?=
 =?utf-8?B?eEhNVXhhOWVUa1NMc0phS24wZlN0am9DdDEvMnZQUEpxWm1IMDl2cGVXK0F3?=
 =?utf-8?B?WG42anBDWFFldXp1bXFpWjNtaXRValJiR1BSdjVXa1BRVEF4QXNpU3E2Wi9Q?=
 =?utf-8?B?VlVveVgzSHFBcWJIRTBESWc5Sm9FVWhXejNoeitkWm91ZmdlUjZYaTI4Y09u?=
 =?utf-8?B?Qkc1dTF2Y2hjbk8va1ZuRWpnT2FUUVVyZG15UjJpL21saFc4aXkwN2ZqeW52?=
 =?utf-8?B?cTJHWG93MjVEQzFwdjNZV1ZucVVrQzgwQW9BVHBMM2lHUnQzSXREbnF5dFdu?=
 =?utf-8?B?K200Sk9FTzYvZFB6NTRYQkd3QTZPaDd5K2psU1pUUHdDYmdXQ1lsaC91VVpC?=
 =?utf-8?B?RjhicXI0QXdybmlRRVJCOWZZNVJRS0plZm1ERUMzaVFjOFF5TGJrdC9xR0lv?=
 =?utf-8?B?RVBIa3V6elBnVHpHZkZ5bDBFMjlJcElaVDU1NnYrRUdiS2JuMjVpeHdESkFQ?=
 =?utf-8?B?N0VGS3ZGbytlS3RJNkN6Z2JmVlBSMk83eE1tUkZPTHJmTW0zaWRtZ0F2YVhY?=
 =?utf-8?B?V1pqazB5MDAxaG1UWC9Famg2V3k3ZnNtTFJNMTE4Sys0VEQ5N0V4UTNXMWk0?=
 =?utf-8?B?ekxlZ3pWM0lnQlVMcExyVmgwN2RGMG95MXZiTEFYL1lXbmlxZ0dEUmtaSVFU?=
 =?utf-8?B?ZWhLYTFoekc1aUpIekFqaTZiZmI3Q0pGME9wL1hLMkF5Vnd2SDEyTWsrNitJ?=
 =?utf-8?B?RFZaUm9qSGU0aTh2WlJTMFJiZFYxZll4UllHTDVBVUFYRFd2bC93NlNZeFhI?=
 =?utf-8?B?Z0RMS3d1QUxwOWdHdHIxNk1oaWpZSTlubzVwYTBpN09mZHB0ODhIZUF0RUhv?=
 =?utf-8?B?YUtOL2F3OVRiWWdpSkw4bDQ2Umt3am1hb1NiMWZuR2U1VzB0NERFYWIzcWpt?=
 =?utf-8?B?aWtJZEt4NmYxZTZZSi93UXZGS0toYjloUnE3UFBuQyszeVZjbHdwaUQwK0w3?=
 =?utf-8?B?TDhRU3RzMVlHTUcxUDdUeEljSzFqcjNrOEVsUEJySVZNcEZEaTZVQkt3UVRC?=
 =?utf-8?Q?ieWhCoax79iq8t4xo46/pGUF/ZlgRoh9+5UKQ0GuXGG4G?=
X-MS-Exchange-AntiSpam-MessageData-1: 5Hr8h3cJ0cgo7iuDg8WXiIETi1ikcadgcaw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed2ba24-b51c-42e4-9232-08de775d9e8a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 06:41:50.9842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTyE9JAy3wf0/xYGjP2i48Ens7Ciw7sG36wzqL1Umy8PyhT8J7ICa3nMJgoKGmfxosFFNehi0iK8ZB2h78udy3PXqKa4AeoXN30siBDtyRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF07B018B9F
X-Proofpoint-ORIG-GUID: a3kxafnkGVQuzvd5YENnpinWQq3iCpop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA1NyBTYWx0ZWRfXzdq5osT34fIQ
 sznh0h5daJwjc7h9nQ6zEsFPECHyGiPTeX1A27AQP0mGbjE2gZaMkNsRFNMvIbwU1glfPKuSSNL
 0rwrdzKJdDBkpZs2hHR0MXp8xjk9qw8gRgAyz8sLwzPUWtyxoG+q+Z4Y5Qui2Zr3EPIkvdoyeI4
 8EcF0Lj5t6UuytRcaAUbeyub/PsuvR6qOItzAitATq1i6K0kMBnbikhvflH73GZClCcnw+WKLpW
 PWL/aJSJzK9UeXaW+/GqpzT6ruUJcYGxa++lhxdX3qi78g/ugSw8Jyt9jtQTKLZr6Qphq7wHlAP
 j7PY9mv1so2LCvph6HiTwTR+3BVMVEWRGdvF7atz5x1+z+fmupo7NyqLqrmi7j86g//kYlAhN4G
 48Fy2YQbli+YUnGwK46bG8KgML6yDWsqaXMhPxcDgc7urempiv3S+nNaCzdqmXY78qiAqN3EB6L
 +axDRexIHRepi6k7DZw==
X-Proofpoint-GUID: a3kxafnkGVQuzvd5YENnpinWQq3iCpop
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a3dfb0 cx=c_pps
 a=8jXpZF9zWVkTg+MA9bOgkg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=ODBG769NIOIxXRR-gSoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-54002-lists,linux-media=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[siliconsignals.io,linux.intel.com,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:mid,windriver.com:dkim,windriver.com:email,siliconsignals.io:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5391C1CEA8B
X-Rspamd-Action: no action


On 3/1/26 02:45, Tarang Raval wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
>> Switch from s_stream to enable_streams and disable_streams callbacks.
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/i2c/ov9282.c | 82 ++++++++++++--------------------------
>>   1 file changed, 25 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
>> index aa5a105136bf..b080a56d83a9 100644
>> --- a/drivers/media/i2c/ov9282.c
>> +++ b/drivers/media/i2c/ov9282.c
>> @@ -921,13 +921,9 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
>>          return -EINVAL;
>>   }
>>
>> -/**
>> - * ov9282_start_streaming() - Start sensor stream
>> - * @ov9282: pointer to ov9282 device
>> - *
>> - * Return: 0 if successful, error code otherwise.
>> - */
>> -static int ov9282_start_streaming(struct ov9282 *ov9282)
>> +static int ov9282_enable_streams(struct v4l2_subdev *sd,
>> +                                struct v4l2_subdev_state *state, u32 pad,
>> +                                u64 streams_mask)
>>   {
>>          const struct reg_sequence bitdepth_regs[2][2] = {
>>                  {
>> @@ -938,16 +934,21 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>>                          {OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW8},
>>                  }
>>          };
>> +       struct ov9282 *ov9282 = to_ov9282(sd);
>>          const struct ov9282_reg_list *reg_list;
>>          int bitdepth_index;
>>          int ret;
>>
>> +       ret = pm_runtime_resume_and_get(ov9282->dev);
>> +       if (ret)
>> +               return ret;
>> +
>>          /* Write common registers */
>>          ret = regmap_multi_reg_write(ov9282->regmap, common_regs,
>>                                          ARRAY_SIZE(common_regs));
>>          if (ret) {
>>                  dev_err(ov9282->dev, "fail to write common registers");
>> -               return ret;
>> +               goto done;
>>          }
>>
>>          bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
>> @@ -955,7 +956,7 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>>                                       bitdepth_regs[bitdepth_index], 2);
>>          if (ret) {
>>                  dev_err(ov9282->dev, "fail to write bitdepth regs");
>> -               return ret;
>> +               goto done;
>>          }
>>
>>          /* Write sensor mode registers */
>> @@ -964,75 +965,40 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>>                                       reg_list->num_of_regs);
>>          if (ret) {
>>                  dev_err(ov9282->dev, "fail to write initial registers");
>> -               return ret;
>> +               goto done;
>>          }
>>
>>          /* Setup handler will write actual exposure and gain */
>>          ret =  __v4l2_ctrl_handler_setup(ov9282->sd.ctrl_handler);
>>          if (ret) {
>>                  dev_err(ov9282->dev, "fail to setup handler");
>> -               return ret;
>> +               goto done;
>>          }
>>
>>          /* Start streaming */
>>          ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
>>                          OV9282_MODE_STREAMING, NULL);
>> -       if (ret) {
>> +       if (ret)
>>                  dev_err(ov9282->dev, "fail to start streaming");
>> -               return ret;
>> -       }
>>
>> -       return 0;
>> -}
>> +done:
>> +       if (ret)
>> +               pm_runtime_put(ov9282->dev);
>
> The current flow looks odd; can we use a conventional error path with a clear
> label like err_pm_put:
>
>       /* Start streaming */
>       ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
>                       OV9282_MODE_STREAMING, NULL);
>       if (ret)
>               dev_err(ov9282->dev, "fail to start streaming");
>               goto err_pm_put;
>       }
>
>       return 0;
>
> err_pm_put:
>       pm_runtime_put(ov9282->dev);
>       return ret;
Hi Tarang,

Thank you for the review!

I'll update it in v2:

/* Start streaming */
ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
                 OV9282_MODE_STREAMING, NULL);
if (ret) {
     dev_err(ov9282->dev, "fail to start streaming");
     goto err_pm_put;
}

return 0;

err_pm_put:
     pm_runtime_put(ov9282->dev);
     return ret;

Best Regards,
Xiaolei
>
>> -/**
>> - * ov9282_stop_streaming() - Stop sensor stream
>> - * @ov9282: pointer to ov9282 device
>> - *
>> - * Return: 0 if successful, error code otherwise.
>> - */
>> -static int ov9282_stop_streaming(struct ov9282 *ov9282)
>> -{
>> -       return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
>> -                        OV9282_MODE_STANDBY, NULL);
>> +       return ret;
>>   }
>>
>> -/**
>> - * ov9282_set_stream() - Enable sensor streaming
>> - * @sd: pointer to ov9282 subdevice
>> - * @enable: set to enable sensor streaming
>> - *
>> - * Return: 0 if successful, error code otherwise.
>> - */
>> -static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>> +static int ov9282_disable_streams(struct v4l2_subdev *sd,
>> +                                 struct v4l2_subdev_state *state, u32 pad,
>> +                                 u64 streams_mask)
>>   {
>>          struct ov9282 *ov9282 = to_ov9282(sd);
>> -       struct v4l2_subdev_state *state;
>>          int ret;
>>
>> -       state = v4l2_subdev_lock_and_get_active_state(sd);
>> -
>> -       if (enable) {
>> -               ret = pm_runtime_resume_and_get(ov9282->dev);
>> -               if (ret)
>> -                       goto error_unlock;
>> -
>> -               ret = ov9282_start_streaming(ov9282);
>> -               if (ret)
>> -                       goto error_power_off;
>> -       } else {
>> -               ov9282_stop_streaming(ov9282);
>> -               pm_runtime_put(ov9282->dev);
>> -       }
>> -
>> -       v4l2_subdev_unlock_state(state);
>> -
>> -       return 0;
>> +       ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
>> +                        OV9282_MODE_STANDBY, NULL);
>>
>> -error_power_off:
>>          pm_runtime_put(ov9282->dev);
>> -error_unlock:
>> -       v4l2_subdev_unlock_state(state);
>>
>>          return ret;
>>   }
>> @@ -1164,7 +1130,7 @@ static const struct v4l2_subdev_core_ops ov9282_core_ops = {
>>   };
>>
>>   static const struct v4l2_subdev_video_ops ov9282_video_ops = {
>> -       .s_stream = ov9282_set_stream,
>> +       .s_stream = v4l2_subdev_s_stream_helper,
>>   };
>>
>>   static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
>> @@ -1173,6 +1139,8 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
>>          .get_fmt = ov9282_get_pad_format,
>>          .set_fmt = ov9282_set_pad_format,
>>          .get_selection = ov9282_get_selection,
>> +       .enable_streams = ov9282_enable_streams,
>> +       .disable_streams = ov9282_disable_streams,
>>   };
>>
>>   static const struct v4l2_subdev_ops ov9282_subdev_ops = {
>> --
>> 2.43.0
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>
> Best Regards,
> Tarang

