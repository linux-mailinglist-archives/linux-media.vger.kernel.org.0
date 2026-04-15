Return-Path: <linux-media+bounces-58799-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF1IFVVW32ndRwAAu9opvQ
	(envelope-from <linux-media+bounces-58799-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:11:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD44025E5
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 11:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 288993107D36
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A6E3191D0;
	Wed, 15 Apr 2026 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PT15r90J"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010025.outbound.protection.outlook.com [52.101.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7322F2D8391
	for <linux-media@vger.kernel.org>; Wed, 15 Apr 2026 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243869; cv=fail; b=FdYZdgYr2LXEOhC0kRbstGPEowXsASdlQ3sZ0XrrC7bBjHsSM8rfAAioe1tEG56XHL5NI0B1+2Za6zvOunPicgGrlnHwaHhNMsi3SkGi/8H67vITvAw8GmDqXGkb/F7DAy0TYe9285/OXE6fBA+cW4oE7ujsV8glYTOxHjRaPL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243869; c=relaxed/simple;
	bh=eBGAmeBWLwPeo9rHZrd35iJE18mHedy3CEDbTImBO7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qxm60lhLIsSbRZJpGYvRlZ3/K0yKrL123ivYYDZfIaxmT5fxHrjVc+p2RWAGKiiyrMElfdLeRVrMy4rTEzF1bB+p523okAKYxGn4p+6rThIGGItZu4q2PH8KIoLlQ/BgesgdwBBnsyEWQG54meGDfcjj0Vr8ecjyq6f1FGtpGzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PT15r90J; arc=fail smtp.client-ip=52.101.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jc4Xnvg9E3fO+r2R55YXzNJfInZ7bA/hDvrb0o5t4+T7TU5T4xGuw1p3Kb1dXJDX20qV6TQnoG2kitY3wWngc7yOTdHSzPMquqBJN7WjLeBOfp/fXJn5+2Pp1/ZvXI/oVjREmJdlTlc6vQthP/LhU2C1EdyIZyOFEYU11qYCVL8ud6EBsiubHZjPUBJJR4csPLs3q3JgkKF4cQMpaI/iyU2qXPnVALKXArYeZEcYGEnepCwJxr7jXINX3LhJfS4iErK//TJawDyxK9r5gdzaG/qAeTeCjGqCRf7NpaSYtqo7TSitG5jInd8Ukrt8Cs9FvPt2OQwW6S7cSJKMoRR3Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1kOfE6NqCqt4yK4SKwGgbG1AioFStsMZ8Z4q2tl/oQ=;
 b=U/mEUslFIpilkNq9z+B6AkxHVKBDKbCf1yIFJHqo66Y+GHTCsSEsgPn4ts7JVjuNl4SsJ2Bs8FBveY9yHPjfPN06FJAefARHpoq4eqLZTWBD0a87FIQsYQKHv8vnJzBGbc1BXj2CW3e3Vy9MWAAjBOE9IiIOb10b5+XyHsColPT39sqzC8ar/6P21YJNGyU9mMCf6jH4AD5zmg8A5JZJMf8FbCTLWIKeMs93Be+S+iKnjyE4SWv9ns1jyiH1AB1HFCpUvJN0OS4R6ICiQp1xGToCyEVwSlatGARbcOQMW64hC8GveLzPj8ShUz0R/tg9XXUI9rimKljlxwEnAGMs5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1kOfE6NqCqt4yK4SKwGgbG1AioFStsMZ8Z4q2tl/oQ=;
 b=PT15r90JNchjYT89fh/FbYCvDlpNloFkj47I5Kme+Y+qta8Jv1N1KK1le5Y67Jb20WDrrQLr/NtTCn80n87uf/px5/NtoKsI/K6Hc31RHsB9u79t3SZBmud93zi6m4UPFYbPQ7lscLNGAB5NZ15ksDpiA0wxswENs+2VkhCqt84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6009.namprd12.prod.outlook.com (2603:10b6:8:69::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 09:04:24 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 09:04:24 +0000
Message-ID: <b1d05f17-c726-478f-8ee8-691b6c389f5a@amd.com>
Date: Wed, 15 Apr 2026 11:04:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-fence: Fix potential tracepoint null pointer
 dereferences
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260414154928.32934-1-tvrtko.ursulin@igalia.com>
 <20260414154928.32934-2-tvrtko.ursulin@igalia.com>
 <650e835e-b60d-44fd-b212-47f8a9d18c15@amd.com>
 <5fea79b5-ab5a-4a98-95c8-6452b20e83c4@igalia.com>
 <b3b75077-878b-4d4e-b18e-4976765c63db@amd.com>
 <dcd9e1e9-8297-4429-94be-af88c7b41399@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <dcd9e1e9-8297-4429-94be-af88c7b41399@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: ae5e3c5d-b97e-4639-3b80-08de9acdfd3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ygtgacFU1w7dUgjM8We3tBES7qkSpcA2Xn1sHtaGXFgYH4NeIm1Tp3dWLuoeQmFykzt89Tm7Hoj8vy0EwszSZbAzRUVTBC1NjUbJkMbxenRc0o0W/wNEl6RIgmEj8N53UYf+gykyP4hZ6ucEvg03+kqs91aiTlntOZXsVXX4ennW9OZe3sBlllxWn9j8oJCOnkQCUET822BRzef8TzWVmvmWvIaepmes5lv1rEl8wqSJ2lu/9gCeDFfsaDBHDKZbaGrQaWmF5GkCHnaT8L1m+UroAf9HZkdnEZluVFzfKZpCDLK5CobdX88PeT3vp+SAGTqDEeZA2JaVTyxdEdELEUJSWmlIM/zZ5Wl0MDquR1GgN7GNf0L8RdOanA/foF5Y5UhaYmNW/ogTF5BoeiDIuQwUL/8vmAcsqu6GAxjlzmU36J1Dd7tsmWB/eC3oYW303dlP0AmbfbkQeykmXRBrvsSHUvVk7ngA+rNmI9iuLc9T1nHFrdaeg31wBbP/ddXH3cMSWiMT6AyZAgyrA9d62PXfPNCNrJ5pBYr//EIGKfupH9ePxyQ+TQ8kpuNshpT83G8VYNBy+eKzzw7LfK0eBK0vvROAqltQz7eZqq6amdGjyP7RhDt8x+tJfeLyWEAQoSEZKXbAe9VkKpjeqJ2yMavvsx53pPttfdIgzEQv6ZpvAWXffplRJkYjxQvvfRIB/PtABwZL1IvACcoJIb6CDA16AtZl0vUcWMAW6ebcD0U1HEflAdnl1vVuxZVK2YY6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmppakVidC9TdTFCMm1qdE5aaDVQeHFSYS8xNEhzcE1qV1BVeWlnN1YrMVRj?=
 =?utf-8?B?Sit6RVFJQ0drNVRia0JKSUpDdVZHaXBMZ3c0ZHVmcXZRS1NOZ1dsbjFDenYy?=
 =?utf-8?B?dHpoMnR1NGNMZFExanAzTzBrWDBzZm16SkFBRG9HV1RLTEVxeXBOVzduWHlP?=
 =?utf-8?B?N1hRUCt0VkxaQjEwRlE4dDdDYjVvVUJBNjNjVlE4YlJhbm5odS90ZXN4YTBO?=
 =?utf-8?B?ZGhUQS9WSHJOZ0Fmay85eHRaT0ZRcTN5WnZHa2dUbVhWZ2hDb1VUYWdaZVhI?=
 =?utf-8?B?TXIyTDRJTXkxK0F6dFgrcUxmY25RK1A4NHdMejBBcno3bmoxK0lRblZUYSsy?=
 =?utf-8?B?V1pTTjZqK3p2ZzE1Yjh3TExKc1YrOVV6djJYdzYzVTBnR2FRR2kzZVFpRk8z?=
 =?utf-8?B?RGFMclF3KzRVVFJDYlBRcWxHWUJpdk5PYStlUzRtZHJZbm5LeXVSY2ZxcXBB?=
 =?utf-8?B?aGdFN1lVeW9LY2krU2dKRFJYN1d4R0paMzhNSEJUVXptSmZJMGx3QWhYRmQx?=
 =?utf-8?B?ejM5aHVWbXBqVmttQ01YWi9XWFp1dVlNRXZVS3BwVDFTcjlFSGV2UkpyeDNo?=
 =?utf-8?B?QXdSSHdIWUVJR2pTWW5lQWNzQ3BvcHFndWsrMEtOeTVzNmlPUFFpbEIvemwy?=
 =?utf-8?B?QTZwVDBQaExBYitWdzZncWZpSVBuVjhKVmJRQTY2WVhpRCtyY3I2bkpCL3RD?=
 =?utf-8?B?YndlYTQxd1UwZWRrd2ZBUWExOWRDelBxbVNPWFFUTlJZYkorM1ZzdDdxMEl1?=
 =?utf-8?B?QVJIMFQ1ZERpT1hKcmt2RmVxR0xoOG12U3hEZTc3SE5mNWR4cTRhYmQ4Q2Qx?=
 =?utf-8?B?bENiN3NWell1MlYzWkNHN0pKMWNGaG5VeHJNYjljZUkvVk9NV2J6Ly9ubmRB?=
 =?utf-8?B?SlR6eHdYaTkxRjJZeHlTeCtRNDVkREJPNW1MS2xzNWdnblVSYm1JQ3JLU2d2?=
 =?utf-8?B?N0ptQU5QVnY1VEpvdUozZStYYVVHWDQ0Q2xjUkw4bFVaVXhUbXpFTDdHWDJa?=
 =?utf-8?B?WUxNVEZ3OU0zQjl3MjVuS2Q0NDlqMjJsNTl0dVZVZ0dJRVZscUh6cG40L0Qw?=
 =?utf-8?B?Uk8wdEpkdFE5QXVSVTNWVEFwV1FycXBTbDdLTVd3Kys2QnFnL09rNTh5aGM2?=
 =?utf-8?B?ckFxUEs1TEsyUk00cnVCR2o4dUxpbmw4ZTZMNUQ4ckRsSzFlWDhjU3FscFNC?=
 =?utf-8?B?TFFiazBwRmJRMm5sRXhvcHgzVmxSd29WdjlYQnh2ZmJJWDB4MlYxSGZ5Zjho?=
 =?utf-8?B?aWc5ZTRTQTZBRzJQZy9YNEY2VFBxZDM2ZU4rMU1zUk5qMS9aZldPeTJmaURj?=
 =?utf-8?B?dG1yeFlZYjdnZlRTV3JIL0syUkhXOHF3QnJXYW50aFlONVlLeTd3KzBTMWJp?=
 =?utf-8?B?ZWEyV3RqQ2dNT2Yza1lpdjNYcC9EMURMbS9aN3AxUHFrdlhkQldPSGFHaFJI?=
 =?utf-8?B?VjFlWEJVUk5PSndndWJRbXF0VG9keEhiaHlmRmxnYnRJRTh6aEtCVlBhUXRr?=
 =?utf-8?B?VnZXVTBMblNSRUhiUlVYTHQ0c1UvVGxaSU50eGhiM0RCeFZVVjAwSGIzL2JL?=
 =?utf-8?B?YXVTZXREazFBZU9TdUxPMDFCbHlrYitadGltaDdhckIyMFVQWmFma0lpaFQw?=
 =?utf-8?B?b1Rnb2x4aE1GYkloeE1nUW1yeG9hczZLSy9wNmx6cWNtQThYUmFtSnl4OXJE?=
 =?utf-8?B?Z3VFM3hCRjFmUFlYM2JPMFZNZjlGT0tzNVc4TURnMUxmRW8yWjVucGJaa3V3?=
 =?utf-8?B?azZZQ0d1Si9SRWdlZDFNVzNCMmNTRFpSOG9BTlVpVFdwMEFWbC9ZMzMzMEFC?=
 =?utf-8?B?bkNVMnl4VEhTcWNvTDU1ZjlVU29RbHJEcXg4WkgrZ2RpZUxLYnFVcHBoUnBi?=
 =?utf-8?B?cmNuK3BML0p2TWxaSjE1azRaR2dzNHdVdmFhdmpqKytPbEFKZHU5MWdxOGEv?=
 =?utf-8?B?NTlDMlVrSzA3MytvdW1RWmpoZ1dpZU5HOVZ0blA4VC9Xb3d5N1lZNE9yWGJm?=
 =?utf-8?B?UVpwdFQwN0VrRmY5cHFLRWxDdkpnRkRCeE5YSUgrK1lSQnc4OG9oUFFXZmVw?=
 =?utf-8?B?MUxIVGFVbFM1UjhrcWdyaE4yTXdvaTJiOElsK2RZS29uc0ZHY1dzTHgwTDBY?=
 =?utf-8?B?Mnp3ZGF2NkVveFZnelBPdzlwemlmS1JLZDhEdEl5TFFUN2lRWVVDZ2RiSnN0?=
 =?utf-8?B?aWJ1ZkwrZmdKNEhGcjQ3aXpGRElJSHVxdXg2VFhzam9KVmlLdnN6MWRpQTVT?=
 =?utf-8?B?U1RZZm11WUFZcVNjdkthWDdUUmFLTzRQUHdRN3haL2tZSEx6KzZDeDZabnFq?=
 =?utf-8?Q?ht6bD9nR5iKIRvs55r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5e3c5d-b97e-4639-3b80-08de9acdfd3c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 09:04:24.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpOeloLWOH9ZtK118Zbx1fuVTowd0IPW3M9EZFyuOFZmrDAlyso7nesLhd8MVZtV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6009
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58799-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: AFCD44025E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 10:33, Tvrtko Ursulin wrote:
> 
> On 15/04/2026 09:13, Christian König wrote:
>> On 4/15/26 09:58, Tvrtko Ursulin wrote:
>>>
>>> On 14/04/2026 19:30, Christian König wrote:
>>>> On 4/14/26 17:49, Tvrtko Ursulin wrote:
>>>>> Trace_dma_fence_signaled, trace_dma_fence_wait_end and
>>>>> trace_dma_fence_destroy can all currently dereference a null fence->ops
>>>>> pointer after it has been reset on fence signalling.
>>>>>
>>>>> Lets use the safe string getters for most tracepoints to avoid this class
>>>>> of a problem, while for the signal tracepoint we move it to before ops are
>>>>> cleared to avoid losing the driver and timeline name information. Apart
>>>>> from moving it we also need to add a new tracepoint class to bypass the
>>>>> safe name getters since the signaled bit is already set.
>>>>>
>>>>> For dma_fence_init we also need to use the new tracepoint class since the
>>>>> rcu read lock is not held there, and we can do the same for the enable
>>>>> signaling since there we are certain the fence cannot be signaled while
>>>>> we are holding the lock and have even validated the fence->ops.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Cc: linux-media@vger.kernel.org
>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>> ---
>>>>>    drivers/dma-buf/dma-fence.c      |  3 ++-
>>>>>    include/trace/events/dma_fence.h | 33 ++++++++++++++++++++++++++++----
>>>>>    2 files changed, 31 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>> index a2aa82f4eedd..b3bfa6943a8e 100644
>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>> @@ -363,6 +363,8 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>>                          &fence->flags)))
>>>>>            return;
>>>>>    +    trace_dma_fence_signaled(fence);
>>>>> +
>>>>>        /*
>>>>>         * When neither a release nor a wait operation is specified set the ops
>>>>>         * pointer to NULL to allow the fence structure to become independent
>>>>> @@ -377,7 +379,6 @@ void dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>>>>>          fence->timestamp = timestamp;
>>>>>        set_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->flags);
>>>>> -    trace_dma_fence_signaled(fence);
>>>>
>>>> I think this part here should be a separate patch.
>>>
>>> I had that in https://lore.kernel.org/dri-devel/20260330133623.17704-1-tvrtko.ursulin@igalia.com/ but the discussion fizzled out before an rb.
>>>
>>>>
>>>>>          list_for_each_entry_safe(cur, tmp, &cb_list, node) {
>>>>>            INIT_LIST_HEAD(&cur->node);
>>>>> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
>>>>> index 3abba45c0601..9e0cb9ce2388 100644
>>>>> --- a/include/trace/events/dma_fence.h
>>>>> +++ b/include/trace/events/dma_fence.h
>>>>> @@ -9,12 +9,37 @@
>>>>>      struct dma_fence;
>>>>>    +DECLARE_EVENT_CLASS(dma_fence,
>>>>> +
>>>>> +    TP_PROTO(struct dma_fence *fence),
>>>>> +
>>>>> +    TP_ARGS(fence),
>>>>> +
>>>>> +    TP_STRUCT__entry(
>>>>> +        __string(driver, dma_fence_driver_name(fence))
>>>>> +        __string(timeline, dma_fence_timeline_name(fence))
>>>>> +        __field(unsigned int, context)
>>>>> +        __field(unsigned int, seqno)
>>>>> +    ),
>>>>> +
>>>>> +    TP_fast_assign(
>>>>> +        __assign_str(driver);
>>>>> +        __assign_str(timeline);
>>>>> +        __entry->context = fence->context;
>>>>> +        __entry->seqno = fence->seqno;
>>>>> +    ),
>>>>> +
>>>>> +    TP_printk("driver=%s timeline=%s context=%u seqno=%u",
>>>>> +          __get_str(driver), __get_str(timeline), __entry->context,
>>>>> +          __entry->seqno)
>>>>> +);
>>>>> +
>>>>
>>>> Mhm, I'm strongly in favor to just use this approach for all trace points.
>>>>
>>>> The minimal extra overhead shouldn't really matter at all.
>>>
>>> Yeah, I am a bit on the fence. It would required a bit of an ugly rcu_read_lock around trace_dma_fence_signal_init
>>
>> I think as long as we only grab the RCU read side lock when the tracepoint is actually enabled then that shouldn't matter.
>>
>> I do remember patches flying by which optimized this use case for the whole trace subsystem but didn't took a closer look how to do that now.
>>
>>> and trace_dma_fence_signaled would lose the driver/timeline info _unless_ name helpers would also be changed to look at fence->ops instead of "is signaled". Those have no memory barriers so not sure I want to think about racyness and how to solve it.
>>
>> Mhm, that is a bit more problematic.
>>
>> ops is only set to NULL when neither free nor wait is specified, so checking is signaled is still the right thing to do for drivers which uses those callbacks but still want to have the RCU protection of the returned strings.
> 
> Hm yes, that too.
> 
> 
>> Ok, feel free to go ahead with this approach for now but please add a /* TODO: clean that up when most drivers switched to independent fences */.
> 
> Thank you, I've sent an updated version with a comment to this effect placed to the event class definition. I put your r-b so please double check if you are happy with that version.

Yeah works for me, feel free to push to drm-misc-next.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
>>>>>    /*
>>>>>     * Safe only for call sites which are guaranteed to not race with fence
>>>>>     * signaling,holding the fence->lock and having checked for not signaled, or the
>>>>>     * signaling path itself.
>>>>>     */
>>>>> -DECLARE_EVENT_CLASS(dma_fence,
>>>>> +DECLARE_EVENT_CLASS(dma_fence_ops,
>>>>>          TP_PROTO(struct dma_fence *fence),
>>>>>    @@ -46,7 +71,7 @@ DEFINE_EVENT(dma_fence, dma_fence_emit,
>>>>>        TP_ARGS(fence)
>>>>>    );
>>>>>    -DEFINE_EVENT(dma_fence, dma_fence_init,
>>>>> +DEFINE_EVENT(dma_fence_ops, dma_fence_init,
>>>>>          TP_PROTO(struct dma_fence *fence),
>>>>>    @@ -60,14 +85,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
>>>>>        TP_ARGS(fence)
>>>>>    );
>>>>>    -DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
>>>>> +DEFINE_EVENT(dma_fence_ops, dma_fence_enable_signal,
>>>>>          TP_PROTO(struct dma_fence *fence),
>>>>>          TP_ARGS(fence)
>>>>>    );
>>>>>    -DEFINE_EVENT(dma_fence, dma_fence_signaled,
>>>>> +DEFINE_EVENT(dma_fence_ops, dma_fence_signaled,
>>>>>          TP_PROTO(struct dma_fence *fence),
>>>>>    
>>>>
>>>
>>
> 


