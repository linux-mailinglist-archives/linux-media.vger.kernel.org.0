Return-Path: <linux-media+bounces-62218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI3EJMdrDWqHxAUAu9opvQ
	(envelope-from <linux-media+bounces-62218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:07:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA9589669
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 10:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49C373078DDA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 08:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58603A6EF1;
	Wed, 20 May 2026 08:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UX5kmpL8"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5F36C5BB;
	Wed, 20 May 2026 08:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264371; cv=fail; b=DzUgEgFsVS7YZhUp9BDDlFxk67VVpJLiiNZclweAe6pLL5Xw0y6NbdY6vLzKr+kImmH7L0Ulls5Rwj9w5dQ+o8RiExx+LAxksbkKnbN6Mxzo82WmC/7NUkxn2AZPtjQHE0k2jDPdH64IkiZCPYKswPsyl1zojhTXxL/hfaSAo/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264371; c=relaxed/simple;
	bh=5moltNm6tj4QN/VLffYSG3oyUediCegD2l2omqlAqOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rHBTlItJb6iJTzLqm0EgzwSFXGYqM71eoMZ0NmaXX/NYoHOhozW0kklT7CCCVSZI2vyVDGKiNDaVox8dDdqGWsVD2VbwD4vtI6wdWDodWBrwf8TQ3dYCVVsSYvfTaVzPWwUkN465v6EGaT+bZdSJUe/oGCN4IqUluIfpROSpL0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UX5kmpL8; arc=fail smtp.client-ip=52.101.61.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+ZSofVNB/m6K9TIefM3fKTwYP6aTNME0ZPFPmhRvDyQqKewXZUo6sHoN7CK+jhdJ3jXOB+1rT1aC9W0fvZAiMUu+BOOT2Kn15AIfwE1YFPXBLuD08QoO7Akw3oHzLbBg4bXZZ+x+0hPwvKvfAXae2DY1+fsgx5DMzCUlhhlFIbq68EJPJ57IIGDd1QLP1MVthqPG6diQ4NT+spsbiiNLbs/m0FtHO51D4yw29jf3KvqXXfBUCij71tLqlFvQ8sL6U4QRtR9R1MnXjCY3ivYIDpF0Qkn5m4AqcvVnOYRIEDNzW0orhPL4F0FoeWlAL1RKbROFk7XmB6TZ6xeis52Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3tRspF2EqpkUMpuEqSz36am5V1A7PAdiZ7mKj0qlw4=;
 b=Denn/GVYhYsZv21+SsXlKPM5zJNklv9R/rKvuR5Z2MSDzGHiLN9QjpT+Nfkbz9pnv+VUe0Raz7g3q7qNVUxJTOQyVJrNpgtfbgpZOtBxYhH5POYw6ZtCJwi+0r7Lpap5EJhpucNmoEmgbz0kEKaz9/SnrLIw43bpKiHsC3mAEMjqLVVNWL9L2lvqTM3VzQCz1XbewVI63G0qGgPTQtwcxiGqQB0AQk2Zm2RWicoNFLa88CWoZeoRPd4MRxA9PCokVMC8HYw15Vpaf+BFth6CnEpLG3FO0RL8KVFbGW1xR/A9rTxCETZlvGMXgZCWzovJmsSnrc79w0jUU8dwqymygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3tRspF2EqpkUMpuEqSz36am5V1A7PAdiZ7mKj0qlw4=;
 b=UX5kmpL8HGaVSiU0AN4SEAIZw+wDN41+sYohREBqG7B4QJ9zmL71aiRmyga8NjToWKA15/AizlG3IJYT7bHnxxPgXoioO/IFiRaJbUBevxQIE1nC+8WWbsvRpqIaBYt8pLEWBgMr+vUF+lZm8Uvh+7yFtKSZC/m+LvX84mtAlpo=
Received: from BN9PR03CA0054.namprd03.prod.outlook.com (2603:10b6:408:fb::29)
 by IA4PR10MB8325.namprd10.prod.outlook.com (2603:10b6:208:55e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 20 May
 2026 08:05:59 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:fb:cafe::f2) by BN9PR03CA0054.outlook.office365.com
 (2603:10b6:408:fb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 08:05:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Wed, 20 May 2026 08:05:59 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 03:05:58 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 03:05:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 03:05:58 -0500
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64K85pGi1040621;
	Wed, 20 May 2026 03:05:52 -0500
Message-ID: <c3caaaed-902c-4247-9f0a-4e62c07f32df@ti.com>
Date: Wed, 20 May 2026 13:35:51 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 16/17] media: ti: j721e-csi2rx: Support runtime
 suspend
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-17-r-donadkar@ti.com>
 <agxYPM3mLwR302Za@kekkonen.localdomain>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <agxYPM3mLwR302Za@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|IA4PR10MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: 127332b7-ec6e-4490-507e-08deb646a0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|4143699003|22082099003|56012099003|18002099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	WjmQfE9Smz8hVDcqOSyawpprXGhAWDMnh5qARCxyHh8D3c2Xv4MbHApT6Dm3dg7ScoB/X9xiHToil55cgFeE575t0NQ58pqhxN6kac7WJe65W3CWAmRrfVPlrmujHFUx52okTiTBizGXCEN0IoTQN31xYriBG4qll6r+D//tqyTuA7RUHZ4Bffjez1CYbobPKQGaGlWFGH/548JnqP2OGCnj2cufbSf0RzF0LZkcE0QfpimLZAMSMXpoTulBpd5A0ckjKbsDa6+FqNP7cONxVV98G2Y/X6YptmYNzzEdG07SvNTyIE80O8PM4lJuT5TtOa/6vufOBWjJrrUqAAOJwzk0XxkVqqz8e779O5Hc0hWAoYWnXr4glMbGYexUJyaW27Wofbd+xk7PNzGmHve4AJFPZLL0bNjd1bGhTo32rjCQvaFOSgWHEGmpp4Pysb+fsAqubKRycKPtlr5aDu90FlAnKI0fSu6fiF3is3BCR35pokXYZojS+yhCeK5h4h7aYVkBJtANUR6k1OApjejh+TYCzRujvKacVyc2AU1rQIEBevpFGu2GVqyd0KJLOVS5ZdL/bV8R0FKjmenq8jq93nSXYi/QTzRQXwGd1FB0oe/DpsOWfHXCYpVTZM9JOQ0Wmkk6cL7eC6Bc6WgLJa4G0dbxmQ0EZOCJiJH1OfA2tMeofiiKBtcClxd4LTKohCvieXOCCTR5zotaYYbbWQQG9iiyEg4K5Nh6OjpVtuG9JXk=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(4143699003)(22082099003)(56012099003)(18002099003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6CHVz52RVxZv0cP8/JEmRSvUa0m/HLjnC29go4iWuTKAlj3AgQc90wf2rKBoK6eg9W69DFFsJV8nMB1ez85FyvT0IZSN8TLEdWO+P6ac9c5Vx98hCYByuCC7l0OR4Z2pYMtw5UkCZW7mopwiV2LvOBCgdsetATVWRhNkkxBq69w76AvbFghg5QcH9y/+Yy60pTsG+zb8aGpj3PiWkh92YZklKw/dWwMQi27ho1ATNLkY7fCEX5ev4dQwAsXFmmIsdMgvg05NGaaZ830QGJfK8HfNK3WoY+voQAMXBeR2EwfMeEQZALX+L4mpOOGwkrwg+UradauXDvKhHRE7VgEnYHSW4yU8kY77x3Yt8VVXHN857XAMIjSkeNZCpQyOR+adNfEt21jo3srVwpAQqM8H3Ftf2ZFLgcX1gzANi1Ce4yzEnIUMSLifEJAjP0ZWzlTN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:05:59.2532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 127332b7-ec6e-4490-507e-08deb646a0bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8325
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62218-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 10EA9589669
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 19/05/26 18:01, Sakari Ailus wrote:
> Hi Rishikesh,

Hi Sakari,

Thank you for the review !

>
> On Fri, Mar 13, 2026 at 02:37:00PM +0530, Rishikesh Donadkar wrote:
>> From: Jai Luthra <jai.luthra@ideasonboard.com>
>>
>> Add support for runtime power-management to enable powering off the
>> shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
>> the device(s) are not in use.
>>
>> When powering off the IP, the PSI-L endpoint loses the paired DMA
>> channels. Thus we have to release the DMA channels at runtime suspend
>> and request them again at resume.
>>
>> Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/ti/Kconfig             |  1 +
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 55 ++++++++++++++++++-
>>   2 files changed, 54 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
>> index da33facf44678..d0cb05481bd85 100644
>> --- a/drivers/media/platform/ti/Kconfig
>> +++ b/drivers/media/platform/ti/Kconfig
>> @@ -83,6 +83,7 @@ config VIDEO_TI_J721E_CSI2RX
>>   	depends on VIDEO_CADENCE_CSI2RX
>>   	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
>>   	depends on ARCH_K3 || COMPILE_TEST
>> +	depends on PM
>>   	select VIDEOBUF2_DMA_CONTIG
>>   	select V4L2_FWNODE
>>   	help
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index dda8a66babeca..52c93a11ce8b7 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of_platform.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/property.h>
>>   
>>   #include <media/cadence/cdns-csi2rx.h>
>> @@ -966,12 +967,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	unsigned long flags;
>>   	int ret = 0;
> Redundant initialisation.
>
>>   
>> +	ret = pm_runtime_resume_and_get(csi->dev);
>> +	if (ret)
>> +		return ret;
>> +
>>   	spin_lock_irqsave(&dma->lock, flags);
>>   	if (list_empty(&dma->queue))
>>   		ret = -EIO;
>>   	spin_unlock_irqrestore(&dma->lock, flags);
>>   	if (ret)
>> -		return ret;
>> +		goto err;
>>   
>>   	ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
>>   	if (ret)
>> @@ -993,6 +998,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>>   err:
>>   	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
>> +	pm_runtime_put(csi->dev);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -1012,6 +1019,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>>   
>>   	ti_csi2rx_stop_dma(ctx);
>>   	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
>> +	pm_runtime_put(csi->dev);
>>   }
>>   
>>   static const struct vb2_ops csi_vb2_qops = {
>> @@ -1257,7 +1265,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
>>   
>>   static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
>>   {
>> -	dma_release_channel(ctx->dma.chan);
>> +	if (!pm_runtime_status_suspended(ctx->csi->dev))
>> +		dma_release_channel(ctx->dma.chan);
>> +
>>   	vb2_queue_release(&ctx->vidq);
>>   
>>   	video_unregister_device(&ctx->vdev);
>> @@ -1507,6 +1517,39 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>>   	return ret;
>>   }
>>   
>> +static int ti_csi2rx_runtime_suspend(struct device *dev)
>> +{
>> +	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
>> +	int i;
>> +
>> +	if (csi->enable_count != 0)
>> +		return -EBUSY;
>> +
>> +	for (i = 0; i < csi->num_ctx; i++)
> You could declare i here, and I'd use unsigned int.
>
>> +		dma_release_channel(csi->ctx[i].dma.chan);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ti_csi2rx_runtime_resume(struct device *dev)
>> +{
>> +	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
>> +	unsigned int ret, i;
> Ret should be signed and could be declared below (up to you).
>
>> +
>> +	for (i = 0; i < csi->num_ctx; i++) {
> i could be declared here.


Thanks for pointing out, Will do all the changes in v13


Rishikesh

>
>> +		ret = ti_csi2rx_init_dma(&csi->ctx[i]);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops ti_csi2rx_pm_ops = {
>> +	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
>> +		       NULL)
>> +};
>> +
>>   static int ti_csi2rx_probe(struct platform_device *pdev)
>>   {
>>   	struct device_node *np = pdev->dev.of_node;
>> @@ -1562,6 +1605,9 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>>   			goto err_ctx;
>>   	}
>>   
>> +	pm_runtime_set_active(csi->dev);
>> +	pm_runtime_enable(csi->dev);
>> +
>>   	ret = ti_csi2rx_notifier_register(csi);
>>   	if (ret)
>>   		goto err_ctx;
>> @@ -1592,6 +1638,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>>   	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
>>   	unsigned int i;
>>   
>> +	if (!pm_runtime_status_suspended(&pdev->dev))
>> +		pm_runtime_set_suspended(&pdev->dev);
>> +
>>   	for (i = 0; i < csi->num_ctx; i++)
>>   		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>>   
>> @@ -1599,6 +1648,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>>   	ti_csi2rx_cleanup_v4l2(csi);
>>   	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>>   			  csi->drain.paddr);
>> +	pm_runtime_disable(&pdev->dev);
>>   }
>>   
>>   static const struct of_device_id ti_csi2rx_of_match[] = {
>> @@ -1613,6 +1663,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
>>   	.driver = {
>>   		.name = TI_CSI2RX_MODULE_NAME,
>>   		.of_match_table = ti_csi2rx_of_match,
>> +		.pm		= &ti_csi2rx_pm_ops,
>>   	},
>>   };
>>   

