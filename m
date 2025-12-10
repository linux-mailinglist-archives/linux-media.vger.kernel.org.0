Return-Path: <linux-media+bounces-48548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4785ECB2940
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 10:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B36431392BE
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 09:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D19D2773D3;
	Wed, 10 Dec 2025 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AhVdJxAv"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010032.outbound.protection.outlook.com [52.101.61.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227A528C860;
	Wed, 10 Dec 2025 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765359253; cv=fail; b=aGH7AJFkaAA9pNvMhaOFqCV09rZE249ZqK1etwaB/CQFQVhHYQUyxMjj5Ae+D/sX0HEMqI4Y/E/iPfVXVLoKJlLSE7SnMtpsLl0xwoD2KEcGL0XjRpWVtblcvkRhy9rEWt0p/BFM4vnXVsfyAdkiuDnm1u4l9ZkDy+UHOOO9y6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765359253; c=relaxed/simple;
	bh=yNHaqNDxtDP7yymTUvajwKvX+jAsVd7VvELSjWkQ0T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rPhpDFXkQ7LX0E2T6aLEK9XC4L0mPM1wa8S7VTbwtLslkMGF3s3jp/86/pbbv56OWywC0MeK0+5wotGYidcxp4lHeVseG37jp6Zp6DYDtlc3vXfKNOL0V/cHEVUQQTCHyoHG573gIydE5okrkJpSCyFBXg0oU7TWwFfGPEJy+l4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AhVdJxAv; arc=fail smtp.client-ip=52.101.61.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0O8ha/YXRNibeeiWkl9ANmui58ayykx1xjC+gd455FHB1H57qTapcbr+tGcOP/CKY5SeFqI7/ELgYVwlyfuyCHGLz3VptQhFYPUJF0uBwmDI7tlCP951OAvBZw/wv8COe8mX91r0sEtYUr9tlgSnILb4qKsqbFgVQYq7lRd71ZL9Po0+XicYo5/EV6fzaJkk6C6Z0Fpqb9dNK21Ogovp/Zc5wOO2W8vuP33gzBZ5WkGxOE+wyZmwSiFPrM/NQahkf/QhcVm75MjiRiSrXb7p0YjFXjd40Z8OIOfkuGabnz6jlX+1mtVRgASOa76dltmjL+YI/Oio1I2Y7fj68W+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0D4K4DfJYaP256ie72AhUbSgLG0wAPc+6kFcUiFtlg=;
 b=Ilv1P3azRAKkmCFgI4RCyzgcGyOthmVXhBUATzdLTVpeqhmjrQH9HmgsRqjvDUhKvUsG/kvcwUw9tXUfZPGtvKhSMoRhawxjGgUVi+bxTCq4IkHnwNuy9UJuYqaPXElaOZ9vjiGiZr69yxo3br/oNl/qp3gxkAa93ATGB9Z7DMU6Sckz2ljgCwgMQsPaFBeJsUla3HnbyL2MP4ob8YcElfhgX42ft+dkQaAHhPv63+yOGydTsVeX8aR4H7y2x/imaA2ELl0+PLPgoB/vpDOZUST9HiHNUZqlgXaPhK2Ju7MuFhKYIuSSL5jLPqUyk0Oi/ejV5Q1jX18EvAHMqBLm+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0D4K4DfJYaP256ie72AhUbSgLG0wAPc+6kFcUiFtlg=;
 b=AhVdJxAvpXscZCaQNITlxjfOswnUWpkIPR5OdH/Oa2t9+iTR0xJUF9Fc6enSua/IpYjvlOjc6ZZ5RbnHJU1yEVfCDNq9XpNPk63qqWdlVZjHf24QFfT43dRv91GLrkCigEqu7rKE0IJ386qjpW4Hw1Z4DvResCMVVh3o6yAIaGg=
Received: from CH2PR16CA0010.namprd16.prod.outlook.com (2603:10b6:610:50::20)
 by BN0PR10MB4869.namprd10.prod.outlook.com (2603:10b6:408:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 09:34:08 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::e5) by CH2PR16CA0010.outlook.office365.com
 (2603:10b6:610:50::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 09:34:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 10 Dec 2025 09:34:08 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 03:34:05 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 03:34:05 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Dec 2025 03:34:05 -0600
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BA9Y0VE2713219;
	Wed, 10 Dec 2025 03:34:00 -0600
Message-ID: <df33c967-8dc1-4353-9b3a-e507c7ddd072@ti.com>
Date: Wed, 10 Dec 2025 15:03:59 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] media: dt-bindings: ti,ds90ub960: Add support for
 DS90UB954-Q1
To: Rob Herring <robh@kernel.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <hverkuil@xs4all.nl>,
	<sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
	<hansg@kernel.org>, <mehdi.djait@linux.intel.com>, <ribalda@chromium.org>,
	<git@apitzsch.eu>, <vladimir.zapolskiy@linaro.org>,
	<benjamin.mugnier@foss.st.com>, <dongcheng.yan@intel.com>, <u-kumar1@ti.com>,
	<jai.luthra@linux.dev>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251202102208.80713-1-y-abhilashchandra@ti.com>
 <20251202102208.80713-4-y-abhilashchandra@ti.com>
 <20251205151737.GB158904-robh@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20251205151737.GB158904-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|BN0PR10MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: a0e79891-745f-4874-fcbc-08de37cf44d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlBIZXZ5WWZ5RkhmMHVKL21UcmdkT0tGZXRzc0tpY1JnZGxwQlNNVFBXYjJL?=
 =?utf-8?B?SVI1ZGlTdXF5dlNFRnF1M3lFQzc4RWY2ZUsxZVJVVUxzMmxIZHNJbXQxUzgx?=
 =?utf-8?B?by9YT2ZaTU9BTEc1ZlpweURUSUZZek5qaFI3eUIwZHJpa3J3bmtKYVhMeUxu?=
 =?utf-8?B?NHR4R1BFNy9pVU1CVGNLS0laR2h1dk9ITmY3T1BhZEhySnhaaThCREt1MEJl?=
 =?utf-8?B?TEFsZFJIYmR3M3VhdkVaNlZHcW9RRUZMQlNCNzFSOWc0YWI1Vjgzd1hVbGlh?=
 =?utf-8?B?ZXZDTmpidk1DRS9YZ2xjdFhWeFE3S0t6YVB5ZTBTRUIwb3g0bm12dmdiNUph?=
 =?utf-8?B?TERsZHFuZndTWlNuNVladXA5Q2dBb2U2b1ZOUnJPTnJLYUJ1Sm5xZjJGbDdT?=
 =?utf-8?B?RTV3OFdYWlEwM0lVUGpKc3RXZ21MZ0NBSFVKVExZZnVMSlFRN0JybklCMFJJ?=
 =?utf-8?B?enRRMW9VTVY3QzVxbU1KZUxzU3dtaVNBWmZTTVdWa2F1MEx1L2F0Z0FtWWJG?=
 =?utf-8?B?QTNDL2RFK1dwSnlHL3ZyRHlnTTMvTFpqN3RsbkpFd3BwRGl5TGQweTNqYnox?=
 =?utf-8?B?dGtmRnBreTFMSmVVVEFwSWQwNzhITWxCYW9XMzY3cTdEM0ZGamltUUNrRkFi?=
 =?utf-8?B?dnpSc0ZpVUZ4VmVGN1prQXM2NHdteGwraTJidThJRmxBSkFxbWdyQ2lVSjdK?=
 =?utf-8?B?Q084dlhJdmFublQ4eHV4SlBZbFN2WENXb3dzcFdmVWZ3Q09yQTVMVDl4WWdV?=
 =?utf-8?B?VXEzaHdKRDlDRjI2S3FMbkNMYmVwUDVLRXFOb1lFV3UwTDNpSStqejRydG02?=
 =?utf-8?B?YU8vNTZMS0gvU2JieFgzcWhrWFo2MnBwbW5McWR4bk1XOHJ5OHhzQnlRQ1pV?=
 =?utf-8?B?eGd0YjlSelNlY0w4YWhhNWZabnR1UGJKVTg2Ri9KTmYyYXQ5K0czR29lK1BD?=
 =?utf-8?B?V1U3TGVhbmxQazgwTkx1dmVsM3B1RkhoYVA0bThTeUxlNnUycEZKTlFVc0R5?=
 =?utf-8?B?YkMxR2w1Z2JWZDQxN2N5Tlo4c0FxcEk0NEtFYVBjQWk1UXZ1VkVrMGFLTkNC?=
 =?utf-8?B?TExELzRxTllZdlIvNnJvN2U1NnJhakozUENISmRybFlPVjA2ZlFLTVBTeEQ5?=
 =?utf-8?B?YmRSS0NrVXViN3owK0hsSGl6QjZQZW1ReCtqWFgxWHh1UStxWlJzdGMyV0RD?=
 =?utf-8?B?NG5Jd1NWSFhtWXlaM3B2aGJxeEh6bmVhNjcxVW14bk53QWcxTEV1NHI3bHhx?=
 =?utf-8?B?OTlFZXlDeHNDRHZhY3dndGNlNjBrR0RVOVV5OG5taHlIR295Y2NRT0Voenhw?=
 =?utf-8?B?V1JWNThsVExwblQrWlFHbFowUFNWR09YRVpJcnlNeEt5WjhHRG5HVG1SSHAr?=
 =?utf-8?B?dHdhQStGV3R2K1NKYk9YcXlzRnBpazZ3OUtMUFBpbW9VTi9yNVdnekdtTCtE?=
 =?utf-8?B?UDNrZU1qYUttMGRJVllEbGxPRHkva3cvUGQwSUpaeGZrQzBITDRFNkwzOG8v?=
 =?utf-8?B?aXM0eHV5V2RHNUxYL2xoU1pFeXNhVkVZeDZHZ3JSOXQxMDJaSGRCem1tZEV3?=
 =?utf-8?B?bEY2YXZkVUJiZ1FCOEFZcHRIZ3JQOVRobXlXSm9KMmhBbkpWc2FFdkIyVm1z?=
 =?utf-8?B?SGZzTE5DZFZWMHFvdUFiVGxKMVhScytGbXFtcEgxdUh3NlFCWG1CUHlkTk9i?=
 =?utf-8?B?MEZOUzhENTdaRVhKSXFTT292Vk1HY3hnNHQrQStjRTV2c1lzRm8rajBKY3dE?=
 =?utf-8?B?d3JHaVExdjVXZHVCL2NjNzdkRlNyS1BTQVRMdTRsMkE4dWxyQm5RaVpFZjA1?=
 =?utf-8?B?SkpEUU9YSitSQVBZN21YUTFjeWtoZ29sZEFFNndzRE82ekxHZ1lYQ01mdTBT?=
 =?utf-8?B?SERYM3hyNXNDTHJMTUo4OVFudVhEb0NLenNBNU5IY2VSeUQ2bnRNVW1tYWIy?=
 =?utf-8?B?OWo1ak9CTjNrYWlKeHBkT1dCM2t4YVdoZHFmdWc3UnJoZWFZSWlhalorTkFO?=
 =?utf-8?B?TEtSYlAyNTN0VEZwNVphT1IyYW9jU0JtY1ZMVDlVMHNIY1lRcE4zMUovbWh4?=
 =?utf-8?B?dnVtaFpVTnNuK0RKekFSbXV0MkQvd0VvZlIyVEZCc3ljRTNvL2RHbnR0dGV3?=
 =?utf-8?Q?4sKM=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:34:08.4549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e79891-745f-4874-fcbc-08de37cf44d2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4869



On 05/12/25 20:47, Rob Herring wrote:
> On Tue, Dec 02, 2025 at 03:52:07PM +0530, Yemike Abhilash Chandra wrote:
>> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
>> compatible with DS90UB960-Q1. The main difference is that it supports
>> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
>> port. Therefore, add support for DS90UB954 within the existing bindings.
>>
>> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   .../bindings/media/i2c/ti,ds90ub960.yaml      | 300 +++++++++++++++---
>>   1 file changed, 264 insertions(+), 36 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> index 6a78288aebaa..1ef977c2e479 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> @@ -13,12 +13,10 @@ description:
>>     The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
>>     forwarding.
>>   
>> -allOf:
>> -  - $ref: /schemas/i2c/i2c-atr.yaml#
>> -
>>   properties:
>>     compatible:
>>       enum:
>> +      - ti,ds90ub954-q1
>>         - ti,ds90ub960-q1
>>         - ti,ds90ub9702-q1
>>   
>> @@ -129,39 +127,6 @@ properties:
>>         Ports represent FPD-Link inputs to the deserializer and CSI TX outputs from the deserializer.
>>         Their number is model-dependent.
>>   
>> -    properties:
>> -      port@0:
>> -        $ref: '#/$defs/FPDLink-input-port'
>> -        description: FPD-Link input 0
>> -
>> -      port@1:
>> -        $ref: '#/$defs/FPDLink-input-port'
>> -        description: FPD-Link input 1
>> -
>> -      port@2:
>> -        $ref: '#/$defs/FPDLink-input-port'
>> -        description: FPD-Link input 2
>> -
>> -      port@3:
>> -        $ref: '#/$defs/FPDLink-input-port'
>> -        description: FPD-Link input 3
>> -
>> -      port@4:
>> -        $ref: '#/$defs/CSI2-output-port'
>> -        description: CSI-2 Output 0
>> -
>> -      port@5:
>> -        $ref: '#/$defs/CSI2-output-port'
>> -        description: CSI-2 Output 1
>> -
>> -    required:
>> -      - port@0
>> -      - port@1
>> -      - port@2
>> -      - port@3
>> -      - port@4
>> -      - port@5
>> -
>>   required:
>>     - compatible
>>     - reg
>> @@ -204,9 +169,86 @@ $defs:
>>             - data-lanes
>>             - link-frequencies
>>   
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-atr.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - ti,ds90ub960-q1
>> +              - ti,ds90ub9702-q1
>> +    then:
>> +      properties:
>> +        ports:
>> +          properties:
>> +            port@0:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 0
>> +
>> +            port@1:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 1
>> +
>> +            port@2:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 2
>> +
>> +            port@3:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 3
>> +
>> +            port@4:
>> +              $ref: '#/$defs/CSI2-output-port'
>> +              description: CSI-2 Output 0
>> +
>> +            port@5:
>> +              $ref: '#/$defs/CSI2-output-port'
>> +              description: CSI-2 Output 1
>> +
>> +          required:
>> +            - port@0
>> +            - port@1
>> +            - port@2
>> +            - port@3
>> +            - port@4
>> +            - port@5
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,ds90ub954-q1
>> +    then:
>> +      properties:
>> +        ports:
>> +          properties:
>> +            port@0:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 0
>> +
>> +            port@1:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 1
>> +
>> +            port@2:
>> +              $ref: '#/$defs/CSI2-output-port'
>> +              description: CSI-2 Output 0
> 
> Wouldn't making this port@4 be more compatible?
> 

The current driver expects the TX port numbers to start immediately 
after the RX ports.
If I change this to port@4, I would also need to update the driver.

Can I keep the port numbering as it is?

>> +
>> +          required:
>> +            - port@0
>> +            - port@1
>> +            - port@2
>> +
>> +        links:
>> +          properties:
>> +            link@2: false
>> +            link@3: false
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> +  # Example with ds90ub960 Deserializer
>>     - |
>>       #include <dt-bindings/gpio/gpio.h>
>>   
>> @@ -406,4 +448,190 @@ examples:
>>           };
>>         };
>>       };
>> +
>> +  # Example with ds90ub954 Deserializer
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
> 
> I don't think we really need a whole other example for something
> that's a subset.
> 

Make sense. I will remove the example in v3.

Thanks and Regards,
Yemike Abhilash Chandra

> Rob
> 


