Return-Path: <linux-media+bounces-56189-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBxzABt2ummTWwIAu9opvQ
	(envelope-from <linux-media+bounces-56189-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:53:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8432B9775
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 10:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5D86306B5AB
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 09:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DE8392C56;
	Wed, 18 Mar 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yecMFh8P"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CF23A7F6C
	for <linux-media@vger.kernel.org>; Wed, 18 Mar 2026 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827418; cv=fail; b=o57lZ+rZkxh8ETUJ9jHYWhQxEwINtF/uycDa0Y0NsQX9VkeRXZpQT/f3iPO5ExNE81CcpvDLxEyS3m8B4fn4BqzPAiIg1jN+smmUm8QCra/FgjmUeQR1ItQZk/gO9soh3fj35ymQTG/HI+0kPVxDsuAVc86rjEBTrIU8u/tgy+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827418; c=relaxed/simple;
	bh=QCLHTozvNkK0mUsc9E/PqO3zCDLwJ2PTe0Wywuqn3ns=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z7cWE9Pqusr6EVnsG/XpTBUcOe27tMMSwMZGaHPECNqrz8cF9Yf3vCLCs1nU2pUXF6IrZFX18Y6xaH45sgiu+iobGcEm/bbHoOHwUdZGMINc3au7d1nFnsKv6sas2tEb8jae0YDLb2iP/SgjJsZVi6amUf4cT0isCbYeYsuR7Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yecMFh8P; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY7KW4zXds2/oHehhvGw0aEENvSbgsJsDw7KJOe4ZmB3i1Ql4RKAYEs2F1bsuQrD4u6S3BlgqHCBYaFZEyV1YK8XRndbA9FyYINjVWYESFfUUnbo/mwKX1ld1YQ4hmjyFTN2+N955gvL6a6qFTk0SzZOnkmAT/mpvXBARtarKE6gvjcq6YIK+iFfRkuZmADyNJqAXSvgg9xSTMYPeKjzYhxfrLSMb5KBHCDs25elbKaJcQI1oGBiKH7b5a0W57q9jSLg1L8oQn5LPU4d9fe3xmX7HVvfJHAqCJ4fv1hiefoITHms+oHWGUBhEYiQnT+VWyPoqXfrXyY9pAdOdiyyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UQMHfF1qr1fmpo4TVDUhf79doYyODqmpZcWfx4YGiI=;
 b=FL1rXXDOqatCkNOku+85s0iKM6yFgZdcMISpBGPvuDEJzgKTsM9VfSp9AUwoUtsHx3Xbo0pZxeGdLF8GGr4NMxLsbpBFv0SnNEtrT4bBhKDr2MfGsHPF1w1WGVcIW873/PV4y7LPvLhipuHKdnSdr57SMGMR9Wwnron82byPRalgVJanGuoofJaY5E2QnvGkm/u6b6w+D/OPathD0RxRuamP1SfxN95jRtOIDcixCj/IutEiBVlSJD4XQe/uG9sIOBGiMnc7Rd2H6/CrTE9YhHEipQn25JAnEyW+h/yR3+ISN5HLXz3B3wpWoOyGpI+d6NFyvlpXK77PQjjnwpCCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UQMHfF1qr1fmpo4TVDUhf79doYyODqmpZcWfx4YGiI=;
 b=yecMFh8P7wUALAdDKEJShSRBLSp/5WvW379UxKVA27tk6AcpIvlU11dmmSvHPOEcPP6S89zCxLMdnVP1k68l1f6Jlv9aW7qxSYHZe4AyKfXjxKl3WNNr0WJebUu5S0fi5d5JU9RsXNPBgIAmw2IRNF9ZlUkvRv/egk9+JQzrtcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Wed, 18 Mar
 2026 09:50:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9723.016; Wed, 18 Mar 2026
 09:50:06 +0000
Message-ID: <5e99db55-51f6-4a3f-92a8-a07cbda37acf@amd.com>
Date: Wed, 18 Mar 2026 10:50:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/dma_fence: be more defensive in dma_fence_release
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@mailbox.org, aliceryhl@google.com, gary@garyguo.net,
 lossin@kernel.org, daniel.almeida@collabora.com, joelagnelf@nvidia.com,
 sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260317144825.2318-1-christian.koenig@amd.com>
 <20260317162147.4a7f03ff@fedora>
 <3e7ce7bb-75ab-4f73-8a5d-dabd5d56cd61@amd.com>
 <20260318101846.4747c9e5@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260318101846.4747c9e5@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2aa565-4be5-42b4-5cdc-08de84d3bc51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	84OenDggnXJasfNKusth6u9OeTJr551pHin6CVsM/Rzlnu210P4h5eC55DPBTPIPEgC0RCRI4eAGX3NTSdVU1C/563N8ePQmQqmDqoJDArYfkRP6Ve9yMVO1f5sbHLkNzqh5+yni5Ocfxt4x+lhFSg5E3GSzteRpILPaKui+RseVlZ14BS+mnExpSFNwmPuJ/3gC7bRaTEuDj0VONmwf3E2v1IbZcHsbj6uEHpYSoG/mfFoOVRuukXjcFb8j1fkouIX541Zj4mJItNpQcNrapvrulZEI0mPk4Sttf8llz3uO47Dlz72mn27Xznd1dryDDrT69ry27mTh0ZyMcAnV8HuJGoQj8+npuJHg1zTfQ3dnJfSmpfiG50N9xHBf4SLxAog/OFmEA4GUyczIS4QnlkR2XI9xqpI/mMgNHf5rHokNkmodubbRUsDNN50eQp1AzljXRxWp/PD3IgoMDdupnfqVJFqx/yTXYY+90VnwMwUtyB3NIkTWBYaEi1U2WHS1+DLC2qod4MyyNtOnHZEFCDtYlp97USYMuRNvE+C0fiPQb4nXFIafmBk1l/k1aMdP/xJakqClZzGIjAmNL/wyqtYmOsPkCPaSmsXQ11oRyRDtR0F0rUcTR79WGH1Q8CU3y8RFrO6/H8403fXzYDpUDni/OPQns/uYInaiNh6KTFuZ9NzzTz1nsQgXDzPzeOtW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWoycXRaWDVyMnl3WmNUVit1ajVqMHNMWXdXbXFOSW9uQ3V1dHNEZVpyWUR4?=
 =?utf-8?B?cjdlaE5YUWU3cCszYXVvNjZKN2poYjQ4dHAwZ2RUMzVobWszckNmS2xuQ2k3?=
 =?utf-8?B?NUU1MGZNenV5am1LT0xGV3IxTWJXTVAvSm1UUVhoSUlhdXhLWW83RXV5ZkFu?=
 =?utf-8?B?WnRqS3lDZ0FYWFZXVEk4NVR5NHBSbUNobjkzQzloeklVZ1hWQVpoT3Q3VnlX?=
 =?utf-8?B?NHFHRVBqVXVqbVJjL3pGb0d6K0VYNzdJNE91bjFJSGU3cTZpa2dHUldNZndC?=
 =?utf-8?B?VFM5V1BjUzcxazNDMGxHeUxhMnM5TXdodFdrb010clJPVElxMXUvNUlnajFl?=
 =?utf-8?B?akwxSE1FckdQc2Q3NGc4elhvZDdSeWtoRTRjbXlJZVJsT2FoZ1dvNXgzQmxC?=
 =?utf-8?B?R2ZybGNzOCszWG9pTm5tM255Q0pZTHE3R1FvWStnRFhETWdZTVV6ditOOWdF?=
 =?utf-8?B?cmlHbGhJeWhOa3d6S2N2aGE1ZW01SnhlZ3k0UzhNK21Id0hvQ2FMbFdFQnVU?=
 =?utf-8?B?SVRWUFFhYXl4WDU5NmV2TlFIU3RpWTE5Nm9FQXhMbUF4L2dRdWcyWEk5bHVj?=
 =?utf-8?B?dTU3eFoybjNDTXB3WEhuQkdqakpBYmFNdkkrUUpwYktXTlFxUC9rL0VCUDdi?=
 =?utf-8?B?cUVwdUFRZjQ4bFZnMU9DaDVLTll0QVRTMGllODduWSt2enNVRVl1NlJGS0hK?=
 =?utf-8?B?QjJ3bjlCang1NU9jclhabWxESlFtbnl2REd6QU0yenc5RU5Vei9TQ3JZa2l4?=
 =?utf-8?B?R1NENGlmTGhwMjBwVE1vTkFmVjM3RVd3YWpXZDc0bElqemhPblVZVzhwUlVj?=
 =?utf-8?B?OTlOcFR6Sm5UMjFyZTdaL0lCMEd4UTRTNTI4eHdLYm40eEFlT1FBZm9LdTgv?=
 =?utf-8?B?YzEwRG04Y3NCdW5oR2tNSUVaRE1rb2hiU3RCNTBTWEd1QnFqTmhOQ1NlYXZV?=
 =?utf-8?B?S3EvRkIzd2hDY3laZEJIU3c2bmozR29RNzMwVWkvUHVxUGNTdVVaVExKd2oy?=
 =?utf-8?B?NnB2NFBRQTZwYWhyYkRUWDUvbEFTajlGc3ZPdzUwNmxMdmZ3R25uS2dwb2hQ?=
 =?utf-8?B?UzlKU1lJbTA5ZUF5TTg2empiUUtrVlBxTFRIeDBNalJnRTY2Z3M1L3EzdXdU?=
 =?utf-8?B?RWZpc2Nta201K3NkcnozVFFkWGdqeDFLZzJwdE9KMERVVUsxeFNqS0ZBV09q?=
 =?utf-8?B?b29IaktOaEV4ZmpWZHNaMjJxclFKc0hLTSs0R1RzdTJ2bXBrOVRld3FRTits?=
 =?utf-8?B?eTl1WmJJcUlmUmc2NW1JQmxaL0k2STY1YWFKRFV3QkJwZzFMRXQ0b05NQnNh?=
 =?utf-8?B?QjVyUlI3RVRCTW1OWFdlYVJ1dSttUW1RL3I3eVhEbFExWEYvLzl4N0llcHZt?=
 =?utf-8?B?WjcxdUJ0aFBtL0lHRFh0ZUdsNnJ6dW95R3oyWllVc05XNHJSeVE4Qlk2UGlP?=
 =?utf-8?B?OGhvZ1gxaHR1VGx1V21wRzJ3aUdUTGZLa0RzcGttbUxpVXQ3UWJQM1VHb1Bn?=
 =?utf-8?B?ZlUzYWxJbG1MWGFlUWRPWmJaVThkcmJjV3NmYURvT0VlckVKRmtJRnliRS84?=
 =?utf-8?B?eFZvZXY5ZzlCMTloSTk0RFl6WTJyRFlpQk8waFpKNXc4YnRDNFliNzV5U0RE?=
 =?utf-8?B?NGo1NE54NWJ6R1drclFYMXlQTzlFZnZBT09ObFJ3ZmRQU0FWcWhTK3ZuczVK?=
 =?utf-8?B?RndLMEVYekZmZ2dJSDF2SGFVWW1LaTlNTjJFNi8rQ1hPbkNrOEZoTXVPaXp2?=
 =?utf-8?B?dmcyRFNKNWlWRGVvNlZaV0F0L1hPN2o2TW84UXNXL1dPSmtlY0VDRHJaMXlE?=
 =?utf-8?B?WlVibHpQbnlkNWV4MFVlSXZ4TWJldFRaOUdrNnVtWVNwM0YzLyt0L3R4WWc0?=
 =?utf-8?B?VDJNRGVHclpYakk1Y0JaV0ZTcjhXdW1jS2pWZEVia1ArQ2owbmlaSlBGTVBj?=
 =?utf-8?B?eWM5T01qR1VUN2k0VEZXUkZNOEU4TDZEK3dubHI5VHYwVWY4dVJXUThQdW52?=
 =?utf-8?B?TURobE9NRkdMYVp3eFBUMi9LdHdWK0pZNFJXWW1MVVcyVXYzckh3STV2Q01u?=
 =?utf-8?B?ZVo5NVJkVWNvdHpucnFsWFV2Z1UvNGZoeWNtZHE3TG1YdVZvMkhzMS9lcEtC?=
 =?utf-8?B?aVJLRUNaVWpFdmFMTXlLY0lEejFNMzlvamNGVk4wR25xanZVQzRITkpxUHl1?=
 =?utf-8?B?OXFVeFN5YWJreEVjempEK0l5ZS9QNU9oamNybnpURnFJUFJIcVdHdGRKMTVq?=
 =?utf-8?B?TExlOS94TGVCYnB6QytmenN1SzgyS1ZWL0prVjZoRTg4eFJSZVdtUXBqM3Ez?=
 =?utf-8?Q?aG/Lhk7xyB1hBArID2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2aa565-4be5-42b4-5cdc-08de84d3bc51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 09:50:06.8232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCWOkbFWK15EsP+QZSqBbeHGtN1bjd9FtRfLxb1qQu6QbgjyCbHn/vUpSn6xDbT/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56189-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,yhbt.net:url]
X-Rspamd-Queue-Id: 6B8432B9775
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Boris,

On 3/18/26 10:18, Boris Brezillon wrote:
> Hi Christian,
> 
> On Wed, 18 Mar 2026 09:21:34 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
>> On 3/17/26 16:21, Boris Brezillon wrote:
>>> On Tue, 17 Mar 2026 15:48:25 +0100
>>> "Christian König" <ckoenig.leichtzumerken@gmail.com> wrote:
>>>   
>>>> In case of a refcounting bug dma_fence_release() can be called
>>>> before the fence was even signaled.
>>>>
>>>> Previously the dma_fence framework then force signaled the fence
>>>> to make sure to unblock waiters, but that can potentially lead to
>>>> random memory corruption when the DMA operation continues. So be
>>>> more defensive here and pick the lesser evil.
>>>>
>>>> Instead of force signaling the fence set an error code on the
>>>> fence, re-initialize the refcount to something large and taint the
>>>> kernel.
>>>>
>>>> This will leak memory and eventually can cause a deadlock when the
>>>> fence is never signaled, but at least we won't run into an use
>>>> after free or random memory corruption.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>  drivers/dma-buf/dma-fence.c | 18 ++++++++++++++----
>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/dma-buf/dma-fence.c
>>>> b/drivers/dma-buf/dma-fence.c index 1826ba73094c..8bf07685a053
>>>> 100644 --- a/drivers/dma-buf/dma-fence.c
>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>> @@ -593,14 +593,24 @@ void dma_fence_release(struct kref *kref)
>>>>  		/*
>>>>  		 * Failed to signal before release, likely a
>>>> refcounting issue. *
>>>> -		 * This should never happen, but if it does make
>>>> sure that we
>>>> -		 * don't leave chains dangling. We set the error
>>>> flag first
>>>> -		 * so that the callbacks know this signal is due
>>>> to an error.
>>>> +		 * This should never happen, but if try to be
>>>> defensive and take
>>>> +		 * the lesser evil. Initialize the refcount to
>>>> something large,
>>>> +		 * but not so large that it can overflow.
>>>> +		 *
>>>> +		 * That will leak memory and could deadlock if
>>>> the fence never
>>>> +		 * signals, but at least it doesn't cause an use
>>>> after free or
>>>> +		 * random memory corruption.
>>>> +		 *
>>>> +		 * Also taint the kernel to note that it is
>>>> rather unreliable to
>>>> +		 * continue.
>>>>  		 */
>>>>  		dma_fence_lock_irqsave(fence, flags);
>>>>  		fence->error = -EDEADLK;
>>>> -		dma_fence_signal_locked(fence);
>>>> +		refcount_set(&fence->refcount.refcount, INT_MAX);
>>>>  
>>>
>>> I'm not convinced this is useful. If we leak the object, no one
>>> should have a ref to release anyway. This does raise a question
>>> though. The case we're trying to protect against is fence_callback
>>> being registered to this fence and waiting for an event to signal
>>> another proxy fence.  
>>
>> Not quite. The real problematic case is that it is necessary to wait
>> for a fence to signal with tons of memory management locks held.
>>
>> So it can be that a simple memory allocation cycles back and depends
>> on the fence to signal.
>>
>>> How can the refcnt drop to zero in that case? Isn't the proxy
>>> supposed to own a ref on the fence. Before we go further, I'd like
>>> to understand what we're trying to do.  
>>
>> Well we are in C here, so its simply coding errors. An unecessary
>> dma_fence_put() in an error path is enough to trigger this.
>>
>>> The original discussion that led you to write this patch was about
>>> detecting when a fence emitter/producer would leave unsignalled
>>> fences behind, and the problem we have is when such unsignalled
>>> fences have observers waiting for a "signalled" event. If the
>>> refcnt drops to zero and the fence is released, we're already
>>> passed that point, unfortunately.  
>>
>> Well that is not quite correct.
>>
>> The most common problem is that we have unbalanced
>> dma_fence_get()/dma_fence_put() and we end up in dma_fence_release()
>> before the issuer of the dma_fence has a chance to signal it.
> 
> Okay, so that's clearly not solving the problem we were discussing on
> [1], I thought it was related.

Yeah, correct. The situation on the Rust side is clearly different, you simply doesn't have incorrect refcounting issues there.

> Also, I'm still skeptical that we should
> try and harden security for a situation that's already covered by
> refcount overflow detection.

Refcount overflow detection is unfortunately not enabled everywhere and even if it is enabled it doesn't protect against such issues here, it only points them out when it is already to late.

> I get why you want to do that, but it
> feels like the wrong tool to me. I mean, we wouldn't even see it as
> an unbalanced dma_fence_get/put() now that you manually set the refcount
> to INT_MAX, which is the bug you're trying to cover for in the first
> place.
> 
>>
>> See the main purpose of DMA fences is to prevent releasing memory
>> back into the core memory management before the DMA operation is
>> completed.
> 
> That's a UAF, just a differnt kind (device UAF instead of CPU UAF).

Yeah agree completely.

The problem is that SW UAF issues are preventable by using something like Rust while HW UAF issues can only be found by an IOMMU and that in turn is disabled more often than not.

Especially GPUs and accelerators usually use pass through mode for IOMMU because of both HW bugs as well as performance overhead.

> Anyway, my point remains, the root of the issue you're covering for is
> a dma_fence UAF (more put()s than get()s, and the CPU still has a ref
> on a released dma_fence object). The outcome of this might be device
> UAF because of the auto-signalling, but that's still just another
> symptom of the dma_fence UAF (with wider consequences, admittedly).
> 
>>
>> So when a DMA fence signals to early it means that the HW is still
>> writing to that memory but we already potentially re-using the memory
>> ending in random memory corruption.
> 
> Yep, I'm well aware of that.
> 
>>
>> UAF issues are harmless compared to that.
> 
> That's not what I'm arguing against. What I'm saying is that you just
> paper over an issue by messing up with the refcount, and now it's hard
> to tell what the root cause is. 

Completely agree as well. It's not a real solution, but only the lesser evil.

Regards,
Christian.

> 
> Regards,
> 
> Boris
> 
> [1]https://yhbt.net/lore/all/8bac1559-e139-4a74-a6e8-c2846093db72@amd.com/


