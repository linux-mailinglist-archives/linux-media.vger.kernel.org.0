Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C1C215EB6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbgGFSih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729973AbgGFSig (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:36 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC2A718EE;
        Mon,  6 Jul 2020 20:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060693;
        bh=IAg5zeMSneeCDTiuil0YWYAjK3DFWzClhiWiXmK1ENs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sDZs0YE8BsyrZ0jBtWsWm9mpSCXKW8omRXXnN0G7QdjsMEgkqYSk/Lr7KN06+cq5Z
         c9T7CVUuSX1cTtUAbcbYDPCu2tuDXvJxhqSBt6RmkMLaxsy60tzbpnRyos2Ai0rbAe
         IrM/sh+zhq6iHeYd1HeIZNZ5Y7ElxFH1m/Q+z8oA=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 069/108] media: ti-vpe: cal: Split media initialization and cleanup to functions
Date:   Mon,  6 Jul 2020 21:36:30 +0300
Message-Id: <20200706183709.12238-70-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create four functions to handle initialization, cleanup, registration
and unregistration of the V4L2 (and soon media controller) objects:

- init() is meant to be called early at probe time to initialize the
  objects, before they get used from within the kernel

- cleanup() is the counterpart of init, and is meant to be called at the
  end of the remove sequence to free all objects

- register() is meant to be called at the end of the probe sequence, to
  register the userspace-facing devices

- unregister() is the counterpart of register, and is meant to be called
  at the beginning for the remove sequence, to disallow access from
  userspace

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Typo fix in commit message
---
 drivers/media/platform/ti-vpe/cal.c | 116 +++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 617b17133071..340cbf385d42 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2213,6 +2213,88 @@ static void cal_async_notifier_unregister(struct cal_dev *cal)
 	v4l2_async_notifier_cleanup(&cal->notifier);
 }
 
+/* ------------------------------------------------------------------
+ *	Media and V4L2 device handling
+ * ------------------------------------------------------------------
+ */
+
+/*
+ * Register user-facing devices. To be called at the end of the probe function
+ * when all resources are initialized and ready.
+ */
+static int cal_media_register(struct cal_dev *cal)
+{
+	int ret;
+
+	/*
+	 * Register the async notifier. This may trigger registration of the
+	 * V4L2 video devices if all subdevs are ready.
+	 */
+	ret = cal_async_notifier_register(cal);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Unregister the user-facing devices, but don't free memory yet. To be called
+ * at the beginning of the remove function, to disallow access from userspace.
+ */
+static void cal_media_unregister(struct cal_dev *cal)
+{
+	unsigned int i;
+
+	/* Unregister all the V4L2 video devices. */
+	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
+		if (cal->ctx[i])
+			cal_ctx_v4l2_unregister(cal->ctx[i]);
+	}
+
+	cal_async_notifier_unregister(cal);
+}
+
+/*
+ * Initialize the in-kernel objects. To be called at the beginning of the probe
+ * function, before the V4L2 device is used by the driver.
+ */
+static int cal_media_init(struct cal_dev *cal)
+{
+	int ret;
+
+	/*
+	 * Initialize the V4L2 device (despite the function name, this performs
+	 * initialization, not registration).
+	 */
+	ret = v4l2_device_register(&cal->pdev->dev, &cal->v4l2_dev);
+	if (ret) {
+		cal_err(cal, "Failed to register V4L2 device\n");
+		return ret;
+	}
+
+	vb2_dma_contig_set_max_seg_size(&cal->pdev->dev, DMA_BIT_MASK(32));
+
+	return 0;
+}
+
+/*
+ * Cleanup the in-kernel objects, freeing memory. To be called at the very end
+ * of the remove sequence, when nothing (including userspace) can access the
+ * objects anymore.
+ */
+static void cal_media_cleanup(struct cal_dev *cal)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
+		if (cal->ctx[i])
+			cal_ctx_v4l2_cleanup(cal->ctx[i]);
+	}
+
+	v4l2_device_unregister(&cal->v4l2_dev);
+	vb2_dma_contig_clear_max_seg_size(&cal->pdev->dev);
+}
+
 /* ------------------------------------------------------------------
  *	Initialization and module stuff
  * ------------------------------------------------------------------
@@ -2345,12 +2427,10 @@ static int cal_probe(struct platform_device *pdev)
 		goto error_camerarx;
 	}
 
-	/* Register the V4L2 device. */
-	ret = v4l2_device_register(&pdev->dev, &cal->v4l2_dev);
-	if (ret) {
-		cal_err(cal, "Failed to register V4L2 device\n");
+	/* Initialize the media device. */
+	ret = cal_media_init(cal);
+	if (ret < 0)
 		goto error_camerarx;
-	}
 
 	/* Create contexts. */
 	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
@@ -2365,8 +2445,6 @@ static int cal_probe(struct platform_device *pdev)
 		}
 	}
 
-	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
-
 	/* Read the revision and hardware info to verify hardware access. */
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_get_sync(&pdev->dev);
@@ -2376,16 +2454,14 @@ static int cal_probe(struct platform_device *pdev)
 	cal_get_hwinfo(cal);
 	pm_runtime_put_sync(&pdev->dev);
 
-	/* Register the async notifier. */
-	ret = cal_async_notifier_register(cal);
+	/* Register the media device. */
+	ret = cal_media_register(cal);
 	if (ret)
 		goto error_pm_runtime;
 
 	return 0;
 
 error_pm_runtime:
-	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
-
 	pm_runtime_disable(&pdev->dev);
 
 error_context:
@@ -2395,7 +2471,7 @@ static int cal_probe(struct platform_device *pdev)
 			cal_ctx_v4l2_cleanup(ctx);
 	}
 
-	v4l2_device_unregister(&cal->v4l2_dev);
+	cal_media_cleanup(cal);
 
 error_camerarx:
 	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
@@ -2413,24 +2489,14 @@ static int cal_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&pdev->dev);
 
-	cal_async_notifier_unregister(cal);
-
-	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
-		if (cal->ctx[i])
-			cal_ctx_v4l2_unregister(cal->ctx[i]);
-	}
+	cal_media_unregister(cal);
 
 	for (i = 0; i < ARRAY_SIZE(cal->phy); i++) {
 		if (cal->phy[i])
 			cal_camerarx_disable(cal->phy[i]);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
-		if (cal->ctx[i])
-			cal_ctx_v4l2_cleanup(cal->ctx[i]);
-	}
-
-	v4l2_device_unregister(&cal->v4l2_dev);
+	cal_media_cleanup(cal);
 
 	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
 		cal_camerarx_destroy(cal->phy[i]);
@@ -2438,8 +2504,6 @@ static int cal_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

