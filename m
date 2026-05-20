Return-Path: <linux-media+bounces-62266-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKGgBJ+kDWpM0wUAu9opvQ
	(envelope-from <linux-media+bounces-62266-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:10:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D383C58D569
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 14:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED86130EA1F2
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 12:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92763E00A9;
	Wed, 20 May 2026 12:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XOMOJtww"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254A3DD85B;
	Wed, 20 May 2026 12:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278550; cv=fail; b=MbcAOGjJcazP16ZRWcroafTrqI2UTcs8chLsKBxpJ6GD7eVkYUBxE1KP8QHNchmSNY8Q2ZBnX+NzEN0BGvs9NFZdscDJm/NKIQdTo5MXEfOALbYxtcYjYndFhsO4sqUNcs3pMPo4zN2kDoDETLJSKH9Kgz7dul7r++cCuahDZyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278550; c=relaxed/simple;
	bh=Pwk6+IQnNNkUnR4yIZtbc/OKwIWCsS6/nFQV5W2oKmM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CZQHQXLlLYxHFByY5yt0ikXNo6AJw2J6pDKv8okwlHUYcBGPQ2meFEJSBgEgQc/cUvdApju4ePJMbt8Uy2vjzt2x240IRexXyvapUjq5Ck7i/jD4nC98tWp4EBubVJq2O1X/GBlCI+BwFuj4dQZuPkaILbUt7eptPqN3VXJVwts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XOMOJtww; arc=fail smtp.client-ip=52.101.56.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSJdv+li90NJ2ijoZUtC9R8AWY4OfDOoW1hRIdvvgESCVcFRzjt4YubN4ijrIgFrYgrqCv/E/IDgPh5Cv/QINtfs2H5FZHeNt/pEUKyl569O7WCIjS4fl+kIuE1gA99mxHq2lKVYq4jzTXZdAa8G1GDSOmfwPJ9KCOz2L+e6G2H2ivwWULzemgW26nifSQtfW37uCwZMAA3IbQCw45TMei53h6NqgfDol/T8BjuM/5A3jQ/fU1VV/HXvX5R8PVDt1JtcuyesHjW/FpFiaPykeYzQY01I+wzilR4X/QAi/BC8tHROWzjVfqdwqjYZc9KMGJXLHTiMCFGueaNwrRtOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByP2A0F/sya06wk8rUkmx0OLc1aj0aJck1EsWdBkqrU=;
 b=obuBdlWRKy9p80Ew96jYaG6LY8wmENnn3j13HpuNazwYkTRabEqwT/TCVfM0nB8m7oHs/9ygkbr0JoCrBOJOi2t+6H5OKJeH/qEnyh8LjsAyZg8li0xYFihHYKlFPSon1EmBLAdhw4RCPSO8p2AMCHxcy0/kGq8rflYvKfUm6qak3/lqvP5WQFfYSybUcBtfZNNTLxXS0LVQRJE4tImwOljPN4JUEhnDclkj6Xa2hyI8A2CKDajkGaIT0GCJ18wS1q7ZskEKoB4yrX77y37/f5NtnpOQ98qCpSRJO/slOB+r7vRJzDztameG67ng039IhXjYbaDEvElApom4AsMJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByP2A0F/sya06wk8rUkmx0OLc1aj0aJck1EsWdBkqrU=;
 b=XOMOJtwwGuWkZu/c5YRjw3bg4BelGCoGT5XyFfwXzGSoNirWzhgjVDSvD2lPWvSx+LFXHlq3W1euQUpBaWM9/GH3ErloKGkkcfIU0P3dBGSqw7sZnscjbv2YSFbA0pZIlhYo3G7Qew85AoRO8Eb4Fxw3+sAWYBDV0FDpXcOTgHU=
Received: from MN2PR14CA0012.namprd14.prod.outlook.com (2603:10b6:208:23e::17)
 by CY5PR10MB6012.namprd10.prod.outlook.com (2603:10b6:930:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 20 May
 2026 12:02:25 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:23e:cafe::51) by MN2PR14CA0012.outlook.office365.com
 (2603:10b6:208:23e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 12:02:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 12:02:24 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:02:24 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 07:02:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 07:02:24 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KC0N3f1914726;
	Wed, 20 May 2026 07:02:17 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v13 16/17] media: ti: j721e-csi2rx: Support runtime suspend
Date: Wed, 20 May 2026 17:30:21 +0530
Message-ID: <20260520120022.539913-17-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520120022.539913-1-r-donadkar@ti.com>
References: <20260520120022.539913-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|CY5PR10MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: c4dbbed4-d599-4b9a-5c0a-08deb667a80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9I/v/eTdNkl7Cdx+AzTS+WOS0z6roBFsDD0y6/aVEKSBg3pmxkWmHH8IxqXIFkjQp0ioBVCbKlxQjJY3eTVMEUippd+LEUcnI0IHkO7UbhpB0aH93ujJ0BPId5IibZ4W3ZP5aBE6+iesIOXByH75ddEPIyt7mla3jooTAQTR3mB4OyrJR1TCU0vRHCfU9aAfTrHN1oUEOJ1J+GWF+ssfYNSeRfArYaRFz3fJj/uT/WZpQjGiMHOFUvajqlpOQpl2Aolc5EYu2ggkfII190mNS8cruKdcwqAiEBFcWz+xMh0dzB+Y+kMu5srBElYxoaIJ8XBCcoEHan+Nr0G2N345mbTUZE7KE7sY/D9ROEOQ3E0InVB5OX/DuxVdFmGniOUezAuu1PnjjJ0zO2FblEW8qd7eyDuNMJeD114TIGXOjmAmzB2uXTg/m/sw7Si2UadTRd3T3Xly6MSwAxZAVuyFJHGkOUK2sFl7zulw7NAUA9q4NSoeNQ5jpS9WR+LYdoZqlYskxA9D6nv73a+ff4OmetBvJh8U4YEwGUg8GEWNyDj8PP/nVrvCm76xfNa3g2he7XPPRgfy1PojTXQzxK1g2iz4VLMdmSddrD1dClCa4yq5gjJg1RWI5JBSgFdTW7i0Rh8558VdJ+Bq9EYfbqeKyX5t89TF0tI0STNLd4YP65fPNozaa+soUc2RJfxbsbx5a0y3NRPzG5ltdvPIbDIudTmqDHtc3ic9XMt+X6GTGF4=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nql/DlW658EOtVwgKKMA5cl5iymqf2PSAjuB+bj/Eod8APHj6jTf4keep2xYH+f2XOyWUrs7YF1nn7I6C8NS9sKYK3jrSN/hl01lcDD6UDvLgPFjRYCXJiD8N/NiCJsK6joNM6KgXkOkiVuA2+X+GhfiVROVHw7ZuzZXyFFDeu45VXTh1jtlQjsVsTMIyXfXsdl1HVFpUmfVl327i1PPIsNMhkFXO9qaQ8Gkafs5OopCFi6kD5m8j0plWUzt5RUYx3fqgbFBM7Mz4j4Q6fmcZlN86y2GlrQaVfrzL9PdxmQPvrlgK6AXnOTGg+R7l4YJI6nLnEw4E14jXMXHaxOXizWmP0UCuloHIWalj1HY08FJnrsFerz6bU2Cr5UpEcSYimj1fuEDU8Z5tYYr6XtulPcG64Y7Fx8LMqiQvWDHq5QX0yaRJ255vMxUIep9PZnK
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:02:24.9139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4dbbed4-d599-4b9a-5c0a-08deb667a80a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6012
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-62266-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:email,ti.com:email,ti.com:mid,ti.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D383C58D569
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jai Luthra <jai.luthra@ideasonboard.com>

Add support for runtime power-management to enable powering off the
shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
the device(s) are not in use.

When powering off the IP, the PSI-L endpoint loses the paired DMA
channels. Thus we have to release the DMA channels at runtime suspend
and request them again at resume.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/Kconfig             |  1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 56 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index da33facf4467..d0cb05481bd8 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -83,6 +83,7 @@ config VIDEO_TI_J721E_CSI2RX
 	depends on VIDEO_CADENCE_CSI2RX
 	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
 	depends on ARCH_K3 || COMPILE_TEST
+	depends on PM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 3142849f9bb9..d68b8d6ffeb1 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 
 #include <media/cadence/cdns-csi2rx.h>
@@ -964,14 +965,18 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	unsigned long flags;
-	int ret = 0;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(csi->dev);
+	if (ret)
+		return ret;
 
 	spin_lock_irqsave(&dma->lock, flags);
 	if (list_empty(&dma->queue))
 		ret = -EIO;
 	spin_unlock_irqrestore(&dma->lock, flags);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
 	if (ret)
@@ -993,6 +998,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put(csi->dev);
+
 	return ret;
 }
 
@@ -1012,6 +1019,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	ti_csi2rx_stop_dma(ctx);
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
+	pm_runtime_put(csi->dev);
 }
 
 static const struct vb2_ops csi_vb2_qops = {
@@ -1257,7 +1265,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
 
 static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
 {
-	dma_release_channel(ctx->dma.chan);
+	if (!pm_runtime_status_suspended(ctx->csi->dev))
+		dma_release_channel(ctx->dma.chan);
+
 	vb2_queue_release(&ctx->vidq);
 
 	video_unregister_device(&ctx->vdev);
@@ -1507,6 +1517,38 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 	return ret;
 }
 
+static int ti_csi2rx_runtime_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+
+	if (csi->enable_count != 0)
+		return -EBUSY;
+
+	for (unsigned int i = 0; i < csi->num_ctx; i++)
+		dma_release_channel(csi->ctx[i].dma.chan);
+
+	return 0;
+}
+
+static int ti_csi2rx_runtime_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	int ret;
+
+	for (unsigned int i = 0; i < csi->num_ctx; i++) {
+		ret = ti_csi2rx_init_dma(&csi->ctx[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops ti_csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
+		       NULL)
+};
+
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1562,6 +1604,9 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 			goto err_ctx;
 	}
 
+	pm_runtime_set_active(csi->dev);
+	pm_runtime_enable(csi->dev);
+
 	ret = ti_csi2rx_notifier_register(csi);
 	if (ret)
 		goto err_ctx;
@@ -1592,6 +1637,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		pm_runtime_set_suspended(&pdev->dev);
+
 	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
@@ -1599,6 +1647,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	ti_csi2rx_cleanup_v4l2(csi);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id ti_csi2rx_of_match[] = {
@@ -1613,6 +1662,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
+		.pm		= &ti_csi2rx_pm_ops,
 	},
 };
 
-- 
2.34.1


