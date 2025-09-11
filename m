Return-Path: <linux-media+bounces-42306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8FAB52EA6
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 843D73B5455
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43856315786;
	Thu, 11 Sep 2025 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TYUdA5Sl"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA58F314B90;
	Thu, 11 Sep 2025 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757586655; cv=none; b=CQQUpd0WGdNW5rodW8+m2KlOmuBARqUWDHvoyewwFIUx2y1S6VbHuHNrpVNvxJRMakYm+zwbpln8lCDMffpWEpq7cmelw/Prwf0NXKAcrg503RT3IPSJUUmxrproFNPiqo/XFtf/OwY6H/cWW4Q46FhGkQR2sqHp8wEBAcVfuC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757586655; c=relaxed/simple;
	bh=PeQcWgW+6BRifCT1bAsn59BMr7bmgL6Wn8VU5RvTy5A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saOG5oOuyfnq0mkm+ElGaSN6LNlqTJ6/53LcCnTOur+zU4HzjAir2JwmYLasAqJ+zp5bqpBuN6SR138v8oVwgS90xN2x5U8sVqH81CLDUFMTYxGSlNTnDmIFkf0l5h7UqcaI2cEaqCslOQlwVdJClog10YlMVXNVG6Q1QTqBzYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TYUdA5Sl; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BAUXk7784589;
	Thu, 11 Sep 2025 05:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757586633;
	bh=QVv8AdI4R/QwDcoR2XXlW2WKNnCARwiE4G1Ip3urWKU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TYUdA5SlfeCvwvodqf90cmwHEd9l7iltgTCL09iEG+m1HA8tOpwNyjQitub1Ox/K6
	 rtmFTGgZ57Wn+zw0OtEczFiMVqTRjfQOhcNp5QjvcovwBDJG4Xxj4clsumNBWzuPIJ
	 vpYYuuhAMnnYAjuYQxcZU/yA7Ipfn+HxDB/jzlZ0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BAUWx4433782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 05:30:32 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 05:30:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Sep 2025 05:30:32 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58BASXbu1985821;
	Thu, 11 Sep 2025 05:30:25 -0500
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
Subject: [PATCH v7 16/16] media: ti: j721e-csi2rx: Support system suspend using pm_notifier
Date: Thu, 11 Sep 2025 15:58:32 +0530
Message-ID: <20250911102832.1583440-17-r-donadkar@ti.com>
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

As this device is the "orchestrator" for the rest of the media
pipeline, we need to stop all on-going streams before system suspend and
enable them back when the system wakes up from sleep.

Using .suspend/.resume callbacks does not work, as the order of those
callbacks amongst various devices in the camera pipeline like the sensor,
FPD serdes, CSI bridge etc. is impossible to enforce, even with
device links. For example, the Cadence CSI bridge is a child device of
this device, thus we cannot create a device link with the CSI bridge as
a provider and this device as consumer. This can lead to situations
where all the dependencies for the bridge have not yet resumed when we
request the subdev to start streaming again through the .resume callback
defined in this device.

Instead here we register a notifier callback with the PM framework
which is triggered when the system is fully functional. At this point we
can cleanly stop or start the streams, because we know all other devices
and their dependencies are functional. A downside of this approach is
that the userspace is also alive (not frozen yet, or just thawed), so
the suspend notifier might complete before the userspace has completed
all ioctls, like QBUF/DQBUF/STREAMON/STREAMOFF.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 7a6e9a9d6c19..862b9a82aa71 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -132,6 +132,7 @@ struct ti_csi2rx_dev {
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
+	struct notifier_block		pm_notifier;
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -1557,6 +1558,124 @@ static int ti_csi2rx_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int ti_csi2rx_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	enum ti_csi2rx_dma_state state;
+	struct ti_csi2rx_ctx *ctx;
+	struct ti_csi2rx_dma *dma;
+	unsigned long flags = 0;
+	int i, ret = 0;
+
+	/* If device was not in use we can simply suspend */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	/*
+	 * If device is running, assert the pixel reset to cleanly stop any
+	 * on-going streams before we suspend.
+	 */
+	writel(0, csi->shim + SHIM_CNTL);
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ctx = &csi->ctx[i];
+		dma = &ctx->dma;
+
+		spin_lock_irqsave(&dma->lock, flags);
+		state = dma->state;
+		spin_unlock_irqrestore(&dma->lock, flags);
+
+		if (state != TI_CSI2RX_DMA_STOPPED) {
+			/* Disable source */
+			ret = v4l2_subdev_disable_streams(&csi->subdev,
+							  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+							  BIT(0));
+			if (ret)
+				dev_err(csi->dev, "Failed to stop subdev stream\n");
+		}
+
+		/* Stop any on-going streams */
+		writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
+
+		/* Drain DMA */
+		ti_csi2rx_drain_dma(ctx);
+
+		/* Terminate DMA */
+		ret = dmaengine_terminate_sync(ctx->dma.chan);
+		if (ret)
+			dev_err(csi->dev, "Failed to stop DMA\n");
+	}
+
+	return ret;
+}
+
+static int ti_csi2rx_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	struct ti_csi2rx_ctx *ctx;
+	struct ti_csi2rx_dma *dma;
+	struct ti_csi2rx_buffer *buf;
+	unsigned long flags = 0;
+	unsigned int reg;
+	int i, ret = 0;
+
+	/* If device was not in use, we can simply wakeup */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	/* If device was in use before, restore all the running streams */
+	reg = SHIM_CNTL_PIX_RST;
+	writel(reg, csi->shim + SHIM_CNTL);
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ctx = &csi->ctx[i];
+		dma = &ctx->dma;
+		spin_lock_irqsave(&dma->lock, flags);
+		if (dma->state != TI_CSI2RX_DMA_STOPPED) {
+			/* Re-submit all previously submitted buffers to DMA */
+			list_for_each_entry(buf, &ctx->dma.submitted, list) {
+				ti_csi2rx_start_dma(ctx, buf);
+			}
+			spin_unlock_irqrestore(&dma->lock, flags);
+
+			/* Restore stream config */
+			ti_csi2rx_setup_shim(ctx);
+
+			ret = v4l2_subdev_enable_streams(&csi->subdev,
+							 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+							 BIT(0));
+			if (ret)
+				dev_err(ctx->csi->dev, "Failed to start subdev\n");
+		} else {
+			spin_unlock_irqrestore(&dma->lock, flags);
+		}
+	}
+
+	return ret;
+}
+
+static int ti_csi2rx_pm_notifier(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct ti_csi2rx_dev *csi =
+		container_of(nb, struct ti_csi2rx_dev, pm_notifier);
+
+	switch (action) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_SUSPEND_PREPARE:
+	case PM_RESTORE_PREPARE:
+		ti_csi2rx_suspend(csi->dev);
+		break;
+	case PM_POST_SUSPEND:
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		ti_csi2rx_resume(csi->dev);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static const struct dev_pm_ops ti_csi2rx_pm_ops = {
 	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
 		       NULL)
@@ -1629,6 +1748,13 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		goto err_notifier;
 	}
 
+	csi->pm_notifier.notifier_call = ti_csi2rx_pm_notifier;
+	ret = register_pm_notifier(&csi->pm_notifier);
+	if (ret) {
+		dev_err(csi->dev, "Failed to create PM notifier: %d\n", ret);
+		goto err_notifier;
+	}
+
 	pm_runtime_set_active(csi->dev);
 	pm_runtime_enable(csi->dev);
 	pm_request_idle(csi->dev);
@@ -1659,6 +1785,8 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
+	unregister_pm_notifier(&csi->pm_notifier);
+
 	ti_csi2rx_cleanup_v4l2(csi);
 	mutex_destroy(&csi->mutex);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
-- 
2.34.1


