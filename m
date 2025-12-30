Return-Path: <linux-media+bounces-49685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88241CE911D
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAA33305C4C3
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB3D317706;
	Tue, 30 Dec 2025 08:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Zf2AycRh"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917493168E7;
	Tue, 30 Dec 2025 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083677; cv=fail; b=QWw4r6aQsir/QgBufjC83DQHy5kzUd77Y/QTzWl2i6EAJFPZkE012bEVNnZBUBVM7xSQD+3b/bJTzJydYe/eNA4msETqnlpfPqUCtuT4tf4zOQk87fCtK0Df+cO4FmYuS6BodmkgXhLRqrV8J6w7CCmQ9BG4tSkWDFHGK+eDT/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083677; c=relaxed/simple;
	bh=QmD43ijY+oUddF2MnfTDu8GSvjgsy3vs1sUOQwVkEJE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZbQIWOi7e4HLEOkPmYZlgnCSbwykfRcnGWhkb0o7lrQeqnH/3xSSFP1sKTmRU9gLBCWTL5ZE9psypnhUXIxzuLprY3d7i8iBIVaFKF2fqpkB3JH1J/S62TZ+mKBItl0N5HHhMJEwuMYRTertd6nzoL5nPa5uwbTGExBF0Lcky2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Zf2AycRh; arc=fail smtp.client-ip=52.101.52.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbMyLSSnVAgpEFPHuwfVuayhBfZ81pEFUA1/WAhF6a9amXSz9GCuLMvUEY1KDOPXZnlFIQrytogxAvXRHw03HbHdSDXj2Rv3ie24udzs0vezlCTxDX79HhRtpzHoq2Ls88mYdONYtV2pvHUKfKXKvUgZMEgawUzca95/b0Gpm9966qlpjBX9p+RBuc8lVbihTsnnaOLeGAkj8JGFCKrpemAU0dZfkWEbzDCFtDHcyvhNWWg65zFh+v3AMMYmycGjSDoy6RKCfeviqd/gOjE6qxK+lXsgjAxcvhpB2HYQIJdZbca0qvWBZMM4U5ikQDKtzqdVqc1us6JeW4BzR2Obsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+HgyLk8OAclisYkzyZQvZQpgKFja0wDOlH0zbM5XFs=;
 b=BzG5Velq8pyjD9YUcD0riszp2//TUFKzyTp3vkpuuxk7g5Ou27Pszo+bFQO/oIi6LNdA9rBlMOQOhewrPSvy3LgeSDIErpeZcyXdUpa+cZq1rPgvF2axzS7UdsPuhZ/Wdt7s70H75cSF+8HFQ58um++qY7dIb3UsTBJK5Arw6eoabyjaT+dXJZPaJV0JW0/YUyjwZBxd5tXQ20wcIACqtoC2PswBUNKR9LNGznMq3sH8LjX2Nwcq4TzeFmm4hJlQqLK2j5dB2sNKEEWS/zjbjYUNNZHFU8/gfjH+RaMuNwRN8K9udP0/fjvqh+JQXIgGyriHmGOYpNXbPLW5/xfCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+HgyLk8OAclisYkzyZQvZQpgKFja0wDOlH0zbM5XFs=;
 b=Zf2AycRh94QU5a8yVV4YB2PKnIZXkiX9zYk7tuFN9k0vTdzD5YNvjOCvHpuaw/Yl2FY9BWEZEmdUBDBMkfcnjjr3ojP6ts958/kPRwKafTTCDUJTSXIn0Y0XR52gjFEPQuphj4hk98UfyaFY9Ce+j2DWtIgRSou2cgM6eelrZR8=
Received: from SJ0PR03CA0167.namprd03.prod.outlook.com (2603:10b6:a03:338::22)
 by SA1PR10MB6541.namprd10.prod.outlook.com (2603:10b6:806:2bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 08:34:33 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::46) by SJ0PR03CA0167.outlook.office365.com
 (2603:10b6:a03:338::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:34:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 30 Dec 2025 08:34:32 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:27 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:34:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:34:26 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9l579464;
	Tue, 30 Dec 2025 02:34:20 -0600
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
Subject: [PATCH v9 18/19] media: ti: j721e-csi2rx: Support runtime suspend
Date: Tue, 30 Dec 2025 14:02:19 +0530
Message-ID: <20251230083220.2405247-19-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230083220.2405247-1-r-donadkar@ti.com>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|SA1PR10MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b4162a-f597-4bdf-f324-08de477e417c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5DUFpSgeEy32gfOCPWv/afoc85tJ5yGCxFAbdO28UdjOBWP7ZXb6m3qisscr?=
 =?us-ascii?Q?8OO0p6qgAiz2+Wlm4RFt5FNpPpsjbeobwhm3IVXBGwW8qj721KYd/gBQUhx7?=
 =?us-ascii?Q?4bWVLz/DYolFhTwSaztb6YwrBg7jNQftVDdpk/U/3rh4H0ffyG5CaVBh4R7A?=
 =?us-ascii?Q?0YyioKcHxyXYuuNbVEV1iC+PkUyCNbU10cWnxuRhx7LN67fp/OAObaajW8A8?=
 =?us-ascii?Q?V1q5/eWuxtxvyw7ypVl66tRdOtfhmZENfDfIKfCYMiEnzMsLy9h+ZuQ3w0SS?=
 =?us-ascii?Q?i9KYsCRuKVIX37w+2ujRU4jYB7M8uJIyNh3Yyk0Qs9+F7590AfDQMWXAK5Ue?=
 =?us-ascii?Q?QEXc5nGhMBOLKERiFrOha2LRFFqgdqZY8fczvKU7B9hE/SWoFJ05wlSUiJdN?=
 =?us-ascii?Q?sXPOhncwgy5S7OiuIOtlQzAQgAxag5kXKuSE8FKjlHZ/xhgaT2X2vwlgdljB?=
 =?us-ascii?Q?7joalr2Bu1ynMj7R6dgZ6qy4+D2juOnXlBJL+zWhwPCfFwU59WeXcdUyFkN7?=
 =?us-ascii?Q?SbsZBpb6IECifcaceyVNbj/NYkteuAl9bC/bjPBMu/xZKtwSoG2mfKZk4EW4?=
 =?us-ascii?Q?hBpSIPOwWrVnjSw/RdaLAop9gN6Lc2P6FlG8cSIS9/gfjkm8ZASidY6l2bor?=
 =?us-ascii?Q?RTMLVd1AfsqiTqPjGj4eZ5G1gy9CAMe+CigNsNh61jM6do+COsTCJ4pBe6yA?=
 =?us-ascii?Q?Sqo/bWcufWPOxKQoh6WNQZPBHV2VgjWs2IC0fImV+CSysPVViIZoPJYqFPEA?=
 =?us-ascii?Q?DWreS9DKBXOhY0W3kCojVKZmQe3dBFmib9qMZZP1wHusH+yTP8KcAPeX8OMG?=
 =?us-ascii?Q?IcHKkTjDZHLM9nHfjTV0tFylWHs+3Oa4PofxAqXVuj3/Ob1FbuKLH0bxYF3i?=
 =?us-ascii?Q?Rs0lxr7wVz4jsl3M0hy/MrosaChijPtHHwCWul/j960YSV3OGq5vCGh0UHiJ?=
 =?us-ascii?Q?XGJQJSuTzyR11FAjdwFeKFRbCjqXGfIQ5TXkLM/sYparQqVGrtI1IyuwXaHk?=
 =?us-ascii?Q?1B+ENuNOmI1/E2dvM3nClZM5HqBmQwdIG1ew61id95GUlntPsoeyUlK5DMeC?=
 =?us-ascii?Q?m2cQUP2r32ollqeIS/1RhaeuH+rlywFWUiGzi3efzUmP/0lehJgiZOp5iYFa?=
 =?us-ascii?Q?rXbjlQMJgN6a2VglonlEM7OhjTeG6AfNmYnX2TUDp4gFn9x+HrIC+LRsCkqX?=
 =?us-ascii?Q?gkWJqJ4CSgRl5LQC9ksRvEajE4FDyDOQTD5mRMqaw69bJi7MHbA3Bd+6IOvF?=
 =?us-ascii?Q?JRZ3TSFwarbJzxYc/rqXgJg4Q46i7ReZqv4OxHcPrP6MFl4mjIRDHMBb+YeK?=
 =?us-ascii?Q?Qq3s6o+dntroUVYbESkF/amXM62cVg524KPQxAgqtaCQzJXQhzIC+v8qHxPN?=
 =?us-ascii?Q?MtcPt/ZmjEkqeI7b0efmLPP4w0/Q3NPsmud2szhlddLe7t6ndxgwnY/+qaFc?=
 =?us-ascii?Q?EMo6w9dFA00h+wnZUKhaBUlPAdc8qOlSxpFDPR6PM1aMU9At4Q1Dyr1F2xce?=
 =?us-ascii?Q?Uz9HaNZGLpDRcuTUq8vbZMVOO2VWf75Uy8CZ6CzpGeMYwMYXOr4nK7xBG4KE?=
 =?us-ascii?Q?MAZkTWiH/ght1w06pwg=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:34:32.2651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b4162a-f597-4bdf-f324-08de477e417c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6541

From: Jai Luthra <jai.luthra@ideasonboard.com>

Add support for runtime power-management to enable powering off the
shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
the device(s) are not in use.

When powering off the IP, the PSI-L endpoint loses the paired DMA
channels. Thus we have to release the DMA channels at runtime suspend
and request them again at resume.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/Kconfig             |  1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 59 +++++++++++++++----
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index 3bc4aa35887e6..a808063e24779 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -70,6 +70,7 @@ config VIDEO_TI_J721E_CSI2RX
 	depends on VIDEO_CADENCE_CSI2RX
 	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
 	depends on ARCH_K3 || COMPILE_TEST
+	depends on PM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 3922bd67e78da..72da58738e16e 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 
 #include <media/cadence/cdns-csi2rx.h>
@@ -964,12 +965,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	unsigned long flags;
 	int ret = 0;
 
+	ret = pm_runtime_resume_and_get(csi->dev);
+	if (ret)
+		return ret;
+
 	spin_lock_irqsave(&dma->lock, flags);
 	if (list_empty(&dma->queue))
 		ret = -EIO;
 	spin_unlock_irqrestore(&dma->lock, flags);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
 	if (ret)
@@ -991,6 +996,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put(csi->dev);
+
 	return ret;
 }
 
@@ -1022,6 +1029,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	ti_csi2rx_stop_dma(ctx);
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
+	pm_runtime_put(csi->dev);
 }
 
 static const struct vb2_ops csi_vb2_qops = {
@@ -1263,7 +1271,6 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
 
 static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
 {
-	dma_release_channel(ctx->dma.chan);
 	vb2_queue_release(&ctx->vidq);
 
 	video_unregister_device(&ctx->vdev);
@@ -1283,7 +1290,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_ctx *ctx)
 	q->ops = &csi_vb2_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->dev = dmaengine_get_dma_device(ctx->dma.chan);
+	q->dev = ctx->csi->dev;
 	q->lock = &ctx->mutex;
 	q->min_queued_buffers = 1;
 	q->allow_cache_hints = 1;
@@ -1497,21 +1504,46 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 	spin_lock_init(&ctx->dma.lock);
 	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
 
-	ret = ti_csi2rx_init_dma(ctx);
+	ret = ti_csi2rx_init_vb2q(ctx);
 	if (ret)
 		return ret;
 
-	ret = ti_csi2rx_init_vb2q(ctx);
-	if (ret)
-		goto cleanup_dma;
+	return 0;
+}
+
+static int ti_csi2rx_runtime_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	int i;
+
+	if (csi->enable_count != 0)
+		return -EBUSY;
+
+	for (i = 0; i < csi->num_ctx; i++)
+		dma_release_channel(csi->ctx[i].dma.chan);
 
 	return 0;
+}
 
-cleanup_dma:
-	dma_release_channel(ctx->dma.chan);
-	return ret;
+static int ti_csi2rx_runtime_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	unsigned int ret, i;
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ret = ti_csi2rx_init_dma(&csi->ctx[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
+static const struct dev_pm_ops ti_csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
+		       NULL)
+};
+
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1569,6 +1601,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 			goto err_ctx;
 	}
 
+	pm_runtime_enable(csi->dev);
+
 	ret = ti_csi2rx_notifier_register(csi);
 	if (ret)
 		goto err_ctx;
@@ -1601,6 +1635,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		pm_runtime_set_suspended(&pdev->dev);
+
 	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
@@ -1609,6 +1646,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id ti_csi2rx_of_match[] = {
@@ -1623,6 +1661,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
+		.pm		= &ti_csi2rx_pm_ops,
 	},
 };
 
-- 
2.34.1


