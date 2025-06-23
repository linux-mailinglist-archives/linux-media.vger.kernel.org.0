Return-Path: <linux-media+bounces-35703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24081AE5354
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 23:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4C21B66D7C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 21:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91B5224244;
	Mon, 23 Jun 2025 21:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PFY6DitE"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B5E19049B;
	Mon, 23 Jun 2025 21:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715517; cv=fail; b=FEhqwcp8IjcOVxNMK4Qq5L/p4mCAgj7u8bvZncTZmSexPGbD6tz8margjA3wVpLYgWeri+vQdvIBCzhRt6ZSsA99uJMpTHBH3ShNVyUZ7Nyazvd6/4MNnrhZQi01IdAmvKB/IDguBHAEkGMFOgsFibw3QBb9XPRJK/RykV8A8UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715517; c=relaxed/simple;
	bh=w7hdVa0E/KU9w22DkjDduzOfhpDrTgMuYYAIOc1pQL8=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tB53EAJQ5H0cZCtPpzqDbYot6mz1c8YmzfKYLmhiikxtVgBE17Wo4wncqvy7UUuQyOxuo+8Df/SmDVPDqKrhNz5cRL/g4pJ7jyC4Fg3xFn3GBMAMeerefs0D9drNeAoa/c70KJHjCaFYiG/Ru6Im01DS9bmfVkd9u5c7S1vCUuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PFY6DitE; arc=fail smtp.client-ip=40.107.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sh/C9HyqKJahP339GfNtFMJvSZvtbHG4ee0u/ZLCPMFsURVyJpyC+an4j5UPyfMudNc6uL4spfTkOIaCcxlQzcguMymZuaObxo57Cx77o5V0cOubj3ETQvtDc+5DPYH8i3J1RoXZ1QIGC0dCJdJTW9vXYA24o/aZ1u9u3FxffAhmvUQbkCzPUuTKECq7MNbcVc3inZIpUfGxrhJ4J/wdVwzGeTBNmpX4IK8eH8tXZsHV8LyZLL/datMIm6MhPYx5Vcne5HCA+q0rQGVyiJWWXrgrz4iT6i0Mo2u0cEZFqSnZrNAFfaZOxkKAc4v3/uJW3TIB+EIBVOC+1AUL2XyqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8Y7ieDekR1a4dqRtpOk3gA4y8UVKbGWgago7BYmDJM=;
 b=rDTnS2ZIAvTpy9+nB4iWiXgJejjGGI2r4YaN58Y2Qy61SOGddR0zpoX8Km7CP60q8KQ+KNuYE9d7cHWjYH+G/7nGOfA2FB+RZxr2Tn5XXZQKM/QnNe76deFvNetMJ5w6W+mAZC8nPhFQ8X+izMojvrY65h1ojvAosR1bIvW/2xF0Dp1XiHMhMUEnzZCNES2mYWBWGsT4GnHwmlFbTuawpBcymB3kxUXY7rbtuii1X3JgYX7wvpQHEKzJ7lw7CzS50thbdd9+iPYCg6fkVARIvc6R+3S7Xp0MVxIvTh4cziBnKyttL1nzJGUpRVqXRj6CVjV7edPCrCn+8K4+jZ+PJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8Y7ieDekR1a4dqRtpOk3gA4y8UVKbGWgago7BYmDJM=;
 b=PFY6DitEAEnHpg8+rP9aBwzDDflIozICkOiFTcPWVTSZCF+Xa/wtIoXMJsy3h3gsN+7sDmEK2KbxDSGZkcitpJhpAzHkmZgs3f06F220lx0g7POH7LRuDFlP8of1ZpZzXjO5xis7fr0yZHfsFhD1f7/FRozLOSwljq0Rg3hlW80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 23 Jun
 2025 21:51:52 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 21:51:52 +0000
Message-ID: <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
Date: Mon, 23 Jun 2025 17:51:48 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 bryan.odonoghue@linaro.org, krzk@kernel.org, dave.stevenson@raspberrypi.com,
 hdegoede@redhat.com, jai.luthra@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com, vengutta@amd.com,
 Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
In-Reply-To: <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0137.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::22) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f414c85-c7ab-4e47-f7b6-08ddb2a0299f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXg4L2t6Y2lRbGNuQmxtSFRMK1dCMmxXdFh2VEZIY0dkaEtKdDVPOXE3di9y?=
 =?utf-8?B?Q2Jma3V6QThQQVhwVDB3cGZUOTRBMXFCNVBPUktKeDllS2txMmwycUFRdWgy?=
 =?utf-8?B?OVpVaUVZL3Y4QmNvT3NGNWw3SjJoWG5wSGJ3UDZZaUtoTlVsL3hSaDJEclM2?=
 =?utf-8?B?enhsYlRIamZzeUdBVGtUZWRhR3pxaDV2UHB1NWkwU3dBLzJTK3d1OTdBZWp0?=
 =?utf-8?B?TmcwbFVyZm9mTTArdVdUemNnbXYwTFBsT3dUazN2SmlnQ0VLTU96MzJGeHNJ?=
 =?utf-8?B?TjdlWHJ0Q0FqUlBKR2xEN3VST0FlVm5QNkEwRG5EQXUxcTA5enp2emdsR2JH?=
 =?utf-8?B?UWpBVFM3RDc1QXlGREVYSG82N2lBNk9zM1NFMGZOTlBsbnltaUxTWHpBM1dB?=
 =?utf-8?B?SVQyaDlxeHdhWk16aWlVTm5MNXlIdEVEMXVrVWhOWFVOcU9yOS9Ubjc5Zjhv?=
 =?utf-8?B?NjVrNDZycVhWNjY0WTIxZ3ljMzNkSnFZNXM0N2xZaGJxMnhxR2ZvK1ZQem42?=
 =?utf-8?B?S3p0Z3BCNCtSUW9mTFIwbGFHalp0T0x3a1NmY2pQOHh3RHl3YmNRN0NBLzFo?=
 =?utf-8?B?MHNxTzBTWXc3Ulc1M01wOVRXQWMzcFB2WHFLTGJ6elVrSGVMUkZWazZ2bGlY?=
 =?utf-8?B?N1h0TDJNZzJ4aXFEaHJwbHlGdUE3S0dubmc2aHFhd1FrZUdIU0RLQ2hqN1FD?=
 =?utf-8?B?bFhUS0xSTHNXMnNSck9aekRYMnZXZXJLWXhMdUtFTHNPQlFWbFd0U3dnSElV?=
 =?utf-8?B?bUg0Zk9iYXZkNEtQdGsxTnVjYVA5UXlTRU5ibm9BWGJIS21CODlqaFhLTExT?=
 =?utf-8?B?YVRaZXdXOWE3SzJkK2xoSEZDK01mZ2ZGUmk1NldkbzhjTmZlN3VBc2R6VFF2?=
 =?utf-8?B?VHVuR3ZEMEhTOXU3dG1xeHllT1dTdnpsVUZlajJNYVNjU0dlWCszZHVmbE5k?=
 =?utf-8?B?ald2eUdvdWVsN0hNZjMvY2R4eHV1Q0ZZbWdSZHEycTlMNWYweUZCN2dEd3Zr?=
 =?utf-8?B?dzE2OHhiaGpRWFp2VG5CUHd2bW1aQXY1emxiSWZKSkpabG9pa2JpRE5yd296?=
 =?utf-8?B?T3hwcGdhZEdZcDhTT3crOUtGRkhpYitJbllzZWNmSDZwVGMzS1BLWU1kNS9y?=
 =?utf-8?B?bVN2emNJdVJFZVRLeTY1cHJuRFQrZk9wVUI2R2JIWFdYa0lyWmFYOUYzdEF2?=
 =?utf-8?B?ZlRYOFhoS2EvZWI5d09HZm1GNDhEZGgzRkUxc3B1cWhJQTBnWCtpSXRZOXo5?=
 =?utf-8?B?L3RzcGgzSW9rZmlwRnV5UXBlZlYxdk82d29sVW9PL3ByandOWVZWNzNXcGlO?=
 =?utf-8?B?bnNtSkN3S3JFYmUzdkpXZlBMa1I3YXh2VjV3enVyakZXZjcyWVUzNkwydkVu?=
 =?utf-8?B?RHJJK29pNXFSSlE1MnJsQk1xeU8wNytiNkxrSEYvWExPRStyT3l6VGxzSnhy?=
 =?utf-8?B?bGl2R0VDeTJ6VVNBV2pEVWZhS0RNSUhqU2gwSmNVWlk5RjNHdDBXRG9LSERQ?=
 =?utf-8?B?dzhIVy9mN2VkSitKMkhxU0pGZG5Uem1tdHlXVXdlZkVWRXRCN1poaUwyc01k?=
 =?utf-8?B?d0MzM2p0M3NlMklGZUxsV0J3WkJjNTVQS09yVUpzQXZzTVNkc2krYllwRzAr?=
 =?utf-8?B?cmZVcFI5TGV3dENnWW1URWNrNUhGbGpsbStlVk1TbllXU3J1WnY1VFZ0cmc3?=
 =?utf-8?B?NkhnMk9ldG5iQWFTSXk4cWNMVGZDdGgzRzRoTGQ1V2Z5NVZKMjBZRFZ3RFJ1?=
 =?utf-8?B?TkdNNy9SUmQyaFA1UENHYlFzcXpJWTkrdTJVSDkxQUVyM3BZVTFDaUNpL2hl?=
 =?utf-8?B?ZnlLMFJTL1hxWmo1L3Q1bkoxU2hoM1hXLzZYZkJpOWlMRXNaSG9WUzhubU5h?=
 =?utf-8?B?S3l1L0FvYWU4cjEvZmlUMGdtUlczVysxL251cTA0azdRQmYwR3NnL0Jjclpm?=
 =?utf-8?Q?CR5l8tOfXDw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09NN3BnQU5McjdLbnpsQWFINEt5SGZxeDh4V1phQUJzY0U5WFZLamtPbGRw?=
 =?utf-8?B?aDlXaTF5cXpaWmNpNng1TW1FbEl5YXEyTGU5bnF3MWJTeVVKbVlKYnR5SFRB?=
 =?utf-8?B?cEsvUGFCbk9HUThDRVU4QVppc3duNk1mcEdnOGxGVTdnekFCRG10VFI2Y082?=
 =?utf-8?B?dUJWV25ndEdEQWR6QzhNTVZXZE1XWnpGY2VRSjQxZ0xmU3k4aXZ5YUF2dFFu?=
 =?utf-8?B?dFhuRGVqR29OM3V5YUlwVGtiOHZNT3ZhUjQyMzIwc3FreHcvTjNxWXdDTTRt?=
 =?utf-8?B?ZUl1V2w5OTlVOUJXVy9UZGVwR01DYXV4MjBpck03N1VFN0xGVk1RY3MxeStk?=
 =?utf-8?B?dVlDWFY1Zmo5Q21KMW9OKzFZMUFCTHRCNDRaS1FRYmVwMk5qSWw1V3J2dlpX?=
 =?utf-8?B?YTgrQUdpU3BWTjlRRk42U1BBSzM1aXN5ZzhDcFN1bG9MWnhLSVJFcWI4Q25P?=
 =?utf-8?B?R01JaUlmZTdtZTJNb0dyMlNqTWhJRWpMK1JLVHZKSjdTaUZjYjIzVmM2VUFz?=
 =?utf-8?B?akx4OVIzNS9hOFJYRHAxMFEybE5iL3NFSGsxbFp2VHRtZjVKSUdlRFRhSXha?=
 =?utf-8?B?RlVBT1FSZmp0czBKOTVoVEFTRmxzOUNTNGxlZkRqRmpaeHR4YVQzZkg3MStV?=
 =?utf-8?B?bURQTVZJdU5SVTNZbndjOFBJZUQzSXFLZTUwejRPUWJ0cHpYOTBkV3RTRnRM?=
 =?utf-8?B?ZE00Y2FWUFZQeEpNQm95MmluQnQ0UzVVeW5RL0dHNkp2Z1NnUlo1RFBXSGJL?=
 =?utf-8?B?Z0VCRkVnc1IwS0VGbzJYcWFHNnU5TUdjOFpsWGlDUHVSRkIzbElYUEpJV0p0?=
 =?utf-8?B?czRjTGNkTHJJKzQrSEdLTkhNVGx3ZVdDNUNRVDNUWlZ1bE93MTFkZ3BBQngz?=
 =?utf-8?B?L1dzdGdkWnlTbTViSDh0QVloWWVFcU9PSEpQcVdlek1VVnZVQlcvYmVNay96?=
 =?utf-8?B?YXpUTVZ0Y1hwU1czeGJ6ZXNuRWZ3Qk5DQ3ZHQU9tVEhMSCtNM1EvajRobDBJ?=
 =?utf-8?B?c1Bta2pUUjMwenVETk8yZzdjeG1HMDlyUGtxa3BrOTR2aTB3dy8vT1JBTXUy?=
 =?utf-8?B?QnlxTStRdW1EaVQ0bFdZSHp5QzVPRFU1SzF4dE5VMEdHMURRNTVFMC9nVzBW?=
 =?utf-8?B?eEdpSXNUZml3K0pObmdUbHZSSHhuVHp0VGd1WEZjSUdkMU85SzJZTytCd2FW?=
 =?utf-8?B?UEZXbHNnUC9jM0kzUU9lKytaRW42YTdEb0QwRFNqemFVSGdIVU5uV1hXY3do?=
 =?utf-8?B?ZTZ6a2RYNjRnbStiMUhLRUNKcVh6NEJMSUM1eUZieE5PclY3V0dlY0FzTjlU?=
 =?utf-8?B?SUtCT2dWanloMUtKdmlscHRXOTlWNlBOTUNXSDhBbzdBTVlRMlFJSHFVL2Rw?=
 =?utf-8?B?S3VqcUdWR0ZaeFVFTTRrNytjRENCNzBXVnZYcSswQk4wTlN3ZjBCZXZ6cjVN?=
 =?utf-8?B?RXExV1JuUFlLWVMvMzNCeGdLV0VRRVhnR3djY0hkblNOZ0xxSVpHL2FxSnF6?=
 =?utf-8?B?L0tkRklQNVlBaGdOQm9jRmlYaUNReGNQZzdlVmtTR0RkWERjdEZOQnBJeFA5?=
 =?utf-8?B?WGZwWHZRWTM2STY2SVNSMzJDSkU4U1VVNi93WFJQRE1ESkhmNzZaaXN4cHdm?=
 =?utf-8?B?K1l0eEJlQytMZ3RpRlQ2dWNXb1lyeit2SDhPUnpaNDNwbndkMCtVZStSa2ZX?=
 =?utf-8?B?OXh1SnBXSnIvRDMwUGlQdW16MXpSeGVhQmNJcnBaR1AxTVNVVXV6NGtJNGRK?=
 =?utf-8?B?dlhUMXhVRXRXdEJYWjJaa3AzTVRzZ2M4L0g4bHAwVmxoN3VIcWprb0pJeUJV?=
 =?utf-8?B?bzVVcDVZS04xN0hzUXE1VkFVOFJoMU56QVVuWE5wRlpqdm10YkFJajF5UEpl?=
 =?utf-8?B?aTdwMWRoRDN2dTYzLzllMDlncThzRnNOUkZockcyZUNwOVVhVVRzbk5HdFdr?=
 =?utf-8?B?dThralVUVG1hSThLeW9ad25MYVg1RXFUbFZoajZ4amxGL3F3d25iSld6NTN3?=
 =?utf-8?B?S3lENEhRSU9YZ3BqVmp5eXU2Q0RWU3M1Y2JCSnVLeHlxMXRtem1YTC9FOHAy?=
 =?utf-8?B?OFFZeit3M2ZtT1pLRktmWVZlUkRnNHYxKzFyaHFNc1piNzVocFhCTXlHOXFZ?=
 =?utf-8?Q?qNkTleRzn7Zko3Ge6ZRWm4/++?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f414c85-c7ab-4e47-f7b6-08ddb2a0299f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 21:51:52.1722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGHkT/o0X5kv+YkHeAM1HobaQjvOo2Ii5sYonN50EtUVbuViNrxVeKyk063DBMOxQNbuSD5CtUKQImRJkUOtEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879

Hi Laurent,

On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
>>> +static int ov05c10_probe(struct i2c_client *client)
>>> +{
>>> +     struct ov05c10 *ov05c10;
>>> +     u32 clkfreq;
>>> +     int ret;
>>> +
>>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), 
>>> GFP_KERNEL);
>>> +     if (!ov05c10)
>>> +             return -ENOMEM;
>>> +
>>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>>> +
>>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency", 
>>> &clkfreq);
>>> +     if (ret)
>>> +             return  dev_err_probe(&client->dev, -EINVAL,
>>> +                                   "fail to get clock freq\n");
>>
>> Let's try to land
>> https://lore.kernel.org/linux-media/20250521104115.176950-1- 
>> mehdi.djait@linux.intel.com/
>> and replace the code above with devm_v4l2_sensor_clk_get().
>>
> Ok, we will verify on our side.
> 
We tried using devm_v4l2_sensor_clk_get() and found its required to add 
support for software_node to make it work with this driver. Please refer 
the changes below and let us know if these should be submitted as a 
separate patch.

---
@@ -645,16 +645,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device 
*dev, const char *id)
         const char *clk_id __free(kfree) = NULL;
         struct clk_hw *clk_hw;
         struct clk *clk;
-       bool acpi_node;
+       bool is_node;
         u32 rate;
         int ret;

         clk = devm_clk_get_optional(dev, id);
         ret = device_property_read_u32(dev, "clock-frequency", &rate);
-       acpi_node = is_acpi_node(dev_fwnode(dev));
+       is_node = is_acpi_node(dev_fwnode(dev)) || 
is_software_node(dev_fwnode(dev));

         if (clk) {
-               if (!ret && acpi_node) {
+               if (!ret && is_node) {
                         ret = clk_set_rate(clk, rate);
                         if (ret) {
                                 dev_err(dev, "Failed to set clock rate: 
%u\n",
@@ -668,7 +668,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device 
*dev, const char *id)
         if (ret)
                 return ERR_PTR(ret);

-       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
+       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_node)
                 return ERR_PTR(-ENOENT);

         if (!id) {
----

Thanks,
Pratap


