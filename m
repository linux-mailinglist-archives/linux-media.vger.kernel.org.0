Return-Path: <linux-media+bounces-59285-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBdBL1106GlCKgIAu9opvQ
	(envelope-from <linux-media+bounces-59285-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:10:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6097C442C96
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 09:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4322A301BA77
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 07:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9900D36BCCA;
	Wed, 22 Apr 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OL7lp+xI"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3DA36923B;
	Wed, 22 Apr 2026 07:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776841815; cv=fail; b=q8A1B1bJH/2Kc5hq/sWcptaE+/ABfjRenYEr+8gFzzn/DpycsO0ubbkafEtn756Fn8G9rvxXLj2bTQQWoB1NRKFWUo9zEAxb66ysDqLdynKrK6xc1VFY3aAsbsvmLYqTV/xCiSCwAZNNNYZ977yAJM/dbHHRPRmlMFADVA4ySK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776841815; c=relaxed/simple;
	bh=S64FM5qeK3u84bB20KTC2XndrZeSh2tY802xf+t60tU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BsxE85+Q04jb1kdzgjz6kZNAvZvjrVwqU0vVMHwPOI/R0iBOzGpr6aOeeU6aSlZhkcqxwDpb+0Z+HufTZNyZF9GLC3IdffJsA9ivhNZJ979LowLaV7HA5x6fF5VZN5L+9XcvjhTsz5TFawQ+mfSXPRs4X4z8Jiy2wFq7LgPC1y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OL7lp+xI; arc=fail smtp.client-ip=40.107.208.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dthVVIERdlj1mFuE7Y/zMhw5JoLjOEDcdaYejbWtBHhyXKxQJDDzlP1DJq4P9liOW//tqH1HD++XpR/eJyrhxHutDzUpbETfOgeaC9T+bPquIS6HW0Zj5TMN6dqf3p3x9thB6PyjjgJcEDoVidGTqNPNLBSkmjXIKDEU9rWQhcdntYffiD3moiefYiJyyE7MguQ0PeqEU2CJ0ubMEL4Maq7awOEm+v2c7vbTcu4OLLok+USydcjGU+IAVWKIX2QOY/8q7aGa7bLqotkXgyS6Scl7edlDrbr8eUyXTApYsSaTp0j1+umTx3UOf+gnkLcTzSVEhdVEInar3rH9Z2OqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1g4Ec19MTbsH0oDk7b4Z1+P9GZg8iPha3ZsaOisTSz4=;
 b=fiSeUrrvf/GiCB7VFqR/BWt2tolvAPdOO35hUgaOCVMqJjs5aQDUkWbVJZdq1mqmoP40r4vOs987oMFUiZtcU5azGAzkZuo6LdRmoUzwDO+w4flJgInyewRqtcyr99bcQo+Dj0UMxARhjuNv0UIMuRbxFeH1Xi2/kFDp9ABAmTMNCN8dzw4kAsBvmE1ddkD/6JU1qBuqc38nIn1MLeqCwjep1w+mYxM7zR/rikN4nxbEH6/y87yi/hAueHdRr+50P3luxts/motpWXiaB1LeWBAAJL9aBv24AameK2FaMvewHfIFz4gvMUk/vKp22kqdk9QnVW3L7ukWQz9sW51slA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1g4Ec19MTbsH0oDk7b4Z1+P9GZg8iPha3ZsaOisTSz4=;
 b=OL7lp+xIOSvAL7lL1ttATmtvS66gbdxT1UFpjIatgmj9Kek9j2+g3XAa92/B80zho9tDGSXqUidsg09vrA3VoUV1ZAy1Uyac1RYDydgPeTInqcDYRV5gIHj5boq7PFh5K+88NlNanLvrNM4L3Z4GK26t9Bw0PBIDlpP66KTR9bo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7682.namprd12.prod.outlook.com (2603:10b6:930:85::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 07:10:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 07:10:10 +0000
Message-ID: <9034246e-3971-4fad-94b7-80f4ad0e29db@amd.com>
Date: Wed, 22 Apr 2026 09:10:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: system_heap: Optimize sg_table-to-pages
 conversion in vmap
To: Barry Song <baohua@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Xueyuan Chen <Xueyuan.chen21@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>
References: <20260406214938.24142-1-baohua@kernel.org>
 <a6d1c89a-3c71-4e06-adcb-56595071dcc2@amd.com>
 <CAGsJ_4xquCzQLbvpkC8arAN=9KhrAkdPdxnB=v85GvvQu23Xyg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAGsJ_4xquCzQLbvpkC8arAN=9KhrAkdPdxnB=v85GvvQu23Xyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 7689d6db-51ea-4d19-b5c9-08dea03e30b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	f9uQLdc8vu5UxmNPBWeNu8ORlTbDvV7qYkWz7YDMq7agJQLJnKMxK0YEhkxZMptMFmeEHD/XS2MqsDEzfBDpWJudTzKt9Oofye8vifAfZXBH8AlVObMubLNfsLqpvw9ITv52cdZ+NYWfnN5CHfQKepUJrWnMCWd8b24UHjNcCpLNK6WMcn4DDAr1+HIy4YsKvM4HeltUt7KF/FAu0hNhMr41l0GiOn3pjeZVZnFcDOdVP91/ATa12kebRGcKm2sdfxtJZu9AxZ/YOXDS8csY+HobH3CKMpIURJq5g3NgPmYs3u3U3tKNjm4VRJ2nxI30iuVD8GrqM8he6+WfR5Amv4mziRbQb2474VmWaXF7MR9LPIdv5EirGC03p7YS2Mi5eBlmUoNR/CFfDUQu9sUvUSRdwUSlTuBF8etwR3xTA3PZIf1+6y1eSvjlI7FHkHs4mypwiQ+rpDVLwnS5nZvsg8+BqdzQIhfuoJCnMQiXmVPA7FaD8jMY3Ji0AxCPQWTajUaot/Tt3GOBfPwQ5zGU2jh+giVYOgmzUELcDBFaoNQGXeFaFw8vtzhb3qW2tMFC/hQgCb0p4eDrb9+MGneeIhMhGHvy8FJZ/ZupX+85c3dFo9Wg7C4ylNNE94S+5VjLfg6OJg3er0XalvLm45HK/1CtHrygouK6OzTeI4ezXOWOoC9tXTI/PkjwIS9LpR4IpCrGSaoKbW4v2vVyvfpmXy2xIA5LhskNI8EHLtmlW+U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEpCaWV6TGRKQlQwSGc1bnpiWERpSm9EbkRhSzdlOXRubzc5UTM5dTQxS2dI?=
 =?utf-8?B?VXBRbHJ2SEIxS0FUWkM1MXdyaXlnRXgvcFE2S1Vqc1BDL1hXeFNaanZvMkc1?=
 =?utf-8?B?T3pmWlZMTGdYcXZmMTVIemh6MXA5WlNlTzFXTkFBZWIzTWVCVkNPdThqc2JX?=
 =?utf-8?B?eWlUTUFHTE9jYkFlM0YyUHBJWWE3T1RsYWVaZk9Hc01LUWhWMEkwUWdVT1Zs?=
 =?utf-8?B?MDdHQlZVcXAyYm1hM09jeCt4dU9SMWZBOHdjeXoxMzhTRHR6L0c4QlFNRGI5?=
 =?utf-8?B?VXNjRW9mcnZFNWJyeFN0Mm9jbmI0OUdwZUtiQ2xhZXVkaklHek1ZQTg5WUZi?=
 =?utf-8?B?R0w3MW5XY294cXRvY3k4QjZCMlVXWW5aUDEyd3RJcXdvQ284WStnV0pxcThD?=
 =?utf-8?B?a3AzUUxodnFSR3JTZXFpVjBmTjkxOWVtRi9jQkpXVDRPZXV4ZDJjbVdEOTF6?=
 =?utf-8?B?bVVYa2hxQWo0UktzYjRLVnkyL2xzOEUxc3FSQTA0VmIzalFWYmlMUnpxT3JL?=
 =?utf-8?B?YTJGNmVTUXl1NzhUSkJYcVd5QWdQK09yNXFnZXVqZU1FaU1ObWE4cnI3WkJ1?=
 =?utf-8?B?TFlwT0pFbFI4akVYcURFaVNYY3lscXptTFNEWnZVeXZTUzMxWmZqdXVtdDZm?=
 =?utf-8?B?VXlIUW1kR2NjYWIvaUNOZnR4WndzV01IMWFNcHVidlhiVkRPeDNxaWhRbkpE?=
 =?utf-8?B?S1RxV1FSV3Y3d0crMTY5Z3ZReURzeVlvSmdaRWtqNFVObDNYTlRrcjhWK2U3?=
 =?utf-8?B?dWt4c2ZGVkpoNStUTE9tcHJKaUEwQUZhU0p6V0lkRk9RcURWTEZSR2NGZEJl?=
 =?utf-8?B?RFFFbzhJb21JeHJlSlRwVjgvVnBUdENtS0FsYjBWTk4zQ0lKOC9SZlczRDZE?=
 =?utf-8?B?OHU4ckdRSTkwMkRJSzdrc1ZNUVNXMmFxYmVSU2IyUjFWVEtCSGJTdG9yS0h3?=
 =?utf-8?B?cTNkOXVQcFcxTWViMlI4MEROd3o3WTMxWWd3WkxVQjNIWUI2ayttOURwQzZr?=
 =?utf-8?B?TTNQUjBPZHY3dVNqeThrTnZxTlRCeWQrTUsza1FVZjQybi9KT0dBL2JDSHha?=
 =?utf-8?B?dVRXbFF6cU1qOFU1UStnZTVDNEtsdTNvaDBDeVFzNWpHdG5HUjJZMzMyRmI5?=
 =?utf-8?B?TVNGOEJFWCtPeHZpZWxjY3dRZFJLcWdQZDFDUVdoSlBVQ3JBR0FMU2VQQVAr?=
 =?utf-8?B?bFpjR0J5c2xqVjNQVXlxVTJPZ1lyaFQ5SG5Pb1hmS2J3WWl1QkhwZ3h0V0tS?=
 =?utf-8?B?dVRSREJna3pUOUpqMTFPczcyNEFjdjQ3bU9RYnpoSjNZYnlTbWZ0ZjdvbVh5?=
 =?utf-8?B?TE41RUhjUzNlUGxFVGNPZ0R0ZGlyV0F1QUNxb1JnZFF6SWk1aHBZa09kaWNr?=
 =?utf-8?B?WU9yZGRzc1BpRVZZR0l5Q2NRK2tDUGVPeFJMYjZrYXRSeHY0QkRpNS9JYzNO?=
 =?utf-8?B?VWJUaXEzenZRVk5KZEpBenJTQVkvREYybE5YUC9PNjBlVHYyMitweWdWZzlP?=
 =?utf-8?B?TzlGZExKNG42UnR2ZnZZY0h5bFhhZXpEeGJaMWV1alhrTjNaODRuUlNvcC9v?=
 =?utf-8?B?MFRvdG12TWFNZG1ISGlpTmI4dVpGblNiN2E3SVlWOVVFYXJCQW9GM2t3MjhT?=
 =?utf-8?B?eTViOXg1ZVJDTzlweFk1c1crQ0oyU0lkSmoveVFMek9QTDdkRWxVNURCTEl3?=
 =?utf-8?B?Y1hUd3dQNDlHZmdqL0J6Smp6WGJrb1NBdTFRT213NnlEaVlEUncvRnpNRE5t?=
 =?utf-8?B?bVBxQ2VlZEpiTlZQSzdpalBBK2ZWZmNUNWJ2cUx6R0xzV3ZPUGZVcU9DZm52?=
 =?utf-8?B?U01Jd1Qva1RLRDg3RGFCaVpTZVdxK2U3WllHL011blo4ZjVOOUo2THRtN2pk?=
 =?utf-8?B?TkRKbVBNNE9Ya2piRWt2WEhuajdHaDNZUTRwOE1zazJtNlVLWW1XTGwycXND?=
 =?utf-8?B?QzN5V1QyMTZxU1U4S1p3UGlVU1NvZzhzK3gwWnZIVG9FVndLUDNVekwvR0ls?=
 =?utf-8?B?U0VrWmM3Sm5vY1A2TDc2cDdVUUxhZWtjMlJCSkpEc2xRSWNia0pmb1ozdThu?=
 =?utf-8?B?LzNRVTBJd3kxVkx2WDhXTEFiN0M5elVlM3hkd1hiZEZEZ2ZlNmpOOC9TQ2xp?=
 =?utf-8?B?NDNGY3RGT1pxTThUU0F3M0NTaXM1NmJuQ1ErQU5sYU1KM1lDUjVXRHBtT0Rs?=
 =?utf-8?B?QUxOdlFMTnB5N1krbG1wNjdIbzFCMnMyREwzSGJRNFdMYjR0bFQ4am15SENL?=
 =?utf-8?B?VmFRbjFYSXhITFc0cGE4UFN2endzU25yS3dUeXNHekhIY21PdUlhMGZwYTZK?=
 =?utf-8?Q?FYAWNnUP68Jhcg5VQM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7689d6db-51ea-4d19-b5c9-08dea03e30b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 07:10:10.1827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFuI70+QeGW0SdZoFSRKmzVPEBCVBgfjOIdSXisfGsn/TdnVNGNfp/8UQHVqLAU5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7682
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.linaro.org,gmail.com,linaro.org,collabora.com,arm.com,google.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59285-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 6097C442C96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 13:29, Barry Song wrote:
> On Tue, Apr 7, 2026 at 3:58 PM Christian König <christian.koenig@amd.com> wrote:
>>
>> On 4/6/26 23:49, Barry Song (Xiaomi) wrote:
>>> From: Xueyuan Chen <Xueyuan.chen21@gmail.com>
>>>
>>> Replace the heavy for_each_sgtable_page() iterator in system_heap_do_vmap()
>>> with a more efficient nested loop approach.
>>>
>>> Instead of iterating page by page, we now iterate through the scatterlist
>>> entries via for_each_sgtable_sg(). Because pages within a single sg entry
>>> are physically contiguous, we can populate the page array with a in an
>>> inner loop using simple pointer math. This save a lot of time.
>>>
>>> The WARN_ON check is also pulled out of the loop to save branch
>>> instructions.
>>>
>>> Performance results mapping a 2GB buffer on Radxa O6:
>>> - Before: ~1440000 ns
>>> - After:  ~232000 ns
>>> (~84% reduction in iteration time, or ~6.2x faster)
>>
>> Well real question is why do you care about the vmap performance?
>>
>> That should basically only be used for fbdev emulation (except for VMGFX) and we absolutely don't care about performance there.
> 
> I agree that in mainline, dma_buf_vmap is not used very often.
> Here’s what I was able to find:
> 
>   1   1638  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
>              ret = dma_buf_vmap(dmabuf, map);
>    2    376  drivers/gpu/drm/drm_gem_shmem_helper.c
> <<drm_gem_shmem_vmap_locked>>
>              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
>    3     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> <<etnaviv_gem_prime_vmap_impl>>
>              ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
>    4    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
>              ret = dma_buf_vmap(bo->tbo.base.dma_buf, map);
>    5     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
>              ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
> 
> However, in the Android ecosystem, system_heap and similar heaps
> are widely used across camera, NPU, and media drivers. Many of these
> drivers are not in mainline but do use vmap() in real code paths.

Well out of tree drivers are not a justification to make an upstream changes.

Apart from a handful of workarounds which need to CPU access as fallback DMA-buf vmap is only used to provide fb dev emulation.

The vmap interface has already given us quite a headache in the first place and there are a couple of unresolved problems regarding synchronization and coherency. 

When a driver would be pushed upstream which makes so frequent use of the dma_buf_vmap function that it matters for the performance I think there would be push back on that and the driver developer would require a very good explanation why that is necessary.

So for now I have to reject that patch.

Regards,
Christian.

> 
> As I can show you some of them from MTK platforms:
> 
> 1:
> [    6.689849] system_heap_vmap+0x17c/0x254 [system_heap
> 8d35d4ce35bb30d8a623f0b9863998a2528e4175]
> [    6.689859] dma_buf_vmap_unlocked+0xb8/0x130
> [    6.689861] aov_core_init+0x310/0x718 [mtk_aov
> 96e2e5e9457dcdacce3a7629b0600c5dbeca623b]
> [    6.689873] mtk_aov_probe+0x434/0x5b4 [mtk_aov
> 96e2e5e9457dcdacce3a7629b0600c5dbeca623b]
> 
> 2:
> [  116.181643] __vmap_pages_range_noflush+0x7c4/0x814
> [  116.181645] vmap+0xb4/0x148
> [  116.181647] system_heap_vmap+0x17c/0x254 [system_heap
> 8d35d4ce35bb30d8a623f0b9863998a2528e4175]
> [  116.181651] dma_buf_vmap_unlocked+0xb8/0x130
> [  116.181653] mtk_cam_vb2_vaddr+0xa0/0xfc [mtk_cam_isp8s
> 0cf9be6c773a8f14aab9db9ebf53feacb499846a]
> [  116.181682] vb2_plane_vaddr+0x5c/0x78
> [  116.181684] mtk_cam_job_fill_ipi_frame+0xa8c/0x128c [mtk_cam_isp8s
> 0cf9be6c773a8f14aab9db9ebf53feacb499846a]
> 
> 3:
> [  116.306178] __vmap_pages_range_noflush+0x7c4/0x814
> [  116.306183] vmap+0xb4/0x148
> [  116.306187] system_heap_vmap+0x17c/0x254 [system_heap
> 8d35d4ce35bb30d8a623f0b9863998a2528e4175]
> [  116.306209] dma_buf_vmap_unlocked+0xb8/0x130
> [  116.306212] apu_sysmem_alloc+0x168/0x360 [apusys
> 8fb33cbce3b858d651b9da26fc370090a67cfb70]
> [  116.306468] mdw_mem_alloc+0xd8/0x314 [apusys
> 8fb33cbce3b858d651b9da26fc370090a67cfb70]
> [  116.306591] mdw_mem_pool_chunk_add+0x11c/0x400 [apusys
> 8fb33cbce3b858d651b9da26fc370090a67cfb70]
> [  116.306712] mdw_mem_pool_create+0x190/0x2c8 [apusys
> 8fb33cbce3b858d651b9da26fc370090a67cfb70]
> [  116.306833] mdw_drv_open+0x21c/0x47c [apusys
> 8fb33cbce3b858d651b9da26fc370090a67cfb70]
> 
> While we may want to encourage more of these drivers to upstream,
> some aspects are beyond our control (different SoC vendors), but we
> can at least contribute upstream ourselves.
> 
> Best Regards
> Barry


