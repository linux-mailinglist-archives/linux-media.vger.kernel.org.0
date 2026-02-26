Return-Path: <linux-media+bounces-53468-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHaOB3cboGmzfgQAu9opvQ
	(envelope-from <linux-media+bounces-53468-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:07:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E761A3F9F
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12E1E30478A0
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45705399032;
	Thu, 26 Feb 2026 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zuT4dBwW"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013038.outbound.protection.outlook.com [40.93.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF03A1D0C
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100441; cv=fail; b=SthH8uVnKA2Z2f4oQ5xtrXhtnW5nPFe43X3He1Lz22BUlUu5QkCclN3te48bRSMZSFNezhVatd7AJGwo53MkiY2KWG6bWz1nrC1shZIIcWyNg/tooV8fZXDV59LWgisaC/8Tjb+s1X/G2uC69JBf8U8VutzyzYAhQp36j8qtA68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100441; c=relaxed/simple;
	bh=qBt/9FCVnecMQIofaZdzG4CnZVHDT5oMXMv4p+3jzXw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e5DLptIKPjh+30dSC2ZLio9J2BeJle/iAkSd8Ay0hGE/w5e1iJznlb3p1QkUXerGzAUOlaDXsJG5k45Pq7uHtf/qmoNjpmwHB9njQysdkBfMqA22IC8Otyke8n8KIMba8/Ggk6AkyY7VebtoEhU0OI01zbwNa/8/yhPrwfU5cMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zuT4dBwW; arc=fail smtp.client-ip=40.93.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiO+ykrGAjCZbfj/8Sp09PwbuB7VayEK40wYzygx6jx/W5i6q1mH+BcyWgs6kJUMgW7LO6gmtBbyMHxYjtNBN4/fUYXImiuENc2Vnzr1SGXwe/0Pt2MJFvrXyAVo2z7e6RqTT3wQoyBHrb2qs1oSmih6CqT3P+GeypoOaXAK4fgpxV5+FPG9rBbxUNS5wH7iB9I0xU1CVzrREDZ89H5ITfMF3cSdEeeiTdYf4ZctGYTgHfcVDzCCVnmwKN9pTdJ7IaGm0CmXLrDztXfukLPnz+gDJ0XXubgMLCgzz7bWdl2W8t/hUiHmRUh1uOeWrozGYTBAmVOxBlJpdrnziqo68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QObl4u+T4Da8GuPDfejW7dhQ/WrfYsdmWhwKW0JzhEw=;
 b=FYs3xAeCuwo3V1ASv42dwYb6bQZLBhcdA7OssXRMLr35edg2+clijYAgnYvW1bfocAjFF9hJQYjXyVXPPI5jZYjvkNEwl3iybBWnQLCwN58KLhaHzZV/jWQCixuanRhdMAWlhOBmM3jTzb6iER/n8a4kUyna4OWjD7lYiZjP7A1syfRhaR9GLRV3oXLYFBOpkSrs73KDqH886OSjiVskHXK3oYgdAfZON1rA8P3NcC2qKu3M/I1md/fq+qFaQ33GCG4Z0vEJrbPFTaqHTDroptG3jHTdwtWsOY7iWgRqa57b6nOe+ahHLrxgeEybBrh0CDodIZmk2rk4koGJSszuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QObl4u+T4Da8GuPDfejW7dhQ/WrfYsdmWhwKW0JzhEw=;
 b=zuT4dBwWZoHSlQqxTLJDoxp6WJY0NgAfN/5qXDAUW1VL7mMc2IKAMl9Nu7xoRGVWh663q3MSNlqJg1znN497hz+kxifN52IEZM3vTmquHUlSa/P9b1YFX8LqAhFhnRoL/gvoQQ2+SLdnEaWzP0IqZ6V2tIFVRWZv6lRoUPvXjkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:07:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 10:07:15 +0000
Message-ID: <202b8488-1a7a-4310-95bc-44140b53ef26@amd.com>
Date: Thu, 26 Feb 2026 11:07:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/62] dma-buf: Handle all dma_resv_lock() errors
To: Bart Van Assche <bvanassche@acm.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20260223214950.2153735-1-bvanassche@acm.org>
 <20260223214950.2153735-7-bvanassche@acm.org>
 <5d9daad3-a687-4116-99fc-b6c7d82fe5a9@amd.com>
 <975acbb3-a4d3-45a6-9aad-3682c46e8fd8@acm.org>
 <5e23a5f9-0eaa-419e-ada6-4389754075bc@amd.com>
 <ac015b04-3506-4035-b732-f643a3cde4b0@acm.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ac015b04-3506-4035-b732-f643a3cde4b0@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0426.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 07b3b339-486a-42a7-f0d7-08de751ed0b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	4LvnTfKViFkDG0G4GpUuou8LFvqLdgGxRXsUrerSPCGvuXPYANX3l7aqD981UwoymGiXIC9TbEmDit8Inbk5HI7PfUI6yrOYiYELigzLUacZNBZ+d3LUlwNwzCeLAZp9iBlajAFBQWpVE9//ULMlVOI5HSBDJalTwk3o7utLp52ufjrRZ7L+YhxznxKXpab/e3F8bsqUsOpp5Xes3cTbhrNOu7rBQnUNAjcSsJLoMB1LXazbVWGVAOD3+6OdvFXxaJc/7RT6NFGX/r5w91MXu0D3iDgtjNg6c5LzTS14A3HgYOJs1qv1duEqXlVc4PwaZMxRYvbBRT8tQxSD4FpA96kaqFRcs/feMHxOu3hzlui7uEQJaatDe+jeDKVlNqoymiN5gBiGKgctkveo+f0NhKAXUn96qb4b4TFEvo5WQna1mHuIP+bEZu6/+l4FassertJn/E6aDKPKqf91NeCnDl5FV9UBITUaqX3LL61LIhW0iCL3iQHOF37/feSXjnwapqyAyFKCHoeukGu/ixaGACdZrXT0XMtkr24srOn2HuqxIQ6zwQQbPN51Mx7oYY7D6S44adA6Uu8JTg/xViO4eq2CnVYByeys017NIl6ld9PhDdFw5hgaM1oOoLgfjeY9aL8EoVW+EEKygzfwIK4qg0gqOgpjN9Zqvhua26t7R5SqIHRZf9htHPgRh0h78vzoQ6lasp6B8ojbIb3L21WAVTUi0zBSC7COFnxxyumKohs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3FuTllYNWprcXhOMktPZkZ1OFJrRGtsUDRYblB1NUVuVm01dTNwUzYyblI5?=
 =?utf-8?B?SWxkV2EvcnFKbmdXWjVnamZOL2JhR0FJV1VaQ2FnKytlaTdzY0FLMnVMdmRh?=
 =?utf-8?B?dTVBN090c2pyTW50ekdnL09mNG9hVlRHVGFIT1BCY2t1U3RVUGRGc05xQ1BI?=
 =?utf-8?B?bkJpVHNxZnNsd3VNNGgwRkQ5eGpXcjFZckR2UHdPMnZWY0N2KzFDaEdjcm9Y?=
 =?utf-8?B?Sk40T2lBYTU2cVlxNFN4QmNYNVhZb2tPZ2RsVzMxeVIwM0ZpK2N0QTZldzRp?=
 =?utf-8?B?ZHdHWFpTajl1cVJJM1o4SCtkSXJjZDEzZ3RGNlpYL0tzUXJScGhZOXJvUi9x?=
 =?utf-8?B?M0Vmam9SS0U5UWk3by9KRGROWEhJSWYrc0d6QVppcUZVNkFReE56TndDVzFy?=
 =?utf-8?B?YXA4WHRoSnloTnRDZi9XMEhoWndTalJUb1NZRjN6K3l4OFhjTGFLeXZYUnk3?=
 =?utf-8?B?NGFVWnk2UFlyVG5HU2pzR3RpR1lFbENscm9aT09wRWdoS0EyM2VoZkhjTXFq?=
 =?utf-8?B?NXB5Z1p0bFB3QU5hbjZoNFF1UE9Bc3pMZ3Nva1VEQ09kYkRtb1IvVy9GUDJq?=
 =?utf-8?B?cVN2RmZkOXcyYTUrb29lVFB5RkxMbDdhakFVZFRKNU9xb0Ura0ZkSTZNckdO?=
 =?utf-8?B?SGRCa1JpR2t3d1BuVXhGQVdrOFdpVk4yV0phazdtYTdHVTF1ZUdkRmdaRi9s?=
 =?utf-8?B?VmpGVXZvZFBYd0xDY1o5c1RjUlduSk96TnEwY3VtNzRiZTlkS3h3bVRiRnEx?=
 =?utf-8?B?UU9ERkpOTlIvTitVWSs0NTYwUGcwR2IvRHptQWtkWER0bU83MGhJRXZXcDVq?=
 =?utf-8?B?c0cwMTV4VllQRjJzelNpUUVxN2tlSFJQbHIySStMdmxUTndYVURSWWhFbVNC?=
 =?utf-8?B?cnNaNVdqditHa1R6b1FLeEQrNGtJY1NpQ2tnaWNJd204UzJ3cTZ0TkVCZFUw?=
 =?utf-8?B?N1Y4dWY5V0Nlazl3eXpleXVyektMdVhIN056UjBpL3ROME1aTURPZkJzdjUw?=
 =?utf-8?B?WnRtVThjM2I2NElGK0VkK1NUWUE4NGZYRnlCNmprVjR3QllKNm12NE9xL05x?=
 =?utf-8?B?bFFlbGdHbmFFbmRUbDJqZVB3QjJIVFJDMUo1Zm4zbGZpdHN5eUpyb2pMcHJm?=
 =?utf-8?B?K1l4ZUtzOTVZemlLV0o3UEUxV0N6aWYrbDdnQ3VJdEVQZXJkUldYdGV1UjFm?=
 =?utf-8?B?RXBjREpod1Q3VkZlb0dIM3Z1dWtPUWt2Z3RTM3dVQy93T2N6VmRidm9wU3No?=
 =?utf-8?B?QzRyVTVySG5LMDVUbWlSZVRWUnVubEQxaDhySlJKU3BqaVk2Z1Y4WVRRbVFK?=
 =?utf-8?B?a3A2bEFqSnJYYloyVnRVUmdJOUtaejVNTWl2VTdzaEx2ckMyVllldzhFaGx0?=
 =?utf-8?B?c1hvQ2lqT0RObU1LanhWOFQyWW51M1RkUUp2bGR6S3dUaklKQytVMndLODd0?=
 =?utf-8?B?QzRwQ29pU2V6Q1c0cS9HRUlLR3o5dHNKeEZMVUNERlEyYWtvUzJVOHh5WCtj?=
 =?utf-8?B?c2tzT3J3T2IwQUI1SDBPNUw5dE45UWJKQVkvTHVLZXE5SkVEdCsrVVBNT2la?=
 =?utf-8?B?RTQySUF6KzBFUFUyamJzRjJmdDZnYThlUWNTSUJEY3E1WkJzaXVXbVAyeHR2?=
 =?utf-8?B?U055WnkvVWpNcmMrZUgyWmZYTSs2Nk1yaTFvTWlWWlpsZHJhdDRnNS9nMElJ?=
 =?utf-8?B?ZzM4TWl0elJRZHFHOWM0b1hRMlBReWQ5YTZBaW16b3JIRktCYWxaa0pLZGll?=
 =?utf-8?B?VXlmeTZRNzBEU09TdytNR2NkaWlqc2xsT0pIRjFuNytkMFdIZ3VMdzVOeWFs?=
 =?utf-8?B?dUdrQ1VRYzNaTUJ6ODZtdVd6Q1pha24vb2lvRks2bmllZ21ONjlNNFNGdVJ0?=
 =?utf-8?B?NlRxTmtUbmhVcE5HdkxqWE45VnE3eHAwam1JNDZPTFd1MTZRaVpOUUZiSE5q?=
 =?utf-8?B?N2RpVjhUaXFBMHpMSGpmaWZpaTlDZ0V5ZlFlc0lkaVdnWTdNYWg1cDE4OHRP?=
 =?utf-8?B?Wi9jcUV3aVNMM3VmWEdCcEk5QjlCc1luVXRwSGRHbHQ3SURKR2hjc1lmdHU5?=
 =?utf-8?B?UVNPaDFTL1RucWRLbVRBaHl6M1JiZ2NQVjVqYWwwcit4MjZRdFJYeUJWOWE3?=
 =?utf-8?B?Y0tIZ2N5QVE3bHoxOUhEQlhYczhRMW9ZODhnNS9Rc0dOamVvL3dCY1NOSW5H?=
 =?utf-8?B?NjRpYlM5RXVwOWhsc25wZnRrUmg4U2MveU9hWitubU9EV2xON2o3eURDdWtq?=
 =?utf-8?B?Ung2L3EramRpMHpiYU9PRmJCMnRFQVQyMEpmcDI2TVJHQ1UzeWlFdlMwNkdw?=
 =?utf-8?Q?74ezYH8cBLnPH2QTxj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07b3b339-486a-42a7-f0d7-08de751ed0b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:07:14.7929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huB0OhOPv5TJzQPXKG2xyMQvCBcWKKQ8tUAX+mvvUq667YubnPabzpaAAKdF5qGC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TAGGED_FROM(0.00)[bounces-53468-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: B0E761A3F9F
X-Rspamd-Action: no action

On 2/25/26 22:36, Bart Van Assche wrote:
> On 2/25/26 12:16 AM, Christian König wrote:
>> Would it help if we change the code like this?
>>
>>          ret = dma_resv_lock(&obj, &ctx);
>> -       if (ret == -EDEADLK)
>> +       /* Only EDEADLK from the error injection is possible here */
>> +       if (ret)
>>                  dma_resv_lock_slow(&obj, &ctx);
> 
> Yes, the above is sufficient to suppress the Clang thread-safety warning
> for dma_resv_lockdep().

Cool, then let us use this approach here.

> Is a source code comment about EDEADLK preferred
> or would the following perhaps also be acceptable?

I think the warning is optional, but potentially good to have as well.

But the code comment is mandatory, otherwise we will have forgotten in 10 years why exactly only EDEADLK can happen here.

> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index bea3e9858aca..4d65dddbcbdf 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -790,8 +790,10 @@ static int __init dma_resv_lockdep(void)
>         mmap_read_lock(mm);
>         ww_acquire_init(&ctx, &reservation_ww_class);
>         ret = dma_resv_lock(&obj, &ctx);
> -       if (ret == -EDEADLK)
> +       if (ret) {
> +               WARN_ON_ONCE(ret != -EDEADLK);

Please make that only WARN_ON(). I would be massively surprised when a subsystem initcall executes more than once.

Thanks,
Christian.

>                 dma_resv_lock_slow(&obj, &ctx);
> +       }
>         fs_reclaim_acquire(GFP_KERNEL);
>         /* for unmap_mapping_range on trylocked buffer objects in shrinkers */
>         i_mmap_lock_write(&mapping);
> 
> Thanks,
> 
> Bart.


