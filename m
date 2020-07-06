Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2667F215E95
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbgGFSiH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbgGFSiG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:06 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A92F1968;
        Mon,  6 Jul 2020 20:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060671;
        bh=ifJS8kHGInhzMx9M3Jsa+tFcBbao2Xz5QTDSceQEYEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=URGqo3T4fshedNRLHaYy+PuAFk2Q1Gzt40vCRCXMia65rkmA4Udq+4mFl7CnORJJV
         TR1akm6sfAx4s96BqM+xkCBOpMgx/GBkX+PsQv4oUXFrJvFZqKiIOKHihk3YzEM9+m
         yGf1a2y+pUtjgM8r5zg3XFj0/iVBk2JhLoVfiKVY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 037/108] media: ti-vpe: cal: Reorganize remaining code in sections
Date:   Mon,  6 Jul 2020 21:35:58 +0300
Message-Id: <20200706183709.12238-38-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Increase readability by reorganizing the remaining code in sections. No
functional change is included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 340 +++++++++++++++-------------
 1 file changed, 182 insertions(+), 158 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 7914a0f22f0e..d452c3e950f0 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -37,9 +37,6 @@
 
 #define CAL_MODULE_NAME "cal"
 
-#define MAX_WIDTH_BYTES (8192 * 8)
-#define MAX_HEIGHT_LINES 16383
-
 MODULE_DESCRIPTION("TI CAL driver");
 MODULE_AUTHOR("Benoit Parrot, <bparrot@ti.com>");
 MODULE_LICENSE("GPL v2");
@@ -80,11 +77,11 @@ MODULE_PARM_DESC(debug, "activates debug info");
 
 #define CAL_NUM_CONTEXT 2
 
-#define reg_read(dev, offset) ioread32(dev->base + offset)
-#define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
+#define MAX_WIDTH_BYTES (8192 * 8)
+#define MAX_HEIGHT_LINES 16383
 
 /* ------------------------------------------------------------------
- *	Basic structures
+ *	Format Handling
  * ------------------------------------------------------------------
  */
 
@@ -205,6 +202,11 @@ static char *fourcc_to_str(u32 fmt)
 	return code;
 }
 
+/* ------------------------------------------------------------------
+ *	Driver Structures
+ * ------------------------------------------------------------------
+ */
+
 /* buffer for one video frame */
 struct cal_buffer {
 	/* common v4l buffer stuff -- must be first */
@@ -240,80 +242,6 @@ struct cal_data {
 	unsigned int flags;
 };
 
-static const struct cal_camerarx_data dra72x_cal_camerarx[] = {
-	{
-		.fields = {
-			[F_CTRLCLKEN] = { 10, 10 },
-			[F_CAMMODE] = { 11, 12 },
-			[F_LANEENABLE] = { 13, 16 },
-			[F_CSI_MODE] = { 17, 17 },
-		},
-		.num_lanes = 4,
-	},
-	{
-		.fields = {
-			[F_CTRLCLKEN] = { 0, 0 },
-			[F_CAMMODE] = { 1, 2 },
-			[F_LANEENABLE] = { 3, 4 },
-			[F_CSI_MODE] = { 5, 5 },
-		},
-		.num_lanes = 2,
-	},
-};
-
-static const struct cal_data dra72x_cal_data = {
-	.camerarx = dra72x_cal_camerarx,
-	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
-};
-
-static const struct cal_data dra72x_es1_cal_data = {
-	.camerarx = dra72x_cal_camerarx,
-	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
-	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
-};
-
-static const struct cal_camerarx_data dra76x_cal_csi_phy[] = {
-	{
-		.fields = {
-			[F_CTRLCLKEN] = { 8, 8 },
-			[F_CAMMODE] = { 9, 10 },
-			[F_CSI_MODE] = { 11, 11 },
-			[F_LANEENABLE] = { 27, 31 },
-		},
-		.num_lanes = 5,
-	},
-	{
-		.fields = {
-			[F_CTRLCLKEN] = { 0, 0 },
-			[F_CAMMODE] = { 1, 2 },
-			[F_CSI_MODE] = { 3, 3 },
-			[F_LANEENABLE] = { 24, 26 },
-		},
-		.num_lanes = 3,
-	},
-};
-
-static const struct cal_data dra76x_cal_data = {
-	.camerarx = dra76x_cal_csi_phy,
-	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
-};
-
-static const struct cal_camerarx_data am654_cal_csi_phy[] = {
-	{
-		.fields = {
-			[F_CTRLCLKEN] = { 15, 15 },
-			[F_CAMMODE] = { 24, 25 },
-			[F_LANEENABLE] = { 0, 4 },
-		},
-		.num_lanes = 5,
-	},
-};
-
-static const struct cal_data am654_cal_data = {
-	.camerarx = am654_cal_csi_phy,
-	.num_csi2_phy = ARRAY_SIZE(am654_cal_csi_phy),
-};
-
 /*
  * The Camera Adaptation Layer (CAL) module is paired with one or more complex
  * I/O PHYs (CAMERARX). It contains multiple instances of CSI-2, processing and
@@ -409,6 +337,98 @@ struct cal_ctx {
 	bool dma_act;
 };
 
+static inline struct cal_ctx *notifier_to_ctx(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct cal_ctx, notifier);
+}
+
+/* ------------------------------------------------------------------
+ *	Platform Data
+ * ------------------------------------------------------------------
+ */
+
+static const struct cal_camerarx_data dra72x_cal_camerarx[] = {
+	{
+		.fields = {
+			[F_CTRLCLKEN] = { 10, 10 },
+			[F_CAMMODE] = { 11, 12 },
+			[F_LANEENABLE] = { 13, 16 },
+			[F_CSI_MODE] = { 17, 17 },
+		},
+		.num_lanes = 4,
+	},
+	{
+		.fields = {
+			[F_CTRLCLKEN] = { 0, 0 },
+			[F_CAMMODE] = { 1, 2 },
+			[F_LANEENABLE] = { 3, 4 },
+			[F_CSI_MODE] = { 5, 5 },
+		},
+		.num_lanes = 2,
+	},
+};
+
+static const struct cal_data dra72x_cal_data = {
+	.camerarx = dra72x_cal_camerarx,
+	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
+};
+
+static const struct cal_data dra72x_es1_cal_data = {
+	.camerarx = dra72x_cal_camerarx,
+	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_camerarx),
+	.flags = DRA72_CAL_PRE_ES2_LDO_DISABLE,
+};
+
+static const struct cal_camerarx_data dra76x_cal_csi_phy[] = {
+	{
+		.fields = {
+			[F_CTRLCLKEN] = { 8, 8 },
+			[F_CAMMODE] = { 9, 10 },
+			[F_CSI_MODE] = { 11, 11 },
+			[F_LANEENABLE] = { 27, 31 },
+		},
+		.num_lanes = 5,
+	},
+	{
+		.fields = {
+			[F_CTRLCLKEN] = { 0, 0 },
+			[F_CAMMODE] = { 1, 2 },
+			[F_CSI_MODE] = { 3, 3 },
+			[F_LANEENABLE] = { 24, 26 },
+		},
+		.num_lanes = 3,
+	},
+};
+
+static const struct cal_data dra76x_cal_data = {
+	.camerarx = dra76x_cal_csi_phy,
+	.num_csi2_phy = ARRAY_SIZE(dra76x_cal_csi_phy),
+};
+
+static const struct cal_camerarx_data am654_cal_csi_phy[] = {
+	{
+		.fields = {
+			[F_CTRLCLKEN] = { 15, 15 },
+			[F_CAMMODE] = { 24, 25 },
+			[F_LANEENABLE] = { 0, 4 },
+		},
+		.num_lanes = 5,
+	},
+};
+
+static const struct cal_data am654_cal_data = {
+	.camerarx = am654_cal_csi_phy,
+	.num_csi2_phy = ARRAY_SIZE(am654_cal_csi_phy),
+};
+
+/* ------------------------------------------------------------------
+ *	I/O Register Accessors
+ * ------------------------------------------------------------------
+ */
+
+#define reg_read(dev, offset) ioread32(dev->base + offset)
+#define reg_write(dev, offset, val) iowrite32(val, dev->base + offset)
+
 static inline u32 reg_read_field(struct cal_dev *cal, u32 offset, u32 mask)
 {
 	return FIELD_GET(mask, reg_read(cal, offset));
@@ -424,41 +444,6 @@ static inline void reg_write_field(struct cal_dev *cal, u32 offset, u32 value,
 	reg_write(cal, offset, val);
 }
 
-static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
-						u32 pixelformat)
-{
-	const struct cal_fmt *fmt;
-	unsigned int k;
-
-	for (k = 0; k < ctx->num_active_fmt; k++) {
-		fmt = ctx->active_fmt[k];
-		if (fmt->fourcc == pixelformat)
-			return fmt;
-	}
-
-	return NULL;
-}
-
-static const struct cal_fmt *find_format_by_code(struct cal_ctx *ctx,
-						 u32 code)
-{
-	const struct cal_fmt *fmt;
-	unsigned int k;
-
-	for (k = 0; k < ctx->num_active_fmt; k++) {
-		fmt = ctx->active_fmt[k];
-		if (fmt->code == code)
-			return fmt;
-	}
-
-	return NULL;
-}
-
-static inline struct cal_ctx *notifier_to_ctx(struct v4l2_async_notifier *n)
-{
-	return container_of(n, struct cal_ctx, notifier);
-}
-
 static inline void set_field(u32 *valp, u32 field, u32 mask)
 {
 	u32 val = *valp;
@@ -1148,6 +1133,11 @@ static void cal_ctx_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
 }
 
+/* ------------------------------------------------------------------
+ *	IRQ Handling
+ * ------------------------------------------------------------------
+ */
+
 static inline void cal_schedule_next_buffer(struct cal_ctx *ctx)
 {
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
@@ -1256,9 +1246,41 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	return IRQ_HANDLED;
 }
 
-/*
- * video ioctls
+/* ------------------------------------------------------------------
+ *	V4L2 Video IOCTLs
+ * ------------------------------------------------------------------
  */
+
+static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
+						u32 pixelformat)
+{
+	const struct cal_fmt *fmt;
+	unsigned int k;
+
+	for (k = 0; k < ctx->num_active_fmt; k++) {
+		fmt = ctx->active_fmt[k];
+		if (fmt->fourcc == pixelformat)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static const struct cal_fmt *find_format_by_code(struct cal_ctx *ctx,
+						 u32 code)
+{
+	const struct cal_fmt *fmt;
+	unsigned int k;
+
+	for (k = 0; k < ctx->num_active_fmt; k++) {
+		fmt = ctx->active_fmt[k];
+		if (fmt->code == code)
+			return fmt;
+	}
+
+	return NULL;
+}
+
 static int cal_querycap(struct file *file, void *priv,
 			struct v4l2_capability *cap)
 {
@@ -1567,9 +1589,46 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
 	return 0;
 }
 
-/*
- * Videobuf operations
+static const struct v4l2_file_operations cal_fops = {
+	.owner		= THIS_MODULE,
+	.open           = v4l2_fh_open,
+	.release        = vb2_fop_release,
+	.read           = vb2_fop_read,
+	.poll		= vb2_fop_poll,
+	.unlocked_ioctl = video_ioctl2, /* V4L2 ioctl handler */
+	.mmap           = vb2_fop_mmap,
+};
+
+static const struct v4l2_ioctl_ops cal_ioctl_ops = {
+	.vidioc_querycap      = cal_querycap,
+	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
+	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap   = cal_try_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap     = cal_s_fmt_vid_cap,
+	.vidioc_enum_framesizes   = cal_enum_framesizes,
+	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
+	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
+	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
+	.vidioc_querybuf      = vb2_ioctl_querybuf,
+	.vidioc_qbuf          = vb2_ioctl_qbuf,
+	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
+	.vidioc_expbuf        = vb2_ioctl_expbuf,
+	.vidioc_enum_input    = cal_enum_input,
+	.vidioc_g_input       = cal_g_input,
+	.vidioc_s_input       = cal_s_input,
+	.vidioc_enum_frameintervals = cal_enum_frameintervals,
+	.vidioc_streamon      = vb2_ioctl_streamon,
+	.vidioc_streamoff     = vb2_ioctl_streamoff,
+	.vidioc_log_status    = v4l2_ctrl_log_status,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+/* ------------------------------------------------------------------
+ *	videobuf2 Operations
+ * ------------------------------------------------------------------
  */
+
 static int cal_queue_setup(struct vb2_queue *vq,
 			   unsigned int *nbuffers, unsigned int *nplanes,
 			   unsigned int sizes[], struct device *alloc_devs[])
@@ -1773,40 +1832,10 @@ static const struct vb2_ops cal_video_qops = {
 	.wait_finish		= vb2_ops_wait_finish,
 };
 
-static const struct v4l2_file_operations cal_fops = {
-	.owner		= THIS_MODULE,
-	.open           = v4l2_fh_open,
-	.release        = vb2_fop_release,
-	.read           = vb2_fop_read,
-	.poll		= vb2_fop_poll,
-	.unlocked_ioctl = video_ioctl2, /* V4L2 ioctl handler */
-	.mmap           = vb2_fop_mmap,
-};
-
-static const struct v4l2_ioctl_ops cal_ioctl_ops = {
-	.vidioc_querycap      = cal_querycap,
-	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
-	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap   = cal_try_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap     = cal_s_fmt_vid_cap,
-	.vidioc_enum_framesizes   = cal_enum_framesizes,
-	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
-	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
-	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
-	.vidioc_querybuf      = vb2_ioctl_querybuf,
-	.vidioc_qbuf          = vb2_ioctl_qbuf,
-	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
-	.vidioc_expbuf        = vb2_ioctl_expbuf,
-	.vidioc_enum_input    = cal_enum_input,
-	.vidioc_g_input       = cal_g_input,
-	.vidioc_s_input       = cal_s_input,
-	.vidioc_enum_frameintervals = cal_enum_frameintervals,
-	.vidioc_streamon      = vb2_ioctl_streamon,
-	.vidioc_streamoff     = vb2_ioctl_streamoff,
-	.vidioc_log_status    = v4l2_ctrl_log_status,
-	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
-	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
-};
+/* ------------------------------------------------------------------
+ *	Initialization and module stuff
+ * ------------------------------------------------------------------
+ */
 
 static const struct video_device cal_videodev = {
 	.name		= CAL_MODULE_NAME,
@@ -1818,11 +1847,6 @@ static const struct video_device cal_videodev = {
 			  V4L2_CAP_READWRITE,
 };
 
-/* -----------------------------------------------------------------
- *	Initialization and module stuff
- * ------------------------------------------------------------------
- */
-
 static int cal_complete_ctx(struct cal_ctx *ctx)
 {
 	struct video_device *vfd;
-- 
Regards,

Laurent Pinchart

