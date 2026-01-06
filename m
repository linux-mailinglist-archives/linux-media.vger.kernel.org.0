Return-Path: <linux-media+bounces-49969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD32CF7519
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 09:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A899930A651F
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 08:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9A330B502;
	Tue,  6 Jan 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fBKF+jsF"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010038.outbound.protection.outlook.com [52.101.85.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506841F12E9;
	Tue,  6 Jan 2026 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767688235; cv=fail; b=AEVmV9Nny2W3nQZiTZdwTMHTK1X4LQNn5uH8u8DcoQFKz4Ew7Bzh4x3J4oQpl0muXSw19BwVZHF7iQy1qMbFRzFCyNw0Nil2lMw81WEmEQWMAZVIXLFVYP6RWY2zb1unVxYlGF+UKpe3BFvYv5sl1MklywFoz/VEPjkRR/jDr1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767688235; c=relaxed/simple;
	bh=BKw/ROT6rTngQlCUXywFqIiEHM/33gCmjCUc1U46ngk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Npz+4pJTVleD7Qts/exjFysyQL5Do82WEYz65LRZGsaXU+oaa8XwnITTe1XIBH7DAZTwoDXeEZ6VAJztQg6Kh/L1+muumTK1ZW5PnL6TS6uXKbVzRmeHEB2J1gVlOHFvbcDUTMtMOqXaUF1wM8nxSrYqWeEnMOh8acWCkU8TSr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fBKF+jsF; arc=fail smtp.client-ip=52.101.85.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGRSxvXaRLznQYaVpGDIvK/Mv1PXyp3pliNkNNYSNa9T4AtRDfIGV7cSVKRRFnM1NWQgKSiujxOG8tVjbzVNpuAaDEzYvL4aX8j+fCDrglQdWDZlT7OB8NbpDnkj1ga7/JXiWt0r2NB2xyIO3gBrzYhPYrAQlXkTfVNW+X6ocd68FLTBwxMXXgEk/PC5SPN8X0r5jLNgJTkqp2Xoo6n3AHmC9OMEZsk0NKP+49Jnsm9hV/aS/fYw6u4zSp5YJSIZYctvfff9pf4qPYvcv0BnP/oDM8on1PzJjAiLYZLAjWCj9yB4DbQwaRG2pHMoIFyS8rm24pUfleCXb33+oJABOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lPF6n65doax9sikwzRmBXfR6a6DeauGsO0Zcr5Nh+w=;
 b=V1/8VXMUfauE0ONW6CeasJEGvBpPmHhpV+M0lkDcXoKbPciLj4H9/s5/9fHE/Blx24p4hQDiaO2T1YuAaow+slx9fpLnak6ghj4WBe7I3nYUEvGlGp1ROflYT7yD8gNdHPpu/CPSvSHZKJFf0OdFqVB/wuDnGGtnMNAnAmHvpAOf0qCJhUU7IJM3E5xukhvKV+82an/iJfCCT1KSgFCNOFediiQyEWDJr9pky4Hn+W85j4lx5/tkyDF3ZwPGPjlKX7LX+IUfwZgBXY/rRswuk0ViOOqwGtLRqnO7X+OSB1SqaGRQZqZq7jVZs0AQ2/kbfMSHg7KnmfGeqlKtK74Meg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lPF6n65doax9sikwzRmBXfR6a6DeauGsO0Zcr5Nh+w=;
 b=fBKF+jsFUUp9jPA/HKPZPQzI/RH/T25bvqvt9E+XrnKL3nn0eAgEjX4fAXG22fDGqGqk0yPLyRJbuaIafVo97f+dp6NjalvPVogrwnB5iAVfQCH9jxDZ7AcMgv5k64hSgIkl0JXfgd4pMDzuiM1NXTXNBMTZ1n4aDBYjjhJ3tUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 08:30:27 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 08:30:27 +0000
Message-ID: <d378d8c4-a7b8-496c-9568-dd99138c49a2@amd.com>
Date: Tue, 6 Jan 2026 16:30:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Mario Limonciello <superm1@kernel.org>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-2-Bin.Du@amd.com>
 <aUkOI3ACKMhS7cJ9@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aUkOI3ACKMhS7cJ9@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0005.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::8)
 To LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dda16b9-ec84-45bc-832f-08de4cfdd835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXlWUXM5ZXhWV3diSDRhQnM2WkJnbmM4VkVKcnh2cnBmYk1UNFQzclBQVExT?=
 =?utf-8?B?UytNNGZlb2RUU1VWZEJMelZlZmtRdHZZdTZjQ3hpbDBXNXlSVUo1Z1AxR0xL?=
 =?utf-8?B?MkJRcXNIcEFvczQ4ZjkrSW9RaWwxSUZlU01WZGpwNHFrcFlxdEUrZ3R6eElI?=
 =?utf-8?B?QUZhYWJ3SGlZMVNwUTMxUDVVK2NWOGxaRlhoYWZjZ08yOS8yVTdJYmlCNkcr?=
 =?utf-8?B?REhkREtlb3hiL2FESUdpOGthUnRqUVRUbUtIRGY5akVsMTJvWGM4U01iT1ZI?=
 =?utf-8?B?OGpMOFREeDZtdERERG1XTDBCdVZRbHo0a2NLdGF6NVJzcVBPUlZNL1V2ZVpJ?=
 =?utf-8?B?V2p6enpPMVJSUnhaeHFsK3BkaG55V1ZaOUs2ajFzOWdHWXdlWUlWbkJ2RU1x?=
 =?utf-8?B?YkVKbGhYbW1ScC8ybENwZ3hqVzNPcm13TGIzbHVjSXhPTHlhVDRFZ2laeEsx?=
 =?utf-8?B?cExBSXJTN3dIb0R2bDVPQi9uUnlMVitSdWkvS2VNUEpSOXFrMGhBOVVMeGg1?=
 =?utf-8?B?VS9SR3djWFhTQXBySnV4VUlzbzh2aGFBVzFnb2FUT1VyVFZ6NW1EamlQOVV1?=
 =?utf-8?B?SHZ2RGdnd2FveDh3QVpZd0VZR1d3RFVvaWttQjhwakhrQVFUUWFPY3RzNDB6?=
 =?utf-8?B?QWliNTllKzlWVFhjankwYW13TytpV2k4NEEybUFwYjFJWm5DMXhpNXBkT3JW?=
 =?utf-8?B?SWlZMjBERzAxV1RNcmFLT1ZjQjhFWVQrVjJZblY4ZFMvLzNTdGNyN3hlZHVE?=
 =?utf-8?B?WmdpQzZQTFA5S3JONkNVYlFKZUZsRXhoZmtuTUs2bmtPelFZUzdIQlFDVEJk?=
 =?utf-8?B?RE9wdk9QbjRDcEtqdnQ0OGVSRmNPdW5zUXc2R3daQVVIYjlXWHBZRWRDUzhD?=
 =?utf-8?B?ZW1xYmhneVhYQXpXNVNyc2h1WDQveGNuV0R0L3drdkdpZFJpYmM0akxPKzZR?=
 =?utf-8?B?Mk5CbEp2aDVGY1p1UlNPN1M5OEl1cGxCaGhuSGwzK1kySE5PVGVGSVk2U0Ni?=
 =?utf-8?B?UWFqOVMyUkNHQWZlVktwc1I1alFDeWJoZldaam1mcGZLanlFcTh5azVGUnBv?=
 =?utf-8?B?WCtKbVJOV2JYMzFpOXl5TFhTQytPVG4yS1dtc2dQTmZUeDgyeUhtSWR2S3Vz?=
 =?utf-8?B?eHJNK2J2RHNhM2hXRE5sVkRFcHR4L2NDNzAvZ1ptS091WlNhMm8xQTNLSlYv?=
 =?utf-8?B?QWMweVR0SFpEbGRNSUJocm4wbENHdWE2d3k0ZURVS0FLT08veHlFd3dMcUln?=
 =?utf-8?B?aExiT1BabS8xblQ1a1ZWZkxwempubjQyY0I3SlB4WFEva0dBbng3akp5VFlX?=
 =?utf-8?B?YUp6ZnpiTVNFbm85UWV4WVJ3TzE2eGNDSldmRnVOMVlVa3VjQ00yYXZ3ZDlV?=
 =?utf-8?B?WEVISXQ0MFAxdWc0cm5HOFYzUVB2Q1d6enRnaFMxN0puQ2o4R1BJSXZPOWpw?=
 =?utf-8?B?U3BTcUp3azVuWEJDTi84NFNDUXNMWFdXL3YwVlgyVnlxU2M1UjZLcm92Ry8r?=
 =?utf-8?B?OFAyS2hzWENKc2NiZjE4TjZHSjJuYWQ1d0VaN0l2dE9Xby82YWtSeklEV1U2?=
 =?utf-8?B?b3ZHSWFPWHlYMVY5TVhQV0lla2ZnSDFtTHRtVDhDVEFVZjZSai9CVjN2Qnlp?=
 =?utf-8?B?Ymxod0JVYktMb25MRGU0aEdDTUlsdENrZG9QOG9OZzhINVEySlVTNVZLRXM4?=
 =?utf-8?B?MmJONjJhZERNU1VDVzdWeCs0NSs3MEM2Y21hN3Fsd2s3UjJTSGJzcG5nSEVv?=
 =?utf-8?B?TVJ1N0VYZk91K0ovbTd6REVsZHFabEU4WGJKSGJpSmVMQ2JkRXkzcDZYT0t4?=
 =?utf-8?B?dy9uUW9kNW9EbHVLSm5xanZsTnlWYXpKTHpWSjF3VVJWY2c3UzQxTzI0YWp2?=
 =?utf-8?B?MExyM1lJdGVJK0VONm5ieUsvVlc5QkE1cFg4Mkt3clUxdlpOV0NTWk1uOFJB?=
 =?utf-8?Q?3xhBt4FQW7VCa3rdbzXOx2ooq6rKJj/y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3UwaU5Ydk9BWE0ya0VweVRJeUJVckU2akFTMGRMaGhCeVppelNvMG1NeGJJ?=
 =?utf-8?B?Q2pKSzNGK2lpR3FrRVZiUXRGbzMweENpNTBnY21zY1dKY0xvVHMreUNQdS9v?=
 =?utf-8?B?aWMzZUVqUzFmb01oNGphWDIyUEw5S2JYZCtJQ3lGTXNXQnZLOGR6cEZONDhw?=
 =?utf-8?B?N3ltSU9SeXVhZVRuWjZyT2p0dVVmSFE5d0U1a0NIejd0VitVQzNmUHB6aERG?=
 =?utf-8?B?YmlTUUtOSDJZS1gvcHg5TzlLRFdROEUvM1J1QldQSDJ3VFpuVzl4L1F3dy9U?=
 =?utf-8?B?N0dBcU01MUc0QjVUUGVocGZ1ZEFXL1dLbWxtb1p0Vk5tSUJWb25BSEViWHE3?=
 =?utf-8?B?bjYxa0haOTIrbkJkUzErLzZ5cHhacGxpdFpRVWZLbXZUNmxQdjBTODRqTGVh?=
 =?utf-8?B?S0ZUbG04WFIvUGJveWVUekhUUDNNT1RCL3V5WTIvU0duUWdSL2NsUDVOeW1u?=
 =?utf-8?B?NUVzSlFBTVlWeHkvS2lNeXd6RlppSG92eThXVjJTRmY4T0RNb1VTNzRLcWRY?=
 =?utf-8?B?Mnk1WlJpVDhhaVpodzNyNkRaVExMMEp2NnFYb2lGR2p1OFAxSmxpU1p3Qkk0?=
 =?utf-8?B?VjZxbGZVanZnbHVFN3hqY3p5enozUGNiT2RaRHVlN0VxZ0xqVEVFNE00TGQ1?=
 =?utf-8?B?N29ialZyWTIxYkhRdThCSHpuNk90a1BFaUU4NS81cHkvTUI3UHdpR3Z6UW9Q?=
 =?utf-8?B?Y3RuRjVOc216R0RIOUx6OENSVEZhQUZBUHF5SFR5eDN6cExtdllDWTlaeWJs?=
 =?utf-8?B?VUMvOFc5dWtKajQyeTg0ejdWVnQ1MVhMR2dEVC9kbXJ0ZmpwRnMyOEt1L1dP?=
 =?utf-8?B?QURmb29reDREVTlRN0dvWmZScDY5QUpmVTZQUktvNDNsaVZ6akQySjIzQkQ2?=
 =?utf-8?B?djl1dHR3eEwzS3lDeUwwQ3c1VjdXdFVuejNxN0VOZFhKcFJJbkt5SnNPR0hJ?=
 =?utf-8?B?enlDWnZXZ21HSEZ6QmJmYUNQaSs1clUzMDFFMFpZVWluZHlmTnFBYXhFdTRL?=
 =?utf-8?B?ZFJoL0NJSXVIeGJabTdjWjJQTWlONWlKY1BVYXJRTWRTcjBrVmxjMkJ6YVpX?=
 =?utf-8?B?bnBTcXlEa0tIaWhJdTdIelZWdm5EV1VQM2dQelVZZnp4Nk11ZDFBMnUyYWxj?=
 =?utf-8?B?L0NUUmE5azgxLzdGaWVIVWJZeHB0Zzl5alN2ZGtGYURyTzhkMmhBZzdPQlJJ?=
 =?utf-8?B?VXhuQXBnbTBaSUNZYWo3SHhReTh0bWxyZGowRFhVcGIzeGNXSVVzZ1haeWtW?=
 =?utf-8?B?L2JSNjFzcXExMXgyTmw5Z3ltckg3aVVmUHFLOGRRU3JsMUd0b1VsZEJxTEFr?=
 =?utf-8?B?dHBJWUQyV0lhMDEzRWdibXBzeld2N0hXbGplcG1EQkc1WDZTQ0J5eVdwUGxp?=
 =?utf-8?B?dFk2eU03aHduWHpVbk16N1BWckRxallSZStJaE01WDJRVEo0eHJsdytja0Rl?=
 =?utf-8?B?bDd6dXE3MlJ4dEVXcjRWekk5YmNnSEJMaXBQTmphMFpSM1NpUEVOd1VSUWRF?=
 =?utf-8?B?V2h2dGRtK0FUcm9ZaVFvSjVkOFlXd1c1blZ0a2xnUDFHckttV1diYzFNL3k3?=
 =?utf-8?B?M0wzSVU5SVN6aHVYdURYckR1UnN6S21UVFlBOHRFbi9VQk5DajhYdXFyaVBi?=
 =?utf-8?B?ek9DcUptalNmQ2JYMG5ZbVBMZmRCeTBSdmZhVURReUNOL3N3aDNWbDdKekZU?=
 =?utf-8?B?YlZ6M0lzakdYRnptT1dyQ1dYSlJ0K3ZlYk9VcWtWYlFiVE9EK3JpSG5FSW5s?=
 =?utf-8?B?UHU0TUpLRHJJeUIvYWVHN21QYXFXQUtmSFZ0Y2lkRG96OWtJRE9nWEx4Yy90?=
 =?utf-8?B?RmZVMG9IL056VkVuRHN2citXN3JzYWVsUmxJeS9LbHRsa09FNTVBVXVQNTFh?=
 =?utf-8?B?NkQ3RE92Q2ltK3FsL3lDd0Y2TTQ1SUxCZjluZzlvVTM4eDh0NTk2STcveWJ5?=
 =?utf-8?B?RmdjWG5jZG5tdmwzcEc1K2Q1YmV4cnY5MzJWczNodGFST21XalorekFkL1FF?=
 =?utf-8?B?aXVRZlQ3ZVdrNmZKU1k0b2Y2c2hYQUtTTnBvTG5FWUFSZjJ6eC9qUXc5WnlL?=
 =?utf-8?B?UjZ5dTBBWnEyemFRVi9NYnJtYkNza2NRZE16N2xtc20rbXlVR2VTUW41Y0tr?=
 =?utf-8?B?NGJyU0YxQk85YXhNczZyaEgrdnhQK1p6Q2h6U0tkZytuYWNNc0F3WGxmZGlJ?=
 =?utf-8?B?bGdpUEVjbGZVdDVtajNHT0xQTktNc3lKRTZLVWN2ZmxMbm9Kbm5nOWppMkpM?=
 =?utf-8?B?d2k4a0ZmT2VqWFdYRUp4eXBVTjhoOTRyTEJ4eUdYUUptaWtYWkk1YU95RmVD?=
 =?utf-8?Q?JsUICR1djiNy7cQWZT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dda16b9-ec84-45bc-832f-08de4cfdd835
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 08:30:27.3784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6GXFag4S477SeD1xVwQ3/JVgcYcTtM5qbyedbT8sK2VFL3Rtinj8X2y+HAsFAQQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045

Thanks Sarkari for your review, apologies for my delayed response 
because I wanted to respect your holiday and avoid any interruption, I 
hope this excuse won't appear too lame :)

On 12/22/2025 5:23 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> Thanks for the update. Please see my comments below.
> 
> On Tue, Dec 16, 2025 at 05:13:20PM +0800, Bin Du wrote:
>> AMD isp4 capture is a v4l2 media device which implements media controller
>> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
>> be connected to a remote CSI2 TX endpoint. It supports only one physical
>> interface for now. Also add ISP4 driver related entry info into the
>> MAINTAINERS file
>>
>> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
>> ---
>>   MAINTAINERS                              |  13 +++
>>   drivers/media/platform/Kconfig           |   1 +
>>   drivers/media/platform/Makefile          |   1 +
>>   drivers/media/platform/amd/Kconfig       |   3 +
>>   drivers/media/platform/amd/Makefile      |   3 +
>>   drivers/media/platform/amd/isp4/Kconfig  |  14 +++
>>   drivers/media/platform/amd/isp4/Makefile |   6 ++
>>   drivers/media/platform/amd/isp4/isp4.c   | 132 +++++++++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4.h   |  17 +++
>>   9 files changed, 190 insertions(+)
>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>   create mode 100644 drivers/media/platform/amd/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cd7ff55b5d32..3640a1e3262c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1133,6 +1133,19 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>>   F:	drivers/iommu/amd/
>>   F:	include/linux/amd-iommu.h
>>   
>> +AMD ISP4 DRIVER
>> +M:	Bin Du <bin.du@amd.com>
>> +M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
>> +L:	linux-media@vger.kernel.org
>> +S:	Maintained
>> +T:	git git://linuxtv.org/media.git
>> +F:	drivers/media/platform/amd/Kconfig
>> +F:	drivers/media/platform/amd/Makefile
>> +F:	drivers/media/platform/amd/isp4/Kconfig
>> +F:	drivers/media/platform/amd/isp4/Makefile
>> +F:	drivers/media/platform/amd/isp4/isp4.c
>> +F:	drivers/media/platform/amd/isp4/isp4.h
>> +
>>   AMD KFD
>>   M:	Felix Kuehling <Felix.Kuehling@amd.com>
>>   L:	amd-gfx@lists.freedesktop.org
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>> index 9287faafdce5..772c70665510 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -63,6 +63,7 @@ config VIDEO_MUX
>>   
>>   # Platform drivers - Please keep it alphabetically sorted
>>   source "drivers/media/platform/allegro-dvt/Kconfig"
>> +source "drivers/media/platform/amd/Kconfig"
>>   source "drivers/media/platform/amlogic/Kconfig"
>>   source "drivers/media/platform/amphion/Kconfig"
>>   source "drivers/media/platform/aspeed/Kconfig"
>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
>> index 6fd7db0541c7..b207bd8d8022 100644
>> --- a/drivers/media/platform/Makefile
>> +++ b/drivers/media/platform/Makefile
>> @@ -6,6 +6,7 @@
>>   # Place here, alphabetically sorted by directory
>>   # (e. g. LC_ALL=C sort Makefile)
>>   obj-y += allegro-dvt/
>> +obj-y += amd/
>>   obj-y += amlogic/
>>   obj-y += amphion/
>>   obj-y += aspeed/
>> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
>> new file mode 100644
>> index 000000000000..25af49f246b2
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Kconfig
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +source "drivers/media/platform/amd/isp4/Kconfig"
>> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
>> new file mode 100644
>> index 000000000000..8bfc1955f22e
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +obj-y += isp4/
>> diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
>> new file mode 100644
>> index 000000000000..d4e4ad436600
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/Kconfig
>> @@ -0,0 +1,14 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +config AMD_ISP4
> 
> We've used "VIDEO_" prefix for V4L2 drivers.
> 

Yes, will change it to VIDEO_AMD_ISP4 to meet the convention.

>> +	tristate "AMD ISP4 and camera driver"
>> +	depends on DRM_AMD_ISP && VIDEO_DEV
>> +	select VIDEOBUF2_CORE
>> +	select VIDEOBUF2_MEMOPS
>> +	select VIDEOBUF2_V4L2
>> +	select VIDEO_V4L2_SUBDEV_API
>> +	help
>> +	  This is support for AMD ISP4 and camera subsystem driver.
>> +	  Say Y here to enable the ISP4 and camera device for video capture.
>> +	  To compile this driver as a module, choose M here. The module will
>> +	  be called amd_capture.
> 
> How about "amd_isp4"? That would be aligned with the file names as well as
> the Kconfig option.
> 

Yes, good suggestion. That makes more sense. Will modify the makefile as 
well.

>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
>> new file mode 100644
>> index 000000000000..de0092dad26f
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +#
>> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
>> +
>> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>> +amd_capture-objs := isp4.o
>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
>> new file mode 100644
>> index 000000000000..ad95e7f89189
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -0,0 +1,132 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/pm_runtime.h>
>> +#include <linux/vmalloc.h>
>> +#include <media/v4l2-ioctl.h>
>> +
>> +#include "isp4.h"
>> +
>> +#define VIDEO_BUF_NUM 5
>> +
>> +#define ISP4_DRV_NAME "amd_isp_capture"
>> +
>> +static const struct {
>> +	const char *name;
>> +	u32 status_mask;
>> +	u32 en_mask;
>> +	u32 ack_mask;
>> +	u32 rb_int_num;
>> +} isp4_irq[] = {
>> +	/* The IRQ order is aligned with the isp4_subdev.fw_resp_thread order */
>> +	{
>> +		.name = "isp_irq_global",
>> +		.rb_int_num = 4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>> +	},
>> +	{
>> +		.name = "isp_irq_stream1",
>> +		.rb_int_num = 0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>> +	},
>> +};
>> +
>> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
>> +{
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int isp4_capture_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	int irq[ARRAY_SIZE(isp4_irq)];
>> +	struct isp4_device *isp_dev;
>> +	size_t i;
>> +	int ret;
>> +
>> +	isp_dev = devm_kzalloc(dev, sizeof(*isp_dev), GFP_KERNEL);
>> +	if (!isp_dev)
>> +		return -ENOMEM;
>> +
>> +	dev->init_name = ISP4_DRV_NAME;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
>> +		irq[i] = platform_get_irq(pdev, isp4_irq[i].rb_int_num);
>> +		if (irq[i] < 0)
>> +			return dev_err_probe(dev, irq[i], "fail to get irq %d\n",
>> +					     isp4_irq[i].rb_int_num);
>> +
>> +		ret = devm_request_irq(dev, irq[i], isp4_irq_handler,
>> +				       IRQF_NO_AUTOEN, isp4_irq[i].name, dev);
>> +		if (ret)
>> +			return dev_err_probe(dev, ret, "fail to req irq %d\n", irq[i]);
>> +	}
>> +
>> +	/* Link the media device within the v4l2_device */
>> +	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>> +
>> +	/* Initialize media device */
>> +	strscpy(isp_dev->mdev.model, "amd_isp41_mdev", sizeof(isp_dev->mdev.model));
>> +	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
>> +		 "platform:%s", ISP4_DRV_NAME);
> 
> No need to do this explicitly.
> 

Yes, it is done inside media_device_init, will remove the redundancy here.

>> +	isp_dev->mdev.dev = dev;
>> +	media_device_init(&isp_dev->mdev);
>> +
>> +	/* register v4l2 device */
> 
> Please drop this comment, it's not informational.
> 

Sure, will do that.

>> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>> +		 "AMD-V4L2-ROOT");
>> +	ret = v4l2_device_register(dev, &isp_dev->v4l2_dev);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "fail register v4l2 device\n");
>> +		goto err_clean_media;
>> +	}
>> +
>> +	pm_runtime_set_suspended(dev);
>> +	pm_runtime_enable(dev);
>> +	ret = media_device_register(&isp_dev->mdev);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "fail to register media device\n");
>> +		goto err_isp4_deinit;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, isp_dev);
>> +
>> +	return 0;
>> +
>> +err_isp4_deinit:
>> +	pm_runtime_disable(dev);
>> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +err_clean_media:
>> +	media_device_cleanup(&isp_dev->mdev);
>> +
>> +	return ret;
>> +}
>> +
>> +static void isp4_capture_remove(struct platform_device *pdev)
>> +{
>> +	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>> +	struct device *dev = &pdev->dev;
>> +
>> +	media_device_unregister(&isp_dev->mdev);
>> +	pm_runtime_disable(dev);
>> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +	media_device_cleanup(&isp_dev->mdev);
>> +}
>> +
>> +static struct platform_driver isp4_capture_drv = {
>> +	.probe = isp4_capture_probe,
>> +	.remove = isp4_capture_remove,
>> +	.driver = {
>> +		.name = ISP4_DRV_NAME,
>> +	}
>> +};
>> +
>> +module_platform_driver(isp4_capture_drv);
>> +
>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>> +MODULE_IMPORT_NS("DMA_BUF");
>> +
>> +MODULE_DESCRIPTION("AMD ISP4 Driver");
>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
>> new file mode 100644
>> index 000000000000..7f2db0dfa2d9
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_H_
>> +#define _ISP4_H_
>> +
>> +#include <media/v4l2-device.h>
>> +#include <media/videobuf2-memops.h>
>> +
>> +struct isp4_device {
>> +	struct v4l2_device v4l2_dev;
>> +	struct media_device mdev;
>> +};
>> +
>> +#endif /* _ISP4_H_ */
> 

-- 
Regards,
Bin


