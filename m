Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865871F8B9C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbgFOABO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728169AbgFOABM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:12 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 820B42151;
        Mon, 15 Jun 2020 02:00:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179234;
        bh=hJOAOEQFNGRzs/zRBqK9NsC5+W6DCFR76VXphpsiuKU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sgdHcqRkM8fWeEi/gCxkS29uT2qYxf0F12eao8O5lf9nd7+9g63npusxSEASGjqWE
         tNUrV6ybqtWnIqXF+q8Jgp0/0GumfR/6RMyCTLsBFVTSAGK/h+BZ5PzUuXAzRQqj4W
         ZHCzPgx+IxQkxnyDRjwznkf7H4T0hBUBGYjwIIMY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 052/107] media: ti-vpe: cal: Move v4l2_device from cal_ctx to cal_dev
Date:   Mon, 15 Jun 2020 02:58:49 +0300
Message-Id: <20200614235944.17716-53-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_device structure is meant to represent the whole device. In the
CAL case, this corresponds to the CAL, the CAMERARX instances and the
connected sensors. There should thus be a single v4l2_device instance.
Replace the per-context instance with a global instance in the cal_dev
structure.

Don't set the v4l2_device name manually as v4l2_device_register() sets
it to a value that is suitable for the driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 44 ++++++++++++++---------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 60eb5e6de2b6..754f5af82ef6 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -289,13 +289,14 @@ struct cal_dev {
 	struct cal_camerarx	*phy[CAL_NUM_CSI2_PORTS];
 
 	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
+
+	struct v4l2_device	v4l2_dev;
 };
 
 /*
  * There is one cal_ctx structure for each camera core context.
  */
 struct cal_ctx {
-	struct v4l2_device	v4l2_dev;
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct video_device	vdev;
 	struct v4l2_async_notifier notifier;
@@ -1896,7 +1897,7 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 
 	vfd = &ctx->vdev;
 	*vfd = cal_videodev;
-	vfd->v4l2_dev = &ctx->v4l2_dev;
+	vfd->v4l2_dev = &ctx->cal->v4l2_dev;
 	vfd->queue = q;
 
 	/* Initialize the control handler. */
@@ -2085,7 +2086,7 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 	}
 
 	ctx->notifier.ops = &cal_async_ops;
-	ret = v4l2_async_notifier_register(&ctx->v4l2_dev,
+	ret = v4l2_async_notifier_register(&ctx->cal->v4l2_dev,
 					   &ctx->notifier);
 	if (ret) {
 		ctx_err(ctx, "Error registering async notifier\n");
@@ -2119,12 +2120,6 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	/* save the cal_dev * for future ref */
 	ctx->cal = cal;
 
-	snprintf(ctx->v4l2_dev.name, sizeof(ctx->v4l2_dev.name),
-		 "%s-%03d", CAL_MODULE_NAME, inst);
-	ret = v4l2_device_register(&cal->pdev->dev, &ctx->v4l2_dev);
-	if (ret)
-		return NULL;
-
 	/* Make sure Camera Core H/W register area is available */
 	ctx->phy = cal->phy[inst];
 
@@ -2133,15 +2128,10 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ctx->cport = inst;
 
 	ret = of_cal_create_instance(ctx, inst);
-	if (ret) {
-		ret = -EINVAL;
-		goto unreg_dev;
-	}
+	if (ret)
+		return NULL;
+
 	return ctx;
-
-unreg_dev:
-	v4l2_device_unregister(&ctx->v4l2_dev);
-	return NULL;
 }
 
 static const struct of_device_id cal_of_match[] = {
@@ -2242,13 +2232,21 @@ static int cal_probe(struct platform_device *pdev)
 			return PTR_ERR(cal->phy[i]);
 	}
 
+	/* Register the V4L2 device. */
+	ret = v4l2_device_register(&pdev->dev, &cal->v4l2_dev);
+	if (ret) {
+		cal_err(cal, "Failed to register V4L2 device\n");
+		return ret;
+	}
+
 	/* Create contexts. */
 	for (i = 0; i < cal_data_get_num_csi2_phy(cal); ++i)
 		cal->ctx[i] = cal_ctx_create(cal, i);
 
 	if (!cal->ctx[0] && !cal->ctx[1]) {
 		cal_err(cal, "Neither port is configured, no point in staying up\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto error_v4l2;
 	}
 
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
@@ -2257,14 +2255,14 @@ static int cal_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret)
-		goto runtime_disable;
+		goto error_pm_runtime;
 
 	cal_get_hwinfo(cal);
 	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 
-runtime_disable:
+error_pm_runtime:
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
@@ -2274,10 +2272,11 @@ static int cal_probe(struct platform_device *pdev)
 			v4l2_async_notifier_unregister(&ctx->notifier);
 			v4l2_async_notifier_cleanup(&ctx->notifier);
 			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-			v4l2_device_unregister(&ctx->v4l2_dev);
 		}
 	}
 
+error_v4l2:
+	v4l2_device_unregister(&cal->v4l2_dev);
 	return ret;
 }
 
@@ -2300,11 +2299,12 @@ static int cal_remove(struct platform_device *pdev)
 			v4l2_async_notifier_unregister(&ctx->notifier);
 			v4l2_async_notifier_cleanup(&ctx->notifier);
 			v4l2_ctrl_handler_free(&ctx->ctrl_handler);
-			v4l2_device_unregister(&ctx->v4l2_dev);
 			video_unregister_device(&ctx->vdev);
 		}
 	}
 
+	v4l2_device_unregister(&cal->v4l2_dev);
+
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-- 
Regards,

Laurent Pinchart

