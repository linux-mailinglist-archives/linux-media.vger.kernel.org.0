Return-Path: <linux-media+bounces-60569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAxDIGYO+2mrVwMAu9opvQ
	(envelope-from <linux-media+bounces-60569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:48:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AE4D8E49
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6BDF308DB81
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 09:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F6D287503;
	Wed,  6 May 2026 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="U84Rkov1"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B903A5448
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060774; cv=fail; b=g+kL9iYpFR3w4FtExasKjyow55dSH07M1q3ccnTwQrYBJ8xQu2+Y5lXhSnwKQ96spFX8/RZU6KNHVsSb40FyahSlq4mKaP/48yfS1vBYpCx/6A271JRGZ6HpPFidRW/AnST/r/ma+ehDeSyPEyJdWQnmAjJFpp/6LHpxWy9nvcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060774; c=relaxed/simple;
	bh=nqEJb1v2ZLiKSocaRYJ4IRCL7VxhGcBLktXQCjddVLI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ikBTypLk9+OdTmGN5//frTxZt5xSe23o5GfVwymUv8buubKG6kN7RvtlWqAc1uRn5BUaFo/Q9QPs5uuDMP1nhv/eA4WIzS1FjoGpDFvNe/8bMM1fK90nqIB4eL89Vw70Arg5R96j5/yS3GJf/6kaAgmOvf7GwBqgWFomVmlvA54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=U84Rkov1; arc=fail smtp.client-ip=52.101.56.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThErPPzlUzGCvT2TE0t6MsFj0i4THOFRDLY2OC5DHnNa/JLu2Fy4KA+8suvHJ9HfpbU5OAAhUSVGEnS0FR2EekJZ9rNddSAxZYEisl+KoKSEM2hq+dB7Qc3ca2tmCvaLVvkWGbZzu7gL2Yb29/y/nFgUmIRy3uM0Q0xqy/y1IvLBt8Qu/IhjCRTmJ+ALfhUZWJQTsevOK+brqD2N4urMgHVUXVRHQgs0XtCtSSsLy8R2tF9Ae6clHf7Rk11rsxbPr9aC2oAi7Remct3CuxSRtuLavDtCdWPbW5FIDjLQNqjQc/48ZJKOC3dNJy59ruTUQqUeMo4TIYHJqqLvnxW3fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hijwAyXQLvhLmFaU9EVxhL+AwlWZUjmKwRReuFTnks=;
 b=aBgrTvNufqxCDWustN6yeKzbKqbh+eyekLPrfvsxYY6AzQ7FP/ZvWBTCzvV49KywUqJkTkr8rDsVxDtdWdWOGdbu9WAnaXRPFJYXpA+y2JP3Ge5fRdsilLGjf3NwIUj+EAgQ37iTxCtqHtm3xvrNpZcJw5y5RGHQVKNhR/K6V2TQ2Yiqi2O0e9MjguXkq0VSIcBALkIRPsPHFQv1/I9QNaANEGhEChNVKB5R/6+9gbjd9XxIGU6I7fJXw+syR6bUKbZwKXplseNcAmxNn1mlX61orBNGNDK5YAAgOD7VH4cIJa9SfwoolPCxy32x0O985ahLNwaD4kwHLQN2SEYhXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hijwAyXQLvhLmFaU9EVxhL+AwlWZUjmKwRReuFTnks=;
 b=U84Rkov1epwg7m3rmRu94mxRxS6klz7a6MXK4sOGY1SHgefMH60Za6Sg4c+Jg1yiZ5MN/h3lgf61lME8DRa6rl5HtoaRErivNLJ/hVdJgs4ER9L6T60T1ULs+2m4JiA7DBkLu09U6xQHVdoHC8P+i5rK97zn+vnmifu4FdAca1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:46:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 09:46:07 +0000
Message-ID: <6bbf0cdc-a385-4a57-b059-6530ad096331@amd.com>
Date: Wed, 6 May 2026 11:46:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/dma_fence_array: optimize handling v2
To: Tvrtko Ursulin <tursulin@ursulin.net>, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20260505110828.1574-1-christian.koenig@amd.com>
 <21121a6f-4431-497a-a8ff-61219cb00ad6@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <21121a6f-4431-497a-a8ff-61219cb00ad6@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 917b9a19-c65e-4875-9290-08deab544bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KMeUR9YF0HGLqx+8pftAebWieYZ6yXBIHHguNKRg9PzupJd4Dymd05ltHF9DOHsHhZqkcc//Bicg2GhEX3H63kjxyM0M1+C8Nl+eqpc3aYG78lP4HysW0cCw/fuGpo8fk495w7ge7swfCTy76/mmKBAW3UQo2HPPVPuDGBgCUcaOC6y11LJAYQmT6ALrtqa4ObC666kYkOgx2xTeAq4muGlxuTfsFjOytOafrqtUpSX/E17cnHLLO5+wh/I3Nqa4NCkiQvSNvOWnMQUgcVVvb3BT0ivYokBALSsp/m2Li8F2Mnhu47HnKlNv0kdGbN5MRq7oDzqP+keZxe2/Wx2MZyyVLJ+CwJ3+z2FOZeZSLG47n3k6ASGB4psjDJDcLbYvgXCjXL/wiB3CeX3W3JJaArs8/S+tAgC1XzzYZbOZz3A5nK6QTGpJVXVeMmKjHkfQSNHSbu1F7P5Seq1GoAXP/y5AQ1aSYzkxvn+DeI18v0kla18fv7v3Hqw1rRQh3TKjRZb/bXuojWoc6/1vGtkAtkojphdJhkarKRF8JI2albnO3KbZF7+ZHcFL22PV6JGubV1a+hKeMBH7eyIoNz7e3LaBHZJ6uT80d1oKw4ryd5/Kc5KXcoIWfwbR8njpeIkDmuUExGhpTPpbwVYNYGSuaICEhvH5AnfGLlg2FCBxyFH4N9+zQGuShF4h8inUJ0ZQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxkRTdFM2NYRkR4WWRkNUNESmxvamRkdk9NbGYwdGlwL1NSSzFmaE1seHFn?=
 =?utf-8?B?a2JxZzZ1RWVteG9SaUZobzZuVDYwMzRPVDFSTVVIWm56RE02bHZ4RGh2aGNE?=
 =?utf-8?B?MTliSU1OYWNESUxzZDRtdkhabnVDNTY3Z013MUJFVnF5Mk5HcVFWZFRjdjZN?=
 =?utf-8?B?R2hVSnRHRlB5cStsVUkzdmZGU2NxTS96M3FnNzRlQnFhaURQMjBRRWZLRytO?=
 =?utf-8?B?by8wK0xlNW00OVNOSHo5aFpIb05mWWV0a0UwbFZudmlrWnh2bDc2YWI0eDFK?=
 =?utf-8?B?aWFQcENCeVAyeHVOTTR1ZmhPUTJucUVueHlUVlNkT3MxL2Vkazk0Q0VlaWta?=
 =?utf-8?B?dndtRVZOQm0ycWFwb2MzenlObk5pMTl4cjIrbllkSXN2OUlvM1hpUnNaM1JH?=
 =?utf-8?B?cjQySTI2TU9zQlFhd1UvV0hobDZUekUvclBDcVlCeXU2cnFVdkdFMkhIOGk4?=
 =?utf-8?B?RXRSWDZwMHhDN0t4KzA2NGJqMEFnZ2xLMjhNQ2NoMWpyeW05ekROYjM2WTR1?=
 =?utf-8?B?SjNGZDAyNDYrdHJrajBldWovbmxFL01pMnNHMll0MnZYakozTjBEcGFjVzRN?=
 =?utf-8?B?Y2lOdnErZ2o2NStjbHNvSUpybUZMZ3ZySTlwL0NZN3p0SHpFY29SNExNczRG?=
 =?utf-8?B?RitmQUhzTzQ4ZWs3RU9UTml2U1Y1NjRWUFljckdORGJVVGVpaG5DeGRObXdx?=
 =?utf-8?B?ZzRYZllOeHZaaGNEL2tQSWcrN1pwREJEb3hNMkNOZUJrKzNRT2lOMFRpYVVL?=
 =?utf-8?B?SzZFakhpOEJMS3p6THVZdzRNUEY0bUE0MVZvMXg2QTFmR3lvSEkxaGxKV3d3?=
 =?utf-8?B?SHZBRVRDRGszd0RCKzN0NlRkVDBwSTVKOXRrVXE5OFFrVE5JaS9RbkFxOG9L?=
 =?utf-8?B?R0g5OXpKZmFSM203U3dXTVVwUWhlczZQbDNUZXZsMTVTc0lyckZSOUl1TkFa?=
 =?utf-8?B?SFA3Y3laeEtsc1hyTWljZHBlRTVWd005bnhuUENHcW00Z2h2NzdTOWNLUCta?=
 =?utf-8?B?ZktmRDIvUTY5NnlmQWd2ZmZSamVTaEk5RUlHd2VLOUlyVTBESTJCQi9EMDU4?=
 =?utf-8?B?YlIwZmpadVZ5YS9hVnNaMmwvdW1QcVp4WE5BVGNhY0ZuVU5Ec003Uno1MkF6?=
 =?utf-8?B?NmxFNWxQS1YxY3A0Q3BMUS8vK3NLamgvcEhQZFNxb3RQeCtLWTM5dTBVeVZW?=
 =?utf-8?B?YloxSzdGaFhZU1VnSlU4MW9jbzJVcUxOczVBb1NpM2Q2bHhkcHd4SmVkbGJk?=
 =?utf-8?B?bWFIM3haOU9kSFc3bURtMjFpUHJPK3FVYU93UElsWHhleWhIcUpQbjV4Q1Ux?=
 =?utf-8?B?S2ZrZXBqdWdXUHpSSVpYVzB5cjdRRi96K3hLOXJYZnA4SEUwRngxSEFkZTNv?=
 =?utf-8?B?cVdjVWhWNExtNzMxdG1XRHhHQVdiRFRqa2t6TnlaNDJLNHZMbUk0OXZGZDVi?=
 =?utf-8?B?cEZ4bEtGSDJ5WUFXOVI1OE5KcTQ4VElFSVBwQ0N0NkRBeVlHOHZtbHpUZ3hO?=
 =?utf-8?B?RXJ1ZzJKdHVzU2V4elBkSHJBRnQ3WGJ3b3BaTUhFUXgxMzZyS1F4M3RvOUpz?=
 =?utf-8?B?MEljbzhra0U2ZUlxUEtFS2hTS1FwbEZaSjY5NFVLUWRCK2E3NVc3Y0lXRlZN?=
 =?utf-8?B?UTZiTC9vOUhpYStYdVlObUdOMFV6UU1idSsrUDJ4ZEw5SXdQQWV0bHhyOWth?=
 =?utf-8?B?anFybWFMeFo1cWcwS3dxUEcvSG1rdzFqSXpLRzVsdFMrNE9SNmpzWEhMQURP?=
 =?utf-8?B?bFBmZGpiTGJnRmtzaElyVVBjdUN6NU5pN1RmOVozZTlobi9ubEhDSzBrMmRL?=
 =?utf-8?B?NWtGUVcrQzZ3cGlaeWpwaW5DUTRndzF4MnBwVXg0RWN2Nis3SmRweXpzam5x?=
 =?utf-8?B?WXBkY3N6emVSeDNvMFFXKzZvMFMyQ0RyUWwxanJ6ZlNZblRKRFBQeVdtTDNO?=
 =?utf-8?B?VVFxSEVBRzlnQTFDdk9FL2w3K2w0VE1sU09HdXV3SnlmdmdONm9YREJiQ016?=
 =?utf-8?B?UHBvaG9MTXdNVTN5U1Z6bnZqbHYrSFlFakYrc1VvdmsyaWlLeVI5QmgwQUQ4?=
 =?utf-8?B?Q1ZtTncrMFlnTmJYV1E4ZUgxV0VpV1g5K3BCWXMrWE1ITWtqWUlOdExiaWd2?=
 =?utf-8?B?QmpMMEppSlNSUzRZUXJUdkcvenVGaXlBc3pFQlpKOWtzbENkdWJYbjFhc2dt?=
 =?utf-8?B?Z0VDc05JVkhhYXp6QlY3VzVSS1Q0Y3Mvd0VmSlRCSENtUW8vanF4RzAxWmtk?=
 =?utf-8?B?QUtWOGtEUTdxKzhyYUhMNTNGeit0NHBPcnhlMzlJb3V0Z05GRkNyWXRYWkcv?=
 =?utf-8?Q?BckLu8wRJPCawwpsfC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917b9a19-c65e-4875-9290-08deab544bcb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:46:07.2668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2c/lRDw6OEL3NvHn7vLU1hd8+g9Hkh5b4v80/kJHInqa0CyDSLFv7s9T+gv71go
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832
X-Rspamd-Queue-Id: EA2AE4D8E49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60569-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]

On 5/6/26 10:04, Tvrtko Ursulin wrote:
> 
> On 05/05/2026 12:08, Christian König wrote:
>> Removing the signal on any feature allows to simplfy the dma_fence_array
>> code a lot and saves us from the need to install a callback on all fences
>> at the same time.
>>
>> This results is less memory and CPU overhead.
> 
> Code looks good but I still worry about the new potential for num_fences irq work latencies whereas the existing implementation only has one.
> 
> Also, whether or not current or this implementation uses less or more CPU overhead depends on the signalling pattern (time distribution) of the fences in the array.
> 
> Apart from more latency it could even be more CPU usage in the pathological case.
> 
> It would be less if, when the last fence in the array signals, all others have already signaled. Although it would still need to go through all dma_fence_add_callback() calls so that part is the same as the current implementation. Only the CPU cycles from the signaling side would be saved.
> 
> But in the pathological case, where fences signal one by one from the first to last, and are spaced more in time than a single irq work latency, the new implementation needs more CPU time and more latency.

Mhm, interesting point. I haven't considered that.

As far as I understood it the irq_work runs at the end of the interrupt handling. So when the dma_fence was signaled by an interrupt that is pretty much a no-op.

It only becomes a problem when the fence was signaled by polling, cause then the irq work only runs on the next timer tick if I'm not completely mistaken.

> I do agree it would be nice to be able to drop the callbacks array but for the above reasons I am worried whether it is safe.

The problem is not the memory footprint, but rather that the callbacks array adds work to the interrupt handler of each fence.

That's actually a huge bunch of extra overhead for each driver which could be completely avoid if we install only one callback at a time.

> Some other minor comments below.

Going to adress them.

Thanks,
Christian.

> 
>> v2: fix potential double locking pointed out by Tvrtko
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/dma-buf/dma-fence-array.c | 134 +++++++++++++-----------------
>>   drivers/gpu/drm/xe/xe_vm.c        |   2 +-
>>   include/linux/dma-fence-array.h   |  22 ++---
>>   3 files changed, 66 insertions(+), 92 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
>> index 5e10e8df372f..8b94c6287482 100644
>> --- a/drivers/dma-buf/dma-fence-array.c
>> +++ b/drivers/dma-buf/dma-fence-array.c
>> @@ -42,97 +42,88 @@ static void dma_fence_array_clear_pending_error(struct dma_fence_array *array)
>>       cmpxchg(&array->base.error, PENDING_ERROR, 0);
>>   }
>>   -static void irq_dma_fence_array_work(struct irq_work *wrk)
>> +static void dma_fence_array_cb_func(struct dma_fence *f,
>> +                    struct dma_fence_cb *cb)
>>   {
>> -    struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>> -
>> -    dma_fence_array_clear_pending_error(array);
>> +    struct dma_fence_array *array =
>> +        container_of(cb, struct dma_fence_array, callback);
>>   -    dma_fence_signal(&array->base);
>> -    dma_fence_put(&array->base);
>> +    irq_work_queue(&array->work);
>>   }
>>   -static void dma_fence_array_cb_func(struct dma_fence *f,
>> -                    struct dma_fence_cb *cb)
>> +static bool dma_fence_array_try_add_cb(struct dma_fence_array *array)
>>   {
>> -    struct dma_fence_array_cb *array_cb =
>> -        container_of(cb, struct dma_fence_array_cb, cb);
>> -    struct dma_fence_array *array = array_cb->array;
>> +    while (array->num_pending) {
>> +        struct dma_fence *f = array->fences[array->num_pending - 1];
> 
> Maybe add above this line something like:
> 
> /*
>  * Install callbacks from the reverse so the check in
>  * dma_fence_array_signaled() can be optimized.
>  */
> 
>>   -    dma_fence_array_set_pending_error(array, f->error);
>> +        if (!dma_fence_add_callback(f, &array->callback,
>> +                        dma_fence_array_cb_func))
>> +            return true;
>>   -    if (atomic_dec_and_test(&array->num_pending))
>> -        irq_work_queue(&array->work);
>> -    else
>> +        dma_fence_array_set_pending_error(array, f->error);
>> +        --array->num_pending;
>> +    }
>> +    return false;
>> +}
>> +
>> +static void dma_fence_array_irq_work(struct irq_work *wrk)
>> +{
>> +    struct dma_fence_array *array = container_of(wrk, typeof(*array), work);
>> +
>> +    --array->num_pending;
>> +    if (!dma_fence_array_try_add_cb(array)) {
>> +        dma_fence_signal(&array->base);
>>           dma_fence_put(&array->base);
>> +    }
>>   }
>>     static bool dma_fence_array_enable_signaling(struct dma_fence *fence)
>>   {
>>       struct dma_fence_array *array = to_dma_fence_array(fence);
>> -    struct dma_fence_array_cb *cb = array->callbacks;
>> -    unsigned i;
>>   -    for (i = 0; i < array->num_fences; ++i) {
>> -        cb[i].array = array;
>> +    /*
>> +     * As we may report that the fence is signaled before all
>> +     * callbacks are complete, we need to take an additional
>> +     * reference count on the array so that we do not free it too
>> +     * early. The core fence handling will only hold the reference
>> +     * until we signal the array as complete (but that is now
>> +     * insufficient).
>> +     */
>> +    dma_fence_get(&array->base);
>> +    if (!dma_fence_array_try_add_cb(array)) {
>>           /*
>> -         * As we may report that the fence is signaled before all
>> -         * callbacks are complete, we need to take an additional
>> -         * reference count on the array so that we do not free it too
>> -         * early. The core fence handling will only hold the reference
>> -         * until we signal the array as complete (but that is now
>> -         * insufficient).
>> +         * When all fences are already signaled we can drop the reference again
>> +         * and report to the caller that the array can be signaled as well.
> 
> Optional nit - above two lines end up only lines over 80 in the file.
> 
> Regards,
> 
> Tvrtko
> 
>>            */
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
>> +        dma_fence_put(&array->base);
>> +        return false;
>>       }
>> -
>>       return true;
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
>> @@ -171,15 +162,12 @@ EXPORT_SYMBOL(dma_fence_array_ops);
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
>>   @@ -203,10 +191,13 @@ void dma_fence_array_init(struct dma_fence_array *array,
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
>> @@ -220,11 +211,6 @@ void dma_fence_array_init(struct dma_fence_array *array,
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
>> @@ -265,7 +251,7 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
>>   {
>>       struct dma_fence_array *array;
>>   -    array = dma_fence_array_alloc(num_fences);
>> +    array = dma_fence_array_alloc();
>>       if (!array)
>>           return NULL;
>>   diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 62a87a051be7..8f472911469d 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3370,7 +3370,7 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
>>           goto err_trace;
>>       }
>>   -    cf = dma_fence_array_alloc(n_fence);
>> +    cf = dma_fence_array_alloc();
>>       if (!cf) {
>>           fence = ERR_PTR(-ENOMEM);
>>           goto err_out;
>> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
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


