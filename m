Return-Path: <linux-media+bounces-66050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+1sM2x+Q2o8ZQoAu9opvQ
	(envelope-from <linux-media+bounces-66050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:29:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C676E1A94
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:29:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=yQxkijbU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66050-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66050-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DD5C3040FBC
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 08:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C49F3B4EA2;
	Tue, 30 Jun 2026 08:29:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010015.outbound.protection.outlook.com [52.101.46.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6AA3932C0;
	Tue, 30 Jun 2026 08:29:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808155; cv=fail; b=Dn6Z4LXsphtJ6XuVr4nPQ9h2nABS2ry2krGn19uIhJHfsxzY/mg26RNZa+DAzmOxVXvBffTbRTA62f+Wz3rMaYG2//26Sjp1k+yATUqhoUKXN1uERA1uG5k5nn04oXq4IQH+Z4xICGLRo/Ds2/Yd+2W4vJpJoFk+UVnbLByteiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808155; c=relaxed/simple;
	bh=aIe46fIChmURk9GlmPzbfgmgwyhWE2ETZwdWKsfoZ7E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YvD7eArp4BsDQbHFvvRdTJ+mHrSwdNxa6YXyeYhhSfGRWt2E5MPYurj2PVLBuqCiyAoYKr/rJqnV94brgZC0qwkdX6vae1Sn99o3SuE1PdUipFHaTsx+I0KhHz6h2NBhTLpPhZ/5L9tbpyqSb2A2Sv+WyFcnnxlxt4u081kCnz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yQxkijbU; arc=fail smtp.client-ip=52.101.46.15
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0Cb4afXEQellDsTOLMNwpkqWK9y9vmBy573zoKWfwjeL/hy2mZkqWKPcKe9Ud0GLIQ11x9a24jaQjEdhzQu7fsGVQLXjyf7kRCXeL2yZVvqfdgFWDRYx5tuj48osfk0gh4sh9gU1AzydDQ/bNzrrq22UQrkADSyUpP1MpGF/fUguhoOZBp9PI2eI+EGcfV9zOI8piKM6M5Dgli2BETgApxO3LqTWT5oZ2W4Bhw1CUesufC/Od35VJph1v4mHZ69Ovrm2rSfVahQlF+umzeA7tfgpKJgdurjoxRtPPK33isbsT7sX+xakksceAz8Dwi81Zhsc8jsI/tMo4fU7xKNrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9Hl4+nU1qMdgMJMkvS2tCJNlK2D9wEoft1eNLD/v9E=;
 b=P5xGISLqKkXE+y9CrgpPpu+q0rWIOmk+I6f+Jr8HTwqYEoNzFYL/ph9GR4rJYpVmsJ5zsPhPNHPoRkkF2FcgH5C+cWyxIGR9Gkitj4LyZjNe8NCExOdvGZr1sr0JtQT3DCSo4+C/7yrED00BwwuZP8kRqqjyjkXox0sWxRubPxd45SGs50RNuokHNZbO3WOX4d7e/EHE96PBTCOLjXKH7y8Et+mypfS8pFaBnSMhk06YY5Kz7qUPfiRkyEQk69q2iiQ33RKCpVRU/WQmzRvbIqqif8aFiZpETZ49PlH8T3hX8yTYk93d2iOxT9Fs7iKI8apZIk36C5BwVi1ODnNHPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9Hl4+nU1qMdgMJMkvS2tCJNlK2D9wEoft1eNLD/v9E=;
 b=yQxkijbUea8rnXpG9/XciOHken/yzoSA//W35PgwnxTPX9VfxOlir6L+7kG2F0t9zkm64BHJ4a1vjqKKOui3JAMFpEyg1XfyEWRhBWf5GIYnWWgVXN3m0YYdifvu0xh+j7u15qHcUqWLr1uSgXBNz0LBv/T+voB1WqU9firTzVg=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB6015.namprd12.prod.outlook.com (2603:10b6:408:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 08:29:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 08:29:10 +0000
Message-ID: <0a02f85f-088c-4479-9e58-3b564931bfd6@amd.com>
Date: Tue, 30 Jun 2026 10:29:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/test: add KUnit case for dma_fence_dedup_array()
 empty input
To: Baineng Shou <shoubaineng@gmail.com>, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 phasta@kernel.org, tursulin@ursulin.net, akash.goel@arm.com
References: <20260630060436.1527498-1-shoubaineng@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260630060436.1527498-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: aafadf8f-df87-4ae8-4b9d-08ded681a886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	oiwInPi8DM24mnPM0qGkDU4t/43z3+lbP2ay5y+YauQee+LEyCzjcaVNtfGaTwpOefDCQdRRZsaSB3wZ70AcZZ0VFPr3r981YunycVHkDzoAQSlNUXhPGvv7dsIH/hMJITft2tWOQxr9ur55WcNo/bi3H/cys+E8SfFl0QSQbfqkl8ImgCCQ2800JReyJGISebGCTybTlp34yCQDjP2QGfQ8G6m3oMh0Z0Bjk3rfQO5B83lBpKe8wS3UTvtkHCC6NStMd6Qof5XrCkyJ7K3kIZ1Atf04mgTIoFVGOSoF2I4uhSH6keawElDtITzXjOddSreSj1AYnxPIbS+cWgg7QaduMzm+UoPNNwvNcL+NP03V4eXRRF0VZYAFBrq49D1N1MuwloJI2KDbl39UfC6wLiz81uvzrGqurzyAzHzS2gCXwQXnslXJ2hbYx+sOyuWtQuI7EvRGFN45kezQQmimcw2VPQ8WYMpMEhIAxexNU5iXtppnKOXneYEn5erAiLdMYy26yrjoJzv1rQCQkEpGBBaicDfgfnTgBlkL2vE5RarB/uZwAyGffojKzF0qgYna2TDbLS0+Z8HJM6XSte6SAbOlj7P+6+kiPWRw8M9aCwqsnLR4d84zUfIfYmJphCLXnC8W8u5BoDu0HJE1hsaj5xexk9smYYguu5ga9YpROx4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjhzckJYYWw4T3JLZnhZMnQycldtaFVqUDJ3MnhEMXorK01aNnFRczRnSVpt?=
 =?utf-8?B?c2Q1VWdLdmRDeEI1U3RGY1Q0cng1QnZTT2pGWC9oZXowRGtqd043eTFFRWVC?=
 =?utf-8?B?VklWcVlxODJUZy9MTnVKWmhycVdXQ25XcDJIaHVLalZaSmVjL2FINzdMdWVp?=
 =?utf-8?B?WGNqR0UxQU5ieDhETlJteThKdUN2TkVzU3JvY3F3cjM0ZEF4L1Q4eWMrQ3Z6?=
 =?utf-8?B?anE0MnlvQjBsK0xLa0ZMLytkWlpDUWtaQ1FBTm4yc1JURDlKYVlZKzcvRHkx?=
 =?utf-8?B?TThSREp5MmUzTzlUSWtoUDh4V0tsOVVGTTVOV1dGNk9GalFRYzVDUUdhRnVU?=
 =?utf-8?B?WjFKSEY5NlE1ZnVCRmpYeGt5NFR3N3NUSzJ6bFpWMllRR0IrME82aFdpNXZM?=
 =?utf-8?B?REtCVUI0bzBEVEVmS0JoZ2N0Mkw1eUZYUlh6TDZ0U0hXNWRNZXcwM0lOdG9r?=
 =?utf-8?B?a1lqaHpyb3owcjUzM3F5djJ6T3BHdkVIMlNKb1FtV2ZrRjhrZ2ZxV0YzeUxq?=
 =?utf-8?B?aDRSRk9vZzdteXdCYm1QY3ZoMXBPbkdIYmpqTzk2dkNEa25JWGpITDB1Q25a?=
 =?utf-8?B?cFczcTFSalRYREpmRjVFUThIZGk0S2pKNmlXM09BUTlyNDJ6d0duM0UxanNp?=
 =?utf-8?B?Q3pUaTRaaUVIMjdtYWRheDJ3M2FCRmZGZmlacWNXaTJYbThOSkRYWndKMmly?=
 =?utf-8?B?NVAwNXd1SkZnYmFjL2hDWVQvRUNHYU52Mm0rTlRSdnBHa3g2SWVsaUt6SWdV?=
 =?utf-8?B?RHhBMktGMjk3VjZyNksvOTZ2ZG1NTVBReFY0U050akt6NG1WSTBEWEZCenNv?=
 =?utf-8?B?MHBrejRVTGNDT3RBOTIvcGF5WGl2WGZ2RXdTb1M1YTJaYVo5U2owdkRFaTdz?=
 =?utf-8?B?ZUJrZ1JLYlQ1ZnhMQVJWWFBrMG1tUHhobHFaeURSRWRoeDRiTXBQU1FvcFZO?=
 =?utf-8?B?a0kxNXB1Y1R5OVluaklpaFhUL0FIS3ByZkJsR2ZIZmVJVUVQN3pCMXFoaGo4?=
 =?utf-8?B?aWJmTUlTQk1HdWxoMXJSa3h4aEFVSklIU1ZjYmZ6L08rSFByZjA0d2RpYnhR?=
 =?utf-8?B?NmZEbVdiWVNWOHJUK0R2UFNDS0l6QmR1elBNOHBVaXN3N0E1VFpuc1RuVXBT?=
 =?utf-8?B?OGVNbjJaRW54WlhOTjNJOStKeTY0Rk1RYm5EKzB4cVFsOEhJZmpuT1JHeHhj?=
 =?utf-8?B?NEF1NW1zOExOU3huY3hPM3VjTlBjcEFORnlKcmNBYnEveE9Ua2cwWkplaHR1?=
 =?utf-8?B?bUxKdlpDTUk2a0pzVWw4aDlyRVdsZXJDa0FtMFZaRDVBQnZGSlhTc3ByeXdB?=
 =?utf-8?B?bldyeGtLZllMOHJWRXpTTXEzTDd4Z0dHNnEyVWZSelNOS2JPWTFQWDRIVWdr?=
 =?utf-8?B?ZWhZWE1ubjNZdmhKY0VIa2J6S0IxeCtxQURtUEpFUHFaOUNkdk54RVhkZWFk?=
 =?utf-8?B?dDBOVUVxWGxCVVMrZUt1dkhxR3RMNmlHd3VXbUVVWTlnUXRXY0JjR05lVXNk?=
 =?utf-8?B?RU1UU2xLRDlXSlJ2TFgvUE1NZzhTNG9GdE96VkNKUERsdndCQ09VMmpHR1dM?=
 =?utf-8?B?VE5MMmFxVVlNUzVzN1FXRG5Hc09IbmhIcTdUdUdYTXdiMTBkY1FJeXhCUHA0?=
 =?utf-8?B?dktON0F5ZlE1Q2tEakVGTUxvNVZHeEpTMXNIYURGWlViR1ZyQTJhS2ZNUllS?=
 =?utf-8?B?UHRSZEltQis2UGF5ZTlIL3lUSDFBdkE2TWszQlp6dGxoT0dOd1IyRWNka2xV?=
 =?utf-8?B?bmxYeWFJaWxTK2JYYy9TQ1dFeGc4VVR1MDVNTVNtRmxIYkhqUXQ3cVFEMG1x?=
 =?utf-8?B?a2lhUXV0NFJOdnN3RWFsSG1STDJTRk9acytFMVpjcFN4dXMyTFlHOGJnTkFm?=
 =?utf-8?B?andrMFhvaW5jV2s4RmRmalBNUVphaUZQVVRDcDVsaEhxWTZKQmRCaEQxRDlS?=
 =?utf-8?B?OFZTakJuWW45NVhUYTZERkl6TmFRWmZ2VnNaSHVmSnlSMTl6NGNENFlqK2V0?=
 =?utf-8?B?a1htS2tsazg5Q0RneldsLzUzREIraGduajB1eGo3OWg1aXpsSXN3K2w0eEQx?=
 =?utf-8?B?NnAxcWt1bG14cGJtQ2ltOExxQ3kwczkzQkpNS3UyNXoyZDFIekgvanVXbGYz?=
 =?utf-8?B?WHkycDN5NHBzUWtSZG1UT3g4aTd4cFo5MFZ4clpyQzRUSXJnN01TZ0x0ckFw?=
 =?utf-8?B?cThCUEJlNUdWQmR1cmYrbVNuMWFRZW9ud1N6WEdvUnhDSEtYOUlnNDlKdm1T?=
 =?utf-8?B?OGRjWGZsQ0pUSEVPcW41Q2ExMVhIWTViSnlGaUkrQXZwbHJQWnI2d1hJMk9j?=
 =?utf-8?Q?wC9iASiJBISNDxcWhZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aafadf8f-df87-4ae8-4b9d-08ded681a886
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:29:10.2697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDlKV9s51psxH7MVxldz3FOCOO+7Gt4m/ts3Z2YDmgr8zs8XFueBMchb2jiLbZXk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66050-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:phasta@kernel.org,m:tursulin@ursulin.net,m:akash.goel@arm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28C676E1A94

On 6/30/26 08:04, Baineng Shou wrote:
> Add a KUnit case verifying that dma_fence_dedup_array() returns 0,
> not 1, when called with num_fences == 0. This locks down the
> contract documented in the kernel-doc and prevents a regression
> of commit 77a9298741f8 ("dma-fence: Make dma_fence_dedup_array()
> robust against 0-count input").
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push this to drm-misc-next later today. I also pinged our intern to write a cleanup patch whic consistently use size_t for the number of array elements in the code.

Thanks,
Christian.

> ---
>  drivers/dma-buf/st-dma-fence-unwrap.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
> index 4e7ee25372ba..72dea6091d58 100644
> --- a/drivers/dma-buf/st-dma-fence-unwrap.c
> +++ b/drivers/dma-buf/st-dma-fence-unwrap.c
> @@ -370,6 +370,15 @@ static void test_unwrap_merge_seqno(struct kunit *test)
>  	dma_fence_put(f1);
>  }
>  
> +static void test_dedup_empty(struct kunit *test)
> +{
> +	struct dma_fence *fence[1] = { NULL };
> +	int ret;
> +
> +	ret = dma_fence_dedup_array(fence, 0);
> +	KUNIT_EXPECT_EQ(test, ret, 0);
> +}
> +
>  static void test_unwrap_merge_order(struct kunit *test)
>  {
>  	struct dma_fence *fence, *f1, *f2, *a1, *a2, *c1, *c2;
> @@ -595,6 +604,7 @@ static struct kunit_case dma_fence_unwrap_cases[] = {
>  	KUNIT_CASE(test_unwrap_merge_order),
>  	KUNIT_CASE(test_unwrap_merge_complex),
>  	KUNIT_CASE(test_unwrap_merge_complex_seqno),
> +	KUNIT_CASE(test_dedup_empty),
>  	{}
>  };
>  


