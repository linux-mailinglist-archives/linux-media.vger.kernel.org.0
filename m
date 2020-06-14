Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612371F8BAB
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgFOABa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728199AbgFOAB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:28 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 970A8215C;
        Mon, 15 Jun 2020 02:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179241;
        bh=rjLoTu478HddeFMwwh93Xbw6vStjXWo5yHgnbI3f8b8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hq01beqTYiLEcjNjXPvxSgNWAiGaDwM5ua0MdoJumHUa7lYrIdSi9nmSmTeUfIqRb
         l+0/56vHm3r11vcF0QCOlk183+N0wMB3l5ckMBi4p6LTWeRMK4haQAi1O1U0KdbEwY
         Xi0ojL3j60ZYa9s7fm7JOLpr1lNfEw0QfCFZNQpQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 068/107] media: ti-vpe: cal: Split media initialization and cleanup to functions
Date:   Mon, 15 Jun 2020 02:59:05 +0300
Message-Id: <20200614235944.17716-69-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Create four functions to handle initialization, cleanup, registration
and unregistration of the V4L2 (and sonn media controller) objects:

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
 drivers/media/platform/ti-vpe/cal.c | 120 +++++++++++++++++++++-------
 1 file changed, 92 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9fe8abfa1df9..6655c0051ccc 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -2202,6 +2202,88 @@ static void cal_async_notifier_unregister(struct cal_dev *cal)
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
@@ -2328,12 +2410,10 @@ static int cal_probe(struct platform_device *pdev)
 		}
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
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
@@ -2342,11 +2422,9 @@ static int cal_probe(struct platform_device *pdev)
 	if (!cal->ctx[0] && !cal->ctx[1]) {
 		cal_err(cal, "Neither port is configured, no point in staying up\n");
 		ret = -ENODEV;
-		goto error_v4l2;
+		goto error_media;
 	}
 
-	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
-
 	/* Read the revision and hardware info to verify hardware access. */
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_get_sync(&pdev->dev);
@@ -2356,16 +2434,14 @@ static int cal_probe(struct platform_device *pdev)
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
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
 		ctx = cal->ctx[i];
@@ -2373,8 +2449,8 @@ static int cal_probe(struct platform_device *pdev)
 			cal_ctx_v4l2_cleanup(ctx);
 	}
 
-error_v4l2:
-	v4l2_device_unregister(&cal->v4l2_dev);
+error_media:
+	cal_media_cleanup(cal);
 
 error_camerarx:
 	for (i = 0; i < ARRAY_SIZE(cal->phy); i++)
@@ -2392,24 +2468,14 @@ static int cal_remove(struct platform_device *pdev)
 
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
@@ -2417,8 +2483,6 @@ static int cal_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

