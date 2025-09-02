Return-Path: <linux-media+bounces-41557-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C13B3FD32
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC4FD7A9964
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 10:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2DB279DA6;
	Tue,  2 Sep 2025 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mnd+M1wZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D92F617D;
	Tue,  2 Sep 2025 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756810652; cv=none; b=bD/pBZJbtJ7dHJWYKHmWWZT1/5wxFoQwYP2b0iZwAK7ojLVs6dj/6zJ1KKD1Y624gIA1HzE83vDzNdmGgidolXMxEhxaF/yeLJtFQJTWYvf0z8uLMYaWBJcILs5lThEhN6W7/tNTkuNEx79bao8o6p8zYrKozuYXNWYPbNNbe5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756810652; c=relaxed/simple;
	bh=RuHVHnR21Q8ucDLs4WTrD09d5g8ramYRZLMjgtPRKL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vta+IXaHerbeUu8NBcrTJr1qUcACgggtD2qZqixUm8mPTtPiFW2/YnOUc1LswRh8Sx13SXekpHQ4TQ88WfZwuQbw0hO7OtbeAe9yJX1bWXiE2Q3KXW/SKXoe+/egc2BBod/lIrpOYnKsTfEb90T14Szrf0yYsSOpLFhI4Podekc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mnd+M1wZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:480e:e039:1d0b:c5ff:a9e2])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCBB978C;
	Tue,  2 Sep 2025 12:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756810581;
	bh=RuHVHnR21Q8ucDLs4WTrD09d5g8ramYRZLMjgtPRKL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mnd+M1wZ5K3sTAWXlSZFZ3UAsb90S/pwmabWTt/DM1PBb6Mlgdpcb/GZE98q6LFiz
	 A+/tTNgsupyWPhDCkIXLnHdmJxDOQP3dmEO22fAK2fuoLVAEhB5nJvBXUc1slbwTyy
	 T6pMnuN61eGjEdg1oCIV7RARG4La0FUDXjppsSdo=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 02 Sep 2025 16:26:50 +0530
Subject: [PATCH v2 2/3] media: ti: j721e-csi2rx: Support runtime suspend
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-ti_csi_pm-v2-2-59a3be199940@ideasonboard.com>
References: <20250902-ti_csi_pm-v2-0-59a3be199940@ideasonboard.com>
In-Reply-To: <20250902-ti_csi_pm-v2-0-59a3be199940@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Devarsh Thakkar <devarsht@ti.com>, Rishikesh Donadkar <r-donadkar@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4901;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=RuHVHnR21Q8ucDLs4WTrD09d5g8ramYRZLMjgtPRKL0=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBots2F3Kn5WL1RrK11Y458F88L+3IiH/S36ebux
 0eIAPKo+K6JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaLbNhQAKCRBD3pH5JJpx
 Rb1gD/9sSeyCIizmLzdyMjDbrLuf2Q3kHrqGJZfnkQZU2ENI3ayHxuNoUS4+vonH0FfrPrWR0h4
 CXCSzf6dUKMTZjHNm3xM90auEWACNFTPNfgQNwEQg2sOuTeXq5nhRrWSLGj091d+K1VbisSRQJr
 99fzhecvL4Xe+jeKwSLzAnJkTBsfnOZOlIazX0tVc3gs27j7lRc21rhRX81NDAV5mIlmCPgjplD
 EQEgZ8J5uo6odeHtXTsf3EcjojE6MQ2fjHmxqUw6xUL64y90EGDrzK4sDtelHkYHDIG8S2BbZkj
 G8y5jTaISSa8h/FtZUGvERzBqMdK6wr5cbDj/TT7gbluLAu8IElGd1u+LWSAOTJV2S1co5Ow0so
 tKYa39Q5ATvLt9g2yZv9mxDiD2P3HslZ2mCc+kFyCM9NQvzI1hF2LcYbvZyCB+Ed2X4tXEqsoMy
 mfUGscYE2j84vHNbqSLLZEVQ8dMgxlQdhODv32isgCTYNJyERvaTHq4KW0S3pYl21+ilXAofklD
 k+r2tpq3u96ADdy7mXdevEfGin7tg+s7Hoaqhpwo8k8y5hB3RLlUayViRA7niKfPa3kpPvp6uSa
 T52T3HaFPIy1My8A3RLWX0dhhKwHcggRwMnqVcU+fOMkNZlVwJd3AVU1stz6ZQMQze+LbvUFknc
 Fll5TXNDTKifHzA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add support for runtime power-management to enable powering off the
shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
the device(s) are not in use.

When powering off the IP, the PSI-L endpoint loses the paired DMA
channels. Thus we have to release the DMA channels at runtime suspend
and request them again at resume.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/media/platform/ti/Kconfig                  |  1 +
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 55 +++++++++++++++++++++-
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index 3bc4aa35887e6edc9fa8749d9956a67714c59001..a808063e24779d72b1f73a15b38c021dfb915fa0 100644
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
index 3acd01223cdd2191ba67b4efc3f84695c525624b..a5cd7885f26b2cda87e0c68833c2cc584061698e 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 
 #include <media/cadence/cdns-csi2rx.h>
@@ -988,12 +989,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
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
@@ -1049,6 +1054,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put(csi->dev);
+
 	return ret;
 }
 
@@ -1080,6 +1087,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	ti_csi2rx_stop_dma(ctx);
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
+	pm_runtime_put(csi->dev);
 }
 
 static const struct vb2_ops csi_vb2_qops = {
@@ -1288,7 +1296,9 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
 
 static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
 {
-	dma_release_channel(ctx->dma.chan);
+	if (!pm_runtime_status_suspended(ctx->csi->dev))
+		dma_release_channel(ctx->dma.chan);
+
 	vb2_queue_release(&ctx->vidq);
 
 	video_unregister_device(&ctx->vdev);
@@ -1544,6 +1554,39 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
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
@@ -1610,6 +1653,10 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		goto err_notifier;
 	}
 
+	pm_runtime_set_active(csi->dev);
+	pm_runtime_enable(csi->dev);
+	pm_request_idle(csi->dev);
+
 	return 0;
 
 err_notifier:
@@ -1640,6 +1687,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+
 }
 
 static const struct of_device_id ti_csi2rx_of_match[] = {
@@ -1654,6 +1704,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
+		.pm		= &ti_csi2rx_pm_ops,
 	},
 };
 

-- 
2.50.1


