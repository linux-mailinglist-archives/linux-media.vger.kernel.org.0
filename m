Return-Path: <linux-media+bounces-26833-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0399A42103
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 14:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 769F218866D0
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E241424EF6A;
	Mon, 24 Feb 2025 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PomR9QA9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B23624BBF3;
	Mon, 24 Feb 2025 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404467; cv=none; b=T5XqOc7TVh99LVCw+nwj47dbVa5E5tBTtpK6dlBYQ0MTlTbYlSxoHpOdgma3ZCzJumz05nxZZ5bNfZMI8ds49LDCFPWF7LVF1kNh610me0BhR5ZyIp1FWvNybqFFdwqc2KqjL5zhZ8PAO6neqkO/F1G8ovjgnvHscGIk3IWgcXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404467; c=relaxed/simple;
	bh=V4qAb7I4cMDuLM8U3qsvQxbc/Luxo0zWXTg0V5c+6ow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RP8inlQU9Sl4Zu9iwG/MD784cnD9a3Y4n7xkYvGvT527IuZoSy+ztGL5D46M2uvRX4Q6kxrGJPkf2QTpjgYAirbFnP4hPG2dzO4TJ8CmowH37OpgxFe7xqf/i9YCiG7MOmXcDcDg+FWktz7XC52n1TX8Gs61xStVs4UrQbCY8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PomR9QA9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.199])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6811455;
	Mon, 24 Feb 2025 14:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740404377;
	bh=V4qAb7I4cMDuLM8U3qsvQxbc/Luxo0zWXTg0V5c+6ow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PomR9QA9hGzeXo94uzeN/LN2n7hjogOa3cN0YeAUbB8ggnGeg3UeSIKe+sffQLPIY
	 JUdJlaO+I3T0i9jWKSN3xlOWxQnU33XJLfETsu/9Hr+hmw9CfPpIVcXnJjC0UcNKzz
	 v/hfyNvNZMM1rYGTTQEcf1m/C7QXiG88HBthgo94=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 24 Feb 2025 19:05:57 +0530
Subject: [PATCH 2/3] media: ti: j721e-csi2rx: Support runtime suspend
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-ti_csi_pm-v1-2-8f8c29ef646d@ideasonboard.com>
References: <20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com>
In-Reply-To: <20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6025;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=V4qAb7I4cMDuLM8U3qsvQxbc/Luxo0zWXTg0V5c+6ow=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnvHbAzDj4PokWcTa4AOHY0KiQv9Yk3G9NXUo0l
 yPKK6AGIeWJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7x2wAAKCRBD3pH5JJpx
 RVGbD/4/c9ZIALOSCIXsf0v+HA/7qai2SewgtXGHBf4kCWuQO1lYFIBoRIu15CfKVfu6sejBoca
 YRxXANppf5ZXk1YANkDPUDFO/vIvCQ3ps7+cx0QQUx3DSgJshyUxeO7ErupkBEEMPbQQPAKfrEo
 kXLHiSAZtAlSdiBzbCXBS/JNbOqQqLMMnMbu3hDj6KV++96Hvc63oSKoavSz01vzEfybXWznKDX
 xe79MsS79xH4Y5yO7Dt3CpRkCR0dYioav5W2VfJkO7zgYGe7SFxQ1ztEBZpT73sphDqusJsDCzQ
 9q2dO7liLwGEkyjWfKVmObvCASgFF4R94peUrMtYCl//5aCueYvTtIPBEIK4paaQ1N/jqtuZhLQ
 VheBtKRUeOYu4a+dbYjU4Enp2Ggd/zeSgf4bQG9iSUHyD6VPWWxLARTy9f5cXtPCl7cQBZ0pHQd
 kKvvZQgz01id/wZryd0r/OsMm80jtF/BiC2u8iT5HLFblAOekH/TCRfHrCEH+03dbCFeiMfSXiP
 /cwQNCDWzg05gBMLiHbGyULVcKMcAF1Pmn7K/1zQC0OcZFFquqQgLchVxRkMaGVy76xwPSzOO4o
 qu0dZOzbMNVDCg2EYsn/T+8db8aOtpMGzwJ4CPHagF73RaVk2ndQabJ0MrRmZhiPVr2ft5bO8wu
 mqIokv0bb6Lx8FQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add support for runtime power-management to enable powering off the
shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
the device(s) are not in use.

When powering off the IP, the PSI-L endpoint loses the paired DMA
channels. Thus we have to release the DMA channels at runtime suspend
and request them again at resume.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/Kconfig                  |  1 +
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 71 +++++++++++++++++++---
 2 files changed, 62 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index bab998c4179aca3b07372782b9be7de340cb8d45..9d06a537ca9393b6e87a7ab196d26137d4008374 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -69,6 +69,7 @@ config VIDEO_TI_J721E_CSI2RX
 	depends on MEDIA_SUPPORT && MEDIA_CONTROLLER
 	depends on (PHY_CADENCE_DPHY_RX && VIDEO_CADENCE_CSI2RX) || COMPILE_TEST
 	depends on ARCH_K3 || COMPILE_TEST
+	depends on PM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 6412a00be8eab89548950dd21b3b3ec02dafa5b4..dc15759562f94fcfc53955b455b7e03fb733e8e4 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
@@ -808,12 +809,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
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
 
 	ret = video_device_pipeline_start(&csi->vdev, &csi->pipe);
 	if (ret)
@@ -851,6 +856,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(0, csi->shim + SHIM_DMACNTX);
 err:
 	ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put(csi->dev);
+
 	return ret;
 }
 
@@ -870,6 +877,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	ti_csi2rx_stop_dma(csi);
 	ti_csi2rx_cleanup_buffers(csi, VB2_BUF_STATE_ERROR);
+	pm_runtime_put(csi->dev);
 }
 
 static const struct vb2_ops csi_vb2_qops = {
@@ -963,19 +971,13 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
 	.link_validate = ti_csi2rx_link_validate,
 };
 
-static int ti_csi2rx_init_dma(struct ti_csi2rx_dev *csi)
+static int ti_csi2rx_dma_request_chan(struct ti_csi2rx_dev *csi)
 {
 	struct dma_slave_config cfg = {
 		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
 	};
 	int ret;
 
-	INIT_LIST_HEAD(&csi->dma.queue);
-	INIT_LIST_HEAD(&csi->dma.submitted);
-	spin_lock_init(&csi->dma.lock);
-
-	csi->dma.state = TI_CSI2RX_DMA_STOPPED;
-
 	csi->dma.chan = dma_request_chan(csi->dev, "rx0");
 	if (IS_ERR(csi->dma.chan))
 		return PTR_ERR(csi->dma.chan);
@@ -983,9 +985,25 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_dev *csi)
 	ret = dmaengine_slave_config(csi->dma.chan, &cfg);
 	if (ret) {
 		dma_release_channel(csi->dma.chan);
-		return ret;
 	}
 
+	return ret;
+}
+
+static int ti_csi2rx_init_dma(struct ti_csi2rx_dev *csi)
+{
+	int ret;
+
+	INIT_LIST_HEAD(&csi->dma.queue);
+	INIT_LIST_HEAD(&csi->dma.submitted);
+	spin_lock_init(&csi->dma.lock);
+
+	csi->dma.state = TI_CSI2RX_DMA_STOPPED;
+
+	ret = ti_csi2rx_dma_request_chan(csi);
+	if (ret)
+		return ret;
+
 	csi->dma.drain.len = DRAIN_BUFFER_SIZE;
 	csi->dma.drain.vaddr = dma_alloc_coherent(csi->dev, csi->dma.drain.len,
 						  &csi->dma.drain.paddr,
@@ -1062,7 +1080,9 @@ static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_dev *csi)
 	dma_free_coherent(csi->dev, csi->dma.drain.len,
 			  csi->dma.drain.vaddr, csi->dma.drain.paddr);
 	csi->dma.drain.vaddr = NULL;
-	dma_release_channel(csi->dma.chan);
+
+	if (!pm_runtime_status_suspended(csi->dev))
+		dma_release_channel(csi->dma.chan);
 }
 
 static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
@@ -1083,6 +1103,29 @@ static void ti_csi2rx_cleanup_vb2q(struct ti_csi2rx_dev *csi)
 	vb2_queue_release(&csi->vidq);
 }
 
+static int ti_csi2rx_runtime_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+
+	/* DMA channel pairing is lost when device is powered off */
+	dma_release_channel(csi->dma.chan);
+
+	return 0;
+}
+
+static int ti_csi2rx_runtime_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+
+	/* Re-acquire DMA channel */
+	return ti_csi2rx_dma_request_chan(csi);
+}
+
+static const struct dev_pm_ops ti_csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
+		       NULL)
+};
+
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
 	struct ti_csi2rx_dev *csi;
@@ -1124,6 +1167,10 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		goto err_subdev;
 	}
 
+	pm_runtime_set_active(csi->dev);
+	pm_runtime_enable(csi->dev);
+	pm_request_idle(csi->dev);
+
 	return 0;
 
 err_subdev:
@@ -1150,6 +1197,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	ti_csi2rx_cleanup_v4l2(csi);
 	ti_csi2rx_cleanup_dma(csi);
 
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+
 	mutex_destroy(&csi->mutex);
 }
 
@@ -1165,6 +1215,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
+		.pm		= &ti_csi2rx_pm_ops,
 	},
 };
 

-- 
2.48.1


