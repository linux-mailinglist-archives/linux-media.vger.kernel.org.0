Return-Path: <linux-media+bounces-50862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82BD2F647
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 11:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 958E330C7175
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747E535FF46;
	Fri, 16 Jan 2026 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VyStvn8j"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011056.outbound.protection.outlook.com [52.101.62.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F69B31B832;
	Fri, 16 Jan 2026 10:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558322; cv=fail; b=fwcdtS1nkSNW+IlPFK9qFw/vHrqFCCX3UzvByLPMWn8AXwooUe4jHlN1V6WyCKRegeLULUOti7LTc2l6O3jkuK3c2aOVKsyhLJCLoPwZgEajLA1owVjmiiXosaYZknwqnYAJ8otFTnBcTp1fchMCO1kS8JqEMOrtT1WV5Qv00ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558322; c=relaxed/simple;
	bh=euVUiQXx49xz73BBdWHaISP0ZmP7a7B7a1v11Rykv7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z+AEeBH8NrW403SNiZegAIUGRi1VG6MmNsWCJqmXP7Ug4Kg0JWtb9OM6MBtiWXWhlpMGeYAGpoANzEW+SkMQ0tt+F+CyG5x99T2UKP1evqYTxOFrrq2bbTfwZRjGGpCA9twhiwN87J5GlDwtgvkTSZJbA47cwSEuXDVQc0I3V4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VyStvn8j; arc=fail smtp.client-ip=52.101.62.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPFkTmcu9QIkk29OThwa2Ln+Ob/fcCp6LveHngDSCQL4afXvQj4IEGsvbrkZlxdOXjv9qaqth3EI7OJj+MuXBCArSk+Cb1G6F/afC7GOPV6WL8GwDulKc2IpwTUWY2HIjsXQIfHDOOAkfx/I9VmmZ+JwGSqYvZ60buNf6HkwsulQ+N5Zwe1M8xAcCrjqSZCp3WajfcqPKA2V2HiA9MVwtoIQUhtdONmD3IDD0z5hctuHmCa7Wl274XzrLS70zN/W7Lc7OEGUxNNkXojJ0BiNxt4mJKvkrfb7EeiLc9T+pzSqgIZTeGnqjVer9E5k1rNtnCLuUyQH+LP3KZXwKe/tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ln9VBQQhy2nedME84cp+EpdQn/XwuiiG3atrqLoxuwQ=;
 b=V/1joziBIMCh1drNa3DXGUiZ4hJolQx8rlDe8eKSgqF2XizOS8xL/9dMOg2GJ+FBoCKVYFvpnmnjL2h0U6IbXEcKhVTWBwpx/DHxrOczExDnWLHvK/yAJ2uITEU9tYOsXrbAACfd3Ti0DbJ+PrYoz7rB8v4qRaJq/mAipIly1iOZ2KD7k/p4MwExnmtoeuMEDKH69MeH5UoXRHkZEaVDr0ZaRXNXK+BhnJjnJoNNidZwLYw+wiWtGje5tgr9gMgPSfJG/eWhWq53mCpjj2vfYUUApAc15dLiAaP6wEcxMd+pxb+/ID+tTb/rGYklxKVkqVAbSnFTxgMa1fCm6DOR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ln9VBQQhy2nedME84cp+EpdQn/XwuiiG3atrqLoxuwQ=;
 b=VyStvn8jqExIRpi/Mu9eLMTpvVpFGy9NHquGzrqa1sOKss4ixI7u3zc0pDEpnrB0MG+39XYhficiVmzB8hCMNiN+HZcLtaWReaduPQXBjQlfmCV54Nrew8V69UQk3MYnGJ89Uc2DLqQqSl4JZ0OVr6Heoq+pegcMDLLik4syd6E=
Received: from SJ0PR13CA0129.namprd13.prod.outlook.com (2603:10b6:a03:2c6::14)
 by IA3PR10MB8562.namprd10.prod.outlook.com (2603:10b6:208:57a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 10:11:58 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::33) by SJ0PR13CA0129.outlook.office365.com
 (2603:10b6:a03:2c6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Fri,
 16 Jan 2026 10:11:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 10:11:58 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:11:57 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:11:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 04:11:57 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GABnQO3116658;
	Fri, 16 Jan 2026 04:11:50 -0600
Message-ID: <68e9361a-df0d-4209-84ef-29051d0b5a35@ti.com>
Date: Fri, 16 Jan 2026 15:41:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/19] media: ti: j721e-csi2rx: Change the drain
 architecture for multistream
To: Jai Luthra <jai.luthra@ideasonboard.com>, Rishikesh Donadkar
	<r-donadkar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-16-r-donadkar@ti.com>
 <fbae9c01-6a2c-46ee-963a-8e5230b860b4@ideasonboard.com>
 <176849292515.3449975.5983605057289270065@freya>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <176849292515.3449975.5983605057289270065@freya>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|IA3PR10MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c4dff1-155f-4921-c27d-08de54e7aee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|34020700016|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2VpUjh6LzRvNkRERDIrNU1kMDRHNmtrYWhqV1RVZEtoVk5Cais4d3ZINGpo?=
 =?utf-8?B?N3BZWlR3Ym16L3ZkcHd0MEt1d25QOWordERTWDJmWFdpVExWSGMzYURpZ2hq?=
 =?utf-8?B?L0QveDlhVE0yaGd4NC9xMExCZm1pNG9zWmdIaFJyOUpTKzNKUEozUVZZZXU4?=
 =?utf-8?B?Tml6T28vbFgvWnR2YmRLQXpqaUNYZWVKQlN3TVFiZjFiMkU1WnVWUDhXdEN0?=
 =?utf-8?B?RVJHdTdjU0YwMjh2czFvNVNPL1lXY0YwRk9OaVJUMUNJNm1MeHJweE15UVhG?=
 =?utf-8?B?NGJUSjkwYjQ4U1M1VnlINjJ3Z05SZFdwYVNXdTkxM0hJTXI1ZmtUYnpEOWEx?=
 =?utf-8?B?WXVCdzFaT1MrQ1I5MXI3cEt2NXhSRTVQMVA3ZWRRTWs3SG9kY0UxYzMreDg3?=
 =?utf-8?B?dXRsQUd2ejhua1BXSVY0YU5tZHJIeVlzckJmVjJzcUFJWFFuMnZ0N0Y1SGti?=
 =?utf-8?B?YngwSVVjaktBUzBCbUN4bHhnOXMvMGxPYndXYW1Vd1NiaEk2V0RUdVcvU0Ni?=
 =?utf-8?B?elVLeXlzaStWaWdwbE5OZUhoOUhuR1NYSDZ5cWpwbVVmWkxrc0NQVGZ1c0hH?=
 =?utf-8?B?dFBENkpGSWJzNWQxVHRVZnprMmFnRHFjQkdVbTJ5SEl3UDJZcmZhUnJmVDRO?=
 =?utf-8?B?OWhDTDBIZ1hHQmg0THNtYkRLam9KbDQxTEptWEVOU2h5SWNEV0FMWFJrUEVD?=
 =?utf-8?B?aVJSQ3hFS2pNeW80endteUx1bXM1QmUzVitGVC83aVFEU2FtRVAvRDMxM1RI?=
 =?utf-8?B?REQ5dHpXazIvTlZvU1hxbUh3TnV2eW5FMUNFUm9WSVhpUWY5dE1ockx0QjhI?=
 =?utf-8?B?U3J4Mk1vTnRYei8yb3ozcDNXQS80Vmx1V2ordzdtd1c3VkVtbE9tODBGMk5O?=
 =?utf-8?B?c0RxWWVmN2svZWt0ZWZZTFcwekNMaGNHT0pVM1Bsd0NGWWxBMzNCQWd0Y2RP?=
 =?utf-8?B?dUJVQ1BmaDJ6Q0xvQmd5N1QvQnNhNUpMS05UdGtRMlBPOWdIVjNFZUkyZ0RU?=
 =?utf-8?B?TFVkdDA4cXZOcE42cVZXN3VxMTdaVEYrNHdwaWpHKzlXQUVMRkFUd01ONEFU?=
 =?utf-8?B?b2gwTzczcUwzL29kQ2kxcUx2NlFnQkpnaWZ4UXFOSmlvakNaZ1JIOWJ6YUUr?=
 =?utf-8?B?L1ppcnpMeFp3SFhRcUl6UG5jVEhYRVlzUVdvMzUxSDZuWXVxdjZZQS9HVmRw?=
 =?utf-8?B?T0hpVlJ3SmprdDVDS3BHQll5aXlQbTB6S05pTktXUzFnZDI2dVJ2aU1PK0R6?=
 =?utf-8?B?dVY4WEtZUXRCdEI0V2tyUEZrM1Fha0IrS3BNemV6aHN0VUZHSGRNeDFPY3Fh?=
 =?utf-8?B?N08vRzlLT3VVRGJPWlJvdzh0U0ViVG03Ykc4azVVUDNBV09Ud1Rwb3MxenlX?=
 =?utf-8?B?OUFWdlArS1NsMEtwUjYrTkNISjRPYU1UQUQ4NlBFLzA0eHlJNmtCRW1wQXdl?=
 =?utf-8?B?eUJpWW5QdzlrMVArTy9qSUlmZ3BRZUc1R1hJZTFvMGRxeVVrbUFub1NqOGY4?=
 =?utf-8?B?SVFRbTRXRG1tKzhHcUhJN25NMjgzamYxUWphcS9FeFlMUVhlL0J5V0xpR2ZY?=
 =?utf-8?B?SDRFWjIyR3l4eDM2cmdtaWhseWZVUDNqVytFcEpKRjN1VlJIdnZiU05vRUE3?=
 =?utf-8?B?dVgyQVNrTHR0THV4ZkhPRk1HQ2hRbzRETHBjWUpvYWNBZEdwbUVvYk5YN1RF?=
 =?utf-8?B?cDd4aTh0S3M5QmlkUndybHRKSGJYb1VtMUtOQW9aNlYwbEhzbjhyQ0FRbERm?=
 =?utf-8?B?ci9DV1NsbkluRHlHVHBRNGMzOVNnK3hmTFN4dWNETnRweENPN0tXNWttV2ZV?=
 =?utf-8?B?MnFoK1M1bDFTN3ZBU2UvSDFMUHhDdXg5blN5NDUwdkdYaW5MTEJ6dk5SbGln?=
 =?utf-8?B?bi9wbzgzaW1ZRWZVZkhqT0I0dlBKMnVTYzNFL2ZYSkIySFA0VjEycFZEcGVq?=
 =?utf-8?B?QTJ6TVU2c081L1Uzb2VHQXNNL0Mxc1VyK3ViM0RXWS9hZW5sVmM0Sm8zZnhy?=
 =?utf-8?B?YVN0UCtBb1dOZjZ3ZEdGMnB2bGRMQ1p4QUVPTDJTdkgyMW5TRE5lQ0hCZ0JC?=
 =?utf-8?B?QytzdWpVN3ZpaS9mWlQ1YklpUldqWnFaWTdMeVVjamZ6SjUwUHFEZkNzd08z?=
 =?utf-8?B?OUViWDBsdFRyTFQwbnZXZ1BScXFvQ3pMVFFaVzVPbTBka0J3UnNPaDcyV2hM?=
 =?utf-8?B?WjBRR1BzNnJLNWFqZ09VQjZtSzhFZGFSZ0JvYkVTSnpLYnR2cE94K3ZoQmNn?=
 =?utf-8?B?QnVOdlRRMExWdUJUV1Z4RzN4VkF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(34020700016)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:11:58.0595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c4dff1-155f-4921-c27d-08de54e7aee8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8562



On 15/01/26 21:32, Jai Luthra wrote:
> Hi Tomi,
> 
> Quoting Tomi Valkeinen (2026-01-15 18:07:07)
>> Hi,
>>
>> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>>> On buffer starvation the DMA is marked IDLE, and the stale data in the
>>> internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
>>> userspace. This approach works fine for a single stream case.
>>>
>>> But in multistream scenarios, buffer starvation for one stream i.e. one
>>> virtual channel, can block the shared HW FIFO of the CSI2RX IP. This can
>>> stall the pipeline for all other virtual channels, even if buffers are
>>> available for them.
>>
>> One stream is filtered based on VC & DT, but the above only mentions VC.
>> And then later uses VC when referring to the stream. I think you can
>> drop the VC parts, and just talk about streams.
>>
>>> This patch introduces a new architecture, that continuously drains data
>>> from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
>>> available to the driver from the userspace. This ensures independence
>>> between different streams, where a slower downstream element for one
>>> camera does not block streaming for other cameras.
>>>
>>> Additionally, after a drain is done for a VC, the next frame will be a
>>> partial frame, as a portion of its data will have already been drained
>>> before a valid buffer is queued by user space to the driver.
>>
>> This makes it sounds we drain a single 32KB piece. But won't we continue
>> draining that stream until the stream is stopped or the user provides a
>> buffer?
>>
>> Also, does the DMA not offer us ways to drain a full frame? There's no
>> way to e.g. set the DMA TX increment to 0, so that it would just write
>> to a single location in memory? Or just set the target to void.
>>
> 
> + Vignesh
> 
> AFAIU the dmaengine API is the first limitation here, and the actual
> Transfer Record (TR) structure for BCDMA might support writing to a single
> address. It also might be possible to use dmaengine_prep_dma_cyclic to
> setup a auto-repeating TR like it's used for audio.. maybe that can be
> explored separate from this series.
> 

Yeah. there is no dmaengine API that can do mem-to-mem transfer with
constant addressing mode on src or dst. But the DMA HW on TI K3 SoCs are
capable of doing so.


[...]

-- 
Regards
Vignesh
https://ti.com/opensource


