Return-Path: <linux-media+bounces-49042-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02ACCA592
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 06:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 775773030FF8
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 05:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8295D311963;
	Thu, 18 Dec 2025 05:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I/p2AmxM"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013030.outbound.protection.outlook.com [40.93.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82572522B6;
	Thu, 18 Dec 2025 05:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766036173; cv=fail; b=L0IZfgImePi2fmTOS2oFJnp9K5U7l3SU88dme8x911yKkgIU6GxLh6Qk4vlWfiHdbz/d2nZ8UeQ2mA/qzeEB3lj4mS4ty3Cu3hNtAqwWrYqrnGbzJ4hw9lV78gfn93BPeYJNxe+WACVlYr4JRKh+2u4aFxIZfEQ7qeV0doFnFIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766036173; c=relaxed/simple;
	bh=FamlEKFsW9bEqoI1+XfrqcBsvDKKE16uRgQZin/kNT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Gq9VVGGkK1PMCn1OMYM+8uO8DU8+h78DeeW+nyuQuxsqO3WijZwEto5Tz9n2dNBUgwukCqnTXqIt6SWSgvj+7UVOO4BvMDo8qwMHliYC8h8s3mN86OkIImlC61l1FddUKiON2Jc35D+ZE27COeIe9kKXdeLeGO817JTs3xH762E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I/p2AmxM; arc=fail smtp.client-ip=40.93.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btia3k9yj2W5Ap3A5oDbiyhxqjHSwwXoIVJfPwgEQU0p/Tfx5q6J5MyRyTuyBjYJoxy9uTIGhfRJrqlchDBB1v+rpBJYwCvGrwHPFtnVwAm1SYMN024CTfWhzJ+5Q7xjd0eFXJXCKRMU8FgEn6B3kyfwbLdkx6cmhlASNqNWTVpWfft3g5eelxlFI2n4tMxhBaA9AIGlb4pQRbBcyNK3AvHq9fs7rkTLzb/OVxZ1f/xL0cGjuk800QXH+CcdFMSwqbS1lvoD6c7DQVwAuU8Gc3CINDuTys9HECC2NuHMzexeOLjOXiPYpj3KBuhrm7oZmi4VxWsUDnW0VJMalkFLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYzzFpTq0fHTJhzt9ByLfRSZBLbXVmxw5d2Nrmx8SDM=;
 b=xIzmKU078sBPhdETJORZaRhVs4uPGxFXnOe9Kne2ixAr2QBr5rf582lmjF/Kfw1Ot9MgG1JL+yGdEaYFwCd5d67lMeUkI9aJekCcr4hYvUd75S+Q3RVg7fTSK7hv2VEZ/iaAOFqPGR2RYl26Ys4rfEcJRaEBE+mJuG+tvpilrjRs48M5Ig3KMfbiuqzkMZdez7dLbWODVCAWAr2I0mpWi8N5FNRXCt0di6YCDIZ7kTHitEdwE+7KLkAoVlF+ssUULzm89fDW+Q76P/OffHD23WYehqAYwOpovNgKs9oVD50QbNXtaCBZRzflmDAS5A60Q93k4ySWbfLTxOpwHbQaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYzzFpTq0fHTJhzt9ByLfRSZBLbXVmxw5d2Nrmx8SDM=;
 b=I/p2AmxMV0IpjiGgH3fH+vXs6DIRN0u2JEiZNbjz6fCRWzY1/H82qtSdQM3xGWHIyW1mOn4f8WtYPdi2+d/fXB1b217GBXyvPQFGJ9U9vC/aUNmCJcZUy/fqzOvW5vliTrEi10K2XDfeDMZvf1vFAfnP30FBx6rrKJ/0LmsyQc4=
Received: from SJ0PR05CA0096.namprd05.prod.outlook.com (2603:10b6:a03:334::11)
 by PH3PPF079E800A3.namprd10.prod.outlook.com (2603:10b6:518:1::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 05:36:05 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::5e) by SJ0PR05CA0096.outlook.office365.com
 (2603:10b6:a03:334::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 05:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 05:36:03 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 23:36:02 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 23:36:01 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Dec 2025 23:36:01 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BI5ZtEe2835016;
	Wed, 17 Dec 2025 23:35:56 -0600
Message-ID: <9111c947-ef0f-4c4a-a09f-6da0901a8510@ti.com>
Date: Thu, 18 Dec 2025 11:05:55 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 16/18] media: cadence: csi2rx: Support runtime PM
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-17-r-donadkar@ti.com>
 <a4bba302-8be2-4bbd-96c8-3a20472e0c12@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <a4bba302-8be2-4bbd-96c8-3a20472e0c12@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|PH3PPF079E800A3:EE_
X-MS-Office365-Filtering-Correlation-Id: 93df2319-1f28-4932-72a8-08de3df755b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVdpMVoxL1RPc0FpN0YwUFhDRkJNYWNxU1VRMEp6NXNvYzNQRHYzMDBmKy9z?=
 =?utf-8?B?c043dFNqTFFhUUhDRmU4NGpQVllxSGlnclZ3ZXpnVW5uWGRxM0VLdkhZOWlp?=
 =?utf-8?B?U3VoV1dScCtsVUtvTHM3aTZnYSs3dWt1ZFpORnp6TFUvOUxDajZIa0dJelNL?=
 =?utf-8?B?TXVIdjhyNGFaUXVxRXZzemJWWUtXTlRXdGNEZWhXcG5acHVuditwamsvL2Vs?=
 =?utf-8?B?UTQ3d1BSbVVBQVBZU05CQ3hjVjMxT1NFQ0tSekxjNEtDY1lMaFpvajJCblMv?=
 =?utf-8?B?Zk1Cekc3UWFCbDJaT3A0YmxaQk9IVzJiZGpvWjZOeVM4bk4xMVpMWVNxOEti?=
 =?utf-8?B?aXRqSUlCcEdHL3lHNHUwMkdvZ3R0clRZWk9vTlNRVDI3YWZ6cVgzUlNidHNI?=
 =?utf-8?B?ZkRBMStPdVltUzgydmJZRS9uVUIrTHlvWGNkMTBKWUJpUmdEUyt2VE9hZ0hR?=
 =?utf-8?B?Q3E2TTR6R3pzOWh5Zkl3TGlSRWx4N0cyZlEySXVPendGei9BY2tSaU0wWnlt?=
 =?utf-8?B?M3E4cmR4dGpWQ3RLUHRybXRGODhiazI0UFkyVUtlNU1LV0pLQ1ZEZWtmMVdN?=
 =?utf-8?B?SW5ibmtUYkNKNWhFYUVWMXQ4S2ZiUWtYdW9NWXVZK2p2cWtLakFRK2JUSVRu?=
 =?utf-8?B?YUR2VUxncjFlUmt5UzRveEdLbUNiVkw4R0pVL0d1MHQ3WWlxSDJ4c3p1b1Zo?=
 =?utf-8?B?czNaSENPajltNW5OamxORndpc1N0Ym1ZaVE1Tmljait6cytBZk1zZFdvT0Yy?=
 =?utf-8?B?SVRWcVNlWXlibS84Ym5pWHVsR3MrbUtJQWJ4bHU3bWNaSDZ1aFFzejVnWXNn?=
 =?utf-8?B?TFFkem0rQ1NYeTNmbTVKcjlnYUluMUlpWVE0TGl3T05IRS9KdG1wOUVBdklk?=
 =?utf-8?B?NS82b3p4bmJIT1VNU3N6Rm00SGVPbFRTeVlobWExTGlxQ200a2RLSE5BdDN2?=
 =?utf-8?B?UmpnNnRIVktWRlRvMjlqdXFDUURZaUJwak9ZdGd3SkdvR3FPU1o2VDl2S0th?=
 =?utf-8?B?NHVMNlh0MHd5TlRXUjAxMi9WVEx5WkJwWFB3UjdGcGZkbTJLM0E1WW96LzU5?=
 =?utf-8?B?SEgvUWxrNjExU2JXNXlkTEtQZHpqVVRrOVRDa3ZPTHgxWWJ3d0tBOGY1b2NO?=
 =?utf-8?B?VW9tYTJnUlk3S1dqTk4xdysyZDRzVUNHM0RYa0NIWEJWa2J1bHZCR0d4Y2tk?=
 =?utf-8?B?dHhla0VpT0RTa3VVNnpud1ZTVkt1QmUyZFZIMXk5ZmZEUnYzL2k4VTlVeUFE?=
 =?utf-8?B?YlA5aTZrbjM2TW9uRnBvWHZhbnc1ekRpY3dhbUxSWjVOMXdHRWk3bS9vZ1cw?=
 =?utf-8?B?RmlaZDBkYlM0UEdJOTFHVE9iV1praHBhL1ArSkR5MVl4K2NLdkNrVmlZL1hq?=
 =?utf-8?B?L3lFUEJCUXBiV1VlSFhXbmo3a0h2SXNJV2p1QzRCZ2tZbDZtSFVkY1gzbkQ0?=
 =?utf-8?B?UjUwdnlQSFhEWU9YeHArdThGZTM3MjlDSFhsaFIzOHljcXpsc2tyWE1xZGJF?=
 =?utf-8?B?aWUzZGI4bGJsZ0Y1eWw2ajFXZ3BjeEtFRFNZa1krY25DMXMwVVlXWnNPbXVG?=
 =?utf-8?B?TW8wTHg2Qm8xRTY5NVlGdVAzN0V2UEt2Q0hlS01pTHVsU3lNYjZWam4veEFo?=
 =?utf-8?B?cm5lbDhjZU83WUtiNEFQRS9xTkdaVTlqV0FOejlHYVJqaXUvbWwwWlRHWStX?=
 =?utf-8?B?WVd5dmRZWmQwU3RrTUxpUmZmMExwQUhQTjJzVExVRUN4SmQrN3Q3ejNXcGJF?=
 =?utf-8?B?cTJrT0REMnhoMU9vZDJLa3BjQk8zcHIvaEtJSVRpbmdUYTJHdlFEZU9JMWVU?=
 =?utf-8?B?dFZtdnM4UXk1Y0xqVlFrekxrN3VhbGMwNVowa2NGYWxwellPMjJhWDJSd3do?=
 =?utf-8?B?OGtKQ1QrNzNJL0pTaUF3MlZBU0pmOUZmNGg0SEg5bU5nNXpNVUlTU0dsZVRR?=
 =?utf-8?B?Sm9tZlE4OEhZQ1ltRUtvR0lQdjdkeE9ZUzVPZmVzM3hYWlh1Qld0dFA0aWxT?=
 =?utf-8?B?dElFYWFvMElBbXZDaVJuUjNaM0VmMGhFbW1IQU1kVzV4VkpJc1htTVgyUmk0?=
 =?utf-8?B?VFlGQXp5ais0S0VWU3ZHVkJyVjdERW1WUFZZbW5ZYmNXaHdnSU9VUDZ5c0FY?=
 =?utf-8?Q?I3eo=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 05:36:03.6810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93df2319-1f28-4932-72a8-08de3df755b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF079E800A3


On 01/12/25 18:41, Tomi Valkeinen wrote:
> Hi,


Hi Tomi,

Thank you for the review !

>
> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
>> From: Changhuang Liang <changhuang.liang@starfivetech.com>
>>
>> Use runtime power management hooks to save power when CSI-RX is not in
>> use.
>>
>> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/Kconfig       |   1 +
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 129 ++++++++++++-------
>>   2 files changed, 83 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/media/platform/cadence/Kconfig b/drivers/media/platform/cadence/Kconfig
>> index 1aa608c00dbce..ea85ef82760e6 100644
>> --- a/drivers/media/platform/cadence/Kconfig
>> +++ b/drivers/media/platform/cadence/Kconfig
>> @@ -5,6 +5,7 @@ comment "Cadence media platform drivers"
>>   config VIDEO_CADENCE_CSI2RX
>>   	tristate "Cadence MIPI-CSI2 RX Controller"
>>   	depends on VIDEO_DEV
>> +	depends on PM
>>   	select MEDIA_CONTROLLER
>>   	select VIDEO_V4L2_SUBDEV_API
>>   	select V4L2_FWNODE
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 833bc134f17cb..6447c225ba354 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -337,11 +337,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   	u32 reg;
>>   	int ret;
>>   
>> -	ret = clk_prepare_enable(csi2rx->p_clk);
>> -	if (ret)
>> -		return ret;
>> -
>> -	reset_control_deassert(csi2rx->p_rst);
>>   	csi2rx_reset(csi2rx);
>>   
>>   	if (csi2rx->error_irq >= 0)
>> @@ -382,7 +377,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   		if (ret) {
>>   			dev_err(csi2rx->dev,
>>   				"Failed to configure external DPHY: %d\n", ret);
>> -			goto err_disable_pclk;
>> +			return ret;
>>   		}
>>   	}
>>   
>> @@ -397,12 +392,6 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   	 * hence the reference counting.
>>   	 */
>>   	for (i = 0; i < csi2rx->max_streams; i++) {
>> -		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
>> -		if (ret)
>> -			goto err_disable_pixclk;
>> -
>> -		reset_control_deassert(csi2rx->pixel_rst[i]);
>> -
>>   		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF |
>>   			       FIELD_PREP(CSI2RX_STREAM_CFG_NUM_PIXELS_MASK,
>>   					  csi2rx->num_pixels[i]),
>> @@ -415,30 +404,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   		       csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
>>   	}
>>   
>> -	ret = clk_prepare_enable(csi2rx->sys_clk);
>> -	if (ret)
>> -		goto err_disable_pixclk;
>> -
>> -	reset_control_deassert(csi2rx->sys_rst);
>> -
>> -	clk_disable_unprepare(csi2rx->p_clk);
>>   
>>   	return 0;
>> -
>> -err_disable_pixclk:
>> -	for (; i > 0; i--) {
>> -		reset_control_assert(csi2rx->pixel_rst[i - 1]);
>> -		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
>> -	}
>> -
>> -	if (csi2rx->dphy) {
>> -		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>> -		phy_power_off(csi2rx->dphy);
>> -	}
>> -err_disable_pclk:
>> -	clk_disable_unprepare(csi2rx->p_clk);
>> -
>> -	return ret;
>>   }
>>   
>>   static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>> @@ -447,10 +414,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>>   	u32 val;
>>   	int ret;
>>   
>> -	clk_prepare_enable(csi2rx->p_clk);
>> -	reset_control_assert(csi2rx->sys_rst);
>> -	clk_disable_unprepare(csi2rx->sys_clk);
>> -
>>   	writel(0, csi2rx->base + CSI2RX_ERROR_IRQS_MASK_REG);
>>   
>>   	for (i = 0; i < csi2rx->max_streams; i++) {
>> @@ -465,14 +428,8 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>>   		if (ret)
>>   			dev_warn(csi2rx->dev,
>>   				 "Failed to stop streaming on pad%u\n", i);
>> -
>> -		reset_control_assert(csi2rx->pixel_rst[i]);
>> -		clk_disable_unprepare(csi2rx->pixel_clk[i]);
>>   	}
>>   
>> -	reset_control_assert(csi2rx->p_rst);
>> -	clk_disable_unprepare(csi2rx->p_clk);
>> -
>>   	if (csi2rx->dphy) {
>>   		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>>   
>> @@ -548,10 +505,17 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>>   	 * enable the whole controller.
>>   	 */
>>   	if (!csi2rx->count) {
>> +		ret = pm_runtime_resume_and_get(csi2rx->dev);
>> +		if (ret < 0)
>> +			return ret;
>> +
>>   		csi2rx_update_vc_select(csi2rx, state);
>> +
>>   		ret = csi2rx_start(csi2rx);
>> -		if (ret)
>> +		if (ret) {
>> +			pm_runtime_put(csi2rx->dev);
>>   			return ret;
>> +		}
>>   	}
>>   
>>   	/* Start streaming on the source */
>> @@ -561,8 +525,10 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>>   		dev_err(csi2rx->dev,
>>   			"Failed to start streams %#llx on subdev\n",
>>   			sink_streams);
>> -		if (!csi2rx->count)
>> +		if (!csi2rx->count) {
>>   			csi2rx_stop(csi2rx);
>> +			pm_runtime_put(csi2rx->dev);
> Probably time to add 'goto' based error handling to this func... Maybe
> in this patch, maybe as a separate patch before this.


Okay, I will do it in this patch itself.


Rishikesh

>
>   Tomi
>
>> +		}
>>   		return ret;
>>   	}
>>   
>> @@ -589,8 +555,10 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>>   	csi2rx->count--;
>>   
>>   	/* Let the last user turn off the lights. */
>> -	if (!csi2rx->count)
>> +	if (!csi2rx->count) {
>>   		csi2rx_stop(csi2rx);
>> +		pm_runtime_put(csi2rx->dev);
>> +	}
>>   
>>   	return 0;
>>   }
>> @@ -1092,6 +1060,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_cleanup;
>>   
>> +	pm_runtime_enable(csi2rx->dev);
>>   	ret = v4l2_async_register_subdev(&csi2rx->subdev);
>>   	if (ret < 0)
>>   		goto err_free_state;
>> @@ -1106,6 +1075,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   
>>   err_free_state:
>>   	v4l2_subdev_cleanup(&csi2rx->subdev);
>> +	pm_runtime_disable(csi2rx->dev);
>>   err_cleanup:
>>   	v4l2_async_nf_unregister(&csi2rx->notifier);
>>   	v4l2_async_nf_cleanup(&csi2rx->notifier);
>> @@ -1124,9 +1094,73 @@ static void csi2rx_remove(struct platform_device *pdev)
>>   	v4l2_async_unregister_subdev(&csi2rx->subdev);
>>   	v4l2_subdev_cleanup(&csi2rx->subdev);
>>   	media_entity_cleanup(&csi2rx->subdev.entity);
>> +	pm_runtime_disable(csi2rx->dev);
>>   	kfree(csi2rx);
>>   }
>>   
>> +static int csi2rx_runtime_suspend(struct device *dev)
>> +{
>> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
>> +	unsigned int i;
>> +
>> +	reset_control_assert(csi2rx->sys_rst);
>> +	clk_disable_unprepare(csi2rx->sys_clk);
>> +
>> +	for (i = 0; i < csi2rx->max_streams; i++) {
>> +		reset_control_assert(csi2rx->pixel_rst[i]);
>> +		clk_disable_unprepare(csi2rx->pixel_clk[i]);
>> +	}
>> +
>> +	reset_control_assert(csi2rx->p_rst);
>> +	clk_disable_unprepare(csi2rx->p_clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int csi2rx_runtime_resume(struct device *dev)
>> +{
>> +	struct csi2rx_priv *csi2rx = dev_get_drvdata(dev);
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(csi2rx->p_clk);
>> +	if (ret)
>> +		return ret;
>> +
>> +	reset_control_deassert(csi2rx->p_rst);
>> +
>> +	for (i = 0; i < csi2rx->max_streams; i++) {
>> +		ret = clk_prepare_enable(csi2rx->pixel_clk[i]);
>> +		if (ret)
>> +			goto err_disable_pixclk;
>> +
>> +		reset_control_deassert(csi2rx->pixel_rst[i]);
>> +	}
>> +
>> +	ret = clk_prepare_enable(csi2rx->sys_clk);
>> +	if (ret)
>> +		goto err_disable_pixclk;
>> +
>> +	reset_control_deassert(csi2rx->sys_rst);
>> +
>> +	return 0;
>> +
>> +err_disable_pixclk:
>> +	for (; i > 0; i--) {
>> +		reset_control_assert(csi2rx->pixel_rst[i - 1]);
>> +		clk_disable_unprepare(csi2rx->pixel_clk[i - 1]);
>> +	}
>> +
>> +	reset_control_assert(csi2rx->p_rst);
>> +	clk_disable_unprepare(csi2rx->p_clk);
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct dev_pm_ops csi2rx_pm_ops = {
>> +	RUNTIME_PM_OPS(csi2rx_runtime_suspend, csi2rx_runtime_resume, NULL)
>> +};
>> +
>>   static const struct of_device_id csi2rx_of_table[] = {
>>   	{ .compatible = "starfive,jh7110-csi2rx" },
>>   	{ .compatible = "cdns,csi2rx" },
>> @@ -1141,6 +1175,7 @@ static struct platform_driver csi2rx_driver = {
>>   	.driver	= {
>>   		.name		= "cdns-csi2rx",
>>   		.of_match_table	= csi2rx_of_table,
>> +		.pm		= &csi2rx_pm_ops,
>>   	},
>>   };
>>   module_platform_driver(csi2rx_driver);

