Return-Path: <linux-media+bounces-35705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5485AAE53AA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 23:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCAF57B0C47
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 21:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78482224244;
	Mon, 23 Jun 2025 21:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QbPczxhW"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531B91E22E6;
	Mon, 23 Jun 2025 21:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715722; cv=fail; b=TOmF/VHmteLaRCPy7jWOYNuvHw6ZN4afK0k8Awb/2uYqar2u4nNj6+FFPdCI7z4T+bH4y/kPHjOmBptfCGDIDB1L8WEQrIp+yD3tBH3lqLe7polgghoYjeougZbFkdXsjd3d8akWnaH4SNZSTkODixcZ8jW9pg/23Yi0bKaSirc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715722; c=relaxed/simple;
	bh=8auUvDyw9NBbMEhg4+jVVVy3rG8ZyZaAJAyfnLqQfVQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZWhfLvXh5wXklp2IN0NK7BtjiwHTDXURuznfdytzm371fS1WkO4XyTJbBBtO7fcCWQi98QSRQo6UH66QHIXJ+HBvldCPQTXbyPBIolGD3BpTIkqk0EvUmrl4Ibt81jpvx9sIeb3K7obhZ5/veLw32XPeCbFx/JPa0WwCoSKAxQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QbPczxhW; arc=fail smtp.client-ip=40.107.237.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hju6L9GFWAnX9ci3BgaibXgPmj9WQS3JapIONnguyJMOkUKMtLQCdolJeK4evAJu6SLo2nvD4hrMHLMae1zaV0OViNQO80S80mBYEj31d5iH4XOemSM7O8d+QUSAKZy+143ZPJKOjNC9OUqArFfpGHvkhgQiLrfmYBnG2lbhs/FfoKALPb65iGNuXW2PYtAvLBIn5vkHlzH/YqtapCTea6zhF27UiOe5OtybnEP0bj+9UVhukzPIbKT3RbnXQDvZNQc3J2het4gWs45txLbBpoZ9B/r5ymKaFgCO5b/ZRzQGT5lpjj231cKC9P+V+pkhSr4Y+dyeQgMjWNjDU3aV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQQKh60Z3WJlSXoPjR9C72LJZc3AlRWHKYwR4tqsTLs=;
 b=IrJ2eHJEX250/BNnh3d1j+/nRIt167mkfusnsdDKvWzWHPJv2bfyD+fYYwVsI5sF9DFlNaGnlV/Nr3kJY8tTFpf59b5/Ck7rVkojwtiFHbWL+Oa55tyuHOGiMcYHD7XxQ8UxHGeXrx137/KRrNLzDlwVpQ6lp3rUPsFeZgzFicJ5WHslwWukV1MNBo30Xoym2YktaXPBdCbSnv+X53A1UeAmsC/j4uWX/oCQ2d4MV2hqucM4hAOlf0MaDJ1/maPQS8QuCGPys3DPn1WImaIl0+Ao12pNCE5g4yf6DkBkKJ4F5p4GSNGfXrFctanLiO7uWv6xCcpToteu2p7n8m8pNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQQKh60Z3WJlSXoPjR9C72LJZc3AlRWHKYwR4tqsTLs=;
 b=QbPczxhWUEi70C1PQk7zcY0yg1tkZaxA81+y3JAjdiQL9U8F8vQ3z6oZeVXiNgBlQkD8yE4YUMCOx310Hds2qgNsNrXU++Tc0lliCqDEa5/tKS4V/SwY92E1lf1oGXij4MwJRbSOo6dXkuZRD2+Lzmbx/SMiaDIvqzGVvxcE4g8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CYYPR12MB8750.namprd12.prod.outlook.com (2603:10b6:930:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Mon, 23 Jun
 2025 21:55:17 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 21:55:17 +0000
Message-ID: <b6425dbe-44e6-47b4-a06b-b9a172a8cac4@amd.com>
Date: Mon, 23 Jun 2025 17:55:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, Svetoslav.Stoilov@amd.com,
 Yana.Zheleva@amd.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
 <20250623120929.GE826@pendragon.ideasonboard.com>
 <aFlU-E_GCHWBXErq@kekkonen.localdomain>
 <20250623134200.GB29597@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250623134200.GB29597@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0003.prod.exchangelabs.com (2603:10b6:805:b6::16)
 To CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CYYPR12MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d96396f-e0c7-472a-2e34-08ddb2a0a43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFFBTWo5UTNmVG1Cc3M2Qm1pMTZxZDNPWXdBVy9YVU5UbjBxbk0vbnc4UEhm?=
 =?utf-8?B?dk5WWkxSZ2JSaW1hWDhvUGhYV2FFQUtENjJYd2ExaEdFVHNPMzZJaVdjRU5M?=
 =?utf-8?B?cDQvRStXQWUzWHMxWWJBZ3lNUzlqYWQ4NEVYT0RuQnhKZk5UaDB6L3IxYkRN?=
 =?utf-8?B?UXdqSVE3ODV1S1V3bVVwWnYxbTNCa1RIdUNWV2x0TjBqUVZwYjduMXN6QS8v?=
 =?utf-8?B?cVpIbEJNd1ZrM1RRaitpemtwbTlBdExBdzVIazJMZU5saTB0VjBWbFZYVUhO?=
 =?utf-8?B?Q2RTRUFpQjBBcHJDQXpiWTNPN2ZycThPWUxRZVNqbGpKL3p3MlE5c0x4VGhM?=
 =?utf-8?B?YlJHYVNvSC93L0hHYTVkR2U0WkhuRUEybHhFYTJ3aEFsSjBvaGQ0bURtUUlO?=
 =?utf-8?B?M0NwQ1k2MldMOCtkVU1ZNHlRenhjUk9JNCtHa3RSZnE5V1plSjFqdkFGbDV3?=
 =?utf-8?B?ZHBNZHNKZkowdVUzV3dmQ1paNENHdTRSL0pra08yWFh4MFE3MmVhUlNaMXZQ?=
 =?utf-8?B?Z1BNV2l0VFBacGhRVkJNMktmMW0yeENLdVNvYzBqNzQzR0RMNXJyR3QraWdZ?=
 =?utf-8?B?YS9sMDBiUW10bXhVa1NiaVpTK3ZLdk1STUROZFVFMDdyYVlzbWlPcThEVWpt?=
 =?utf-8?B?YzhNdEh4STFaQnZxM01lUTh2cVUrWlhnOUt0Ti9wZFZ4M0pmQUdDOUNyVFZO?=
 =?utf-8?B?Nlc2cWdaWlZDWlJkU0h6M1RjN1NwTmtzNjB0RU11bVgyOSthL1Bvb2UzU1ls?=
 =?utf-8?B?eWtEUWNPWXRhMlppaHVrNERCOGNjbmVldzJWV0VpYlQxNXhEbkF0UDhNKy8z?=
 =?utf-8?B?WC95THVCSHdORnZJQlhSd1RTSzlucCtrcXRDU21OR2FENExxMys5YWxBRWRE?=
 =?utf-8?B?N1NHNUFrdVNlWWFOaTd6N2xZZzVic1RrcEhQY2RWQkRtS01Ncm1JNFkrREs4?=
 =?utf-8?B?WlA0T1BDSFJjMjVObjhtbU1KZEpXSDlVUzZMRWl4bnpocnpnL2JwVFc0U1ZY?=
 =?utf-8?B?WWJZWGJ3anRtbklXVEg4bmluUFQ0UEVITnVzcVhzdzhkcnJtdGd5V0QwNGZT?=
 =?utf-8?B?R0hUdDhaNVRNTDBrd21JVHdzcEVsQ0pFbGlHRytiZ2I2TmZUKzYxYWYrNUQr?=
 =?utf-8?B?SnRLeTBQV3lnaGQ2Y3pPYk5jZlo2am0wdWhmbGtrRVFMVi9wVHZzZ0RjeXpy?=
 =?utf-8?B?S21MaHY4MllQdTdTTTJPdXhINXVYbGZZVHRJazhsS3lOUXNlQ0F0azhqTHQ3?=
 =?utf-8?B?aDN4RERYY000ai8zSjZhcnJVM0N2cU10OTdYbEpmNGZGcUlFTVVYMEZpWXRQ?=
 =?utf-8?B?RDVSRDVMbWVTUDlsWWNMR1ZiVlpCb1JDbjdJSklhSkFnY1U2QW5LTjlUcEdk?=
 =?utf-8?B?MnY0RXNWTUtXSzlpbVFWOFpoa2E3dm42YXA2czMzQ2dxOHRmZWJhN1AyeVZW?=
 =?utf-8?B?Z2VRZHVOMzE1OG5xWkk1aE1ubzAvcWxqeW1POEVwWjJyYjVLU2hNbDB1dzRR?=
 =?utf-8?B?MHNSbkhTY3ZYM1paSU0rZmRyTGRrNnlyVkJwaFlaTVhIVWlWMHQvdFFnQmRp?=
 =?utf-8?B?eko4dGJkc0lCNEdYclptbUpDNEwwZTBwaWlLUktpNVRKd2kvOU9wSEVpb1d4?=
 =?utf-8?B?U2NRaVZWVnRNOE5LTll4dzZibHNPK3dJYXdJZXVYMERCeE1Jb3l3My8zN0po?=
 =?utf-8?B?M0hIN0g4ODBmMHo0RXdXWXRGRzkzdmdrVWZuK2dwMmpEUWRXMVVCa3VVdml6?=
 =?utf-8?B?L0c0S0JPNWhGM2dhSDZzSTN4enhrZDdNbEpyWjU4TXBnK0FBbDZFaTZsOEF5?=
 =?utf-8?B?aHhicUpmbmdJYkV6UzBsRWhab0s4MnBFSTVvOVJRZkVwNWdrc3BFREJkTzNy?=
 =?utf-8?B?c3FYeUY4aEtWUEJvWW12MFE1UVBGc2lqL0xibGtPbi9NMjFBTTFlUFVOV3c1?=
 =?utf-8?Q?pMehkZriQs4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3R6TDgyNVBydi9uZ3MrSno5b1RtdWxwdUpDYStNSEczdTJDa2JwdUlmNXZ3?=
 =?utf-8?B?RVdSdjN5UndJTkVmWC96eWdkaTYyV3NIdXFRYUhNZ2Z5bURuMVRGQW9oeFJF?=
 =?utf-8?B?QXp6ZmMvWS8xY3VESC9OaTExSTkwa0JoZ2FtV3dRUkl0QldzNmtZTG5IbEo3?=
 =?utf-8?B?aEMrTWdnekZUbnptZ2VNcGtuMm84ZXplYThMVit1TWM3Y2czUUNhZjkzalpw?=
 =?utf-8?B?SUVLdmtSWEF4OUVFSUpGbGFmZTgxWnBvaHBMcEpWbXZ2Nmg5VkZ0eDROU3lP?=
 =?utf-8?B?aFovLzZrV1pyNWZ4bDZZTC8xZU9jMHAyaTF5Z0N1cU5tcFhDWHJnR0o5aHlT?=
 =?utf-8?B?bnY5M3ZCVVpTblg4cVoxNU9wK3Fia2tsZ05sSFNuc3BZTER2SVpCbkk5RERY?=
 =?utf-8?B?M1ZXamt1UDVrYjBXTGJkcTNSWmE0UFVzVjZtcmdnZVE3MGVHbDMwTXJyaExF?=
 =?utf-8?B?b2J5djkyY0NMNmJvSFgzdGRqMVAvdDNHaU5YeXExcU1yUWhiSkYray82WjZI?=
 =?utf-8?B?UGE5UXpJcmovdnB0VlV0MERhUmtBOFZFYnlrZE9KV0hlbEtrWVhlSFh2UHdN?=
 =?utf-8?B?YTc4bUd2V2plcDZDeDVGd2NINzQzRDJwSGJKNHFxK2lQVHE3ZVdJbEhhZVN0?=
 =?utf-8?B?Zkoya05PMlVLelE2TEFFOThrMEI0MFJhMG5JTFNHNUtwWGdHeVlDVzhJQlVB?=
 =?utf-8?B?Zjc4T1RVZ0Z4dmt3R1Rxa3NVRVJjNHd0eVNwaU9ZT2YxS1QxeENZeWFjd0hQ?=
 =?utf-8?B?UHU0ZXFMY2NjeVNjelpyb0pNME03Q21OOUNZcnFRSGRXb3laT2MzTGZSdXo4?=
 =?utf-8?B?ZDUvQ3ZoUk1GUk9wNlltclY5OGtPRnB6NTdjSUpmeEgvb201Rkp3eXVpYkpU?=
 =?utf-8?B?OVFrVTZZTnpIYkZWUzJOZ3VueDJNRnBreXRZZytTNXNUS2d6KzNXK0Z3Z3BF?=
 =?utf-8?B?cVJkMkF6V3ZXM3JUQ3U1NnFHWVBEOGpzUy9zVlNTTGNTQ2lJWkhmSU5MK2Jz?=
 =?utf-8?B?dGhtTmt0bmk4RmFKeEk5a3d1U0Z5bUx2Y3IzZlVTU2NFNFMycG9Pd2p5TkIz?=
 =?utf-8?B?ejdyYlJ4Q2VWYUZwZmYzOVVRR2VRaU11RC9ONkhZUjM3T25QRFdSa2c0U3Fu?=
 =?utf-8?B?aWVCbElJMi8xZVFTdVAwcjBMOWdXakFrVWNGUVZWVG02ay9NRDYvUTJML01h?=
 =?utf-8?B?OXl3Q1BlVmxQUnlUYzdmSFZGM1lCQ1QwaUtlc2xOc1A2T3RUNmRyTk51MjNK?=
 =?utf-8?B?bmxidkZPVmlvZlhmM1Q5OXF2MlFscnd4bEFFQlJaNFh4OVMxNzkwSHE5ZjQz?=
 =?utf-8?B?SEtRWFZzN2p1QXVrZ3hjK09jOHZrK3h5Z2lqWFVnaHZYOVpGcERsbmQxNjcr?=
 =?utf-8?B?MkE1allWbEZpdmhMMllORDB0NHZCZlhoeVhKWkNldFlRS2ttYmg0RHdYeHR5?=
 =?utf-8?B?OWFhSTF5cGdwVHFsQ2x5Vks1RWZLOTVhZTBKd0hTaTI4YVJWMXh5dzJDMExk?=
 =?utf-8?B?Zmowc05aRWdFTFA4ZWpJQU1XZk8yVEFQNS92a241WXZ6UEZLTVBncjNkL3I0?=
 =?utf-8?B?TXoxcFUwemtmaTJwWU0yTkE4UDJaamtCNmJwR0pwWXZrb2Z0dDhrRHhhdjBi?=
 =?utf-8?B?aDA2bDJPTHZjaE0xZGJPVEwwY09nTWRSZExwOGtJMDF6NlJMU1RWcU1PUmNM?=
 =?utf-8?B?Z1JmejFkV0NYU29maUFSczhFdjdhQVI2YzNRSzBDS0JIRjJHcHliT2RiOFdW?=
 =?utf-8?B?WDBZd2FCTCt3bk15dEx6Y3VhbmdNSkh0YTBrVUN1UTlqWEdPRmREaW1UT0tK?=
 =?utf-8?B?NlVhcE9wcGtOcmlPVnVhVXZIZlo0eTI4eVdqeHhmam1oRHY0am1NT1RoVWJi?=
 =?utf-8?B?YmdoRlcyNndLL0J5NzRsTWtrS1o4allrbkFsQWh4MjZQaEM1V0xkc3YrWnVl?=
 =?utf-8?B?VnhFV1dkUGg1Mmo3ZjM0d0laV0RrYUI3STEzL2tHQ21HNmZucml1Z1ptVldz?=
 =?utf-8?B?ZTh1YjhNaE5LeGpYZ1FqUFBwcmE1K29ZTXROcGZ4UlNVRE9DeG1zeTJoYkhP?=
 =?utf-8?B?Vm45Y0FkYjBSaDltVkZxY2Z6enVSQVp5dVk0MmlSZS9zTFpISElxTURSempx?=
 =?utf-8?Q?LZ9AmCUAmgvL2Ag3BoqhLnYz+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d96396f-e0c7-472a-2e34-08ddb2a0a43e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 21:55:17.8136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMAayd/tpKbw1fISgGo0awRD5sxDHCCKABwrG6dAt46DYpIPxaA0v/LQIRWe1GKmKwNlGuVfZFPLL++Y/N78kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8750

Hi Laurent, Sakari,

On 6/23/2025 9:42 AM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, Jun 23, 2025 at 01:22:00PM +0000, Sakari Ailus wrote:
>> On Mon, Jun 23, 2025 at 03:09:29PM +0300, Laurent Pinchart wrote:
>>> On Mon, Jun 16, 2025 at 07:12:28PM -0400, Nirujogi, Pratap wrote:
>>>> On 6/13/2025 6:02 PM, Sakari Ailus wrote:
>>>>> On Fri, Jun 13, 2025 at 12:55:46PM +0800, Hao Yao wrote:
>>>>>> Hi Pratap,
>>>>>>
>>>>>> Thanks for your patch.
>>>>>>
>>>>>> This patch is written for your camera sensor module, which seems very
>>>>>> different from those already applied on Dell laptops (some of "Dell Pro"
>>>>>> series). Looking into the driver, I think this version will break the
>>>>>> devices using ov05c10 sensor.
>>>>>
>>>>> There never was such a driver in upstream so nothing breaks. However, in
>>>>> order to support these, could you check what would it take to support them
>>>>> using this driver and post patches, please?
>>>>>
>>>>>> I think this patch is better to be validated on existing devices, but please
>>>>>> do some fixes before we can do validation. Please check my comments inline.
>>>>>>
>>>>>> On 2025/6/10 03:42, Pratap Nirujogi wrote:
>>>>>>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
>>>>>>> supports only the full size normal 2888x1808@30fps 2-lane
>>>>>>> sensor profile.
>>>>>>>
>>>>>>> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>>>>>>> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>>>>>>> Co-developed-by: Bin Du <bin.du@amd.com>
>>>>>>> Signed-off-by: Bin Du <bin.du@amd.com>
>>>>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>
>>> [snip]
>>>
>>>>>> Hi Sakari,
>>>>>>
>>>>>> Seems there are already several camera sensors using page-based registers.
>>>>>> Is it a good idea to add page support in CCI interface?
>>>>>
>>>>> Sounds like a good idea as such but I'm not sure how common this really is,
>>>>> I think I've seen a few Omnivision sensors doing this. If implemented, I
>>>>> think it would be nice if the page could be encoded in the register address
>>>>> which V4L2 CCI would store and switch page if needed only. This would
>>>>> require serialising accesses, too. There's some room in CCI register raw
>>>>> value space so this could be done without even changing that, say, with
>>>>> 8-bit page and 8-bit register address.
>>>>
>>>> Hi Sakari, thank you for sharing your insights and guiding us. Could you
>>>> please suggest if we should take up this work implementing the helpers
>>>> in CCI and submit the patch or is it okay to leave it as-is for now and
>>>> take care of updating in future once the implementation is ready.
>>>
>>> I think it can live in the driver for now. Given that the device uses
>>> only 8 bits of register address, I would store the page number in bits
>>> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
>>> available for driver-specific purpose.
>>
>> I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
>> bits are plenty for that. If we add pages to CCI later, this may be
>> refactored then.
> 
> That works too.
> 
Thanks for your support. We will add the page number in the register 
address 15:8 or 11:8 and will update the implementation accordingly in 
the next version.

Thanks,
Pratap

> --
> Regards,
> 
> Laurent Pinchart


