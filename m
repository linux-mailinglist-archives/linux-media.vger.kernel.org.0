Return-Path: <linux-media+bounces-51102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB06AD3C350
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 10:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 25ADA683183
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 08:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C123BC4E5;
	Tue, 20 Jan 2026 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C+qkGECt"
X-Original-To: linux-media@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253203B8D65;
	Tue, 20 Jan 2026 08:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899197; cv=fail; b=oHLqRNxXeZXrc2ORV7UuyIQfTeAK8z+G/FL5cPzu3Syx7CLaCyXsN1N5PgQ6v2M3ZXJJnUZVS01f7HjNR2cJrf2xq3rW56M8PFMU/KbgtLvyYhuXTxjDY+0xQAQ0noNP4rx7Gky9vbsmfLIhTL0DCGFXAd3v+/PZLse+ynV3/3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899197; c=relaxed/simple;
	bh=DcL1suBQLnl9ASWpDMTCszFDu7w5SX9I2w8aul8U+9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=irxjkBVCpd3SmsqPAhLiB+Lh79kkBaIfOE8oJt37lu/7hYNTK3F4K9kzLFtG8oMQtQZRtiPRki2HrLhI22L4tq4y/9uW99entUczXp7vdwBnlKbp8XiOx6MRB3CMzLmFoIyLVqeZMAYHOju3prRiEzf7lDa0914jkhSH8+acqrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C+qkGECt; arc=fail smtp.client-ip=40.93.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDGnMcogw/rtNPhzcyp9uDsQlsmJcqauI0Lo8dbJgOH7I3HeCEXk8yfiAthCjxV8GHS8NYsOkIDpW03vJf5tokKCOEHE62nkgcNmuVoeNyY9lpQo18MzhawIOqUxHytPROwF6sxIl2lUomo+SMviV/bfeKui6YOZhZ9H1scL4w6aJTb//CV3rQOQq210poJf/njAfONQPkmbY2Gd2E2r/r7ekHYkn5EWWmEJz5mh/gw/h5Qmze8jxlAqIWkGLqNyBnSTiEOobpElwGA95qWXmgUc0xCKwIK/3nAfBhgghykdPe2nmo/hdukxOMd5cMWAR5LgPKk29eN6yOv4hz5DEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHL3pY7HfdCrcUkvhmeLWti8thK8et3psmSXLkgZlrM=;
 b=ia41JNyIrKM+IS78WL069hNmDef0rMGCAEzr7PLU/ejBvuoLDjA5qcydpgXyJuStFgm9kP9LvWIXGxITDQWpoQYeCUiPYFSfvunjHLE1/JpnkwEszckK/Ic1qrtBAD+CgFP2Hf7TsGLkO4XWwBerLO6czjlD9NCvWotUnlGDBM5Zp6TM0gvU4wGiTXITU/P4k5qGDxb2Z1y9OhQ6y2oL7BCKZmSyid1t6g3i/DOyPKJuGY+ZKvmd6L/lwd9GESpKZ/24DnXg5Dv5NvFs6oTfrFTsUjbar8ehkvgLPzeDfe8U7P80J5yoQoWF9ihSbXNyZ8k9Ltqp0wHZwa85kxhhSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHL3pY7HfdCrcUkvhmeLWti8thK8et3psmSXLkgZlrM=;
 b=C+qkGECtk3zXugGFpSNygyAnHITtfC9vImg+jNls+tFle2gm0KxIiwJpIyXQ780/JFvEgczO1jU2UqI1OkX/KRbweRMW0XV1bzuJ9/eX6jyHcFt8yQX6yaIBa0VI1FPBNUmwAu9/QBrVIPaoFJm6sPc63v+Axh/9HQX3zotU0cg=
Received: from SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::23)
 by DM4PR10MB6789.namprd10.prod.outlook.com (2603:10b6:8:10b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:53:12 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::46) by SJ0P220CA0016.outlook.office365.com
 (2603:10b6:a03:41b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 08:53:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 08:53:11 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 02:52:52 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 02:52:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 02:52:52 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60K8qjuS789499;
	Tue, 20 Jan 2026 02:52:46 -0600
Message-ID: <e9448b4a-c5ed-43af-9544-e664a4ebc764@ti.com>
Date: Tue, 20 Jan 2026 14:22:45 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/19] media: ti: j721e-csi2rx: add multistream support
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
 <20251230083220.2405247-14-r-donadkar@ti.com>
 <50c14069-1258-4f37-b2be-0eaca7880497@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <50c14069-1258-4f37-b2be-0eaca7880497@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DM4PR10MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: dd25e60f-98f5-47ce-f7ed-08de5801570f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWxFUDhOVFVEQk1Tdnk3RG5nWmkrVWNRV2x5NDhGY09HVGhLUDF0TzF4MzdQ?=
 =?utf-8?B?L0U2WDhGc2pKMWRkN2NjcjJPbkJMc3VsSzMyZUxLNWlNZnBnbGRudVVtS1hl?=
 =?utf-8?B?VDVsZ1hiR3FoQXd0K0lVKy9qYklPQm9GNDN4NS9DZVlBYWhYQjc4UmJjcWVM?=
 =?utf-8?B?R28vZWdCSmxINWdLRTkyb1V5N0xNS00zVkpHZUQ2UWVEOWdsOUw4S1VDUDd1?=
 =?utf-8?B?QlJZWUVHN0RyUXdyekRuRzQ0L1NnVjdsWFJrbkZ2cHhXa0FSek9lRXY1bnZp?=
 =?utf-8?B?bGpOT1luUUJrRGwwMS8vbW1BRHdEMnNDazM5MmkwOC95UGVUVFVKSFRNWnFy?=
 =?utf-8?B?ME5NV3hjU0ZIRGN1aEErSU1uMkI3bmlvblVOU3Y2dWxWRDArbldUblBhMHBO?=
 =?utf-8?B?YktpZC9FZy91QmdaZCtDUlVqV0FPcElqMGJXMWhBWXdYeGpibUREYk9vekFO?=
 =?utf-8?B?WUZEZ2cwNHp0WVA3TjRqNG9lbVZPNVUrUkw1T3RTSmpnYzlZZWx5RG5abHRW?=
 =?utf-8?B?YWxybTRrOUo2VUxPWDUySFNxNUlRcTY5OTBDelBNS2NVUnZwRVI0S2Nhc2Jn?=
 =?utf-8?B?U0FTQ2J2aWZETFZIQS81eHB1UUZNMDZuWVRxdmdNZkd6VzBaTzJCMmQvaXFq?=
 =?utf-8?B?b0kyR3R1bU90K3BJNS9WNTlPSmhwSU50N3hJaWp1UzRKbjhNenR3bzVCSkUw?=
 =?utf-8?B?Ung0UElYZEZhSmpTeGdvdWljVm9JMWtmcEs5bGNWVUx6a1pnZjZKMTd0RjY2?=
 =?utf-8?B?M3ZhVUEwRkN4d21XWjdhU1BqWDhESVNjZk0xQkFHVnUrSHV1OFFTTEV1a1ho?=
 =?utf-8?B?UFJqQlJrZk5iOVlOeERWd2RCWmw3azJFR1lPTGJ6STByMFNhY3hsanZaZzZo?=
 =?utf-8?B?cTJOelE4QTlUN1lIc01FcXFDbVI0aFdsNjhyRlc0bVdSaS82SnZvdERJR2Ri?=
 =?utf-8?B?eUlPTDhCUDZKaW82b2p3cVFBcjlBaXdIS0hxMUpYT0s4SjhTVXBrejluYW1O?=
 =?utf-8?B?MVc2VmhVenA4ZkhlTWk3MWk2R1VkclI3bFAzKzhkbFdkeXFwRm5oZllUbWVq?=
 =?utf-8?B?em5oSVduWFdxOGl2ejduWmhVREQ4VkpmY2FKK2pZODFNSmxFMU96R3RqUHRi?=
 =?utf-8?B?TWQ4SkE3TWRjUDE4UUlocVZ1RFpQUUJ4bmZ2algrcExObUFDMW9WbnhVV2tt?=
 =?utf-8?B?cS9UTE15cDdlZVNBVERiVG1kWHZMc05kNXFzS3JPV3had09TSHRIRVlMWTI2?=
 =?utf-8?B?aW9kWmFaMHRmQnFFYjlkYnFRUFZLR3o5SjFkWkJjTHVKd0lSOVBGbjZETnFQ?=
 =?utf-8?B?OXRwRXVHeUdabCs1ZjdWWCtKODB6YitPeTh2bWpEay9leFo2bnhhV2FGUFRp?=
 =?utf-8?B?UEZHSlByVEphMU1ncm9lL3lIREtkMFJDVU9OSXZOL2F1bmV5eTdCcDNPMzRU?=
 =?utf-8?B?VUQ2OGlRa1F4ZXAxdS9paDVPcEYzMWpHOFBudWtQcHZsSVUrREF5bHZXY3Mr?=
 =?utf-8?B?blBZMmFFWGJnb0EzcnpLU1JOK1hZUFdicFFyKytvSGhYVEJFdCtEZDYvcGlS?=
 =?utf-8?B?ZE0vSCtHZmZmMHZtd2tRSmpicGd3Mng4WmpBR3RSdHAvMSt4ekpOQ0ZIbmJC?=
 =?utf-8?B?cXNDR010Ly9VRlJiZlBWTThvc2RxdzdmbFc0OEIvU1RrZUV5VU9hZVhFZmds?=
 =?utf-8?B?VzdNUzF1ZnVoT2c5M3BrTlpOaXJUMHhJZ09uZEs3K0I3cWlhSUp0QVdLUnYx?=
 =?utf-8?B?NFMwZzR4a2tRdXF4ZjFTUFR4QmxXNTFVSjQrRnp3WFlMTU5XYUg5V1M2ZHNw?=
 =?utf-8?B?N3JnWEZZOHJjQ1J2NE85Z0pPQklMczQ4UWFpSDdRNWJHT2Jmb1hjZ1BET0Z6?=
 =?utf-8?B?bmFMd013d2M2TUt2cG12Z2YrMWdKNm1KbHBScVlPSEVscDJmd1oxcG83SUkv?=
 =?utf-8?B?OGZ6WW5BRExwam5VZWxDN3RjNE1xNlF3dmFNb0dSTFhPRGJPb01DL1VqbTBW?=
 =?utf-8?B?Q1dVNWFpQ1JlWG1ZdFQ2OHFPSm9yeENOdUpiN09zMG10VnlRSStzNnpFa1E4?=
 =?utf-8?B?dThzMVJCQ0RlNkpVZE1PZnhab2JwYkFab1FqZEs1elc3b1orQjBnTkJQUWtO?=
 =?utf-8?B?UW43T09IYUJmYkdFTWtSS2hydExYMGkzT0xnMlY4ZmdJdG44M2JxVWRUUzBa?=
 =?utf-8?B?TFA4MHdkaDc0YWdLRTZhK3paUms4aithYnorQ1B6ZVIza1kwWFBMVWFDODhF?=
 =?utf-8?B?VFRWbFdSeVhwTkxtYmZodC94dTZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:53:11.0722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd25e60f-98f5-47ce-f7ed-08de5801570f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6789


On 15/01/26 17:58, Tomi Valkeinen wrote:
> Hi,


Hi Tomi,

Thank you for the review !

>
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Each CSI2 stream can be multiplexed into 4 independent streams, each
>> identified by its virtual channel number and data type. The incoming
> Forgot to ask about this one. Why 4?


Yes, this should be 32, as discussed here 
https://lore.kernel.org/all/176528199956.20066.17866034505160159556@freya/

Will change


Rishikesh

>
>   Tomi
>

