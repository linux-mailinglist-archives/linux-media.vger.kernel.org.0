Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FB035C55E
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240624AbhDLLgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240584AbhDLLgB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:36:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CE7C061574
        for <linux-media@vger.kernel.org>; Mon, 12 Apr 2021 04:35:43 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A4335A9;
        Mon, 12 Apr 2021 13:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227342;
        bh=FCVV8zZTrtmBkxW8rgRb1/Yl+82dlfDdoGxT1pAxrz0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hzJz/u1gNJjzFJp18ohd5Hef0F4wk/0/9+EbCygxDBDoK8zWWBvyWDb9YMtBuaU/J
         7a9AUalEScOuE5BIHN/Wk7TU1poOIAdFWIW7K+W5dVDNtaWKRtkBFpV+g7OUTjsKYU
         8vwBgNJnn2Q+UCUsSOatVXKUTcTotz+APDXT8m8Q=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 28/28] media: ti-vpe: cal: support 8 DMA contexts
Date:   Mon, 12 Apr 2021 14:34:57 +0300
Message-Id: <20210412113457.328012-29-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
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
---
 drivers/media/platform/ti-vpe/cal.c | 38 ++++++++++++-----------------
 drivers/media/platform/ti-vpe/cal.h |  5 ++--
 2 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 91d2139adc9b..781fb14f4c7a 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -657,7 +657,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		cal_write(cal, CAL_HL_IRQSTATUS(1), status);
 
-		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
+		for (i = 0; i < cal->num_contexts; ++i) {
 			if (status & CAL_HL_IRQ_WDMA_END_MASK(i))
 				cal_irq_wdma_end(cal->ctx[i]);
 		}
@@ -671,7 +671,7 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 		/* Clear Interrupt status */
 		cal_write(cal, CAL_HL_IRQSTATUS(2), status);
 
-		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
+		for (i = 0; i < cal->num_contexts; ++i) {
 			if (status & CAL_HL_IRQ_WDMA_START_MASK(i))
 				cal_irq_wdma_start(cal->ctx[i]);
 		}
@@ -741,10 +741,8 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
 	unsigned int i;
 	int ret = 0;
 
-	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-		if (cal->ctx[i])
-			cal_ctx_v4l2_register(cal->ctx[i]);
-	}
+	for (i = 0; i < cal->num_contexts; ++i)
+		cal_ctx_v4l2_register(cal->ctx[i]);
 
 	if (cal_mc_api)
 		ret = v4l2_device_register_subdev_nodes(&cal->v4l2_dev);
@@ -846,10 +844,8 @@ static void cal_media_unregister(struct cal_dev *cal)
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
@@ -896,10 +892,8 @@ static void cal_media_cleanup(struct cal_dev *cal)
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
@@ -1048,7 +1042,6 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
 static int cal_probe(struct platform_device *pdev)
 {
 	struct cal_dev *cal;
-	struct cal_ctx *ctx;
 	bool connected = false;
 	unsigned int i;
 	int ret;
@@ -1132,12 +1125,14 @@ static int cal_probe(struct platform_device *pdev)
 		if (!cal->phy[i]->source_node)
 			continue;
 
-		cal->ctx[i] = cal_ctx_create(cal, i);
-		if (!cal->ctx[i]) {
-			cal_err(cal, "Failed to create context %u\n", i);
+		cal->ctx[cal->num_contexts] = cal_ctx_create(cal, i);
+		if (!cal->ctx[cal->num_contexts]) {
+			cal_err(cal, "Failed to create context %u\n", cal->num_contexts);
 			ret = -ENODEV;
 			goto error_context;
 		}
+
+		cal->num_contexts++;
 	}
 
 	/* Register the media device. */
@@ -1148,11 +1143,8 @@ static int cal_probe(struct platform_device *pdev)
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
index 7f35ad5ceac2..783876d7cf40 100644
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

