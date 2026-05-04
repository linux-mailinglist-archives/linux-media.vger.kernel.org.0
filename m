Return-Path: <linux-media+bounces-60309-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODB6Hfuz+GmWzAIAu9opvQ
	(envelope-from <linux-media+bounces-60309-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 16:58:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA24C044E
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 16:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 188E730465E3
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 14:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB5B3E0228;
	Mon,  4 May 2026 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ji64bmv5"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012061.outbound.protection.outlook.com [40.107.209.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9413DFC83
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906572; cv=fail; b=rnxezvGNfGoq2javFstZG+9VbnCsUR0hFFS7EFUVMfTF2TSxD5QYOKvE2UFEDrop/3ErGh536dGdKbfXJK+0xNSVkLNO9Wmq67i6HKfZ11c822hIpbdKJ6WDgAxlzSMHPeFakKmglCAJshnd2v2yo/vBR4L1K1pc27m3JDeyuW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906572; c=relaxed/simple;
	bh=41uMphossVAl/GLa0f7Tj2Wi+XkhUxftk1ZDIsTkOU0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V5JVfhekAY/0yGApvaKDGaOZQ7iGbhQpdW9sDwog62erZ7HDku4W1VRPdsmzmJIY72ywPVc1A0IYmnUT0weEhMar+0AEdhyEOyuEiHjG6z17gwOm6jlBpCt/L3o2p0wG15cUxmDrF54WySVV/aymIwodfM+sYFPZOE0zDCe5KsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ji64bmv5; arc=fail smtp.client-ip=40.107.209.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRMUQMKVkeQIg73zW6LINYTMWXdubsKeIOrDypzk3JzmtTA/6XUik9/5RAVYJcfsudujPuXSli7C+Oxn5SKXWdU6NOPl/3jI4Tkdi6ICAXNDDjjMzoty7ifnjjQ+OXyOaRcX//c3ZE4PKrXEjLTbYyHN95PwXPefzLqtLgWUxlwm4xOJKLF1elQtsLHZvP85/THkP/Em9J97TXsKeUZcDfcKTlfLBkwoN8EoHauI/LqnQ0kihtOc+0NPnQPFEIFvgGzuZ+KkG7hgSz3jw8q4GGyzDgODL0T4yZ6Ock0EAhfCtw2PtHsuiyekztBq0BpoFwxfQxnhVEaE5oI0HSop9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwYuHIEvlr7JfstEQNZrgLZuIoODTjcVTT0rngTqnkU=;
 b=k9eAayHaknAaDGrIgWOYzaUONvVAWe3s8V9R1AQTlRuX5R82RJiTxV/D2RrBOmjh6HX/M3vdTcrCmZYwBN2r3dwOstdqUm/bRSRRkfaFPGjnawD//efqOL9Eh3b2Hh+CtgurrCw0mXmxqSDLITJFdrgiuCgffAiJBVAfbyjuIw8gD+JkENklTo2eODcshZdUfH602LoFc7LlwspGvWYzMHsRfRJHrW43ae/wtPgRoTcr6natMFTP+Z+mnx3//gQKDhK0MaIQxEZEXy8HbCaaI8DgjxRWMuNYWbRqGIrlxDf4QI5NMBE7OtR27Nyc35DxFXh0qmIZaaruA4YhL6OyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwYuHIEvlr7JfstEQNZrgLZuIoODTjcVTT0rngTqnkU=;
 b=Ji64bmv5UxW2G6bMsqam8z6wxEjfjy0zlYYaP0wqym8RCw3sgICNYe3l+e8XmNUrHZhzJMprn7zzIrr2TcAXubPZCquHILksoFLdGx6/7HVY1rg1P5wdtGkyy16K35i9PwCTAZh78K1lQDRGovf5Ng9dmvvn+hwN1sdgpWZF9H0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9315.namprd12.prod.outlook.com (2603:10b6:610:1cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 14:56:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 14:56:03 +0000
Message-ID: <06188881-4eb7-4685-a54d-60806accfb8a@amd.com>
Date: Mon, 4 May 2026 16:55:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf/dma_fence_array: optimize handling
To: Tvrtko Ursulin <tursulin@ursulin.net>, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260422103012.1647-1-christian.koenig@amd.com>
 <20260422103012.1647-2-christian.koenig@amd.com>
 <5e15b5d8-8184-4496-8da0-793ccd592d10@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5e15b5d8-8184-4496-8da0-793ccd592d10@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P223CA0030.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 1162ef10-c76b-42c3-8678-08dea9ed4297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dJdkIkFsM6kfFrVju+r6YMMr5xxkxEmzgGy0YU5dPJW9+ZSyGarB5eBos9zXmQgC1wHwCXIxAI9hAmFtje/YI4sYvsU6CQM2+IVftcVq1jAzEWXUnBuGa7Nd+3VR/Sium6/yFrUfv6xN00ZFvLVeYC2W8rWSQjDAtHnRGZ6yebonZ3hs5v+65X1Nyqru0lMtoIm61cRXiqVGh3o6LUGWpsyuuRUDxyjXXBKORVsPLtKipEfjTEAtfKTVN4ZhMDhJGnHwUmcaZNvMf6jq0xU/0IBq4c75L894AalQarm3zxZ6OLc+ww07jmVXQrF9NvDoS7Ew3LUXfvDMBKDA+hSyHg8scezR4XrNlwqpIKiiQ5eCR0EoA5NX3lOBne6xiOxwaqkSDZXOQIQN1Nngw0M1UyzXRMYUSUemd55Fg+XMXRsqXjR2Np18n3C6ZUcA9UjrtZSBAabtDA7X2DiRSn8yhARh7t+J7XtE0qifQYQ/aQO1yoZ70mMkvazxBtwSqFmvrNMVTJclmkred/Y/XmNTAGtJbtjsQesTUQjNNI9nqNlZXWcvB6Tc95ODTFE3L0owaTWkQPxG6XX7TOQpLiy9nUPXy1/ImItSftDtOLI40CSOTCG4+K/TGfJf/WdCfYkSeyCR510UqDaysqq8jDH8JHw96EWEyesDT/bG2edj4eVB4I1Ti/aUJjsgVZfx8eUv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnhhSHA4cm5qYkt3TDUzT2RvL3p5eXprVEdiU0pvNGc2d3F4TjJGb3pQMlpr?=
 =?utf-8?B?UmZOZmNqUUk4L2FESExRN2ZhaUFQOC93bmlBRjEybWYvaldjVjQramN5dC8y?=
 =?utf-8?B?N1NUODlEOWR4YnJYMlFDMHRSeVdHUjNLNDFsNnpNZjNnWHcrUDB4WW12emlh?=
 =?utf-8?B?aUhlNjc5dzNiTTFIZm1VbUt4QWc4WWh0N0ZlWEZXdVl0UXlIY1VDQ2RZN0Iw?=
 =?utf-8?B?VVZFTnZib3QwWm8rNklMejhxSzhwU2RodW4zNjIxNVp3cXZKOFFkbFBhVmJk?=
 =?utf-8?B?QnkrZ2hZMnhpQlhYbjVwNTdvZmVhNXVxSkVSamluOHFLaXhVVWhjTG9jKzVE?=
 =?utf-8?B?UUlYd1ZHK2cwQm1PLzF6dmVvNmp1OGsxR0hVem03dUhuSndZc3M3VW9HdnJO?=
 =?utf-8?B?T1VONW1XSlBtaFhDU2JlVDNSanBTb3hvUzdpMkhzcFZDNHVLQTRwdzM1b2pM?=
 =?utf-8?B?cU40QVplOHJZbkpnQUc4T3FsdWVBblpEcWJkcHVFeHk1Qk14TjBFeG9tbENC?=
 =?utf-8?B?aENWRGhYWmVoQWhXaDNuUlhqQS9HTyt3LzNxSFVzTEFDaDMrT3ppUWxnRXUz?=
 =?utf-8?B?L1A2akZEdGUvUnVRL252NCtrZXI0ZEhybUVxK2hmY0JDUU1mZSt2dHMzVSt5?=
 =?utf-8?B?YzFaeEhPMmwzOERzOTRDd2IwbkhZN0lXSzZ4SldyejlpdmpQZXgxN1h0cHA0?=
 =?utf-8?B?OTY1NVBJTWQvbXdralRnRkMzMDlHVlp3c0UvYlJSdk9LVlJjYUhRZDUrS2tF?=
 =?utf-8?B?TklxYmNESVo3R2lBYVdYZk5hUEpXYkRLWkJFU2QreDhkSlhyOGxCRktKd0Iy?=
 =?utf-8?B?clI3ZUE3aGgxYzNlOHBRY2VVV3NxejBHOGpicFR6QUx2a205bGg3WDRUd0dT?=
 =?utf-8?B?VGM0WndFZUlucUJ5WWRFWWJaaHdiTUtmQUpIdUFIUjdRbU5qMTc4U2pJcEtk?=
 =?utf-8?B?TlRpUndtdzI1YzRrYjdyMlBHbm14VG9STkFzK0s5RHFKZ2dRSm1VcE1FMzN0?=
 =?utf-8?B?U3BxQXFJZFUyaE54T3ZPZHFpQmdyMXo3YWxYd1pXSTZhS0RPeDFxZGlFRXZU?=
 =?utf-8?B?eGFpRWtCL29tcStPRW5kQWQ2VVp1UDRmRzI5bVMyUGxkVmhFczVRSFpEcFV6?=
 =?utf-8?B?WjViZ0lYa1VGWE4yYnRidko0TFcrTUUrMTZFdFJFUENkMkVaK1FCenppaHVp?=
 =?utf-8?B?QXZhcjFiVFFkaUlESmNIU041TzJaTmoxdEwvN1dYTkF4TS9iTnMrY21kbnVK?=
 =?utf-8?B?SSs5VXJHTjk5dThuVDVVZVphaUpYSmlIdzBLTGFXUFVoQzJmZzdaNDF5b3BD?=
 =?utf-8?B?N2t0VzB4QXRYNmNLQ0x1QnFIR2VFTHhBSVU2dU5ldXB5bDU0YjJ2elZEZngx?=
 =?utf-8?B?VjNPdE4xajZnYjVvM0c0MnlnUGgxNHJsbGpHeVUrdXVHSDZlYnNOd1ZVeVUw?=
 =?utf-8?B?dEFXVG0ySThJWTd2dDR6TmUzc3VjUnR2MGVlU2ZNejZvejF6QjM1SUxVU3R2?=
 =?utf-8?B?WWZNVlk4Ty9qZU5hb1RvL1gySERqOFdIK3JNUTFPWTBJeVE2NkdFeGVLaWx6?=
 =?utf-8?B?NjR6NEdwYW5vcWdVMnpscldSQ3NJeHMxQjY0QkV1TWpQeGZ2a2lyYnBkZ0M1?=
 =?utf-8?B?UkpZUngvLzFqMHJWNlh5VHFwQyt5K1R0b0ZSMXlPTkM0TVN2eHYrMjdacTZO?=
 =?utf-8?B?dGN4dkNWZ1d6TGNMZFhqQWE1ZFRqT1FLNWhJOUJ1SlByNHFyNFJtMTBVWnE2?=
 =?utf-8?B?dFEwcXZBclpuMElNU0RYVWVBaW85QUNqREcrWkRjV0lNdlFKUi8xSmp6dith?=
 =?utf-8?B?azFPSzZBT1VLaXRSTTROaG9EczdhMThzWmI5RjNMZndENEphYThnb0FHanhU?=
 =?utf-8?B?elFTY21kVjR5VHVqK2ZCMnVJNUMvOGJ5UFY0M2RoS3ljQ3JjejFSTGtJZVJS?=
 =?utf-8?B?Mm1qUGRrMm1DRmZmb0pNczZjdFRTeHBvdms0Yzl0d3BRSVE2WDRSQWp0bUt1?=
 =?utf-8?B?czEyQlR4Y2s5Uno2WGtYdE1BeDJKSTNSclZmT1h3bEtybm9wbzVVOHFNdjZC?=
 =?utf-8?B?ODYySWJoaXF2dHk5RmNtelh5UmdLZ2xpd2dCMDR1dVdyZzBEQkZWc2dGYzZF?=
 =?utf-8?B?b0FzZUwzZUJvNVFIM016YWl5ZGtYQUdZV3V3T1p3SFordTdDVXByQlI0bnZT?=
 =?utf-8?B?QnF4bVUvNnQ2bENsWGtkcFUwNkdLWlFvY1ZLN3VDZzA5Z2hnbjRNT0YxeDRD?=
 =?utf-8?B?M3Y5UFg4NTBiV2NaVWRlclArbHYrdXFpR1ZRam5IM3NqQW84V0hMUHQwZTRL?=
 =?utf-8?Q?YPBt86UmfPKSFxCLWB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1162ef10-c76b-42c3-8678-08dea9ed4297
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 14:56:03.3307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UC+U2hEFSQrsYN4wTm4A46ySCoxNcUZ4l6SEWQb3/avxiZAB35P3mZ/00wPlYz2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9315
X-Rspamd-Queue-Id: D6BA24C044E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60309-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 4/22/26 13:37, Tvrtko Ursulin wrote:
> 
> On 22/04/2026 11:30, Christian König wrote:
>> Removing the signal on any feature allows to simplfy the dma_fence_array
>> code a lot and saves us from the need to install a callback on all fences
>> at the same time.
>>
>> This results in less memory and CPU overhead.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence-array.c | 130 +++++++++++++-----------------
>>   include/linux/dma-fence-array.h   |  22 ++---
>>   2 files changed, 59 insertions(+), 93 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
>> index 5e10e8df372f..f1b4b3296c87 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -42,97 +42,80 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
>>       cmpxchg(&array->base.error, PENDING_ERROR, 0);
>>   }
>>   -static void irq_dma_fence_array_work(struct irq_work *wrk)
>> +static void dma_fence_array_cb_func(struct dma_fence *f,
>> +                    struct dma_fence_cb *cb)
>>   {
>> -    struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>> +    struct dma_fence_array *array =
>> +        container_of(cb, struct dma_fence_array, callback);
>>   -    dma_fence_array_clear_pending_error(array);
>> +    irq_work_queue(&array->work);
>> +}
>> +
>> +static void dma_fence_array_arm_cb(struct dma_fence_array *array)
>> +{
>> +    while (array->num_pending) {
>> +        struct dma_fence *f = array->fences[array->num_pending - 1];
>> +
>> +        if (!dma_fence_add_callback(f, &array->callback,
>> +                        dma_fence_array_cb_func))
>> +            return;
>> +
>> +        dma_fence_array_set_pending_error(array, f->error);
>> +        WRITE_ONCE(array->num_pending, array->num_pending - 1);
> 
> Do you think the WRITE_ONCEs are needed? As the loop will restart with un-annotated read anyway, but not just that, I don't think it can be compiled away in the kernel with this usage pattern. Maybe I am mistaken.

I also think the WRITE_ONCEs are superfluous. But I wanted to be on the save side, not that the compiler re-orders the write before the dma_fence_add_callback() and it shouldn't matter for performance.

> 
>> +    }
>>         dma_fence_signal(&array->base);
>>       dma_fence_put(&array->base);
>>   }
>>   -static void dma_fence_array_cb_func(struct dma_fence *f,
>> -                    struct dma_fence_cb *cb)
>> +static void dma_fence_array_irq_work(struct irq_work *wrk)
>>   {
>> -    struct dma_fence_array_cb *array_cb =
>> -        container_of(cb, struct dma_fence_array_cb, cb);
>> -    struct dma_fence_array *array = array_cb->array;
>> -
>> -    dma_fence_array_set_pending_error(array, f->error);
>> +    struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>>   -    if (atomic_dec_and_test(&array->num_pending))
>> -        irq_work_queue(&array->work);
>> -    else
>> -        dma_fence_put(&array->base);
>> +    WRITE_ONCE(array->num_pending, array->num_pending - 1);
>> +    dma_fence_array_arm_cb(array);
> 
> So for x86 going from one irqwork latency to num_fences latencies is probably passable but I am not sure how other architectures fare.

Mhm, what do you mean?

Previously we started one irqwork handler for each not signaled fence when enable_signaling was called, but now we reduce that to only starting one for each not signaled fence when the previous fence has finished.

As far as I can see that is always better or at least the same overhead.

> 
>>   }
>>     static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>>   {
>>       struct dma_fence_array *array = to_dma_fence_array(fence);
>> -    struct dma_fence_array_cb *cb = array->callbacks;
>> -    unsigned i;
>> -
>> -    for (i = 0; i < array->num_fences; ++i) {
>> -        cb[i].array = array;
>> -        /*
>> -         * As we may report that the fence is signaled before all
>> -         * callbacks are complete, we need to take an additional
>> -         * reference count on the array so that we do not free it too
>> -         * early. The core fence handling will only hold the reference
>> -         * until we signal the array as complete (but that is now
>> -         * insufficient).
>> -         */
>> -        dma_fence_get(&array->base);
>> -        if (dma_fence_add_callback(array->fences[i], &cb[i].cb,
>> -                       dma_fence_array_cb_func)) {
>> -            int error = array->fences[i]->error;
>> -
>> -            dma_fence_array_set_pending_error(array, error);
>> -            dma_fence_put(&array->base);
>> -            if (atomic_dec_and_test(&array->num_pending)) {
>> -                dma_fence_array_clear_pending_error(array);
>> -                return false;
>> -            }
>> -        }
>> -    }
>>   +    /*
>> +     * As we may report that the fence is signaled before all
>> +     * callbacks are complete, we need to take an additional
>> +     * reference count on the array so that we do not free it too
>> +     * early. The core fence handling will only hold the reference
>> +     * until we signal the array as complete (but that is now
>> +     * insufficient).
>> +     */
>> +    dma_fence_get(&array->base);
>> +    dma_fence_array_arm_cb(array);
>>       return true;
> 
> Are you sure it is safe to always return true?

Oh, good point!

It is safe to return true here, but it is not save to call dma_fence_array_arm_cb() because that could signal the fence and result in double locking!

Going to fix that, thanks.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>   }
>>     static bool dma_fence_array_signaled(struct dma_fence *fence)
>>   {
>>       struct dma_fence_array *array = to_dma_fence_array(fence);
>> -    int num_pending;
>> +    int num_pending, error = 0;
>>       unsigned int i;
>>         /*
>> -     * We need to read num_pending before checking the enable_signal bit
>> -     * to avoid racing with the enable_signaling() implementation, which
>> -     * might decrement the counter, and cause a partial check.
>> -     * atomic_read_acquire() pairs with atomic_dec_and_test() in
>> -     * dma_fence_array_enable_signaling()
>> -     *
>> -     * The !--num_pending check is here to account for the any_signaled case
>> -     * if we race with enable_signaling(), that means the !num_pending check
>> -     * in the is_signalling_enabled branch might be outdated (num_pending
>> -     * might have been decremented), but that's fine. The user will get the
>> -     * right value when testing again later.
>> +     * Reading num_pending without a memory barrier here is correct since
>> +     * that is only for optimization, it is perfectly acceptable to have a
>> +     * stale value for it. In all other cases num_pending is accessed by a
>> +     * single call chain.
>>        */
>> -    num_pending = atomic_read_acquire(&array->num_pending);
>> -    if (test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &array->base.flags)) {
>> -        if (num_pending <= 0)
>> -            goto signal;
>> -        return false;
>> -    }
>> +    num_pending = READ_ONCE(array->num_pending);
>> +    for (i = 0; i < num_pending; ++i) {
>> +        struct dma_fence *f = array->fences[i];
>>   -    for (i = 0; i < array->num_fences; ++i) {
>> -        if (dma_fence_is_signaled(array->fences[i]) && !--num_pending)
>> -            goto signal;
>> -    }
>> -    return false;
>> +        if (!dma_fence_is_signaled(f))
>> +            return false;
>>   -signal:
>> +        if (!error)
>> +            error = f->error;
>> +    }
>> +    dma_fence_array_set_pending_error(array, error);
>>       dma_fence_array_clear_pending_error(array);
>>       return true;
>>   }
>> @@ -171,15 +154,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
>>     /**
>>    * dma_fence_array_alloc - Allocate a custom fence array
>> - * @num_fences:        [in]    number of fences to add in the array
>>    *
>>    * Return dma fence array on success, NULL on failure
>>    */
>> -struct dma_fence_array *dma_fence_array_alloc(int num_fences)
>> +struct dma_fence_array *dma_fence_array_alloc(void)
>>   {
>> -    struct dma_fence_array *array;
>> -
>> -    return kzalloc_flex(*array, callbacks, num_fences);
>> +    return kzalloc_obj(struct dma_fence_array);
>>   }
>>   EXPORT_SYMBOL(dma_fence_array_alloc);
>>   @@ -203,10 +183,13 @@ void dma_fence_array_init(struct dma_fence_array *array,
>>       WARN_ON(!num_fences || !fences);
>>         array->num_fences = num_fences;
>> +    array->num_pending = num_fences;
>> +    array->fences = fences;
>> +    array->base.error = PENDING_ERROR;
>>         dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
>>                  seqno);
>> -    init_irq_work(&array->work, irq_dma_fence_array_work);
>> +    init_irq_work(&array->work, dma_fence_array_irq_work);
>>         /*
>>        * dma_fence_array_enable_signaling() is invoked while holding
>> @@ -220,11 +203,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
>>        */
>>       lockdep_set_class(&array->base.inline_lock, &dma_fence_array_lock_key);
>>   -    atomic_set(&array->num_pending, num_fences);
>> -    array->fences = fences;
>> -
>> -    array->base.error = PENDING_ERROR;
>> -
>>       /*
>>        * dma_fence_array objects should never contain any other fence
>>        * containers or otherwise we run into recursion and potential kernel
>> @@ -265,7 +243,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>>   {
>>       struct dma_fence_array *array;
>>   -    array = dma_fence_array_alloc(num_fences);
>> +    array = dma_fence_array_alloc();
>>       if (!array)
>>           return NULL;
>>   diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
>> index 1b1d87579c38..3ee55c0e2fa4 100644
>> --- a/include/linux/dma-fence-array.h
>> +++ b/include/linux/dma-fence-array.h
>> @@ -15,16 +15,6 @@
>>   #include <linux/dma-fence.h>
>>   #include <linux/irq_work.h>
>>   -/**
>> - * struct dma_fence_array_cb - callback helper for fence array
>> - * @cb: fence callback structure for signaling
>> - * @array: reference to the parent fence array object
>> - */
>> -struct dma_fence_array_cb {
>> -    struct dma_fence_cb cb;
>> -    struct dma_fence_array *array;
>> -};
>> -
>>   /**
>>    * struct dma_fence_array - fence to represent an array of fences
>>    * @base: fence base class
>> @@ -33,18 +23,17 @@ struct dma_fence_array_cb {
>>    * @num_pending: fences in the array still pending
>>    * @fences: array of the fences
>>    * @work: internal irq_work function
>> - * @callbacks: array of callback helpers
>> + * @callback: callback structure for signaling
>>    */
>>   struct dma_fence_array {
>>       struct dma_fence base;
>>   -    unsigned num_fences;
>> -    atomic_t num_pending;
>> +    unsigned int num_fences;
>> +    unsigned int num_pending;
>>       struct dma_fence **fences;
>>         struct irq_work work;
>> -
>> -    struct dma_fence_array_cb callbacks[] __counted_by(num_fences);
>> +    struct dma_fence_cb callback;
>>   };
>>     /**
>> @@ -78,11 +67,10 @@ to_dma_fence_array(struct dma_fence *fence)
>>       for (index = 0, fence = dma_fence_array_first(head); fence;    \
>>            ++(index), fence = dma_fence_array_next(head, index))
>>   -struct dma_fence_array *dma_fence_array_alloc(int num_fences);
>> +struct dma_fence_array *dma_fence_array_alloc(void);
>>   void dma_fence_array_init(struct dma_fence_array *array,
>>                 int num_fences, struct dma_fence **fences,
>>                 u64 context, unsigned seqno);
>> -
>>   struct dma_fence_array *dma_fence_array_create(int num_fences,
>>                              struct dma_fence **fences,
>>                              u64 context, unsigned seqno);
> 


