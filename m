Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B573A65D6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbhFNLmi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:42:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234589AbhFNLld (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:41:33 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39A775EB7;
        Mon, 14 Jun 2021 13:24:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669854;
        bh=LCtQaPSRcW5Bmem5dPWOCECH0uiNFCM42caGqqoLBwU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HfY0Usmlh5WH65x0pWuTn99FO/voouB4GEFPu4i1OuwJDndiueZeyMheR7L9H4PmL
         JTNTgX6p0Cd71i9EKXVcp96RLdSQE04eqxjKCQ1Ydksgr/EaqoK7BB0/hyb1FBzy4w
         DlP5/7CIXcASuVuRiiaKQrNuZ3/7o3pSZlvyW8fQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 28/35] media: ti-vpe: cal: support 8 DMA contexts
Date:   Mon, 14 Jun 2021 14:23:38 +0300
Message-Id: <20210614112345.2032435-29-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
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
index 3a836813eda8..ec8ffc8d5721 100644
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
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-		if (!cal->ctx[i])
-			continue;
-
+	for (i = 0; i < cal->num_contexts; ++i) {
 		ret = cal_ctx_v4l2_register(cal->ctx[i]);
 		if (ret)
 			goto err_ctx_unreg;
@@ -865,10 +862,8 @@ static void cal_media_unregister(struct cal_dev *cal)
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
@@ -915,10 +910,8 @@ static void cal_media_cleanup(struct cal_dev *cal)
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
@@ -1067,7 +1060,6 @@ static int cal_init_camerarx_regmap(struct cal_dev *cal)
 static int cal_probe(struct platform_device *pdev)
 {
 	struct cal_dev *cal;
-	struct cal_ctx *ctx;
 	bool connected = false;
 	unsigned int i;
 	int ret;
@@ -1157,6 +1149,8 @@ static int cal_probe(struct platform_device *pdev)
 			ret = -ENODEV;
 			goto error_context;
 		}
+
+		cal->num_contexts++;
 	}
 
 	/* Register the media device. */
@@ -1167,11 +1161,8 @@ static int cal_probe(struct platform_device *pdev)
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

