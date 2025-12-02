Return-Path: <linux-media+bounces-48059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CBEC9AC7A
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 10:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E7C5345679
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 09:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07F73081DF;
	Tue,  2 Dec 2025 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RZbmUcv7"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013021.outbound.protection.outlook.com [40.93.196.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D60324886E;
	Tue,  2 Dec 2025 09:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764666244; cv=fail; b=cN0ruzbBuBfv6yhgHUK7+BRcuYEeG/Q3nb8oWrvP0DZLJhsZ+jvQDtTokexIe6r66EKGTFTwMelshZRp5y5PMq692M7JQhyWV2vkqZHH8+qA57n8PAdytFTstsLozsy4DUenX0N4FkrsW4I0ke0hmetBX8yQj9FzdSHcWHAytlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764666244; c=relaxed/simple;
	bh=EhTVTYxisid8c/m8sV1bC1Lsh3Tg/5cWigB7djeBEG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bXUh+Ku/DljQvr058fIsTiSN5F93lDxtS23gC9yFGS8dLQO2gDV4D5oX2pvRvokNTS3OB9nvWn4Ac+XZjp/HanapacaWSLDS2FC+cATjNTxDsYAWaQLeA7oVmCqmLfINzH3xwZJxDR21l2R/l43NJOgfzzR+CDE3xrY2iep7aoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RZbmUcv7; arc=fail smtp.client-ip=40.93.196.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIgTP7crFOii7RMvlRB/HcqX1Xz/UdYEZo5FFdhrxUINRCllp/OGUf5m/SiBFSplf1zjt3Dj19DN8xuy6pdFwb+Pwg7yYJdLbNTojiVFy4AnwtfRdiwTwT9F7+i831YUbGGd4QKU6BOohhAtkhyx7j7UwJznNEReqAOj/sfB6PZ6crY1NxUpTwFSZuWCDpaocqS5hMy6QWBVmR7GAbtRYWhKJO3/V6Y0rr3SV+j62woOzcoooaromVS3glkYM5wuLr+4fAkSssMtylxLy90CdZQpFthIjAn+Dx6HJ7ro66K/ZNvmUYBFmZHepdEMU1ZXUcFqI4VSEHG5Fn/ZRy6bog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uw81YclL+r+ooTLj9ydtg0p0Ny6BgaFC5DUIvU9Lpo8=;
 b=vUSyH7oZXvzYgRMiLvt2Cj0Yo/3nO9i2lVYE9RgesUeerVZvDbka8/blDlhbB7Q8X4IR9bCCucpkWwtSTyTzvFxopiEbUm3JlVFYQ2sa+gGkapFK9+hcMtAKbERq0DlV2KpNUCPeBliBjEoz80MiPmtUyCxeCDy+hrIfpJ3RzGxoMEUsMXBruHNegv4jYHJot36YerUYKfOgX+zm6gnwPlkJE5HlTj7/WlxwEzOXZzF0PEz89awLC9oQiSvMrBblanfqfkvAninRx7i9D2IyMe9SOaoJed3k0cu71a0a1fyv0OLEG7McNzgVkcY46Auy4Eqdu4W3hGEvK1oMZb6kAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uw81YclL+r+ooTLj9ydtg0p0Ny6BgaFC5DUIvU9Lpo8=;
 b=RZbmUcv7dtVQtQeVnmYSLXL56udVM+oJbGPgxmRITdp1+ixscbf5l//5Gfm5eibGzUyo2zJfD0P3QIhi3mhUMmleHaDdhiF0vJsDtUNaCmKlYAzocFVZgJHzts5Tfx5AorIirLqx4ew4RtIBRctCJIyIGz08D+zz95fVPdN2nqk=
Received: from BLAPR03CA0113.namprd03.prod.outlook.com (2603:10b6:208:32a::28)
 by DS0PR10MB7092.namprd10.prod.outlook.com (2603:10b6:8:148::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:03:57 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::93) by BLAPR03CA0113.outlook.office365.com
 (2603:10b6:208:32a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 09:03:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:03:56 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 03:03:53 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Dec
 2025 03:03:53 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Dec 2025 03:03:53 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B293lwn1963805;
	Tue, 2 Dec 2025 03:03:47 -0600
Message-ID: <16e0daf1-1508-462e-8d3c-f5447a803961@ti.com>
Date: Tue, 2 Dec 2025 14:33:46 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/18] media: cadence: csi2rx: add get_frame_desc
 wrapper
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
 <20251112115459.2479225-11-r-donadkar@ti.com>
 <ecae251f-3f2e-4f80-8423-09d0e8679416@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <ecae251f-3f2e-4f80-8423-09d0e8679416@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|DS0PR10MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af68dbd-b0ce-4d67-6cf7-08de3181b9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnZ3Vno2VDBJei9EVVVXT3N3UVVKNlg5QTR3K2NtTnFqYkNrYkdsUzBEcWNS?=
 =?utf-8?B?NE9WMVhicGJ4NWhmY040alZEdlIwTEF6UEM2QmdCUndBeWlNdVdiTXZLdmxG?=
 =?utf-8?B?cks5MllrUEJJT2pCZlkrZEtuR0JRZlFOSGN1T3duREtMWEI4T2gyY1JMRFRN?=
 =?utf-8?B?bGxLYWo4M0xIVnFEakJoNlh3L1BwTlc0TE84V2VqQ3FRYVhpS2VQK2s5VmM3?=
 =?utf-8?B?UzdIQkNoM3hnNE95bUtIdjhmRWFIRUtKUWhWd2RISmF3UlRPR0tCdlo2MzQy?=
 =?utf-8?B?cldhQy9vWVlhVkxFcVJUUWpQVXNGcGxJRGxlaXVsTHVHcTV4T29Rdmx2TmF4?=
 =?utf-8?B?N25rd3BwUkVSTWpwdmFmTjlKZlE4UmVWUk1GcGRHaG53WVhnUktsNWk4UlJq?=
 =?utf-8?B?byt0MDNpVnlvSndoeDR6YjJKWXN0dmxTRzRjVE56d2VtY21ESkZTMldPUTUy?=
 =?utf-8?B?RkN4cjNPdnhITkxKeDMxQTZyQkZxTUpTdEJ6VHdSb3E2cmxkNFk5TGxBd1Jy?=
 =?utf-8?B?N1Rkb2taTDFFSk93S0xQUlJqSE54bWs2QWRpSGJLMDJoZkVQcDR0UU5KRTIr?=
 =?utf-8?B?RkR2eFZvZW1XN0xackhJamkvaU1OdzczZVhUMStYS0tRSS9ZS0VlNE9EWTJn?=
 =?utf-8?B?Sk5TSFUyVjZhcTVYK1dmbVVZbTdIeGxMNWRoN2poWXh3UFh4NC96ekVUcHh6?=
 =?utf-8?B?TGwxMktGcnVKL21qQjM3TTE3TStIZFl0NkI3QXFrU0V1NHJRc3d2NkNyaHlM?=
 =?utf-8?B?MWljcU1aVTkzVmEvWVd5WG02WjdVTjNqTmVrSU94QWY5M0t3bXZ0Rnh6R2Uw?=
 =?utf-8?B?RHR3VFBTN25wR0Y3ZkgxTmw2azNxd25YeHJZN21WWG52NFAxRGh5Ry96MzBm?=
 =?utf-8?B?MEVVaDRpOVJ2YWd2TGR0clg0VEdydkgrcUV3WE5UQk9pVWl6dThOVk1DNW9Y?=
 =?utf-8?B?OG5WVVN5bVpaWmNZVVNnb2dqNnpTNlFMbTVkZGNIWjJqVmlmT2ZHajRnUkta?=
 =?utf-8?B?aDNoa05HYW9nVFRWaHdjUzY4OWdOOTZGOE1acUxiREl5SHFZdzRXelV4Tkw5?=
 =?utf-8?B?Z2FjOXNxKzZxL24xOVRBUGJZZUNabUplMXdsT0szUWRsSndzWHJ2R2ZXazZU?=
 =?utf-8?B?ZHNkMTlMa201NHZ0Q2tueXFrSlRsaTNhbVZXS1NrRkJubkJHUm8rYXFiQ1NT?=
 =?utf-8?B?cXEwMHMrSEx4MXFEY1FoS2FjK0I1OTQwSzl2VzlwTTA1NXhrR2lYN0hvVUtD?=
 =?utf-8?B?cjc4QmlsQzJaWWFYTXdsQ2JGQzhPSFU0UXRCYzJGRndsVlpNMVFuVDVHVVAx?=
 =?utf-8?B?dUpmdm1KL3p6Q0IwRVI0bkNDQlZ4eUF2TnQyNGVib0t1Y0VRczYreWJicndX?=
 =?utf-8?B?SEJSQi9vUVdDd2w1YkxFS0gwNTIvTkpBbnh1cUNqcms2MzEzVUphakNuaHhX?=
 =?utf-8?B?VXROdDBkclY3bWQrUWlQbzROV1BPMUlmWVFkK2R3TjJKcjlTMEN1ekR1MVhG?=
 =?utf-8?B?c09VRmhkU1BOSVhIcElOdENsSmdndjdGeUhuY0xFWDExcU5iSXFZcHpnTG9m?=
 =?utf-8?B?WUt0M3VCOUhuQU9MancwOVg4T2pyVTZPUnV6WG4xaVFKS2V2S1ppUmZOYnhE?=
 =?utf-8?B?SjZIQzRMdjZZdWRzUyt4OWNMWnpHQUEzK3FSNkNHS1NoM0tPRlI0VEZUekla?=
 =?utf-8?B?RnljQnVnVzQ0VytTQXpTSy83VkN3WHlOWXYweVg3cHJoNSt3bkdjckhDL1BD?=
 =?utf-8?B?VDNCdU9RaGNpY0NXTWZvaGwrNGd4THdSR1NOWWYvcjRzWkY5akdldFBvRHVq?=
 =?utf-8?B?TjJkYmxBK2FQRnJvc1lscTJDMTVQdGtHK3J0S0lacnlTaktBNmJ4aEJMWkcx?=
 =?utf-8?B?cjlTMUxxK3gvNWJFdFkybERXTFlIZWhFVGo4SXRqaDI5WmNrWGhBTWxkTlRY?=
 =?utf-8?B?emRMcDNwaWRmUWRuaFQySU1XRGZMK2xEblNDNTlLOERNU0R4disvZmdqMWlH?=
 =?utf-8?B?YjJKSDFwb040VUhjdDZadFEvOElvUmRycFJyWTNlcm4rMlNVVklHaEl5RWpB?=
 =?utf-8?B?TXhCUTNna3ovNU1Vbnp3QysxdDhkaGRuS001b1lmSjFDdnNSNGY4SWpsK3VT?=
 =?utf-8?Q?UdsU=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:03:56.9472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af68dbd-b0ce-4d67-6cf7-08de3181b9c8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7092


On 20/11/25 18:10, Tomi Valkeinen wrote:
>
> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
>> From: Pratyush Yadav <p.yadav@ti.com>
>>
>> J721E wrapper CSI2RX driver needs to get the frame descriptor from the
>> source to find out info about virtual channel. This driver itself does
>> not touch the routing or virtual channels in any way. So simply pass the
>> descriptor through from the source.


Hi Tomi,

> Unfortunately I think that doesn't work.
>
> E.g. we have a fpdllink deser and the cdns csi2rx.
>
> Deser's routing table (pad/stream):
>
> 0/0 -> 4/15
> 0/1 -> 4/33
>
> So we have two streams coming into the deser's pad 0, with stream IDs 0
> and 1. They are routed by the user to output pad 4, with stream IDs 15
> and 33.
>
> cdns csi2rx routing table:
>
> 0/15 -> 1/0
> 0/33 -> 1/1
>
> So cdns csi2rx routes the streams through, as stream IDs 0 and 1 on the
> output side.
>
> With this patch, if the j2 csi2rx asks frame desc from cdns csi2rx, it
> gets a frame desc with two streams, stream IDs 15 and 33.


Thank you for pointing out, I will change the body of get_frame_desc() 
in this subdev driver set the stream field of the fd to the sink_stream 
of the corresponding route.


Rishikesh

>
> I made this series for the issue above, but it hasn't been merged:
>
> https://lore.kernel.org/all/20250324-frame-desc-passthrough-v4-0-dbe2412297cc%40ideasonboard.com/
>
>   Tomi
>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 34da81893308b..3688077fa8347 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -229,6 +229,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
>>   	return NULL;
>>   }
>>   
>> +static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
>> +					     struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct media_pad *remote_pad;
>> +
>> +	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
>> +	if (!remote_pad) {
>> +		dev_err(csi2rx->dev, "No remote pad found for sink\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
>> +				remote_pad->index, fd);
>> +}
>> +
>>   static inline
>>   struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
>>   {
>> @@ -611,12 +626,21 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>>   }
>>   EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
>>   
>> +static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
>> +				 struct v4l2_mbus_frame_desc *fd)
>> +{
>> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +
>> +	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
>> +}
>> +
>>   static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>>   	.enum_mbus_code	= csi2rx_enum_mbus_code,
>>   	.get_fmt	= v4l2_subdev_get_fmt,
>>   	.set_fmt	= csi2rx_set_fmt,
>>   	.enable_streams         = csi2rx_enable_streams,
>>   	.disable_streams        = csi2rx_disable_streams,
>> +	.get_frame_desc	= csi2rx_get_frame_desc,
>>   };
>>   
>>   static const struct v4l2_subdev_core_ops csi2rx_core_ops = {

