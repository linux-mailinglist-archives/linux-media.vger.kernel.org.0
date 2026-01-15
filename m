Return-Path: <linux-media+bounces-50755-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A3CD22F45
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 08:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BBD6303FE22
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 07:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 592D432BF51;
	Thu, 15 Jan 2026 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uYmpLSXZ"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FA72DECA8;
	Thu, 15 Jan 2026 07:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768463484; cv=fail; b=hfR9T5JOpAVagfDt41ZBD/4vr6gJk/hdDq5mERZf318en0f5pV168AvCmF4H2uVQdSNzT73dzWzlLuTA5Q1HWBvaU0N3htHOFKokIrfjSuKYHZM3d1901lAYN3wbLLWwF6/tTHrl4jp9dgOXUb3KTBi9NdAY405nBBtF0o5bkpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768463484; c=relaxed/simple;
	bh=2nGrIQh/q7etGLxHA2oQK400yX/xZjo4hM/NYAXdXrU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UOYW9smhv+ZMinKmFMUJeDHuqZZE8kzdwyea+T4AKa5EwmNl1sKFrN44HPLWwHhF+wSh7f9GyWle8QRq3tsTZYgqmKoQx4jSJJAsUMwrwzwzj2gzDJH1mkSPuy0lwwCTDfGpMUM8rYvM20C7ICJILDaDagvjcocbtyEMLSDNUw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uYmpLSXZ; arc=fail smtp.client-ip=52.101.53.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzPIhBkydUcRA/U6GuqhdYqoXQM+/4kCMGdqq9QKtfqHBe59vSLIM21zxknW8he4sL9bx2tzEn5HgJFyLt8/KJDhZKO8yiqlC76DfJxXb6yr8PDju9T0qnjMDKEfm5MW2uzh/T+HYc8pSPaogzYSUvb8SRHHlhr3BAk1M1ItJzbFk4xUROEqkY9sLVCFF+dwUgo4YU4w/qFFqeBDkgyzrtDJf1rLJbVhNUvqKZOriYp6nvJcipLpfZNXTB0LVQZk1VU90cgM3rDYu9rkW/rUfeuvp4OWKcuD2Q3rWyTF+JSkgkv1LmUsXZcu+4lJrsunYJaRqHi92uvTPgGIDvnItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yXMNv7+aeVcm1t7d7MV1pKKK5wCIhFSyQukuixe4RI=;
 b=yC6ljIL66ER6ABSqumozam7RflZHiTvU1SgFw2vmp5VkaRGGxCj0Yu6RO2d9y53rJHrOFuI+/70wtX14wQ7leND/VL6BTCEMnINhgem6ZldfID5xx5IKLmPLsL51B8086ldTGIDJSGY8OqEgsHldhI0Z05oKDh+9xg2x/6EYKpJV5O4BB1+lhoXcyxSVjRzC/t8aHol04IN8zvpAmCIACBuFfRUR+lnqh1GhkSIaLqb5jFrW/UMkPml+nvxh8TobvN39XNHTznIbfOTb3gvrEnYah9sUnuzbDlvN696fY6pYYerf6mH21M6H7wJ7NTQidlqBtQvdhE8vXmcvkanPBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yXMNv7+aeVcm1t7d7MV1pKKK5wCIhFSyQukuixe4RI=;
 b=uYmpLSXZrAwEoLJeKKC9Ghc6d24/WDeQKDhXhxoMiys84nLvT6GpSi0g6qdE/zztQSKMv0fw1ZSvOj0VfFtTsnQy65ZXn5om5n621azNzsDEyyXTp9g3yjJSdVk+fKgEShUR1FPxZkHqv+sGhCJuA2qvQ/k15jh2eog1X1ScA/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SA3PR12MB7921.namprd12.prod.outlook.com (2603:10b6:806:320::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 07:51:20 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 07:51:20 +0000
Message-ID: <7af839c1-9998-4bc3-b6b3-27dde923fb77@amd.com>
Date: Thu, 15 Jan 2026 15:51:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain>
 <62bd8248-dd8a-4d51-8a85-ad13d3a03180@amd.com>
 <aWgFf998f12tYWYX@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aWgFf998f12tYWYX@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU2P306CA0061.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:39::12) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SA3PR12MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: f8010045-3a07-4d49-6c49-08de540adf11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZC93Q1hDQ3JWMzE1U2pkUkNmYVEvME4yV1VzK0hsaHNqOVdDU2ZFSWtUbjE2?=
 =?utf-8?B?aFN5OHMzcnkrU3pVc3ZkbkJ5dlBzY1E3Vnh6ZUZLdW5mamR4Ti9uSTJGYWJU?=
 =?utf-8?B?T3hKOGJ0SXJNRlBxRWg0OHFLNEhqR0JabFlHWXRRa2NKYXMwR1JVWm9iMVlW?=
 =?utf-8?B?d1Qxb2huWEljYWdFby94YlVMMHc3aVdBNmNzMk5TUnQ5NzQzcWY1KzBkcmtI?=
 =?utf-8?B?ak1OMkNBOGEwRS9iNDBSVmJMcnB6Q2lqTEJRL2NMNVI4U3RyVWExR2RmVmps?=
 =?utf-8?B?R2JRWUtKaS9qZnFXeTQ4MlE0eFBXSzk1aUczZHJnQ01LNmx2V1RqeWd2ekVj?=
 =?utf-8?B?cXBrRFVWMDZnRWQzem1qZDJXMVlCbUE3Nk95d1VKNzRhNVJkZVRieDg2M1Zw?=
 =?utf-8?B?WCsrQkJMUHplUTBnalpWZG9qRXFkbmdFRmNONHc3cXQ4Zm1MdVFuMGJITjFz?=
 =?utf-8?B?K0pxTHhISGdwZjJ4bUdNWjZ5dzJlZEFZa2g0ZzB4cy9aWUozclo5NWl2OE1U?=
 =?utf-8?B?aDJpN05rT2F2b0krY1JzUTZ0Wmt5K085TDRjWjdYRjBQZit2MWhsbEdKdzBR?=
 =?utf-8?B?QzhIUks3a2t1Uzg4SG9zQ3Z2WVVBZ09XTTRteVlJTjU0S2lNeFl3M2RtZ21Q?=
 =?utf-8?B?bHM3Vm4yUnkvZDB2RGNTLzd0SmY0aS9tcThyVFFXZVhta1A0MGtpMVBHVEh6?=
 =?utf-8?B?ZXEyQ3JNRzQ1RUJ4ZDhFeUdaZEJiQVdoRlBSb2E0QkpRTjhmUjRCdmdocmlx?=
 =?utf-8?B?Zlk2eTl0L0Y2L2tZdGhHemJvYXZhNWUvZnhOaG1tbzVKSWhPbFZmZ01CZm1M?=
 =?utf-8?B?cjFxUHh6ZG14YjJEWE41anRmZ3NheTFjYWl2RkVQdjRiNnQ1aGQvSTlzRWxP?=
 =?utf-8?B?WGVUMFBYM0JmL1JxZmtvZHBLa0xxK3RiU1A4SDRFc2RNT2tDTDVwOFpPaU1G?=
 =?utf-8?B?SVJJRjYxUXNEcnlIbnRMczVuVHZBU2dZcHIyNUNGNitlT1ZFOFZhZzAyVHFu?=
 =?utf-8?B?ZGNwUEQ0bm9HaVJhV3VkakVvMEtvbXA3ZE9qQW4zMHV4aEtGVEs4bFhjT2RG?=
 =?utf-8?B?NHkvRkNJRWNJOXo1eUxDRmhuTGFYM0UxSWxYVlRRdTVCdUZ3R3hRUHJ0TzhV?=
 =?utf-8?B?cGNQQll1MTkycEMxVTRicTRMNnd3ZkM5c2Y0YzV3ZXFmOEZWUEJlQzhDN0dv?=
 =?utf-8?B?c2E4SENGOHIzWUp3eG5aQUQ5UVNpbHQwY0Vsb2tPNmtBL0trWE1OZnV1YUdy?=
 =?utf-8?B?MVd5WURxeDloWmh5TG43clYyMndTMHRsYU9TUStBcVJjOGR5Y3EyVHJNV0Ja?=
 =?utf-8?B?eUVXcDdoSitFMDYwSURDeFg4ZE0zK2VucXlqWXFJaTVmT1U0UDJrSGFZeHVp?=
 =?utf-8?B?WGhOMEllZEx2S1Z2bVR4eTlnY3ZLeDc2c3R0YW9jWkM4NXpTS2tGTEEvSHlo?=
 =?utf-8?B?Z1NKcUxsTnhFaXFhYVM1a3lvU1RORnUvTWJJSjBBOGtIUHJuQVFkSUNDMlhn?=
 =?utf-8?B?NmcxdjF1L2p3R0hHVHVvRjZmTnB5VmF4bGttbFZrUldMc3RDemQyQk1vaUpZ?=
 =?utf-8?B?RUJONnRrUElZUnNKU2NWTUdsNStvRWIvK2RlUHEraFlUVWFDbW5KelQ5TGJ0?=
 =?utf-8?B?USs2Z0E0MjdMaitjRW8zNTVlZlFkYkUza1Z5dUhQblQvVFR4Q0YwQytZbVV5?=
 =?utf-8?B?cGV4dlVSbkxYNjh1RGlBSnhnRlNmSE1lTk5heE5EZXFVeVRnRUo0ZC9VSGJs?=
 =?utf-8?B?Z1JxTDZVZGRxU3FWQkdrRjBoS1RldEtIOGgzbkIvZU4xM0ZVUksyM1ZhNURU?=
 =?utf-8?B?VGhKNHVMdnpudFFwNTlMZ3ZRUEhWcHFFdXN1a1IwcXlEUjBIQ1NYWWZMYTQ5?=
 =?utf-8?B?cmVTWTI4RUgvdTVuY3R3U3BBSkpIb3dqY2Y1Wi82Y3c1N0pPT3htT1NkVllt?=
 =?utf-8?B?eVVqTnFsLzhJQStKL0ZXaWhQSEQ4dDhBdUptRzJMTzZCOStMWHFVdUdxWU0v?=
 =?utf-8?B?VmxGMksrRmY4Mldmd2ZXZFpnVkRsMTIvOUlpdHNxeVZCUzZ2bC80QzExZlpw?=
 =?utf-8?B?VXBYeUpwK0NnNmRGUm8vaGR3dm00UkEvcXhDTFMrRlRaczNuWlNDSEVkNW1l?=
 =?utf-8?Q?n6LI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGp1bkFsZXNRQWhlSkxWMGkyZlVsZHJRaTYwNExrdytRbFJHbk5aa0tyOWhH?=
 =?utf-8?B?ZEFPZTlsWjZKSmtZaVhTS2lNT1lmSVY4LzBIQkF0WEQwM3JSM2laYWJEaStm?=
 =?utf-8?B?MmJqVFZ0TjJrWVMrd1NKNlpXQzAxdVU4VGZ0d2pBcHF5R3dHRE45Z2RBcmRH?=
 =?utf-8?B?bmUySHVpNWFOYUhBMEh1Y1pHVTBxMld3SGdOYmU4bUNuUmhiTFF2TjhJMTNO?=
 =?utf-8?B?Q1N0MTBHYnpHeHA4MVBvSDdUNGtOcG1ZRUNOSW1IYXpKVEZuRXNIVGptZC9p?=
 =?utf-8?B?UlAwb2ZkN1VJWHVaS09ERlJTS3VwbGxNK3N3Mnl2elVzaks2Ykg1SE5iUmRP?=
 =?utf-8?B?TTUxUEQ5bEhwNHF5VVh4VUdOSnhoeFByOG4rRTFiTWNnMm1jRFRkSVlZTG91?=
 =?utf-8?B?T3BWQ1EwbkVsbVRzY1hBRnE0OXpxOG1kcFR3dE9ZTVM5NklDeGJWRG5BRndo?=
 =?utf-8?B?eWViZW56TE9SQ05oOEJmbGpXekdrWEdMU1lMSkoxWU0yNjRhK2ZZWUVyeEhu?=
 =?utf-8?B?dXNpZmJWZVVibW5TdlV1Z0tidnB2alJxZTcyUFFUNnJBT21Ea1VvZTIvZjdo?=
 =?utf-8?B?T3ozOHJ6dTBQQjVrcWpGcnRWbjFGRzBvTS9ULytXYmV6TGV1VXJXNWtVNWZw?=
 =?utf-8?B?cHd3RUk2QkVsb2pibWwrcCtKcVl2Skh1aThTcHZUcjNaQWhFSjQrRUpmKzA2?=
 =?utf-8?B?eHg1MnBjUWZhcGRTdlZ0UzJUYk1ybDJldzMxS3M0bmc3Kzc3UE9DQUhrc2o4?=
 =?utf-8?B?Zk0rVU9KN213OG5YRkdRVUNyMEQxZVZQYkVBTTU1TEtYK283ME9Zc2hmT2NQ?=
 =?utf-8?B?SEljb2NvT0ZVYjMyOTB0ckloZmxTWktJTGRzSXhMcWo0SzVVTG5zVk94TkJB?=
 =?utf-8?B?RTRDaXo4aitaMnJTYVc2eFVDeGVuam5aR3hXL2ZMZmd3bUxxOUhwZ2Nvb2V0?=
 =?utf-8?B?bnBsZ0RyU3o3d25iRG5rdy81NDJKenRZeW1tenkyaEUwNnlTa1k2cGJ2UFVQ?=
 =?utf-8?B?UlhBZlZoTnQyUXVHMm5zanM3WmxuZ3RwZzJtQytDblFDak9XODJISnRMOFZJ?=
 =?utf-8?B?VC9NdVNGTGlKbXhrNnZmMkVpcHZLY0thaUtrMllSUkRpUExCUjlBU21qMTlI?=
 =?utf-8?B?T0lndXUwUXNYOFFWM29LTXVUUWNRSUQyWmY0SEwxM29yZFEwcUhJTWpMM25v?=
 =?utf-8?B?bTFqTHpsVlZkOEVRWFJGRHBObHdzRlM4M0xnR3pxNGdUY25NMEJGSnZ5UzBx?=
 =?utf-8?B?THVhcHc4M1k0KytCRTEzbmowZ2gzR2lQTDdSRWFSekdKZTV5enRtV0tCdStI?=
 =?utf-8?B?cWJ2azZaYkJ3alVqbjNoVC9HQkQwblUxcmswYXJSL1hPaUNIdXBSYTluL2dx?=
 =?utf-8?B?MTJEYUVNNWphSy9jY2tubEhTWnZMd1J1K3U5TWN2bEJGRXJ6eU5aQVZCRjJT?=
 =?utf-8?B?aHVKdzdSMnZoZWhvUmdpUHl3am9XajcyUHlvbU5wTTZWL2FXZVNma1VXUXlY?=
 =?utf-8?B?LzlRTnhSdHdEeCt1c0UzMEhrc2FYQU9hd1FhWENqYTBlbXhDSkFqYUhiZjVJ?=
 =?utf-8?B?d1N5SnRFQTh4WFpRZHZwV2o1RjRyT1kxMFR2eG1OYnFXWVdLdHhUV283TDRT?=
 =?utf-8?B?QWpXR0F2a252Umxyc0NYRlBlbFNKRllveDhFOWFpa01BUkdIUTFNbkJpb3RY?=
 =?utf-8?B?WFhBS2dpdDVpbkFFTTRjU3hXbmtPMkRDVE1tdDdKZHdOV09UZG9qZG9JR3U0?=
 =?utf-8?B?L3RYQWtQU1NVRUxXWlJpZGZwVGlZM29uWVBuWDFjQkc2ZjY3ZFlINlY2QllS?=
 =?utf-8?B?Wk9iaGlMSW9YYVVzYk8vbnZlOUFxSmpYdC9qb29nbFg5VzJNcnBmSXZtZDBn?=
 =?utf-8?B?eU1WenlsbUlCVGNEUDJkWC9UYWFrdUlLWmhmVnBKV3hFYUwvQnlQRU5EU25I?=
 =?utf-8?B?ZkRYOUJYTlRFRVhIa0xpL3hiZ00xYWYvUE5RZW5ab1F6cDdVZ3JrS0sxREFR?=
 =?utf-8?B?MzBGemtVUGVZa09wd0M3SlhadmlNKzZkK0xKci9McEJyTmtuWUlVdWRKMytL?=
 =?utf-8?B?ZUlqbmVtTVcyemU3QjMzYm9UMmlRQjA1OWNjcE9vbG5Jc25HQTV4RWVGbHMx?=
 =?utf-8?B?RkU3NXR6R2xaSmlJbjZYWms2Mmh2TVpPQWdMd2UrZ2JnMVlLd2hlS3FpNzgx?=
 =?utf-8?B?c2syODl5cU05UGlaNVZJeFpkKzZ2WE1zRUF6NXZyQ3VmUUdKL1hYdEJDaWZv?=
 =?utf-8?B?aGViZ2QxanBUY2V6TDNMNFduNkZ5MXNRUnkvckJKdTJtNXhhZU52VjNWbHdT?=
 =?utf-8?Q?Z9xbnE1DhU+M0JK38A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8010045-3a07-4d49-6c49-08de540adf11
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:51:20.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQ+h3xJIFrd9b/9dvBmaJNe/zIDnN6LYsaJCVscbYTdC/dGUbRKfXlPO+Hl75H/U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7921



On 1/15/2026 5:07 AM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Wed, Jan 14, 2026 at 06:34:34PM +0800, Du, Bin wrote:
>>> The increment could probably be expressed as seen &= ~BIT(i).
>>>
>>
>> Quoted below is Sultan's reply regarding this, Would it be acceptable to
>> leave it unchanged?
>>
>> "Yes it can be, but it adds several more instructions before the loop body,
>> without any improvement to the loop body (the sarx in the loop body is
>> replaced
>> by andn). The right shift trick is faster and this is a hot path (IRQ
>> handler).
> 
> Please see my reply to Sultan.
> 

Yes, I appreciate the instructive ideas from you and Sultan.

>>>> +static int isp4sd_sdev_link_validate(struct media_link *link)
>>>> +{
>>>> +	return 0;
>>>
>>> Uh-oh.
>>>
>>> What is actually being configured via the sub-device? There is no device
>>> node either, is there? Are there plans for future developments, apart from
>>> possibly making the ISP and the sensor controllable by the host?
>>>
>>
>> Yes, you are correct. For the first version, no device node and
>> configuration for the sub-device now. Possible future development plan is
>> under internal discussion.
> 
> You can drop these for now.
> 

Sure, will remove these now and reintroduce them when they're needed in 
the future.

-- 
Regards,
Bin


