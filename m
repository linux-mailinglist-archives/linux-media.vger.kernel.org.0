Return-Path: <linux-media+bounces-60266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBzKNSVt+GnPuQIAu9opvQ
	(envelope-from <linux-media+bounces-60266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 11:55:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AFC4BB4B3
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 11:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C54B3031326
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 09:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B27389441;
	Mon,  4 May 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="voNPGLjo"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF2E35F8B9;
	Mon,  4 May 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888276; cv=fail; b=jPMhPuR4zCcRJO4EH6q3TLEYdWJpSMpRNZDP8nOwPu8Hl/oETcZ4ysRqeDY1OulmgFOx0jF+ocp13/aGOhZGIfRpt60huO5EIEe0EL0x0MHEwKYoDf+9fWOfc9POCUfugdyw8dqHQdEvg4xBALjG1xKOcX4ds5b6M9gavi0VOtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888276; c=relaxed/simple;
	bh=XaRduuz2/hEIuY0xfq6CzMdz9sPSzSKHlMw1QLcBTN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gmwX/FEo/dSeJ0l/hLS5UoHCeh4GNbjEIR3pXhya4+nQFlvocfN/ycoyAGegs2PQnsBI6TskiXjv7Zkm3sXsruzwFPcTsKu/zRBDKfmw7pQRG9vxx0EUQVCClqCp/sVly+1s1N1gG5aPjfABgyP4Y3/se0Q6kOD2qGQ0HslBEkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=voNPGLjo; arc=fail smtp.client-ip=52.101.53.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8A8Z+qkNlp0vJEyEqOxsxDIxjdtaWpIWupDS6Wnoktwr5xVQLI10bLufeMWq14sRFXDid4aoSNYPvahYxlS3ZvLGvhqZsav5X4rgDTjYIg/Id7wo6KVfUJy6reCewEal9DXowMh84WKohV0JI635St5pvXvarC5qGKId2L27sKq/XsgN591VYNQ34rDE1wqEeuaQTE88o/RMwE+H0fSfGdfd5OqU6/uwn5ZA5irdNDFI+5Yy8hA1XzrqDgzZ6yPadWgjjLhp0xVr5BItMxTf7zUZQf4FozkZ2wCHEnhon5jvCsp5uxyN64U4S2taJgGX9V3b+UGq/EGBlchiSyErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IOzfixlBSEw59opVftDKhjgoBGxAG7AkBJRzknunAE=;
 b=duCm/Nr6RJRQqBTd9ASBUWVzs1IoWhDDY7nr+TOJd9ImM4BtZEHlVuH12zFXRXdl4yGPDRbDi4JB/9PBcmT+FJ4p2c+GCxW0zk5EL0bN6zEndpLEmDT7LG57tj9fMBsB8q4fGpsBNFbFwi6GWJIImmH1kxUeEs1czUUvfyCP44UZwMbRMNpZ0zyuFyFr/caxyXW3uLc85O82AU7cOLOKg6EIVZ6+MMCQ6dvg5q3vn8gLNdKWJIR8DvwIZtYPdX+jqwlFe0J+DVYyU31pz8bDJWL6fMoaKs0ZqYIxlh+4PXVdSOnasRPuifeI4RAacRYEOQw8FhrppoQ3j0OEWP7UjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IOzfixlBSEw59opVftDKhjgoBGxAG7AkBJRzknunAE=;
 b=voNPGLjosMNT1TIC3VVPc9LvmhjBo9eUBBbGjgsZjhc5ZsNQDEyKDShFzjFZStvAy46q9z+M3/ikypXpPrdjOd3+4u/OsR2vyEmh8/aUD4v3OpPeObplGGdEUGYc8tKu3qL828SDIwEZNSg4Dt2dbjHsdUQ4vhyyaY33vfx+z+k=
Received: from SJ0PR05CA0106.namprd05.prod.outlook.com (2603:10b6:a03:334::21)
 by SJ2PR10MB7059.namprd10.prod.outlook.com (2603:10b6:a03:4d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 09:51:12 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::94) by SJ0PR05CA0106.outlook.office365.com
 (2603:10b6:a03:334::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.8 via Frontend Transport; Mon, 4
 May 2026 09:51:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 09:51:11 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 04:51:09 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 04:51:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 04:51:09 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6449p7Y2743224;
	Mon, 4 May 2026 04:51:08 -0500
Message-ID: <89a5e2e5-9469-439a-8def-8c7d30980cc4@ti.com>
Date: Mon, 4 May 2026 15:21:06 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ti: vpe: unwind v4l2 device registration on probe
 error
To: =?UTF-8?B?67CV66qF7ZuI?= <mhun512@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>, Ijae Kim <ae878000@gmail.com>
References: <20260424000000.547-1-mhun512@gmail.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20260424000000.547-1-mhun512@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|SJ2PR10MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: 09199664-9b14-44f9-0c38-08dea9c2acb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mLX2p2hRiCnd9RqI/Nesu/XXeN66Ztq2W5Vxk96c6OvdNI0H8CeZVibaieuDv9cvv23rqyDJ638I57Ch1NiQmP2g7+a9HQdSK904RHG4GtnG/L8u4qmTcxvNb9hHqmAs2AIhFgQU7zU4t65BirCvz2nMT9EEdJYU0OrykXDnoGfRUgw1uZZ6EsUiPxdS8Dq5PsMMyuDYbK6eWguEkfb7NrWNVUoGrboC+op/b20jjlWLp7Ls5owWmoQIMbRCXWr9PqJ9wtvXLvOpMa/WkV49syV90kSs6EvDBcacA8IojQc3GL1p7BNinZf6EfspDdkNW5LoZ1RZbwwgccU0FkgYCiHb3IF94mP9bleftgO6+17Yjhxke8NxpMhcj5LlSEgBIudmY3aNfOlIKw5qr/P9S7luZF7SG3dX52+xXJZ8hjWkpChRBCQPrLNRBKTRx7wRG32hIRq4IpzZuKGngQ/BXCXYrG28S36wr9HW9tmVOoOhX2ZThvYdwc8R/xTd2O/ykTO6XQvrV2q4H77MEs5u4wZj1mS+LxYExKo/F02DVl21Jw8X8EKLx3mAxUfTHZIqyp5kaDEVSapmsalTyrKXqZm1Pvmil9I08prWbBewj9ggRocCImJpdNbBQrq5ESaZ0M1J8+Y+rRLWTdYjZ71XvsnvtemPBB8NEFcQXMuxvPoGiNzy0UJDokylKMBx27VdeIIQkqEXd+GctXNANsdX714PQCwmYiWjsVKLkI3nxjM=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BKfK2PTnHPxjf/KKOTRZSR/CuRO/14uPShIwWsTUoQ5N09Vn5X1k09saAZEjnL2xnhBMr9yAf6f0qwWaP0NhdpvRurspeempifNv1qsE0xlr3p+VA4FbAriFcF9hHHflKY4yC1xLzzS5C9OSiXWE9YiX8jtdzDyAV01yMCMkqP+Civ/jGotgH/UVCrM5KeAB6fu4c8Svh/DirQYVnA6czpxRSMiaFUjlE+54/yINrm3w5rRt+J9Uy4Kr4HbhMbddTEOC/4r1mOzREYSCsV3gq0kDEzTugfGQgcUnRqLQQDQIB4/U1Sj4HeyLaBnyixfQIeLiRZmCOEeJnsV4CMYSotFYpeizrM1LR99gywHgL2hOfi/tE2qrhM/ljxqiQcPzv+8xgt4oc4TV7lSmx5f3uVld9ByXvRLHd7tU/ouNCHJPMikr3SzvH0CWeShv0G8W
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 09:51:11.8038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09199664-9b14-44f9-0c38-08dea9c2acb2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7059
X-Rspamd-Queue-Id: 58AFC4BB4B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60266-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:email,ti.com:dkim,ti.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]

Hi,

On 26/04/26 18:46, 박명훈 wrote:
> From: Myeonghun Pak <mhun512@gmail.com>
> 
> If the vpe_top resource is missing, vpe_probe() returns -ENODEV after
> v4l2_device_register() has succeeded. Probe failures do not call the
> driver's remove callback, so the v4l2 device remains registered on that
> error path.
> 
> Route that failure through the existing v4l2_device_unregister() unwind
> label, matching the other errors after v4l2_device_register().
> 
> Fixes: 4d59c7d45585 ("media: ti-vpe: vpe: Add missing null pointer checks")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Notes for send preparation:
> - Fixes tag was validated against upstream history; the local row worktree
>    remains shallow/grafted and cannot verify it by itself.
> - Build was not completed because this worktree has no .config.
> 

Why can't you build test?

Having said that, the fix seems trivial and correct to me. Hence

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

>   drivers/media/platform/ti/vpe/vpe.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti/vpe/vpe.c b/drivers/media/platform/ti/vpe/vpe.c
> index a7e5a85e72..81bd1f9cee 100644
> --- a/drivers/media/platform/ti/vpe/vpe.c
> +++ b/drivers/media/platform/ti/vpe/vpe.c
> @@ -2539,7 +2539,8 @@ static int vpe_probe(struct platform_device *pdev)
>   						"vpe_top");
>   	if (!dev->res) {
>   		dev_err(&pdev->dev, "missing 'vpe_top' resources data\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto v4l2_dev_unreg;
>   	}
>   
>   	/*


