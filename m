Return-Path: <linux-media+bounces-65877-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xL7ABJoxQmpC1gkAu9opvQ
	(envelope-from <linux-media+bounces-65877-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:49:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D65E6D7AA8
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 10:49:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=bv85y6To;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65877-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65877-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F18C9300E297
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 08:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126993F823F;
	Mon, 29 Jun 2026 08:49:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D72E7378;
	Mon, 29 Jun 2026 08:49:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722963; cv=fail; b=hEqBiflipQWO9007mR6HBOwjJQHPUBxCHMiBKR59TcNXNcnQy93Y29O+C5bCU0jXSOk7207ZXMYBX9kCsdbYivhV1xRi3CUVe73ZOjF8ceP6C+DAXVPGQcdX04loefcCz34nFFC7IH30k6nvuXsFax2Bj2dpz/7qqLNoeT8x1y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722963; c=relaxed/simple;
	bh=3YYtEF5LBUnCk60V77lpGRmcZGJZL7GpXp1zLHYnH1A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iHQx9iGyMxfSMblQXFn/rPlRGUJyYbXXO8p+qaNV+UHbkU3a4Jz+48+dmyU7wJBi/H4t6jEGsjGSGh+v1yy/fpV7H2/jr8hsbW2fx78FLYlOJVRsQDGGgK+ai09+BPkyAVJC5pQ8arrvpvvD0MtSQxmGxx7eRRSrOl+Xk1KiFVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bv85y6To; arc=fail smtp.client-ip=52.101.85.64
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zm+slauHIYbplgJE0cccx1JnSWqbuMGSwYXNOctIRZH82XsNoVKiNnAbOB2b18dovp2niwSl7wQcN15X+/1qHroSAP0GB6iy32e6rXTXKv9LN9j5MG7if+p0lMsPm3QBuNMiEBtnaH/BXrcfSkBIukqZQFS9bnEpV1Aa8h+Ug39gzHmMIni/Xiy3NI2l1P/Ri5P+X1XGiLd09WU72W86AqaGQwei599gE1QzU4LXPRfmQAD7x3q0dUeNIWMxfKk3FVO+MmcKtMJ0iB14SmE9GAZwMVUQbIb1lJW76xsRbdQdbaVOJO9L72kzAsu04j2r9CKLli1g7z5HHrwf37aDLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z44lhA18GGakRfAZgS2pIKDizL/E0yBvjsmTDx1Xrfo=;
 b=rXiqtOb7I62bECRw8tlSsDVWTtfPN6N9Ke0mrPK6rUU9XTkmQtYa1cepEu5E6wy8h02VeJRlymIGbLddaAKrv7T6D5xIoldRud+EkUQOl1+YIgBF7njRKH7n/SmtR8TYa+zz6l8Ko+wAa0/lm7do7II9fMUZxJxmUdg5jjZcEbttlEdNH0+aSN0V8JlDfJDyI9xB214tG/7otWwuJofNbzW36GSSiip9aqTjneYLtIK/qYFiykvUAxai0wDwzpE4yXazJQxezJN0XP/Ylnwx42xXawEPBLO9m8U067MGYBkmM6hNdyeVn2CxThywq1rlwCsKE0lZditI33DYXWBaEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z44lhA18GGakRfAZgS2pIKDizL/E0yBvjsmTDx1Xrfo=;
 b=bv85y6ToTNUEwyOBY3gBHYBAFoIG2bwBk7+ICGTq1wFGFu+j9u12bidFWV5tFbYUfYJm96g2W9Ate0u71MZ9VKaRixfwQMr4LCaUiy5/3K5uNp41iwxFWgCaESK+dWE7bAF3kBzb3DDdCI+5IrvUVG1QIJJimDP3bvCzNhTD+9c=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 08:49:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 08:49:19 +0000
Message-ID: <688077c3-903d-4cf5-837f-40621175cb30@amd.com>
Date: Mon, 29 Jun 2026 10:49:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dma-buf: dma-fence: Fix potential NULL pointer
 dereference
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 "Paul E . McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260629075636.2513214-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260629075636.2513214-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: ae42ac82-e3ab-4486-e357-08ded5bb4f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	rdlJj2/kpvHesxtXcDdZ+Orh2hiYk6X3fwG8kHuzhKtz+nSIC5xzBZq1WOaOOxxIRgZT7JgOR+u8/nEF37PBgSxfD4mr3uQiS/D5Us6pCy65+o0gUAVEgsoDTgGAsfUj3NC175uKKBQfHd2zWwUOXjRxx9xzjcvWYx03pix5AkSJIIq8XPYeXIHPs4PjQaT4xLZlM4IRAz/K98ZIs0gH+6Ozt5Gl9wtJOwT+UuN8pmu53kkCZB+N2pn3p9QMAI+XeAnYulAh8OOifU/arrcFe6lAXFb5lH6vDRx7M1UZEd0jwsafjcsf23AfMeTUzg8MBTAyb2mkuPNgL1ENzcWy+u36gFgl7T26jlCQTENg89rwiNWkIfHEwT0cTlYrULZtSEXRRZf6Tv/yQMyJ81rqSFaUiZ4t2z9c62+ieJ3f0pTclLhOhprbXfB9ZXaComLxQNdtSVqYY8tIrdm13zjXKVODN/bzW5z1bci9jGrwc7QQ6y8tzDNY+VS9W/sIIvZUVpkIOB6pqsoDBmjTToCuOJyKxyQA2vRuCcGNe21Nkfuq31HFNs/q5X/TLkjbEK0MBn5LwkvXHqHmAJrwJbdsjs65+cq/usgo364/c0zzSCdTTRkQcEMGuPZyWlHflddqxWXNFpFfYq14rWOVGt7mpHi4p1AOPEX2cAYEOG1UTFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHplTUhkNWhIY3RMQUZBRldQUjRwWTE5YjY4enpjVFlocjJXZDBhU1J3VzM0?=
 =?utf-8?B?ZEN6YzhkMnU4U2hUcjJhakx5L0F5dWprcVo5bFZJZkJDUlU1aHp2SU9PLytH?=
 =?utf-8?B?VUxDSEFxejlrZmVSajZHWlJFVDhpaEJnSUNpY2EvNDE2Nlh4Wk9ZazRCeCtt?=
 =?utf-8?B?bXRUK1hPaXNqUzlHeWVQOFRubGxhNVdHWDhaUWVRMlJYc0lRZnlpNmZMemll?=
 =?utf-8?B?WkJsVld5THRlYkwza0ROVUxxU2dGQkdCaW9GVU82UldkMWFGNDM3aFRVaHdP?=
 =?utf-8?B?RG03bXBVeUIxM2xOYzNIT3A1Sm5FUWVjYTlKRUY2SDNqOFhBV3FkMGFZY04y?=
 =?utf-8?B?QmIwbGZnUUNWMVBVYnEzdUpQRjRyNUYyMU56d1gxWHIzOG51TnBDWlRENG52?=
 =?utf-8?B?TVZPVVhBWFdDb2FJR09YT29ubFVoaDF0QTFIQlFIYzJEMURodHFWZHNyTmt0?=
 =?utf-8?B?TDZoNUxlWGM4UDVzcHJvOFJ0MTJDcy80RXhVc0RER0Z6dmJxMlhRT2x5cG1P?=
 =?utf-8?B?ZjhnTDZKRzdIc1dvYzBSUGxlSzdNMVdJRndyL1lxZkZsZ1U4QmhyR2NUOWJH?=
 =?utf-8?B?UUo2OEdhbE8vaWRWcFdndDRiSHlaZkRSUXptdzRRMlBHV1dGTUhBTCs1OXFE?=
 =?utf-8?B?eC94V3NRTzRsellyQXpvczI3dkhqbllhc0NPeGRIeU1tRmo2RWVSUXlIdjk0?=
 =?utf-8?B?OGZwWmx3bDlmbHBabjhpemM2bU1MYlh5cHhHQTd4ZjVIMHU5UHo2S0UwZ0dD?=
 =?utf-8?B?NDBnaW9HcGowbEoyM08zOEtoYnlKd1ZzUWIzMU84Vy92cmV1cUZhcDhkdXd1?=
 =?utf-8?B?VEtoMGZScFJSK2wrMHlGaHFDc2p4WXFxN3NoMjdFditacVVHU3IxZ1hiZm5a?=
 =?utf-8?B?RnlvWkxNQlYxZHg4UlpUZmJrNTVYR3FMMitiU2NZVlpSc2kxUEl2RzVEekJl?=
 =?utf-8?B?SG8zakh2eENEMjFwa3VhV2NmUTFIeWNFTjBiZkVlRjk3ZWZXb1o0WGl0Z1lZ?=
 =?utf-8?B?L3JOV3I3amlpWDgxMHR0SVRDRm9zTTFrTDI2dmVKOGtWOVF4c3BPR2NaeWdN?=
 =?utf-8?B?OXlMVTlsb0oxczhzUmhYcnhPSlZSamNPWThSMU1rN0pMR2wyemVQdEttK3l2?=
 =?utf-8?B?bzBMQnRVQkN1aU8xNUVJQzJiUTdienBBcmsyQTlyZWNhb21hN1FDKzNXajRo?=
 =?utf-8?B?UWt4NncweEtPa1h0aVRHWnh1QTNSZlFIdlVnTk1wc2NMTUd4cTdpR3d4K2Vz?=
 =?utf-8?B?QVlZT2ZUZFd0eWFGREtsZWJIOHhYYTRCWGIzNWlPSU1yNjV4OHlRUVgyOStJ?=
 =?utf-8?B?c0RvVVgzcWpHMld1RTU0dEE1a3NaWmpESHlZbkF0eEJneVlrQjNNcFBNQk1t?=
 =?utf-8?B?ZXJzSkJ1Vko4c1h5eFNIN1RKajJPaGdEd1ZyLzJDLzdjSzlvQVVaemdBSmE0?=
 =?utf-8?B?amRtV2l4dzVDWXMyWXg2VVAveXk2cGxVZ1JZRlVYRXVLTU5PSWZ5WFljNHNM?=
 =?utf-8?B?T3RJYk9ucFN4VVhObXg4Tlh0TUdsRnZwVDZ3VzFWSHYxS2xJZGRlY2x5NWtJ?=
 =?utf-8?B?TDBOMW4yT2JDTmtZMXhTclhQR0JTbEhJeG05bjhhMmxVcGlNampNTkRSWkxw?=
 =?utf-8?B?eXZkY2VkNjhTeHozRHJVc0UvcU0rZ3A1TldlbStCR1hpcVgrQStXQkhjZm5V?=
 =?utf-8?B?czVxelZvSitCWitscWZBVUc3bEMzdktyZVgwZjhHdWVTYnQxNEdFMVI1S0oz?=
 =?utf-8?B?cHpsVjBVWk1TdTlER3RkYm1MUDREcDJhN28vZkVVTEIzK1h4NlJTMlY1NjJj?=
 =?utf-8?B?K3N4WERrdTZ0RlRKUXh3Y3dRaERDaG9EUVoyZGtvOCtnWGgyWnk4TTFobkhi?=
 =?utf-8?B?bzNIUVg2MFpKVjF1YjZNTHlqTnQ3bGpxczdkVXh6QnFEeGVHNFJlcHpqQlJK?=
 =?utf-8?B?NEtQSVFoWlhzRUJPQjl5bHNyNVZrTlhMYTRrVG52Q0pVVUN3YzdxRG5GRTNn?=
 =?utf-8?B?UlhVa0ZGSENwMERuMkVBVE9FQ2ZWcFF0Q1JsZmx2OFAxTEZRSHl1clFVUkFO?=
 =?utf-8?B?ajIxTjV6b3B1aUtIUUtpZ2tBaDBwZnRFMkFWZG5XNVlqRDFVUEFyb09yZXNH?=
 =?utf-8?B?UFR1aCt2VUF2M1RCNWNZS2ZKcEpWSDRUb0hRRWtaVjVKWXhPZVJMRENhQkt5?=
 =?utf-8?B?SUxhNWZrT1hQK0QwVE53bmdPSk9wN3JCZ1hHVE1xKzBwMXJvUW1nSFZScERI?=
 =?utf-8?B?bUVLbWl2WVIwMFpGRkJnYWFqaytMUWN6dXhoNUJoc0ZrK1ZRRm9XTFNSaThS?=
 =?utf-8?Q?tPWXkMNtxurq/xLTKZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae42ac82-e3ab-4486-e357-08ded5bb4f0f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 08:49:19.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QaG61w76Haeki+EFkYCM1nbJZ3A4oGeBYhQHC1ZW7BMIciLBnM/kNKlq5RGfJQQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65877-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:tvrtko.ursulin@igalia.com,m:andre.draszik@linaro.org,m:dakr@kernel.org,m:gary@garyguo.net,m:paulmck@kernel.org,m:boqun@kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D65E6D7AA8

On 6/29/26 09:56, Philipp Stanner wrote:
> The commit mentioned in the fixes tag below introduced a mechanism
> through which fence producers can fully decouple from fence consumers.
> This, desirable, mechanism is based on the fence's signaled-bit as the
> "decoupling point".
> 
> A sophisticated interaction between RCU and atomic instructions attempts
> to ensure that fence consumers can still interact with fence producers
> through the dma_fence_ops (callback pointers into the producer).
> 
> This is the desired behavior: to check for decoupling, the signaled-bit
> is first checked. If it's not yet signaled, RCU ensures that the ops
> pointer cannot yet be NULL.
> 
> Hereby, dma_fence_signal_timestamp_locked() first sets the signaled-bit,
> and then sets the ops pointer to NULL. Readers first load the ops
> pointer, and then check through the signaled-bit whether the pointer can
> legally be accessed.
> 
> These set and load operations could occur out of order on weakly ordered
> platforms. This problem can be solved very elegantly by using the ops
> pointer itself as the synchronization point. The pointer is either NULL,
> or cannot become NULL while it is being used thanks to RCU.
> 
> Replace the signaled-bit check in dma_fence_timeline_name() and
> dma_fence_driver_name().
> 
> Cc: stable@vger.kernel.org
> Fixes: f4cc3ab824d6 ("dma-buf: protected fence ops by RCU v8")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Changes since v1:
>   - Use ops pointer instead of memory barriers. (Christian)
>   - Rephrase commit message.
> ---
>  drivers/dma-buf/dma-fence.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index c7ea1e75d38a..0a025dfdf131 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1170,7 +1170,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>  
>  	/* RCU protection is required for safe access to returned string */
>  	ops = rcu_dereference(fence->ops);
> -	if (!dma_fence_test_signaled_flag(fence))
> +	if (ops)
>  		return (const char __rcu *)ops->get_driver_name(fence);
>  	else
>  		return (const char __rcu *)"detached-driver";
> @@ -1203,7 +1203,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>  
>  	/* RCU protection is required for safe access to returned string */
>  	ops = rcu_dereference(fence->ops);
> -	if (!dma_fence_test_signaled_flag(fence))
> +	if (ops)
>  		return (const char __rcu *)ops->get_driver_name(fence);
>  	else
>  		return (const char __rcu *)"signaled-timeline";
> 
> base-commit: cdeb2ccd993ed8647adbbda2c3b103aa717fd6f7


