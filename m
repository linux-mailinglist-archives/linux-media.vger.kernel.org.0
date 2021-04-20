Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E31E365879
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbhDTMGE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:06:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbhDTMGD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:06:03 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 329CF120C;
        Tue, 20 Apr 2021 14:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920330;
        bh=wo6k2+e1ysEKVq4iD8tElxuoWTEROUqtd3CxKV7au7c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mkuHkp5XN4tLUtfaJndbzn0/gBMAMwGWHj4fTC13SMtPaLnYj+iQ5e98tyLJhIj/t
         JdvdR/H+sy9QuxXj6xkm64mFWHY32fRldZVXOsAjSKfzsQxnw6hrZCQJq3JWDG8mCG
         uVRUOFjlbfkHqRdIetXb96DpA8cDLqyVjIXVj404=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 28/35] media: ti-vpe: cal: support 8 DMA contexts
Date:   Tue, 20 Apr 2021 15:04:26 +0300
Message-Id: <20210420120433.902394-29-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current driver only ever needs 2 DMA contexts (one per PHY), but we
need to use more of the 8 contexts to add support for multiple streams.

Change the code so that we allocate DMA contexts as needed, which at
this time is 1 per PHY, but could be up to 8.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 31 ++++++++++-------------------
 drivers/media/platform/ti-vpe/cal.h |  5 +++--
 2 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9e051c2e84a9..d43972c392fc 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -658,7 +658,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		cal_write(cal, CAL_HL_IRQSTATUS(1), status);
 
-		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
+		for (i = 0; i < cal->num_contexts; ++i) {
 			if (status & CAL_HL_IRQ_WDMA_END_MASK(i))
 				cal_irq_wdma_end(cal->ctx[i]);
 		}
@@ -672,7 +672,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		cal_write(cal, CAL_HL_IRQSTATUS(2), status);
 
-		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
+		for (i = 0; i < cal->num_contexts; ++i) {
 			if (status & CAL_HL_IRQ_WDMA_START_MASK(i))
 				cal_irq_wdma_start(cal->ctx[i]);
 		}
@@ -742,10 +742,7 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	unsigned int i;
 	int ret = 0;
 
-	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-		if (!cal->ctx[i])
-			continue;
-
+	for (i = 0; i < cal->num_contexts; ++i) {
 		ret = cal_ctx_v4l2_register(cal->ctx[i]);
 		if (ret)
 			return ret;
@@ -851,10 +848,8 @@ static void cal_media_unregister(struct cal_dev *cal)
 	unsigned int i;
 
 	/* Unregister all the V4L2 video devices. */
-	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
-		if (cal->ctx[i])
-			cal_ctx_v4l2_unregister(cal->ctx[i]);
-	}
+	for (i = 0; i < cal->num_contexts; i++)
+		cal_ctx_v4l2_unregister(cal->ctx[i]);
 
 	cal_async_notifier_unregister(cal);
 	media_device_unregister(&cal->mdev);
@@ -901,10 +896,8 @@ static void cal_media_cleanup(struct cal_dev *cal)
 {
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
-		if (cal->ctx[i])
-			cal_ctx_v4l2_cleanup(cal->ctx[i]);
-	}
+	for (i = 0; i < cal->num_contexts; i++)
+		cal_ctx_v4l2_cleanup(cal->ctx[i]);
 
 	v4l2_device_unregister(&cal->v4l2_dev);
 	media_device_cleanup(&cal->mdev);
@@ -1053,7 +1046,6 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
 static int cal_probe(struct platform_device *pdev)
 {
 	struct cal_dev *cal;
-	struct cal_ctx *ctx;
 	bool connected = false;
 	unsigned int i;
 	int ret;
@@ -1143,6 +1135,8 @@ static int cal_probe(struct platform_device *pdev)
 			ret = -ENODEV;
 			goto error_context;
 		}
+
+		cal->num_contexts++;
 	}
 
 	/* Register the media device. */
@@ -1153,11 +1147,8 @@ static int cal_probe(struct platform_device *pdev)
 	return 0;
 
 error_context:
-	for (i = 0; i < ARRAY_SIZE(cal->ctx); i++) {
-		ctx = cal->ctx[i];
-		if (ctx)
-			cal_ctx_v4l2_cleanup(ctx);
-	}
+	for (i = 0; i < cal->num_contexts; i++)
+		cal_ctx_v4l2_cleanup(cal->ctx[i]);
 
 error_camerarx:
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 7d9a2d697fc4..400f95485d7c 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -29,7 +29,7 @@
 #include <media/videobuf2-v4l2.h>
 
 #define CAL_MODULE_NAME			"cal"
-#define CAL_NUM_CONTEXT			2
+#define CAL_MAX_NUM_CONTEXT		8
 #define CAL_NUM_CSI2_PORTS		2
 
 /*
@@ -182,7 +182,8 @@ struct cal_dev {
 	/* Camera Core Module handle */
 	struct cal_camerarx	*phy[CAL_NUM_CSI2_PORTS];
 
-	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
+	u32 num_contexts;
+	struct cal_ctx		*ctx[CAL_MAX_NUM_CONTEXT];
 
 	struct media_device	mdev;
 	struct v4l2_device	v4l2_dev;
-- 
2.25.1

