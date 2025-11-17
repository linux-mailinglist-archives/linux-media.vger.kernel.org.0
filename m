Return-Path: <linux-media+bounces-47191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B8C627F0
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 07:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 072063517FC
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 06:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCE531282A;
	Mon, 17 Nov 2025 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bXVPwGIA"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E2814F112;
	Mon, 17 Nov 2025 06:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763360261; cv=fail; b=R8BCUHBgaDNBqX97wOZbOFNOaJpP4SccB2Mm59KXvrnCewqsZXpjZGo81CCPmDwIKW1S/iZr0sFJUr/WPp1WscTno+zGx0WbZXCxW8fKqUweCuI2PGhrzkSvuOsVwfVUBDxmtrCiXWAdKJYRgevh/ExDDiqOrJIYEv979BdO6r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763360261; c=relaxed/simple;
	bh=zp/yypO/GKOlh7xWVgXdJ7gjjd6HlMKmcXU3jo9vatU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jIdC6EIwl8ItXGQ6mbwgsXzfkQSYHf3MCZwSL3JQybKRYYZWqCpLCb156Ikkpdnxq8cnVMQD/rinlejE33w3cODDG3xUL67efLRmJ3yM9uNrWpTW+YFMx1C2S0xlQDVemTZqYTJEgejmzRytxVLR7P2yp2LTOtNNHF/Q3kixXY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bXVPwGIA; arc=fail smtp.client-ip=52.101.46.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDaMdMh3BHT+XqcyBorOqxvgsV41efvhfGs/Rv085ZtW1XoKD8nAFOU1Toc/pKKaZLVxzlYRTq6BpFQ5DkvaZdb8eXWxD1cwpUtGsTE5RpXONG2H4TCIgm5MHSq89dUWdVHgi0SO87Q9uw2JZYGUY1hLVeAfcy7NM0kdzTG6Fg4PIECLD9UFmtFJ6sTsjI4w6/+H3NymxsUrCCKrtfWkf3SDw3qUMRLEJ+uLUoy30uKQG6L8yPNx0k8qpPjnaZElrWkb80u0GTvkLx8GfRo8gyfcGynbv8oqARjScgSGFit/GoW4nFZh8CyLMCZANSvUuQjYgDXvPzqYHYLukBf9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcP2zEpGXCrVBd7xFMRzI2jWn9iFyWxNaRxl5VCPDoA=;
 b=bqi55g318vnM6oZl4625rQbG79FkdVXnNIQg/SeJ6y95XGoKrTrp8cUuTJy8MNzW+IAnt2ffVFF7OQR+dV5Eu+oj1MyQZq1OilfxuFDA5m1GiriZckQIHzkaqqyO4W8TMSslIZHETeiRzDLuxUS+hhz3RZZd/xUamrxE8JLUYcw6HevLBIz0s0PCj7xOmZjFd84OEvEYUljhh61jVzfNdIxC3bGTwUDqpZg19UwKXfdgnQnHmPXaTRcNq5AKepSHT10NPoamimdEhGv7Igf0G48P6M86+8ykKdeqSP/ZIYPKYMPN6nLNACm7K/f+3iS9380aqgA8C+jAfnCWB78rNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcP2zEpGXCrVBd7xFMRzI2jWn9iFyWxNaRxl5VCPDoA=;
 b=bXVPwGIA7BgMogMBIN7hiVxy8nYOiVbM8DN+YPBMOqfK+nO21IGPM80cjTzBIo/SMp5Plb260y+TZdeLHMa5kU4UCRWiQIUWedGHpK7Z+W+T4WMMy6ewnXrB04Mv247qNlFX6DohI3msu0jPt5NvQfd2Dmsqyq6yK3dwZ6aG5Dw=
Received: from CH2PR07CA0050.namprd07.prod.outlook.com (2603:10b6:610:5b::24)
 by CY8PR10MB6849.namprd10.prod.outlook.com (2603:10b6:930:9d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 06:17:33 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::f7) by CH2PR07CA0050.outlook.office365.com
 (2603:10b6:610:5b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 06:17:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 06:17:32 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 00:17:29 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 17 Nov
 2025 00:17:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 17 Nov 2025 00:17:29 -0600
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH6HO471958033;
	Mon, 17 Nov 2025 00:17:25 -0600
Message-ID: <f985ff4a-526a-4c8f-81b3-d60d9646c897@ti.com>
Date: Mon, 17 Nov 2025 11:47:24 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 4/4] media: ti: vpe: Add the VIP driver
To: <hverkuil+cisco@kernel.org>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, Sukrut Bellary
	<sbellary@baylibre.com>
References: <20251024094452.549186-1-y-abhilashchandra@ti.com>
 <20251024094452.549186-5-y-abhilashchandra@ti.com>
 <bd705151-0bea-47b5-bf22-1e2531ef7e8e@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <bd705151-0bea-47b5-bf22-1e2531ef7e8e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|CY8PR10MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4e19ff-40ae-47f0-fd03-08de25a0fe73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|4022899009|36860700013|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajd3dUJieWlxRGlReHNPRjRZK1ZlS3dLdmp0eU1HQTBxM096UnB0Vk0xV3M1?=
 =?utf-8?B?aytUQ096RlFObmlOL2FCMURQa21QWVZhNGtuM2JrRThETnpVYnVGcFphUXBT?=
 =?utf-8?B?SnhkcFo4WjdVQUlWVkYxWHc4TU5Lb2E3amZOOHRxL011ZGIwa0VlZXhnTzVT?=
 =?utf-8?B?WlVZSFV6RnVsM1A1cWZ5RDNWVXBodWFCSUltdnlCWDZ1WnNKUkQ1Z2FZL1Zv?=
 =?utf-8?B?SnFJS2lBMHBodCtvNjN3di9QVmdUL1pXZGFEWnVGZFRINkNEUDIvZlJoY3Z1?=
 =?utf-8?B?UG1LdEpnQnBSYUVpNTFTMXRmUmVhTWhXZnd4VWRzaERBSWhTNzE1NktsWjYv?=
 =?utf-8?B?WXZxUUp4alpXS1VmWFM2dW8reDFPK2hjUEtUYzE1VGlwMjUrWGx1QXdVVFgx?=
 =?utf-8?B?OTd5aWxWTzZVdlBiNU8yWk5CSGhGY2M5enplZk1oSldBY1E0aGpPb0RUYjg3?=
 =?utf-8?B?dFJSTVRFZzJYOEpFRml5K1kwSzB4Qm9sb1EzcVlBY3BRY0hZdC83c2JRWjZY?=
 =?utf-8?B?Wnp4WUZ4akVDb2t3K01WbGR1cTFqWEFGMzNkaC90UHJNTDRneWpsWWdBQkRa?=
 =?utf-8?B?eEQrUm8rRE1sUEt5MGdrbWxvRmtjc0tWQlNKOVZXbU1seTNRTzZpQ3RoUy9X?=
 =?utf-8?B?VGxJUUNIN2MxaERWWFlSV0JTNEd0bVNzSFprblJyZFBEQU5QZXlTZ3E3Nkpj?=
 =?utf-8?B?Vi9IZ2hHWEhFRyt4VENZZ3FPOVB1ZDQ0TEpQTTV2VVp1NzBkZEZLL0YrSWY3?=
 =?utf-8?B?WXlUNmVvdUhNcmVPK0ErNzJ0eDVKeHU1QXVhczNpYzdPbW04eW52bXk2bHZH?=
 =?utf-8?B?UVFRNC91SEdrQk1nMmxvNXZjRkN6ZVptVlVsQ3U2SmtQa3RQd2NzbE5DcDls?=
 =?utf-8?B?QVdGamRENFFyOHdjbGkrN1BwUm9tWUZYRFNNL0RsMnJCRDVScStiMGNEajM2?=
 =?utf-8?B?THJIa1JTeUJwNHNDS2xkUlJNMWpUWVAxUCtXVXpyWmFHZnltWWZuNHYvUHNt?=
 =?utf-8?B?Z0F2ZStwSWJxYUVNLyt4RnB5dkpCMlF2a1NXc1MrSmVmMXRSa0dJdDVOYUNU?=
 =?utf-8?B?OUtsUjhVVlhzTEMrcURzTnc0ZmVRamFuTkVtcFpVUjdYYjVpUlduZGxUdEtP?=
 =?utf-8?B?ajhteExDNzY3bW9YZ3g4Z1VheEtBU2NaWE9sMElPT3lZQzczM0VITi9xZ0tv?=
 =?utf-8?B?aTdKNlQ0NTU5ZXpCUVh0Tld0amlKWWx1OWg2bHNNR0tIdVVvVkNYeExXZ2RX?=
 =?utf-8?B?UkNkSVBRMW8yZW1PU3lMMFNiWGhiSm9XSEtzVDhMWm1aendZcU9MNDFpbXQz?=
 =?utf-8?B?Z2NSQU1lRk0wbjJKSkV4M2dlV1dJcGR5cElUK2NBd012bXRzV1VGbXRpOHdU?=
 =?utf-8?B?alBhcllqRUIyS0dZeTZWTnVBQk16YWJKUFFQYzZMaW1MbkVHenlPaEp6Y0tB?=
 =?utf-8?B?WGtGdWZOZzJvNnl0VmtvcHo0QWVsRGVpeUlCVVd1czA5S0RwRjY3L1Fyc1lJ?=
 =?utf-8?B?SVVBdzNROU9IaGcyVGVTNmZjZW95U0crWFluWm9yQmhRZlJrUnhDZUJHckZa?=
 =?utf-8?B?VU1XaXVXYUw5QnF6Z3dTTWowNldEYXc5ZFg1S2t2Nko1NlZHUndlNlRJRHJ3?=
 =?utf-8?B?N1ljZG5qd1BMdlo2THVGajVsRlNrYjhGcjZwT051THQ5azNwM3lodHFVSXpy?=
 =?utf-8?B?UnJWZmNaMFdrWm1xZUZCanpCblJ5WjRLT0t4ZHl2SjlxNkdtMG1oTUh4bU9m?=
 =?utf-8?B?UHFKajU2TzJPOG9WRHJlVEd0S3IwZk5tVHc2MWREa3paNWJxRHczelYxMnVl?=
 =?utf-8?B?aWVQamMrbVpSbjM4QWZFWlB6Z29rajQ3WnpkWkl3d212dnllOEErSkIrQVVj?=
 =?utf-8?B?aUtZMWxVYnUzbUhwd3MyRkJ6QytVQmluRm5jbklGK2RQSUIxRmU5cUlsMklJ?=
 =?utf-8?B?NmpITFEraVNOU0lSaDhaZXg1REVaMWVhZEVHN09JNXBrNURmdU9vY2NoWkdy?=
 =?utf-8?B?elBNNzc1QWtwbTZ2K1ZMZmlucTZpQ2l1azYwSEJldm9XQjNjbkpscXRCbXBM?=
 =?utf-8?Q?BasT7n?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(4022899009)(36860700013)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 06:17:32.6524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4e19ff-40ae-47f0-fd03-08de25a0fe73
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6849

Hi Hans,
Thanks for the review.

On 03/11/25 18:42, hverkuil+cisco@kernel.org wrote:
> Hi Yemike,
> 
> Some review comments below:
> 
> On 24/10/2025 11:44, Yemike Abhilash Chandra wrote:
>> From: Dale Farnsworth <dale@farnsworth.org>
>>
>> VIP stands for Video Input Port. It can be found on devices such as DRA7xx
>> and provides a parallel interface to a video source such as a sensor or TV
>> decoder. Each VIP can support two inputs (slices) and an SoC can be
>> configured with a variable number of VIPs. Each slice can support two
>> ports, each connected to its own sub-device.
>>
>> Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>> Changelog:
>> Changes in v5:
>> Krzysztof:
>> - Get the phandle args directly through syscon call using syscon_regmap_lookup_by_phandle_args()
>> - Use devm_platform_ioremap_resource() instead of platform_get_resource() and devm_ioremap_resource()
>> - Drop struct resource *res from vip shared structure since it is now unused
>>
>>   drivers/media/platform/ti/Kconfig      |   13 +
>>   drivers/media/platform/ti/vpe/Makefile |    2 +
>>   drivers/media/platform/ti/vpe/vip.c    | 3731 ++++++++++++++++++++++++
>>   drivers/media/platform/ti/vpe/vip.h    |  717 +++++
>>   4 files changed, 4463 insertions(+)
>>   create mode 100644 drivers/media/platform/ti/vpe/vip.c
>>   create mode 100644 drivers/media/platform/ti/vpe/vip.h
>>
>> diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
>> index 3bc4aa35887e..7cd1539ab84a 100644
>> --- a/drivers/media/platform/ti/Kconfig
>> +++ b/drivers/media/platform/ti/Kconfig
>> @@ -41,6 +41,19 @@ config VIDEO_TI_CAL_MC
>>   	  default. Note that this behavior can be overridden via
>>   	  module parameter 'mc_api'.
>>   
>> +config VIDEO_TI_VIP
>> +        tristate "TI Video Input Port"
>> +        default n
> 
> Why "default n"? I'd just drop this.
> 

Will fix this in the next version of the series.

>> +        depends on VIDEO_DEV && SOC_DRA7XX
> 
> If at all possible the driver should also compile with COMPILE_TEST.
> So:
> 
> 	depends on VIDEO_DEV
> 	depends on SOC_DRA7XX || COMPILE_TEST
> 

Understood, will fix this in the next version of the series.

>> +        depends on HAS_DMA
>> +        select VIDEOBUF2_DMA_CONTIG
>> +        select VIDEO_TI_VPDMA
>> +        select VIDEO_TI_SC
>> +        select VIDEO_TI_CSC
>> +        help
>> +        Driver support for VIP module on certain TI SoC's
>> +        VIP = Video Input Port.
>> +
>>   # Mem2mem drivers
>>   
>>   config VIDEO_TI_VPE
>> diff --git a/drivers/media/platform/ti/vpe/Makefile b/drivers/media/platform/ti/vpe/Makefile
>> index 3fadfe084f87..fbb0dec5a30e 100644
>> --- a/drivers/media/platform/ti/vpe/Makefile
>> +++ b/drivers/media/platform/ti/vpe/Makefile
>> @@ -3,10 +3,12 @@ obj-$(CONFIG_VIDEO_TI_VPE) += ti-vpe.o
>>   obj-$(CONFIG_VIDEO_TI_VPDMA) += ti-vpdma.o
>>   obj-$(CONFIG_VIDEO_TI_SC) += ti-sc.o
>>   obj-$(CONFIG_VIDEO_TI_CSC) += ti-csc.o
>> +obj-$(CONFIG_VIDEO_TI_VIP) += ti-vip.o
>>   
>>   ti-vpe-y := vpe.o
>>   ti-vpdma-y := vpdma.o
>>   ti-sc-y := sc.o
>>   ti-csc-y := csc.o
>> +ti-vip-y := vip.o
>>   
>>   ccflags-$(CONFIG_VIDEO_TI_VPE_DEBUG) += -DDEBUG
>> diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
>> new file mode 100644
>> index 000000000000..c79d8bce09c1
>> --- /dev/null
>> +++ b/drivers/media/platform/ti/vpe/vip.c
>> @@ -0,0 +1,3731 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * TI VIP capture driver
>> + *
>> + * Copyright (C) 2025 Texas Instruments Incorporated -  http://www.ti.com/
>> + * David Griego, <dagriego@biglakesoftware.com>
>> + * Dale Farnsworth, <dale@farnsworth.org>
>> + * Yemike Abhilash Chandra, <y-abhilashchandra@ti.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/err.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/module.h>
>> +#include <linux/workqueue.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/sched.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <linux/pinctrl/consumer.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_graph.h>
>> +
>> +#include "vip.h"
>> +
>> +#define VIP_MODULE_NAME "vip"

[snip]

>> +
>> +static int vip_s_std(struct file *file, void *fh, v4l2_std_id std)
>> +{
>> +	struct vip_stream *stream = file2stream(file);
>> +	struct vip_port *port = stream->port;
>> +
>> +	if (stream->vfd->tvnorms == std)
>> +		return 0;
>> +
>> +	if (vb2_is_busy(&stream->vb_vidq))
>> +		return -EBUSY;
>> +
>> +	if (!(std & stream->vfd->tvnorms))
>> +		return -EINVAL;
> 
> Move this up to before the vb2_is_busy check.
> 

Will fix this in the next version of the series.

>> +
>> +	v4l2_subdev_call(port->subdev, video, s_std, std);
>> +	return 0;
>> +}
>> +
>> +static int vip_enum_fmt_vid_cap(struct file *file, void *priv,
>> +				struct v4l2_fmtdesc *f)
>> +{
>> +	struct vip_stream *stream = file2stream(file);
>> +	struct vip_port *port = stream->port;
>> +	struct vip_fmt *fmt;
>> +
>> +	if (f->index >= port->num_active_fmt)
>> +		return -EINVAL;
>> +
>> +	fmt = port->active_fmt[f->index];
>> +	f->pixelformat = fmt->fourcc;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vip_enum_framesizes(struct file *file, void *priv,
>> +			       struct v4l2_frmsizeenum *f)
>> +{
>> +	struct vip_stream *stream = file2stream(file);
>> +	struct vip_port *port = stream->port;
>> +	struct vip_dev *dev = port->dev;
>> +	struct vip_fmt *fmt;
>> +	int ret;
>> +	struct v4l2_subdev_frame_size_enum fse = {
>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +		.pad = 0,
>> +	};
>> +
>> +	fmt = find_port_format_by_pix(port, f->pixel_format);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	fse.index = f->index;
>> +	fse.code = fmt->code;
>> +	ret = v4l2_subdev_call(port->subdev, pad, enum_frame_size, NULL, &fse);
>> +	if (ret)
>> +		return -EINVAL;
>> +
>> +	v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: index: %d code: %x W:[%d,%d] H:[%d,%d]\n",
>> +		 __func__, fse.index, fse.code, fse.min_width, fse.max_width,
>> +		 fse.min_height, fse.max_height);
>> +
>> +	f->type = V4L2_FRMSIZE_TYPE_DISCRETE;
>> +	f->discrete.width = fse.max_width;
>> +	f->discrete.height = fse.max_height;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vip_enum_frameintervals(struct file *file, void *priv,
>> +				   struct v4l2_frmivalenum *f)
>> +{
>> +	struct vip_stream *stream = file2stream(file);
>> +	struct vip_port *port = stream->port;
>> +	struct vip_fmt *fmt;
>> +	struct v4l2_subdev_frame_interval_enum fie = {
>> +		.index = f->index,
>> +		.width = f->width,
>> +		.height = f->height,
>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +	};
>> +	int ret;
>> +
>> +	fmt = find_port_format_by_pix(port, f->pixel_format);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	fie.code = fmt->code;
>> +	ret = v4l2_subdev_call(port->subdev, pad, enum_frame_interval,
>> +			       NULL, &fie);
>> +	if (ret)
>> +		return ret;
>> +	f->type = V4L2_FRMIVAL_TYPE_DISCRETE;
>> +	f->discrete = fie.interval;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vip_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>> +{
>> +	struct vip_stream *stream = video_drvdata(file);
>> +	struct vip_port *port = stream->port;
>> +
>> +	return v4l2_g_parm_cap(video_devdata(file), port->subdev, a);
>> +}
>> +
>> +static int vip_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>> +{
>> +	struct vip_stream *stream = video_drvdata(file);
>> +	struct vip_port *port = stream->port;
>> +
>> +	return v4l2_s_parm_cap(video_devdata(file), port->subdev, a);
>> +}
>> +
>> +static int vip_calc_format_size(struct vip_port *port,
>> +				struct vip_fmt *fmt,
>> +				struct v4l2_format *f)
>> +{
>> +	enum v4l2_field *field;
>> +	unsigned int stride;
>> +	struct vip_dev *dev = port->dev;
>> +
>> +	if (!fmt) {
>> +		v4l2_dbg(2, debug, &dev->v4l2_dev,
>> +			 "no vip_fmt format provided!\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	field = &f->fmt.pix.field;
>> +	if (*field == V4L2_FIELD_ANY)
>> +		*field = V4L2_FIELD_NONE;
>> +	else if (V4L2_FIELD_NONE != *field && V4L2_FIELD_ALTERNATE != *field)
>> +		return -EINVAL;
>> +
>> +	v4l_bound_align_image(&f->fmt.pix.width, MIN_W, MAX_W, W_ALIGN,
>> +			      &f->fmt.pix.height, MIN_H, MAX_H, H_ALIGN,
>> +			      S_ALIGN);
>> +
>> +	stride = f->fmt.pix.width * (fmt->vpdma_fmt[0]->depth >> 3);
>> +	f->fmt.pix.bytesperline = ALIGN(stride, VPDMA_STRIDE_ALIGN);
>> +
>> +	f->fmt.pix.sizeimage = f->fmt.pix.height * f->fmt.pix.bytesperline;
>> +	if (fmt->coplanar) {
>> +		f->fmt.pix.sizeimage += f->fmt.pix.height *
>> +					f->fmt.pix.bytesperline *
>> +					fmt->vpdma_fmt[VIP_CHROMA]->depth >> 3;
>> +	}
>> +
>> +	f->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
>> +
>> +	v4l2_dbg(3, debug, &dev->v4l2_dev, "calc_format_size: fourcc:%s size: %dx%d bpl:%d img_size:%d\n",
>> +		 fourcc_to_str(f->fmt.pix.pixelformat),
>> +		 f->fmt.pix.width, f->fmt.pix.height,
>> +		 f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline bool vip_is_size_dma_aligned(u32 bpp, u32 width)
>> +{
>> +	return ((width * bpp) == ALIGN(width * bpp, VPDMA_STRIDE_ALIGN));
>> +}
>> +
>> +static int vip_try_fmt_vid_cap(struct file *file, void *priv,
>> +			       struct v4l2_format *f)
>> +{
>> +	struct vip_stream *stream = file2stream(file);
>> +	struct vip_port *port = stream->port;
>> +	struct vip_dev *dev = port->dev;
>> +	struct vip_fmt *fmt;
>> +	u32 best_width, best_height, largest_width, largest_height;
>> +	int ret, found;
>> +	enum vip_csc_state csc_direction;
>> +	struct v4l2_subdev_frame_size_enum fse = {
>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +		.pad = 0,
>> +	};
>> +
>> +	fmt = find_port_format_by_pix(port, f->fmt.pix.pixelformat);
>> +	if (!fmt) {
>> +		/* Just get the first one enumerated */
>> +		fmt = port->active_fmt[0];
>> +		f->fmt.pix.pixelformat = fmt->fourcc;
>> +	}
>> +
>> +	csc_direction =  vip_csc_direction(fmt->code, fmt->finfo);
>> +	if (csc_direction != VIP_CSC_NA) {
>> +		if (!is_csc_available(port)) {
>> +			v4l2_dbg(2, debug, &dev->v4l2_dev,
>> +				 "CSC not available for Fourcc format (0x%08x).\n",
>> +				 f->fmt.pix.pixelformat);
>> +
>> +			/* Just get the first one enumerated */
>> +			fmt = port->active_fmt[0];
>> +			f->fmt.pix.pixelformat = fmt->fourcc;
>> +			/* re-evaluate the csc_direction here */
>> +			csc_direction =  vip_csc_direction(fmt->code,
>> +							   fmt->finfo);
>> +		} else {
>> +			v4l2_dbg(3, debug, &dev->v4l2_dev, "CSC active on Port %c: going %s\n",
>> +				 port->port_id == VIP_PORTA ? 'A' : 'B',
>> +				 (csc_direction == VIP_CSC_Y2R) ? "Y2R" : "R2Y");
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * Given that sensors might support multiple mbus code we need
>> +	 * to use the one that matches the requested pixel format
>> +	 */
>> +	port->try_mbus_framefmt = port->mbus_framefmt;
>> +	port->try_mbus_framefmt.code = fmt->code;
>> +
>> +	/* check for/find a valid width/height */
>> +	ret = 0;
>> +	found = false;
>> +	best_width = 0;
>> +	best_height = 0;
>> +	largest_width = 0;
>> +	largest_height = 0;
>> +
>> +	fse.code = fmt->code;
>> +	for (fse.index = 0; ; fse.index++) {
>> +		u32 bpp = fmt->vpdma_fmt[0]->depth >> 3;
>> +
>> +		ret = v4l2_subdev_call(port->subdev, pad,
>> +				       enum_frame_size, NULL, &fse);
>> +		if (ret)
>> +			break;
>> +
>> +		if (!vip_is_size_dma_aligned(bpp, fse.max_width))
>> +			continue;
>> +
>> +		if (fse.max_width >= largest_width &&
>> +		    fse.max_height >= largest_height) {
>> +			v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found new larger: %dx%d\n",
>> +				 fse.index, fse.max_width, fse.max_height);
>> +			largest_width = fse.max_width;
>> +			largest_height = fse.max_height;
>> +		}
>> +
>> +		if (fse.max_width >= f->fmt.pix.width &&
>> +		    fse.max_height >= f->fmt.pix.height) {
>> +			v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found at least larger: %dx%d\n",
>> +				 fse.index, fse.max_width, fse.max_height);
>> +
>> +			if (!best_width ||
>> +			    ((abs(best_width - f->fmt.pix.width) >=
>> +			      abs(fse.max_width - f->fmt.pix.width)) &&
>> +			     (abs(best_height - f->fmt.pix.height) >=
>> +			      abs(fse.max_height - f->fmt.pix.height)))) {
>> +				best_width = fse.max_width;
>> +				best_height = fse.max_height;
>> +				v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found new best: %dx%d\n",
>> +					 fse.index, fse.max_width,
>> +					 fse.max_height);
>> +			}
>> +		}
>> +
>> +		if (f->fmt.pix.width == fse.max_width &&
>> +		    f->fmt.pix.height == fse.max_height) {
>> +			found = true;
>> +			v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found direct match: %dx%d\n",
>> +				 fse.index, fse.max_width,
>> +				 fse.max_height);
>> +			break;
>> +		}
>> +
>> +		if (f->fmt.pix.width >= fse.min_width &&
>> +		    f->fmt.pix.width <= fse.max_width &&
>> +		    f->fmt.pix.height >= fse.min_height &&
>> +		    f->fmt.pix.height <= fse.max_height) {
>> +			found = true;
>> +			v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt loop:%d found direct range match: %dx%d\n",
>> +				 fse.index, fse.max_width,
>> +				 fse.max_height);
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (found) {
>> +		port->try_mbus_framefmt.width = f->fmt.pix.width;
>> +		port->try_mbus_framefmt.height = f->fmt.pix.height;
>> +		/* No need to check for scaling */
>> +		goto calc_size;
>> +	} else if (f->fmt.pix.width > largest_width) {
>> +		port->try_mbus_framefmt.width = largest_width;
>> +		port->try_mbus_framefmt.height = largest_height;
>> +	} else if (best_width) {
>> +		port->try_mbus_framefmt.width = best_width;
>> +		port->try_mbus_framefmt.height = best_height;
>> +	} else {
>> +		/* use existing values as default */
>> +	}
>> +
>> +	v4l2_dbg(3, debug, &dev->v4l2_dev, "try_fmt best subdev size: %dx%d\n",
>> +		 port->try_mbus_framefmt.width,
>> +		 port->try_mbus_framefmt.height);
>> +
>> +	if (is_scaler_available(port) &&
>> +	    csc_direction != VIP_CSC_Y2R &&
>> +	    !vip_is_mbuscode_raw(fmt->code) &&
>> +	    f->fmt.pix.height <= port->try_mbus_framefmt.height &&
>> +	    port->try_mbus_framefmt.height <= SC_MAX_PIXEL_HEIGHT &&
>> +	    port->try_mbus_framefmt.width <= SC_MAX_PIXEL_WIDTH) {
>> +		/*
>> +		 * Scaler is only accessible if the dst colorspace is YUV.
>> +		 * As the input to the scaler must be in YUV mode only.
>> +		 *
>> +		 * Scaling up is allowed only horizontally.
>> +		 */
>> +		unsigned int hratio, vratio, width_align, height_align;
>> +		u32 bpp = fmt->vpdma_fmt[0]->depth >> 3;
>> +
>> +		v4l2_dbg(3, debug, &dev->v4l2_dev, "Scaler active on Port %c: requesting %dx%d\n",
>> +			 port->port_id == VIP_PORTA ? 'A' : 'B',
>> +			 f->fmt.pix.width, f->fmt.pix.height);
>> +
>> +		/* Just make sure everything is properly aligned */
>> +		width_align = ALIGN(f->fmt.pix.width * bpp, VPDMA_STRIDE_ALIGN);
>> +		width_align /= bpp;
>> +		height_align = ALIGN(f->fmt.pix.height, 2);
>> +
>> +		f->fmt.pix.width = width_align;
>> +		f->fmt.pix.height = height_align;
>> +
>> +		hratio = f->fmt.pix.width * 1000 /
>> +			 port->try_mbus_framefmt.width;
>> +		vratio = f->fmt.pix.height * 1000 /
>> +			 port->try_mbus_framefmt.height;
>> +		if (hratio < 125) {
>> +			f->fmt.pix.width = port->try_mbus_framefmt.width / 8;
>> +			v4l2_dbg(3, debug, &dev->v4l2_dev, "Horizontal scaling ratio out of range adjusting -> %d\n",
>> +				 f->fmt.pix.width);
>> +		}
>> +
>> +		if (vratio < 188) {
>> +			f->fmt.pix.height = port->try_mbus_framefmt.height / 4;
>> +			v4l2_dbg(3, debug, &dev->v4l2_dev, "Vertical scaling ratio out of range adjusting -> %d\n",
>> +				 f->fmt.pix.height);
>> +		}
>> +		v4l2_dbg(3, debug, &dev->v4l2_dev, "Scaler: got %dx%d\n",
>> +			 f->fmt.pix.width, f->fmt.pix.height);
>> +	} else {
>> +		/* use existing values as default */
>> +		f->fmt.pix.width = port->try_mbus_framefmt.width;
>> +		f->fmt.pix.height = port->try_mbus_framefmt.height;
>> +	}
>> +
>> +calc_size:
>> +	/* That we have a fmt calculate imagesize and bytesperline */
>> +	return vip_calc_format_size(port, fmt, f);
>> +}
>> +
>> +static int vip_g_fmt_vid_cap(struct file *file, void *priv,
>> +			     struct v4l2_format *f)
>> +{
>> +	struct vip_stream *stream = file2stream(file);
>> +	struct vip_port *port = stream->port;
>> +
>> +	/* Use last known values or defaults */
>> +	f->fmt.pix.width	= stream->width;
>> +	f->fmt.pix.height	= stream->height;
>> +	f->fmt.pix.pixelformat	= port->fmt->fourcc;
>> +	f->fmt.pix.field	= stream->sup_field;
>> +	f->fmt.pix.colorspace   = V4L2_COLORSPACE_SRGB;
>> +	f->fmt.pix.bytesperline	= stream->bytesperline;
>> +	f->fmt.pix.sizeimage	= stream->sizeimage;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vip_s_fmt_vid_cap(struct file *file, void *priv,
>> +			     struct v4l2_format *f)
>> +{
>> +	struct vip_stream *stream = file2stream(file);
>> +	struct vip_port *port = stream->port;
>> +	struct vip_dev *dev = port->dev;
>> +	struct v4l2_subdev_format sfmt;
>> +	struct v4l2_mbus_framefmt *mf;
>> +	enum vip_csc_state csc_direction;
>> +	int ret;
>> +
>> +	if (vb2_is_busy(&stream->vb_vidq)) {
>> +		v4l2_err(&dev->v4l2_dev, "%s queue busy\n", __func__);
>> +		return -EBUSY;
>> +	}
>> +
>> +	ret = vip_try_fmt_vid_cap(file, priv, f);
>> +	if (ret)
>> +		return ret;
> 
> Move this up to before the vb2_is_busy().
> 
> Checks like that should be done first.
> 

Understood. Will fix this in the next version of the series.

>> +
>> +	/*
>> +	 * Check if we need the scaler or not
>> +	 *
>> +	 * Since on previous S_FMT call the scaler might have been
>> +	 * allocated if it is not needed in this instance we will
>> +	 * attempt to free it just in case.
>> +	 *
>> +	 * free_scaler() is harmless unless the current port
>> +	 * allocated it.
>> +	 */
>> +	if (f->fmt.pix.width == port->try_mbus_framefmt.width &&
>> +	    f->fmt.pix.height == port->try_mbus_framefmt.height)
>> +		free_scaler(port);
>> +	else
>> +		allocate_scaler(port);
>> +
>> +	port->fmt = find_port_format_by_pix(port,
>> +					    f->fmt.pix.pixelformat);
>> +	stream->width		= f->fmt.pix.width;
>> +	stream->height		= f->fmt.pix.height;
>> +	stream->bytesperline	= f->fmt.pix.bytesperline;
>> +	stream->sizeimage	= f->fmt.pix.sizeimage;
>> +	stream->sup_field	= f->fmt.pix.field;
>> +	stream->field		= f->fmt.pix.field;
>> +
>> +	port->c_rect.left	= 0;
>> +	port->c_rect.top	= 0;
>> +	port->c_rect.width	= stream->width;
>> +	port->c_rect.height	= stream->height;
>> +
>> +	/*
>> +	 * Check if we need the csc unit or not
>> +	 *
>> +	 * Since on previous S_FMT call, the csc might have been
>> +	 * allocated if it is not needed in this instance we will
>> +	 * attempt to free it just in case.
>> +	 *
>> +	 * free_csc() is harmless unless the current port
>> +	 * allocated it.
>> +	 */
>> +	csc_direction =  vip_csc_direction(port->fmt->code, port->fmt->finfo);
>> +	if (csc_direction == VIP_CSC_NA)
>> +		free_csc(port);
>> +	else
>> +		allocate_csc(port, csc_direction);
>> +
>> +	if (stream->sup_field == V4L2_FIELD_ALTERNATE)
>> +		port->flags |= FLAG_INTERLACED;
>> +	else
>> +		port->flags &= ~FLAG_INTERLACED;
>> +
>> +	memset(&sfmt, 0, sizeof(sfmt));
>> +	mf = &sfmt.format;
>> +	v4l2_fill_mbus_format(mf, &f->fmt.pix, port->fmt->code);
>> +	/* Make sure to use the subdev size found in the try_fmt */
>> +	mf->width = port->try_mbus_framefmt.width;
>> +	mf->height = port->try_mbus_framefmt.height;
>> +
>> +	sfmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>> +	sfmt.pad = 0;
>> +	ret = v4l2_subdev_call(port->subdev, pad, set_fmt, NULL, &sfmt);
>> +	if (ret) {
>> +		v4l2_dbg(1, debug, &dev->v4l2_dev, "set_fmt failed in subdev\n");
>> +		return ret;
>> +	}
>> +
>> +	/* Save it */
>> +	port->mbus_framefmt = *mf;
>> +
>> +	v4l2_dbg(3, debug, &dev->v4l2_dev, "s_fmt subdev fmt mbus_code: %04X size: %dx%d\n",
>> +		 port->mbus_framefmt.code,
>> +		 port->mbus_framefmt.width, port->mbus_framefmt.height);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Does the exact opposite of set_fmt_params
>> + * It makes sure the DataPath register is sane after tear down
>> + */
>> +static void unset_fmt_params(struct vip_stream *stream)
>> +{
>> +	struct vip_dev *dev = stream->port->dev;
>> +	struct vip_port *port = stream->port;
>> +
>> +	stream->sequence = 0;
>> +	stream->field = V4L2_FIELD_TOP;
>> +
>> +	if (port->csc == VIP_CSC_Y2R) {
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_SRC_DATA_SELECT, 0);
>> +		} else {
>> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
> 
> While normally it is good to stick within 80 characters, in this case I would
> recommend keeping these vip_set_slice_path() calls as a single line. It makes
> this easier to read.
> 

Agree. Will change this in v6.

>> +		}
>> +		/* We are done */
>> +		return;
> 
> Since this returns...> +	} else if (port->csc == VIP_CSC_R2Y) {
> 
> ...this doesn't need 'else', the 'if' can just start on a new line.
> 
> Same elsewhere.
> 

Ahh, sorry. Will correct this in v6.

>> +		if (port->scaler && port->fmt->coplanar) {
>> +			if (port->port_id == VIP_PORTA) {
>> +				vip_set_slice_path(dev,
>> +						   VIP_CSC_SRC_DATA_SELECT, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_SC_SRC_DATA_SELECT, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>> +						   0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>> +						   0);
>> +			}
>> +		} else if (port->scaler) {
>> +			if (port->port_id == VIP_PORTA) {
>> +				vip_set_slice_path(dev,
>> +						   VIP_CSC_SRC_DATA_SELECT, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_SC_SRC_DATA_SELECT, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>> +						   0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>> +						   0);
>> +			}
>> +		} else if (port->fmt->coplanar) {
>> +			if (port->port_id == VIP_PORTA) {
>> +				vip_set_slice_path(dev,
>> +						   VIP_CSC_SRC_DATA_SELECT, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>> +						   0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>> +						   0);
>> +			}
>> +		} else {
>> +			if (port->port_id == VIP_PORTA) {
>> +				vip_set_slice_path(dev,
>> +						   VIP_CSC_SRC_DATA_SELECT, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>> +						   0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>> +						   0);
>> +			}
>> +		}
>> +		/* We are done */
>> +		return;
>> +	} else if (v4l2_is_format_rgb(port->fmt->finfo)) {
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>> +		}
>> +		/* We are done */
>> +		return;
>> +	}
>> +
>> +	if (port->scaler && port->fmt->coplanar) {
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>> +		} else {
>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>> +		}
>> +	} else if (port->scaler) {
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>> +		} else {
>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>> +		}
>> +	} else if (port->fmt->coplanar) {
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>> +		} else {
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>> +		}
>> +	} else {
>> +		/*
>> +		 * We undo all data path setting except for the multi
>> +		 * stream case.
>> +		 * Because we cannot disrupt other on-going capture if only
>> +		 * one stream is terminated the other might still be going
>> +		 */
>> +		vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
>> +		vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>> +	}
>> +}
>> +
>> +/*
>> + * Set the registers that are modified when the video format changes.
>> + */
>> +static void set_fmt_params(struct vip_stream *stream)
>> +{
>> +	struct vip_dev *dev = stream->port->dev;
>> +	struct vip_port *port = stream->port;
>> +
>> +	stream->sequence = 0;
>> +	stream->field = V4L2_FIELD_TOP;
>> +
>> +	if (port->csc == VIP_CSC_Y2R) {
>> +		port->flags &= ~FLAG_MULT_PORT;
>> +		/* Set alpha component in background color */
>> +		vpdma_set_bg_color(dev->shared->vpdma,
>> +				   (struct vpdma_data_format *)
>> +				   port->fmt->vpdma_fmt[0],
>> +				   0xff);
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 1);
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 1);
>> +			vip_set_slice_path(dev, VIP_RGB_SRC_DATA_SELECT, 1);
> 
> Same comment as above: it makes sense to keep these calls in a single line.
> 
>> +		} else {
>> +			vip_set_slice_path(dev, VIP_CSC_SRC_DATA_SELECT, 2);
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 1);
>> +		}
>> +		/* We are done */
>> +		return;
>> +	} else if (port->csc == VIP_CSC_R2Y) {
> 
> Same 'else' issue.
> 
>> +		port->flags &= ~FLAG_MULT_PORT;
>> +		if (port->scaler && port->fmt->coplanar) {
>> +			if (port->port_id == VIP_PORTA) {
>> +				vip_set_slice_path(dev,
>> +						   VIP_CSC_SRC_DATA_SELECT, 4);
>> +				vip_set_slice_path(dev,
>> +						   VIP_SC_SRC_DATA_SELECT, 1);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>> +						   1);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>> +						   0);
>> +			} else {
>> +				v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
>> +			}
>> +		} else if (port->scaler) {
>> +			if (port->port_id == VIP_PORTA) {
>> +				vip_set_slice_path(dev,
>> +						   VIP_CSC_SRC_DATA_SELECT, 4);
>> +				vip_set_slice_path(dev,
>> +						   VIP_SC_SRC_DATA_SELECT, 1);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>> +						   1);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_DATA_BYPASS, 1);
>> +				vip_set_slice_path(dev,
>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>> +						   0);
>> +			} else {
>> +				v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
>> +			}
>> +		} else if (port->fmt->coplanar) {
>> +			if (port->port_id == VIP_PORTA) {
>> +				vip_set_slice_path(dev,
>> +						   VIP_CSC_SRC_DATA_SELECT, 4);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>> +						   2);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +				vip_set_slice_path(dev,
>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>> +						   0);
>> +			} else {
>> +				v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
>> +			}
>> +		} else {
>> +			if (port->port_id == VIP_PORTA) {
>> +				vip_set_slice_path(dev,
>> +						   VIP_CSC_SRC_DATA_SELECT, 4);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_SRC_DATA_SELECT,
>> +						   2);
>> +				vip_set_slice_path(dev,
>> +						   VIP_CHR_DS_1_DATA_BYPASS, 1);
>> +				vip_set_slice_path(dev,
>> +						   VIP_RGB_OUT_HI_DATA_SELECT,
>> +						   0);
>> +			} else {
>> +				v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
>> +			}
>> +		}
>> +		/* We are done */
>> +		return;
>> +	} else if (v4l2_is_format_rgb(port->fmt->finfo)) {
>> +		port->flags &= ~FLAG_MULT_PORT;
>> +		/* Set alpha component in background color */
>> +		vpdma_set_bg_color(dev->shared->vpdma,
>> +				   (struct vpdma_data_format *)
>> +				   port->fmt->vpdma_fmt[0],
>> +				   0xff);
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 1);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 1);
>> +		} else {
>> +			v4l2_err(&dev->v4l2_dev, "RGB sensor can only be on Port A\n");
>> +		}
>> +		/* We are done */
>> +		return;
>> +	}
>> +
>> +	if (port->scaler && port->fmt->coplanar) {
>> +		port->flags &= ~FLAG_MULT_PORT;
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 2);
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 1);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>> +		} else {
>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 3);
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 1);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>> +		}
>> +	} else if (port->scaler) {
>> +		port->flags &= ~FLAG_MULT_PORT;
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 2);
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 1);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 1);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>> +		} else {
>> +			vip_set_slice_path(dev, VIP_SC_SRC_DATA_SELECT, 3);
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 1);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 1);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 1);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>> +		}
>> +	} else if (port->fmt->coplanar) {
>> +		port->flags &= ~FLAG_MULT_PORT;
>> +		if (port->port_id == VIP_PORTA) {
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_1_SRC_DATA_SELECT, 3);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_1_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_HI_DATA_SELECT, 0);
>> +		} else {
>> +			vip_set_slice_path(dev,
>> +					   VIP_CHR_DS_2_SRC_DATA_SELECT, 4);
>> +			vip_set_slice_path(dev, VIP_CHR_DS_2_DATA_BYPASS, 0);
>> +			vip_set_slice_path(dev,
>> +					   VIP_MULTI_CHANNEL_DATA_SELECT, 0);
>> +			vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>> +		}
>> +	} else {
>> +		port->flags |= FLAG_MULT_PORT;
>> +		vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
>> +		vip_set_slice_path(dev, VIP_RGB_OUT_LO_DATA_SELECT, 0);
>> +	}
>> +}
> 
> I wonder if there are better ways of writing the two functions above. They are
> long and hard to follow. Some comments explaining the different cases might
> help as well.
> 

May be I can split up these 2 functions by introducing few new helpers 
in the driver.
I will also add comments to explain different cases. Thanks.

>> +
>> +static int vip_g_selection(struct file *file, void *fh,
>> +			   struct v4l2_selection *s)
>> +{
>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>> +	struct vip_stream *stream = file2stream(file);
>> +
>> +	switch (s->target) {
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +	case V4L2_SEL_TGT_CROP_DEFAULT:
>> +		s->r.left = 0;
>> +		s->r.top = 0;
>> +		s->r.width = stream->width;
>> +		s->r.height = stream->height;
>> +		return 0;
>> +
>> +	case V4L2_SEL_TGT_CROP:
>> +		s->r = stream->port->c_rect;
>> +		return 0;
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
>> +{
>> +	if (a->left < b->left || a->top < b->top)
>> +		return 0;
>> +	if (a->left + a->width > b->left + b->width)
>> +		return 0;
>> +	if (a->top + a->height > b->top + b->height)
>> +		return 0;
>> +
>> +	return 1;
>> +}
>> +
>> +static int vip_s_selection(struct file *file, void *fh,
>> +			   struct v4l2_selection *s)
>> +{
>> +	if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>> +	if (s->target != V4L2_SEL_TGT_CROP)
>> +		return -EINVAL;
>> +
> 
> This needs a vb2_is_busy check.
> 

Will correct this in v6.

>> +	struct vip_stream *stream = file2stream(file);
>> +	struct vip_port *port = stream->port;
>> +	struct vip_dev *dev = port->dev;
>> +	struct v4l2_rect r = s->r;
>> +
>> +	v4l_bound_align_image(&r.width, 0, stream->width, 0,
>> +			      &r.height, 0, stream->height, 0, 0);
>> +
>> +	r.left = clamp_t(unsigned int, r.left, 0, stream->width - r.width);
>> +	r.top  = clamp_t(unsigned int, r.top, 0, stream->height - r.height);
>> +
>> +	if (s->flags & V4L2_SEL_FLAG_LE && !enclosed_rectangle(&r, &s->r))
>> +		return -ERANGE;
>> +
>> +	if (s->flags & V4L2_SEL_FLAG_GE && !enclosed_rectangle(&s->r, &r))
>> +		return -ERANGE;
>> +
>> +	s->r = r;
>> +	stream->port->c_rect = r;
>> +
>> +	v4l2_dbg(1, debug, &dev->v4l2_dev, "cropped (%d,%d)/%dx%d of %dx%d\n",
>> +		 r.left, r.top, r.width, r.height,
>> +		 stream->width, stream->height);
>> +
>> +	return 0;
> 
> So the v4l2-compliance failure is because there are multiple discrete framesizes
> AND s_selection is supported. There is a comment in v4l2-test-formats.cpp that says:
> 
>          // set selection is not supported (for now) if there is more than one
>          // discrete frame size.
> 
> There is something weird going on, though. This should also fail with the vivid test
> driver, but it doesn't. I am also not certain whether this restriction is still valid,
> and unfortunately the comment in v4l2-compliance doesn't say *why* is it not supported.
> 
> I'll get back on this once I figure out why this doesn't trigger for the vivid driver.
> 
>> +}
>> +
>> +static const struct v4l2_ioctl_ops vip_ioctl_ops = {
>> +	.vidioc_querycap	= vip_querycap,
>> +	.vidioc_enum_input	= vip_enuminput,
>> +	.vidioc_g_input		= vip_g_input,
>> +	.vidioc_s_input		= vip_s_input,
>> +
>> +	.vidioc_querystd	= vip_querystd,
>> +	.vidioc_g_std		= vip_g_std,
>> +	.vidioc_s_std		= vip_s_std,
>> +
>> +	.vidioc_enum_fmt_vid_cap = vip_enum_fmt_vid_cap,
>> +	.vidioc_g_fmt_vid_cap	= vip_g_fmt_vid_cap,
>> +	.vidioc_try_fmt_vid_cap	= vip_try_fmt_vid_cap,
>> +	.vidioc_s_fmt_vid_cap	= vip_s_fmt_vid_cap,
>> +
>> +	.vidioc_enum_frameintervals	= vip_enum_frameintervals,
>> +	.vidioc_enum_framesizes		= vip_enum_framesizes,
>> +	.vidioc_s_parm			= vip_s_parm,
>> +	.vidioc_g_parm			= vip_g_parm,
>> +	.vidioc_g_selection	= vip_g_selection,
>> +	.vidioc_s_selection	= vip_s_selection,
>> +	.vidioc_reqbufs		= vb2_ioctl_reqbufs,
>> +	.vidioc_create_bufs	= vb2_ioctl_create_bufs,
>> +	.vidioc_prepare_buf	= vb2_ioctl_prepare_buf,
>> +	.vidioc_querybuf	= vb2_ioctl_querybuf,
>> +	.vidioc_qbuf		= vb2_ioctl_qbuf,
>> +	.vidioc_dqbuf		= vb2_ioctl_dqbuf,
>> +	.vidioc_expbuf		= vb2_ioctl_expbuf,
>> +
>> +	.vidioc_streamon	= vb2_ioctl_streamon,
>> +	.vidioc_streamoff	= vb2_ioctl_streamoff,
>> +	.vidioc_log_status	= v4l2_ctrl_log_status,
>> +	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>> +};
>> +
>> +/*
>> + * Videobuf operations
>> + */
>> +static int vip_queue_setup(struct vb2_queue *vq,
>> +			   unsigned int *nbuffers, unsigned int *nplanes,
>> +			   unsigned int sizes[], struct device *alloc_devs[])
>> +{
>> +	struct vip_stream *stream = vb2_get_drv_priv(vq);
>> +	struct vip_port *port = stream->port;
>> +	struct vip_dev *dev = port->dev;
>> +	unsigned int size = stream->sizeimage;
>> +
>> +	if (vq->max_num_buffers + *nbuffers < 3)
>> +		*nbuffers = 3 - vq->max_num_buffers;
> 
> Drop this. The vb2 core will check this.
> 
>> +
>> +	if (*nplanes) {
>> +		if (sizes[0] < size)
>> +			return -EINVAL;
> 
> Just do 'return 0;' here. For create_bufs (*nplanes is != 0) you just
> need to check the size.
> 

Thanks. Will fix these in the next version of the series.

>> +		size = sizes[0];
>> +	}
>> +
>> +	*nplanes = 1;
>> +	sizes[0] = size;
>> +
>> +	v4l2_dbg(1, debug, &dev->v4l2_dev, "get %d buffer(s) of size %d each.\n",
>> +		 *nbuffers, sizes[0]);
>> +
>> +	return 0;
>> +}
>> +

[snip]

>> +static int vip_release(struct file *file)
>> +{
>> +	struct vip_stream *stream = video_drvdata(file);
>> +	struct vip_port *port = stream->port;
>> +	struct vip_dev *dev = port->dev;
>> +	bool fh_singular;
>> +	int ret;
>> +
>> +	mutex_lock(&dev->mutex);
>> +
>> +	/* Save the singular status before we call the clean-up helper */
>> +	fh_singular = v4l2_fh_is_singular_file(file);
>> +
>> +	/* the release helper will cleanup any on-going streaming */
>> +	ret = _vb2_fop_release(file, NULL);
>> +
>> +	free_csc(port);
>> +	free_scaler(port);
>> +
>> +	/*
>> +	 * If this is the last open file.
>> +	 * Then de-initialize hw module.
>> +	 */
>> +	if (fh_singular) {
>> +		vip_release_stream(stream);
>> +
>> +		if (--port->num_streams == 0) {
>> +			vip_release_port(port);
>> +			vip_release_dev(port->dev);
>> +		}
>> +	}
>> +
>> +	mutex_unlock(&dev->mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * File operations
>> + */
>> +static const struct v4l2_file_operations vip_fops = {
>> +	.owner		= THIS_MODULE,
>> +	.open		= vip_open,
>> +	.release	= vip_release,
>> +	.read		= vb2_fop_read,
> 
> read support is not recommended for new drivers unless there is a really good reason for it.
> 

I will remove the read support in the next version.

>> +	.poll		= vb2_fop_poll,
>> +	.unlocked_ioctl	= video_ioctl2,
>> +	.mmap		= vb2_fop_mmap,
>> +};
>> +
>> +static struct video_device vip_videodev = {
>> +	.name		= VIP_MODULE_NAME,
>> +	.fops		= &vip_fops,
>> +	.ioctl_ops	= &vip_ioctl_ops,
>> +	.minor		= -1,
>> +	.release	= video_device_release,
>> +	.tvnorms	= V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
>> +	.device_caps	= V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE |
>> +			  V4L2_CAP_READWRITE,
> 
> Ditto.
> 
>> +};
>> +
>> +static int alloc_stream(struct vip_port *port, int stream_id, int vfl_type)
>> +{
>> +	struct vip_stream *stream;
>> +	struct vip_dev *dev = port->dev;
>> +	struct vb2_queue *q;
>> +	struct video_device *vfd;
>> +	struct vip_buffer *buf;
>> +	struct list_head *pos, *tmp;
>> +	int ret, i;
>> +
>> +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
>> +	if (!stream)
>> +		return -ENOMEM;
>> +
>> +	stream->port = port;
>> +	stream->stream_id = stream_id;
>> +	stream->vfl_type = vfl_type;
>> +	port->cap_streams[stream_id] = stream;
>> +
>> +	stream->list_num = vpdma_hwlist_alloc(dev->shared->vpdma, stream);
>> +	if (stream->list_num < 0) {
>> +		v4l2_err(&dev->v4l2_dev, "Could not get VPDMA hwlist");
>> +		ret = -ENODEV;
>> +		goto do_free_stream;
>> +	}
>> +
>> +	INIT_LIST_HEAD(&stream->post_bufs);
>> +
>> +	/*
>> +	 * Initialize queue
>> +	 */
>> +	q = &stream->vb_vidq;
>> +	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
> 
> Ditto.
> 
>> +	q->drv_priv = stream;
>> +	q->buf_struct_size = sizeof(struct vip_buffer);
>> +	q->ops = &vip_video_qops;
>> +	q->mem_ops = &vb2_dma_contig_memops;
>> +	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>> +	q->lock = &dev->mutex;
>> +	q->min_queued_buffers = 2;
>> +	q->dev = dev->v4l2_dev.dev;
>> +
>> +	ret = vb2_queue_init(q);
>> +	if (ret)
>> +		goto do_free_hwlist;
>> +
>> +	INIT_WORK(&stream->recovery_work, vip_overflow_recovery_work);
>> +
>> +	INIT_LIST_HEAD(&stream->vidq);
>> +
>> +	/* Allocate/populate Drop queue entries */
>> +	INIT_LIST_HEAD(&stream->dropq);
>> +	for (i = 0; i < VIP_DROPQ_SIZE; i++) {
>> +		buf = kzalloc(sizeof(*buf), GFP_ATOMIC);
>> +		if (!buf) {
>> +			ret = -ENOMEM;
>> +			goto do_free_dropq;
>> +		}
>> +		buf->drop = true;
>> +		list_add(&buf->list, &stream->dropq);
>> +	}
>> +
>> +	vfd = video_device_alloc();
>> +	if (!vfd)
>> +		goto do_free_dropq;
>> +	*vfd = vip_videodev;
>> +	vfd->v4l2_dev = &dev->v4l2_dev;
>> +	vfd->queue = q;
>> +
>> +	vfd->lock = &dev->mutex;
>> +	video_set_drvdata(vfd, stream);
>> +	stream->vfd = vfd;
>> +
>> +	ret = video_register_device(vfd, vfl_type, -1);
>> +	if (ret) {
>> +		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
>> +		goto do_free_vfd;
>> +	}
>> +
>> +	v4l2_info(&dev->v4l2_dev, "device registered as %s\n",
>> +		  video_device_node_name(vfd));
>> +	return 0;
>> +
>> +do_free_vfd:
>> +	video_device_release(vfd);
>> +do_free_dropq:
>> +	list_for_each_safe(pos, tmp, &stream->dropq) {
>> +		buf = list_entry(pos,
>> +				 struct vip_buffer, list);
>> +		v4l2_dbg(1, debug, &dev->v4l2_dev, "dropq buffer\n");
>> +		list_del(pos);
>> +		kfree(buf);
>> +	}
>> +do_free_hwlist:
>> +	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
>> +do_free_stream:
>> +	kfree(stream);
>> +	return ret;
>> +}
>> +
>> +static void free_stream(struct vip_stream *stream)
>> +{
>> +	struct vip_dev *dev;
>> +	struct vip_buffer *buf;
>> +	struct list_head *pos, *q;
>> +
>> +	if (!stream)
>> +		return;
>> +
>> +	dev = stream->port->dev;
>> +	/* Free up the Drop queue */
>> +	list_for_each_safe(pos, q, &stream->dropq) {
>> +		buf = list_entry(pos,
>> +				 struct vip_buffer, list);
>> +		v4l2_dbg(1, debug, &dev->v4l2_dev, "dropq buffer\n");
>> +		list_del(pos);
>> +		kfree(buf);
>> +	}
>> +
>> +	video_unregister_device(stream->vfd);
>> +	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
>> +	stream->port->cap_streams[stream->stream_id] = NULL;
>> +	kfree(stream);
>> +}
>> +
>> +static int get_subdev_active_format(struct vip_port *port,
>> +				    struct v4l2_subdev *subdev)
>> +{
>> +	struct vip_fmt *fmt;
>> +	struct vip_dev *dev = port->dev;
>> +	struct v4l2_subdev_mbus_code_enum mbus_code;
>> +	int ret = 0;
>> +	unsigned int k, i, j;
>> +	enum vip_csc_state csc;
>> +
>> +	/* Enumerate sub device formats and enable all matching local formats */
>> +	port->num_active_fmt = 0;
>> +	for (k = 0, i = 0; (ret != -EINVAL); k++) {
>> +		memset(&mbus_code, 0, sizeof(mbus_code));
>> +		mbus_code.index = k;
>> +		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
>> +		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
>> +				       NULL, &mbus_code);
>> +		if (ret)
>> +			continue;
>> +
>> +		v4l2_dbg(2, debug, &dev->v4l2_dev,
>> +			 "subdev %s: code: %04x idx: %d\n",
>> +			 subdev->name, mbus_code.code, k);
>> +
>> +		for (j = 0; j < ARRAY_SIZE(vip_formats); j++) {
>> +			fmt = &vip_formats[j];
>> +			if (mbus_code.code != fmt->code)
>> +				continue;
>> +
>> +			/*
>> +			 * When the port is configured for BT656
>> +			 * then none of the downstream unit can be used.
>> +			 * So here we need to skip all format requiring
>> +			 * either CSC or CHR_DS
>> +			 */
>> +			csc = vip_csc_direction(fmt->code, fmt->finfo);
>> +			if (port->endpoint.bus_type == V4L2_MBUS_BT656 &&
>> +			    (csc != VIP_CSC_NA || fmt->coplanar))
>> +				continue;
>> +
>> +			port->active_fmt[i] = fmt;
>> +			v4l2_dbg(2, debug, &dev->v4l2_dev,
>> +				 "matched fourcc: %s: code: %04x idx: %d\n",
>> +				 fourcc_to_str(fmt->fourcc), fmt->code, i);
>> +			port->num_active_fmt = ++i;
>> +		}
>> +	}
>> +
>> +	if (i == 0) {
>> +		v4l2_err(&dev->v4l2_dev, "No suitable format reported by subdev %s\n",
>> +			 subdev->name);
>> +		return -EINVAL;
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int alloc_port(struct vip_dev *dev, int id)
>> +{
>> +	struct vip_port *port;
>> +
>> +	if (dev->ports[id])
>> +		return -EINVAL;
>> +
>> +	port = devm_kzalloc(&dev->pdev->dev, sizeof(*port), GFP_KERNEL);
>> +	if (!port)
>> +		return -ENOMEM;
>> +
>> +	dev->ports[id] = port;
>> +	port->dev = dev;
>> +	port->port_id = id;
>> +	port->num_streams = 0;
>> +	return 0;
>> +}
>> +
>> +static void free_port(struct vip_port *port)
>> +{
>> +	if (!port)
>> +		return;
>> +
>> +	v4l2_async_nf_unregister(&port->notifier);
>> +	v4l2_async_nf_cleanup(&port->notifier);
>> +	free_stream(port->cap_streams[0]);
>> +}
>> +
>> +static int get_field(u32 value, u32 mask, int shift)
>> +{
>> +	return (value & (mask << shift)) >> shift;
>> +}
>> +
>> +static int vip_probe_complete(struct platform_device *pdev);
>> +static void vip_vpdma_fw_cb(struct platform_device *pdev)
>> +{
>> +	dev_info(&pdev->dev, "VPDMA firmware loaded\n");
>> +
>> +	if (pdev->dev.of_node)
>> +		vip_probe_complete(pdev);
>> +}
>> +
>> +static int vip_create_streams(struct vip_port *port,
>> +			      struct v4l2_subdev *subdev)
>> +{
>> +	struct v4l2_mbus_config_parallel *bus;
>> +	int i;
>> +
>> +	for (i = 0; i < VIP_CAP_STREAMS_PER_PORT; i++)
>> +		free_stream(port->cap_streams[i]);
>> +
>> +	if (get_subdev_active_format(port, subdev))
>> +		return -ENODEV;
>> +
>> +	port->subdev = subdev;
>> +
>> +	if (port->endpoint.bus_type == V4L2_MBUS_PARALLEL) {
>> +		port->flags |= FLAG_MULT_PORT;
>> +		port->num_streams_configured = 1;
>> +		alloc_stream(port, 0, VFL_TYPE_VIDEO);
>> +	} else if (port->endpoint.bus_type == V4L2_MBUS_BT656) {
>> +		port->flags |= FLAG_MULT_PORT;
>> +		bus = &port->endpoint.bus.parallel;
>> +		port->num_streams_configured = 1;
>> +		alloc_stream(port, 0, VFL_TYPE_VIDEO);
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int vip_async_bound(struct v4l2_async_notifier *notifier,
>> +			   struct v4l2_subdev *subdev,
>> +			   struct v4l2_async_connection *asd)
>> +{
>> +	struct vip_port *port = notifier_to_vip_port(notifier);
>> +	int ret;
>> +
>> +	if (port->subdev) {
>> +		v4l2_info(&port->dev->v4l2_dev, "Rejecting subdev %s (Already set!!)",
>> +			  subdev->name);
>> +		return 0;
>> +	}
>> +
>> +	v4l2_info(&port->dev->v4l2_dev, "Port %c: Using subdev %s for capture\n",
>> +		  port->port_id == VIP_PORTA ? 'A' : 'B', subdev->name);
>> +
>> +	ret = vip_create_streams(port, subdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vip_async_complete(struct v4l2_async_notifier *notifier)
>> +{
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations vip_async_ops = {
>> +	.bound = vip_async_bound,
>> +	.complete = vip_async_complete,
>> +};
>> +
>> +static struct fwnode_handle *
>> +fwnode_graph_get_next_endpoint_by_regs(const struct fwnode_handle *fwnode,
>> +				       int port_reg, int reg)
>> +{
>> +	return of_fwnode_handle(of_graph_get_endpoint_by_regs(to_of_node(fwnode),
>> +							      port_reg, reg));
>> +}
>> +
>> +static int vip_register_subdev_notif(struct vip_port *port,
> 
> vip_register_subdev_notif -> vip_register_subdev_notify
> 
> A bit odd to drop the 'y' :-)
> 

Yeah, agree. Will fix this.

Thanks and regards
Yemike Abhilash Chandra

>> +				     struct fwnode_handle *ep)
>> +{
>> +	struct v4l2_async_notifier *notifier = &port->notifier;
>> +	struct fwnode_handle *subdev;
>> +	struct v4l2_fwnode_endpoint *vep;
>> +	struct v4l2_async_connection *asd;
>> +	int ret;
>> +	struct vip_dev *dev = port->dev;
>> +
>> +	vep = &port->endpoint;
>> +
>> +	subdev = fwnode_graph_get_remote_port_parent(ep);
>> +	if (!subdev) {
>> +		v4l2_dbg(3, debug, &dev->v4l2_dev, "can't get remote parent\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_fwnode_endpoint_parse(ep, vep);
>> +	if (ret) {
>> +		v4l2_dbg(3, debug, &dev->v4l2_dev, "Failed to parse endpoint:\n");
>> +		fwnode_handle_put(subdev);
>> +		return -EINVAL;
>> +	}
>> +
>> +	v4l2_async_nf_init(notifier, &port->dev->shared->v4l2_dev);
>> +
>> +	asd = v4l2_async_nf_add_fwnode(notifier, subdev, struct v4l2_async_connection);
>> +	if (IS_ERR(asd)) {
>> +		v4l2_dbg(1, debug, &dev->v4l2_dev, "Error adding asd\n");
>> +		fwnode_handle_put(subdev);
>> +		v4l2_async_nf_cleanup(notifier);
>> +		return -EINVAL;
>> +	}
>> +
>> +	notifier->ops = &vip_async_ops;
>> +	ret = v4l2_async_nf_register(notifier);
>> +	if (ret) {
>> +		v4l2_dbg(1, debug, &dev->v4l2_dev, "Error registering async notifier\n");
>> +		v4l2_async_nf_cleanup(notifier);
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int vip_endpoint_scan(struct platform_device *pdev)
>> +{
>> +	struct device_node *parent = pdev->dev.of_node;
>> +	struct device_node *ep = NULL;
>> +	int count = 0, p;
>> +
>> +	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
>> +		ep = of_graph_get_endpoint_by_regs(parent, p, 0);
>> +		if (!ep)
>> +			continue;
>> +
>> +		count++;
>> +		of_node_put(ep);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static int vip_probe_complete(struct platform_device *pdev)
>> +{
>> +	struct vip_shared *shared = platform_get_drvdata(pdev);
>> +	struct vip_ctrl_module *ctrl = NULL;
>> +	struct vip_port *port;
>> +	struct vip_dev *dev;
>> +	struct device_node *parent = pdev->dev.of_node;
>> +	struct fwnode_handle *ep = NULL;
>> +	unsigned int syscon_args[5];
>> +	int ret, i, slice_id, port_id, p;
>> +
>> +	/* Allocate ctrl before using it */
>> +	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
>> +	if (!ctrl)
>> +		return -ENOMEM;
>> +
>> +	ctrl->syscon_pol = syscon_regmap_lookup_by_phandle_args(parent, "ti,ctrl-module",
>> +								5, syscon_args);
>> +
>> +	if (IS_ERR(ctrl->syscon_pol))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(ctrl->syscon_pol),
>> +				     "Failed to get ti,ctrl-module\n");
>> +
>> +	ctrl->syscon_offset = syscon_args[0];
>> +
>> +	for (i = 0; i < ARRAY_SIZE(ctrl->syscon_bit_field); i++)
>> +		ctrl->syscon_bit_field[i] = syscon_args[i + 1];
>> +
>> +	for (p = 0; p < (VIP_NUM_PORTS * VIP_NUM_SLICES); p++) {
>> +		ep = fwnode_graph_get_next_endpoint_by_regs(of_fwnode_handle(parent),
>> +							    p, 0);
>> +		if (!ep)
>> +			continue;
>> +
>> +		switch (p) {
>> +		case 0:
>> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTA;
>> +			break;
>> +		case 1:
>> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTA;
>> +			break;
>> +		case 2:
>> +			slice_id = VIP_SLICE1;	port_id = VIP_PORTB;
>> +			break;
>> +		case 3:
>> +			slice_id = VIP_SLICE2;	port_id = VIP_PORTB;
>> +			break;
>> +		default:
>> +			dev_err(&pdev->dev, "Unknown port reg=<%d>\n", p);
>> +			continue;
>> +		}
>> +
>> +		ret = alloc_port(shared->devs[slice_id], port_id);
>> +		if (ret < 0)
>> +			continue;
>> +
>> +		dev = shared->devs[slice_id];
>> +		dev->syscon = ctrl;
>> +		port = dev->ports[port_id];
>> +
>> +		vip_register_subdev_notif(port, ep);
>> +		fwnode_handle_put(ep);
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int vip_probe_slice(struct platform_device *pdev, int slice)
>> +{
>> +	struct vip_shared *shared = platform_get_drvdata(pdev);
>> +	struct vip_dev *dev;
>> +	struct vip_parser_data *parser;
>> +	struct sc_data *sc;
>> +	struct csc_data *csc;
>> +	int ret;
>> +
>> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> 
> This can be dangerous. Memory allocated with devm_* is freed right after the
> driver's remove() is called. If the device is unloaded while a filehandle is
> still open, then I suspect that will crash once that last fh is closed.
> 
> That said, there are many platform drivers that use this. I just wanted to
> mention this.
> 
>> +	if (!dev)
>> +		return -ENOMEM;
>> +
>> +	dev->irq = platform_get_irq(pdev, slice);
>> +	if (dev->irq < 0)
>> +		return dev->irq;
>> +
>> +	ret = devm_request_irq(&pdev->dev, dev->irq, vip_irq,
>> +			       0, VIP_MODULE_NAME, dev);
>> +	if (ret < 0)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&dev->slock);
>> +	mutex_init(&dev->mutex);
>> +
>> +	dev->slice_id = slice;
>> +	dev->pdev = pdev;
>> +	dev->base = shared->base;
>> +	dev->v4l2_dev = shared->v4l2_dev;
>> +
>> +	dev->shared = shared;
>> +	shared->devs[slice] = dev;
>> +
>> +	vip_top_reset(dev);
>> +	vip_set_slice_path(dev, VIP_MULTI_CHANNEL_DATA_SELECT, 1);
>> +
>> +	parser = devm_kzalloc(&pdev->dev, sizeof(*dev->parser), GFP_KERNEL);
>> +	if (!parser)
>> +		return PTR_ERR(parser);
>> +
>> +	parser->base = dev->base + (slice ? VIP_SLICE1_PARSER : VIP_SLICE0_PARSER);
>> +	if (IS_ERR(parser->base))
>> +		return PTR_ERR(parser->base);
>> +
>> +	parser->pdev = pdev;
>> +	dev->parser = parser;
>> +
>> +	dev->sc_assigned = VIP_NOT_ASSIGNED;
>> +	sc = devm_kzalloc(&pdev->dev, sizeof(*dev->sc), GFP_KERNEL);
>> +	if (!sc)
>> +		return PTR_ERR(sc);
>> +
>> +	sc->base = dev->base + (slice ? VIP_SLICE1_SC : VIP_SLICE0_SC);
>> +	if (IS_ERR(sc->base))
>> +		return PTR_ERR(sc->base);
>> +
>> +	sc->pdev = pdev;
>> +	dev->sc = sc;
>> +
>> +	dev->csc_assigned = VIP_NOT_ASSIGNED;
>> +	csc = devm_kzalloc(&pdev->dev, sizeof(*dev->csc), GFP_KERNEL);
>> +	if (!csc)
>> +		return PTR_ERR(csc);
>> +
>> +	csc->base = dev->base + (slice ? VIP_SLICE1_CSC : VIP_SLICE0_CSC);
>> +	if (IS_ERR(csc->base))
>> +		return PTR_ERR(csc->base);
>> +
>> +	csc->pdev = pdev;
>> +	dev->csc = csc;
>> +
>> +	return 0;
>> +}
>> +
>> +static int vip_probe(struct platform_device *pdev)
>> +{
>> +	struct vip_shared *shared;
>> +	struct pinctrl *pinctrl;
>> +	int ret, slice = VIP_SLICE1;
>> +	u32 tmp, pid;
>> +
>> +	/* If there are no endpoint defined there is nothing to do */
>> +	if (!vip_endpoint_scan(pdev)) {
>> +		dev_err(&pdev->dev, "%s: No sensor", __func__);
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
>> +	if (ret) {
>> +		dev_err(&pdev->dev,
>> +			"32-bit consistent DMA enable failed\n");
>> +		return ret;
>> +	}
>> +
>> +	shared = devm_kzalloc(&pdev->dev, sizeof(*shared), GFP_KERNEL);
>> +	if (!shared)
>> +		return -ENOMEM;
>> +
>> +	shared->base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(shared->base))
>> +		return PTR_ERR(shared->base);
>> +
>> +	vip_init_format_info(&pdev->dev);
>> +
>> +	pinctrl = devm_pinctrl_get_select_default(&pdev->dev);
>> +
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	ret = pm_runtime_get_sync(&pdev->dev);
>> +	if (ret)
>> +		goto err_runtime_disable;
>> +
>> +	/* Make sure H/W module has the right functionality */
>> +	pid = reg_read(shared, VIP_PID);
>> +	tmp = get_field(pid, VIP_PID_FUNC_MASK, VIP_PID_FUNC_SHIFT);
>> +
>> +	if (tmp != VIP_PID_FUNC) {
>> +		dev_info(&pdev->dev, "vip: unexpected PID function: 0x%x\n",
>> +			 tmp);
>> +		ret = -ENODEV;
>> +		goto err_runtime_put;
>> +	}
>> +
>> +	ret = v4l2_device_register(&pdev->dev, &shared->v4l2_dev);
>> +	if (ret)
>> +		goto err_runtime_put;
>> +
>> +	/* enable clocks, so the firmware will load properly */
>> +	vip_shared_set_clock_enable(shared, 1);
>> +	vip_top_vpdma_reset(shared);
>> +
>> +	platform_set_drvdata(pdev, shared);
>> +
>> +	v4l2_ctrl_handler_init(&shared->ctrl_handler, 11);
>> +	shared->v4l2_dev.ctrl_handler = &shared->ctrl_handler;
>> +
>> +	for (slice = VIP_SLICE1; slice < VIP_NUM_SLICES; slice++) {
>> +		ret = vip_probe_slice(pdev, slice);
>> +		if (ret) {
>> +			dev_err(&pdev->dev, "Creating slice failed");
>> +			goto err_dev_unreg;
>> +		}
>> +	}
>> +
>> +	shared->vpdma = &shared->vpdma_data;
>> +
>> +	shared->vpdma->pdev = pdev;
>> +	shared->vpdma->cb = vip_vpdma_fw_cb;
>> +	spin_lock_init(&shared->vpdma->lock);
>> +
>> +	shared->vpdma->base = shared->base + VIP_VPDMA_BASE;
>> +	if (!shared->vpdma->base) {
>> +		dev_err(&pdev->dev, "failed to ioremap\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	ret = vpdma_load_firmware(shared->vpdma);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Creating VPDMA failed");
>> +		goto err_dev_unreg;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_dev_unreg:
>> +	v4l2_ctrl_handler_free(&shared->ctrl_handler);
>> +	v4l2_device_unregister(&shared->v4l2_dev);
>> +err_runtime_put:
>> +	pm_runtime_put_sync(&pdev->dev);
>> +err_runtime_disable:
>> +	pm_runtime_disable(&pdev->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static void vip_remove(struct platform_device *pdev)
>> +{
>> +	struct vip_shared *shared = platform_get_drvdata(pdev);
>> +	struct vip_dev *dev;
>> +	int slice;
>> +
>> +	for (slice = 0; slice < VIP_NUM_SLICES; slice++) {
>> +		dev = shared->devs[slice];
>> +		if (!dev)
>> +			continue;
>> +
>> +		free_port(dev->ports[VIP_PORTA]);
>> +		free_port(dev->ports[VIP_PORTB]);
>> +	}
>> +
>> +	v4l2_ctrl_handler_free(&shared->ctrl_handler);
>> +
>> +	pm_runtime_put_sync(&pdev->dev);
>> +	pm_runtime_disable(&pdev->dev);
>> +}
>> +
>> +#if defined(CONFIG_OF)
>> +static const struct of_device_id vip_of_match[] = {
>> +	{
>> +		.compatible = "ti,dra7-vip",
>> +	},
>> +	{},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, vip_of_match);
>> +#endif
>> +
>> +static struct platform_driver vip_pdrv = {
>> +	.probe		= vip_probe,
>> +	.remove		= vip_remove,
>> +	.driver		= {
>> +		.name	= VIP_MODULE_NAME,
>> +		.of_match_table = of_match_ptr(vip_of_match),
>> +	},
>> +};
>> +
>> +module_platform_driver(vip_pdrv);
>> +
>> +MODULE_DESCRIPTION("TI VIP driver");
>> +MODULE_AUTHOR("Texas Instruments");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/ti/vpe/vip.h b/drivers/media/platform/ti/vpe/vip.h
>> new file mode 100644
>> index 000000000000..20525369955d
>> --- /dev/null
>> +++ b/drivers/media/platform/ti/vpe/vip.h
>> @@ -0,0 +1,717 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * TI VIP capture driver
>> + *
>> + * Copyright (C) 2025 Texas Instruments Incorpated - http://www.ti.com/
>> + * David Griego, <dagriego@biglakesoftware.com>
>> + * Dale Farnsworth, <dale@farnsworth.org>
>> + * Yemike Abhilash Chandra, <y-abhilashchandra@ti.com>
>> + */
>> +
>> +#ifndef __TI_VIP_H
>> +#define __TI_VIP_H
>> +
>> +#include <linux/videodev2.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-core.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +#include <media/videobuf2-memops.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-async.h>
>> +
>> +#include "vpdma.h"
>> +#include "vpdma_priv.h"
>> +#include "sc.h"
>> +#include "csc.h"
>> +
>> +#define VIP_INSTANCE1	1
>> +#define VIP_INSTANCE2	2
>> +#define VIP_INSTANCE3	3
>> +
>> +#define VIP_SLICE1	0
>> +#define VIP_SLICE2	1
>> +#define VIP_NUM_SLICES	2
>> +
>> +/*
>> + * Additional client identifiers used for VPDMA configuration descriptors
>> + */
>> +#define VIP_SLICE1_CFD_SC_CLIENT	7
>> +#define VIP_SLICE2_CFD_SC_CLIENT	8
>> +
>> +#define VIP_PORTA	0
>> +#define VIP_PORTB	1
>> +#define VIP_NUM_PORTS	2
>> +
>> +#define VIP_MAX_PLANES	2
>> +#define	VIP_LUMA	0
>> +#define VIP_CHROMA	1
>> +
>> +#define VIP_CAP_STREAMS_PER_PORT	16
>> +#define VIP_VBI_STREAMS_PER_PORT	16
>> +
>> +#define VIP_MAX_SUBDEV			5
>> +
>> +#define VPDMA_FIRMWARE	"vpdma-1b8.bin"
>> +
>> +/*
>> + * This value needs to be at least as large as the number of entry in
>> + * vip_formats[].
>> + * When vip_formats[] is modified make sure to adjust this value also.
>> + */
>> +#define VIP_MAX_ACTIVE_FMT		16
>> +/*
>> + * Colorspace conversion unit can be in one of 3 modes:
>> + * NA  - Not Available on this port
>> + * Y2R - Needed for YUV to RGB on this port
>> + * R2Y - Needed for RGB to YUV on this port
>> + */
>> +enum vip_csc_state {
>> +	VIP_CSC_NA = 0,
>> +	VIP_CSC_Y2R,
>> +	VIP_CSC_R2Y,
>> +};
>> +
>> +/* buffer for one video frame */
>> +struct vip_buffer {
>> +	/* common v4l buffer stuff */
>> +	struct vb2_v4l2_buffer	vb;
>> +	struct list_head	list;
>> +	bool			drop;
>> +};
>> +
>> +/*
>> + * struct vip_fmt - VIP media bus format information
>> + * @fourcc: V4L2 pixel format FCC identifier
>> + * @code: V4L2 media bus format code
>> + * @colorspace: V4L2 colorspace identifier
>> + * @coplanar: 1 if unpacked Luma and Chroma, 0 otherwise (packed/interleaved)
>> + * @vpdma_fmt: VPDMA data format per plane.
>> + * @finfo: Cache v4l2_format_info for associated fourcc
>> + */
>> +struct vip_fmt {
>> +	u32	fourcc;
>> +	u32	code;
>> +	u32	colorspace;
>> +	u8	coplanar;
>> +	const struct vpdma_data_format *vpdma_fmt[VIP_MAX_PLANES];
>> +	const struct v4l2_format_info *finfo;
>> +};
>> +
>> +/*
>> + * The vip_parser_data structures contains the memory mapped
>> + * info to access the parser registers.
>> + */
>> +struct vip_parser_data {
>> +	void __iomem		*base;
>> +
>> +	struct platform_device *pdev;
>> +};
>> +
>> +/*
>> + * The vip_shared structure contains data that is shared by both
>> + * the VIP1 and VIP2 slices.
>> + */
>> +struct vip_shared {
>> +	struct list_head	list;
>> +	void __iomem		*base;
>> +	struct vpdma_data	vpdma_data;
>> +	struct vpdma_data	*vpdma;
>> +	struct v4l2_device	v4l2_dev;
>> +	struct vip_dev		*devs[VIP_NUM_SLICES];
>> +	struct v4l2_ctrl_handler ctrl_handler;
>> +};
>> +
>> +struct vip_ctrl_module {
>> +	struct regmap	*syscon_pol;
>> +	u32		syscon_offset;
>> +	u32		syscon_bit_field[4];
>> +};
>> +
>> +/*
>> + * There are two vip_dev structure, one for each vip slice: VIP1 & VIP2.
>> + */
>> +struct vip_dev {
>> +	struct v4l2_device	v4l2_dev;
>> +	struct platform_device	*pdev;
>> +	struct vip_shared	*shared;
>> +	struct vip_ctrl_module	*syscon;
>> +	int			instance_id;
>> +	int			slice_id;
>> +	int			num_ports;	/* count of open ports */
>> +	struct mutex		mutex;
>> +	/* protects access to stream buffer queues */
>> +	spinlock_t		slock;
>> +
>> +	int			irq;
>> +	void __iomem		*base;
>> +
>> +	struct vip_port		*ports[VIP_NUM_PORTS];
>> +
>> +	char			name[16];
>> +	/* parser data handle */
>> +	struct vip_parser_data	*parser;
>> +	/* scaler data handle */
>> +	struct sc_data		*sc;
>> +	/* scaler port assignation */
>> +	int			sc_assigned;
>> +	/* csc data handle */
>> +	struct csc_data		*csc;
>> +	/* csc port assignation */
>> +	int			csc_assigned;
>> +};
>> +
>> +/*
>> + * There are two vip_port structures for each vip_dev, one for port A
>> + * and one for port B.
>> + */
>> +struct vip_port {
>> +	struct vip_dev		*dev;
>> +	int			port_id;
>> +
>> +	unsigned int		flags;
>> +	struct v4l2_rect	c_rect;		/* crop rectangle */
>> +	struct v4l2_mbus_framefmt mbus_framefmt;
>> +	struct v4l2_mbus_framefmt try_mbus_framefmt;
>> +
>> +	char			name[16];
>> +	struct vip_fmt		*fmt;		/* current format info */
>> +	/* Number of channels/streams configured */
>> +	int			num_streams_configured;
>> +	int			num_streams;	/* count of open streams */
>> +	struct vip_stream	*cap_streams[VIP_CAP_STREAMS_PER_PORT];
>> +
>> +	struct v4l2_async_notifier notifier;
>> +	struct v4l2_subdev	*subdev;
>> +	struct v4l2_fwnode_endpoint endpoint;
>> +	struct vip_fmt		*active_fmt[VIP_MAX_ACTIVE_FMT];
>> +	int			num_active_fmt;
>> +	/* have new shadow reg values */
>> +	bool			load_mmrs;
>> +	/* shadow reg addr/data block */
>> +	struct vpdma_buf	mmr_adb;
>> +	/* h coeff buffer */
>> +	struct vpdma_buf	sc_coeff_h;
>> +	/* v coeff buffer */
>> +	struct vpdma_buf	sc_coeff_v;
>> +	/* Show if scaler resource is available on this port */
>> +	bool			scaler;
>> +	/* Show the csc resource state on this port */
>> +	enum vip_csc_state	csc;
>> +};
>> +
>> +/*
>> + * When handling multiplexed video, there can be multiple streams for each
>> + * port.  The vip_stream structure holds per-stream data.
>> + */
>> +struct vip_stream {
>> +	struct video_device	*vfd;
>> +	struct vip_port		*port;
>> +	int			stream_id;
>> +	int			list_num;
>> +	int			vfl_type;
>> +	char			name[16];
>> +	struct work_struct	recovery_work;
>> +	int			num_recovery;
>> +	enum v4l2_field		field;		/* current field */
>> +	unsigned int		sequence;	/* current frame/field seq */
>> +	enum v4l2_field		sup_field;	/* supported field value */
>> +	unsigned int		width;		/* frame width */
>> +	unsigned int		height;		/* frame height */
>> +	unsigned int		bytesperline;	/* bytes per line in memory */
>> +	unsigned int		sizeimage;	/* image size in memory */
>> +	struct list_head	vidq;		/* incoming vip_bufs queue */
>> +	struct list_head	dropq;		/* drop vip_bufs queue */
>> +	struct list_head	post_bufs;	/* vip_bufs to be DMAed */
>> +	/* Maintain a list of used channels - Needed for VPDMA cleanup */
>> +	int			vpdma_channels[VPDMA_MAX_CHANNELS];
>> +	int			vpdma_channels_to_abort[VPDMA_MAX_CHANNELS];
>> +	struct vpdma_desc_list	desc_list;	/* DMA descriptor list */
>> +	struct vpdma_dtd	*write_desc;
>> +	/* next unused desc_list addr */
>> +	void			*desc_next;
>> +	struct vb2_queue	vb_vidq;
>> +};
>> +
>> +/*
>> + * VIP Enumerations
>> + */
>> +enum data_path_select {
>> +	ALL_FIELDS_DATA_SELECT = 0,
>> +	VIP_CSC_SRC_DATA_SELECT,
>> +	VIP_SC_SRC_DATA_SELECT,
>> +	VIP_RGB_SRC_DATA_SELECT,
>> +	VIP_RGB_OUT_LO_DATA_SELECT,
>> +	VIP_RGB_OUT_HI_DATA_SELECT,
>> +	VIP_CHR_DS_1_SRC_DATA_SELECT,
>> +	VIP_CHR_DS_2_SRC_DATA_SELECT,
>> +	VIP_MULTI_CHANNEL_DATA_SELECT,
>> +	VIP_CHR_DS_1_DATA_BYPASS,
>> +	VIP_CHR_DS_2_DATA_BYPASS,
>> +};
>> +
>> +enum data_interface_modes {
>> +	SINGLE_24B_INTERFACE = 0,
>> +	SINGLE_16B_INTERFACE = 1,
>> +	DUAL_8B_INTERFACE = 2,
>> +};
>> +
>> +enum sync_types {
>> +	EMBEDDED_SYNC_SINGLE_YUV422 = 0,
>> +	EMBEDDED_SYNC_2X_MULTIPLEXED_YUV422 = 1,
>> +	EMBEDDED_SYNC_4X_MULTIPLEXED_YUV422 = 2,
>> +	EMBEDDED_SYNC_LINE_MULTIPLEXED_YUV422 = 3,
>> +	DISCRETE_SYNC_SINGLE_YUV422 = 4,
>> +	EMBEDDED_SYNC_SINGLE_RGB_OR_YUV444 = 5,
>> +	DISCRETE_SYNC_SINGLE_RGB_24B = 10,
>> +};
>> +
>> +#define VIP_NOT_ASSIGNED	-1
>> +
>> +/*
>> + * Register offsets and field selectors
>> + */
>> +#define VIP_PID_FUNC			0xf02
>> +
>> +#define VIP_PID				0x0000
>> +#define VIP_PID_MINOR_MASK              0x3f
>> +#define VIP_PID_MINOR_SHIFT             0
>> +#define VIP_PID_CUSTOM_MASK             0x03
>> +#define VIP_PID_CUSTOM_SHIFT            6
>> +#define VIP_PID_MAJOR_MASK              0x07
>> +#define VIP_PID_MAJOR_SHIFT             8
>> +#define VIP_PID_RTL_MASK                0x1f
>> +#define VIP_PID_RTL_SHIFT               11
>> +#define VIP_PID_FUNC_MASK               0xfff
>> +#define VIP_PID_FUNC_SHIFT              16
>> +#define VIP_PID_SCHEME_MASK             0x03
>> +#define VIP_PID_SCHEME_SHIFT            30
>> +
>> +#define VIP_SYSCONFIG			0x0010
>> +#define VIP_SYSCONFIG_IDLE_MASK         0x03
>> +#define VIP_SYSCONFIG_IDLE_SHIFT        2
>> +#define VIP_SYSCONFIG_STANDBY_MASK      0x03
>> +#define VIP_SYSCONFIG_STANDBY_SHIFT     4
>> +#define VIP_FORCE_IDLE_MODE             0
>> +#define VIP_NO_IDLE_MODE                1
>> +#define VIP_SMART_IDLE_MODE             2
>> +#define VIP_SMART_IDLE_WAKEUP_MODE      3
>> +#define VIP_FORCE_STANDBY_MODE          0
>> +#define VIP_NO_STANDBY_MODE             1
>> +#define VIP_SMART_STANDBY_MODE          2
>> +#define VIP_SMART_STANDBY_WAKEUP_MODE   3
>> +
>> +#define VIP_INTC_INTX_OFFSET		0x0020
>> +
>> +#define VIP_INT0_STATUS0_RAW_SET	0x0020
>> +#define VIP_INT0_STATUS0_RAW		VIP_INT0_STATUS0_RAW_SET
>> +#define VIP_INT0_STATUS0_CLR		0x0028
>> +#define VIP_INT0_STATUS0		VIP_INT0_STATUS0_CLR
>> +#define VIP_INT0_ENABLE0_SET		0x0030
>> +#define VIP_INT0_ENABLE0		VIP_INT0_ENABLE0_SET
>> +#define VIP_INT0_ENABLE0_CLR		0x0038
>> +#define VIP_INT0_LIST0_COMPLETE         BIT(0)
>> +#define VIP_INT0_LIST0_NOTIFY           BIT(1)
>> +#define VIP_INT0_LIST1_COMPLETE         BIT(2)
>> +#define VIP_INT0_LIST1_NOTIFY           BIT(3)
>> +#define VIP_INT0_LIST2_COMPLETE         BIT(4)
>> +#define VIP_INT0_LIST2_NOTIFY           BIT(5)
>> +#define VIP_INT0_LIST3_COMPLETE         BIT(6)
>> +#define VIP_INT0_LIST3_NOTIFY           BIT(7)
>> +#define VIP_INT0_LIST4_COMPLETE         BIT(8)
>> +#define VIP_INT0_LIST4_NOTIFY           BIT(9)
>> +#define VIP_INT0_LIST5_COMPLETE         BIT(10)
>> +#define VIP_INT0_LIST5_NOTIFY           BIT(11)
>> +#define VIP_INT0_LIST6_COMPLETE         BIT(12)
>> +#define VIP_INT0_LIST6_NOTIFY           BIT(13)
>> +#define VIP_INT0_LIST7_COMPLETE         BIT(14)
>> +#define VIP_INT0_LIST7_NOTIFY           BIT(15)
>> +#define VIP_INT0_DESCRIPTOR             BIT(16)
>> +#define VIP_VIP1_PARSER_INT		BIT(20)
>> +#define VIP_VIP2_PARSER_INT		BIT(21)
>> +
>> +#define VIP_INT0_STATUS1_RAW_SET        0x0024
>> +#define VIP_INT0_STATUS1_RAW            VIP_INT0_STATUS0_RAW_SET
>> +#define VIP_INT0_STATUS1_CLR            0x002c
>> +#define VIP_INT0_STATUS1                VIP_INT0_STATUS0_CLR
>> +#define VIP_INT0_ENABLE1_SET            0x0034
>> +#define VIP_INT0_ENABLE1                VIP_INT0_ENABLE0_SET
>> +#define VIP_INT0_ENABLE1_CLR            0x003c
>> +#define VIP_INT0_ENABLE1_STAT		0x004c
>> +#define VIP_INT0_CHANNEL_GROUP0		BIT(0)
>> +#define VIP_INT0_CHANNEL_GROUP1		BIT(1)
>> +#define VIP_INT0_CHANNEL_GROUP2		BIT(2)
>> +#define VIP_INT0_CHANNEL_GROUP3		BIT(3)
>> +#define VIP_INT0_CHANNEL_GROUP4		BIT(4)
>> +#define VIP_INT0_CHANNEL_GROUP5		BIT(5)
>> +#define VIP_INT0_CLIENT			BIT(7)
>> +#define VIP_VIP1_DS1_UV_ERROR_INT	BIT(22)
>> +#define VIP_VIP1_DS2_UV_ERROR_INT	BIT(23)
>> +#define VIP_VIP2_DS1_UV_ERROR_INT	BIT(24)
>> +#define VIP_VIP2_DS2_UV_ERROR_INT	BIT(25)
>> +
>> +#define VIP_INTC_E0I			0x00a0
>> +
>> +#define VIP_CLK_ENABLE			0x0100
>> +#define VIP_VPDMA_CLK_ENABLE		BIT(0)
>> +#define VIP_VIP1_DATA_PATH_CLK_ENABLE	BIT(16)
>> +#define VIP_VIP2_DATA_PATH_CLK_ENABLE	BIT(17)
>> +
>> +#define VIP_CLK_RESET			0x0104
>> +#define VIP_VPDMA_RESET			BIT(0)
>> +#define VIP_VPDMA_CLK_RESET_MASK	0x1
>> +#define VIP_VPDMA_CLK_RESET_SHIFT	0
>> +#define VIP_DATA_PATH_CLK_RESET_MASK	0x1
>> +#define VIP_VIP1_DATA_PATH_RESET_SHIFT	16
>> +#define VIP_VIP2_DATA_PATH_RESET_SHIFT	17
>> +#define VIP_VIP1_DATA_PATH_RESET	BIT(16)
>> +#define VIP_VIP2_DATA_PATH_RESET	BIT(17)
>> +#define VIP_VIP1_PARSER_RESET		BIT(18)
>> +#define VIP_VIP2_PARSER_RESET		BIT(19)
>> +#define VIP_VIP1_CSC_RESET		BIT(20)
>> +#define VIP_VIP2_CSC_RESET		BIT(21)
>> +#define VIP_VIP1_SC_RESET		BIT(22)
>> +#define VIP_VIP2_SC_RESET		BIT(23)
>> +#define VIP_VIP1_DS1_RESET		BIT(25)
>> +#define VIP_VIP2_DS1_RESET		BIT(26)
>> +#define VIP_VIP1_DS2_RESET		BIT(27)
>> +#define VIP_VIP2_DS2_RESET		BIT(28)
>> +#define VIP_MAIN_RESET			BIT(31)
>> +
>> +#define VIP_VIP1_DATA_PATH_SELECT	0x010c
>> +#define VIP_VIP2_DATA_PATH_SELECT	0x0110
>> +#define VIP_CSC_SRC_SELECT_MASK		0x07
>> +#define VIP_CSC_SRC_SELECT_SHFT		0
>> +#define VIP_SC_SRC_SELECT_MASK		0x07
>> +#define VIP_SC_SRC_SELECT_SHFT		3
>> +#define VIP_RGB_SRC_SELECT		BIT(6)
>> +#define VIP_RGB_OUT_LO_SRC_SELECT	BIT(7)
>> +#define VIP_RGB_OUT_HI_SRC_SELECT	BIT(8)
>> +#define VIP_DS1_SRC_SELECT_MASK		0x07
>> +#define VIP_DS1_SRC_SELECT_SHFT		9
>> +#define VIP_DS2_SRC_SELECT_MASK		0x07
>> +#define VIP_DS2_SRC_SELECT_SHFT		12
>> +#define VIP_MULTI_CHANNEL_SELECT	BIT(15)
>> +#define VIP_DS1_BYPASS			BIT(16)
>> +#define VIP_DS2_BYPASS			BIT(17)
>> +#define VIP_TESTPORT_B_SELECT		BIT(26)
>> +#define VIP_TESTPORT_A_SELECT		BIT(27)
>> +#define VIP_DATAPATH_SELECT_MASK	0x0f
>> +#define VIP_DATAPATH_SELECT_SHFT	28
>> +
>> +#define VIP_PARSER_MAIN_CFG		0x0000
>> +#define VIP_DATA_INTERFACE_MODE_MASK	0x03
>> +#define VIP_DATA_INTERFACE_MODE_SHFT	0
>> +#define VIP_CLIP_BLANK			BIT(4)
>> +#define VIP_CLIP_ACTIVE			BIT(5)
>> +
>> +#define VIP_SLICE0_PARSER		0x5500
>> +#define VIP_SLICE1_PARSER		0x5a00
>> +#define VIP_PARSER_PORTA_0		0x0004
>> +#define VIP_PARSER_PORTB_0		0x000c
>> +#define VIP_SYNC_TYPE_MASK		0x0f
>> +#define VIP_SYNC_TYPE_SHFT		0
>> +#define VIP_CTRL_CHANNEL_SEL_MASK	0x03
>> +#define VIP_CTRL_CHANNEL_SEL_SHFT	4
>> +#define VIP_ASYNC_FIFO_WR		BIT(6)
>> +#define VIP_ASYNC_FIFO_RD		BIT(7)
>> +#define VIP_PORT_ENABLE			BIT(8)
>> +#define VIP_FID_POLARITY		BIT(9)
>> +#define VIP_PIXCLK_EDGE_POLARITY	BIT(10)
>> +#define VIP_HSYNC_POLARITY		BIT(11)
>> +#define VIP_VSYNC_POLARITY		BIT(12)
>> +#define VIP_ACTVID_POLARITY		BIT(13)
>> +#define VIP_FID_DETECT_MODE		BIT(14)
>> +#define VIP_USE_ACTVID_HSYNC_ONLY	BIT(15)
>> +#define VIP_FID_SKEW_PRECOUNT_MASK	0x3f
>> +#define VIP_FID_SKEW_PRECOUNT_SHFT	16
>> +#define VIP_DISCRETE_BASIC_MODE		BIT(22)
>> +#define VIP_SW_RESET			BIT(23)
>> +#define VIP_FID_SKEW_POSTCOUNT_MASK	0x3f
>> +#define VIP_FID_SKEW_POSTCOUNT_SHFT	24
>> +#define VIP_ANALYZER_2X4X_SRCNUM_POS	BIT(30)
>> +#define VIP_ANALYZER_FVH_ERR_COR_EN	BIT(31)
>> +
>> +#define VIP_PARSER_PORTA_1		0x0008
>> +#define VIP_PARSER_PORTB_1		0x0010
>> +#define VIP_SRC0_NUMLINES_MASK		0x0fff
>> +#define VIP_SRC0_NUMLINES_SHFT		0
>> +#define VIP_ANC_CHAN_SEL_8B_MASK	0x03
>> +#define VIP_ANC_CHAN_SEL_8B_SHFT	13
>> +#define VIP_SRC0_NUMPIX_MASK		0x0fff
>> +#define VIP_SRC0_NUMPIX_SHFT		16
>> +#define VIP_REPACK_SEL_MASK		0x07
>> +#define VIP_REPACK_SEL_SHFT		28
>> +
>> +#define VIP_PARSER_FIQ_MASK		0x0014
>> +#define VIP_PARSER_FIQ_CLR		0x0018
>> +#define VIP_PARSER_FIQ_STATUS		0x001c
>> +#define VIP_PORTA_VDET			BIT(0)
>> +#define VIP_PORTB_VDET			BIT(1)
>> +#define VIP_PORTA_ASYNC_FIFO_OF		BIT(2)
>> +#define VIP_PORTB_ASYNC_FIFO_OF		BIT(3)
>> +#define VIP_PORTA_OUTPUT_FIFO_YUV	BIT(4)
>> +#define VIP_PORTA_OUTPUT_FIFO_ANC	BIT(6)
>> +#define VIP_PORTB_OUTPUT_FIFO_YUV	BIT(7)
>> +#define VIP_PORTB_OUTPUT_FIFO_ANC	BIT(9)
>> +#define VIP_PORTA_CONN			BIT(10)
>> +#define VIP_PORTA_DISCONN		BIT(11)
>> +#define VIP_PORTB_CONN			BIT(12)
>> +#define VIP_PORTB_DISCONN		BIT(13)
>> +#define VIP_PORTA_SRC0_SIZE		BIT(14)
>> +#define VIP_PORTB_SRC0_SIZE		BIT(15)
>> +#define VIP_PORTA_YUV_PROTO_VIOLATION	BIT(16)
>> +#define VIP_PORTA_ANC_PROTO_VIOLATION	BIT(17)
>> +#define VIP_PORTB_YUV_PROTO_VIOLATION	BIT(18)
>> +#define VIP_PORTB_ANC_PROTO_VIOLATION	BIT(19)
>> +#define VIP_PORTA_CFG_DISABLE_COMPLETE	BIT(20)
>> +#define VIP_PORTB_CFG_DISABLE_COMPLETE	BIT(21)
>> +
>> +#define VIP_PARSER_PORTA_SOURCE_FID	0x0020
>> +#define VIP_PARSER_PORTA_ENCODER_FID	0x0024
>> +#define VIP_PARSER_PORTB_SOURCE_FID	0x0028
>> +#define VIP_PARSER_PORTB_ENCODER_FID	0x002c
>> +
>> +#define VIP_PARSER_PORTA_SRC0_SIZE	0x0030
>> +#define VIP_PARSER_PORTB_SRC0_SIZE	0x0070
>> +#define VIP_SOURCE_HEIGHT_MASK		0x0fff
>> +#define VIP_SOURCE_HEIGHT_SHFT		0
>> +#define VIP_SOURCE_WIDTH_MASK		0x0fff
>> +#define VIP_SOURCE_WIDTH_SHFT		16
>> +
>> +#define VIP_PARSER_PORTA_VDET_VEC	0x00b0
>> +#define VIP_PARSER_PORTB_VDET_VEC	0x00b4
>> +
>> +#define VIP_PARSER_PORTA_EXTRA2		0x00b8
>> +#define VIP_PARSER_PORTB_EXTRA2		0x00c8
>> +#define VIP_ANC_SKIP_NUMPIX_MASK	0x0fff
>> +#define VIP_ANC_SKIP_NUMPIX_SHFT	0
>> +#define VIP_ANC_BYPASS			BIT(15)
>> +#define VIP_ANC_USE_NUMPIX_MASK		0x0fff
>> +#define VIP_ANC_USE_NUMPIX_SHFT		16
>> +#define VIP_ANC_TARGET_SRCNUM_MASK	0x0f
>> +#define VIP_ANC_TARGET_SRCNUM_SHFT	28
>> +
>> +#define VIP_PARSER_PORTA_EXTRA3		0x00bc
>> +#define VIP_PARSER_PORTB_EXTRA3		0x00cc
>> +#define VIP_ANC_SKIP_NUMLINES_MASK	0x0fff
>> +#define VIP_ANC_SKIP_NUMLINES_SHFT	0
>> +#define VIP_ANC_USE_NUMLINES_MASK	0x0fff
>> +#define VIP_ANC_USE_NUMLINES_SHFT	16
>> +
>> +#define VIP_PARSER_PORTA_EXTRA4		0x00c0
>> +#define VIP_PARSER_PORTB_EXTRA4		0x00d0
>> +#define VIP_ACT_SKIP_NUMPIX_MASK	0x0fff
>> +#define VIP_ACT_SKIP_NUMPIX_SHFT	0
>> +#define VIP_ACT_BYPASS			BIT(15)
>> +#define VIP_ACT_USE_NUMPIX_MASK		0x0fff
>> +#define VIP_ACT_USE_NUMPIX_SHFT		16
>> +#define VIP_ACT_TARGET_SRCNUM_MASK	0x0f
>> +#define VIP_ACT_TARGET_SRCNUM_SHFT	28
>> +
>> +#define VIP_PARSER_PORTA_EXTRA5		0x00c4
>> +#define VIP_PARSER_PORTB_EXTRA5		0x00d4
>> +#define VIP_ACT_SKIP_NUMLINES_MASK	0x0fff
>> +#define VIP_ACT_SKIP_NUMLINES_SHFT	0
>> +#define VIP_ACT_USE_NUMLINES_MASK	0x0fff
>> +#define VIP_ACT_USE_NUMLINES_SHFT	16
>> +
>> +#define VIP_PARSER_PORTA_EXTRA6		0x00d8
>> +#define VIP_PARSER_PORTB_EXTRA6		0x00dc
>> +#define VIP_ANC_SRCNUM_STOP_IMM_SHFT	0
>> +#define VIP_YUV_SRCNUM_STOP_IMM_SHFT	16
>> +
>> +#define VIP_SLICE0_CSC			0x5700
>> +#define VIP_SLICE1_CSC			0x5c00
>> +#define VIP_CSC_CSC00			0x0200
>> +#define VIP_CSC_A0_MASK			0x1fff
>> +#define VIP_CSC_A0_SHFT			0
>> +#define VIP_CSC_B0_MASK			0x1fff
>> +#define VIP_CSC_B0_SHFT			16
>> +
>> +#define VIP_CSC_CSC01			0x0204
>> +#define VIP_CSC_C0_MASK			0x1fff
>> +#define VIP_CSC_C0_SHFT			0
>> +#define VIP_CSC_A1_MASK			0x1fff
>> +#define VIP_CSC_A1_SHFT			16
>> +
>> +#define VIP_CSC_CSC02			0x0208
>> +#define VIP_CSC_B1_MASK			0x1fff
>> +#define VIP_CSC_B1_SHFT			0
>> +#define VIP_CSC_C1_MASK			0x1fff
>> +#define VIP_CSC_C1_SHFT			16
>> +
>> +#define VIP_CSC_CSC03			0x020c
>> +#define VIP_CSC_A2_MASK			0x1fff
>> +#define VIP_CSC_A2_SHFT			0
>> +#define VIP_CSC_B2_MASK			0x1fff
>> +#define VIP_CSC_B2_SHFT			16
>> +
>> +#define VIP_CSC_CSC04			0x0210
>> +#define VIP_CSC_C2_MASK			0x1fff
>> +#define VIP_CSC_C2_SHFT			0
>> +#define VIP_CSC_D0_MASK			0x0fff
>> +#define VIP_CSC_D0_SHFT			16
>> +
>> +#define VIP_CSC_CSC05			0x0214
>> +#define VIP_CSC_D1_MASK			0x0fff
>> +#define VIP_CSC_D1_SHFT			0
>> +#define VIP_CSC_D2_MASK			0x0fff
>> +#define VIP_CSC_D2_SHFT			16
>> +#define VIP_CSC_BYPASS			BIT(28)
>> +
>> +#define VIP_SLICE0_SC			0x5800
>> +#define VIP_SLICE1_SC			0x5d00
>> +#define VIP_SC_MP_SC0			0x0300
>> +#define VIP_INTERLACE_O			BIT(0)
>> +#define VIP_LINEAR			BIT(1)
>> +#define VIP_SC_BYPASS			BIT(2)
>> +#define VIP_INVT_FID			BIT(3)
>> +#define VIP_USE_RAV			BIT(4)
>> +#define VIP_ENABLE_EV			BIT(5)
>> +#define VIP_AUTH_HS			BIT(6)
>> +#define VIP_DCM_2X			BIT(7)
>> +#define VIP_DCM_4X			BIT(8)
>> +#define VIP_HP_BYPASS			BIT(9)
>> +#define VIP_INTERLACE_I			BIT(10)
>> +#define VIP_ENABLE_SIN2_VER_INTP	BIT(11)
>> +#define VIP_Y_PK_EN			BIT(14)
>> +#define VIP_TRIM			BIT(15)
>> +#define VIP_SELFGEN_FID			BIT(16)
>> +
>> +#define VIP_SC_MP_SC1			0x0304
>> +#define VIP_ROW_ACC_INC_MASK		0x07ffffff
>> +#define VIP_ROW_ACC_INC_SHFT		0
>> +
>> +#define VIP_SC_MP_SC2			0x0308
>> +#define VIP_ROW_ACC_OFFSET_MASK		0x0fffffff
>> +#define VIP_ROW_ACC_OFFSET_SHFT		0
>> +
>> +#define VIP_SC_MP_SC3			0x030c
>> +#define VIP_ROW_ACC_OFFSET_B_MASK	0x0fffffff
>> +#define VIP_ROW_ACC_OFFSET_B_SHFT	0
>> +
>> +#define VIP_SC_MP_SC4			0x0310
>> +#define VIP_TAR_H_MASK			0x07ff
>> +#define VIP_TAR_H_SHFT			0
>> +#define VIP_TAR_W_MASK			0x07ff
>> +#define VIP_TAR_W_SHFT			12
>> +#define VIP_LIN_ACC_INC_U_MASK		0x07
>> +#define VIP_LIN_ACC_INC_U_SHFT		24
>> +#define VIP_NLIN_ACC_INIT_U_MASK	0x07
>> +#define VIP_NLIN_ACC_INIT_U_SHFT	28
>> +
>> +#define VIP_SC_MP_SC5			0x0314
>> +#define VIP_SRC_H_MASK			0x03ff
>> +#define VIP_SRC_H_SHFT			0
>> +#define VIP_SRC_W_MASK			0x07ff
>> +#define VIP_SRC_W_SHFT			12
>> +#define VIP_NLIN_ACC_INC_U_MASK		0x07
>> +#define VIP_NLIN_ACC_INC_U_SHFT		24
>> +
>> +#define VIP_SC_MP_SC6			0x0318
>> +#define VIP_ROW_ACC_INIT_RAV_MASK	0x03ff
>> +#define VIP_ROW_ACC_INIT_RAV_SHFT	0
>> +#define VIP_ROW_ACC_INIT_RAV_B_MASK	0x03ff
>> +#define VIP_ROW_ACC_INIT_RAV_B_SHFT	10
>> +
>> +#define VIP_SC_MP_SC8			0x0320
>> +#define VIP_NLIN_LEFT_MASK		0x07ff
>> +#define VIP_NLIN_LEFT_SHFT		0
>> +#define VIP_NLIN_RIGHT_MASK		0x07ff
>> +#define VIP_NLIN_RIGHT_SHFT		12
>> +
>> +#define VIP_SC_MP_SC9			0x0324
>> +#define VIP_LIN_ACC_INC			VIP_SC_MP_SC9
>> +
>> +#define VIP_SC_MP_SC10			0x0328
>> +#define VIP_NLIN_ACC_INIT		VIP_SC_MP_SC10
>> +
>> +#define VIP_SC_MP_SC11			0x032c
>> +#define VIP_NLIN_ACC_INC		VIP_SC_MP_SC11
>> +
>> +#define VIP_SC_MP_SC12			0x0330
>> +#define VIP_COL_ACC_OFFSET_MASK		0x01ffffff
>> +#define VIP_COL_ACC_OFFSET_SHFT		0
>> +
>> +#define VIP_SC_MP_SC13			0x0334
>> +#define VIP_SC_FACTOR_RAV_MASK		0x03ff
>> +#define VIP_SC_FACTOR_RAV_SHFT		0
>> +#define VIP_CHROMA_INTP_THR_MASK	0x03ff
>> +#define VIP_CHROMA_INTP_THR_SHFT	12
>> +#define VIP_DELTA_CHROMA_THR_MASK	0x0f
>> +#define VIP_DELTA_CHROMA_THR_SHFT	24
>> +
>> +#define VIP_SC_MP_SC17			0x0344
>> +#define VIP_EV_THR_MASK			0x03ff
>> +#define VIP_EV_THR_SHFT			12
>> +#define VIP_DELTA_LUMA_THR_MASK		0x0f
>> +#define VIP_DELTA_LUMA_THR_SHFT		24
>> +#define VIP_DELTA_EV_THR_MASK		0x0f
>> +#define VIP_DELTA_EV_THR_SHFT		28
>> +
>> +#define VIP_SC_MP_SC18			0x0348
>> +#define VIP_HS_FACTOR_MASK		0x03ff
>> +#define VIP_HS_FACTOR_SHFT		0
>> +#define VIP_CONF_DEFAULT_MASK		0x01ff
>> +#define VIP_CONF_DEFAULT_SHFT		16
>> +
>> +#define VIP_SC_MP_SC19			0x034c
>> +#define VIP_HPF_COEFF0_MASK		0xff
>> +#define VIP_HPF_COEFF0_SHFT		0
>> +#define VIP_HPF_COEFF1_MASK		0xff
>> +#define VIP_HPF_COEFF1_SHFT		8
>> +#define VIP_HPF_COEFF2_MASK		0xff
>> +#define VIP_HPF_COEFF2_SHFT		16
>> +#define VIP_HPF_COEFF3_MASK		0xff
>> +#define VIP_HPF_COEFF3_SHFT		23
>> +
>> +#define VIP_SC_MP_SC20			0x0350
>> +#define VIP_HPF_COEFF4_MASK		0xff
>> +#define VIP_HPF_COEFF4_SHFT		0
>> +#define VIP_HPF_COEFF5_MASK		0xff
>> +#define VIP_HPF_COEFF5_SHFT		8
>> +#define VIP_HPF_NORM_SHFT_MASK		0x07
>> +#define VIP_HPF_NORM_SHFT_SHFT		16
>> +#define VIP_NL_LIMIT_MASK		0x1ff
>> +#define VIP_NL_LIMIT_SHFT		20
>> +
>> +#define VIP_SC_MP_SC21			0x0354
>> +#define VIP_NL_LO_THR_MASK		0x01ff
>> +#define VIP_NL_LO_THR_SHFT		0
>> +#define VIP_NL_LO_SLOPE_MASK		0xff
>> +#define VIP_NL_LO_SLOPE_SHFT		16
>> +
>> +#define VIP_SC_MP_SC22			0x0358
>> +#define VIP_NL_HI_THR_MASK		0x01ff
>> +#define VIP_NL_HI_THR_SHFT		0
>> +#define VIP_NL_HI_SLOPE_SH_MASK		0x07
>> +#define VIP_NL_HI_SLOPE_SH_SHFT		16
>> +
>> +#define VIP_SC_MP_SC23			0x035c
>> +#define VIP_GRADIENT_THR_MASK		0x07ff
>> +#define VIP_GRADIENT_THR_SHFT		0
>> +#define VIP_GRADIENT_THR_RANGE_MASK	0x0f
>> +#define VIP_GRADIENT_THR_RANGE_SHFT	12
>> +#define VIP_MIN_GY_THR_MASK		0xff
>> +#define VIP_MIN_GY_THR_SHFT		16
>> +#define VIP_MIN_GY_THR_RANGE_MASK	0x0f
>> +#define VIP_MIN_GY_THR_RANGE_SHFT	28
>> +
>> +#define VIP_SC_MP_SC24			0x0360
>> +#define VIP_ORG_H_MASK			0x07ff
>> +#define VIP_ORG_H_SHFT			0
>> +#define VIP_ORG_W_MASK			0x07ff
>> +#define VIP_ORG_W_SHFT			16
>> +
>> +#define VIP_SC_MP_SC25			0x0364
>> +#define VIP_OFF_H_MASK			0x07ff
>> +#define VIP_OFF_H_SHFT			0
>> +#define VIP_OFF_W_MASK			0x07ff
>> +#define VIP_OFF_W_SHFT			16
>> +
>> +#define VIP_VPDMA_BASE			0xd000
>> +
>> +#endif
> Regards,
> 	Hans


