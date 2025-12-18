Return-Path: <linux-media+bounces-49069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD452CCB72F
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 11:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 768B93058310
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 10:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD2E3321C0;
	Thu, 18 Dec 2025 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="weKKnBGs"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8079E2EB87B;
	Thu, 18 Dec 2025 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054392; cv=fail; b=bo9zKNJnnQ7d7/Ptu6UEZ4c86AgMRrWKJQD3/DNox6j8W18WnHybmvs6n373qTLgFj0YxJH8b0132FwTSPObGvzNcuqqHiytWZagaJQ5pLtsgWGSv8EiEKz4TlSKj6dR1MKemIbzVHIMgJtBnirA/UsaMQdTkTtA1d1OiJA4Cek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054392; c=relaxed/simple;
	bh=v/luJlgXU9cUIBprLVpP+16LZk6lCbjyaO7yYoXCn7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nap4BvdC+njFfhrSG+5bESWKd8eBTv8lUNulbX3oOzOfo9V1lVc9+AxzbyqXKFdXDg47QflXaTwFCieebwF5cD4gOmYs+57318nK2AK9ZB+lCiTPDf1ocico8R/sSNqec2Si121YAYsPHRHYB9JfgJhLZZItjSvVdZqxbc5fij4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=weKKnBGs; arc=fail smtp.client-ip=52.101.48.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHZftYkc5TY8+P9uCDInZcHk68dDPLk30564anansmP4N5zGUTkuCFqFBJ/sefai4T5eTirjtnMA3EEh52nKr5n4pU0M6ZVXCCH4dpIDQjzHI8RkF0h+l6Ykp8yGUUAXo8gXuQIK4VhJeG/hXZ8yD7XTsN745pbC6CUw6KtW4od4kREXdZjHfw4P6cMFMGtibO0IuUxQvr4nQ8RszbkcjO4HvZVVjL4lAp/Vw2n76PidWwI2zYK3gt6WvL4/OLEk5a0OTKi04T2S0eIiYBhML65m2H5tpD23la3meI8OcEvz/cNWPbTdPbbFLWD0DP21Nw65bZxUTHy2bUdagVHuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSYdjyBoL/WaC+j1OL7IK0ydyd/0RaQLUPQqX63NakY=;
 b=wtzd5rmGQxQtKIu3fsX+yV3dyvfZQ/rP73TWxH/m4gGgEbuC/B1Lr2UF+BBqStS8LBYKRed9Q+eRVdtfJcqIhOBRKJlqODvI9DyDZwfHv+hXx4J9cz1rozP3YQ8mgg5nJcL9EhfeJydsEwJ39WA3oMwM0VPnX+g647oZYqFhLD8KOstfufMIv0SCSPbrGYu0ovUNnF3XtxGVLp+R6UembnykVht44be2n22HUL7v2Y8K8aGBJs3xIMbY4X2yUTX7O7If5ypnhxjt57YzJOay54Jx7Fsn1Uunll0MhR32BF1JNIHtlfV8Jp+e6GD01abV5owWuholClltauwNCH00eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSYdjyBoL/WaC+j1OL7IK0ydyd/0RaQLUPQqX63NakY=;
 b=weKKnBGsYAo+Gbeyq2vZoRvsqZ1V9ukn8IoK8bXuXIZdMEdpF30JX0k4xrrdmoUTRwV8LiHaRsk/OMpSAatPusF1zKD7svtrpEZ6/XrbtN28j167swFBpSy6Hag1AiUDjkSzTnlz0nAVtRaOMsUSkKU4KEnoOd8gV/lHyVjKdGU=
Received: from DM6PR02CA0153.namprd02.prod.outlook.com (2603:10b6:5:332::20)
 by SJ5PPF25BED9404.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::794) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 10:39:48 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:5:332:cafe::d5) by DM6PR02CA0153.outlook.office365.com
 (2603:10b6:5:332::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 10:39:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 10:39:46 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 04:39:43 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 04:39:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 04:39:42 -0600
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BIAdbcN3235609;
	Thu, 18 Dec 2025 04:39:38 -0600
Message-ID: <88e656e4-c9b6-43a3-8dd5-ac9ab65a0ff5@ti.com>
Date: Thu, 18 Dec 2025 16:09:37 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 4/4] media: i2c: ds90ub960: Add support for
 DS90UB954-Q1
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <hansg@kernel.org>, <mehdi.djait@linux.intel.com>, <ribalda@chromium.org>,
	<git@apitzsch.eu>, <vladimir.zapolskiy@linaro.org>,
	<benjamin.mugnier@foss.st.com>, <dongcheng.yan@intel.com>, <u-kumar1@ti.com>,
	<jai.luthra@linux.dev>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
References: <20251202102208.80713-1-y-abhilashchandra@ti.com>
 <20251202102208.80713-5-y-abhilashchandra@ti.com>
 <c387b053-82b1-4de4-946a-5f2b9270224f@ideasonboard.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <c387b053-82b1-4de4-946a-5f2b9270224f@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SJ5PPF25BED9404:EE_
X-MS-Office365-Filtering-Correlation-Id: 36326fb8-b5e8-4358-a249-08de3e21c3a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2lrLzFOM1RNUjRHbUVwR1czcnNkRnZOcUsvRzhEcC9MVDM5WnptUHp2TFQv?=
 =?utf-8?B?S0dMaXRxdEV0MGxkT2haK21uOEMwK05LdXhwSDQ4N0pVKzdvYzBUQmswekxC?=
 =?utf-8?B?QTkyYlkyVWE2b1QwK0xocXJkZGc3bUMxQW5wdkxGWlJUekhyb0VIRDlWdyti?=
 =?utf-8?B?dTZFMXhvZnp3bVl3d2tTRW9uL1NXZ3dtVmM5ZXNzVUtqRzljdmgvUGU2THJ0?=
 =?utf-8?B?cHNhalpEakZsd2hXYjl0OFd3VjRLWUU1NEtaekIxdDRjd2dhbVRqYjcvN05K?=
 =?utf-8?B?ejcwd1NKUVlkRVRmc2pEQVMzMk1iajV5N0cvOHp3OGIzMkRDU0NHYW85THpI?=
 =?utf-8?B?UnNpMkJUZVFTcm9jdEhiVHhtekZxUFF1T0M5WUljV2FFL3B5QWhBVmwvQWl3?=
 =?utf-8?B?eTZ6cUx4aVRTM09Dby9sUlBYdnNicGRHYTJoZkgzV2pqY1NxNnUydGZoaTFH?=
 =?utf-8?B?YWVBd2pTbkJNOUVodm95dzVBREZxMWttakR1bFlqRUJHS25xOUZFWE1ZRGwy?=
 =?utf-8?B?Z1RRaEQwbFZWdHlqSDZhSUtFNWhNUE8rSGlKU2dqZnF0RGxXczZmUkV1VXBR?=
 =?utf-8?B?bUhzcVI4NTA5and0OFAxUUJmOGQ4SDdiZ1BHVXozRFp4dVRaN2haRCtjT3ly?=
 =?utf-8?B?SXkwdFVXeHJEWkNyTDVGYjVuZmNCdjRVeGNSeE5hclJudUZQclE4MDkxV1cz?=
 =?utf-8?B?Mnd5OGVRUW1FY3padWduZjliY2twL0RXcDU1bVJqbmhqSUV3V0lNSWNodkRU?=
 =?utf-8?B?YmZ2enR3SlhzT2t4VnRuY0tGekVpRlM1Y011RHBOMFVDdHc5OE8zakFDZVRs?=
 =?utf-8?B?dWhxTEQ2TlJsblM5cnUya0llOHhtNGFqMG9MNTJ4LzdBMUdZRS9EeDU1Mzlr?=
 =?utf-8?B?MTd5YkVnQWU4TURtT1pXMnZOMDhQQVhXa3JkMDE0YitDVU51anAvbmR3T1BF?=
 =?utf-8?B?bU14Q1IwUlhFbHpYZVA1ZWZES3NQaSsrYlAzdmJ2KzhkWVZJOWxGb0lTN2F2?=
 =?utf-8?B?RVJCSjhWRmliUUo1VjJmVG96S0NzNG1tc3pSYWt6UHEzQm8wK3JjQ1dZcit4?=
 =?utf-8?B?YTZUWEFXcFBTV05FS0k0U1hRVjBjYmZseStZRWczalA4N09JMWFmRGVIeThO?=
 =?utf-8?B?SDhOKzJYMXlSb3kyaDN2MFFoN1BSYlQrYVEzK1lZenJRNTlvYzBlcGdMTUIz?=
 =?utf-8?B?UzkvYzZieG9MVGxHT3VndmQyZWN3VDVUVHdOOFY3TFJkZ1NYVjczZjhMd0tm?=
 =?utf-8?B?MktvRWZjN2Q1dFQveFlLY3U2VGNpTDY4TG5mVFV4elVtWGtZK1pGUzFSZzFq?=
 =?utf-8?B?SFh5cnc4VmdnbDZpT2lJZzZETlVqWmtxam1QemlEQnlsZFBEOU5JMW0vc0Rw?=
 =?utf-8?B?Z3hBUmdlbVhlWG41MDBNZHNXUzkwOGx5dWlBRDZjVnVIQlc4WkR6ajIvYmRh?=
 =?utf-8?B?VTRway9qSmRBQ2RsbW0vUGZkK2ZyMTRSb2FtNXpuQ1VUaHgxVFlKYXdSSGhl?=
 =?utf-8?B?L1FjVXVONUVLazJiajlyL2tIM1hwNmgxSXdrTk1EMkdPeFhzRWxWa3MyTXUv?=
 =?utf-8?B?Rm10b1VwcHBKRDdFR2RwcnVtTGFtYnhrSjU3L0dlMGhSclIzeVdwMldHUXFs?=
 =?utf-8?B?bEpyOXFqWWhhOVhTR0xiWmpIbjVIZGM4ZWhjS0I4aDlxZ1J2cWR5TU9jSkV6?=
 =?utf-8?B?TlFEWVN3Qjl0c1VkV1U1TE82UGUxSGdaRTVwK0w3SzZPOVZCcFhuWHEzYWdW?=
 =?utf-8?B?RmlsT2VmZHV0YmxybEdVVmVHcFpRL3lhT1VhSzhJbkZyb2ZwOTVSS2tVM2Qz?=
 =?utf-8?B?c21sbXpCd3gwY3k0bFkyb0ZlQ1ZGRHFRYkovdDAwTkxsY3Q2Rk1vSXVTNlBq?=
 =?utf-8?B?Ymg1VXpHMHB3ME0vcUd2ZU0rSGl4Z1p6MjcrUERnd1FWQ1ZmNzRzWDJOSkw2?=
 =?utf-8?B?OEF1UEUvOUhVZkZ1YlFEdE1sMWJRMEJVTkdDT3hzUUY5QU5mY0Y5RVlxVUVk?=
 =?utf-8?B?SThreTIzcnVHb0Q1N05WdzJtdEZJWTlPSFhOMytEcTZ5ZjZkdFE3TXJXeGRm?=
 =?utf-8?B?RmlpMTBsYWFneTRvaUhBbEpIOVhqL0NtSVRsVlZtaVZyWnY2M1QrVUNLUEEr?=
 =?utf-8?Q?lWe2jU9gZqi1Zkyfvsug5ViO5?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 10:39:46.9995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36326fb8-b5e8-4358-a249-08de3e21c3a9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF25BED9404

Hi Tomi,
Thanks for the review.

On 05/12/25 16:40, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/12/2025 12:22, Yemike Abhilash Chandra wrote:
>> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
>> compatible with DS90UB960-Q1. The main difference is that it supports half
>> of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX port.
>>
>> A couple of differences are between the status registers and the
>> strobe setting registers. Hence accommodate these differences in
>> the UB960 driver so that we can reuse a large part of the existing code.
>>
>> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>> Refer table 5.2.1 STROBE_SET Register in [1] for DS90UB954 strobe
>> setting register.
>>
>> [1]: https://www.ti.com/lit/an/snla301/snla301.pdf
>>
>>   drivers/media/i2c/Kconfig     |   4 +-
>>   drivers/media/i2c/ds90ub960.c | 165 +++++++++++++++++++++++++---------
>>   2 files changed, 125 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 745819c625d6..52104f76e371 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -1703,8 +1703,8 @@ config VIDEO_DS90UB960
>>   	select V4L2_FWNODE
>>   	select VIDEO_V4L2_SUBDEV_API
>>   	help
>> -	  Device driver for the Texas Instruments DS90UB960
>> -	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
>> +	  Device driver for the Texas Instruments DS90UB954, DS90UB960
>> +	  FPD-Link III Deserializers and DS90UB9702 FPD-Link IV Deserializer.
>>   
>>   config VIDEO_MAX96714
>>   	tristate "Maxim MAX96714 GMSL2 deserializer"
>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
>> index 45494fcaf095..7d3e5a87bb17 100644
>> --- a/drivers/media/i2c/ds90ub960.c
>> +++ b/drivers/media/i2c/ds90ub960.c
>> @@ -396,6 +396,12 @@
>>   #define UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(3)
>>   #define UB960_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(2, 0)
>>   
>> +#define UB954_IR_RX_ANA_STROBE_SET_CLK_DATA		0x08
>> +#define UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY	BIT(3)
>> +#define UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY	BIT(7)
>> +#define UB954_IR_RX_ANA_STROBE_SET_CLK_DELAY_MASK	GENMASK(2, 0)
>> +#define UB954_IR_RX_ANA_STROBE_SET_DATA_DELAY_MASK	GENMASK(4, 6)
>> +
>>   /* UB9702 Registers */
>>   
>>   #define UB9702_SR_CSI_EXCLUSIVE_FWD2		0x3c
>> @@ -455,6 +461,7 @@
>>   #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
>>   
>>   enum chip_type {
>> +	UB954,
>>   	UB960,
>>   	UB9702,
>>   };
>> @@ -1000,6 +1007,10 @@ static int ub960_txport_select(struct ub960_data *priv, u8 nport)
>>   
>>   	lockdep_assert_held(&priv->reg_lock);
>>   
>> +	/* UB954 has only 1 CSI TX. Hence, no need to select */
>> +	if (priv->hw_data->chip_type == UB954)
>> +		return 0;
>> +
>>   	if (priv->reg_current.txport == nport)
>>   		return 0;
>>   
>> @@ -1424,10 +1435,11 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
>>   	priv->tx_link_freq[0] = vep.link_frequencies[0];
>>   	priv->tx_data_rate = priv->tx_link_freq[0] * 2;
>>   
>> -	if (priv->tx_data_rate != MHZ(1600) &&
>> -	    priv->tx_data_rate != MHZ(1200) &&
>> -	    priv->tx_data_rate != MHZ(800) &&
>> -	    priv->tx_data_rate != MHZ(400)) {
>> +	if ((priv->tx_data_rate != MHZ(1600) &&
>> +	     priv->tx_data_rate != MHZ(1200) &&
>> +	     priv->tx_data_rate != MHZ(800) &&
>> +	     priv->tx_data_rate != MHZ(400)) ||
>> +	     (priv->hw_data->chip_type == UB954 && priv->tx_data_rate == MHZ(1200))) {
>>   		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
>>   		ret = -EINVAL;
>>   		goto err_free_vep;
>> @@ -1551,22 +1563,44 @@ static int ub960_rxport_get_strobe_pos(struct ub960_data *priv,
>>   	u8 clk_delay, data_delay;
>>   	int ret;
>>   
>> -	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> -			     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
>> -	if (ret)
>> -		return ret;
>> +	/*
>> +	 * DS90UB960 has two separate registers for clk and data delay whereas
>> +	 * DS90UB954 has a single combined register. Hence read accordingly
>> +	 */
> 
> Why do you read the single register twice? In any case, I don't think
> the comment is needed, as it's quite clear from the code. Unless there's
> some extra complication with the registers.
> 

I will fix this in v3.

>> +	if (priv->hw_data->chip_type == UB954) {
>> +		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +				     UB954_IR_RX_ANA_STROBE_SET_CLK_DATA, &v, NULL);
>> +		if (ret)
>> +			return ret;
>>   
>> -	clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
>> -			    0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
>> +		clk_delay = (v & UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
>> +			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
>>   
>> -	ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> -			     UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
>> -	if (ret)
>> -		return ret;
>> +		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +				     UB954_IR_RX_ANA_STROBE_SET_CLK_DATA, &v, NULL);
>> +		if (ret)
>> +			return ret;
>> +
>> +		data_delay = (v & UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
>> +			      0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
>> +	} else {
>> +		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +				     UB960_IR_RX_ANA_STROBE_SET_CLK, &v, NULL);
>> +		if (ret)
>> +			return ret;
>>   
>> -	data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
>> +		clk_delay = (v & UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY) ?
>>   			     0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
>>   
>> +		ret = ub960_read_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +				     UB960_IR_RX_ANA_STROBE_SET_DATA, &v, NULL);
>> +		if (ret)
>> +			return ret;
>> +
>> +		data_delay = (v & UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY) ?
>> +			      0 : UB960_MANUAL_STROBE_EXTRA_DELAY;
>> +	}
>> +
>>   	ret = ub960_rxport_read(priv, nport, UB960_RR_SFILTER_STS_0, &v, NULL);
>>   	if (ret)
>>   		return ret;
>> @@ -1590,8 +1624,17 @@ static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
>>   	u8 clk_delay, data_delay;
>>   	int ret = 0;
>>   
>> -	clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
>> -	data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>> +	/*
>> +	 * DS90UB960 has two separate registers for clk and data delay whereas
>> +	 * DS90UB954 has a single combined register. Hence assign accordingly.
>> +	 */
>> +	if (priv->hw_data->chip_type == UB954) {
>> +		clk_delay = UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
>> +		data_delay = UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>> +	} else {
>> +		clk_delay = UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
>> +		data_delay = UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>> +	}
>>   
>>   	if (strobe_pos < UB960_MIN_AEQ_STROBE_POS)
>>   		clk_delay = abs(strobe_pos) - UB960_MANUAL_STROBE_EXTRA_DELAY;
>> @@ -1602,11 +1645,25 @@ static int ub960_rxport_set_strobe_pos(struct ub960_data *priv,
>>   	else if (strobe_pos > 0)
>>   		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
>>   
>> -	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> -			UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
>> -
>> -	ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> -			UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
>> +	/*
>> +	 * DS90UB960 has two separate registers for clk and data delay whereas
>> +	 * DS90UB954 has a single combined register. Hence write the registers accordingly.
>> +	 */
>> +	if (priv->hw_data->chip_type == UB954) {
>> +		ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +				      UB954_IR_RX_ANA_STROBE_SET_CLK_DATA,
>> +				      UB954_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY,
>> +				      clk_delay, &ret);
>> +		ub960_ind_update_bits(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +				      UB954_IR_RX_ANA_STROBE_SET_CLK_DATA,
>> +				      UB954_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY,
>> +				      data_delay, &ret);
> 
> Here, too. It's a single register, why write it twice?
> 
> And I don't think this is correct at all... Did you validate this? The
> above only sets the EXTRA_DELAY bits, not the values at all. And the
> code that sets clk_delay and data_delay use UB960's bit positions, which
> are not the same on UB954.
> 

Apologies, Yes, I did validate this. however, my testing did not 
encounter the
condition where the data delay bits are set, which is the main 
difference in registers.
I will correct this in v3.

>> +	} else {
>> +		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +				UB960_IR_RX_ANA_STROBE_SET_CLK, clk_delay, &ret);
>> +		ub960_write_ind(priv, UB960_IND_TARGET_RX_ANA(nport),
>> +				UB960_IR_RX_ANA_STROBE_SET_DATA, data_delay, &ret);
>> +	}
>>   
>>   	return ret;
>>   }
>> @@ -4176,33 +4233,40 @@ static int ub960_log_status(struct v4l2_subdev *sd)
>>   		dev_info(dev, "\tsync %u, pass %u\n", v & (u8)BIT(1),
>>   			 v & (u8)BIT(0));
>>   
>> -		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport),
>> -				   &v16, NULL);
>> -		if (ret)
>> -			return ret;
>> +		/*
>> +		 * Frame counter, frame error counter, line counter and line error counter
>> +		 * registers are marked as reserved in the UB954 datasheet. Hence restrict
>> +		 * the following register reads only for UB960 and UB9702.
>> +		 */
>> +		if (priv->hw_data->chip_type != UB954) {
> 
> It is better to check for the chips that have the registers, unless
> we're sure that this particular chip, ub954, is and will be the only
> outlier.
> 

I will make this change in v3.

>> +			ret = ub960_read16(priv, UB960_SR_CSI_FRAME_COUNT_HI(nport),
>> +					   &v16, NULL);
>> +			if (ret)
>> +				return ret;
>>   
>> -		dev_info(dev, "\tframe counter %u\n", v16);
>> +			dev_info(dev, "\tframe counter %u\n", v16);
>>   
>> -		ret = ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
>> -				   &v16, NULL);
>> -		if (ret)
>> -			return ret;
>> +			ret = ub960_read16(priv, UB960_SR_CSI_FRAME_ERR_COUNT_HI(nport),
>> +					   &v16, NULL);
>> +			if (ret)
>> +				return ret;
>>   
>> -		dev_info(dev, "\tframe error counter %u\n", v16);
>> +			dev_info(dev, "\tframe error counter %u\n", v16);
>>   
>> -		ret = ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport),
>> -				   &v16, NULL);
>> -		if (ret)
>> -			return ret;
>> +			ret = ub960_read16(priv, UB960_SR_CSI_LINE_COUNT_HI(nport),
>> +					   &v16, NULL);
>> +			if (ret)
>> +				return ret;
>>   
>> -		dev_info(dev, "\tline counter %u\n", v16);
>> +			dev_info(dev, "\tline counter %u\n", v16);
>>   
>> -		ret = ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
>> -				   &v16, NULL);
>> -		if (ret)
>> -			return ret;
>> +			ret = ub960_read16(priv, UB960_SR_CSI_LINE_ERR_COUNT_HI(nport),
>> +					   &v16, NULL);
>> +			if (ret)
>> +				return ret;
>>   
>> -		dev_info(dev, "\tline error counter %u\n", v16);
>> +			dev_info(dev, "\tline error counter %u\n", v16);
>> +		}
>>   	}
>>   
>>   	for_each_rxport(priv, it) {
>> @@ -5023,6 +5087,9 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>>   	}
>>   
>>   	switch (priv->hw_data->chip_type) {
>> +	case UB954:
>> +		model = "UB954";
>> +		break;
>>   	case UB960:
>>   		model = "UB960";
>>   		break;
>> @@ -5039,6 +5106,11 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>>   	if (ret)
>>   		goto err_pd_gpio;
>>   
>> +	/*
>> +	 * UB954 REFCLK_FREQ is not synchronized, so multiple reads are recommended
>> +	 * by the datasheet. However, we use the same logic as UB960 (single read),
>> +	 * as practical testing showed this is sufficient and stable for UB954 as well.
>> +	 */
> 
> I think the important point is that the clk rate is only used for a
> debug print.
> 

Yeah, I will add this detail to the comment.

Thanks and Regards
Yemike Abhilash Chandra

>>   	if (priv->hw_data->chip_type == UB9702)
>>   		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
>>   				 NULL);
>> @@ -5198,6 +5270,13 @@ static void ub960_remove(struct i2c_client *client)
>>   	mutex_destroy(&priv->reg_lock);
>>   }
>>   
>> +static const struct ub960_hw_data ds90ub954_hw = {
>> +	.chip_type = UB954,
>> +	.chip_family = FAMILY_FPD3,
>> +	.num_rxports = 2,
>> +	.num_txports = 1,
>> +};
>> +
>>   static const struct ub960_hw_data ds90ub960_hw = {
>>   	.chip_type = UB960,
>>   	.chip_family = FAMILY_FPD3,
>> @@ -5213,6 +5292,7 @@ static const struct ub960_hw_data ds90ub9702_hw = {
>>   };
>>   
>>   static const struct i2c_device_id ub960_id[] = {
>> +	{ "ds90ub954-q1", (kernel_ulong_t)&ds90ub954_hw },
>>   	{ "ds90ub960-q1", (kernel_ulong_t)&ds90ub960_hw },
>>   	{ "ds90ub9702-q1", (kernel_ulong_t)&ds90ub9702_hw },
>>   	{}
>> @@ -5220,6 +5300,7 @@ static const struct i2c_device_id ub960_id[] = {
>>   MODULE_DEVICE_TABLE(i2c, ub960_id);
>>   
>>   static const struct of_device_id ub960_dt_ids[] = {
>> +	{ .compatible = "ti,ds90ub954-q1", .data = &ds90ub954_hw },
>>   	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
>>   	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
>>   	{}
> 
>   Tomi
> 


