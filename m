Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735611F8B88
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgFOAAv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbgFOAAu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:50 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07E552148;
        Mon, 15 Jun 2020 02:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179224;
        bh=/NQLK1t//VgqwzC4KTzlLuKefOV3l+bpoSYRIwOuIbw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OVc5fdgqhLRXhEsJgiDNPByfwrJg/cxCXRZYzwCZn4DXMBSEU4FZVyGrvyMP6uzqY
         Vjao1QBtbtVR/e137kNzq1RWGzj0boLwU8lGH1ZLB47iseoz31m7qgYSX4aJb8bIx7
         ZznsItotTqhcgpSfADB7l+09qRwrbLCWKc2JLyPU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 032/107] media: ti-vpe: cal: Store sensor-related data in cal_camerarx
Date:   Mon, 15 Jun 2020 02:58:29 +0300
Message-Id: <20200614235944.17716-33-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor is connected to the CAMERARX. Store its pointer, as well as
the sensor pixel rate and the endpoint, in the cal_camerarx. This
prepares for decoupling the cal_camerarx and cal_ctx.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 59 +++++++++++++++--------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index dd85efa89bcb..30323d61d8e9 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -338,6 +338,10 @@ struct cal_camerarx {
 
 	struct cal_dev		*cal;
 	unsigned int		instance;
+
+	struct v4l2_fwnode_endpoint	endpoint;
+	struct v4l2_subdev	*sensor;
+	unsigned int		external_rate;
 };
 
 struct cal_dev {
@@ -368,8 +372,6 @@ struct cal_ctx {
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct video_device	vdev;
 	struct v4l2_async_notifier notifier;
-	struct v4l2_subdev	*sensor;
-	struct v4l2_fwnode_endpoint	endpoint;
 
 	struct cal_dev		*cal;
 	struct cal_camerarx	*phy;
@@ -393,7 +395,6 @@ struct cal_ctx {
 	unsigned int		num_active_fmt;
 
 	unsigned int		sequence;
-	unsigned int		external_rate;
 	struct vb2_queue	vb_vidq;
 	unsigned int		csi2_port;
 	unsigned int		cport;
@@ -586,6 +587,7 @@ static struct cal_camerarx *cc_create(struct cal_dev *cal,
 
 	phy->cal = cal;
 	phy->instance = instance;
+	phy->external_rate = 192000000;
 
 	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						(instance == 0) ?
@@ -777,12 +779,12 @@ static void csi2_phy_config(struct cal_ctx *ctx)
 	unsigned int ths_term, ths_settle;
 	unsigned int csi2_ddrclk_khz;
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-			&ctx->endpoint.bus.mipi_csi2;
+			&ctx->phy->endpoint.bus.mipi_csi2;
 	u32 num_lanes = mipi_csi2->num_data_lanes;
 
 	/* DPHY timing configuration */
 	/* CSI-2 is DDR and we only count used lanes. */
-	csi2_ddrclk_khz = ctx->external_rate / 1000
+	csi2_ddrclk_khz = ctx->phy->external_rate / 1000
 		/ (2 * num_lanes) * ctx->fmt->bpp;
 	ctx_dbg(1, ctx, "csi2_ddrclk_khz: %d\n", csi2_ddrclk_khz);
 
@@ -977,7 +979,7 @@ static void csi2_lane_config(struct cal_ctx *ctx)
 	u32 lane_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POSITION_MASK;
 	u32 polarity_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POL_MASK;
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
-		&ctx->endpoint.bus.mipi_csi2;
+		&ctx->phy->endpoint.bus.mipi_csi2;
 	int lane;
 
 	set_field(&val, mipi_csi2->clock_lane + 1, lane_mask);
@@ -1148,22 +1150,22 @@ static void cal_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
 }
 
-static int cal_get_external_info(struct cal_ctx *ctx)
+static int cal_get_external_info(struct cal_camerarx *phy)
 {
 	struct v4l2_ctrl *ctrl;
 
-	if (!ctx->sensor)
+	if (!phy->sensor)
 		return -ENODEV;
 
-	ctrl = v4l2_ctrl_find(ctx->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
 	if (!ctrl) {
-		ctx_err(ctx, "no pixel rate control in subdev: %s\n",
-			ctx->sensor->name);
+		phy_err(phy, "no pixel rate control in subdev: %s\n",
+			phy->sensor->name);
 		return -EPIPE;
 	}
 
-	ctx->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
-	ctx_dbg(3, ctx, "sensor Pixel Rate: %d\n", ctx->external_rate);
+	phy->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
+	phy_dbg(3, phy, "sensor Pixel Rate: %u\n", phy->external_rate);
 
 	return 0;
 }
@@ -1313,7 +1315,7 @@ static int __subdev_get_format(struct cal_ctx *ctx,
 	sd_fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	sd_fmt.pad = 0;
 
-	ret = v4l2_subdev_call(ctx->sensor, pad, get_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(ctx->phy->sensor, pad, get_fmt, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -1336,7 +1338,7 @@ static int __subdev_set_format(struct cal_ctx *ctx,
 	sd_fmt.pad = 0;
 	*mbus_fmt = *fmt;
 
-	ret = v4l2_subdev_call(ctx->sensor, pad, set_fmt, NULL, &sd_fmt);
+	ret = v4l2_subdev_call(ctx->phy->sensor, pad, set_fmt, NULL, &sd_fmt);
 	if (ret)
 		return ret;
 
@@ -1417,7 +1419,7 @@ static int cal_try_fmt_vid_cap(struct file *file, void *priv,
 	fse.code = fmt->code;
 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	for (fse.index = 0; ; fse.index++) {
-		ret = v4l2_subdev_call(ctx->sensor, pad, enum_frame_size,
+		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size,
 				       NULL, &fse);
 		if (ret)
 			break;
@@ -1515,7 +1517,8 @@ static int cal_enum_framesizes(struct file *file, void *fh,
 	fse.code = fmt->code;
 	fse.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 
-	ret = v4l2_subdev_call(ctx->sensor, pad, enum_frame_size, NULL, &fse);
+	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_size, NULL,
+			       &fse);
 	if (ret)
 		return ret;
 
@@ -1571,7 +1574,7 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
 		return -EINVAL;
 
 	fie.code = fmt->code;
-	ret = v4l2_subdev_call(ctx->sensor, pad, enum_frame_interval,
+	ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_frame_interval,
 			       NULL, &fie);
 	if (ret)
 		return ret;
@@ -1669,11 +1672,11 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	addr = vb2_dma_contig_plane_dma_addr(&ctx->cur_frm->vb.vb2_buf, 0);
 	ctx->sequence = 0;
 
-	ret = cal_get_external_info(ctx);
+	ret = cal_get_external_info(ctx->phy);
 	if (ret < 0)
 		goto err;
 
-	ret = v4l2_subdev_call(ctx->sensor, core, s_power, 1);
+	ret = v4l2_subdev_call(ctx->phy->sensor, core, s_power, 1);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
 		ctx_err(ctx, "power on failed in subdev\n");
 		goto err;
@@ -1690,9 +1693,9 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	enable_irqs(ctx);
 	csi2_phy_init(ctx);
 
-	ret = v4l2_subdev_call(ctx->sensor, video, s_stream, 1);
+	ret = v4l2_subdev_call(ctx->phy->sensor, video, s_stream, 1);
 	if (ret) {
-		v4l2_subdev_call(ctx->sensor, core, s_power, 0);
+		v4l2_subdev_call(ctx->phy->sensor, core, s_power, 0);
 		ctx_err(ctx, "stream on failed in subdev\n");
 		pm_runtime_put_sync(&ctx->cal->pdev->dev);
 		goto err;
@@ -1749,10 +1752,10 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	disable_irqs(ctx);
 	csi2_phy_deinit(ctx);
 
-	if (v4l2_subdev_call(ctx->sensor, video, s_stream, 0))
+	if (v4l2_subdev_call(ctx->phy->sensor, video, s_stream, 0))
 		ctx_err(ctx, "stream off failed in subdev\n");
 
-	ret = v4l2_subdev_call(ctx->sensor, core, s_power, 0);
+	ret = v4l2_subdev_call(ctx->phy->sensor, core, s_power, 0);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
 		ctx_err(ctx, "power off failed in subdev\n");
 
@@ -1843,8 +1846,6 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 	struct vb2_queue *q;
 	int ret;
 
-	ctx->external_rate = 192000000;
-
 	/* initialize locks */
 	spin_lock_init(&ctx->slock);
 	mutex_init(&ctx->mutex);
@@ -1900,13 +1901,13 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 	unsigned int i, j, k;
 	int ret = 0;
 
-	if (ctx->sensor) {
+	if (ctx->phy->sensor) {
 		ctx_info(ctx, "Rejecting subdev %s (Already set!!)",
 			 subdev->name);
 		return 0;
 	}
 
-	ctx->sensor = subdev;
+	ctx->phy->sensor = subdev;
 	ctx_dbg(1, ctx, "Using sensor %s for capture\n", subdev->name);
 
 	/* Enumerate sub device formats and enable all matching local formats */
@@ -2059,7 +2060,7 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 
 	parent = pdev->dev.of_node;
 
-	endpoint = &ctx->endpoint;
+	endpoint = &ctx->phy->endpoint;
 
 	ep_node = NULL;
 	port = NULL;
-- 
Regards,

Laurent Pinchart

