Return-Path: <linux-media+bounces-29274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C4A7980A
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 00:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 624591895EC6
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 22:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D7F1F4CA7;
	Wed,  2 Apr 2025 22:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IGUU15TY"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1620FC0A;
	Wed,  2 Apr 2025 22:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743631339; cv=fail; b=kHFS+R/tuYY/bgWP2aDvhCNkxhCoGuQuksbndRQiXBnHbQw8Ghdhs9o6vQw2C42RjMpiz6BJT9SAEQmcFg6URV+0MNCLCG9vgzmPOV9v9ppDT4YPmDhUabZIvjjisJScAQl30eFrxlK8vOuiqwTCREnbK+Zzhf/t0cfU1gYf8U4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743631339; c=relaxed/simple;
	bh=Ofr/RrlBlpTx2zoB8eI3DMg74fXQG5n32hmz4I1+S1E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JrqorHI0QSEtJr5FGhfgxY53/NPukK2yHn+H08Flml0uNioogYICrXwfdWiZiK61VHg/PNyUAKIFTDBL9I8F1H/Gu6pSviBjpJbwvVV2wHGFN+v/X8EAiVXo2wotcDzJr3r7kA7E6JuD9PF4SglP4UAPf1X8SLugjW1MjDQKHoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IGUU15TY; arc=fail smtp.client-ip=40.107.95.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRa9gjEX7pFO8ckVdfOJsu/hOdjkPssdJLgnFSNpmgHVP8BEqstHRDHcrBYwpKaMlaKq2qpuCihJwgyjz3IUeKx4A2j6rOSmD4x9b5ZbGrmqQsqM3P+qRLk8+jHshnmY725sE16Vdl2uUIRFgh84HylT+jX6mUB/++ObVnzzFcIVm5PHKnrqjfh16uOTOAJ9UPzhwM/BH0BrX3nd1jIBuCtyjgCrdQfbQ0GSb62A62TAyf7dzXxQLWzIOrA1X0oASMY+jsqn05YOWwvsqtwEe8vY2N3vEcHLR24Itd4Xyt19ua8jO88eyIImm6Hijlt/d2SIZuP/d/vVhxf6atT4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8igOegqQBxy4+vnxcXa5dhgwHutv5G/7KbGuXHUi3N0=;
 b=X4aDLWxbc43D0bdQEjbcjAbYDiFwAy5oRunyFZsZt+2yS786mhvxDM3RS89U7OFc9EMr8vsiZX7VEr2iLBlNqTaghHdx1Q1y1JgV3J3y/Oxiad7zp4TEe6p7p+ThYUQgJ4JwuSK52lLRLI6vSEw1lgWtjqACc5NCo+RqU7i4gomjzUv0/zyh4mjKdKOha0Qx97I5QKugEi2yBMKyscS2Dur9600YJe2S2nisH/OXBvxju9iFO2Vz64dF2ZoN+J7Khd7GjhRGzwU2L0x8lVKbFZmZniVyzr8BMDeXNd2YHroqvEmtRtaxdI2brzS8qr4tntG3NXYC/eVDiFwcGhmKpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8igOegqQBxy4+vnxcXa5dhgwHutv5G/7KbGuXHUi3N0=;
 b=IGUU15TYq6fAvH1PDKoL19nENznB8YXLatDnwFaHtayI3WDu3CZqBYXDJnVdBYBzqtHeg6ZunpcCpHpVHfhCrnFmY9yc9F39nJ+WtaTAxcc56czTC2UcpNgbJ6TPqzDzi25GJ0A8AdAQQi48DMj63V7qz4dodnC0oe8vB22MjJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 MW4PR12MB5666.namprd12.prod.outlook.com (2603:10b6:303:188::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Wed, 2 Apr
 2025 22:02:11 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%6]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 22:02:11 +0000
Message-ID: <294624e2-cebe-4c77-9f05-f956b11741a5@amd.com>
Date: Wed, 2 Apr 2025 18:02:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: Add OV05C camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dominic.antony@amd.com
References: <20250228165317.3468075-1-pratap.nirujogi@amd.com>
 <20250228173556.GB14076@pendragon.ideasonboard.com>
 <844a1936-572b-476a-9cab-8797c7da2040@amd.com>
 <20250402001809.GB4845@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250402001809.GB4845@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0067.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::27) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|MW4PR12MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c3185d-c8f5-4727-69d8-08dd723204e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejFkdjlMcDFnUFVKY1dHLy9DL1JzcnQrTXp5ZHRLV2RmYjdRWE1XcVJSQmha?=
 =?utf-8?B?UzBxQTdvejF0bis0UE14M0s5KzFFYzErdnM2TzhYZVp3V1RZK3hucndGQmZG?=
 =?utf-8?B?QjV6NVllN2tWbUJvOE1IYmhnR1RTSVNEMGloUkI5ZU9mVHdXOEVaOUpEdHNa?=
 =?utf-8?B?NHFUVnRlYk9JL2Y3RlVaY3VsMWtaOTBzclJEWHlCT0d3WlBSM1M4Mm5TTjBt?=
 =?utf-8?B?dS9rampKRU9JQVE0TG1TRTA2dlRZYjhDVHJleHAzRndYTlpxMmx4UTVQVHh2?=
 =?utf-8?B?TUZyQ1YyR3FwQWVjZXRRaFF4WDdQMStKZ3JaeUVva0pKL2EzdzV1NHU4OTV4?=
 =?utf-8?B?R2JpUVVheDN4NDZQOU92TnhLL1d4b2YySXdoUUdsTXIxblpXdGh0V1NYU2Ix?=
 =?utf-8?B?VHd2M0dRUHFLU29GT3p1UHgrYWYxemxJRWd1c01ZNDZVNEZxWWZLQ0ZuQ0ty?=
 =?utf-8?B?dVFsV1U0Z3JLTC9WVnV6dnJUYi95ZmFrNW9KTVEyYVdxM0gzOWFKU09YRUhQ?=
 =?utf-8?B?anNXcEJVZkZPRy9HUVVocFNRZ09EQTd0Y05TSnMyQS8xYkN1TEphR2hGTVFj?=
 =?utf-8?B?YXJ6STVjNSsrS1VEMU5qOExTY1NuREExSTdoVEpadVovZUNCRHRHMGE1cFZZ?=
 =?utf-8?B?RVBjd0ppeW1wTjJzaEY1aklhMFJsa0x0UHVLQ2JUYzc1MGpRdjkxME1weTc1?=
 =?utf-8?B?VmJNcTlabGJKK0xid1NVWXJTMmR1cWwxTFQ4K0d3Q1lWY2swczBSalBpZzRp?=
 =?utf-8?B?bTc5ek14Y2U2MlJOczVBc1N5TmZFQXdkTFl6WmhJK1NBM3BHQ2gxMkJZVGNm?=
 =?utf-8?B?Q0tad0I4R0h6WTAxQXYrWnYwb1NZS2J6S0tlWmFqMDlUYjlQTVE1OVM5V21V?=
 =?utf-8?B?dmd2eFU2ek10T0Z3aS9pMjJQZjlxdlY4Q1RLbnVmQjNBd1EwWHNtODFpTjRN?=
 =?utf-8?B?K3hJNGVlcVNwYlZXNmxzb0VaN0VsbXdyc0FmQUJnZ1ZScXd0Z0xHc1QvZkhC?=
 =?utf-8?B?ODc5eUFna083TjlodlgvSWFSdlB2d1pXV3dWOFFJdHNneUJuOUY0K2JUZEc1?=
 =?utf-8?B?UlYwazkyOFFjT0x0VVRoT2h1ODJzM0oxUncvVTV0UFJSamxLZGQ2eHZISGZi?=
 =?utf-8?B?cktucnZHNTdDeDA0REJTODB4d3E4TU13dFdsT3h2VzVTVUVSd3MxanBoS0pJ?=
 =?utf-8?B?ZHB5T09CY2N1YUUzZFRTNHdOOXp2T1BTLzZ1KzcrZUxlcEpEV0tOZW9hMWw0?=
 =?utf-8?B?SHZ6cmhlSFFnTlVCejFOcUJUWTlRaDVSY2dKUDdCeDhQUDF2c0ZkeVRZQnJa?=
 =?utf-8?B?UW5DODdSNUpmZUl1RVd6V2s0TVZyU0YwTmRtM3JCTWR4Ri80cUg5dit2Rldx?=
 =?utf-8?B?NnhjamxBTEsvMnE4VXFzSWVDL0V2Rm1QOGxRTWZWQzhpY21zVHNacnBMWWRm?=
 =?utf-8?B?R0xTM2xmc1M2STBrRmhtWW1nZFJ0L25lNlZxY3ZhUThOMk51T0t2YVZ6elUr?=
 =?utf-8?B?V2FtN3Zlb2ZFOFlmNGdnM01rTlBSSEM1ckh3ZGFROE40am9SeE9kTW11Y2lK?=
 =?utf-8?B?VEVZSVhiNHpYdW4zNklTVGI1QkRMWUZxOEJPcjFVVlNNMjZ3UTdjN3IzRzBu?=
 =?utf-8?B?MEJZcGpsd1UvNm5uUzBVSzY5d0MxclR5NmlGbDloNGFyVDFuQTltdVdlaFlJ?=
 =?utf-8?B?c2NOb3BqanJscWlUZXFpQWNGV0JWUjl0LzlITHRqWDZWVTYxSVpRenZBTVo0?=
 =?utf-8?B?YlJ0ZHloTFQxQlRFTW9JNlNCVCtPckNCODdRODBqandCWlc0U25MZkpGakh1?=
 =?utf-8?B?NkRXbDdBbWxTT3hJWGJjQm9nTUNHSGdzRVJpUEdUT3lDMVRQVVJCVkN2QTVp?=
 =?utf-8?Q?Q4rE7y+/zH0Vp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW5xcGpOZUxqZDI2MmZKRjZMTi9PazRoYVE3TXVtNUEzK29GazlXTzFoYzlV?=
 =?utf-8?B?T285Wm1jaEtqNDI0RTNOVTNYRWc1WjJ3U1h4bVNFajcwRzZ4NmtSa1dkelFC?=
 =?utf-8?B?N2I1U0hXUXdud29nV2VrTFZadXBEeElCUEFleTcvOHhUbVMzZXdxTk1WY1kr?=
 =?utf-8?B?akFUcXdPUUhWWVpmMjFIc2JDR0JZWjdFc3ArODhrR3JPV3k1K0toc0pjZjF2?=
 =?utf-8?B?VGpIUyt3ZFM4SXVibHhEK2Q5ZVBPc3RLZFJNSmd1Vm14SCtpNUVSUnAwZGF2?=
 =?utf-8?B?NCtZbHYxRkh4Rjk5OW1abUFzNDJHSGlyZm13NXUxS29RdWNJdnBjUC93cUdi?=
 =?utf-8?B?NFQ4djRHZFR5cFlFd08xZEs0WEpIRUdDRGtGWEVlQ0Q3enVucnZKZ1A1b0ph?=
 =?utf-8?B?RWtPWGdGUGZ3b3dPbkJZSzZud1paTVRlY2V0T2ZzbHJtRkpuUHRPMzZmVHVm?=
 =?utf-8?B?SmwxSzI3MzR5T1dWQmVCTFlTVXV3bTRHdkk4eEZnQ0xoWXpITlFPV3VINDVD?=
 =?utf-8?B?OVpkbHEwNXRHRVE0Q3ZtN1l0NUFuR0JnT0tBSmVjNnVCcVZGNzZxaVlBcTly?=
 =?utf-8?B?dTdaZ204RUMvV3QvYUFKb1B4SWZlditvVng5SCtudG5jNDR0Y3dTSDJ4TlNW?=
 =?utf-8?B?VnIwSUl5aEtGQlZjaFd0TEIzK1N0eHJZWnVPanVFV0ROU0IwL2lNNElzTWd0?=
 =?utf-8?B?cVFPWWtYK0p3M1plbFBtME5oMmVQNDhKdkRjc2p1b1ZDN3JwWjh0ckFoU0l4?=
 =?utf-8?B?TmZWc2pSbENoVFdEMU9peWFhMG0zVEZRWXVZTnBZazYzaHZ0WlpGakJlUlFv?=
 =?utf-8?B?aUtFZ09RVnRtaDFRNTNKQnA3aitIT3ZaWE94N3dWbDZuaE5YbGdRS2NXMXc3?=
 =?utf-8?B?MmY2NS9iUmdPdXdXZGNSclhrL3BoRDE5cm5FSkQvNnl2VmMzbmpWR1JubmpG?=
 =?utf-8?B?YjBscFpHZCtTZEVWVjU3WVh5enVlMmtsSFRnTUh2cFVPNmhBRjRsOVJKa1VL?=
 =?utf-8?B?anFqcmhSZ3hZcGxGaFFQUFJCSW4zOU9samY4TWJNaVpab0RZbm1qZDM3WkIr?=
 =?utf-8?B?SkhKSmVXVEhqeStncGZHZlRUSDhnamdpdnk4NmhoL3lWNGhoOHZMWGVDbVFo?=
 =?utf-8?B?ZlU4ZkU1VVhFS0hubGVmRDBJSTZoUFEvWGd5VzM5d21oUlo1RHdFVkJmVlZ4?=
 =?utf-8?B?aDk0TkRReWdLczkxNURJNFlqZk9jRnhVbUZkKythRkY3MDdwRVFDSUc4K1hw?=
 =?utf-8?B?UUNsbkI0ZndkSXBMSm9ibDB3MnMybDQ3MGtMaUdac0lsWTJsb2FCeFZzRnpN?=
 =?utf-8?B?dlFWMXorS25DOVI3UWU0N0xFbEQxa2V2M2QyVWVFTlpKL3NCWnJrVDA4em1U?=
 =?utf-8?B?RnpKZFZ0WnBaQUxEV0JiK2l5ZUp0MFZBWDc1eEJ4WVFJUVhheVd5REJETW52?=
 =?utf-8?B?MUV6eDQ3dGFpanhGaktBUGdIMnU1ajJxR2ZzQzlQTlpPODMwNEIwQStiQThK?=
 =?utf-8?B?V2NFTXZZa0lZblNhM1VYOTNTM0d1Tko5T2ViRUZXbXdISVdmOEdDMHF3dFJl?=
 =?utf-8?B?RksrZDlrRjlGRVVXcTRwRDFMS2tFVittQmtRRHB0OUlvaWx4ZjlvZVJPd1A1?=
 =?utf-8?B?Rko4QlR5ZXdZc0p6MWtBYSt3VEUrWU14MGF0OHYrU0dUSUtRb3dmQUFOcFVI?=
 =?utf-8?B?bGFiQkZQN0NMemdjdkViNHZtUUM3WmJoeDhRZDVkSzhiWXNyT0hlWGc2WmZS?=
 =?utf-8?B?REovTG9NVXY4eDk4MDd2aS9WdDcvdFVkcm9MMGJ1N2ErQVRHZVI3MXA0cFFS?=
 =?utf-8?B?aXBab3dYU0prMTN0YkNpVnJNZ2VBdW84bnU2d1dNVGVkSGJlTGhLNEFQVnBy?=
 =?utf-8?B?R2V0SGJBeU1haGs3QXlmaU9HVUo5eVNESHpiNWRrejBjanRuTzZrcVNyTnNy?=
 =?utf-8?B?RUQzTjloaitycnlpS2R0ZWE2dHM5RDJ2T1VNMDlGcFdoaU4zQ3RJT3pCMGg5?=
 =?utf-8?B?KzZjN0xFeVA2ZWZWUzIrYXcrV1RKaDdlMTBrZXVRWFgxdTFpWEZqU2VIK2dk?=
 =?utf-8?B?dEZYZkNMWXlnK01UNlVWaENVcG9OazVEWXJ1REdMTyt5eFkxUmc1MUZNOXJE?=
 =?utf-8?Q?iIVH+xezcZjFcfrAgYPMJ8Hj5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c3185d-c8f5-4727-69d8-08dd723204e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 22:02:11.5057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phlCq3roLIfW8BbyXIColTCz6KCtNoiI9FcR7O6+UoGUQjeoLr/Ax9TY+NgAW/nVX0s0M00RIKLO+Rb5khx/kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5666

Hi Laurent,

Thanks for your response.

Thanks,
Pratap

On 4/1/2025 8:18 PM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hello Pratap,
> 
> On Fri, Mar 28, 2025 at 06:10:41PM -0400, Nirujogi, Pratap wrote:
>> Hi Laurent,
>>
>> Thanks for reviewing and extremely sorry for the delayed response. We
>> have submitted V2 patch based on your review feedback.
>>
>> Can you please help to review latest V2 patch and let us know your feedback.
> 
> Sure. It will take a bit of time though, as my review backlog is big.

Thanks for notifying us.

> Please see below for additional comments.
> 
>> On 2/28/2025 12:35 PM, Laurent Pinchart wrote:
>>>
>>> Hi Pratap,
>>>
>>> Thank you for the patch.
>>>
>>> A few assorted comments to start with, I'll try to do a more in-depth
>>> review later.
>>>
>>> On Fri, Feb 28, 2025 at 11:53:12AM -0500, Pratap Nirujogi wrote:
>>>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
>>>> supports only the full size normal 2888x1808@30fps 2-lane
>>>> sensor profile.
>>>
>>> What have you tested this driver with ? I see no OF device ID or ACPI
>>> device ID.
>>
>> We have tested this driver on the "AMD RYZEN AI MAX PRO 385 w/ Radeon
>> 8050S" target supporting ISP HW v4.1. OMNI5C10 is ACPI HID for this
>> sensor on the target.
> 
> That's interesting. Do you have plans to post a driver for the ISP ?
> 
yes, we are planning to post the ISP driver patches once the dependent 
platform / sensor / i2c patches gets finalized after review.

>>> Please provide a v4l2-compliance report.
>>
>> Please refer the attached screenshot for the v4l2-compliance test
>> report. This test is ran with V2 patch. Fixed some of the compliance
>> test failures on V1 and ensured it is 100% compliant for the supported
>> IOCTLS.
> 
> Could you please post the v4l2-compliance report in a reply to v2, in
> text format instead of a screenshot ?
> 
Sure, will share the report in text format in response to V2.

>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>>    drivers/media/i2c/Kconfig  |   10 +
>>>>    drivers/media/i2c/Makefile |    1 +
>>>>    drivers/media/i2c/ov05c.c  | 1031 ++++++++++++++++++++++++++++++++++++
> 
> [snip]
> 
> --
> Regards,
> 
> Laurent Pinchart


