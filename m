Return-Path: <linux-media+bounces-50731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8143D21468
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 22:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2ED01300FD63
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 21:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135AA358D28;
	Wed, 14 Jan 2026 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0FLIyR6z"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A89733B6E4;
	Wed, 14 Jan 2026 21:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424924; cv=fail; b=H6Qg/GUJBInBpZKEyXX6vvb+e4Kw4lv0VUALDyGdLVpcGPK7I427mc8xPK1e8NpsppoVA/Rqq1YxJfSPU4wEBDVw1Kob5w8PGNgRvWcKMTsv/Q6ke+1o0lhJQstWjMXJFZM5AJL+vtPcRL2V8nMu2bioYFrUp4iuxnfy43odvRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424924; c=relaxed/simple;
	bh=n3tCXFtmkAqUQ1igUtIFd1FVl9VwGsAXIS07oGC5qYs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H7AbqPtW5h/xUX3SdtiEmfbxGOQEcjP2s9qnAQ18FdM0zN4N2HWaAslKPGnThFwb3ZwbkqREGdfwo0ObBdUz/5X/gK/hdgOkclfxhZsHfkUWmSiDjDnwvawbYODmfi/U1ACspresD74KOPj7yqPgUpJcTnOctynccAA5a142sMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0FLIyR6z; arc=fail smtp.client-ip=52.101.43.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8zl+/mWECwJTPWAVJjM+qneAmOEu98HAS2C2dHziPtkLzDzKdGqnJZChxlEY70zIky6Rw7lVjo5JSdxRf31bi6cAf56beeguLGSYOYkXveKi9bOkZ2HDWYw+ixMAUjWpWF6J71+9GTeeqemqzr6D1nrrnz8meUUVxCPiSBmq8Hxyw+rrWnCFO6PSj2Cfjq3/uwaAdosBUFZ19BXtFzDV93shy9sf4z1RWDG5Xvp82xcghSePgUtb6XGeTY4mi88lLNB4vselJ+up48Yzj6cvBQsrPP+/5DAJzQPDrrmSnbfG6x5+S7OMwebJdKgUZ23tPn6bqRG8JQ2xzr30ny4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afOQeOczrNZ76TRcKat1rDMBZocIgaAoA7lSGHSOKmI=;
 b=sdbhoRTuX7D0PINy9V1P3KskOQkQhDv4gzS2wisiIUpQfwPChDRVE55pepTNmkg6nr2HYi/2SjUtoOA6LO5H3eQzwwAnV7FX35/9f0ErTCAaEKaNJnQy0aukvL1H77t65ITF2vWokuPoiOugoxuPwwp/IIVT4XMEsQkvsXp2aTKTMkEZeEyeyB05N49wQFtNx1I1Av0a5XUukNkSZdOyxD0alVAlfHL9cuBTxf5Yexja1HYG7LfqbGROhHPz9cBzVPIZp60Gny+SdGDMoUCCtxbqQl9r/Y3KPNsrt2m82wzAHvVg33gT1KY2JYAWGwM+OqdRJsKpG33Tum2WrVOAFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afOQeOczrNZ76TRcKat1rDMBZocIgaAoA7lSGHSOKmI=;
 b=0FLIyR6zjRSKQEkCzlBSrhLK/hhuqmTW6J5z03sy7YdxOdSSmkrFNOTaqBj5C1OpJ7mcr855j4q4iCOr0N5I4vhkJO8ZHtVgiktDVl/f/9pMZHmhMDWXNt9FAx/z3goI3z2h16TbplNnegmSBAYs36TW8ZxJ0I3UVIBYLNK0bsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB5616.namprd12.prod.outlook.com (2603:10b6:806:22a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 21:08:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 21:08:40 +0000
Message-ID: <bc665c1d-f2a6-495a-bda8-012b2619f0c4@amd.com>
Date: Wed, 14 Jan 2026 15:08:35 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
Cc: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain> <aV4MYcgdOviulN3E@sultan-box>
 <aWgEtfp1MWioqKox@kekkonen.localdomain>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aWgEtfp1MWioqKox@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:806:122::32) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: 877b4e40-29eb-4fd0-f28a-08de53b11798
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzl0Q01TYmxEcVlqZ0lCQkxlc011ZUtqQlZlL0NnTFdGZFhBRlg4MUIyTkFW?=
 =?utf-8?B?YkNqcEFzajhsNVk3N1djQXlYenNGNjgzM1ZUcFd3dk52cTJoNmZqZERXb1Bw?=
 =?utf-8?B?Z3VqVHVwK09aemJNQjBVVzhiRmd3VVpueThpbzAzS3FIaEd6aUs5K0ZrSFVT?=
 =?utf-8?B?UEFyNnZDRUIzZmZQeW5uSjZwVTNHMzkwLytMazBFcjFqN0tYNTEvSzZSTEdj?=
 =?utf-8?B?dmJNUkYzSmczd3loWjJqTkMrUXVjR2JISThtNlVCYmtOZnNjSmFVK2dFZkEz?=
 =?utf-8?B?ZEdYdDNqdnp3OXFSS3dRZWRETTZreE5xYjBHM2hzK1ZVbWJ2c2JleXQxWHRu?=
 =?utf-8?B?bkZEdTFRSHJwU0l4akhyVDFXSUV4S3hwdEJkdzFxdXBDSVF4UFppVXljNkk2?=
 =?utf-8?B?QW03ZHpxbWpvUWYrWGNvMS8zRkh5dWV3ekd6cU5UVVkwNi8wTm1WSFN3MUxr?=
 =?utf-8?B?aTVtYytJd1pJWnJlZmZuT1haMlVPb2NBNG1ZNE96TDNuQVVlRlIyUHpycmN2?=
 =?utf-8?B?WkJ3aStBVERlcGNSRlJxY21SLzR5dTNTSGtWSFh4c3JreW9BM1lJOUhITFMr?=
 =?utf-8?B?WWJQVUFlUnkyQk1CUmlraEZGb004WU9NOVpNK2Q0Si9SeDR6NmNSbkQzMS9o?=
 =?utf-8?B?NUpxaTcwaUZPYzZXVUR3a0ZwNE1aeERFbm9Eckx5K2VHMTBKM2g4QzJ1dnB2?=
 =?utf-8?B?Y0NyaWY3ejBhRnFPTm5uSmNtWW9CVTlra3dDSHkwRnJ5OVVMblAvRmF0RTZM?=
 =?utf-8?B?SXJsR1NzTmtha010WisxbGxmd3Rab3kvWFVzK1FRdUo3ZTZYWHU1MVNCclFJ?=
 =?utf-8?B?ZmdiU0s4RjZpREQrcXRTbUtsWkgyK3RlRHlUMDZZYmdQbVBxWHZGcldybjZ0?=
 =?utf-8?B?NmV5MkwrMWhZOFVaQ29JR0RwWjVKSlM3OWNqRURKRjAvOUZpckJjY1BOOEJD?=
 =?utf-8?B?MDhFNG0vUUExcmxvRU9aTDZRK0V6a1NqVGczeXIvT1Z1UUxPaWlqdnQ4RWpz?=
 =?utf-8?B?VHdHOG9aWE1hVVdjZDFLMnVMS1IwZDFEbnJ2MUxMQzZLY2lHUnJWZGtJZVhl?=
 =?utf-8?B?MTNqbFo4Njl6dy9ZZHdXaTh2SHQxY0QzQzN6NG81TERwd1lGL1BmWWluZkt4?=
 =?utf-8?B?aEF6S0wvQ2tIbWZzM1RueFppK2JFMWk4aHVZUU50OGdoYWZ6QVJnbVpFVG5X?=
 =?utf-8?B?ZnFYb05walgrWDdaeFF6aXdpRHBlamN4YVB0TndJK1NMRW91bXpiQ283ckly?=
 =?utf-8?B?a2hxMHYyYkkwVGVEcHhnV1g2VXNUblVCSGcxYVVFbHVIUWcycHJKeitOdURm?=
 =?utf-8?B?SUd1bjdPMmpyUjJ3UFZ4VUo2aUhuVzVHV1BGUkcxRzBqdEUvb3RCRVNPa3BU?=
 =?utf-8?B?bWdyN3dvWU5QaXNmRmxZS0lZWmhqVFBlbW1zNTZ6Snk5VEN4MFJyYjVKclFH?=
 =?utf-8?B?dFNDMlFDa1ovRG02UTZ3ZmVGYzBjYzhSaCtiQWpObFk5TFNJMmxabXFsUkFY?=
 =?utf-8?B?eldXM2hNZUo5cTh5dTBNTHo0TEoycnpjc09mcTBWeTlWVXpoeXZlVGttVXhx?=
 =?utf-8?B?V2hGUHdod3dKUEwzR28wTVBiTGpSQytTWm5hMDZPM29iTXpTS2laQVU2UVEz?=
 =?utf-8?B?MnU5U25UeWl0TlJzVkpiV0dYNjNIblp1UTdTSXVlaGNpck5zU1pkMFdxTGpT?=
 =?utf-8?B?Si9DWHFSb3hkZDNBSDRndTJtWExCNUZYbmJBbDE3MjlPV0pTRlFXaTlqOEtN?=
 =?utf-8?B?L3Qvc3RIYXJiRzk4b3hScG41MENZSTFWa0MvSmtGUm5ZQTZmOHZ0aTNxSGRW?=
 =?utf-8?B?WmxjRTd2WTNlN2dFcUxzdzFneDl2OEhia0dESk5RWkdMZGZrd3FpUnlzbnBE?=
 =?utf-8?B?TWtxSE9iVnQwTmJHNVZvZGJDUndlTzFwWVhtL3lQODkwcTlMUU5QVktCdG5F?=
 =?utf-8?B?Qzl5akl2TUs0cU5mZUd0ejNJRk5kZlVGaTVEUHdZNzJyME5aNmRuT1o2NTB6?=
 =?utf-8?B?UDdwdGFBa0hSZjB5L1ZWdHB1L0JQMUR6dGVBWFlsdHJVcXpmcDM0N0NXazYv?=
 =?utf-8?B?SjczNHVETjdlby9ROEpvaEpRUy94ZC9VSWEzZ0JxY0RRL3I5MlE2VE04dTFj?=
 =?utf-8?Q?XO8M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHJKNEVvby9FV0FjTGZ0bzlnbVR0ZkZKOWRRVmtBSisyc2lmV2s0ZHlRT3ht?=
 =?utf-8?B?MEZIUVpiekJKSjY1QVNmZkZUZENjVUpuanFhMXpSaHdrNU9VU1FLUFZpbVJI?=
 =?utf-8?B?MTZ6SHVNV3czNmJmRkV0NWZKQ2YwWGhieWJRVUc0MHlGVktIejM4b3RLRGly?=
 =?utf-8?B?eE1qSXFVcFltaFA4U0x2cjNWU3E5UUVyYSs3dWdSVmV3VERNV2dEZFVzeFNQ?=
 =?utf-8?B?T0dpYzFOcHAzMnJidjdsTVk3S1NRK2hrVDZyeUNPTHBPK043VjNHSXJHQ2ts?=
 =?utf-8?B?SzJ6QmNwM2w0SWtyT0g2SktNekRXR003dkYrYVMzNWZFVVUxK3dvWlpDbStI?=
 =?utf-8?B?M0QwWGp4MW13T1FmTVN2T3NaN1RRZi8yNjF6cWo5NjBTeXVPbnRTcE1haXdv?=
 =?utf-8?B?VktidkY5N0U3VFkxMUxrWlhyV1NFamg5VkY0MFoxWnBDM0FOeDZ6NG16WDI4?=
 =?utf-8?B?QnM1b0szVEg1Kyt6UGEyS3dXM3FwdTkxYk1XVEl6c2F5alVrQ2RlbGdyUVJB?=
 =?utf-8?B?YmhHQlpvMW1WZFQwcEl6WWxITU9FV2RTUVlpMjQ0VlhqTnZralpENXprcUxR?=
 =?utf-8?B?MXRTUVVKT3hqYkVubytwZDFwbmttTmRVS3pNWFVKdWRLZm9Jd2RsdXdOSjBN?=
 =?utf-8?B?T1ZCV2xnbUJvaXloSERNc2N1K1JTeXdIaUZMbFB1WlU4cmNDUkZ4eThTUEJK?=
 =?utf-8?B?bGNMK2RqMHQ5Q2duV01MSHVtUFdVKzNEemdvKzhXdFpRY1RwRGFGQ1N0b1Fs?=
 =?utf-8?B?S0pvSzIxRUZRYU5odWN2USsrUmVtWFN4VDlxQVFaUDVRTHFST0FSS2V0Skc4?=
 =?utf-8?B?TE1vK0JxYzhGUGtQZ3hLQlJiM0tVdWdQaVNPdWlzbWZTODlLZHNaRDlvMEs4?=
 =?utf-8?B?aUpSQWkwMWtGZUpqaC9CdFBmcDYxbk1FUlROSlp3QU9YSEE3Ymtoek5DQmhi?=
 =?utf-8?B?U2xCMk5FeGo4dVNBUXVvZTlRUWdickhQeEM3TVhBZHpMU1JiaDFwMWRkU0VL?=
 =?utf-8?B?VXhtVzQwckxxcVRNcGpBK3R4MFpTcTVQYnA3VjdMeUZFWHY3dG5GdHFzOGJl?=
 =?utf-8?B?WGhVYTczSDZZWGtob0F4VUpTV0VrM1dXcFpUN0tIMnAzakJSaDFUUGJjL3Vn?=
 =?utf-8?B?ZVlOc3V3bXNQWUFUbjBaa3RaOGd3VzZueWtvNjNvdGNKaklWcG5IT3J6NVZT?=
 =?utf-8?B?MlhNMWtzYlJsNFFTclEyaDNNRHNkYmxENzBZTGtqMmRpQUppWk9YSVpoTjJQ?=
 =?utf-8?B?aE9MY3VuQUp5TUJBdHI2c3lRZUV5Nk5HWmpBWWlDc3FSTCtSSkhNQ1RmbkFO?=
 =?utf-8?B?cVZMbi9wM2JaaEk0akhwazZpNjdaM0FCUVBjcE9GMVF3VUIzdEthdzN5V3VV?=
 =?utf-8?B?b0c5cy9FWlJGTEk3OTQ5RGVhZkJITE9WUjRsdmxvc1N3dVE3a3RKbFB3S3Vw?=
 =?utf-8?B?dy8yZDAyWW5mbDRxUlRWSnlTTjNBU1NnV2RFUXdGSnhnbVExL0hlWDhwOWt1?=
 =?utf-8?B?YW1ScVN0d09oWW1YaDNpaTdLTmVUZTN0bHRZVTZQRmxHK2Y1cjllb1lZWjVG?=
 =?utf-8?B?VmNlL1pudWFmWlI1NU1Ic1B4c2NjRFpxdnJPV0tRT3VXZ1FGa09yZm10Q0Z3?=
 =?utf-8?B?RDJ5SGZSZFZnczhoTFVWa2ljYzVSZ0xEaU9LUlR1WGJtQzgzK2pQYyt1Q1NV?=
 =?utf-8?B?QUw2MlJpaG5zVm5wcWJPajNNaTV2MG5PS3MzNjJKeE1QbSt2SEJIVUVBN2tp?=
 =?utf-8?B?OWVHUXpxYlhybDM0SW8vTjRHU0hJTEh2WnFaSmpGbU1sSGY1UnlsaTZFL3R0?=
 =?utf-8?B?aFVXMmVHM3dtNDNxaWJPOGxTUnowcnJXQTlPdWthL3FFVHJhT1EwUWJrK2Rx?=
 =?utf-8?B?Z3RNZG4zTHRBZTkrMTVxSmxwUUxrb25zMUVUKy95emZvZWhobnNmallzUWNs?=
 =?utf-8?B?NSt3K3hZVkFaQThFUjRCcDR4Tk5KbWFYaVpNQlpubkhDRklQbi9neEhKVklC?=
 =?utf-8?B?U1p6bmNDdkIzNGRoNzZrWEhBM2x2ck92eWJDNjF1dllUUlFMYndyTzVXR0pu?=
 =?utf-8?B?Uk9wK0hjaUFCMmtCeTZaWDBKQ1RwU2pycDdaQkRQUmhDeUx0OTBoUU1OY1dO?=
 =?utf-8?B?N05ab1VkWFgxYTBxem5vUXI5YUwrVy84a1M5SGZ2MmswY2pYOUlzNk1qV1li?=
 =?utf-8?B?a0dBYTFramMwN2xYdzVuTDZ2eENNeE9MZ0FRQ0llTE0zK3o2T2NsdzZRTWhE?=
 =?utf-8?B?ajVHTkZRdHgzY2VsNDdrZTFtRlRXaDg4NnpZWUEvTTlaa051dHNzRnBtbU9J?=
 =?utf-8?Q?cpKxYX4ILpuwjpdyHo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877b4e40-29eb-4fd0-f28a-08de53b11798
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 21:08:40.6174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UUdTgWO/YIMqAH97AozHvKN12YU3X2Sf4Oh3Clt0EDWqxEua/bOo6yT1kJvgKyk27ncBW4lzE89rWgeA3xO7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616

>>
>> Unless the firmware API structs are all __packed in a future firmware update, I
>> think the memsets should remain.
> 
> If you want to be certain of the size of the structs, use BUILD_BUG_ON().
> 

static_assert is another option here too.   I did something like that in 
drivers/acpi/platform_profile.c to make sure that a structure got 
updated from new members.

