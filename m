Return-Path: <linux-media+bounces-47926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDE4C965F9
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 10:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1635D4E100C
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 09:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFE83009DA;
	Mon,  1 Dec 2025 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kzUvEBfo"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0201A1FDA;
	Mon,  1 Dec 2025 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764581148; cv=fail; b=Qqftl04EaWGxAuEtw1JrPlst/ZQC3khUI6aYfJ6PbeHXJexHvQB8YzCBbntqe4/v4/qJMzbx252Loso68stB+gvIcTIWc9WZqCYYNxCP6qG58Yl3GLwLSZaDgvqI+PK4Xf70K/2/7RF6OOs/Y5x72C6/Y35iTvXaz/QOtYmczGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764581148; c=relaxed/simple;
	bh=5JgXSeBjAZ1+nn42bj2eA/SPzSuwcyDDDtE4heNA1gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cRDx+Dfn0vrjaPKn7YHjfNJAiwsJqysCXLLb/JCfaqmFAjklXEpcXlentdx+CtFQyRYV1iFk7JHI/y8Yqu819NoMdZYKA1RcL2e/I+qVup+U1WWl1iAhQF34uR3p6qQjcgz/Dt16I69gkPOPrQXUkoekSUzE6qxUnMidCfNp/Ok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kzUvEBfo; arc=fail smtp.client-ip=52.101.48.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKonH446u4lUZxSbVxUl356Ge4KHVEyMhmBLyRlxUGCGIELacGby8U5cESNC/RHwooO0IxHuMxMVOahe60owo3GtnqxKvpHLyXOCyORNGUDD1BjYD1Gd91LTGuk0Z2GJSLERqcyCNhdSGpxeYnxpbSS9oxCX+lRk41JKzbUY+VJ9QBWPXMFj/s49q6JC7ilry19yW4/OPIs263kXY6NxETMAkWeAa/TsDWRQ4IimY4Ei1ZZxPs8Ni+H8zEwaDx4ECyBeEqoEkrjf1p9f90flz6Co6/9qOkZcjo3wWFTUGg7WBGACDyWrCrXeM66qVmBagrp5czgOs3ldOHDi4tzvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6toAzVyTklXHsG4Pfo0aGViDNXu1+Pq+PwzllUXMxUk=;
 b=uxfucMLvdCNaJKN3/ClmHCZh9HkoKZKBNYvrrLg+pCjfZcTRxci0O1jbOzlMtTPJYdHo3rM7RcMBg6MIiRq9hz4xWhaqNhU45axfUcpWfjfTCqf/Zu7inEPJOVcC5H989Jtx42bfUXL6SmHlkQ3oewLqc2Jh6pLCJ4sbq6Rinw6YiAD0qY37FQ1b1u7oEVC6O5Q56dS8hjMtxh8O6YbsFWI628YpkyLsRFe0xoB/XJXEX8wt+mCbHta1aig5aW90VnabU1HihjElhFb+sQEef193o+q48k3QPHnvpbAG2L/AMkndh21j7oMtbBj1DvbWMdSuSZfLKStGyVS4mPKgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6toAzVyTklXHsG4Pfo0aGViDNXu1+Pq+PwzllUXMxUk=;
 b=kzUvEBfo4G+FhdIis7yxDb8CrYbFAMqCM30t8Qay362wtlqBrh07W2J1wLOiCmQm5t8DJdBoHz9/zV1+/LpBG7o/337g3twQ3FqwM4NaxFeo0LNc44uSbBAq/yZgEU/rKEVsa239llor11eEUDXdbm89LtXW02A/pGW0TYESZKk=
Received: from BYAPR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:c0::32)
 by PH7PR10MB6180.namprd10.prod.outlook.com (2603:10b6:510:1f0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:25:43 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::ac) by BYAPR05CA0019.outlook.office365.com
 (2603:10b6:a03:c0::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Mon, 1
 Dec 2025 09:25:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 09:25:42 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 03:25:36 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 03:25:36 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 03:25:36 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B19PUUX188167;
	Mon, 1 Dec 2025 03:25:30 -0600
Message-ID: <d640eb82-7e52-4997-8e2f-ae6a8be57f62@ti.com>
Date: Mon, 1 Dec 2025 14:55:29 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/18] media: ti: j721e-csi2rx: add support for
 processing virtual channels
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
 <20251112115459.2479225-12-r-donadkar@ti.com>
 <442f321e-be2e-4a42-ba3e-d8a58eaac11b@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <442f321e-be2e-4a42-ba3e-d8a58eaac11b@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|PH7PR10MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: c71bcf04-9e76-419e-0c17-08de30bb9966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ci9KQS9pblNUSWR6TTV4VDh6aSt6bVBBZ1JxRlI4VzdGTUFUV0FvVHFGUWtY?=
 =?utf-8?B?d3dZM1gyNnJ1dDlQYmRWTHF6cFhlenAvalZvVWE1UlRtOS9LWXZVOHk0eVVS?=
 =?utf-8?B?N1NycVJCd3RJNE5lc3JvMkZxUkRRMzlGQVVKY0xLQWNmL3Z6VjhaaDcyNnIr?=
 =?utf-8?B?OWZaRktjMDk4cUVKWE1KVjV4VTZBbGIyL0s0cVpzblhMVTlLbDladzN3aE9k?=
 =?utf-8?B?cWIzQktacGpjSllTb2xmOWtzOTdXOTA4d25mQ21sK1poZEROaEI3UkY0RXlk?=
 =?utf-8?B?aDFxQzVRMzFqTTdSaXBPYlg5bmo3TXM1N2hvN1l2QTJJN05nVmpJcGp5aFh3?=
 =?utf-8?B?RDBSNTN6WFJIdjYxenNwN0JFV1dvd3RpRVdPMnl4WmhrRGs0bVA3TU1NU0tG?=
 =?utf-8?B?WFdpLzNvNk83b3lWUTNXSUp4M2FxSEg5Y2hmUDFtbmU2OVBJQTRmcEl3Yk0y?=
 =?utf-8?B?aStlKytSZ0p3eWpDRGNkYXFKVU92MGdiZ2lwaHV5ZlgrMTQ3Z2h2emtpRHBU?=
 =?utf-8?B?aGUzZnBYZS96U1ZPclh3Wk1HZ3JLNXQxSHVIcHFLMjU4S1RIU0kveHhnamUx?=
 =?utf-8?B?L0tGampRUzFidWlwdlVKK2dqQ2l0SzVCb2c3UGkxa1VQTXFsZVQxQWdzRUNB?=
 =?utf-8?B?UTd6Um9lTy9UMUxIOEdRUndCeUlxTURzanVqYzN1VWF0dHVtV0dibm9tRlZH?=
 =?utf-8?B?SUh2eXc1SklYQ0hURzNlYjNmeEFsclpoNHBxZlh6RWdPRkhPbC8zMnRaK1Ny?=
 =?utf-8?B?R1JyNDNTVTlhbHN1N2tKMGsxVjMvNlRaMlpYZko2NVVpMnZNQ1pUZXJLbzR1?=
 =?utf-8?B?TURSK2pPMUY0ZS9Ya0xDSTRzS1cvTStXOUVvempUMzlWblNSaXdYNTB4TExX?=
 =?utf-8?B?djZ6UytIb3FYYWJaeGFNNW9aS3RBNUdQVHhGb0hwaE9xaFNjaEpFdWZnUFN5?=
 =?utf-8?B?V2p1bzNaUXI4enNYWVVGNWZzKzU0SHd3SHl1Ui91bkRybjF1c1dmUExoQkNI?=
 =?utf-8?B?YzdpdDNXTlkwOEp3SC9nOUtka3NRQ1R6Ym5KNERYK1J5bUxveFRyRHBMSUQ4?=
 =?utf-8?B?N1JxMTFHaXpGT3IzTTQ1NXZVQzZjelJ6ekdRczRLclVkcGltU09Pajk3MTVS?=
 =?utf-8?B?L3Z2USt6eUltN08rNnZkTXhVbG5ObisvY3g0QlpkY0RESFNFWWQ2TkMyTUtS?=
 =?utf-8?B?OHk5TmEvaHFZM0NZdkU2NzZBdndtd3FSZTFPZjFXQy95ZGdoSGEyY0NtK2VP?=
 =?utf-8?B?ck9UekN6QkpKdW8zYVNyVjc5eGRLN0RvWnErZE0xZGcwb2NKcG9zakdXRjdV?=
 =?utf-8?B?NzVPcXBJV2JHc3Q2L0JlMTF1cTBMZEhTTjNZS1ZIZDJTRVhzWEN6UG1PYm91?=
 =?utf-8?B?RS8yNkJJZ1oyYW1nbHB4VHUvZ3hOanQzVU9QaEIxWXAvTElTMytydHVUTWlq?=
 =?utf-8?B?NmlZZ0VKM29sbU1YV0xMRmVWSHFaQnlSL1FmV0NLMlRFVnI1TkRvL3V4TVlM?=
 =?utf-8?B?NHVSRHdmQUszZytVMjYxMzYxdUx2TGorOWVMbkYzSnBuMGU1akd5ck95QndO?=
 =?utf-8?B?RTNjZXZ0Z3NtNEkxYVFwM3pscmpmcXY2SWZzeEVWa3MwNXlKbTZQdXY4YnN0?=
 =?utf-8?B?ME1Oa3VrVG16aWhqbkJkVm11dHVtMndaWGowcFF6RWFIWDJmY1V4VGxGUzg5?=
 =?utf-8?B?U0lPR3dML2hoRGVRQWFVdVBGb3VLclZGdXVIajFOZW9Td05JQmNqdWxIandN?=
 =?utf-8?B?RUhBSjZQdE1vOTdVNWN3T296ZlU0YTBJUVprUkowTzBRWmw3UVpQcExhbmhW?=
 =?utf-8?B?b2M1NmFhN2ZtclJVTkZLaFczblRlK2ZpZFBRaytsWExRc0djUlMydVJWTXFL?=
 =?utf-8?B?aWIyVnpNZ2ppRnBOOHJ5cUdQSkh5NlMxVFlzeHRkNkJrMGI4WnJMYnZZS0I3?=
 =?utf-8?B?dDFYMmI0czVZcm12Y2w3ZlcyK2NkQThIaHREcEdXWWtYQVd1S3BnUEo2N0dm?=
 =?utf-8?B?R1A3TTMySldDTG9LM2RBdUVBamdtTTkxRHBDN1krYmZpZ0xlOUZFaXNsRXdR?=
 =?utf-8?B?TzMvNFpUV1NidHVFazdQUnVZOGNwUFh4Q0tlWTJwVjFYZnh2UjdObW5jTHdN?=
 =?utf-8?Q?9ztM=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 09:25:42.3120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c71bcf04-9e76-419e-0c17-08de30bb9966
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6180


On 20/11/25 18:02, Tomi Valkeinen wrote:
> Hi,


Hi Tomi,

>
> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Use get_frame_desc() to get the frame desc from the connected source,
>> and use the provided virtual channel instead of hardcoded one.
> So this baffled me a bit: the code seems to get the VC from the frame
> desc, but not the DT. But it looks like the DT values are hardcoded in
> the driver's formats table, and those are used for DT filtering.


Previous to this, we were using default VC 0(hard coded), In this patch 
we change it to use the one returned by the get_frame_desc(). I will 
edit the commit message to mention this properly.

Yes, to filter on the basis of DT we use the DT form the the driver's 
format table.

>
> We need to do something like that for legacy cases where the source does
> not support get_frame_desc, but if there is a frame desc, we should use
> the DT and VC from the frame desc.


Sure, I will change this in the next revision.

>
>> get_frame_desc() returns the same information when called on each stream
>> start, so instead get the VCs for all the routed stream at first
>> stream start and cache this information in the driver.
> I get the point but... There isn't anything like this in the patch?


Thanks for pointing out, I moved the code to do this in the patch 13/18 
between v7->v8. I will remove this form the commit message.

>
>> get_frame_desc() works per stream, but as we don't support multiple
> "get_frame_desc() works per stream", what does it mean? It returns all
> the streams for a pad.


This means that get_frame_desc() works for single stream use case as 
well, I will change the commit message.

>
>> streams yet, we will just always use stream 0. If the source doesn't
>> support get_frame_desc(), fall back to the previous method of always
>> capturing virtual channel 0.
> Right, if there's no frame desc (and we need to support legacy drivers),
> the driver should default to VC=0, DT from the formats table. But as
> mentioned above, VC and DT should normally come from the frame desc. It


I will change this in the next revision.


Rishikesh

> would be good to have a separate "legacy" function/branch/something, so
> that we clearly distinguish the legacy and frame-desc cases.
>
>   Tomi
>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 38 +++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 5c4524bf42e6e..126a62fa2c4c4 100644
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
>> @@ -110,6 +111,8 @@ struct ti_csi2rx_ctx {
>>   	struct media_pad		pad;
>>   	u32				sequence;
>>   	u32				idx;
>> +	u32				vc;
>> +	u32				stream;
>>   };
>>   
>>   struct ti_csi2rx_dev {
>> @@ -610,6 +613,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	}
>>   
>>   	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
>> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>>   
>>   	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>>   
>> @@ -884,6 +888,32 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	}
>>   }
>>   
>> +static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
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
>> +		if (ctx->stream == fd.entry[i].stream)
>> +			return fd.entry[i].bus.csi2.vc;
>> +	}
>> +
>> +	return -ENODEV;
>> +}
>> +
>>   static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   {
>>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>> @@ -904,6 +934,14 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (ret)
>>   		goto err;
>>   
>> +	ret = ti_csi2rx_get_vc(ctx);
>> +	if (ret == -ENOIOCTLCMD)
>> +		ctx->vc = 0;
>> +	else if (ret < 0)
>> +		goto err;
>> +	else
>> +		ctx->vc = ret;
>> +
>>   	ti_csi2rx_setup_shim(ctx);
>>   
>>   	ctx->sequence = 0;

