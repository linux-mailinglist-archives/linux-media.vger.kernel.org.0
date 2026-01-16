Return-Path: <linux-media+bounces-50863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE6ED2F8F5
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 11:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 547443043D41
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BA63612F8;
	Fri, 16 Jan 2026 10:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ne5oBpyF"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D31930AAD4;
	Fri, 16 Jan 2026 10:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768559338; cv=fail; b=F5Y9mu5tzB0btY3KKVdYv4VERZwgcqa8I1Du5+FYU9eBEaXAgVlGiyy2kEMh8tFisBLyAwKjlLnRtG//2SHeNKsnQ0l76xjvKa6OR0gB7M0DYnRaasvy9ZC5Hm4WdrmJSRYQmngZUdQWFx0Crp4n8C7rv1RzeIwSsZBX2sJy3eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768559338; c=relaxed/simple;
	bh=csVd3B41Jar2gnwrjTUS7zTMEwjAE6zNNLEKNaQMS7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mEmd+pKmUauK4A0O+9Hvb42yVxOHTdlx5ogEKRYTi9Mbh1nkOrwJyqK6mf7K/MnnAj6xdsYTX3jB4Na+wmGOBLMBvWLxg2gF2YRTkEo6c8ReEzjhIJL41VR0XMR0m3LlWS+XnFhMUc3cQ0kjvqAChL06MJH5NRbNg4mYDujX5cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ne5oBpyF; arc=fail smtp.client-ip=52.101.62.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlBlFIS5Zfw12+7dtC3w0CjL4ktZtGrclay56cmH4E4GNOf1k+xZ22hVT9V0SuLfHXJmMI8/iY/FyTQdEe3LBH7DaX5IekopRvDubfB/yaDVXhh/R4fYwQJW8LQOH+bH9F/SChDwvfTgMKZDoosCkhcJZcY+x3v1GbWuatjt5U5VTiZ9SkEk8oiNX7Kwe3DgrPVG0SCVJxx9YreAC/aEOzR48yiyYN80RGCLAztgwU+G7Lanyxy0HCz7k6nhlJbHxwy5s+X4yX8gLxEiuFp5zs9I4GY4ZouI7/pPy4qWYG8WlEgekHZasybgVB9c4HpP/ARbL69U0NyaAd3RJVrM5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MtNFG1y8b4sPL5jOVL/gwTX4dIXv0q6AReYQUD6X3Q=;
 b=XWin72FBFlGvCbGp2cA2sXbFlOg85BrNWNxmcqITHj3jy3iJ7omUtkyR1tKExgP5fkOocpbOhFLY5G2VlI7vBKv7pbZgz7yLKnXCHGhqKW1kPPv4mFU+WWpvGILag1L1DpSRC+ZmxUVakQu8AZJjg8WpdPzWDf92ZznLSQDpLq45So7Khy/377aRggKyiktvo7iA/uylnjCcfuBpqlsnkvcS+s4sZ5L4HFt378QF5R6rUB2vI7/oQvqhqovWl75ruSNVjRyN023199sw3N3v3V8/y0/fw0nFCB6NzAGIazm4+Z/gILuvbkSas5Pd+ezawdlf5qzEBoRv9r3Gjp0QpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MtNFG1y8b4sPL5jOVL/gwTX4dIXv0q6AReYQUD6X3Q=;
 b=ne5oBpyFPuywS4IF6kod9OuA0AGp1NjRQ9cg7jncw8JyXb4aWZIogspUCYQb72M+efqKt+h6GZfWLfxZwW/Uq7yyaF8INLKxZak1430jeW3l7MDaF5c5zo4/8BICEWC2RRjUdUbBJkzT9LdtnZpZPB0I4EkRESnObKf5Qgx9kls=
Received: from CH0P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::33)
 by SA1PR10MB997761.namprd10.prod.outlook.com (2603:10b6:806:4bf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 10:28:54 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::74) by CH0P223CA0015.outlook.office365.com
 (2603:10b6:610:116::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.9 via Frontend Transport; Fri,
 16 Jan 2026 10:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 10:28:52 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:28:52 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:28:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 04:28:52 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GASeh92999909;
	Fri, 16 Jan 2026 04:28:41 -0600
Message-ID: <bd58bde2-6500-424d-a358-1450ae03aa97@ti.com>
Date: Fri, 16 Jan 2026 15:58:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/19] media: ti: j721e-csi2rx: add support for
 processing virtual channels
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-12-r-donadkar@ti.com>
 <bd2ee047-efd8-477b-bcdc-27047a1023cc@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <bd2ee047-efd8-477b-bcdc-27047a1023cc@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SA1PR10MB997761:EE_
X-MS-Office365-Filtering-Correlation-Id: cca6c409-c4d8-42e2-55fe-08de54ea0bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|34020700016|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Njc4amx1YjQ3QmFXeEw1TWNLMWZHMTZ3enJVck1yVExNQTlTcjlyb3VLY28r?=
 =?utf-8?B?ZEJSWnhzQmF4c0Y3UHZiNTVqVm5XSmFaREJmOEV3R0kzRFdyYS83dzFwYmRR?=
 =?utf-8?B?czZUOVcxZ2VJbEU2N0dzNGdvRmVSbzJTTEFmbjFMZU9vaWR5bTFtdGVXN1BH?=
 =?utf-8?B?NjMyRm91dStxZ1lXUm5kQUppVXVGWW93ZTV5STJ1WjJNT29Genk3MFlsN2ds?=
 =?utf-8?B?bWh6Sm5vQ1ZwenhsQVVTN1lJUEw4MlBBNmFNQnhwaGkwU2NEcnI3QkIrcVlY?=
 =?utf-8?B?MWxoY1lTQXhWZWx4UHdzZThVVURLUEl3M2RsS1FLcloxbmQvbGJYZ1plVmNu?=
 =?utf-8?B?R1huNGI5Vk1rcDhKZEh2em4xU09tbnczN09tU2RKdWF6OFVGMGpkOTRwZ0pY?=
 =?utf-8?B?cG1xTWpvV0xGbzhSVTkvaUV3K3owN0I4MU51M3NmNlFnL0VVYWhPWUY3N2Zp?=
 =?utf-8?B?b3FNTmxCZzVCZTBGMzExaERDaXk0dE1zb3hpbEx2Tkx2Mjh3bUEwdnIyWEFX?=
 =?utf-8?B?UTVDNnZwWjFHaUxHVEx2cEFzdlpFQjl4UlQ1aGNvOHNhdG0vMWRVTjl1R3ll?=
 =?utf-8?B?NFpZeUFha09CTHZOZW5EUkJwckxVVmVqbm9uM3NhSHg3UWN0SHI3d21DQmdG?=
 =?utf-8?B?OXlSUWlNSVA2SUFmNFNIY24xT2ozaU1hTVF0RlMzbXkwQjk0RllQR0VmRWJ5?=
 =?utf-8?B?anRCYUwrU3Z0ck9OeTFUbEpjUElpeWVDaXJzbmJtZmJrbE9kYTJmWUlkQXFx?=
 =?utf-8?B?YVpZZWNwaGxFTWpHVWdJQ1ltdmx2aGtNR21FVGF4ZHRGTWlHemI2cUdPR1ZP?=
 =?utf-8?B?VVd3cDFxVTB6Sm9zMWR5NlpmOWlOcGljYTdVRVhNdlM1d1FaQzJqWWkwVlZB?=
 =?utf-8?B?QVJNcnR4MHB6R0VJMzZlaTFaeDNxV21FSFFZQmFFVVVBN0FKZ0ZmOWJNQ3Jt?=
 =?utf-8?B?ZEt4VFlVV2tmbkxXSEVZaFlZZkRXMk9vNjJXUFZJRjg1dllCYlAxNkl4b0dG?=
 =?utf-8?B?M21wTmx2VXFhdUV6UjdNN09zTGJhak4wMXVDczQxSUdPVmM3eDZ6TGhhSXJX?=
 =?utf-8?B?UUVnQnZXVEpuVHAyNFJ1R3NyVFZqWktzSVQ4SXV4QmhaTmhxVXhpaWVUWXJS?=
 =?utf-8?B?Tmd2RWZzcklXMFc4elFNWVcrdk9kTk45S2k5VTVEdnJjS25KVVYvSHowV01o?=
 =?utf-8?B?aCtuSXYvaGpiMlR1VEs4a3lVdHRzcDJBRVFHZG9yM0lpNHFCU0pTRk5JeXhp?=
 =?utf-8?B?TFlBWjBSMS9zaCthQlI0L3hwMkhlY2cxTzBqSlFaRUtrNWNZT1NWemM1Zko0?=
 =?utf-8?B?MkxQK080VFlqMGtXd2QrQWZZdjN6V3hnakxTNHp1U2QvTUc0ZjZRN21Da21n?=
 =?utf-8?B?S0hSYytTaGZ3dFEyaTNEcHhLUVBtSEtNZlV4ZmdjMG16L1BWSEtDV1R5RUcz?=
 =?utf-8?B?eDhlUzhKeWlUaGRWSXhDTTU3dndNbk56L0gxcTVsdUpqMUZ2WWF2RVk5UDI4?=
 =?utf-8?B?eDZROERUdG5aL3FWSUxJMGJJcXA2bzA3Z20waFpFekNIQm1KWlVPVkN2VUwz?=
 =?utf-8?B?WVFwb2tzNjBlM0FuUUhRSjA0R3ZiWXhMSHp1YkFrekNTZ3FQbXkwbThENnF0?=
 =?utf-8?B?cVpMVWdYeVlwSEdrRzRpTUoranlZUytmT01RYUhKU3c0RzFIVkNTWkxDbHFO?=
 =?utf-8?B?N2Z2T0liSVpCdHdENXdSTlp5MUdpNUlDNmRHRVpveFRlZWFiUXNsNWUyVmhG?=
 =?utf-8?B?SEYyY0d0dk11cU1iVFdsSjF6Qk9IMm1MeGFndnBua0ZTYTNjR0lXcy9NMk5o?=
 =?utf-8?B?cnRLUmtZZXVvSmE0cTN3czI2M3IxRTA2Um93TjBBOE9tbG8vRUJJd3Y1THBy?=
 =?utf-8?B?eStFZFF4U0dYK0h0WVcxSlRad1pOQmhzeDRpM3d1bVJsNzNJaHBlK01kYlpI?=
 =?utf-8?B?ck9yRWpaOHcrK1VZWkhudlVIN0hGN3JYMm9pZ2JKUWpKU0lqT29oWVNWclZ1?=
 =?utf-8?B?eGVzVlp0cDFPOVdhNVlHRkU0RWpaZWx3NUc5cllWZVBLZW94c2IzKzFSVXU1?=
 =?utf-8?B?YysyTXVsVFlaTy9hSjdoTWpoem9mc1pxTTlJdlhIcVNYaXYrWDlOWWhMMzNQ?=
 =?utf-8?B?b3pSeGdmcHZyMGovbUtGb3QveGdRUXExdnhxZ2EvdTZ0cFZaejUzMmJWcDZQ?=
 =?utf-8?Q?uB00WqIp9YZAgkW/l1IVL/giu2jQIhmEdSp+ynghWRKw?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(34020700016)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:28:52.8337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca6c409-c4d8-42e2-55fe-08de54ea0bbd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997761


On 14/01/26 21:01, Tomi Valkeinen wrote:
> Hi,


Hi Tomi,

Thank you for the review !

>
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Use get_frame_desc() to get the frame desc from the connected source,
>> and use the provided virtual channel instead of VC 0.
>>
>> get_frame_desc() works for single stream case, but as we don't
> Is that supposed to say "get_frame_desc works for multi-stream use case"?


This line has been misleading from many previous versions of this 
series. The main point to highlight in this part of the commit message 
is that we are enabling multi stream support in the later patches of the 
series, so in this patch we will stick to using stream 0. I will remove 
the line talking about "get_frame_desc() works for single/multi stream 
use case".

>
>> support multiple streams yet, we will just always use stream 0.
>> If the source doesn't support get_frame_desc(), fall back to
>> the previous method of always capturing virtual channel 0.
>>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 45 ++++++++++++++++++-
>>   1 file changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index f54ad67ff3f9d..6f9f34aa26f1b 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -32,6 +32,7 @@
>>   #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
>>   #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
>>   #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
>> +#define SHIM_DMACNTX_VC			GENMASK(9, 6)
>>   #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
>>   #define SHIM_DMACNTX_YUV422_MODE_11	3
>>   #define SHIM_DMACNTX_SIZE_8		0
>> @@ -110,6 +111,9 @@ struct ti_csi2rx_ctx {
>>   	struct media_pad		pad;
>>   	u32				sequence;
>>   	u32				idx;
>> +	u32				vc;
>> +	u32				dt;
>> +	u32				stream;
>>   };
>>   
>>   struct ti_csi2rx_dev {
>> @@ -570,7 +574,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	ti_csi2rx_request_max_ppc(csi);
>>   
>>   	reg = SHIM_DMACNTX_EN;
>> -	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
>> +	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, ctx->dt);
>>   
>>   	/*
>>   	 * The hardware assumes incoming YUV422 8-bit data on MIPI CSI2 bus
>> @@ -610,6 +614,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	}
>>   
>>   	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
>> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>>   
>>   	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>>   
>> @@ -884,12 +889,41 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	}
>>   }
>>   
>> +static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>> +{
>> +	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct v4l2_mbus_frame_desc fd;
>> +	struct media_pad *pad;
>> +	int ret, i;
>> +
>> +	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> +	if (!pad)
>> +		return -ENODEV;
>> +
>> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>> +		return -EINVAL;
>> +
>> +	for (i = 0; i < fd.num_entries; i++) {
>> +		if (ctx->stream == fd.entry[i].stream) {
>> +			ctx->vc = fd.entry[i].bus.csi2.vc;
>> +			ctx->dt = fd.entry[i].bus.csi2.dt;
>> +		}
>> +	}
> I think you can "break" when you find the stream. But this should also
> catch the case when there's no matching stream, and give an error in
> that case.


Right. Will add.


Rishikesh

>
>   Tomi
>
>> +
>> +	return 0;
>> +}
>> +
>>   static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   {
>>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>>   	struct ti_csi2rx_buffer *buf;
>> +	const struct ti_csi2rx_fmt *fmt;
>>   	unsigned long flags;
>>   	int ret = 0;
>>   
>> @@ -904,6 +938,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (ret)
>>   		goto err;
>>   
>> +	ret = ti_csi2rx_get_vc_and_dt(ctx);
>> +	if (ret == -ENOIOCTLCMD) {
>> +		ctx->vc = 0;
>> +		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>> +		ctx->dt = fmt->csi_dt;
>> +	} else if (ret < 0) {
>> +		goto err;
>> +	}
>> +
>>   	ti_csi2rx_setup_shim(ctx);
>>   
>>   	ctx->sequence = 0;

