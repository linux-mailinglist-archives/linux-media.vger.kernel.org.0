Return-Path: <linux-media+bounces-50867-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5906AD30151
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 12:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0080630779A9
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 11:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8D534A3CD;
	Fri, 16 Jan 2026 11:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jV+TTjyz"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010041.outbound.protection.outlook.com [40.93.198.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A77347FCD;
	Fri, 16 Jan 2026 11:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561469; cv=fail; b=ej7uG9OaSkwxj/KrQKVlep87BaN0xy9UuXvd7w0dYfhpFDAKO4kRJW111wTFVMhAk987nFA6NIw1sSBpF3m8Z3kOJTazoOz7Og+61DBpAQEprmRlEFga1jT/YclT9Z1jQUkVMf5TFuWZvZpbRvxZlIJE3+rB7/xVDpKo0HKCHpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561469; c=relaxed/simple;
	bh=lkGPi7yya0W5t+rIgGFLxkkKkVdHF9zDMVpTFGezWUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GK8nwqVwNvtHc4rq4XghzZPwGfZuizGuOvfHFxLL3+vdubhkBW3PTuMTXgxbXWonHZMMzEfwNfx3NzfM4j0i6StIFP5Cubvz+GiUTtajrz29hu+IBQCsAXPrGkfij4zPmgtZu3Es4KPtRLsE+2QIpm6Ce3zZ7alSkR1iR86LRx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jV+TTjyz; arc=fail smtp.client-ip=40.93.198.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElF5nC78yrtAUMMJ06l/wu/Ziv6fCv/0nnBjgfP5GVLwSBEi2wI51C2ZZ9GNqaup0db38u5E8rIjN6tq1ZKLSs1ZgVxwj0adSzwIaF2Ihl/aXSTiA4e3TLc0llzNB7UcjGqg1P0qYF7WHnEOHSeHl8oSLsF47HI5uoOzxcU5UGz68fCj3ISuBZGOBKDRbk5KklYYEOYVjhvNDOfnfgArzyzuJAH9WPSmGWgg4sWTBhdtYg6b3p5FRgIfVZ4Yg6k4hY8wJOUwKUKy67mBSO5xvGY8b3eAghHAWgEPZf04065iWXR8IE32gjnmPe4Xl+mok6wVvU+HA/zMVr04IV9OGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztT6rM+UYy7htOKJXQVYrbfG/SKJAWx5GC0NDvLTmUU=;
 b=DvnGVy/jyphYFRRGcfGnLLBhqRsrgAT/OXCM1ZVqKiBHIRiGcqI5TuoDgvwWFaICLKUYk0GH4YPBzqTtFL7alvcJ557wCb8A7KNO4LTD2KaOp3qmlKgE2hzRI2+HunGOuItWO3n+tLhJh4PKcz7b3aKoPJRAutBbXgUUERnlWKrmNiVTba8D5isMDwWAXDUGJkciS7p/JaFLINN/h0enCMRQOhdaonwKou59aFVsIaWyVSmGZyEDtgNotCwkvhNeEeC/AyuMuS3BniVlgUrNiVW8cjNTZ4F9q3wufqDrzgfjvCiH8JaiRu8DOqN3PQGg38OngcMAw19fCGSWQuSsZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztT6rM+UYy7htOKJXQVYrbfG/SKJAWx5GC0NDvLTmUU=;
 b=jV+TTjyzR9Jn2FNb1kD9vi5p+StHOivaq61tmehHKDc8WUre7xXATHCDQkYdQIbVsacaKCLPARAYecKstTN7vZg3gDs808C5Vmg/usHUIuYJU3hWUzRVtS2+b7rBGO3qZufNDavipsfCsfijz8Q66k9v/ssTjHPyfiaVz9EoFd0=
Received: from PH8P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::27)
 by PH7PR10MB5855.namprd10.prod.outlook.com (2603:10b6:510:13f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 11:04:21 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::61) by PH8P221CA0002.outlook.office365.com
 (2603:10b6:510:2d8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 11:04:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 11:04:20 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 05:04:20 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 05:04:20 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 05:04:20 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GB4Cb43043184;
	Fri, 16 Jan 2026 05:04:13 -0600
Message-ID: <f6242795-d8d4-44a9-8ab8-cdaa3dc0eeff@ti.com>
Date: Fri, 16 Jan 2026 16:34:12 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/19] media: cadence: csi2rx: add multistream support
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
 <20251230083220.2405247-13-r-donadkar@ti.com>
 <1029b7b3-44cf-4ed5-b90a-a476d39da5a8@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <1029b7b3-44cf-4ed5-b90a-a476d39da5a8@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|PH7PR10MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 327326ba-65e5-4b83-ca4c-08de54ef0032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|34020700016|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWNJL25sYjM1d3dHLzVDblpYdWJEUU1ydjJXWGFEanNCNGVOY2JpcFV5WThZ?=
 =?utf-8?B?RWFpaEtVVlZudzBLcGN3bkZCWVFLL3I5ci9wLzJmNmh6NU9sekRRR1pkN3Q5?=
 =?utf-8?B?ejNaVmxKVGk4dWJDcGZyTU14V3pOM0JybkZsTjFNV2Jjd2xlcUNmRTE1NWw0?=
 =?utf-8?B?ZE45RlMvamtjM3UvTlQ5RVJkRFZaZnU5cXpTY3N6cjhPcVdXd05PcDAwM3BW?=
 =?utf-8?B?aG8zUElFT01Jb2NwbDkxRngzMnZpRjYvdXpEcmthbXh1YXpCMDBCU2taNDI3?=
 =?utf-8?B?VWcrTldyQmZWbTdxTXNUTHBwLzZlRUtGSzZyS0RZc01PQWRZZDZUSjRMbWhz?=
 =?utf-8?B?d3ZxbnpaUjhGTlh2TFVFeWQrdFRIWldNSzFhdzM0WFRrdURWbUI2YWxmdVNV?=
 =?utf-8?B?VFFyK04rREh0SzNTZlpqbGFYM0ZJZDRxL05xV2xKMjlVTTR3Mmt4QWJrdlVE?=
 =?utf-8?B?TnpYZVArZm1HZnk0c2Q4TEV3QldaT2Iwek01dGFUTzNnL3dVMlFZcEpiYStW?=
 =?utf-8?B?Yy9CQ0l2Mk9oTUFXTFFHeFQvZmF6K1NHNTMrNC81NUR6T1kxcFNTaHl0bFFZ?=
 =?utf-8?B?dXVKMDVqLzRQMlhGQlo2c254WHhhTTFSdHlieEJyYkpZOUVVWG1JTHR4UGdm?=
 =?utf-8?B?TEo3OTk0dW5tamxoem40V2pTTC9Jd1JJL2lUd3ZENWlmYjJyVlpVVVVoUzZp?=
 =?utf-8?B?SjY3QmQ3TEZYWWMyRE1RUzZYemZDbUF1OGU5ZDFwdFhCYmU5ZDF3ZCt0WTNJ?=
 =?utf-8?B?ejA1WUZZMmR0b3ZKU1U5NysvUnhpYTlHcVpnRmJ3OEUvM0VhQ01rWWlORThI?=
 =?utf-8?B?U21wbmpJVFdiTGhDMllFRHFwUUdvaFpVWVMwaHFiMXpHRDFGUWE1dWxjL2tr?=
 =?utf-8?B?cWlkTGozaXdkamZaUmtxL21yQnl5eEhNa0lwRERzRS84NjFaQ1ZHUHY5MFpJ?=
 =?utf-8?B?TWgrTCtQdlZCVit4QkoxeE5sRGNwa05xWGh4RHlEczBSUmZicERjU1NpNWVE?=
 =?utf-8?B?Uk5qZG9rQ1VIOEhwSGlqODVGWVlmVVZ4TWxaUENEQUEwZG52V3NtaWJVa1Iz?=
 =?utf-8?B?SWd6ZkdoZDJEaTViL0pVRUVsd1RUdmg0ZWVUc2wwUDI1aHVZclhoVmkyTUE1?=
 =?utf-8?B?TnRXSUplL3M3MFV6YmJNby9RYUp5ZkEyS3dybStYUXF6YWxmdENHRlphZ2x5?=
 =?utf-8?B?Yk1ZS3NlRFJlR2VwenROdmpVRHQ2L1dNZ3VLcEFrWUpaSm9yQ0ROYm9nb1VH?=
 =?utf-8?B?S1YraTF3VGIxdEFsRFBJYWU1LzFhQjNpN0hXYzZjTnBCaHFrcWw2R1J0UHM0?=
 =?utf-8?B?eUFsWWRQRWNUN2xMd3U3U044Z0ZpQjBsUkpoM3dzZ0QyYXV4ZEJTYlVWcmNK?=
 =?utf-8?B?Zm5tTVNlRTR4cHdZblJ2cVdTMUJDUUE3aGV0ZG41bG1BMFNRekVNYURkVURF?=
 =?utf-8?B?UzNwZzNNQndmc3h6bVVpZk9VbXVhdWhhR2NCcjFpdkpIT2wySStqWDBEelJa?=
 =?utf-8?B?dWFXdURKcEw2d2tUVkVYZEgwcGRXbUpaN0dyWTUzelZvZVN0NzBFUGlPZG9u?=
 =?utf-8?B?QnpGVDkzNXdTUEdPSGhXVVI0eGV3UXkvK0JyWm10K3hmMm5ZOEhWYmhXcW83?=
 =?utf-8?B?WFZyZGJ5VmNMZkxrRFpKa20yQzBUNkh5Z0syYkFrRSs1RUM0VXpEYlRLelJ5?=
 =?utf-8?B?aUhONGNiejZGT1NWK3prZDQ2TW1nWmt0OUdqOG51VXFZclVKblNoZW9CYTdk?=
 =?utf-8?B?Wkd3TzVvbi9KWmRaVkE5UTNpZHQ1NjJXb29jT1VvU1U1VEJWcFBiWDVXQnNN?=
 =?utf-8?B?T1NQY0hMVXVtSVU2b2pvVTJvNzdiei9EYWllRklWN2M2TkVjNVZ5QzI4eU9z?=
 =?utf-8?B?aXBEMFZmVUFjNXIvb3VXTXJVd0hvR3RNYnN4U3FlYjVKZDhDNzZTL1JQS0Zw?=
 =?utf-8?B?eFZzSEFWNDA3WXZQYmFqM2NKL1R4V1lhNHdxTDY4MjNtS2RIOUt0Rm9STVpa?=
 =?utf-8?B?YVUwM0txTFl0UkZ5Y25WTDUvcmRMOXZNdXZCV1orbVJ6SFdGQ1pOTWE0MlRD?=
 =?utf-8?B?dGlwaXNvS200U3pOWnpGR2NQUFlIU0pPRk85dDhYSE9TdEVmQTljSkNiNTda?=
 =?utf-8?B?ekJBV3lZTWtOWnBGcmhSQW1HVzA4NXEyaVNNblk0MktBRFBmQ0RrUFJRZmt6?=
 =?utf-8?B?SFFjN2puejB5L1hTSUhQK1k5aUJpWURFdnYvbzlWNG95NjVubGVpeC9ZVnpH?=
 =?utf-8?B?WlF1RDRLTVdkRjhBdzBSZzNxajBRPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(34020700016)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 11:04:20.9505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327326ba-65e5-4b83-ca4c-08de54ef0032
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5855


On 15/01/26 17:31, Tomi Valkeinen wrote:
> Hi,

Hi Tomi,

Thank you for the review !

>
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
>> of data over the same physical interface using MIPI Virtual Channels.
>>
>> While the hardware IP supports usecases where streams coming in the sink
>> pad can be broadcasted to multiple source pads, the driver will need
>> significant re-architecture to make that possible. The two users of this
>> IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
>> have only integrated the first source pad i.e stream0 of this IP. So for
>> now keep it simple and only allow 1-to-1 mapping of streams from sink to
>> source, without any broadcasting.
>>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 248 +++++++++++++++----
>>   1 file changed, 201 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 65c6acb02f85b..5c16a2e509136 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -135,6 +135,7 @@ struct csi2rx_priv {
>>   	struct phy			*dphy;
>>   
>>   	u8				num_pixels[CSI2RX_STREAMS_MAX];
>> +	u32				vc_select[CSI2RX_STREAMS_MAX];
>>   	u8				lanes[CSI2RX_LANES_MAX];
>>   	u8				num_lanes;
>>   	u8				max_lanes;
>> @@ -273,30 +274,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>>   
>>   static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>>   {
>> -	struct media_pad *src_pad =
>> -		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>>   	union phy_configure_opts opts = { };
>>   	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>> -	struct v4l2_subdev_state *state;
>>   	struct v4l2_mbus_framefmt *framefmt;
>> +	struct v4l2_subdev_state *state;
>>   	const struct csi2rx_fmt *fmt;
>> +	int source_pad = csi2rx->source_pad;
>> +	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
>>   	s64 link_freq;
>>   	int ret;
>> +	u32 bpp;
>>   
>>   	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
>>   
>> -	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
>> -	if (!framefmt) {
>> -		dev_err(csi2rx->dev, "Did not find active sink format\n");
>> -		return -EINVAL;
>> -	}
>> +	/*
>> +	 * For multi-stream transmitters there is no single pixel rate.
>> +	 *
>> +	 * In multistream usecase pass bpp as 0 so that v4l2_get_link_freq()
>> +	 * returns an error if it falls back to V4L2_CID_PIXEL_RATE.
>> +	 */
>> +	if (state->routing.num_routes > 1) {
>> +		bpp = 0;
>> +	} else {
>> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
>> +		if (!framefmt) {
>> +			dev_err(csi2rx->dev, "Did not find active sink format\n");
>> +			return -EINVAL;
>> +		}
>>   
>> -	fmt = csi2rx_get_fmt_by_code(framefmt->code);
>> +		fmt = csi2rx_get_fmt_by_code(framefmt->code);
>> +		bpp = fmt->bpp;
>> +	}
>>   
>> -	link_freq = v4l2_get_link_freq(src_pad,
>> -				       fmt->bpp, 2 * csi2rx->num_lanes);
>> -	if (link_freq < 0)
>> +	link_freq = v4l2_get_link_freq(pad, bpp, 2 * csi2rx->num_lanes);
>> +	if (link_freq < 0) {
>> +		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
>>   		return link_freq;
>> +	}
>>   
>>   	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
>>   							 csi2rx->num_lanes, cfg);
>> @@ -394,11 +408,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   					  csi2rx->num_pixels[i]),
>>   		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
>>   
>> -		/*
>> -		 * Enable one virtual channel. When multiple virtual channels
>> -		 * are supported this will have to be changed.
>> -		 */
>> -		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
>> +		writel(csi2rx->vc_select[i],
>>   		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
>>   
>>   		writel(CSI2RX_STREAM_CTRL_START,
>> @@ -486,18 +496,59 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
>>   	return 0;
>>   }
>>   
>> +static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
>> +				    struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_mbus_frame_desc fd = {0};
>> +	struct v4l2_subdev_route *route;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	/* Capture VC=0 by default */
>> +	for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
>> +		csi2rx->vc_select[i] = CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
> This should be inside the if-block below, as in the other code path you
> just memset the whole vc_select.

Will do

Rishikesh

>
> With that fixed:
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
>   Tomi
>

