Return-Path: <linux-media+bounces-41794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27542B44E00
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D8E27B388F
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 06:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E703D2BEC52;
	Fri,  5 Sep 2025 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UvPEGCyv"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB892BE7B5;
	Fri,  5 Sep 2025 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757054131; cv=fail; b=SVqmT9IjGyBDCV0J70/JHXboxCJFSoyqwg4nLw372nw02Oyar3sGpGA8K4J5+X+gBDunesQkL713magTHKp+pG7TXCgq1apoDDmX07qbaoxJLSHsqBup9NIo0pKs+pUq6ftWeHjezn5hUYBeajDcB8JF8QD5CdhnKEG1TrKw5zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757054131; c=relaxed/simple;
	bh=Kd2I+woHN7A02Y/VQN1Ygf8kIwmQNHRdijuSObBUBXg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bOiYnbshuhIAIyDDXy0EDdvcuENKsIS2eIvxb2bXJaocpOF+smwJCmVjRcAXKH4tRBlXDYm/yNr+W726hlpdoqkGmiXDIGhnvsAh6oEgOGkAVTrSrCkcD+CKqT1QKYheEi+1wXdt4vVSygH2XxaTZOJhV+RP9gXZwEJAFT3N79Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UvPEGCyv; arc=fail smtp.client-ip=40.107.220.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6d6H7L8BIMKpeOxbJ6fAnbmFDJTGMHPAW5yoC07hbBvZorEeMheqJJ3YN1LjUKUAoXi13L0HbRV+mbuzaE1bomlKKtcDggyGvqgLwSfe2zb+img4DgCKp2B72ntJYVGfFGLkQiLYqJ2o9NQlhLn9pS4koTo4/Q8l98wBzsRcddwyoyrvuapn4Nw2zZiNRiTJoofIC/aolU4ROjxac9r9Nj3bmItj6Qj6E5Ga+M6rg1gBl5jDlC6zJgRnhVS+T2eVVO2bREgdKbEs9pnGRxE1cdF5s5Uf8SOkQVbZEjO9gf8RnYRWAl2llKFYGBJYcyIKEplEhKEjFqqBdDTSthNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQkqkwCgValmKm7bVlzPB+osbrptNKaXzkrhvTi721Q=;
 b=e2D1opoQljIj5yNhzMgeQ+T1Z4v9U5Qivv2eIQEZ6ULARKhOvMBk7UYQOpyTwy32WhVqw4iph8DBStT7fYoTCdj48noMNOAeNkUtoDHmlab1EUk1yENyl+9kRYpx1uyrrPVtXteUlPoa1IRcxfrQXbPJaXExBfmPSzxVyPBP3FzQHyUQhmGSJWOl8nWzLCv5EDO3+JrAf4LTeSsrtlxxgFU0qKfuqU5zkz4qstBkD16FdHAkvqQNngpoohKmEOftcRwTwohbCPP3AsFi1YXDl1zv4aub8GU1/w94DzIJ30mVm8lxDcQL+xeJHDF7LnSL4MBnWXbr9ldzFkVP5UC8FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQkqkwCgValmKm7bVlzPB+osbrptNKaXzkrhvTi721Q=;
 b=UvPEGCyvdZlPAqjGcXzyNEQAgG5STP06x6QNBmQjMUD7kcKVxKCrCoLQFsYbQDLW6FvRhL+B58y5QerF5hQ58yWGKPpdkYeedWytFMggQ5W6DP4ocjqSr2kjQ+a6IiCPd4wdxKNSXuokxOsxuSXnGqNpn1Mhrk78o6XSarLMJfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by CH1PR12MB9576.namprd12.prod.outlook.com (2603:10b6:610:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 06:35:26 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 06:35:26 +0000
Message-ID: <92bd4d65-a74c-4123-9a92-b7530699ad25@amd.com>
Date: Fri, 5 Sep 2025 14:35:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Markus Elfring <Markus.Elfring@web.de>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, linux-media@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Anson Tsao <anson.tsao@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dominic Antony <Dominic.Antony@amd.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@amd.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, King Li <king.li@amd.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Phil Jawich
 <Phil.Jawich@amd.com>, Pratap Nirujogi <Pratap.Nirujogi@amd.com>,
 Richard Gong <richard.gong@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
References: <20250828100811.95722-4-Bin.Du@amd.com>
 <3df6474f-ffb7-495f-b976-a380cdb40542@web.de>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <3df6474f-ffb7-495f-b976-a380cdb40542@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0329.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::13) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|CH1PR12MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c64dd84-b013-4fd1-a9b1-08ddec4665bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OElzNmROUkszeTh6dXZrVmFtTGVhOG53ZnVkanZ2R2xudVF1VGx5M2dNRVFT?=
 =?utf-8?B?SFdKalhRV3VVR2xWUnF6KzF5TDZhZFZmUHpTVnZXeExiRHF3TzdwRDR6WDND?=
 =?utf-8?B?WUVBYndnYkY4NGJOV3lRSXJOalRHdnVRK2dZemxEVmU4ZTd4NWZrTmZSU0dm?=
 =?utf-8?B?Wmw5NDI1ZjhIenFVeklFVDdOaDFEVExodThGUmU2RjYzWFpzMjdUdWt0QWcz?=
 =?utf-8?B?RzNaNW9NNTlvVmhBYmxvVXBKRkYrSnFJVFROQ1NYc0hsSGVZVkJTeGk3QTBz?=
 =?utf-8?B?RWx6dXRhbGN5TkFaYlNaQnkvZ2xaVm5sT1JLM1BsQmtxV3cyYkk2ejEzQ3FR?=
 =?utf-8?B?MW5veS9yaUY4UDEyNnpEWi9BM2o5SEpmR3Rqd3hqM0czbUUyTmJGdzJYSEcw?=
 =?utf-8?B?ZGlKS2RVcXFhUjBKYjJIRkp1eDdXZ2NlVDZidHdmUWg4Mm16ZFhxWFE5TmxH?=
 =?utf-8?B?RjgzZGxIZmwyMDRBMnhPNW1WZkJuRmNRVnExZm1EQzUzakRTL0psMWE1TThP?=
 =?utf-8?B?SWZpd21jcnkzcHBRU1hTM2x4ZFZRTzI1WkxpQUpwYXJRSFp2d3Y0d0M1Ylg4?=
 =?utf-8?B?WGVrdm9lNWx2VGRHV0VhRXRuZ28wWHJ3UFg1bDdIVDZ5V0hkbUpiU09MRVln?=
 =?utf-8?B?RGlqaDZIenZtbkxCdGFLNElXeGpMamhSTTFTTEJvUnN6dWlzZmxyMlYwQno5?=
 =?utf-8?B?SmxNZ2R3RU80MEVjWTVrQkgyZTlmZUI1YllRNGpDWlZIYVFlbitGNWF1Tzlo?=
 =?utf-8?B?QXM5UFlOUFFNNXh1TDk1eEs2V0dDRzN3cXc0aWliS0FkR25UK2ZKbm5raHIw?=
 =?utf-8?B?QTYzOUZNNnFHVkZwcTd6bzZkTlFFNFZnekM5bVVzMEtUd1VMWjFPalNNRXhO?=
 =?utf-8?B?aUNaL01rTGptcSttcVB6blU5UndwRktTV1gvOGZweEVFRjl6TUlWTkJLazJO?=
 =?utf-8?B?ZkcwTnh5RE4rNDhlcDY1bkdlUkhDL0k3UUtJVUFSd3djRndjUitieEs3UDB3?=
 =?utf-8?B?MlVweVhKMVh5KzlvQzRaTHJyR1BGSi8vNlJMV1B2MnRBRUlyTkE4MWZRdHlG?=
 =?utf-8?B?MlYrd2xObFAwSVlYRldSUWRDRFBCeUtvdnUxSEJ2NDQ0bVhsMm0vSTRIUlVH?=
 =?utf-8?B?VG5UNzJKdG85TWZGUTNTQ0M4a2xYUG93aTdzQ3VnMzRiSjRLRkZGWDRMWDBs?=
 =?utf-8?B?c0lhbStYc2dObVBvQ0pxNzBBZmMrdlJtb3dEbjZyUGtUYkYxYVF6THdpbUM1?=
 =?utf-8?B?ei93ZU9NRWFKQjdZUHFZdVJYbnpDMFBxbE5pM3ExR2tFQlc2cWpFNkhrdHN0?=
 =?utf-8?B?ODZjRGxmSm1yUXowUDJpbGN0RzRHZmpmNXJheVQybUZVajhvaXVVNjROZDdy?=
 =?utf-8?B?Q1k5YTRBTkdSMzVvR2E4YWVXSVJIZzJiZjVKK2FMQUJsdHZydEp5Q0UwSElP?=
 =?utf-8?B?WXZaT1AwNkFSM2t0M1JYYStKbDhFQUQ2TVRmdFh4Ky9MQzR4eXJuSzZKNmxi?=
 =?utf-8?B?WWw5V2hvNmZDVG5hQU9acWgvV1ZkUmF5bEdESXgvZEhwY3pzRkhHV3VrcFBT?=
 =?utf-8?B?a3kzZm0xZmhkRHc0RU1ENDZtaS9Zbkdhd3lOU1hvQ1kvOXRXUTlyb2lDejZH?=
 =?utf-8?B?ZzhYWGlrbXZMV1NReHdYZGQxZ1NHclRXakhJQkpieTQvWTFaaW9KMWlibTJN?=
 =?utf-8?B?TU5IS2dpKzRUTkRabUFQaGtUcVZZdndDMTFoVnl6eE9DZlNQUnByK29qVjBH?=
 =?utf-8?B?N0pxTEhHNTZlVURFeWFJVmpsVUxJV21QUHhRT0V4ZmZaWVZ1alAvcnBxK1Bs?=
 =?utf-8?B?Z1VkT1RFak9Ybm1idGlmSzRYV2NBTy94eTRhUkRGNXFDU2VBTERCSSsweTNE?=
 =?utf-8?Q?mBNTVAH9JDAX7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1NzYkVCVUZyUytqQnRSbEtpcGhoYWswMURMRG5QTEpIN0JYeXUyN2hCdVFY?=
 =?utf-8?B?RHVLQXNET0dTTko4MTI1cVpIMkVKWkZmTkNscjBZQ2NSVzA5N3RGeGZjRGdP?=
 =?utf-8?B?V09mQ1Bjd3RYRDk3ckVid3plTU9WbGxoa00raFlpZDR6bHBVUTZHVGN1WFgw?=
 =?utf-8?B?ak1iaHVJNnpiM2J3R3NrdFZyN0o3VStlT291QnJrdytEWFpvYjJTV2hrWTNP?=
 =?utf-8?B?RkNlSWZTM1BhUFFzMFk3UGIzYVRVL0p1VHRkS0NDVkY4V0lCazdidlV6R1Jq?=
 =?utf-8?B?UkYrOFZKalMvOXpNZ051SE5XTlFkWXJWako4OWdCb21QdzFYQjgvOUxCOUE4?=
 =?utf-8?B?NnZNbm1RcWhITmJRTm5aaWVjNXlkbCsyTVhrZ2E4MDJ0aFl3RnZpbWlGVjNw?=
 =?utf-8?B?QW1tbVhiOG5WM0ZQZ3NjTDAreHNndksxdVpsQWE2UFJjTm1SVENIUStoUmZV?=
 =?utf-8?B?WW04UGt0c3plcEVodEJvTkpDTjQrT010Wnhad3lhTmxOZ3JYME5BSm1vdUpk?=
 =?utf-8?B?QTRZOWtKMmtXR1ZVSU53U2dkV1NXaVhNWlRmY0hnRWkzNUQxYnZrcVdHS0Y2?=
 =?utf-8?B?YzFUNzZtUWgvT0hzdVJmbnBtSXdDUXYxOHN3T2dxR2NIZHIvYXZUT2xJMkdO?=
 =?utf-8?B?WFc1RC94MXBhWEtqREpPQitKTzNaVzNmY3QrSEd2RTluWVVQSngwaCtQbFN6?=
 =?utf-8?B?Qy9BNFpLT1FMem9Oc1NMdkIySytUeWJFenZNUVBoR3RIdVJjcExscTlBSnRN?=
 =?utf-8?B?VHBLam5lcC9yTjFVdkpuNldMMGxGelVOOTFRL29MeE44eVVITkIrK0JiS2hM?=
 =?utf-8?B?U0VaelMxQ3Y3WFhJd2c3NVc4dU1CL0tWenVYRUZmOXJMSGswN2lXNWozZTRQ?=
 =?utf-8?B?MDdCVXM3WlMzSCt2T0ZWNmJVOEtpd3lzb212ZS9ibHlUYlBoeGdRaG1MVzZq?=
 =?utf-8?B?U1FEVlVremE3L25FYXF0ZlFWT2tKakt1L2xkYzZsNFJnRkV5allENUw5TlhI?=
 =?utf-8?B?c2JWTWcrY0phTFRXaVYxUlNkR1NYc0VOK2RkUjBXb3E5dWpMQ2N2WkF0Q2ZY?=
 =?utf-8?B?SlFsRmR6ajkrU20zWWtYekI3Z20razhyTTB4TlRHQ2JjVFFRTkEzQ3pzaTV4?=
 =?utf-8?B?b1dtU1JWWlpUVm8vQnRFVWJGNkdVMituU0hrckNqZm93M1JjT056QmJidHdo?=
 =?utf-8?B?UXpHRUJrVHlQa0hVSk95aE9XdklYaDBoWmUxU3J0TTFRZmw1cnRHYlZsVHVE?=
 =?utf-8?B?WnFNeFBtMVY4OWFRY0oxNTYyQXZMTlk1YWF5cXRuM2hteW9XK1JJN3FXZXZE?=
 =?utf-8?B?bWxGVGFZUWt2QTJKRTF4QTdWVytpdk5mcGxDd01wQWM1cFN3ZXNTZzVZRHM5?=
 =?utf-8?B?RW1rQ2hrMTlLdmljNDlqdDdVVjh1WXE2dVFKSHVaNkdiUUIwSmRjMElLTUor?=
 =?utf-8?B?MnlLRVFRS2VsOUtRWUZCSnZvT3hlaUJMMk9KRm04WHdsOGh5Q29vbTVZOURl?=
 =?utf-8?B?SzRmanNsMEVlUGRLZ05GKzJ1Q0owcDQ2UmQrUittUVJQYUVydTc1SUNHNlpX?=
 =?utf-8?B?UW01UzlPZGd0QzlieHhqSTBvZlVSRHg3cmRlWjA4RUJSZUVvOGQ3cytsSTZv?=
 =?utf-8?B?YjFGODErdDhYaTNXLzd0S25pNzF1eWFBOUtOeHB0Nk9SS1Rvb29GMnNseWNq?=
 =?utf-8?B?Yk1nbXMzOGdDajVSTDBMNEZicThtT2IxcXBGaHBWNW9oNGE0Z2p2WDhxR2p2?=
 =?utf-8?B?Z0ttQk9JVTVLTzZNUEl3UzJrUEI4Y0lTNHQwcUZJaTArRU1PeHVzS0prNkEy?=
 =?utf-8?B?RlVFR1hKUmttRmw3aGhmZDJvOWhLUTRNWm1PTjZ1SThtWmU0S0Q1NjFOemwx?=
 =?utf-8?B?dmRuWXJ4bE94UTQ5Wi9kNDljMk1xdTNSSHg5enFVUGRkQnAwQWNNaERPRm5v?=
 =?utf-8?B?TTZXbUdzMHNmb3Z3YkVnYXk3eE5Tc1B2UE5uSTVSc1kzOTl4TVc3cEpObGlR?=
 =?utf-8?B?aExuMEc5Mll4ckdjVERxNEVKaG9GQWRMNTh1UzdyVUUwNWlzTWVhL2hTcm1s?=
 =?utf-8?B?V3cweDkyQW1MWWFMZWZuRTd1Sm9PMUhNdjNKMnRmbGVhVm9mN2NudGo0RXBO?=
 =?utf-8?Q?oYy8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c64dd84-b013-4fd1-a9b1-08ddec4665bb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:35:25.7886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4UOQ2XniMnGXfFWIMkpIgHYK835iDNdCuYWZgDGDf4JWjoGnlB6vpNbHE38khSl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9576

Thanks Markus Elfring.

On 9/2/2025 3:48 PM, Markus Elfring wrote:
> …
>> states, stream configuration and mipi phy configuration. This change also
> …
> 
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc4#n94
> 
> 

Very clear guide, will update in the next version and also check commit 
message of other patches in the series.

> …
>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>> @@ -0,0 +1,1096 @@
> …
>> +static s32 isp4sd_fw_resp_thread_wrapper(void *context)
>> +{
> …
>> +		mutex_lock(&thread_ctx->mutex);
>> +		isp4sd_fw_resp_func(isp_subdev, stream_id);
>> +		mutex_unlock(&thread_ctx->mutex);
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(mutex)(&thread_ctx->mutex);”?
> https://elixir.bootlin.com/linux/v6.17-rc4/source/include/linux/mutex.h#L228
> 

Appreciate for catching this, will do the optimization in the next version.

> Regards,
> Markus

-- 
Regards,
Bin


