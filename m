Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B622215ECF
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730023AbgGFSjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:39:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730014AbgGFSjF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:39:05 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 645C82123;
        Mon,  6 Jul 2020 20:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060708;
        bh=KV8bbgdbDnVXKX3q4ht01ryQh/1P/qBj/eev7FGBwks=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OWXy4xwA6Dq+mrxSQLd6B2x3Lt9s+NdUhiPosrMHdFaXj5PBJmsf6Od3A4EOlcK8s
         GABMaSKBmABIRoewrSySfEH73UlvW8Boy9gfLn977pIPD/91stTRN1JidaazQuv/Nn
         F6zPZK8lT04d8xKBomRUqGRkwZG6ZFXWuQ9ulfoY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 092/108] media: ti-vpe: cal: Use CAMERARX subdev s_stream op in video device code
Date:   Mon,  6 Jul 2020 21:36:53 +0300
Message-Id: <20200706183709.12238-93-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace calls to cal_camerarx_start() and cal_camerarx_stop() with usage
of the .s_stream() subdev operation. This requires calling the
.set_fmt() operation as the CAMERARX now relies on the format
information set through the subdev API instead of receiving it in the
cal_camerarx_start() function.

This change prepare for exposing the CAMERARX subdev operations to
userspace by using the same API within the kernel.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 15 ++++++------
 drivers/media/platform/ti-vpe/cal-video.c    | 25 +++++++++++---------
 drivers/media/platform/ti-vpe/cal.h          |  2 --
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index ca941e3e72e9..584dc548504d 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -116,8 +116,7 @@ void cal_camerarx_disable(struct cal_camerarx *phy)
 #define TCLK_MISS	1
 #define TCLK_SETTLE	14
 
-static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate,
-				const struct cal_fmt *fmt)
+static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate)
 {
 	unsigned int reg0, reg1;
 	unsigned int ths_term, ths_settle;
@@ -132,9 +131,9 @@ static void cal_camerarx_config(struct cal_camerarx *phy, s64 external_rate,
 	 * CSI-2 is DDR and we only count used lanes.
 	 *
 	 * csi2_ddrclk_khz = external_rate / 1000
-	 *		   / (2 * num_lanes) * fmt->bpp;
+	 *		   / (2 * num_lanes) * phy->fmtinfo->bpp;
 	 */
-	csi2_ddrclk_khz = div_s64(external_rate * fmt->bpp,
+	csi2_ddrclk_khz = div_s64(external_rate * phy->fmtinfo->bpp,
 				  2 * num_lanes * 1000);
 
 	phy_dbg(1, phy, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
@@ -234,7 +233,7 @@ static void cal_camerarx_wait_stop_state(struct cal_camerarx *phy)
 		phy_err(phy, "Timeout waiting for stop state\n");
 }
 
-int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt)
+static int cal_camerarx_start(struct cal_camerarx *phy)
 {
 	s64 external_rate;
 	u32 sscounter;
@@ -289,7 +288,7 @@ int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt)
 	camerarx_read(phy, CAL_CSI2_PHY_REG0);
 
 	/* Program the PHY timing parameters. */
-	cal_camerarx_config(phy, external_rate, fmt);
+	cal_camerarx_config(phy, external_rate);
 
 	/*
 	 *    b. Assert the FORCERXMODE signal.
@@ -362,7 +361,7 @@ int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt)
 	return 0;
 }
 
-void cal_camerarx_stop(struct cal_camerarx *phy)
+static void cal_camerarx_stop(struct cal_camerarx *phy)
 {
 	unsigned int i;
 	int ret;
@@ -629,7 +628,7 @@ static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
 
 	if (enable)
-		return cal_camerarx_start(phy, NULL);
+		return cal_camerarx_start(phy);
 
 	cal_camerarx_stop(phy);
 	return 0;
diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 42e750925e8b..1ada27d42da1 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -256,8 +256,11 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct cal_ctx *ctx = video_drvdata(file);
 	struct vb2_queue *q = &ctx->vb_vidq;
+	struct v4l2_subdev_format sd_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = CAL_CAMERARX_PAD_SINK,
+	};
 	const struct cal_fmt *fmt;
-	struct v4l2_mbus_framefmt mbus_fmt;
 	int ret;
 
 	if (vb2_is_busy(q)) {
@@ -271,25 +274,28 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
 
 	fmt = find_format_by_pix(ctx, f->fmt.pix.pixelformat);
 
-	v4l2_fill_mbus_format(&mbus_fmt, &f->fmt.pix, fmt->code);
+	v4l2_fill_mbus_format(&sd_fmt.format, &f->fmt.pix, fmt->code);
 
-	ret = __subdev_set_format(ctx, &mbus_fmt);
+	ret = __subdev_set_format(ctx, &sd_fmt.format);
 	if (ret)
 		return ret;
 
 	/* Just double check nothing has gone wrong */
-	if (mbus_fmt.code != fmt->code) {
+	if (sd_fmt.format.code != fmt->code) {
 		ctx_dbg(3, ctx,
 			"%s subdev changed format on us, this should not happen\n",
 			__func__);
 		return -EINVAL;
 	}
 
-	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
+	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &sd_fmt.format);
 	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	ctx->v_fmt.fmt.pix.pixelformat = fmt->fourcc;
-	ctx->v_fmt.fmt.pix.field = mbus_fmt.field;
+	ctx->v_fmt.fmt.pix.field = sd_fmt.format.field;
 	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
+
+	v4l2_subdev_call(&ctx->phy->subdev, pad, set_fmt, NULL, &sd_fmt);
+
 	ctx->fmt = fmt;
 	*f = ctx->v_fmt;
 
@@ -455,9 +461,6 @@ static int cal_buffer_prepare(struct vb2_buffer *vb)
 					      vb.vb2_buf);
 	unsigned long size;
 
-	if (WARN_ON(!ctx->fmt))
-		return -EINVAL;
-
 	size = ctx->v_fmt.fmt.pix.sizeimage;
 	if (vb2_plane_size(vb, 0) < size) {
 		ctx_err(ctx,
@@ -518,7 +521,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	cal_camerarx_enable_irqs(ctx->phy);
 
-	ret = cal_camerarx_start(ctx->phy, ctx->fmt);
+	ret = v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 1);
 	if (ret)
 		goto err;
 
@@ -569,7 +572,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 		ctx_err(ctx, "failed to disable dma cleanly\n");
 
 	cal_camerarx_disable_irqs(ctx->phy);
-	cal_camerarx_stop(ctx->phy);
+	v4l2_subdev_call(&ctx->phy->subdev, video, s_stream, 0);
 
 	/* Release all active buffers */
 	spin_lock_irqsave(&ctx->slock, flags);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index f64144c1ea4c..8efb12b06c90 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -262,8 +262,6 @@ const struct cal_fmt *cal_format_by_code(u32 code);
 void cal_quickdump_regs(struct cal_dev *cal);
 
 void cal_camerarx_disable(struct cal_camerarx *phy);
-int cal_camerarx_start(struct cal_camerarx *phy, const struct cal_fmt *fmt);
-void cal_camerarx_stop(struct cal_camerarx *phy);
 void cal_camerarx_enable_irqs(struct cal_camerarx *phy);
 void cal_camerarx_disable_irqs(struct cal_camerarx *phy);
 void cal_camerarx_ppi_enable(struct cal_camerarx *phy);
-- 
Regards,

Laurent Pinchart

