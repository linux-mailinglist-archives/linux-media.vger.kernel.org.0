Return-Path: <linux-media+bounces-48461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC48CAF9BE
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 11:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A08730D0EA6
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 10:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A4D2BE7A7;
	Tue,  9 Dec 2025 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HYsLHnLy"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DCA13774D;
	Tue,  9 Dec 2025 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274932; cv=fail; b=UHq5sw8xgS2PCEFBWwDp01XDCBF5TiBt5gFUxK0xJoYSlg9Mp2EYvsKPQWyyzxi1ySS+/NNlmzOa4vFqJ0HurBUQv9FOdLhSau2S6I2NAoTDqXolmXh9FlqOCfkzD5Ohu1zxCqSiYrTa0h9V4NEhzzFin+t2bau594tfZ3l0wJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274932; c=relaxed/simple;
	bh=rdL62lWk7bNNkojedOCML9wJe6OpF3I/SCGLxPPBc6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XlgrRO8pecv+v8jL9BjyCyrxShiyTsMQxYQMZ0EDjIUjfg2h8asoyCn2HePc9+zwLonG9owywgh50Q3Xg/pH888IbFqiyGt6oAWAGZ6GCfcxV1SG8dtAuTEcKCAPFUSyTlCmAMoz5FxpMFE6eKvWB82BNXW5qr7FvrnI6Bxl5HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HYsLHnLy; arc=fail smtp.client-ip=52.101.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZAPBzmoGkdpKVAbwdbPtLsBmWSRENA3kdPULRJueEPBAuaower55wSOQC+C+D1QGAtknBCAr+W2wNNN5mMmd38hzi1Kd2Xy6lYCyLePhRQsyVwYEwqqDbi24owVURAOKWeMKgA+SFrJZwI8wLp7DDL45CoH/M/Qr6zABgkncX9TIGXK/ihk9Owr41sixKLvWKa5uJ/YAM/Zl48QO/DCfAd2tclKHM2o1CzMaxyqaEaaKzXXnz6QH/8dPx5M/D7XeiW1uohYbZgyqXFRkE2GhvNWQgqz0WRYMsaclqoFEZlQrmKMK8JH5pdfNxu3kpGold6aJQBjN4ieUJzgJFXkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gp0rQZDioLfoq1lgj+JsjiuaEd6b1W4+oaU7bffQajw=;
 b=hwDXlEXYC5nssMVxzLuzTjceF2BnXQEKsl+TfBOG6uCzI5RxOPJPlNRBppDtfg2uGPnTe/FtVdeiaFTGOanknb4EXxLtNV3lD0UY0iJiFlbUrDebcqqLYBg8v1zZFZOjSVMT431je4GyMWqn9tdBNFTFmo/AfEqW8vuv+vbW97BNCZC1UMORLPtVXiSz9iBJDysw5hNbcW+19pFIX1QBHV/x7lcffy0K7K+5TgDsm4AaezvmGjnUaN5HxdzLiAfeTE8Q/iHrc6fMPqkKcU0v0EElWsACR1b5kWn3JDpPEtyIqTq/2zLejsPKClSNroU2zltUB8ezwT5oZXr7v2Y/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp0rQZDioLfoq1lgj+JsjiuaEd6b1W4+oaU7bffQajw=;
 b=HYsLHnLyqLshPJvCmPOF9JVz8wCJQNMaZPRHAX5ywSBe7E5Tq8Bx6Q/Ul/nUKZakF14XRUtqfLJFM/0Mj/mFaywcB+VBa3tzOa/BIiTRf91gqNc73mXudfJjUNIqcoER28hnwc+9ss21kdVgFFyBraxkhicHS07KbdqjKc7yIFg=
Received: from DM6PR07CA0048.namprd07.prod.outlook.com (2603:10b6:5:74::25) by
 DM6PR10MB4314.namprd10.prod.outlook.com (2603:10b6:5:216::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.6; Tue, 9 Dec 2025 10:08:44 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:5:74:cafe::45) by DM6PR07CA0048.outlook.office365.com
 (2603:10b6:5:74::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 10:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 10:08:43 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 04:08:40 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 04:08:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 04:08:39 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9A8X8U1035399;
	Tue, 9 Dec 2025 04:08:34 -0600
Message-ID: <719ee15a-92fd-4597-b25e-196f4a906a5a@ti.com>
Date: Tue, 9 Dec 2025 15:38:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/18] media: ti: j721e-csi2rx: add multistream support
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
 <20251112115459.2479225-14-r-donadkar@ti.com>
 <1e7be0c3-b7da-4eac-9a39-147c1e627cbb@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <1e7be0c3-b7da-4eac-9a39-147c1e627cbb@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|DM6PR10MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: 4824667a-5d56-4d74-1f71-08de370aef15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXRWdzNUYmR5ZWRXUC9sRkRsTVppL1VKa280NXZ2ajBrSlRDMlBJcnIvU0Ji?=
 =?utf-8?B?dGxEb1BYNXJHbmkyZXdQdGc3M29iYXpZMVZRbFEwcGtFR0NtTG10eDlna1E5?=
 =?utf-8?B?cloyRjc2RmVNV1hvUmdzNFE4RlVRS2h3ZStIdS83azNBSkNWekFZNjlsMUw1?=
 =?utf-8?B?NmZPMWFqbEVwQWxnUHA0UTBMMmdEdHIrd2M4Wjd6dVFuVmExVEpVYU1ncHZk?=
 =?utf-8?B?SGU5TVc5S2s5YWlSbnNnQUdCc3hNUDZOdHlsUGZGSS85Q1FVRERWb05YdnAx?=
 =?utf-8?B?cWlJRUFUMmFOcXVLNG5mdkVQRFJNTVBhQkl3VC9TcUdTcGkwcFRsOXpHMjVo?=
 =?utf-8?B?ak1vN1RtaGh0NWNCWWZLMklYZ3NDNlZLUUs3V3hmbWFMQ0xtNXJGbTNYbkdL?=
 =?utf-8?B?bXdQZ25XWDNOcUZocm1iYTdwTnRQV3k0Sm44T2RsTWYzL3VsUUN0azdmZzBo?=
 =?utf-8?B?OG5nc0p3UXBTREIvN2FkellBWlNucmY3K0dpSTJBNHMyMDRBaUNrZ1dtWkJs?=
 =?utf-8?B?U2dac1lqTGNDOXdIZVEyNTVLTVplb2VsYUJZZ2FRUkkvUnhtczRsdWI1em4w?=
 =?utf-8?B?NWxpaTdrc3grd3BqY3hYTmtJYUc4QjhRNHhCWm4xa3o0WFlQbXFOWEh5YWFZ?=
 =?utf-8?B?eHdwY0ZBdnZyb3NHd09UVVVxUHFGN3luSzhob0JLUDFkcHNvRGJvZUkrYm0x?=
 =?utf-8?B?NWtnSmc2djNJT3N0bGd2cXp0Qjh0NFF0V29JUVdtcS9XWmxSdHQ4VHFvU3Q0?=
 =?utf-8?B?WmxrbGo0L3lrdWdaQ05hQTVOUTZHclFyb1VNeU4wRFhIQzlqL1EvNks4TWVq?=
 =?utf-8?B?MlNWMFljMkNoelBRa0wvVmJ1NEYyUFV3S2twV1NFUGNIcEIvN1ZmZHR0and2?=
 =?utf-8?B?UFluRTd5WTUrWnhGbDFqN0p6V21xeG5wK20rQmo1bFhGUFpMSTVuYWt1NGhG?=
 =?utf-8?B?cWhSSm9ZdXJmL3RhZnlYd2cxTzNaZFd0aXQ4aitxNURjdkpWa0J4ZTZkS0pU?=
 =?utf-8?B?R3h2L1Y5MDJFQWFlTnhkcDJtRWxMaHRRVnZCamJTYnU1R2diTFhmMXhRVEFT?=
 =?utf-8?B?dEgvWjZIUHZpMnpxQ2g4bE1xRGhtUm01VjFOVFBucWJBSHEydW05eGlsWFA0?=
 =?utf-8?B?K2RKaEVaQWErWGZtT1kzWkRuamNaRVZpRUNPUXdrYnl4MXVVWG1QSDRObFVY?=
 =?utf-8?B?VHlzZ0d2UVNmVEdjaXJpQWVMNTRWUmoyZlRFTDBoUEdhRVQxSTVYeTViVjhS?=
 =?utf-8?B?R0dBdjhxSDlxNVdrRHpFdE56UXMwNmttdFRNQU1vd0ZtWXZHY1kybER3bkxk?=
 =?utf-8?B?NGVSU3ZYTWs2Sm5hMGJBdm04eWlFRVhkUC92emM5d0dlTmJrOG1xQjludjIx?=
 =?utf-8?B?N2pORTc5ZkFBRzVoWVNmNXVZZnFvZzROZzdlSmxFR2p5alV0b3hrV1o2TFVU?=
 =?utf-8?B?elRYeHk0emJWN0MzSGpvK2JrUUZQelliWVFWSjIybEZpRGgzRnJYRjR1Z0kv?=
 =?utf-8?B?Z1VVLzNiMXI4eVFMb3NlQVk5MTViQ3d4TGtTeXl1ME1jV2VGQzZPbFNudnJ1?=
 =?utf-8?B?MlJoOGxFUktqVnl5SUxIY1ZqV2xkSHNsWXpJQWdwd1p2NUx0Zkd3ajN1UTJS?=
 =?utf-8?B?S3ZaNW4xWUJ6SzluRlEwWUF5L0dXRTJxVkFOMGJNVm9heVNCdVRnTzJodWxi?=
 =?utf-8?B?SXRuYlNpdHkrazM2VHdwQjloWFRXSlhYQVVWK2xpeWsvR1B1YW51ejVJbWVs?=
 =?utf-8?B?aHV1eUU1N3Ixbmh3eGI0UC9Wd0NhY3NibHorbStIT3p6RENIU2YyUEhUTGMy?=
 =?utf-8?B?Q2dYcXg4K0pWSjdPeUN4a2JwdUdNeld4RVhJemJjU241QzhEbjZEbXJPbTVT?=
 =?utf-8?B?SGQwNVF3WmJSZkh5RlBoR05iTTRnQlhLaUVId3hoV2hCdzZibWZsRjdSSkJG?=
 =?utf-8?B?TVJBRERHd2pvZERrK0NJZEwvUGVGUllFUmFuZkxPZEpGVlh0OEhqRUJrNTFP?=
 =?utf-8?B?cGZtY2RObjNlVFI0NE15ZWZJZTZaWWIxWktBMFo1T0x6d2JoRmRJQ1lsWFFk?=
 =?utf-8?B?aUhrUEpCZjNZZnNRaXVQdWNVb21GWjFpckpCSDd5NEpKOUxyNlBJdDVnUHZt?=
 =?utf-8?Q?z98E=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:08:43.2767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4824667a-5d56-4d74-1f71-08de370aef15
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4314


On 01/12/25 18:33, Tomi Valkeinen wrote:
> Hi,


Hi Tomi,

Thank you for the review !

>
> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Each CSI2 stream can be multiplexed into 4 independent streams, each
> Well, that's not true, at least generally speaking (there can be more
> than 4). Is that specific to TI hardware?


Yes, The commit message talks about how TI CSI does the multiplexing of 
CSI stream from the sensor into 4 streams as show in the Figure 12-388 
in AM62A TRM[1]. I will modify the commit message to mention that this 
is TI CSI specific.


[1]: 
https://www.ti.com/lit/ug/spruj16c/spruj16c.pdf?ts=1765273774405&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FAM62A7


>
>> identified by its virtual channel number and data type. The incoming
>> data from these streams can be filtered on the basis of either the
>> virtual channel or the data type.
>>
>> To capture this multiplexed stream, the application needs to tell
>> the driver how it wants to route the data. It needs to specify
>> which context should process which stream. This is done via the
>> new routing APIs.
>>
>> Add ioctls to accept routing information from the application and save
>> that in the driver. This can be used when starting streaming on a
>> context to determine which route and consequently which virtual channel
>> it should process.
>>
>> De-assert the pixel interface reset on first start_streaming() and assert
>> it on the last stop_streaming().
>>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 224 ++++++++++++++----
>>   1 file changed, 179 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 126a62fa2c4c4..c8e0e761f2802 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -103,6 +103,7 @@ struct ti_csi2rx_dev;
>>   
>>   struct ti_csi2rx_ctx {
>>   	struct ti_csi2rx_dev		*csi;
>> +	struct v4l2_subdev_route        *route;
>>   	struct video_device		vdev;
>>   	struct vb2_queue		vidq;
>>   	struct mutex			mutex; /* To serialize ioctls. */
>> @@ -136,6 +137,7 @@ struct ti_csi2rx_dev {
>>   		dma_addr_t		paddr;
>>   		size_t			len;
>>   	} drain;
>> +	bool                            vc_cached;
>>   };
>>   
>>   static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
>> @@ -143,17 +145,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
>>   	return container_of(sd, struct ti_csi2rx_dev, subdev);
>>   }
>>   
>> -static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
>> -	.width = 640,
>> -	.height = 480,
>> -	.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> -	.field = V4L2_FIELD_NONE,
>> -	.colorspace = V4L2_COLORSPACE_SRGB,
>> -	.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> -	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> -	.xfer_func = V4L2_XFER_FUNC_SRGB,
>> -};
>> -
>>   static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>>   	{
>>   		.fourcc			= V4L2_PIX_FMT_YUYV,
>> @@ -566,8 +557,10 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>>   
>>   	/* De-assert the pixel interface reset. */
>> -	reg = SHIM_CNTL_PIX_RST;
>> -	writel(reg, csi->shim + SHIM_CNTL);
>> +	if (!csi->enable_count) {
>> +		reg = SHIM_CNTL_PIX_RST;
>> +		writel(reg, csi->shim + SHIM_CNTL);
>> +	}
>>   
>>   	/* Negotiate pixel count from the source */
>>   	ti_csi2rx_request_max_ppc(csi);
>> @@ -888,30 +881,80 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	}
>>   }
>>   
>> +static int ti_csi2rx_get_route(struct ti_csi2rx_ctx *ctx)
>> +{
>> +	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct media_pad *pad;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_subdev_route *r;
>> +
>> +	/* Get the source pad connected to this ctx */
>> +	pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
>> +	if (!pad) {
>> +		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
>> +		return -ENODEV;
>> +	}
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
> This looks a bit concerning. You lock the state, find the correct route
> and store a pointer to the route into the ctx, then unlock the state...
> Alarm bells should be ringing here.


Thank you for pointing out, I will store the stream number instead of 
storing the pointer for route, here we don't allow anyone to update the 
routes when we are in streaming (i.e. if csi->enable_count > 0, return 
-EBUSY). So, the stream number is not likely to change.

>
>> +
>> +	for_each_active_route(&state->routing, r) {
>> +		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> for_each_active_route() already checks this ("_active_").


Okay, I will remove the check for active route.

>
>> +			continue;
>> +		if (r->source_pad != pad->index)
>> +			continue;
>> +
>> +		ctx->route = r;
> Shouldn't you break here?


Right, I will add a break here

>
>> +	}
>> +
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	if (!ctx->route)
>> +		return -ENODEV;
>> +
>> +	return 0;
>> +}
>> +
>>   static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
>>   {
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct ti_csi2rx_ctx *curr_ctx;
>>   	struct v4l2_mbus_frame_desc fd;
>> -	struct media_pad *pad;
>> -	int ret, i;
>> +	struct media_pad *source_pad;
>> +	struct v4l2_subdev_route *curr_route;
>> +	int ret;
>> +	unsigned int i, j;
>>   
>> -	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> -	if (!pad)
>> +	/* Get the frame desc form source */
>> +	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> +	if (!source_pad)
>>   		return -ENODEV;
>>   
>> -	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
>> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
>>   	if (ret)
>>   		return ret;
>>   
>>   	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>>   		return -EINVAL;
>>   
>> -	for (i = 0; i < fd.num_entries; i++) {
>> -		if (ctx->stream == fd.entry[i].stream)
>> -			return fd.entry[i].bus.csi2.vc;
>> +	for (i = 0; i < csi->num_ctx; i++) {
>> +		curr_ctx = &csi->ctx[i];
>> +
>> +		/* Capture VC 0 by default */
>> +		curr_ctx->vc = 0;
>> +
>> +		ret = ti_csi2rx_get_route(curr_ctx);
>> +		if (ret)
>> +			continue;
>> +
>> +		curr_route = curr_ctx->route;
>> +		curr_ctx->stream = curr_route->sink_stream;
>> +
>> +		for (j = 0; j < fd.num_entries; j++)
>> +			if (curr_ctx->stream == fd.entry[j].stream)
>> +				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
>>   	}
>>   
>> -	return -ENODEV;
>> +	return 0;
>>   }
>>   
>>   static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>> @@ -934,13 +977,24 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (ret)
>>   		goto err;
>>   
>> -	ret = ti_csi2rx_get_vc(ctx);
>> -	if (ret == -ENOIOCTLCMD)
>> -		ctx->vc = 0;
>> -	else if (ret < 0)
>> +	/* If no stream is routed to this ctx, exit early */
>> +	ret = ti_csi2rx_get_route(ctx);
>> +	if (ret)
>>   		goto err;
>> -	else
>> -		ctx->vc = ret;
>> +
>> +	/* Get the VC for all enabled ctx on first stream start */
> Is the comment right? How does this work? ti_csi2rx_get_vc() is passed a
> single context, but... it gets VCs for all contexts? And shouldn't these
> also be dealing with DT at the same time with VC?


Yes, here we pass a single context to ti_csi2rx_get_vc(), but we loop 
over all the ctx on first stream start.

I will modify this function to also deal with DT.

>
>> +	mutex_lock(&csi->mutex);
>> +	if (!csi->vc_cached) {
>> +		ret = ti_csi2rx_get_vc(ctx);
>> +		if (ret == -ENOIOCTLCMD) {
>> +			ctx->vc = 0;
>> +		} else if (ret < 0) {
>> +			mutex_unlock(&csi->mutex);
>> +			goto err;
>> +		}
>> +		csi->vc_cached = true;
>> +	}
>> +	mutex_unlock(&csi->mutex);
>>   
>>   	ti_csi2rx_setup_shim(ctx);
>>   
>> @@ -960,8 +1014,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	dma->state = TI_CSI2RX_DMA_ACTIVE;
>>   	spin_unlock_irqrestore(&dma->lock, flags);
>>   
>> +	/* Start stream 0, we don't allow multiple streams on the source pad */
>>   	ret = v4l2_subdev_enable_streams(&csi->subdev,
>> -					 TI_CSI2RX_PAD_FIRST_SOURCE,
>> +					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>>   					 BIT(0));
>>   	if (ret)
>>   		goto err_dma;
>> @@ -985,17 +1040,26 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	int ret;
>>   
>> -	video_device_pipeline_stop(&ctx->vdev);
>> +	mutex_lock(&csi->mutex);
>>   
>> -	writel(0, csi->shim + SHIM_CNTL);
>>   	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>>   
>> +	/* assert pixel reset to prevent stale data */
>> +	if (csi->enable_count == 1) {
>> +		writel(0, csi->shim + SHIM_CNTL);
>> +		csi->vc_cached = false;
>> +	}
>> +
>> +	video_device_pipeline_stop(&ctx->vdev);
>> +
>>   	ret = v4l2_subdev_disable_streams(&csi->subdev,
>> -					  TI_CSI2RX_PAD_FIRST_SOURCE,
>> +					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>>   					  BIT(0));
>>   	if (ret)
>>   		dev_err(csi->dev, "Failed to stop subdev stream\n");
>>   
>> +	mutex_unlock(&csi->mutex);
>> +
>>   	ti_csi2rx_stop_dma(ctx);
>>   	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
>>   }
>> @@ -1038,25 +1102,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
>>   	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>>   	*fmt = format->format;
>>   
>> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
>> -					   format->stream);
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>>   	*fmt = format->format;
>>   
>>   	return 0;
>>   }
>>   
>> -static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
>> -				   struct v4l2_subdev_state *state)
>> +static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
>> +				     struct v4l2_subdev_state *state,
>> +				     struct v4l2_subdev_krouting *routing)
>>   {
>> -	struct v4l2_mbus_framefmt *fmt;
>> +	int ret;
>>   
>> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
>> -	*fmt = ti_csi2rx_default_fmt;
>> +	const struct v4l2_mbus_framefmt format = {
> "static const"


Okay


Rishikesh

>
>> +		.width = 640,
>> +		.height = 480,
>> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> +		.field = V4L2_FIELD_NONE,
>> +		.colorspace = V4L2_COLORSPACE_SRGB,
>> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +	};
>>   
>> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
>> -	*fmt = ti_csi2rx_default_fmt;
>> +	ret = v4l2_subdev_routing_validate(sd, routing,
>> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
>> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
>>   
>> -	return 0;
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Only stream ID 0 allowed on source pads */
>> +	for (unsigned int i = 0; i < routing->num_routes; ++i) {
>> +		const struct v4l2_subdev_route *route = &routing->routes[i];
>> +
>> +		if (route->source_stream != 0)
>> +			return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
>> +				    struct v4l2_subdev_state *state,
>> +				    enum v4l2_subdev_format_whence which,
>> +				    struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>> +
>> +	if (csi->enable_count > 0)
>> +		return -EBUSY;
>> +
>> +	return _ti_csi2rx_sd_set_routing(sd, state, routing);
>> +}
>> +
>> +static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_subdev_route routes[] = { {
>> +		.sink_pad = 0,
>> +		.sink_stream = 0,
>> +		.source_pad = TI_CSI2RX_PAD_FIRST_SOURCE,
>> +		.source_stream = 0,
>> +		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>> +	} };
>> +
>> +	struct v4l2_subdev_krouting routing = {
>> +		.num_routes = 1,
>> +		.routes = routes,
>> +	};
>> +
>> +	/* Initialize routing to single route to the fist source pad */
>> +	return _ti_csi2rx_sd_set_routing(sd, state, &routing);
>>   }
>>   
>>   static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
>> @@ -1065,14 +1188,18 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
>>   {
>>   	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>>   	struct media_pad *remote_pad;
>> +	u64 sink_streams;
>>   	int ret = 0;
>>   
>>   	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>>   	if (!remote_pad)
>>   		return -ENODEV;
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       TI_CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>>   
>>   	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
>> -					 BIT(0));
>> +					 sink_streams);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -1087,17 +1214,21 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>>   {
>>   	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>>   	struct media_pad *remote_pad;
>> +	u64 sink_streams;
>>   	int ret = 0;
>>   
>>   	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>>   	if (!remote_pad)
>>   		return -ENODEV;
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       TI_CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>>   
>>   	if (csi->enable_count == 0)
>>   		return -EINVAL;
>>   
>>   	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
>> -					  BIT(0));
>> +					  sink_streams);
>>   	if (!ret)
>>   		--csi->enable_count;
>>   
>> @@ -1106,6 +1237,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>>   
>>   static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
>>   	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
>> +	.set_routing = ti_csi2rx_sd_set_routing,
>>   	.get_fmt = v4l2_subdev_get_fmt,
>>   	.set_fmt = ti_csi2rx_sd_set_fmt,
>>   	.enable_streams = ti_csi2rx_sd_enable_streams,
>> @@ -1284,7 +1416,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>>   	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
>>   	sd->internal_ops = &ti_csi2rx_internal_ops;
>>   	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> -	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>>   	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
>>   	sd->dev = csi->dev;
>>   	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
>> @@ -1347,6 +1479,8 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>>   
>>   	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
>>   
>> +	ctx->route = NULL;
>> +
>>   	ctx->pad.flags = MEDIA_PAD_FL_SINK;
>>   	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
>>   	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);

