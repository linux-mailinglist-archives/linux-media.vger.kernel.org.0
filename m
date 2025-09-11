Return-Path: <linux-media+bounces-42304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9056CB52E92
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DB2E5A2E50
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A3A320CB4;
	Thu, 11 Sep 2025 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZvzVwytd"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2200B320A10;
	Thu, 11 Sep 2025 10:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757586641; cv=none; b=AAWEu3Ar9cJmoiaT25rq4RoIzUNsv5zCQAKz1VFlndtljVCVmR6MbBlaUFHleKxhXqv9bSYTUi+0EosFQFUn5xgY2sFc5K252KrOQXaEixzEXjLBkwVDb2+y/Fp70JvkTxJv+/pBpX6ZDFYGPmYTvBImfS7lEsruxGeqagwAsdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757586641; c=relaxed/simple;
	bh=bwChe9M04wi2DKcHP8P+Zpd3slwllET4L7DjRo99g4s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bpBQHySle8L2IeBdRKXA3E3OSdM8xrHVsqmuWBVRAc2b+Jp5TnkHfxetbNpTsklLHaPeLiuKkZxnWwa2h1qXBFfyAbFJzLnJlSp3x4y0dx8OZaCp2Xt/lTrYQjPXC1c8InKyMr10ZjHB7z9FhZNo9melX2fCyJNz0U+1yCjROHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZvzVwytd; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BAUPJq356058;
	Thu, 11 Sep 2025 05:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757586625;
	bh=enCFKc6uvm/ChuS8244VOlhvp3e6MaYSiMhrUaGKduQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZvzVwytdRNrI+OQpVdMUxhBVyoqoasUiLuelqTTXAKa2siyBf2x7wTJpp9Lxnbk5h
	 tjBobwgU9ZCP69636afrqORg5LF3ifMmk641XBYAUMjmMS5ZIM79H1mI32g2nSVA9W
	 tTU74vdI3NJZwuOpBpEeN05MktQvFZTek5/DF+u4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BAUP0N1877216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 05:30:25 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 05:30:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 05:30:25 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BASXbt1985821;
	Thu, 11 Sep 2025 05:30:18 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
        <mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
        <s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <p.zabel@pengutronix.de>,
        <conor+dt@kernel.org>, <sakari.ailus@linux.intel.com>,
        <hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
        <jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
        <jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
        <hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v7 15/16] media: ti: j721e-csi2rx: Support runtime suspend
Date: Thu, 11 Sep 2025 15:58:31 +0530
Message-ID: <20250911102832.1583440-16-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911102832.1583440-1-r-donadkar@ti.com>
References: <20250911102832.1583440-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

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
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/Kconfig             |  1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 55 ++++++++++++++++++-
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index 3bc4aa35887e..a808063e2477 100644
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
index 69d091cdd05f..7a6e9a9d6c19 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 
 #include <media/cadence/cdns-csi2rx.h>
@@ -963,12 +964,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
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
@@ -1024,6 +1029,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put(csi->dev);
+
 	return ret;
 }
 
@@ -1055,6 +1062,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	ti_csi2rx_stop_dma(ctx);
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
+	pm_runtime_put(csi->dev);
 }
 
 static const struct vb2_ops csi_vb2_qops = {
@@ -1263,7 +1271,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
 
 static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
 {
-	dma_release_channel(ctx->dma.chan);
+	if (!pm_runtime_status_suspended(ctx->csi->dev))
+		dma_release_channel(ctx->dma.chan);
+
 	vb2_queue_release(&ctx->vidq);
 
 	video_unregister_device(&ctx->vdev);
@@ -1519,6 +1529,39 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 	return ret;
 }
 
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
+
+	return 0;
+}
+
+static int ti_csi2rx_runtime_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	int ret, i;
+
+	for (i = 0; i < csi->num_ctx; i++) {
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
@@ -1586,6 +1629,10 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		goto err_notifier;
 	}
 
+	pm_runtime_set_active(csi->dev);
+	pm_runtime_enable(csi->dev);
+	pm_request_idle(csi->dev);
+
 	return 0;
 
 err_notifier:
@@ -1616,6 +1663,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+
 }
 
 static const struct of_device_id ti_csi2rx_of_match[] = {
@@ -1630,6 +1680,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
+		.pm		= &ti_csi2rx_pm_ops,
 	},
 };
 
-- 
2.34.1


