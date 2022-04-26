Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 014BA50F1D0
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343661AbiDZHLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 03:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343794AbiDZHJh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 03:09:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9413537A39
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 00:06:30 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDB83B2A;
        Tue, 26 Apr 2022 09:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650956788;
        bh=mn7iv6DROHv1Ac43V9rCpcRP83CcRXNttYNj/CnUvWU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tSlMAeQDfp0AAb4q66zb6+dheL7CBLs/DsgGgYUOFAL8fucBENvEy6S6NkTnSNrJ8
         g/FufZTKDUDzMLxv3zpsi1N4JG0JgNZIzKoYEzX2LrpZkIizLa99A856CmRUm7sKHE
         CxXyOnpKxCLubPQ+wElWx5WRpoqT5hlQhN7sUwCI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 3/5] media: ti: cal: use CSI-2 frame number for seq number
Date:   Tue, 26 Apr 2022 10:06:16 +0300
Message-Id: <20220426070618.68536-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426070618.68536-1-tomi.valkeinen@ideasonboard.com>
References: <20220426070618.68536-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The userspace needs a way to match received metadata buffers to pixel
data buffers. The obvious way to do this is to use the CSI-2 frame
number, as both the metadata and the pixel data have the same frame
number as they come from the same frame.

However, we don't have means to convey the frame number to userspace. We
do have the 'sequence' field, which with a few tricks can be used for
this purpose.

To achieve this, track the frame number for each virtual channel and
increase the sequence for each virtual channel by frame-number -
previous-frame-number, also taking into account the eventual wrap of the
CSI-2 frame number. If the CSI-2 peripheral does not support frame
numbers, CAL increases the frame number register by one each frame.

This way we get a monotonically increasing sequence number which is
common to all streams using the same virtual channel.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-camerarx.c |  1 +
 drivers/media/platform/ti/cal/cal.c          | 57 +++++++++++++++++++-
 drivers/media/platform/ti/cal/cal.h          |  7 ++-
 3 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 4469773f6eb9..8206c172c63b 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -844,6 +844,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	phy->cal = cal;
 	phy->instance = instance;
 
+	spin_lock_init(&phy->vc_lock);
 	mutex_init(&phy->mutex);
 
 	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 4a4a6c5983f7..783ce5a8cd79 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -496,7 +496,22 @@ void cal_ctx_unprepare(struct cal_ctx *ctx)
 
 void cal_ctx_start(struct cal_ctx *ctx)
 {
-	ctx->sequence = 0;
+	struct cal_camerarx *phy = ctx->phy;
+
+	/*
+	 * Reset the frame number & sequence number, but only if the
+	 * virtual channel is not already in use.
+	 */
+
+	spin_lock(&phy->vc_lock);
+
+	if (phy->vc_enable_count[ctx->vc]++ == 0) {
+		phy->vc_frame_number[ctx->vc] = 0;
+		phy->vc_sequence[ctx->vc] = 0;
+	}
+
+	spin_unlock(&phy->vc_lock);
+
 	ctx->dma.state = CAL_DMA_RUNNING;
 
 	/* Configure the CSI-2, pixel processing and write DMA contexts. */
@@ -516,8 +531,15 @@ void cal_ctx_start(struct cal_ctx *ctx)
 
 void cal_ctx_stop(struct cal_ctx *ctx)
 {
+	struct cal_camerarx *phy = ctx->phy;
 	long timeout;
 
+	WARN_ON(phy->vc_enable_count[ctx->vc] == 0);
+
+	spin_lock(&phy->vc_lock);
+	phy->vc_enable_count[ctx->vc]--;
+	spin_unlock(&phy->vc_lock);
+
 	/*
 	 * Request DMA stop and wait until it completes. If completion times
 	 * out, forcefully disable the DMA.
@@ -554,6 +576,34 @@ void cal_ctx_stop(struct cal_ctx *ctx)
  * ------------------------------------------------------------------
  */
 
+/*
+ * Track a sequence number for each virtual channel, which is shared by
+ * all contexts using the same virtual channel. This is done using the
+ * CSI-2 frame number as a base.
+ */
+static void cal_update_seq_number(struct cal_ctx *ctx)
+{
+	struct cal_dev *cal = ctx->cal;
+	struct cal_camerarx *phy = ctx->phy;
+	u16 prev_frame_num, frame_num;
+	u8 vc = ctx->vc;
+
+	frame_num =
+		cal_read(cal, CAL_CSI2_STATUS(phy->instance, ctx->csi2_ctx)) &
+		0xffff;
+
+	if (phy->vc_frame_number[vc] != frame_num) {
+		prev_frame_num = phy->vc_frame_number[vc];
+
+		if (prev_frame_num >= frame_num)
+			phy->vc_sequence[vc] += 1;
+		else
+			phy->vc_sequence[vc] += frame_num - prev_frame_num;
+
+		phy->vc_frame_number[vc] = frame_num;
+	}
+}
+
 static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 {
 	spin_lock(&ctx->dma.lock);
@@ -584,6 +634,8 @@ static inline void cal_irq_wdma_start(struct cal_ctx *ctx)
 	}
 
 	spin_unlock(&ctx->dma.lock);
+
+	cal_update_seq_number(ctx);
 }
 
 static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
@@ -610,7 +662,8 @@ static inline void cal_irq_wdma_end(struct cal_ctx *ctx)
 	if (buf) {
 		buf->vb.vb2_buf.timestamp = ktime_get_ns();
 		buf->vb.field = ctx->v_fmt.fmt.pix.field;
-		buf->vb.sequence = ctx->sequence++;
+		buf->vb.sequence = ctx->phy->vc_sequence[ctx->vc];
+
 		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	}
 }
diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
index 527e22d022f3..dfb628cd3bdd 100644
--- a/drivers/media/platform/ti/cal/cal.h
+++ b/drivers/media/platform/ti/cal/cal.h
@@ -180,6 +180,12 @@ struct cal_camerarx {
 	struct media_pad	pads[CAL_CAMERARX_NUM_PADS];
 	struct v4l2_mbus_framefmt	formats[CAL_CAMERARX_NUM_PADS];
 
+	/* protects the vc_* fields below */
+	spinlock_t		vc_lock;
+	u8			vc_enable_count[4];
+	u16			vc_frame_number[4];
+	u32			vc_sequence[4];
+
 	/*
 	 * Lock for camerarx ops. Protects:
 	 * - formats
@@ -242,7 +248,6 @@ struct cal_ctx {
 	const struct cal_format_info	**active_fmt;
 	unsigned int		num_active_fmt;
 
-	unsigned int		sequence;
 	struct vb2_queue	vb_vidq;
 	u8			dma_ctx;
 	u8			cport;
-- 
2.34.1

