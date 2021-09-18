Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA15410744
	for <lists+linux-media@lfdr.de>; Sat, 18 Sep 2021 17:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239661AbhIRPGQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Sep 2021 11:06:16 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:56909 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239611AbhIRPGQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Sep 2021 11:06:16 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id BE48640002;
        Sat, 18 Sep 2021 15:04:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     tomi.valkeinen@ideasonboard.com, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        kieran.bingham@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas NIZAN <tnizan@witekio.com>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/5] media: rcar-csi2: Implement multiplexed support
Date:   Sat, 18 Sep 2021 17:05:06 +0200
Message-Id: <20210918150507.987294-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
References: <20210918150507.987294-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement support for multiplexed streams to the R-Car CSI-2 driver.

Implement the init_cfg and set_routing operations and move format
handling to the subdev state.

Use the transmitter's frame descriptor to configure the CSI-2 bus and enable
the requested virtual channel and data types.

[based on a patch from]
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 289 +++++++++++++++-----
 1 file changed, 219 insertions(+), 70 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e28eff039688..db582633d415 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -69,10 +69,7 @@ struct rcar_csi2;
 #define FLD_REG				0x1c
 #define FLD_FLD_NUM(n)			(((n) & 0xff) << 16)
 #define FLD_DET_SEL(n)			(((n) & 0x3) << 4)
-#define FLD_FLD_EN4			BIT(3)
-#define FLD_FLD_EN3			BIT(2)
-#define FLD_FLD_EN2			BIT(1)
-#define FLD_FLD_EN			BIT(0)
+#define FLD_FLD_EN(n)			BIT((n) & 0xf)
 
 /* Automatic Standby Control */
 #define ASTBY_REG			0x20
@@ -309,31 +306,23 @@ static const struct rcsi2_mbps_reg hsfreqrange_m3w_h3es1[] = {
 #define CSI0CLKFREQRANGE(n)		((n & 0x3f) << 16)
 
 struct rcar_csi2_format {
-	u32 code;
 	unsigned int datatype;
 	unsigned int bpp;
 };
 
 static const struct rcar_csi2_format rcar_csi2_formats[] = {
-	{ .code = MEDIA_BUS_FMT_RGB888_1X24,	.datatype = 0x24, .bpp = 24 },
-	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
-	{ .code = MEDIA_BUS_FMT_YUYV8_1X16,	.datatype = 0x1e, .bpp = 16 },
-	{ .code = MEDIA_BUS_FMT_UYVY8_2X8,	.datatype = 0x1e, .bpp = 16 },
-	{ .code = MEDIA_BUS_FMT_YUYV10_2X10,	.datatype = 0x1e, .bpp = 20 },
-	{ .code = MEDIA_BUS_FMT_Y10_1X10,	.datatype = 0x2b, .bpp = 10 },
-	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8,     .datatype = 0x2a, .bpp = 8 },
-	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8,     .datatype = 0x2a, .bpp = 8 },
-	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8,     .datatype = 0x2a, .bpp = 8 },
-	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8,     .datatype = 0x2a, .bpp = 8 },
-	{ .code = MEDIA_BUS_FMT_Y8_1X8,		.datatype = 0x2a, .bpp = 8 },
+	{ .datatype = 0x1e, .bpp = 16 },
+	{ .datatype = 0x24, .bpp = 24 },
+	{ .datatype = 0x2a, .bpp = 8 },
+	{ .datatype = 0x2b, .bpp = 10 },
 };
 
-static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
+static const struct rcar_csi2_format *rcsi2_datatype_to_fmt(unsigned int dt)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(rcar_csi2_formats); i++)
-		if (rcar_csi2_formats[i].code == code)
+		if (rcar_csi2_formats[i].datatype == dt)
 			return &rcar_csi2_formats[i];
 
 	return NULL;
@@ -370,8 +359,6 @@ struct rcar_csi2 {
 	struct v4l2_subdev *remote;
 	unsigned int remote_pad;
 
-	struct v4l2_mbus_framefmt mf;
-
 	struct mutex lock;
 	int stream_count;
 
@@ -421,6 +408,32 @@ static int rcsi2_exit_standby(struct rcar_csi2 *priv)
 	return 0;
 }
 
+static int rcsi2_get_remote_frame_desc(struct rcar_csi2 *priv,
+				       struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *pad;
+	int ret;
+
+	if (!priv->remote)
+		return -ENODEV;
+
+	pad = media_entity_remote_pad(&priv->pads[RCAR_CSI2_SINK]);
+	if (!pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
+			       pad->index, fd);
+	if (ret)
+		return ret;
+
+	if (fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(priv->dev, "Frame desc do not describe CSI-2 link");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
 				unsigned int lanes)
 {
@@ -460,11 +473,14 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	return 0;
 }
 
-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
-			   unsigned int lanes)
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
+			   struct v4l2_mbus_frame_desc *fd, unsigned int lanes)
 {
+	const struct v4l2_mbus_frame_desc_entry_csi2 *csi2_desc;
+	const struct rcar_csi2_format *format;
 	struct v4l2_subdev *source;
 	struct v4l2_ctrl *ctrl;
+	unsigned int i;
 	u64 mbps;
 
 	if (!priv->remote)
@@ -480,12 +496,30 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 		return -EINVAL;
 	}
 
+	/* Verify that all remote streams send the same datatype. */
+	csi2_desc = NULL;
+	for (i = 0; i < fd->num_entries; i++) {
+		struct v4l2_mbus_frame_desc_entry_csi2 *stream_desc;
+
+		stream_desc = &fd->entry[i].bus.csi2;
+		if (!csi2_desc)
+			csi2_desc = stream_desc;
+
+		if (csi2_desc->dt != stream_desc->dt) {
+			dev_err(priv->dev,
+				"Remote streams with different DT: %u - %u\n",
+				csi2_desc->dt, stream_desc->dt);
+			return -EINVAL;
+		}
+	}
+	format = rcsi2_datatype_to_fmt(csi2_desc->dt);
+
 	/*
 	 * Calculate the phypll in mbps.
 	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
 	 * bps = link_freq * 2
 	 */
-	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
+	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * format->bpp;
 	do_div(mbps, lanes * 1000000);
 
 	return mbps;
@@ -541,49 +575,64 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 
 static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 {
-	const struct rcar_csi2_format *format;
+	const struct v4l2_subdev_stream_configs *configs;
+	struct v4l2_subdev_state *state;
 	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
+	struct v4l2_mbus_frame_desc fd;
 	unsigned int lanes;
 	unsigned int i;
 	int mbps, ret;
 
-	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
-		priv->mf.width, priv->mf.height,
-		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
-
-	/* Code is validated in set_fmt. */
-	format = rcsi2_code_to_fmt(priv->mf.code);
+	/* Get information about multiplexed link. */
+	ret = rcsi2_get_remote_frame_desc(priv, &fd);
+	if (ret)
+		return ret;
 
-	/*
-	 * Enable all supported CSI-2 channels with virtual channel and
-	 * data type matching.
-	 *
-	 * NOTE: It's not possible to get individual datatype for each
-	 *       source virtual channel. Once this is possible in V4L2
-	 *       it should be used here.
-	 */
-	for (i = 0; i < priv->info->num_channels; i++) {
+	for (i = 0; i < fd.num_entries; i++) {
+		struct v4l2_mbus_frame_desc_entry *entry = &fd.entry[i];
 		u32 vcdt_part;
 
-		vcdt_part = VCDT_SEL_VC(i) | VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
-			VCDT_SEL_DT(format->datatype);
+		vcdt_part = VCDT_SEL_VC(entry->bus.csi2.vc) |
+			VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
+			VCDT_SEL_DT(entry->bus.csi2.dt);
 
 		/* Store in correct reg and offset. */
-		if (i < 2)
-			vcdt |= vcdt_part << ((i % 2) * 16);
+		if (entry->bus.csi2.vc < 2)
+			vcdt |= vcdt_part <<
+				((entry->bus.csi2.vc % 2) * 16);
 		else
-			vcdt2 |= vcdt_part << ((i % 2) * 16);
+			vcdt2 |= vcdt_part <<
+				((entry->bus.csi2.vc % 2) * 16);
+
+		dev_dbg(priv->dev, "VC: %d datatype: 0x%x\n",
+			entry->bus.csi2.vc, entry->bus.csi2.dt);
 	}
 
-	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
-		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
-			| FLD_FLD_EN;
+	/*
+	 * Configure field handling inspecting the formats of the
+	 * single sink pad streams.
+	 */
+	state = v4l2_subdev_lock_active_state(&priv->subdev);
+	configs = &state->stream_configs;
+	for (i = 0; i < configs->num_configs; ++i) {
+		const struct v4l2_subdev_stream_config *config = configs->configs;
+
+		if (config->pad != RCAR_CSI2_SINK)
+			continue;
+
+		if (config->fmt.field != V4L2_FIELD_ALTERNATE)
+			continue;
+
+		fld |= FLD_DET_SEL(1);
+		fld |= FLD_FLD_EN(config->stream);
 
-		if (priv->mf.height == 240)
+		/* PAL vs NTSC. */
+		if (config->fmt.height == 240)
 			fld |= FLD_FLD_NUM(0);
 		else
 			fld |= FLD_FLD_NUM(1);
 	}
+	v4l2_subdev_unlock_state(state);
 
 	/*
 	 * Get the number of active data lanes inspecting the remote mbus
@@ -596,7 +645,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 	phycnt = PHYCNT_ENABLECLK;
 	phycnt |= (1 << lanes) - 1;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, &fd, lanes);
 	if (mbps < 0)
 		return mbps;
 
@@ -722,43 +771,127 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
 
-	if (!rcsi2_code_to_fmt(format->format.code))
-		format->format.code = rcar_csi2_formats[0].code;
+	/*
+	 * Format is propagated from sink streams to source streams, so
+	 * disallow setting format on the single source pad.
+	 */
+	if (format->pad < RCAR_CSI2_SOURCE_VC0)
+		return -EINVAL;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		priv->mf = format->format;
-	} else {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
-		*framefmt = format->format;
+	state = v4l2_subdev_validate_and_lock_state(sd, sd_state);
+	fmt = v4l2_state_get_stream_format(state, format->pad,
+					   format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
 	}
+	*fmt = format->format;
 
-	return 0;
+	/* Propagate format to the other end of the route. */
+	fmt = v4l2_state_get_opposite_stream_format(state, format->pad,
+						    format->stream);
+	if (!fmt) {
+		ret = -EINVAL;
+		goto out;
+	}
+	*fmt = format->format;
+
+out:
+	v4l2_subdev_unlock_state(state);
+	return ret;
 }
 
-static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state,
-				struct v4l2_subdev_format *format)
+static int rcsi2_set_routing(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_krouting *routing)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	int ret;
+
+	ret = v4l2_routing_simple_verify(routing);
+	if (ret)
+		return ret;
+
+	state = v4l2_subdev_validate_and_lock_state(sd, state);
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		format->format = priv->mf;
-	else
-		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+	v4l2_subdev_unlock_state(state);
+
+	if (ret)
+		return ret;
 
 	return 0;
 }
 
+static int rcsi2_init_cfg(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *state)
+{
+	u32 which = state->which;
+
+	/* Initialize 4 routes from each source pad to the single sink pad. */
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 0,
+			.source_pad = RCAR_CSI2_SOURCE_VC0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 1,
+			.source_pad = RCAR_CSI2_SOURCE_VC1,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 2,
+			.source_pad = RCAR_CSI2_SOURCE_VC2,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+		{
+			.sink_pad = RCAR_CSI2_SINK,
+			.sink_stream = 3,
+			.source_pad = RCAR_CSI2_SOURCE_VC3,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.which = which,
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return rcsi2_set_routing(sd, state, &routing);
+}
+
 static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
 	.s_stream = rcsi2_s_stream,
 };
 
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
+	.init_cfg = rcsi2_init_cfg,
 	.set_fmt = rcsi2_set_pad_format,
-	.get_fmt = rcsi2_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_routing = rcsi2_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
@@ -814,6 +947,13 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
 	struct rcar_csi2 *priv = notifier_to_csi2(notifier);
 	int pad;
 
+	if (!v4l2_subdev_has_op(subdev, pad, get_frame_desc)) {
+		dev_err(priv->dev,
+			"Subdev %s bound failed: missing get_frame_desc()\n",
+			subdev->name);
+		return -EINVAL;
+	}
+
 	pad = media_entity_get_fwnode_pad(&subdev->entity, asd->match.fwnode,
 					  MEDIA_PAD_FL_SOURCE);
 	if (pad < 0) {
@@ -1260,7 +1400,8 @@ static int rcsi2_probe(struct platform_device *pdev)
 	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
 	snprintf(priv->subdev.name, V4L2_SUBDEV_NAME_SIZE, "%s %s",
 		 KBUILD_MODNAME, dev_name(&pdev->dev));
-	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+			     V4L2_SUBDEV_FL_MULTIPLEXED;
 
 	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
@@ -1274,16 +1415,23 @@ static int rcsi2_probe(struct platform_device *pdev)
 	if (ret)
 		goto error;
 
+	ret = v4l2_subdev_alloc_state(&priv->subdev);
+	if (ret)
+		goto error;
+
 	pm_runtime_enable(&pdev->dev);
 
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret < 0)
-		goto error;
+		goto error_state;
 
 	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
 
 	return 0;
 
+error_state:
+	v4l2_subdev_free_state(&priv->subdev);
+
 error:
 	v4l2_async_notifier_unregister(&priv->notifier);
 	v4l2_async_notifier_cleanup(&priv->notifier);
@@ -1297,6 +1445,7 @@ static int rcsi2_remove(struct platform_device *pdev)
 
 	v4l2_async_notifier_unregister(&priv->notifier);
 	v4l2_async_notifier_cleanup(&priv->notifier);
+	v4l2_subdev_free_state(&priv->subdev);
 	v4l2_async_unregister_subdev(&priv->subdev);
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.32.0

