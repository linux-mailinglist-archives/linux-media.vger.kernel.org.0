Return-Path: <linux-media+bounces-50109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10064CFCAB1
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 09:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51917303752B
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 08:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002052D73A8;
	Wed,  7 Jan 2026 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="krA9u6vx"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4A174BE1;
	Wed,  7 Jan 2026 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767775467; cv=fail; b=uexgNqnQBo+5jWok8xfX5q21ROxYkcqMttYUDsO/N9jLZmsPZfyyQtId9/S64L355MRMERUdEanxR2hAQxO2PMTYvoopGCZxDz2lGJhCMnIFUzYsW1xDKhoker1tBkDypCbnwWynoxcXtNitRdKyPIIB25/TuKSmWDz2m0TF6Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767775467; c=relaxed/simple;
	bh=BqNLdnsBZUppaEiSCRNs/StfZHRoNqGWVHfZsgGVIyY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WQpKdiON5e3DLaHL8HTjbCmFadjarjz3//ntqs/o/NMwoEl+n0GTLWT0Rq2kBSRc3GpXWdEkdMH5PadHM3aftJYwKu4phtlqU3Ho8pn5EXLkHehNze0T/ESHo0Sj3TZ52V3r2T6+mZ+hYfLb+8cYKqJiGOaB7SgTWHlFyvhvGrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=krA9u6vx; arc=fail smtp.client-ip=52.101.62.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSBbG+6FVxffEvs6F+Ns6fmPWL0/Zn6PUhKANXkbWDlcs887rdRfKkbemn3fE1U887wXwbYykV0nBcWAnNAp7tv0vf8Ja8cNIJXgGwv3dhGjLzOGObC2lDw3itpqvlIDcXTa70WuQck3ycnHjJ46ArgkM8mF4/sWTU6D3ufJyAsuqmWEQh6DVuhgvLaCCGLUTdE/E8Xoh5R89bvGzPicAMAG3JmwHwJNtsGaJha87P+jFLRV0L2YIRKReghHViKoZmsWrFmT+sZYJbkhXmNsTs0WoyTfN0+VKYcYte0qYmuufWV3a4oXvJzmP9aSrIZPQFkq2NqnDGfkh6kkH8az9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLh1KjI00dNtltYY6snC2/VJdKa6rLwJbCP0gPJ6TAg=;
 b=yLLMSHs1TLtgcZEEsHeB6EwMZ0iG11bLmMJwxpPZqi+6VGelYIEd/cZl2s35mhVJXv8HAyv1Hl+Ms938RjyJm22HBqqoXaXqZLlOKk6sIzybCnBZtedhBQNpp6L26G+I5uf1TpzcLrI/tXaUlLxR9mVaTup8jMjHqdWyA6l0NdEDem8px/ScPqIbhZtHQtxx3f6Ym7bjP3gYMlLlmEmI0EcC+FCyenB4d2VXDC3G2LgZPaLRh/fcZtC7XED6THIGW5mYzaQucl0otabr9OA0HDyYehf1RzJU9ObbFamHWRKS4+GppV/zdvJqOhn/LCHpJmfdnpLeUf90aLZiFv/1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLh1KjI00dNtltYY6snC2/VJdKa6rLwJbCP0gPJ6TAg=;
 b=krA9u6vxGPSQwmj+g2xb4gb/0zanTihF7mMZP4QJoM53Oy7mpNcpOt+45sdIigB/eGxfs5IgtrmXeX7rZnXRMmH0B9QRrXOGNRe45jh834GQxCO52nZ8D4l3dgr0CRKgZcsumKtfUUzlDQS1Z+6v9LJ4QVPJ2ULjn+mSTbQVF2E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 08:44:21 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 08:44:21 +0000
Message-ID: <92ccb38a-5c62-4730-8a41-fa80d2f523a7@amd.com>
Date: Wed, 7 Jan 2026 16:44:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] media: platform: amd: Add isp4 fw and hw interface
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-4-Bin.Du@amd.com>
 <aUkRQEeAWDeQknP6@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aUkRQEeAWDeQknP6@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|MW6PR12MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 65197329-f734-480b-baff-08de4dc8f3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUpvZlkzeEIzd3VGVU5JekJQWnZQT0JsblBXR0xYbXZoSTJ2ZjYyck81NHhS?=
 =?utf-8?B?YWpxL0NDOHdQazloRVdrakdGTUhadG5KYlJ5T3lmQlhRRWhkazFpYy9iUnlM?=
 =?utf-8?B?b2l1aUVrc1hCZWpyU21saHRaaTNPMUMrbVlucFNlRmVFblZ5aEJNOUtnZEJy?=
 =?utf-8?B?NTg1RVhoMXZiNU9qUGx4RkdHMWdlL1g0azl1YmljbGhiYWI0RW1QSDBpeXAr?=
 =?utf-8?B?bytlckNqQ1VaYTNybjhKR2pTR1ZucG9qMVFZQ3NYMVpnWkFSU1NVVG1GMEpi?=
 =?utf-8?B?ZklucHlsSmxmckpPNDRGL2RXaUZlUU1mWXEwdTZkUmZRWjYvQzJKRnJZdXBm?=
 =?utf-8?B?NFExb3A3QlpIQWR2UHlEVGFjQ0EyMzJqZklFVVc5NmRnWWlSMUpwRTEvaTM0?=
 =?utf-8?B?dFpFMHlJZDZ3ODZLcGVVY2cwMmFlZU9uMUFxWjJuL05saXBLd3VXRnMrdXFx?=
 =?utf-8?B?Y2Faamdsa1RPcTVDcXBQOXFHNnYyNkNmM3Q4OFNRbFhrTE52MXZRekNIQXho?=
 =?utf-8?B?UWxwclBvY2FJVlhXMnk0QXF6ZmE2NTlEYjFVREVMWU1selJ2R3kyL3dBbW9K?=
 =?utf-8?B?Ym9maUp4VDVESFhYLzAzSUZveC82dGNheHRtWlNLTEtSQS9wZGdMQzR2d2Za?=
 =?utf-8?B?Ky94TjJ5Q3hhcVMzSENIcitkUzRGUXVhcTl3d0tYMW1udUR0eGpzbVVDd1VR?=
 =?utf-8?B?QkUyNmhpbGNieDZKelE4aXB3bkJ6aExSbjRZbjNUM3lCeFdOa2pVOHZjR2VD?=
 =?utf-8?B?ZnJnb0tRclAwVkVKRGl1d1g1ME5uWkZzSk9jelhMK1VjOXdmdkZMeUdmTVo2?=
 =?utf-8?B?WTArNi9tek5Oa2JEbXJBQVcwNTUwODhHeFZ1MU5ZODZSQW44eEtobGkvSjJi?=
 =?utf-8?B?Snc3SnlmOFh5dTB0UnQyeEtrdGYzN1htMzcwMW1pTFMxbHVzK0xIdkJPSUsx?=
 =?utf-8?B?cldRQ0czOG5nM0kwYUV4bjg1OTJ1UmEwWXMrandEaCsrYmR6dHUxYit3QXpI?=
 =?utf-8?B?cEdjaUxIK3k3S0lHR0o1bUZ3cWN6b2JwM0xQL1dvWVFQTlVCQXl4ZXBUUGhU?=
 =?utf-8?B?clQ0UXB4Y2Z5UVBmZmhwZnVuR05WL1RJdHVTc01uajRsb05iQWluQTVlU2F2?=
 =?utf-8?B?S2R1UVkwMHQ0aDkwcmtPS3BoT005VDNscGtYOVhObkE3YjdFVnVsZkt1UUJ5?=
 =?utf-8?B?anFDZWQySVhLMWxSWEpScjJ1UmVIcDJDTnRUN2crUlNWUSszcU5SbEx6MThl?=
 =?utf-8?B?bGRuWUNSY2F4VDFQYVRhTGd4TFM4OGZGSmxtOGY1NUZZa0NlQnNqU0tpeWxy?=
 =?utf-8?B?c05qY2VUL2VYTDVGU3V6RTBjY1JUTDlMMmVVMkR3NnR5WlhFV1ZibEdsUmNG?=
 =?utf-8?B?R0Y2b2lzakZnUWZ0Yjd0WHFUeVpzM2lkT1NYbEJRcmE3SlpDUHFUTTRaNE95?=
 =?utf-8?B?aitDQUZSaFE5a25IbzRIdDlocngyRnlXdm5CNGxNbTQyeDFsaE9DeUFzZU43?=
 =?utf-8?B?UmExTC9YdUgzNk1qK3NVVldxclBVZU9RTmhBV292eUpJdnhoZGRRajlIOHE4?=
 =?utf-8?B?dXY5OWV1N21nazlDaE5jMENZNnBIWDVrZXpjL0tRaTBQTVF3MDJpOFZYT3lK?=
 =?utf-8?B?ZnR5R0RSU0dmc2k3ZzQ3ODk1WHJQNWt4K00rRTlsQVA0WGpWR3ZsWVkrcTlz?=
 =?utf-8?B?TWc1VmZRRDVOYVFBZC9hNGtBQ2ZJc3lTU0t5REhLSGZ4bWhPdmZSTFRlTjZU?=
 =?utf-8?B?a3kxNnRlMjdZb0x4VFBZd3FnL2hneitTTlRtN21XbEQrWTJhV2xPNGhpdGhk?=
 =?utf-8?B?NGFHZFNTTkFOcFZnVGRQWk45N1RYcEUyZkFJb1NORWdtU1g5eFhaQSt3Zko1?=
 =?utf-8?B?U3hiUUJ0SVJMZy93Qm9mZ1RtREhzT3ROWkdUeGxzMDRFWGpabURjYUIvaCs0?=
 =?utf-8?B?TkNCb2Y0ckFuMkw3b0FhN2M2N3M0QzhSN1E1Y0Z1UEtlQi9PU3pzSUZscy9D?=
 =?utf-8?B?Zjh5N2FOV2pRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0VSOUNIK0JPbGl0RTZiUW1LN3hwRyt6ZUh6L2hwNHRGM2tMSWk1MERnSThy?=
 =?utf-8?B?ZGROd1VBdkkvb0M4U3BqVzZuVzdwQlYwMFk4TnhFcnVPM25seXpCbHgrWW1z?=
 =?utf-8?B?MUhOWUNlelh3N3FnYVFBYW5yZGRjNFZCRTlrdDR6R1MwWFBTWVJWM1FZZWth?=
 =?utf-8?B?ZkRoaW9XY3AzMk9PblFWcC83UmVTYVVKb0EvbjhvWjJYa3BjSFhsNlBoUVVk?=
 =?utf-8?B?SWR3RnR5T25WRStGcVFsdWNpa1pHR2NmZUdZSlZWdGN6YVJMbU1DakwweFFK?=
 =?utf-8?B?cFFRUCt6ek1aL1pPT0luSDRoakJrMHRUR29DVVlxUnRQNUZPNTlNSktZUDRE?=
 =?utf-8?B?N2pIMTlMelJMeTl5OUtHQzhCQlp5WUhMY1g4RXNwc0ExMnlNd3o4UHliUUdw?=
 =?utf-8?B?ODJPZDBkM2haKzJiVjBHOStYTTRSdUVkekJJM0pubG96Q3JZWFFQRG9oNGFJ?=
 =?utf-8?B?SEgvZXloc241REFYRW92RlE0LzNzK0VqK3BGZmxLUVMrSXhuU21PUU1IbldY?=
 =?utf-8?B?cmVRWHplTUE1Umt2Ty9zcWFmbGg0WWUwNjdyMVNxeXRvY3Nmbmc1dUNVUm9Y?=
 =?utf-8?B?L0p5cGRBVlQrdDFIYlVaMWVsSXRDWlBITjQ2S3hwdzZlZU5NK0ZFVDh1aEpB?=
 =?utf-8?B?RjgwdWhNdlZzL0JiU2sybHAydXRHTWt4eEhSbldzUDhSWi9jNjc0MXh5Nncv?=
 =?utf-8?B?SG9DVFY5YW9TaEQzNlA1RnZnM3MvWDduWU9UbHdCcTVZVVZld094Smo0bzJ2?=
 =?utf-8?B?clZ3Rzh3azVxMkFvbERlbFU4akdGRGNlUWJKbW9lMkNuOVdjSXdYWTh1WFRX?=
 =?utf-8?B?aVE0Zk1ObHRPSTJoNnowL2hRUUk2NVJlZlN1dmx1cGdFVTNmQm96UFdMOE9y?=
 =?utf-8?B?eG5iVjZDdmNKYVZzanlLZ00zeXNzdk1qYXVscUprempRblgzaVFwUndZOVRH?=
 =?utf-8?B?MjR2eTlraU8vRlNhOWpibDNEQncraG1yVDZjbmJ1SkZuT0IvM3Bkczd2Nm9D?=
 =?utf-8?B?YVlPTEhDanhmdmlCUE1SSDZqVXJaL2hIRlQ5NzlFRm8yMDZDbzg2a3BScVQ0?=
 =?utf-8?B?ZjZJaTlMYTZXL1YrNHhNdkVYN0k1MW1rK0N4Wk9nazVzeUl5OWRabXdUVVd1?=
 =?utf-8?B?ck9nTDhyQkFsSGxrTjBnVm9TdFViUlNhdFVCKzA0aVdxVVBpRFNNU3FzMXM1?=
 =?utf-8?B?SzZqQmRlZjh3ZjNCOGowdDRkNE9YVWx2ekVzQ1NQSWtTNTE1bUlNbFd3SGdO?=
 =?utf-8?B?TzBUYVZIU3hUQ1Q3WWhyMFF1YTF0OVlWRCtWVHhwYWdGSUE5L2xBWnlxL3dG?=
 =?utf-8?B?MmFNL0JCWmJHcUJuQnU0TE9EM25WeGhOeVdtbmN2UnpVSEdlcWw5dFhDNCtH?=
 =?utf-8?B?c0g0aDZOK3Nud1ZnU3ZCU0RkRE5IK3VOak5nVUJ6Vnp0U1NhcWgrZmdXeStx?=
 =?utf-8?B?TDR6M1R4RGJMWVVhc2c5TUxCbjJzMGl2dVdiVzdoZ1lyNHdhblRuUmM1SjlV?=
 =?utf-8?B?V2pTZmYwcVhCT3EyVUduajJoNWRJbGJRM0YwWXJqRUtFc1NiaktEbURRc0pp?=
 =?utf-8?B?dTA1ckovSmkreS8rRjYwN2QveDZxTmhOb0JWNWRkeWhLNStGcllYZ3JMWHVW?=
 =?utf-8?B?c05FTnVyVGt6MHpRQ1BiQXM4bzJ5T2ttNHUvSXpyVEJKTVdSUTlRdmZxMzNi?=
 =?utf-8?B?YTY5UXErMy9xZ0FGZUJTU0F6NzlwZnNqam9lSkJFTjBiZSszSXVNV3VTTmM3?=
 =?utf-8?B?MllBV0FtRzRGYjl4cVRkSFdranBDZTNJZkRMQUFtb3ZmdWpFdGZmRGpoSkpr?=
 =?utf-8?B?T2hKTlpOeDRRYTFpWUg3OGpQL0VUVk5nYmhNanVwNUFOR1Q4WTJudHp2ZUZj?=
 =?utf-8?B?NW5EU3VKSWZJL0RGc2MzelBHSmZqS0ZldlNDdllPajNmaXZESFFvTS9FaFhG?=
 =?utf-8?B?d1g4RzVTb3psNWovbzBFYWNSb0FzclRleG9TVnJQUjhXQ2NsTEwzWmgySjQz?=
 =?utf-8?B?eUZzbjg2ZzFxOEpyRFlDTnBFaHV4aDhZVGk3YnVXWFlKRCttS0h6S2ZVV09F?=
 =?utf-8?B?aEFqNXhQK2pYbnRVNUlSZ0hOSVRTeURPYnhsUW5KSU02NjZSc29EeVFDcjB0?=
 =?utf-8?B?elNGcnB4T2JZWXFBL2tOL0VBVG16MFZPZzlhTFJUOGorcjlQRGJCaG54a1g4?=
 =?utf-8?B?MHM3aHRGL3lpTlBqZytoSTdwNUlMVFIyMnFtOGI1eHFzY1djTUtnT0dxTytB?=
 =?utf-8?B?ZHprOFFBb3o0UU11dnBDWFJtVnpOQ3IvNU9lWjM3L1IrakVhS1dXTEZ4cWtH?=
 =?utf-8?Q?n4YXEAxb007VdH2IcF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65197329-f734-480b-baff-08de4dc8f3a5
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 08:44:21.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+a0xQB2HieIr1enDjENIHkb0zUsKkaY/DEkpQHC+GlcDTQvsSQHcJJWJJd0Ut60
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8897

Thank you, Sakari for the feedback.

On 12/22/2025 5:37 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Tue, Dec 16, 2025 at 05:13:22PM +0800, Bin Du wrote:
>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
>> called ccpu. The communication between ISP FW and driver is using commands
>> and response messages sent through the ring buffer. Command buffers support
>> either global setting that is not specific to the steam and support stream
>> specific parameters. Response buffers contain ISP FW notification
>> information such as frame buffer done and command done. IRQ is used for
>> receiving response buffer from ISP firmware, which is handled in the main
>> isp4 media device. ISP ccpu is booted up through the firmware loading
>> helper function prior to stream start. Memory used for command buffer and
>> response buffer needs to be allocated from amdgpu buffer manager because
>> isp4 is a child device of amdgpu.
>>
>> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
>> ---
>>   MAINTAINERS                                   |   3 +
>>   drivers/media/platform/amd/isp4/Makefile      |   3 +-
>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      | 314 +++++++
>>   .../media/platform/amd/isp4/isp4_interface.c  | 786 ++++++++++++++++++
>>   .../media/platform/amd/isp4/isp4_interface.h  | 141 ++++
>>   5 files changed, 1246 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7aa17c7e71d6..cccae369c876 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1145,7 +1145,10 @@ F:	drivers/media/platform/amd/isp4/Kconfig
>>   F:	drivers/media/platform/amd/isp4/Makefile
>>   F:	drivers/media/platform/amd/isp4/isp4.c
>>   F:	drivers/media/platform/amd/isp4/isp4.h
>> +F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>   F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
>> +F:	drivers/media/platform/amd/isp4/isp4_interface.c
>> +F:	drivers/media/platform/amd/isp4/isp4_interface.h
>>   
>>   AMD KFD
>>   M:	Felix Kuehling <Felix.Kuehling@amd.com>
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
>> index de0092dad26f..a2a5bf98e912 100644
>> --- a/drivers/media/platform/amd/isp4/Makefile
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -3,4 +3,5 @@
>>   # Copyright (C) 2025 Advanced Micro Devices, Inc.
>>   
>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>> -amd_capture-objs := isp4.o
>> +amd_capture-objs := isp4.o \
>> +		    isp4_interface.o
>> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>> new file mode 100644
>> index 000000000000..d571b3873edb
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>> @@ -0,0 +1,314 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_CMD_RESP_H_
>> +#define _ISP4_CMD_RESP_H_
>> +
>> +/*
>> + * @brief Host and Firmware command & response channel.
>> + *        Two types of command/response channel.
>> + *          Type Global Command has one command/response channel.
>> + *          Type Stream Command has one command/response channel.
>> + *-----------                                        ------------
>> + *|         |       ---------------------------      |          |
>> + *|         |  ---->|  Global Command         |----> |          |
>> + *|         |       ---------------------------      |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |       ---------------------------      |          |
>> + *|         |  ---->|   Stream Command        |----> |          |
>> + *|         |       ---------------------------      |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|  HOST   |                                        | Firmware |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |       --------------------------       |          |
>> + *|         |  <----|  Global Response       |<----  |          |
>> + *|         |       --------------------------       |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *|         |       --------------------------       |          |
>> + *|         |  <----|  Stream Response       |<----  |          |
>> + *|         |       --------------------------       |          |
>> + *|         |                                        |          |
>> + *|         |                                        |          |
>> + *-----------                                        ------------
>> + */
>> +
>> +/*
>> + * @brief command ID format
>> + *        cmd_id is in the format of following type:
>> + *        type: indicate command type, global/stream commands.
>> + *        group: indicate the command group.
>> + *        id: A unique command identification in one type and group.
>> + *        |<-Bit31 ~ Bit24->|<-Bit23 ~ Bit16->|<-Bit15 ~ Bit0->|
>> + *        |      type       |      group      |       id       |
>> + */
>> +
>> +#define CMD_TYPE_SHIFT                  24
>> +#define CMD_GROUP_SHIFT                 16
>> +#define CMD_TYPE_STREAM_CTRL            (0x2U << CMD_TYPE_SHIFT)
>> +
>> +#define CMD_GROUP_STREAM_CTRL           (0x1U << CMD_GROUP_SHIFT)
>> +#define CMD_GROUP_STREAM_BUFFER         (0x4U << CMD_GROUP_SHIFT)
>> +
>> +/* Stream  Command */
>> +#define CMD_ID_SET_STREAM_CONFIG        (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x1)
>> +#define CMD_ID_SET_OUT_CHAN_PROP        (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x3)
>> +#define CMD_ID_ENABLE_OUT_CHAN          (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x5)
>> +#define CMD_ID_START_STREAM             (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x7)
>> +#define CMD_ID_STOP_STREAM              (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_CTRL | 0x8)
>> +
>> +/* Stream Buffer Command */
>> +#define CMD_ID_SEND_BUFFER              (CMD_TYPE_STREAM_CTRL | CMD_GROUP_STREAM_BUFFER | 0x1)
>> +
>> +/*
>> + * @brief response ID format
>> + *        resp_id is in the format of following type:
>> + *        type: indicate command type, global/stream commands.
>> + *        group: indicate the command group.
>> + *        id: A unique command identification in one type and group.
>> + *        |<-Bit31 ~ Bit24->|<-Bit23 ~ Bit16->|<-Bit15 ~ Bit0->|
>> + *        |      type       |      group      |       id       |
>> + */
>> +
>> +#define RESP_GROUP_SHIFT                16
>> +#define RESP_GROUP_MASK                 (0xff << RESP_GROUP_SHIFT)
>> +
>> +#define GET_RESP_GROUP_VALUE(resp_id)   (((resp_id) & RESP_GROUP_MASK) >> RESP_GROUP_SHIFT)
>> +#define GET_RESP_ID_VALUE(resp_id)      ((resp_id) & 0xffff)
>> +
>> +#define RESP_GROUP_GENERAL              (0x1 << RESP_GROUP_SHIFT)
>> +#define RESP_GROUP_NOTIFICATION         (0x3 << RESP_GROUP_SHIFT)
>> +
>> +/* General Response */
>> +#define RESP_ID_CMD_DONE                (RESP_GROUP_GENERAL | 0x1)
>> +
>> +/* Notification */
>> +#define RESP_ID_NOTI_FRAME_DONE         (RESP_GROUP_NOTIFICATION | 0x1)
>> +
>> +#define CMD_STATUS_SUCCESS              0
>> +#define CMD_STATUS_FAIL                 1
>> +#define CMD_STATUS_SKIPPED              2
>> +
>> +#define ADDR_SPACE_TYPE_GPU_VA          4
>> +
>> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
>> +
>> +/*
>> + * standard ISP mipicsi=>isp
>> + */
>> +#define MIPI0_ISP_PIPELINE_ID           0x5f91
>> +
>> +enum isp4fw_sensor_id {
>> +	SENSOR_ID_ON_MIPI0  = 0,  /* Sensor id for ISP input from MIPI port 0 */
>> +};
>> +
>> +enum isp4fw_stream_id {
>> +	STREAM_ID_INVALID = -1, /* STREAM_ID_INVALID. */
>> +	STREAM_ID_1 = 0,        /* STREAM_ID_1. */
>> +	STREAM_ID_2 = 1,        /* STREAM_ID_2. */
>> +	STREAM_ID_3 = 2,        /* STREAM_ID_3. */
>> +	STREAM_ID_MAXIMUM       /* STREAM_ID_MAXIMUM. */
>> +};
>> +
>> +enum isp4fw_image_format {
>> +	IMAGE_FORMAT_NV12 = 1,              /* 4:2:0,semi-planar, 8-bit */
>> +	IMAGE_FORMAT_YUV422INTERLEAVED = 7, /* interleave, 4:2:2, 8-bit */
>> +};
>> +
>> +enum isp4fw_pipe_out_ch {
>> +	ISP_PIPE_OUT_CH_PREVIEW = 0,
>> +};
>> +
>> +enum isp4fw_yuv_range {
>> +	ISP_YUV_RANGE_FULL = 0,     /* YUV value range in 0~255 */
>> +	ISP_YUV_RANGE_NARROW = 1,   /* YUV value range in 16~235 */
>> +	ISP_YUV_RANGE_MAX
>> +};
>> +
>> +enum isp4fw_buffer_type {
>> +	BUFFER_TYPE_PREVIEW = 8,
>> +	BUFFER_TYPE_META_INFO = 10,
>> +	BUFFER_TYPE_MEM_POOL = 15,
>> +};
>> +
>> +enum isp4fw_buffer_status {
>> +	BUFFER_STATUS_INVALID,  /* The buffer is INVALID */
>> +	BUFFER_STATUS_SKIPPED,  /* The buffer is not filled with image data */
>> +	BUFFER_STATUS_EXIST,    /* The buffer is exist and waiting for filled */
>> +	BUFFER_STATUS_DONE,     /* The buffer is filled with image data */
>> +	BUFFER_STATUS_LACK,     /* The buffer is unavailable */
>> +	BUFFER_STATUS_DIRTY,    /* The buffer is dirty, probably caused by
>> +				 * LMI leakage
>> +				 */
>> +	BUFFER_STATUS_MAX       /* The buffer STATUS_MAX */
>> +};
>> +
>> +enum isp4fw_buffer_source {
>> +	/* The buffer is from the stream buffer queue */
>> +	BUFFER_SOURCE_STREAM,
>> +};
> 
> Could you also use the ISP4 (or ISP4IF) prefix for these, please? Many look
> rather generic.
> 

Thank you for highlighting this matter, since these definitions are 
located in isp4_fw_cmd_resp.h, ISP4_FW may be a more appropriate prefix. 
Just to confirm: are you suggesting that we should add this prefix to 
all macros and enums? For example, changing CMD_ID_SET_STREAM_CONFIG to 
ISP4_FW_CMD_ID_SET_STREAM_CONFIG, and BUFFER_SOURCE_STREAM to ISP4_FW 
_BUFFER_SOURCE_STREAM? Our initial thought was that these would only be 
used within ISP and shouldn't lead to any confusion.

> ...
> 
>> diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
>> new file mode 100644
>> index 000000000000..01d5268f7d4c
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_interface.h
>> @@ -0,0 +1,141 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_INTERFACE_H_
>> +#define _ISP4_INTERFACE_H_
>> +
>> +#include <drm/amd/isp.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/spinlock.h>
>> +
>> +struct isp4fw_resp;
>> +
>> +#define ISP4IF_RB_MAX 25
>> +#define ISP4IF_RESP_CHAN_TO_RB_OFFSET 9
>> +#define ISP4IF_RB_PMBMAP_MEM_SIZE (SZ_16M - 1)
>> +#define ISP4IF_RB_PMBMAP_MEM_CHUNK \
>> +	(ISP4IF_RB_PMBMAP_MEM_SIZE / (ISP4IF_RB_MAX - 1))
>> +#define ISP4IF_HOST2FW_COMMAND_SIZE sizeof(struct isp4fw_cmd)
>> +#define ISP4IF_MAX_NUM_HOST2FW_COMMAND 40
>> +#define ISP4IF_FW_CMD_BUF_SIZE \
>> +	(ISP4IF_MAX_NUM_HOST2FW_COMMAND * ISP4IF_HOST2FW_COMMAND_SIZE)
>> +#define ISP4IF_RB_FULL_SLEEP_US (33 * USEC_PER_MSEC)
>> +#define ISP4IF_RB_FULL_TIMEOUT_US (10 * ISP4IF_RB_FULL_SLEEP_US)
>> +
>> +#define ISP4IF_META_INFO_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
>> +#define ISP4IF_MAX_STREAM_BUF_COUNT 8
>> +
>> +#define ISP4IF_FW_LOG_RINGBUF_SIZE SZ_2M
>> +
>> +enum isp4if_stream_id {
>> +	ISP4IF_STREAM_ID_GLOBAL = 0,
>> +	ISP4IF_STREAM_ID_1 = 1,
>> +	ISP4IF_STREAM_ID_MAX = 4
>> +};
>> +
>> +enum isp4if_status {
>> +	ISP4IF_STATUS_PWR_OFF,
>> +	ISP4IF_STATUS_PWR_ON,
>> +	ISP4IF_STATUS_FW_RUNNING,
>> +	ISP4IF_FSM_STATUS_MAX
>> +};
>> +
>> +struct isp4if_gpu_mem_info {
>> +	u64 mem_size;
>> +	u64 gpu_mc_addr;
>> +	void *sys_addr;
>> +	void *mem_handle;
>> +};
>> +
>> +struct isp4if_img_buf_info {
>> +	struct {
>> +		void *sys_addr;
>> +		u64 mc_addr;
>> +		u32 len;
>> +	} planes[3];
>> +};
>> +
>> +struct isp4if_img_buf_node {
>> +	struct list_head node;
>> +	struct isp4if_img_buf_info buf_info;
>> +};
>> +
>> +struct isp4if_cmd_element {
>> +	struct list_head list;
>> +	u32 seq_num;
>> +	u32 cmd_id;
>> +	struct completion cmd_done;
>> +	atomic_t refcnt;
>> +};
>> +
>> +struct isp4_interface {
> 
> How about just "isp4if"? Up to you.
> 

If that's the case, do you mind if i keep it, so i can save a lot of 
conflict and alignment fix efforts in the subsequent patches in the set, LOL

>> +	struct device *dev;
>> +	void __iomem *mmio;
>> +
>> +	spinlock_t cmdq_lock; /* used for cmdq access */
>> +	spinlock_t bufq_lock; /* used for bufq access */
>> +	struct mutex isp4if_mutex; /* used to send fw cmd and read fw log */
>> +
>> +	struct list_head cmdq; /* commands sent to fw */
>> +	struct list_head bufq; /* buffers sent to fw */
>> +
>> +	enum isp4if_status status;
>> +	u32 host2fw_seq_num;
>> +
>> +	/* ISP fw buffers */
>> +	struct isp4if_gpu_mem_info *fw_log_buf;
>> +	struct isp4if_gpu_mem_info *fw_cmd_resp_buf;
>> +	struct isp4if_gpu_mem_info *fw_mem_pool;
>> +	struct isp4if_gpu_mem_info *meta_info_buf[ISP4IF_MAX_STREAM_BUF_COUNT];
>> +};
>> +
>> +static inline void isp4if_split_addr64(u64 addr, u32 *lo, u32 *hi)
>> +{
>> +	if (lo)
>> +		*lo = addr & 0xffffffff;
>> +
>> +	if (hi)
>> +		*hi = addr >> 32;
>> +}
>> +
>> +static inline u64 isp4if_join_addr64(u32 lo, u32 hi)
>> +{
>> +	return (((u64)hi) << 32) | (u64)lo;
>> +}
>> +
>> +int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
>> +		    struct isp4fw_resp *resp);
>> +
>> +int isp4if_send_command(struct isp4_interface *ispif, u32 cmd_id, const void *package,
>> +			u32 package_size);
>> +
>> +int isp4if_send_command_sync(struct isp4_interface *ispif, u32 cmd_id, const void *package,
>> +			     u32 package_size);
>> +
>> +struct isp4if_cmd_element *isp4if_rm_cmd_from_cmdq(struct isp4_interface *ispif, u32 seq_num,
>> +						   u32 cmd_id);
>> +
>> +void isp4if_clear_cmdq(struct isp4_interface *ispif);
>> +
>> +void isp4if_clear_bufq(struct isp4_interface *ispif);
>> +
>> +void isp4if_dealloc_buffer_node(struct isp4if_img_buf_node *buf_node);
>> +
>> +struct isp4if_img_buf_node *isp4if_alloc_buffer_node(struct isp4if_img_buf_info *buf_info);
>> +
>> +struct isp4if_img_buf_node *isp4if_dequeue_buffer(struct isp4_interface *ispif);
>> +
>> +int isp4if_queue_buffer(struct isp4_interface *ispif, struct isp4if_img_buf_node *buf_node);
>> +
>> +int isp4if_stop(struct isp4_interface *ispif);
>> +
>> +int isp4if_start(struct isp4_interface *ispif);
>> +
>> +int isp4if_deinit(struct isp4_interface *ispif);
>> +
>> +int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmio);
> 
> Could you run
> 
> 	$ ./scripts/checkpatch.pl --strict --max-line-length=80
> 
> on the set, please?
> 

Oh, I will change --max-line-length in our checkpatch.pl from 100 to 80 
and fix all the violations. I used to think that the requirement has 
been relaxed to 100 columns based on 
https://www.phoronix.com/news/Linux-Kernel-Deprecates-80-Col

>> +
>> +#endif /* _ISP4_INTERFACE_H_ */
> 

-- 
Regards,
Bin


