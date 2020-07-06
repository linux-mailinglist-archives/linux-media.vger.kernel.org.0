Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D35FC215ED2
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730030AbgGFSjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730024AbgGFSjJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:09 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF4A6D98;
        Mon,  6 Jul 2020 20:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060710;
        bh=cHrUImoKUuxSOAocEY5LF44cUBjb/PNK9GMYBp9KHXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vLwAkXzCjRQI/LcKskUoGkld8lD+u/Q1GLI92woU5yqTaUl7CadOwVFf5FlBwth/T
         UNzQHLaVcZQBOUEAiVW9fnMip8dC/7G/WaOBn7c72n+Srrsr1JUKk8nmSkDnPwKbcE
         IUFOKDdDHmW9C+VViYozOXEC9Hm05jd/WWl9lc2k=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 095/108] media: ti-vpe: cal: Refactor interrupt enable/disable
Date:   Mon,  6 Jul 2020 21:36:56 +0300
Message-Id: <20200706183709.12238-96-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Interrupts are enabled and disabled by the cal_camerarx_enable_irqs()
and cal_camerarx_disable_irqs(). Despite their name, they deal with all
interrupts, not just the CAMERARX interrupts, and they hardcode the
assumption that the context index is identical to the CAMERARX index.

Split the context-related interrupt management to two new functions,
cal_ctx_enable_irqs() and cal_ctx_disable_irqs(), called from the
cal_start_streaming() and cal_stop_streaming() functions. The explicit
calls to cal_camerarx_enable_irqs() and cal_camerarx_disable_irqs() are
folded with the CAMERARX .s_stream() operation to simplify the CAMERARX
API.

Enabling the OCPO error interrupt is moved to the PM runtime resume
operation, as it's global to the device, not related to a CAMERARX or
context. The VC IRQ enable and disable are removed as they're not used,
the parent interrupt bit (CAL_HL_IRQ_VC_MASK) never being set.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 83 +++++++-------------
 drivers/media/platform/ti-vpe/cal-video.c    |  6 +-
 drivers/media/platform/ti-vpe/cal.c          | 24 ++++++
 drivers/media/platform/ti-vpe/cal.h          |  4 +-
 4 files changed, 57 insertions(+), 60 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index fd37ce209461..ce46046c9ba4 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -233,6 +233,29 @@ static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
 		phy_err(phy, "Timeout waiting for stop state\n");
 }
 
+static void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
+{
+	const u32 cio_err_mask =
+		CAL_CSI2_COMPLEXIO_IRQ_LANE_ERRORS_MASK |
+		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
+		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
+		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
+
+	/* Enable CIO error IRQs. */
+	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
+		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
+		  cio_err_mask);
+}
+
+static void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
+{
+	/* Disable CIO error irqs */
+	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
+		  CAL_HL_IRQ_CIO_MASK(phy->instance));
+	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance), 0);
+}
+
 static int cal_camerarx_start(struct cal_camerarx *phy)
 {
 	s64 external_rate;
@@ -250,6 +273,8 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 		return ret;
 	}
 
+	cal_camerarx_enable_irqs(phy);
+
 	/*
 	 * CSI-2 PHY Link Initialization Sequence, according to the DRA74xP /
 	 * DRA75xP / DRA76xP / DRA77xP TRM. The DRA71x / DRA72x and the AM65x /
@@ -339,6 +364,7 @@ static int cal_camerarx_start(struct cal_camerarx *phy)
 	ret = v4l2_subdev_call(phy->sensor, video, s_stream, 1);
 	if (ret) {
 		v4l2_subdev_call(phy->sensor, core, s_power, 0);
+		cal_camerarx_disable_irqs(phy);
 		phy_err(phy, "stream on failed in subdev\n");
 		return ret;
 	}
@@ -366,6 +392,8 @@ static void cal_camerarx_stop(struct cal_camerarx *phy)
 	unsigned int i;
 	int ret;
 
+	cal_camerarx_disable_irqs(phy);
+
 	cal_camerarx_power(phy, false);
 
 	/* Assert Complex IO Reset */
@@ -427,61 +455,6 @@ void cal_camerarx_i913_errata(struct cal_camerarx *phy)
 	camerarx_write(phy, CAL_CSI2_PHY_REG10, reg10);
 }
 
-/*
- * Enable the expected IRQ sources
- */
-void cal_camerarx_enable_irqs(struct cal_camerarx *phy)
-{
-	u32 val;
-
-	const u32 cio_err_mask =
-		CAL_CSI2_COMPLEXIO_IRQ_LANE_ERRORS_MASK |
-		CAL_CSI2_COMPLEXIO_IRQ_FIFO_OVR_MASK |
-		CAL_CSI2_COMPLEXIO_IRQ_SHORT_PACKET_MASK |
-		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
-
-	/* Enable CIO error irqs */
-	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0),
-		  CAL_HL_IRQ_CIO_MASK(phy->instance));
-	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance),
-		  cio_err_mask);
-
-	/* Always enable OCPO error */
-	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
-
-	/* Enable IRQ_WDMA_END 0/1 */
-	val = 0;
-	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(1), val);
-	/* Enable IRQ_WDMA_START 0/1 */
-	val = 0;
-	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	cal_write(phy->cal, CAL_HL_IRQENABLE_SET(2), val);
-	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
-}
-
-void cal_camerarx_disable_irqs(struct cal_camerarx *phy)
-{
-	u32 val;
-
-	/* Disable CIO error irqs */
-	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(0),
-		  CAL_HL_IRQ_CIO_MASK(phy->instance));
-	cal_write(phy->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(phy->instance), 0);
-
-	/* Disable IRQ_WDMA_END 0/1 */
-	val = 0;
-	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(1), val);
-	/* Disable IRQ_WDMA_START 0/1 */
-	val = 0;
-	cal_set_field(&val, 1, CAL_HL_IRQ_MASK(phy->instance));
-	cal_write(phy->cal, CAL_HL_IRQENABLE_CLR(2), val);
-	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	cal_write(phy->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
-}
-
 void cal_camerarx_ppi_enable(struct cal_camerarx *phy)
 {
 	cal_write(phy->cal, CAL_CSI2_PPI_CTRL(phy->instance),
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index e7ad0b93fc59..3807d91f0392 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -517,8 +517,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	cal_ctx_csi2_config(ctx);
 	cal_ctx_pix_proc_config(ctx);
 	cal_ctx_wr_dma_config(ctx);
-
-	cal_camerarx_enable_irqs(ctx->phy);
+	cal_ctx_enable_irqs(ctx);
 
 	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
 	if (ret)
@@ -570,7 +569,8 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	if (dma_act)
 		ctx_err(ctx, "failed to disable dma cleanly\n");
 
-	cal_camerarx_disable_irqs(ctx->phy);
+	cal_ctx_disable_irqs(ctx);
+
 	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
 
 	/* Release all active buffers */
diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 213381b8ddfa..785ce4171d40 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -411,6 +411,24 @@ void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 	cal_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->index), dmaaddr);
 }
 
+void cal_ctx_enable_irqs(struct cal_ctx *ctx)
+{
+	/* Enable IRQ_WDMA_END and IRQ_WDMA_START. */
+	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(1),
+		  CAL_HL_IRQ_MASK(ctx->index));
+	cal_write(ctx->cal, CAL_HL_IRQENABLE_SET(2),
+		  CAL_HL_IRQ_MASK(ctx->index));
+}
+
+void cal_ctx_disable_irqs(struct cal_ctx *ctx)
+{
+	/* Disable IRQ_WDMA_END and IRQ_WDMA_START. */
+	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(1),
+		  CAL_HL_IRQ_MASK(ctx->index));
+	cal_write(ctx->cal, CAL_HL_IRQENABLE_CLR(2),
+		  CAL_HL_IRQ_MASK(ctx->index));
+}
+
 /* ------------------------------------------------------------------
  *	IRQ Handling
  * ------------------------------------------------------------------
@@ -1041,6 +1059,12 @@ static int cal_runtime_resume(struct device *dev)
 			cal_camerarx_i913_errata(cal->phy[i]);
 	}
 
+	/*
+	 * Enable global interrupts that are not related to a particular
+	 * CAMERARAX or context.
+	 */
+	cal_write(cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 998c4497496b..3b99cf928f6b 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -262,8 +262,6 @@ const struct cal_format_info *cal_format_by_code(u32 code);
 void cal_quickdump_regs(struct cal_dev *cal);
 
 void cal_camerarx_disable(struct cal_camerarx *phy);
-void cal_camerarx_enable_irqs(struct cal_camerarx *phy);
-void cal_camerarx_disable_irqs(struct cal_camerarx *phy);
 void cal_camerarx_ppi_enable(struct cal_camerarx *phy);
 void cal_camerarx_ppi_disable(struct cal_camerarx *phy);
 void cal_camerarx_i913_errata(struct cal_camerarx *phy);
@@ -275,6 +273,8 @@ void cal_ctx_csi2_config(struct cal_ctx *ctx);
 void cal_ctx_pix_proc_config(struct cal_ctx *ctx);
 void cal_ctx_wr_dma_config(struct cal_ctx *ctx);
 void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr);
+void cal_ctx_enable_irqs(struct cal_ctx *ctx);
+void cal_ctx_disable_irqs(struct cal_ctx *ctx);
 
 int cal_ctx_v4l2_register(struct cal_ctx *ctx);
 void cal_ctx_v4l2_unregister(struct cal_ctx *ctx);
-- 
Regards,

Laurent Pinchart

