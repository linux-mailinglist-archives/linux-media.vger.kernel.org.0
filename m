Return-Path: <linux-media+bounces-59346-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PPdISDk6GkHRQIAu9opvQ
	(envelope-from <linux-media+bounces-59346-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 17:07:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08792447AFF
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 17:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA749303A5B8
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 15:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A00132B9A8;
	Wed, 22 Apr 2026 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y/h7lDY8"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012062.outbound.protection.outlook.com [52.101.53.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C193D994
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 15:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776870009; cv=fail; b=DShmaMkcUe/Kn+a2Y0UI2bIJ58o5VAIawI3g3e+TV8Lb2OxYE8mZy3EDgdzo3nJqxCJeJgDzvCllmEZ84FIDhXYAdK7TCbBgvlNSHy+x7cDRJc1E/bLXXWIwUjH6f1sCxAKu/62/yFjVGGZdud9Iwf0o7gs9GeHXWNcN7xfjPCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776870009; c=relaxed/simple;
	bh=LYzuTIhKD5bcoH68pQ9n1TTrKgdMIu2y64Sd7d2puAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GvIaHgWE52vEmFinJmMS7zoblnY37MgjmapoK98rl+NjmjrYV00JymWjh8bWYuAu5eTtAfXqUvojIhvwLIESv83/WWw2z47UyDgUa4Cd8gHeHpVaEDXiEA6G7CusaigcH58xa7PdLrTA+elfs8lYwsV+vCaRk7VxEsXddv4eRNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y/h7lDY8; arc=fail smtp.client-ip=52.101.53.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPQMbuZm05g6mOSzIRXTAfGH3+mmeKPsEqdMjJee6tzFbn48JMdkooAKYMCHWojpaHllT6xCBwCvXkEiP401snO/Bl+BARdM/I8D6EOu0aHP1R76uXMzb+KQao55iR/3jhGGgyCIY1PLh70ERCbkef5PdAvu/+AE6I1p9cI6ZQ/joH3AVVCO2oxYM7YZqA2jbb1sKlhZPAMijKAQD62ox8f/dS3BuhegyRq4Z+G0qZJqiwoDPUvhg75+QZeluCQZXUd0Zcs+IVvVoC7R09uRjHtofEv/FYFPf3Ds9TaYW+GS+3ItMyqdtTrIUldweXDgqjame5YxmgfSA2GoavMZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgJM+r8FUK64NIwaToeS0Jqf6Ffw4GG63eLK/XBmOxE=;
 b=gtOilO05tgFQeSzQWo5vyEyScyf4wjSV0Bf+rqa1ulvcMjLtj8jF3CYQdjoU2pTxumJNc0yr8x3DTLuY0OVeX/KAvs0XXOUlKtKorZ6YAc4o83VPuqSqeX2xnrQIHQb8LBBgHmQPoGBMmMZZ+5Lp6Z0zutVsfF2WRxoY6LJLw1eN1S25dZrET/e6brSdCFCKCzM/f84ZzduKb6CtDRKvy0h7DJj35vPGzG/wanliXAE0KNsOVZH7/XCAzGT7guQ7IUaLXDMTZ6VcaJziWGgj8m4COoQcTZky3feP2ZOFc9FVh9NOBRI4jCgPTM0D6aSdq/h0xZXx69qic45RiTEpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgJM+r8FUK64NIwaToeS0Jqf6Ffw4GG63eLK/XBmOxE=;
 b=Y/h7lDY8X/Ya2G/33EKxl+NQeVTRJw+TC8gaYxonW+wToUPT8VAAxM5J683UrrrIfV+ZbaiL04EpAg91wRNeY0wNGSPpR+g1M+DzCUQppTaj1NNELfEiyGrIQnWq0MKaYQxkLceW3jDp3q87M0gILWcfUDhlHLur+PKLLKiLvRt2gqXFdLszmW/wYGrhBBd3WAKdEuerW4DIUNIEOPBUttMpNzaRMlxgR5z2TIUswQzoQeNk/db+ZJmiNG7gCDJzh19tLLWIToQw2yytNDKFeWSoVbaO5soKH968tP5bEnLM9AyRtIqQsAeTVRapPfDmC9lv0lMybwcawFNBhNFnGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.16; Wed, 22 Apr 2026 15:00:02 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 15:00:01 +0000
Date: Wed, 22 Apr 2026 12:00:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH RFC 21/26] dma-buf: Add the Physical Address List DMA
 mapping type
Message-ID: <20260422150000.GK3199414@nvidia.com>
References: <21-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
 <c413710b-4c28-4ed8-88ec-aeb8c4482011@amd.com>
 <20260413121628.GE2588311@nvidia.com>
 <f6d38a08-009c-4efe-9dc3-6bcf00ac35f7@amd.com>
 <20260422115306.GI3199414@nvidia.com>
 <fd8065ce-fd0e-4df5-9c80-8e9603657cfe@amd.com>
 <20260422131337.GJ3199414@nvidia.com>
 <e67426b9-4ded-4f6c-8309-7f847adb4540@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e67426b9-4ded-4f6c-8309-7f847adb4540@amd.com>
X-ClientProxiedBy: YT4P288CA0082.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::12) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d39485a-5cb6-449d-214f-08dea07fd43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18096099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NDVN1wZS960bvxxCyFyOpFyNyGlik59XaYx9T9Z+tD6gdaWl9MUZ+OqCv7S7Qf/mAIgiTFdKYpzxLxdVpbPhtc3+wuWZxUYHfK64/O8xt4ol0N0twv9l2Wdn2xlmfgXAguZFGHR8Obo2Vmrf55EXffKZdnX9UBSH2qYSIuMoF9uyoKSDhOWIhaz2HlZptSBCrY0/W2QVHO/Jq+KcVgkHybNmNWuS5V0jnEPNdxh2w/CIhR9BUUGFwwEh3YAb2IiaJfvbo4DiLX1KFbNChue1uUaNolLFutIREV4fpMfMW478rHsRpco9iDAwxXrfEWmgMWxDv9ROWOt54aW3/92erHegVT8lsdgFMRNSuBBd4A+LF253VW7DBIsmXssUwit+Alu0T8xFGF+JRpMRsui2JaYaYYlzpcL+Oxez2uz5mD1ggD5TUkZcVeB86TZ3Ce60mxkZ0V+oFHzmRdqlPhaaAgUHvrL1sn0hXa+o+fWZ81NLnp93oi7dfqZoHflQMaclddSKkUtEW+XNC+85PKby4PUeX39nt3olGlVDcAP1mIY67xz0w6CrSPJOp7JFicogsX+Cw0t0UMfDi5c6qAt7itiQsqU95ESsmxXYIXSoTh2p778D6bAajnANf3GAeW/MpXgqGGozyuLFqd4nMtXIG5Eh3GmCRbY4IfC/feW+jHKEvmCGwHtb4urV4OrQn4rkH8/fREejWjFBOxB2h9GnO8J4hdAq+ECSPfinaAEbPpI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18096099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXRGeVVQM3FZQXZaKzlReUc0Zzd6c1ZvOFlOUmdBMmdxU2NiVzdHLzFXU0pZ?=
 =?utf-8?B?dWdTOVZXSCtNUXY3V2VkZzFHWVZpbXU1d2hxNjNSTjRFallCZGUwQUZpZDNQ?=
 =?utf-8?B?TUwyWWQxK0tiMENPWTNNbk5XdVZHWW4zSHlhT2tQY1JoVnZqL1A1VkhNMkND?=
 =?utf-8?B?aWdTeTkyM1FEdytDTFVYT21PdCswVEp1b04vMTd0ZFhjVjZodXFTS0VTRXlJ?=
 =?utf-8?B?dkI1YlJlMEx2UHdaMThHNi90QzROZWtvWTBhOU9raFhpdFpVNndjTmdvM0lY?=
 =?utf-8?B?UFFQSEZKRHhPV0J1MHdObndKSkd3Mnd3ZTUzYTlvblBqK2xjalAvL1hHT2Z1?=
 =?utf-8?B?RG5KSDBjYzlGQTVNQ3dHVGNZWjFzVW16cnRyL1lzNjNzVW9STnJNT3Q3a0gy?=
 =?utf-8?B?V1dXeVN3VUJJK1VJZGpqNnlTU2ZuM3dhNGt0WVhEWFRPMEFCS1ZJOEIwdGJi?=
 =?utf-8?B?SHQvSStHSkJWbVZieXZrZXczb3BJUWI1YVZjUFZ3WXN6c0gwamRkYVQvajA0?=
 =?utf-8?B?NTR5MWVMVC8xTG9SUEY5eVE0TGo5dWhabFJpZngyUnBWanpDRnVUMFF5Wmpy?=
 =?utf-8?B?QUI4MG1vSC93Rk5hMDNCZ1QwSXhtSmc4MlVKUHJkMURZNHFlazhKWkVKTXJG?=
 =?utf-8?B?Sy9IM1dkOC9wQnBUOXBjeitTdTh3Ui83QkthdEZZUHNDeWw1eWhzcnVHZzRt?=
 =?utf-8?B?eTdnL2hsendOU0pjV25MektvRjQzQzZZV0xpUGFSN0tNc0RVSVdUYU1PVVZa?=
 =?utf-8?B?L2R1YXdiYmZicG9OVmozb3NaQlFiY1hwQjRSNldMYUl3OGJRd0szb1QveUpL?=
 =?utf-8?B?V09xNlpDNmdlVFhHU0JnMGpDOGFDaXJ3VmdFajRLZEhydE52MUtxTHVuUzB0?=
 =?utf-8?B?cEorck1ZbzhTVjdYM2NRemdFZnFUdDdiRVl3UU01WVBSTGRHRTVrdW5CU1RN?=
 =?utf-8?B?U2lHd2UzZjlPYVlCaExwdDlYRDdIQnpHbTk0SCswTXgrM1FFMWw3aXF5bDJQ?=
 =?utf-8?B?VVJOMlFVL1F5UXI2Vkp6aitrTktvSjN1aVlBcHlyRlM2QjAyY0cyRSswTndY?=
 =?utf-8?B?MjRBSUp4NVBhSmVFK1phdUlETGdQVy90VU81dXRQcDQveVdTMkozWUs1OTRn?=
 =?utf-8?B?eXVBQjFRZnlKY3JWdS93SnRqOWFaOHlPMmtEKzllSWNOaGtadDZSVjdHaS9o?=
 =?utf-8?B?WjB2ZzkyWDdSaW81Tm1vdEJDSVNoYW10ZHVYdFFlNG1zV3NQMWVwbWNOeU0v?=
 =?utf-8?B?YU5SLzgvM29kV2tKVlcwRk8rbDZQamxoSnNwQndIQkdrMGMwLzRkVUZFM09Q?=
 =?utf-8?B?aHkwdWNFYVEwN2JnbVJ3ZUEvbkhma25Tb2U0RThsZmxrZWFiQlBhMEltZWp5?=
 =?utf-8?B?UkdjVk5tUm9FWW9FcEt1N1B6alFONDB3YkVKb2JnclQvZHJZVnIrY1BOd1Rn?=
 =?utf-8?B?bTZDOTdMenh3ZHUvQUYyVWJHSW14cnNwMlVKNVF6eWtzS0NjVnFvUmUvd1pv?=
 =?utf-8?B?SjUyd3FOeWU1bHJieDBTa1pUMlFnM0dEcTZYMis4Uk9VRjFlanR6KzAxcUJo?=
 =?utf-8?B?c25mTm5MWW9ka09lY1crbzdyVmVxVXBrRk8zbmc1VllqNHNHQ1JxaExOVU91?=
 =?utf-8?B?R1VjYTRDSGNGYjlqbkhwaU54ZFM1NUhpTEcwTStjcC9DUGplejJLZ3JsMnJ3?=
 =?utf-8?B?WEY1dVlWbVl0amRFaGdra0dUeUIwd0ZaaWRGcTZTRVBhMW5yOGpWVzROYzVz?=
 =?utf-8?B?dU5ISVJZL2J4cXpqSXRqb3pzSS9RcXdOQmc2anRKUERsNlZkNDVsdGsvQysy?=
 =?utf-8?B?bHNpc2lJZW9TR3pqUDFpd2pnOFVFSUw5RlF3TDQzVFhlYmx6aG04NEswWGRF?=
 =?utf-8?B?bDdIRkM5WWw1clpFQkt1L1BZdk5wWXNqYjhlam45TmdIMGI5eVBzaytUNmpw?=
 =?utf-8?B?ZGtZV2NpVGtIYnorQzYzZjNyemUvelY3WlQrWlk0eE52TFNyU1VzN3ZhWDE3?=
 =?utf-8?B?dzFSTXNGZnVFNUlvdnpnazRZSitIbm1tVVJuMFh5eDBOamR2UVZoYkxzVVQ2?=
 =?utf-8?B?Vy9Na2tRNzgrR2NqSzlNY2lpK0tGNU1IckRRSVY2SmEyYlZSais2UkYweDZx?=
 =?utf-8?B?WGxsa011NWRwWFV3MGlVWmp1cnJCbXIwRlFmNFd0Ly9zOXFvZ1ZGcDlPRDZt?=
 =?utf-8?B?MTRqQUlSS2t3YlFPMlhIazNXeTdRN1oyKzRhVDM3dFBwb3A3WEtDaXlOaFZr?=
 =?utf-8?B?TWFDU1M5VHk1cTZkTFk1K3p3TlduR0NuTDdJOHliTXR3TDRhaUptVGJaRVZs?=
 =?utf-8?Q?VknX+e1qJ3yr5J99SA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d39485a-5cb6-449d-214f-08dea07fd43d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 15:00:01.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PO5VsNEdkzZVrwhp14CjSAptIyBHAvhCYP3ymPXYhMAw9exJoHt3E+Dpsh9pnycI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59346-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@nvidia.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 08792447AFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 04:04:19PM +0200, Christian König wrote:
> > Well, my first reaction is very negative, this suggestion is leaking
> > deep internal details like iommu_domain out of the single place that
> > needs them - iommufd - into about 6 exporter drivers. Not nice. I have
> > the mirror of your concern that I don't trust DRM drivers not to abuse
> > the iommu_domain pointer in some very creative way.
> 
> Yeah, of course that argument goes into both directions.
> 
> The point is just that we have much more importers than exporters to
> handle, and from experience it was always the importer who messed
> things up.

I think that is true for scatter list, but it is the opposite for this
iommufd connection. One iommufd, many exporting drivers.

I imagine all the compute/server type DRM drivers plus RDMA and VFIO
will want to implement exporters. That's at least 5..

> Background is that the importer integrates the buffer into it's own
> handling which might not be made for the way the exporter is
> expecting things to be used.

I think dmabuf has robust rules for lifecycle, and the invalidation
notification mechanism. It is complex and perhaps not well understood,
but all the technical pieces are there to allow a correct importer.

I fully agree if the importer messes up the rules things will be
broken and you will have corruption issues. But they can mess up
scatterlist liftime too! Yes, VMAs are a really easy way to mess it
up, and for some reason DRM drivers really want to put things in
VMAs <shrug>
 
> > However. With a suitable helper we can largely isolate this to a
> > single function and yeah I can see making this functional.
> 
> The important point is that the exporter should not need to expose
> it's physical data store and how it's housekeeping works.

I'd argue the other side just as strongly, the importer should not
have to expose its underlying HW objects or how they work either.

Would you be open to an in-between? The exporter and importer both
have information that should not leak into each other's drivers. 

What if the dmabuf mapping type core code was the only thing that had
access to *BOTH*? The exporter provides the address data, the importer
provides the iommu_domain. The core code, and only the core code, has
both and does the required operation?

I think that satisfies your goal to prevent importers from accessing
the information?

In the language of this series I imagine a PAL exporter, and an
iommu_domain importer. No PAL *importer*, no exposing phys_addr_t to
importers.

Instead the core code will match a PAL exporter to an iommu_domain
importer. The core code will provide a "converter function" from PAL
to iommu_domain. Only this converter function can see the phys_addr_t
and iommu_domain together. The exporter does not see iommu_domain.

This is appealing to reduce the driver burden. A converter that calls
dma_buf_phys_vec_to_sgt() could exist. Then a driver only has to
implement PAL exporter and it works with two of the importer mapping
types. Makes it easier to introduce future types (eg scatterlist-ng)

I don't think it would be a nice outcome if every exporting driver has
to open code several dma_buf_phys_vec_to_XXX() helper calls.

(I say PAL exporter here from my non-DRM perspective, but maybe DRM
wants a bo/ttm/gem/page[] or something as the exporter mapping type)

> > Do you have a positive feeling about the general mapping type system
> > from the earlier patches?
> 
> As far as I can see that goes into the right direction, yes.

Okay, do you have guidance what you'd like to see as a non-RFC
posting? Ideally I'd like to make smaller steps, this RFC was
responding to your request to see everything.

a) just the core dmabuf infrastructure for mapping type infra and SGL
b) a plus some set of the simpler/safer driver conversions
c) a plus all the driver conversions

?

If we agree to the "converter functions" idea I imagine the following
sequence of series:

1) Introduce basic dma buf mapping types for SGL
   side activity: Move drivers from legacy to SGL mapping type

2) Introduce dma buf mapping type conversion functions. With PAL to
   SGL converter. Restructure vfio to be PAL only and rely on the
   converter for SGL
   side activity: Move more exporters to PAL/etc away from SGL

3) Introduce dma buf iommu_domain importer only mapping type. Core
   code converter from PAL to iommu_domain. iommufd implementation of
   the importer

Thanks,
Jason

