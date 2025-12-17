Return-Path: <linux-media+bounces-49021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1293ACC95BA
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 20:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74DF9309CB92
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 19:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028AC293C42;
	Wed, 17 Dec 2025 19:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R9VSb24p"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698227E06C;
	Wed, 17 Dec 2025 19:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765998369; cv=fail; b=s4VYaqWPIbpvWcT6h3GPkSNXepX/BWNX84kQ3OMvQJSPSZ8jB2wfxrQnZ8lYZGkvvv8N6E5l7qBr7WNpePaNHLES7cFMp9ZJjizuZ+QKJUkbLHC7lIIoBEWkGyvRDraEwdFDHuVxl5CwfU3/GZ4mlu+lMuKJKDbu0DroeMbNWUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765998369; c=relaxed/simple;
	bh=GA/KJ8JqhUTL5dGygxQJEbFPSKcuDn1XCNaDf5DPQDg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fq1y1wSQjFcAuCWVoxntmYtWXj8z8RFQhduiG8DsSTwbaTAIwN5m9nJEp/6xTR8jxN51edMQpoqZlBVv0kfSV72LjJV9PKKV9Fvp4uh43viaWc+oEHW7KaAKPD4qkuPEJ/IMg7r8lXm7/jqeLv4KY07qdcfiFy24eD8dwiNeEWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R9VSb24p; arc=fail smtp.client-ip=52.101.48.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Received: from PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12)
 by SA1PR12MB9546.namprd12.prod.outlook.com (2603:10b6:806:459::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 18:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0BikDpNEYXRPXBIX7oXabOBcE2l9RyKvuD16D5acegcMYiaPMyZmEvVfF568lOG99IgmWUBT1pMrBg7aD2GdbzFlbCKJeHMTTV7HuRNMIKwrWuJrHoj1QYWMvOfGbDwIrUKMq/Vc8YR0g0yA2ZJn0xzfqjn2FZW14bTkpbMDbtFO9ASrytVG+8YeFZRa1zSpTywR+duJiFsNBUYQEtjJ9rh1C7QqmoTn9BcxB9D1t7H/EjiWZk/yJSViF5Jwp7lvnDDa0+qAG2PEvTNGX/iAwvrLUV000ijhRM4eq1DVFNWBo9tHjzIZxuoIaezw+BHZljf0PxJkXF5jaqLocWDFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGSnifSVSTIQiIoRGymskytms3c9NIS09A19wYS+EgI=;
 b=X3wILkR0VXLv0gLRH4mnACCUJWh/Zkr20V85fgvvxPBxfRYUpRN+DmASamLQZ3BERZmhSTae63yUuu7ThygbwbfuIV2QagxuOAL0xsXvKhzgKegeSYY9bMX03xWV8s4X3ZRbLt8nHiWQu86YgZioJXZobGtL2ZqJoIjVLeIPS49ygBviZ+GYw1ANKrfo2F3EPPkP9M1yuEOpzdqD0Yo6VB6TZ0L83LGUoM3fTdljQAxdb4p0evXODpPbxN3Gy2HmWg/0PIOOcoTs7tqTIGwa1sjB332c4KbFXRRzLUdxFbK4UTlMEchK7PXOYfu7jl2cQPsYdA75n679guo+SAbKxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGSnifSVSTIQiIoRGymskytms3c9NIS09A19wYS+EgI=;
 b=R9VSb24phxl2or69oSJl0DN/1RnBYNZrhqtFx4iYPwbEiXwjI/Gr3VLy34A7GfCz7EhPcppOpaznWLCa8sPqe7wRRsNugKzmm7BPDlZ9RAtNtTPqf6zotQyjVsxIo7oaSfiBlWJu1UkqF9aAInnLV1AGW5KlARPsPqkCB0ozcrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 07:47:31 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 07:47:31 +0000
Message-ID: <01a60cf4-0487-450a-8eaa-cba4719b2787@amd.com>
Date: Wed, 17 Dec 2025 15:47:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <aUJddaGQTKJnJIJY@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aUJddaGQTKJnJIJY@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0058.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::16) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
	LV9PR12MB9829:EE_|PH7PR12MB6859:EE_|SA1PR12MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: 617d1d6c-61b8-495b-abe5-08de3d4088bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bDh1OGtoeC9vcnFDWlIyYURNSGtxcFREK3ZLZWFEVzVFOENEWjdYbjVPRGVw?=
 =?utf-8?B?TVNjNXVqMnFyWVpHWDF0SEl5QTcwZ3ZhYzZsWHNnd1lkVkQzaXhoV293STVW?=
 =?utf-8?B?aGRWTXRkcUN2dE5vUTlNM1lHUm1iUG1ZUmFmSVVyZllqWEx1QWdFbnhsTmEv?=
 =?utf-8?B?eXpQc1hxM2wrZUprZld0aFJ3MEl4akNmVi8rSTlWRUJCY01TVDNkSWdvNk0x?=
 =?utf-8?B?bVlTU3N1cWhvMTFIR2k2M1ExN2dFSTcrNmNUdW11ZG5PY2cyMVRacnZ5SUNJ?=
 =?utf-8?B?NTFXcnhYdjVKM0xNbUtjaTRrT0pGUnRTVTJDSVNrTU4zWnV5amc5RVdVMHlT?=
 =?utf-8?B?TTZSblUzOUpOOFlJY2JRa3psbTROclJYSE9VK2R3ZHp2NERFUlRJMFI2c3Zh?=
 =?utf-8?B?WnVBUXY0QnB2dkVjc3hKeC9IZjVWNmxEby82WFZNMlNnWFFWVks0TXYvRFdz?=
 =?utf-8?B?QUQwcHNpb3Z5Zmd5NlA0UVE3dk9xREtvZ1ZKZ09sT1FvRFhIQ2R3UHFHeWVD?=
 =?utf-8?B?cDRPbm13MDBRWERBdDJvMk9ZM3RrbFZmaWt3SVdxdzE3dzhxTGJNTitheHQy?=
 =?utf-8?B?T3VIYkhuZDJWU3RkdEpxeWx0ZDV1amd0enI4WDFyQUJFdFZ0OG5VTFZHeHNW?=
 =?utf-8?B?TlJoNGVRRlB1cXJ1d25vVXVxZTZkQ1U3WU9VKzRDcGN6RG1qU05VbnVuRldE?=
 =?utf-8?B?OU9ZUG1qaS85SVdJY0o0N3o4dXRySGxPMzB0dU45VlVsbjhIMWU1OWZ3Mi93?=
 =?utf-8?B?MUtqZVhSSGpodGErM3FIdXFyTjFTcmQyUHMzZ3BpNUJkS0NzYmt3RlB0M042?=
 =?utf-8?B?dDluTGxEMXl2UUhxTFE3V1RLMENJMVVGOHRrQ1BURk83eDY2MnIxRlNidys2?=
 =?utf-8?B?dGtLVUYvVUxJRVdZQ2NwSXRQSFVBQXZHdmkwdVhUbU5yRjVMZ2p4ZitMNnEv?=
 =?utf-8?B?QW5xY0hDT3RnSFhEV3llRDdWTlQ0WW1qWjdoSUFNOWNOaDZiVVlGZ2lkclFR?=
 =?utf-8?B?VlZCbm9uU2hDZCtnbUFKOC91SXpUYVVlNEt2UWxvWW9DTVVZYk8rbmJrRzVK?=
 =?utf-8?B?SDFzTEpGZmEwRGVBZVlyT05Xa1NsRU8xSVZLVy9LUmZFZFEwdmNZNTFCY21l?=
 =?utf-8?B?eHB2VzJEOERCYXVaUzJNSXJUSkxvVGV4dlVHczR5UGxFOWtuU2hMUnR1clIz?=
 =?utf-8?B?cmRVR3NabENJZ2R1L2x5MUYvbHordjREbHlSSTE1Z0NBNU5OZWlFSGJJQ1pX?=
 =?utf-8?B?RitaTzJaa2RuNnRldUlYNUtHd0lLRGVSc29GS3ZtYXlNb1M4QWNYcXkxVTNm?=
 =?utf-8?B?dEljTGxETGhnU0NTbHp4ZlFhaDRLQUlxZ1o0aldqN3NkdEJWRmg2aGVPcWJ4?=
 =?utf-8?B?NDlJdDhmSHBhemZOUWVOSHJYdnVWUTY2ZUtsd1pmS1Yxd0xRQ3VNZW9Hdm1U?=
 =?utf-8?B?WVRtOUtybnZHYUx1Um1MV1p1MVVOS2lES3A5TEdFKzJUd2xGcC9WbjN1cEp6?=
 =?utf-8?B?blJ2bFBIYmRqaTJFNm5Dek93YlVqbmxERUNmWjl6ZEZiNmZRNkROYjVOS0xl?=
 =?utf-8?B?N3p6cFdQNk0rVDJYSW85RnNTZlpNbXd0dzBUelhTNFV2d2JqVzF1VHRqY0FS?=
 =?utf-8?B?N1NpUnJSb3ZWUzUwaHRBdEtHRHl5VEpyZm5uaTR0QVlWM09vamRNNE1waEJR?=
 =?utf-8?B?aFFDWHZSbHBzRzBuMW1Tb1ZOdjVSTmIvQ2dTcFhiOVgyV2g4QW1WYkRSejE4?=
 =?utf-8?B?Um56SVFQYXlnR2oxcmVnMHQ1UGxKMVMxbjMxVTRkM1lydElyYmYvUGRHaXcx?=
 =?utf-8?B?Wnl3eEFjVlcwdjE1WC9ra2MvNnN2MW5ya001TllYTTcvKzB5RmFERHlLK2hz?=
 =?utf-8?B?VU8rZjloSFRoQjV1TmxXeVdNYzNXWEF4N1F6OGRDQVllMUNlZVJPbFZ1WEtY?=
 =?utf-8?B?OU1QKzYyRFBEaVptaDNZTnJNYzBhR2Uzb2lBYThXWG9mMUhtSGdFOHZsM3ZK?=
 =?utf-8?B?RzVSOWNQMHBBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?c3RGN2ZOR2hCSUVRUlJGT1hNb3Q3SWIvVGlMc3plZWhIWTB1Y1d5Sk4wa3h5?=
 =?utf-8?B?Tmp5eEtuY0JGOWc1a2szN1czN0RBZjdiTVM3SGpPVFhNbEpOZU1VTzdLMGx5?=
 =?utf-8?B?TU9uV0FVbmR0OWM0cm0vZXRCN3d6TmtNNHhSTGR1WWlzSUxTc3ZYR3lKYmRK?=
 =?utf-8?B?NGF4ZVY1OExubTNLdE9IbUdrWVhqZDYxT1FXVWNSK0N5MHZkQnJoKzNSanYz?=
 =?utf-8?B?QnA4WHBtU3ZYeExNcE1YMU1Wem5FTlFnM0pzN2FBWWxqM1h1TGZoNEhpcXgx?=
 =?utf-8?B?UFBvR2h1WnFiVW52VzVjRjZoZW9wZ2lVcjhjNDFhc2gzckhrTURSWmNuTTRk?=
 =?utf-8?B?MG9xL0xpQjc2cURTRjhvVE0wYmlQZ21TWkxYS2RwYzlydDNxcStFRnRoMEJr?=
 =?utf-8?B?Q2wwcVgwbUMvVWFIaTBRdEJrZFd6ejJVT1BXVjVhaHlzblU2SzF1UXllc3pT?=
 =?utf-8?B?MXl4V1lGdE91TXJjaWdkeTNDRUNEdlZkQnFEQnlnQ3JFUmExNXhQY0liRzkw?=
 =?utf-8?B?NGt1Q1ZSTm80WE5kM0J2ck9OdFdXV0lwYkJvdGlkbGFsb2pYWFdwbVlVL0tG?=
 =?utf-8?B?L0llcVQrVWZTSm5nU1hGanJPazU0SmMrU0RQWlMwa0RNMGVuakNKRGx4ODJ1?=
 =?utf-8?B?N3ZjZGtZWjVLaHNRbGVWWUUzKzZ4T3grK1RzM0pvTXNZaksrWnN3djF1MHBQ?=
 =?utf-8?B?aDA3bnFKdWhueGJERkRYQWlnNW92TDN6RUNweWY2Z0Q2QSt6MTN1aE14dWJm?=
 =?utf-8?B?cG81VTRMQmlQOTRTZm1WbVgyOWhUbHhVSFlkdlUxVXR5OUNub3diS3EyOEVZ?=
 =?utf-8?B?eGgwOWZrS2w5S0Q5SlVwenJ3ZXZMOWVndlpraS84WnFvRllHNkJrTTJBN0RC?=
 =?utf-8?B?RlpRNHNaTUpZUkNITzFuQytibjVnazdFUmVDZnNNcmM3N1RWTlRIRXhkV3FY?=
 =?utf-8?B?cDNUNjQ1QWM2Ni84NmV0SDdXVTk3Yk5vaFRnaWVhR25QKzFZUjZ0dzdaWVRS?=
 =?utf-8?B?QnJndVRXODZHSTRScWRmdmRHSkwrUkRXT2w0ZUdxWlZQcXJuMEd2N21tSHM3?=
 =?utf-8?B?YWdOVmlFY05YZzRPa1dZVXd4WmdONGx4eFhycHVvWTRwaXZPT0w3dExVc3Rs?=
 =?utf-8?B?UTF3c3dzVFRkRlhFZENlZysyUWJGT0JzYkJSb1greWd5NHI4akdmRXFlbDdk?=
 =?utf-8?B?WFBwMVg2RUE4NndUZEJad1hIRFBwK2h1NUlQQ3QyYS9URm9DUUd1Z2RnT2RN?=
 =?utf-8?B?M0RPMzVYalZPbTBGZDBCZzRKclFTNmRPYkREU3p1bmJteEZhUXh3SnpsSGRX?=
 =?utf-8?B?NU9VeWFVU0RRSGdWSzhFODJPNjllY01UcElEOTFzYk91SStxNVZpTGdqL2ht?=
 =?utf-8?B?NTlxSXN0eDZhTTJxbE80SkloT1BtVzlSMmJNM1V1TlE5MU9xVWFPS2lWUmFW?=
 =?utf-8?B?RldJSkw2NGlxUmFiU2pNdnc0dkZDUThpcmdlaU5wMnVkbXlZSWhraVhTRnpR?=
 =?utf-8?B?aUVQNWVoQlNCVmovZjRoQ1JQdDRQU0orZVBScDZ3QkNLN1RyQTJ3OXd3UlFi?=
 =?utf-8?B?NGI0WjlXR0ozRWhLRkVHV09GdHh1TGtBMXUzS0V2V0NRcWhONlB3cE9kVFpz?=
 =?utf-8?B?WVRoem9oY3htQU1hSWRiS0w3bjAyTjBWUWppNERVRDd3ZC95NURzSytMVnJK?=
 =?utf-8?B?RWZSalQ4c1gyeWxlZGF4QzJYU1ZXM0kvUURreVpHTk0zSXJBc0pzaTlpT1B2?=
 =?utf-8?B?QjcvM0lUR2xxYzhrMncrazBWeFpLVjU3SXgvbDZkTzY3QUZtdzJKWnRiTGJ2?=
 =?utf-8?B?aFpJcysyK2dSbnZuTFpCKzU3TkFWcy90Z28vZE1CMmJpMmRPd1pLaGFGQmpS?=
 =?utf-8?B?L1RwVDQvZlpPc0Npa0ZVOU95WFFhNGRyRC9TQ2ZFbUcwRkpLQlRjYzRTRDRt?=
 =?utf-8?B?bzFid3VWK0NxWDN6T3BEOXZnWU1xd0FsSjNOempuLzNpMVhuejdCSG1QMzBa?=
 =?utf-8?B?ZXh0Z0N1eEpFc0NudU5MM2pZeE9qQXlLZ2R1WVF5eDNKSlRQSHVxWVlFdTJr?=
 =?utf-8?B?THpEeHdLNUVnSXlZWlpIR2orZ2JWd1BXKzNVREF5am9ZZHk2RUhaSE94Uzcy?=
 =?utf-8?Q?jWqA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 617d1d6c-61b8-495b-abe5-08de3d4088bb
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 07:47:31.6899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iU3US0zqwpjnRaLiMZXE+/tC+jKeVjmAEOKTbAD6DfCqjcq3FDsbBvyIF734q53+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859
X-OriginatorOrg: amd.com

Thank you, Sultan, for your confirmation, contributions, and ongoing 
support！

On 12/17/2025 3:36 PM, Sultan Alsawaf wrote:
> On Tue, Dec 16, 2025 at 05:13:19PM +0800, Bin Du wrote:
>> Hello,
>>
>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
>> (https://ubuntu.com/certified/202411-36043)
>> This patch series introduces the initial driver support for the AMD ISP4.
>>
>> Patch summary:
>> - Powers up/off and initializes ISP HW
>> - Configures and kicks off ISP FW
>> - Interacts with APP using standard V4l2 interface by video node
>> - Controls ISP HW and interacts with ISP FW to do image processing
>> - Supports enum/set output image format and resolution
>> - Supports queueing buffer from app and dequeuing ISP filled buffer to App
>> - It is verified on qv4l2, cheese and qcam
>> - It is verified together with following patches
>> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
>> 	drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
>>
>> AMD ISP4 Key features:
>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>> - Downscale input image to different output image resolution
>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
>>
>> ----------
>>
>> Changes v6 -> v7:
>>
>> - Added missed blank line after some if statements.
>> - Changed the pm_runtime_disable() order in isp4_capture_remove() to align with initialization.
>> - Reset buf_sent_cnt and start_stream_cmd_sent on stream stop.
>> - Removed duplicate buf_sent_cnt and start_stream_cmd_sent reset in isp4sd_pwron_and_init().
>> - Combined isp4sd_reset_stream_info() and isp4sd_reset_camera_info() into isp4sd_uninit_stream() to eliminate redundant stream info reset.
>> - Removed always-false status check in isp4sd_uninit_stream().
>> - Minor style improvements.
>> [snip]
> 
> Hi Bin,
> 
> v7 looks great to me! :)
> 
> For the whole series,
> 
> Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>

-- 
Regards,
Bin


