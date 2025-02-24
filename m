Return-Path: <linux-media+bounces-26834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 591EEA42118
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 14:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51AAB18841CA
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 13:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0037524EF85;
	Mon, 24 Feb 2025 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v/cM47Gs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD69248892;
	Mon, 24 Feb 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404484; cv=none; b=ayxwbTKFGSspde8dOvSnMO3FS5PAqYEpcDlWXTq+3Nv6NViLcP/UHFPJkjGHx8H5pnV/7IIbOpXFmrKrvTqjPGXutgFEDDyizw5XDknL/JfjSAljLnw97gVtXE3Sga5X43oQSv44WLYSBv3f9uZPBqOnRQRMsWrS8Uh+/ij5JmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404484; c=relaxed/simple;
	bh=kTzLMj1TbgwqOPWA8o8pj/AbPtM7CHZiAy1qsF8VOj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=La5WksSKpjyGJNpUjx7qo2zA3G/c7TvTrTlpyCiMCMdvB1vR1xw57z2GTkby/fR6NQLgaAsHYTfOSu244L8Vschn0TtQiKgaUr3dq7I6KsM0p155fove5iCXg/XCNJkcZUz6bGJjc7XbGbSARoQzKy4UaqQ6rTTWZwlgVH96pKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=v/cM47Gs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.199])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 168B3455;
	Mon, 24 Feb 2025 14:39:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740404394;
	bh=kTzLMj1TbgwqOPWA8o8pj/AbPtM7CHZiAy1qsF8VOj8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=v/cM47Gs/aBmyEL8BiM4ZYrIVLHq3jD883I9JliaivcMCVBklxDHNjA5+9MovCU9V
	 PyPpGY+gmEwIt9sgF3G+CvCyj+B+WCQCkK6+hns8ON7VwU3qKohwB3RpZaplycd6n7
	 rzRYDYEiCbiwF0LZ2BqoOB+BN6ehHo9+bZVuZKuI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 24 Feb 2025 19:05:58 +0530
Subject: [PATCH 3/3] media: ti: j721e-csi2rx: Support system suspend using
 pm_notifier
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-ti_csi_pm-v1-3-8f8c29ef646d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5639;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=kTzLMj1TbgwqOPWA8o8pj/AbPtM7CHZiAy1qsF8VOj8=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnvHbAzc1e65XFpTHHTkJ1i4+66Zc63WaSwu5Ay
 mwu8sz3l96JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ7x2wAAKCRBD3pH5JJpx
 RRLuD/9kzSdNYRrsWsWP7sqyNPBZF5T2H9b5cVqnM3MQAvHJYZ2wiUYeF1OwRtbULIMipsxZmg4
 CxVQ2UeuCWDawgsYNgt9KqYAQ+LwjSb1SntK6wFZV4M6kOshkwoWfP2YTBHNds747GIsLLkxNaW
 eQqzg/t28etXTQ7tkPVBRsVMfhFOOzIsp9S6CUSjNmBo8oK9PXtza35OUMI9QkH1EdxJsCH0evq
 3bTbQJS4ksIcF3Kg1kr3FC3Mzp0Bc8osN5TXRke37LxQjnFyYKrWkcpnJT8QePcsJ5FT3V42DZP
 qs1GxkUypIPDvLbQmIDgzsx6fdIg2o3+3gIijMt7yNQXpoynFdTwqJYMT4iMNCM4mKcyG50OHvr
 KDDJBjh5oJW1ud9Crv78kuLEIZBt45h2RFgwgJHf2xD8GB6901VsgtUYJmq7w3CScVxNVD7o+8K
 stgHn38Y/M6ws4yBgC0M52vpk5/qu72mBgFBlvB8AKH1iAPO0JklM779tOoo/H+QhJVfnwHnsqg
 q3+VfFacCs9XSEeKXiVTmgpVUuiwdNemBjwlyjeUIybJD3EqwBxbEo20IqYeNPbb7j/kKAgHknF
 N4ZdJWPLpGOIp66nMBqJNsaM+r6Vq6YGalAo+4yJzksm4xNW/HN93czN41j7832VbUwXBPFalLi
 KQV7bA9ca+5tCSQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

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
that the userspace is also alive (not frozen yet, or just thawed), so to
prevent races from userspace ioctl calls we hold the lock for the video
device operations while we are dealing with the notifier events.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index dc15759562f94fcfc53955b455b7e03fb733e8e4..5a318b2080532882b0f0fcbde8e1c35208d198c7 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -107,6 +107,7 @@ struct ti_csi2rx_dev {
 	struct mutex			mutex; /* To serialize ioctls. */
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
+	struct notifier_block		pm_notifier;
 	u32				sequence;
 };
 
@@ -1121,6 +1122,105 @@ static int ti_csi2rx_runtime_resume(struct device *dev)
 	return ti_csi2rx_dma_request_chan(csi);
 }
 
+static int ti_csi2rx_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	enum ti_csi2rx_dma_state state;
+	struct ti_csi2rx_dma *dma = &csi->dma;
+	unsigned long flags = 0;
+	int ret = 0;
+
+	/* If device was not in use we can simply suspend */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	/* Acquire the lock used for video dev/queue operations */
+	mutex_lock(&csi->mutex);
+
+	/* Stop any on-going streams */
+	writel(0, csi->shim + SHIM_CNTL);
+	writel(0, csi->shim + SHIM_DMACNTX);
+
+	spin_lock_irqsave(&dma->lock, flags);
+	state = dma->state;
+	spin_unlock_irqrestore(&dma->lock, flags);
+
+	if (state != TI_CSI2RX_DMA_STOPPED) {
+		/* Disable source */
+		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
+		if (ret)
+			dev_err(csi->dev, "Failed to stop subdev stream\n");
+	}
+
+	/* Drain DMA */
+	ti_csi2rx_drain_dma(csi);
+
+	/* Terminate DMA */
+	ret = dmaengine_terminate_sync(csi->dma.chan);
+	if (ret)
+		dev_err(csi->dev, "Failed to stop DMA\n");
+
+	return ret;
+}
+
+static int ti_csi2rx_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	struct ti_csi2rx_dma *dma = &csi->dma;
+	struct ti_csi2rx_buffer *buf;
+	unsigned long flags = 0;
+	int ret = 0;
+
+	/* If device was not in use, we can simply wakeup */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	spin_lock_irqsave(&dma->lock, flags);
+	if (dma->state != TI_CSI2RX_DMA_STOPPED) {
+		/* Re-submit all previously submitted buffers to DMA */
+		list_for_each_entry(buf, &csi->dma.submitted, list) {
+			ti_csi2rx_start_dma(csi, buf);
+		}
+		spin_unlock_irqrestore(&dma->lock, flags);
+
+		/* Restore stream config */
+		ti_csi2rx_setup_shim(csi);
+
+		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
+		if (ret)
+			dev_err(csi->dev, "Failed to start subdev\n");
+	} else {
+		spin_unlock_irqrestore(&dma->lock, flags);
+	}
+
+	/* Release the lock used for video dev/queue operations */
+	mutex_unlock(&csi->mutex);
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
@@ -1167,6 +1267,13 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		goto err_subdev;
 	}
 
+	csi->pm_notifier.notifier_call = ti_csi2rx_pm_notifier;
+	ret = register_pm_notifier(&csi->pm_notifier);
+	if (ret) {
+		dev_err(csi->dev, "Failed to create PM notifier: %d\n", ret);
+		goto err_subdev;
+	}
+
 	pm_runtime_set_active(csi->dev);
 	pm_runtime_enable(csi->dev);
 	pm_request_idle(csi->dev);
@@ -1192,6 +1299,8 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 
 	video_unregister_device(&csi->vdev);
 
+	unregister_pm_notifier(&csi->pm_notifier);
+
 	ti_csi2rx_cleanup_vb2q(csi);
 	ti_csi2rx_cleanup_subdev(csi);
 	ti_csi2rx_cleanup_v4l2(csi);

-- 
2.48.1


