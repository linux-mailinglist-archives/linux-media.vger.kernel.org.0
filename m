Return-Path: <linux-media+bounces-51005-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA37D39DBA
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 06:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CAD103000EB3
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 05:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E4B33066E;
	Mon, 19 Jan 2026 05:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dHb5vPnJ"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38927242D98;
	Mon, 19 Jan 2026 05:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768800324; cv=fail; b=EZMOHYmNLm3bh0HC99Luff91Ybh79KSr9OHy6WCDZAxUY4atT7PDiXAYM4YjuOnvjlk+y3zQxk9rre/mZiCaBHN6TVasKMxyvQn/r+OG9QlLEcCTP71DqLQ2fiBebySUAzdy1FWfQggRp6Td1/xiA5MNtCKFYYbRDV1jQRcPiek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768800324; c=relaxed/simple;
	bh=ytmd/qepLr0xKfAd6Z2y/o4Lh8cBBSZvshVFpeXAZq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MaTVxtQiB1L+R6X9Tzf/AvZnGGUv79xLCMy6TgXLko2qQbiyG66EaL3Hgg9XmDDMD42sNh2WbLcW/fw5QXhCcDul05hqTulRQAok4zaIdk7kwag43aTZmdTC4CjiV8jeT1qZqnBas8+vLgu+efaNegD3ZkeJyawPaYPs5a6OJAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dHb5vPnJ; arc=fail smtp.client-ip=52.101.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISLi+7sPk/ZtoNSKqoHtNMO823tAkigJ9tKKKDxwPYHp/qLU4aEfJFE8teDner3v3o8zMSAnfDNr/FopWGSqCgPzVrQ+4kWJkO4//8BtH2zqBEzOzGB2Cg6nE+OLXaicgG6Cddy3e5zsMuj2ZK+YrwvWrW227ljM5FNqWnEuNKcg66kqYvb4KkGfbfTuondpmhuaBYAY6yaMprs3Z4AKoE3WpsfbMQLKHI56naWPpe/hKInMta7dTxZuYPtVCaS+mrjglF1nTKHewMGZltR7Nbn5Hbie8/bcvJ2gkiEUNHwsww/SaLvjqRKz3iy5gwo9jAPHDKjH1yyyuDoY93IJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DyNbcImFM2xScPBW4g+UQCWDvlxjjhnpebPyhsap2I=;
 b=QbIjviWs36GPlvCvoqCJqnt21Cr5KPvksrUbMJYIpzXf4adhg0ExdQE4nNtfn4PyF+ZRvq15ysRKZJSa4vZwZe/Egwwz4LRO5TCAOwwC+aeOn8UCrARcRgYnPA32TdROH9+oEBJn9ZjJPwEYhxgzcoy63OQhj9+G6d0bq1hDp41bJXAb4A/SkDTgmljbdJQlWbWfVuiwtOyx4895taTBXsIwRJgkqJ/0P54Lje481EYAea6lkcsaKXYT6H/MSQeOoFH1RydMxGaAQ++nwJ2ZwVsx28Sqv5SvJ5PFz6VBOr5t4zdWqfa60wssLLb1sTpJYz/JAolPkn12PDMdfu/tvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DyNbcImFM2xScPBW4g+UQCWDvlxjjhnpebPyhsap2I=;
 b=dHb5vPnJv7m/40yoe7FcMu7gFw7TI6LQKHqKSS2E0S5iIroM4uXpRpA5mXQJKPqD81U77HOVeL8Dpf1yf8XEjI1e9p5375mi4UDVTBpI82hGEhplam4V5O2BV/KfF31kOQyE6WCZqzjhJT+d9HtN0RNEPi5hYq8K3OoCi3nsBNA=
Received: from MN0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:208:52c::9)
 by CY8PR10MB6707.namprd10.prod.outlook.com (2603:10b6:930:93::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 05:25:19 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::ef) by MN0PR05CA0007.outlook.office365.com
 (2603:10b6:208:52c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Mon,
 19 Jan 2026 05:25:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 05:25:17 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 18 Jan
 2026 23:25:16 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 18 Jan
 2026 23:25:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 18 Jan 2026 23:25:16 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60J5P7ag2983199;
	Sun, 18 Jan 2026 23:25:08 -0600
Message-ID: <068552f1-e89b-49c2-b959-6d53bde0eac4@ti.com>
Date: Mon, 19 Jan 2026 10:55:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 19/19] media: ti: j721e-csi2rx: Support system suspend
 using pm_notifier
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
 <20251230083220.2405247-20-r-donadkar@ti.com>
 <9bf5fd69-4ff6-40c5-aa22-e6330bf8e323@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <9bf5fd69-4ff6-40c5-aa22-e6330bf8e323@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|CY8PR10MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: 9675caf2-d4da-4e7d-07d6-08de571b21c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3JFYkVBblNCMnhTcVNidTZLaGFqSTlGbWdUN05odk1xK2FWL1QyQUZWckpG?=
 =?utf-8?B?T20rano4OEM2ZHNUb3pyL1R0bTVEWTdTUmhkbTgrS2F3T3hhODJJeXZsRkhk?=
 =?utf-8?B?a3NPekJQaVBrZllDTG5mVm8rNXUyS3E2c2l0MHRKa1R0MXJwdEZyeUJXS2VD?=
 =?utf-8?B?cGcyYURuVDhsRm93S21rR0JKV2xtQmNKNUJIcklxeERvNG5Vb1RRSzJGakxO?=
 =?utf-8?B?aGdJUEJuNTdoSTJMdS9jZ08xejhCYVVYLy9yS01JQThObnczUXM1N09PTDY3?=
 =?utf-8?B?WDBmMWxRc2dWU2ErdHFvdW14OUJROS9uSnFVOTV0VlZ3UHJxbHN1Y3A4NGxK?=
 =?utf-8?B?V2FoWFVkMVFHVVcwTFNlZlE0d2V6TkNTRXEwdThQcTExL2dyRG9XRUE5Um9y?=
 =?utf-8?B?ejJZY2ltVFM3VVVaa24zVG5qd2JMd2RtZnpONFNIWmF1bjh1OWpYM2ZkMGhH?=
 =?utf-8?B?bzZWZC9ISXpmdU4vZzZ5d3FyWXcxUk8vdkpPV2kwYkFTYjhIc215WG5uajQv?=
 =?utf-8?B?c1RkYlpBRUJKclMyWVU1VDNya2IvanhEYWZXZUt5aWRvbW1RQ0JTdFNUWHpL?=
 =?utf-8?B?cmt6cnk1akZzVEFlenJsRHltZFRzQjBYRDdKVFZQOTVDK2ZrN09RUDh4OUc4?=
 =?utf-8?B?bGdtMGZ4VkNMWUJjTUJ3dFhkZXN3Wjg1dElFcFNaeG9WUzBmVW1QZnZqZzZm?=
 =?utf-8?B?bjVDdXl1UkYyWVQvaU0raXBSSmFsRFRHd0tLbnZkc3ZHK1pIbWNBUFY0Z0tF?=
 =?utf-8?B?c1BDM3JJaFVXMmVkc3FqT25vdHgxb3VrVXdWM0NPYWN4RXdSTWkyS1h3alJ1?=
 =?utf-8?B?U1hDZlVlL3ZadFYyYWUzSmtqUXNqUnVJRk5pdThJMkcxQWdVR21Dd1lBMmhI?=
 =?utf-8?B?ZHY5NmFjNCtsL0E5cmNOdVNEOTlqdE5uQzExY3hEUG96RUQ0Y0V1SEt2MnZq?=
 =?utf-8?B?bHpQbFo2WERZR1pxYW1DRjRxdkk3N1c3QjMyOUhqa0FTZkEwQjRMYjBaOVJS?=
 =?utf-8?B?QitkeWtGU2R2ZUlNbDFBUUlKTzE0djJjeGJEVWpvS1VnQmQvM0x6VUkrSDFY?=
 =?utf-8?B?aHE5TER4WWVwYm42aUlaSlFzcmtJM1JvamhhZjh0OGJNTktHZjdUcGJuOFdK?=
 =?utf-8?B?V2l5N2tmN2d5WEJQL0xxZE1GLzRJaEhockVPV3RDVElEYWhyWVZLejY2cnE2?=
 =?utf-8?B?UkxTeFBpSUJTbVJDM0EzQzdQMGYrRkp1eXNabEd5L3cranR1cEdHRVc3aGlU?=
 =?utf-8?B?UyttN1ZnN2JrT1YxY2xjMzRyUUUzUnozOFNrTk5Iajdab1RPSkxhRjYwWU9O?=
 =?utf-8?B?MnE2WHd2TC9KYTBBUlY2QXVZdUlGRzMwc1VML3lXdjhOaXJpQ2pnZ2d5SHQr?=
 =?utf-8?B?SUxRVDZHWmtaMEtyNFFiR3RySDU5U0RqUER2QzVKTzJZWXZWMWRGUUFxekt4?=
 =?utf-8?B?YlB4YUZ5MjVMT2RKcU1PKzE3ZXZTdHVXZ1ViYW1OSTZXZnhVaGR2cTJmSFN3?=
 =?utf-8?B?eDJGVFh0RmZiaWdtczdvaVJVVkc4SHJkRzF3UXYweTJ3c092OVFncE05NnVX?=
 =?utf-8?B?dmFlTzVPQmx2K3MyRUxLelFXSm5hNVVKZWRHb05ORW1EK0FEY1E0bDJIWG9L?=
 =?utf-8?B?d1pjakNPRDV1QkY4OGN3SzZPRHlQYm94Wnp0c1ROdFI5MUViY2FtRzVqQUZW?=
 =?utf-8?B?SGVTSExubDM1TTI5OFpPU1NRVEN0YmEzNVUxcngrbE1QeGh6N0tPbFAwR1Ez?=
 =?utf-8?B?OUJIVWpKbGNNT3JpaU5XN0RLSVBqOUhqUnFJcEpCS1dMTzJmRkNseGEzOWI3?=
 =?utf-8?B?dWVjSjViK2tUUEZmajNSajZLQUMrcWE2bjhpK1JMRnVxcTdiSHduNGRFaG1l?=
 =?utf-8?B?cGpCbDd3azMzK2VGSFpTRWFJQXBaRnBFQldoc3I5VUdLcHllN01nQ2xQM0R1?=
 =?utf-8?B?dTZSalVwM0x3VmZZSU9kU1hSaW93UnBWZ3NXUGlwcWpSWC9HV2dvR1VZY1Ru?=
 =?utf-8?B?c0t4K2RyNStSdlQ2RzNqNWNaOVZDNTdWc3hvbDl6WlRqemQvMzBtSkMydTRl?=
 =?utf-8?B?UktUMkdOVVptcTNNallGYUkzQ0Z5SHhWMWJCN1FKcDQ5MnZjQ2J4QityRmhw?=
 =?utf-8?B?bXFWY2dHYzFJZWp2VEllK2JjYzg0WVpzdlVLMmhJQzJ0NlZ6ZXNKb041aHdj?=
 =?utf-8?B?YkNRL1EweHZVWVNrUFY3N2tFdDZjNkNWS3R3ZWh6QUxTRzRvaSs4dEFjMVQv?=
 =?utf-8?B?Q3R0TUgxMEZsd01SZGsrNFYzVlZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 05:25:17.4408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9675caf2-d4da-4e7d-07d6-08de571b21c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6707


On 15/01/26 18:20, Tomi Valkeinen wrote:
> Hi,

Hi Tomi,

Thank you for the review.

>
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>> From: Jai Luthra <jai.luthra@ideasonboard.com>
>>
>> As this device is the "orchestrator" for the rest of the media
>> pipeline, we need to stop all on-going streams before system suspend and
>> enable them back when the system wakes up from sleep.
>>
>> Using .suspend/.resume callbacks does not work, as the order of those
>> callbacks amongst various devices in the camera pipeline like the sensor,
>> FPD serdes, CSI bridge etc. is impossible to enforce, even with
>> device links. For example, the Cadence CSI bridge is a child device of
>> this device, thus we cannot create a device link with the CSI bridge as
>> a provider and this device as consumer. This can lead to situations
>> where all the dependencies for the bridge have not yet resumed when we
>> request the subdev to start streaming again through the .resume callback
>> defined in this device.
>>
>> Instead here we register a notifier callback with the PM framework
>> which is triggered when the system is fully functional. At this point we
>> can cleanly stop or start the streams, because we know all other devices
>> and their dependencies are functional. A downside of this approach is
>> that the userspace is also alive (not frozen yet, or just thawed), so
>> the suspend notifier might complete before the userspace has completed
>> all ioctls, like QBUF/DQBUF/STREAMON/STREAMOFF.
> It would be good to have at least parts of the explanation here in a
> comment, before the register_pm_notifier() call.

Okay, will add a comment.

Rishikesh

>
>   Tomi
>
>> Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 128 ++++++++++++++++++
>>   1 file changed, 128 insertions(+)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 72da58738e16e..f8e55aa402e0b 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -132,6 +132,7 @@ struct ti_csi2rx_dev {
>>   	struct v4l2_subdev		*source;
>>   	struct v4l2_subdev		subdev;
>>   	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
>> +	struct notifier_block		pm_notifier;
>>   	u8				pix_per_clk;
>>   	/* Buffer to drain stale data from PSI-L endpoint */
>>   	struct {
>> @@ -1539,6 +1540,124 @@ static int ti_csi2rx_runtime_resume(struct device *dev)
>>   	return 0;
>>   }
>>   
>> +static int ti_csi2rx_suspend(struct device *dev)
>> +{
>> +	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
>> +	enum ti_csi2rx_dma_state state;
>> +	struct ti_csi2rx_ctx *ctx;
>> +	struct ti_csi2rx_dma *dma;
>> +	unsigned long flags = 0;
>> +	int i, ret = 0;
>> +
>> +	/* If device was not in use we can simply suspend */
>> +	if (pm_runtime_status_suspended(dev))
>> +		return 0;
>> +
>> +	/*
>> +	 * If device is running, assert the pixel reset to cleanly stop any
>> +	 * on-going streams before we suspend.
>> +	 */
>> +	writel(0, csi->shim + SHIM_CNTL);
>> +
>> +	for (i = 0; i < csi->num_ctx; i++) {
>> +		ctx = &csi->ctx[i];
>> +		dma = &ctx->dma;
>> +
>> +		spin_lock_irqsave(&dma->lock, flags);
>> +		state = dma->state;
>> +		spin_unlock_irqrestore(&dma->lock, flags);
>> +
>> +		if (state != TI_CSI2RX_DMA_STOPPED) {
>> +			/* Disable source */
>> +			ret = v4l2_subdev_disable_streams(&csi->subdev,
>> +							  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>> +							  BIT(0));
>> +			if (ret)
>> +				dev_err(csi->dev, "Failed to stop subdev stream\n");
>> +		}
>> +
>> +		/* Stop any on-going streams */
>> +		writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>> +
>> +		/* Drain DMA */
>> +		ti_csi2rx_drain_dma(ctx);
>> +
>> +		/* Terminate DMA */
>> +		ret = dmaengine_terminate_sync(ctx->dma.chan);
>> +		if (ret)
>> +			dev_err(csi->dev, "Failed to stop DMA\n");
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int ti_csi2rx_resume(struct device *dev)
>> +{
>> +	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
>> +	struct ti_csi2rx_ctx *ctx;
>> +	struct ti_csi2rx_dma *dma;
>> +	struct ti_csi2rx_buffer *buf;
>> +	unsigned long flags = 0;
>> +	unsigned int reg;
>> +	int i, ret = 0;
>> +
>> +	/* If device was not in use, we can simply wakeup */
>> +	if (pm_runtime_status_suspended(dev))
>> +		return 0;
>> +
>> +	/* If device was in use before, restore all the running streams */
>> +	reg = SHIM_CNTL_PIX_RST;
>> +	writel(reg, csi->shim + SHIM_CNTL);
>> +
>> +	for (i = 0; i < csi->num_ctx; i++) {
>> +		ctx = &csi->ctx[i];
>> +		dma = &ctx->dma;
>> +		spin_lock_irqsave(&dma->lock, flags);
>> +		if (dma->state != TI_CSI2RX_DMA_STOPPED) {
>> +			/* Re-submit all previously submitted buffers to DMA */
>> +			list_for_each_entry(buf, &ctx->dma.submitted, list) {
>> +				ti_csi2rx_start_dma(ctx, buf);
>> +			}
>> +			spin_unlock_irqrestore(&dma->lock, flags);
>> +
>> +			/* Restore stream config */
>> +			ti_csi2rx_setup_shim(ctx);
>> +
>> +			ret = v4l2_subdev_enable_streams(&csi->subdev,
>> +							 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>> +							 BIT(0));
>> +			if (ret)
>> +				dev_err(ctx->csi->dev, "Failed to start subdev\n");
>> +		} else {
>> +			spin_unlock_irqrestore(&dma->lock, flags);
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int ti_csi2rx_pm_notifier(struct notifier_block *nb,
>> +				 unsigned long action, void *data)
>> +{
>> +	struct ti_csi2rx_dev *csi =
>> +		container_of(nb, struct ti_csi2rx_dev, pm_notifier);
>> +
>> +	switch (action) {
>> +	case PM_HIBERNATION_PREPARE:
>> +	case PM_SUSPEND_PREPARE:
>> +	case PM_RESTORE_PREPARE:
>> +		ti_csi2rx_suspend(csi->dev);
>> +		break;
>> +	case PM_POST_SUSPEND:
>> +	case PM_POST_HIBERNATION:
>> +	case PM_POST_RESTORE:
>> +		ti_csi2rx_resume(csi->dev);
>> +		break;
>> +	}
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>>   static const struct dev_pm_ops ti_csi2rx_pm_ops = {
>>   	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
>>   		       NULL)
>> @@ -1613,6 +1732,13 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>>   		goto err_notifier;
>>   	}
>>   
>> +	csi->pm_notifier.notifier_call = ti_csi2rx_pm_notifier;
>> +	ret = register_pm_notifier(&csi->pm_notifier);
>> +	if (ret) {
>> +		dev_err(csi->dev, "Failed to create PM notifier: %d\n", ret);
>> +		goto err_notifier;
>> +	}
>> +
>>   	return 0;
>>   
>>   err_notifier:
>> @@ -1642,6 +1768,8 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>>   		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>>   
>>   	ti_csi2rx_cleanup_notifier(csi);
>> +	unregister_pm_notifier(&csi->pm_notifier);
>> +
>>   	ti_csi2rx_cleanup_v4l2(csi);
>>   	mutex_destroy(&csi->mutex);
>>   	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,

