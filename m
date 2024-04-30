Return-Path: <linux-media+bounces-10441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B978B6FE8
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C9912851C2
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D9912C473;
	Tue, 30 Apr 2024 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B0qRmjQE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7DF12C472;
	Tue, 30 Apr 2024 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473639; cv=none; b=mmx2i4pNiwrkNv29f936LRz0TX9phgAYnG3qvli5y5UzfZ4mJ4tpOMOrE2eAv2aCfhguEfZPp1Vjft/kCNEKczupnrYxfwcErQwhULwv7Sk9SqagZ1qmH8G8zB2JdUr3R1ai4v0caslsyhoE5BN7cfGzrQsmP6+cHYo+i+eqiww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473639; c=relaxed/simple;
	bh=7Ax/k1w0vJ/TET2YSeyJflDNJ10/lSPmD7Ztu8xL5gA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ICCwWPC4IhMfLnmC9DFpm2OeuqPsuQL5kvl6rGv6U+MNetbqdrR3CsNiLnPZsEQI5x6seapG8a/TQygftoHNNRrEsl59O2I6MfRL88v2DarqjYyrWwv9CXULC9tZHBjMdU25iJrhUKx+0QTqoU08TRRRZBlV7kIxvmPwMVOMnQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B0qRmjQE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CE932CAC;
	Tue, 30 Apr 2024 12:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473565;
	bh=7Ax/k1w0vJ/TET2YSeyJflDNJ10/lSPmD7Ztu8xL5gA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B0qRmjQEPOEXAExocITwSjSSFC8UmfZ1pOe8xlnggwm/Enz87VALcmz/7dfrr9yGl
	 AkFPtoJ7nOXtx1/uWjrGNOgxEbiNI4hCxl/nBw+iGFG4XTtGqur1XiRwJE7dQHphO7
	 en/Hd+qBaAlastc4/xN+nN464c1GdFfhSZKOWufg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 16/19] media: rcar-csi2: Support multiplexed transmitters
Date: Tue, 30 Apr 2024 12:39:52 +0200
Message-ID: <20240430103956.60190-17-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
References: <20240430103956.60190-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the R-Car CSI-2 start routine to support multiplexed
transmitters.

Configure the CSI-2 receiver MIPI CSI-2 Data Type filtering by inspecting
the remote subdev frame_desc instead of relying on the image format
configured on the sink pad.

Enable MIPI CSI-2 Data Type filtering by inspecting the remote subdevice
frame descriptor to discern which Data Type is transmitted on which
Virtual Channel. If multiple Data Types are transmitted on the same VC
then Data Type filtering is disabled.

Rework the per-lane bandwidth calculation to use the LINK_FREQ control
if a transmitter sends multiple streams on the same data link. The
current usage of the PIXEL_RATE control does not support multiplexed
transmitters, as there's not a unique pixel rate among all the possible
source streams.

This change makes mandatory for any subdevice that operates with
the R-Car CSI-2 receiver to implement the .get_frame_desc() operation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 280 ++++++++++++++-------
 1 file changed, 191 insertions(+), 89 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 82dc0b92b8d3..ffb73272543b 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
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
@@ -575,6 +572,16 @@ static const struct rcar_csi2_format *rcsi2_code_to_fmt(unsigned int code)
 	return NULL;
 }
 
+static const struct rcar_csi2_format *rcsi2_datatype_to_fmt(unsigned int dt)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(rcar_csi2_formats); i++) {
+		if (rcar_csi2_formats[i].datatype == dt)
+			return &rcar_csi2_formats[i];
+	}
+
+	return NULL;
+}
+
 enum rcar_csi2_pads {
 	RCAR_CSI2_SINK,
 	RCAR_CSI2_SOURCE_VC0,
@@ -587,7 +594,8 @@ enum rcar_csi2_pads {
 struct rcar_csi2_info {
 	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
 	int (*phy_post_init)(struct rcar_csi2 *priv);
-	int (*start_receiver)(struct rcar_csi2 *priv);
+	int (*start_receiver)(struct rcar_csi2 *priv,
+			      struct v4l2_subdev_state *state);
 	void (*enter_standby)(struct rcar_csi2 *priv);
 	const struct rcsi2_mbps_reg *hsfreqrange;
 	unsigned int csi0clkfreqrange;
@@ -676,6 +684,32 @@ static int rcsi2_exit_standby(struct rcar_csi2 *priv)
 	return 0;
 }
 
+static int rcsi2_get_remote_frame_desc(struct rcar_csi2 *priv,
+				       struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *pad;
+	int ret;
+
+	if (!priv->remote)
+		return -ENOLINK;
+
+	pad = media_pad_remote_pad_unique(&priv->pads[RCAR_CSI2_SINK]);
+	if (IS_ERR(pad))
+		return PTR_ERR(pad);
+
+	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
+			       pad->index, fd);
+	if (ret)
+		return ret;
+
+	if (fd->type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(priv->dev, "Frame desc does not describe a CSI-2 link");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int rcsi2_wait_phy_start(struct rcar_csi2 *priv,
 				unsigned int lanes)
 {
@@ -726,41 +760,6 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
 	return 0;
 }
 
-static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
-			   unsigned int lanes)
-{
-	struct v4l2_subdev *source;
-	struct v4l2_ctrl *ctrl;
-	u64 mbps;
-
-	if (!priv->remote)
-		return -ENODEV;
-
-	source = priv->remote;
-
-	/* Read the pixel rate control from remote. */
-	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		dev_err(priv->dev, "no pixel rate control in subdev %s\n",
-			source->name);
-		return -EINVAL;
-	}
-
-	/*
-	 * Calculate the phypll in mbps.
-	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
-	 * bps = link_freq * 2
-	 */
-	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
-	do_div(mbps, lanes * 1000000);
-
-	/* Adjust for C-PHY, divide by 2.8. */
-	if (priv->cphy)
-		mbps = div_u64(mbps * 5, 14);
-
-	return mbps;
-}
-
 static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 				  unsigned int *lanes)
 {
@@ -808,52 +807,146 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 	return 0;
 }
 
-static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
+static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
+			   struct v4l2_mbus_frame_desc *fd, unsigned int lanes)
 {
-	const struct rcar_csi2_format *format;
+	struct v4l2_subdev *source;
+	unsigned int bpp;
+	s64 link_freq;
+	u64 mbps;
+
+	if (!priv->remote)
+		return -ENODEV;
+
+	source = priv->remote;
+
+	/*
+	 * v4l2_get_link_freq() uses V4L2_CID_LINK_FREQ first, and falls back
+	 * to V4L2_CID_PIXEL_RATE if V4L2_CID_LINK_FREQ is not available.
+	 *
+	 * With multistream input there is no single pixel rate, and thus we
+	 * cannot use V4L2_CID_PIXEL_RATE, so we pass 0 as the bpp which
+	 * causes v4l2_get_link_freq() to return an error if it falls back to
+	 * V4L2_CID_PIXEL_RATE.
+	 */
+
+	if (fd->num_entries > 1) {
+		bpp = 0;
+	} else {
+		struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+		const struct rcar_csi2_format *format;
+
+		format = rcsi2_datatype_to_fmt(entry->bus.csi2.dt);
+		if (WARN_ON(!format))
+			return -EINVAL;
+
+		bpp = format->bpp;
+	}
+
+	/*
+	 * Calculate the phypll in mbps.
+	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
+	 * bps = link_freq * 2
+	 */
+	link_freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
+	if (link_freq < 0) {
+		dev_err(priv->dev, "Failed to get remote subdev link freq\n");
+		return link_freq;
+	}
+
+	mbps = 2 * link_freq;
+	do_div(mbps, 1000000);
+
+	/* Adjust for C-PHY, divide by 2.8. */
+	if (priv->cphy)
+		mbps = div_u64(mbps * 5, 14);
+
+	return mbps;
+}
+
+static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
+				     struct v4l2_subdev_state *state)
+{
+	const struct v4l2_subdev_stream_configs *configs;
 	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
+	struct v4l2_mbus_frame_desc fd;
 	unsigned int lanes;
-	unsigned int i;
 	int mbps, ret;
 
-	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
-		priv->mf.width, priv->mf.height,
-		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
-
-	/* Code is validated in set_fmt. */
-	format = rcsi2_code_to_fmt(priv->mf.code);
-	if (!format)
-		return -EINVAL;
+	/* Get information about multiplexed link. */
+	ret = rcsi2_get_remote_frame_desc(priv, &fd);
+	if (ret)
+		return ret;
 
 	/*
-	 * Enable all supported CSI-2 channels with virtual channel and
-	 * data type matching.
+	 * Configure and enable the R-Car CSI-2 channels.
 	 *
-	 * NOTE: It's not possible to get individual datatype for each
-	 *       source virtual channel. Once this is possible in V4L2
-	 *       it should be used here.
+	 * The VC transmitted on the channel is configured by the [CSI-2->VIN]
+	 * link_setup operation, while the data type to match comes from the
+	 * remote subdevice.
 	 */
-	for (i = 0; i < priv->info->num_channels; i++) {
-		u32 vcdt_part;
+	for (unsigned int i = 0; i < priv->info->num_channels; i++) {
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
 
+		/* CSI-2 channel disabled (not linked to any VIN). */
 		if (priv->channel_vc[i] < 0)
 			continue;
 
-		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
-			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
+		u32 vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) |
+				VCDT_VCDTN_EN | VCDT_SEL_DTN_ON;
+
+		/*
+		 * Search the entries that describe the data types on the
+		 * MIPI CSI-2 Virtual Channel assigned to this CSI-2 channel.
+		 */
+		for (unsigned int e = 0; e < fd.num_entries; e++) {
+			if (fd.entry[e].bus.csi2.vc != priv->channel_vc[i])
+				continue;
+
+			/*
+			 * If multiple data types are sent on the same MIPI
+			 * CSI-2 Virtual Channel, disable Data Type matching.
+			 */
+			if (entry) {
+				vcdt_part &= ~VCDT_SEL_DTN_ON;
+				break;
+			}
+
+			entry = &fd.entry[e];
+			vcdt_part |= VCDT_SEL_DT(entry->bus.csi2.dt);
+		}
+
+		if (!entry)
+			continue;
 
 		/* Store in correct reg and offset. */
 		if (i < 2)
 			vcdt |= vcdt_part << ((i % 2) * 16);
 		else
 			vcdt2 |= vcdt_part << ((i % 2) * 16);
+
+		dev_dbg(priv->dev, "channel %u: VC = %d, datatype = 0x%x\n",
+			i, priv->channel_vc[i], entry->bus.csi2.dt);
 	}
 
-	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
-		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
-			| FLD_FLD_EN;
+	/*
+	 * Configure field handling inspecting the formats of the
+	 * sink pad streams.
+	 */
+	configs = &state->stream_configs;
+	for (unsigned int i = 0; i < configs->num_configs; ++i) {
+		const struct v4l2_subdev_stream_config *config = configs->configs;
+
+		if (config->pad != RCAR_CSI2_SINK)
+			continue;
 
-		if (priv->mf.height == 240)
+		if (config->fmt.field != V4L2_FIELD_ALTERNATE)
+			continue;
+
+		fld |= FLD_DET_SEL(1) | FLD_FLD_EN(config->stream);
+
+		/* PAL vs NTSC. */
+		if (config->fmt.height == 240)
 			fld |= FLD_FLD_NUM(0);
 		else
 			fld |= FLD_FLD_NUM(1);
@@ -870,7 +963,7 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
 	phycnt = PHYCNT_ENABLECLK;
 	phycnt |= (1 << lanes) - 1;
 
-	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	mbps = rcsi2_calc_mbps(priv, &fd, lanes);
 	if (mbps < 0)
 		return mbps;
 
@@ -1049,23 +1142,24 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
 	return 0;
 }
 
-static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
+static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
+				    struct v4l2_subdev_state *state)
 {
-	const struct rcar_csi2_format *format;
+	struct v4l2_mbus_frame_desc fd;
 	unsigned int lanes;
 	int msps;
 	int ret;
 
 	/* Calculate parameters */
-	format = rcsi2_code_to_fmt(priv->mf.code);
-	if (!format)
-		return -EINVAL;
-
 	ret = rcsi2_get_active_lanes(priv, &lanes);
 	if (ret)
 		return ret;
 
-	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	ret = rcsi2_get_remote_frame_desc(priv, &fd);
+	if (ret)
+		return ret;
+
+	msps = rcsi2_calc_mbps(priv, &fd, lanes);
 	if (msps < 0)
 		return msps;
 
@@ -1114,7 +1208,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
 	return 0;
 }
 
-static int rcsi2_start(struct rcar_csi2 *priv)
+static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
 {
 	int ret;
 
@@ -1122,7 +1216,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
 	if (ret < 0)
 		return ret;
 
-	ret = priv->info->start_receiver(priv);
+	ret = priv->info->start_receiver(priv, state);
 	if (ret) {
 		rcsi2_enter_standby(priv);
 		return ret;
@@ -1146,26 +1240,24 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
 static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
-	mutex_lock(&priv->lock);
+	if (!priv->remote)
+		return -ENODEV;
 
-	if (!priv->remote) {
-		ret = -ENODEV;
-		goto out;
-	}
+	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
 
-	if (enable && priv->stream_count == 0) {
-		ret = rcsi2_start(priv);
-		if (ret)
-			goto out;
-	} else if (!enable && priv->stream_count == 1) {
+	if (enable && priv->stream_count == 0)
+		ret = rcsi2_start(priv, state);
+	else if (!enable && priv->stream_count == 1)
 		rcsi2_stop(priv);
-	}
+	if (ret)
+		goto out;
 
 	priv->stream_count += enable ? 1 : -1;
 out:
-	mutex_unlock(&priv->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1310,14 +1402,17 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
 
 static irqreturn_t rcsi2_irq_thread(int irq, void *data)
 {
+	struct v4l2_subdev_state *state;
 	struct rcar_csi2 *priv = data;
 
-	mutex_lock(&priv->lock);
+	state = v4l2_subdev_lock_and_get_active_state(&priv->subdev);
+
 	rcsi2_stop(priv);
 	usleep_range(1000, 2000);
-	if (rcsi2_start(priv))
+	if (rcsi2_start(priv, state))
 		dev_warn(priv->dev, "Failed to restart CSI-2 receiver\n");
-	mutex_unlock(&priv->lock);
+
+	v4l2_subdev_unlock_state(state);
 
 	return IRQ_HANDLED;
 }
@@ -1340,6 +1435,13 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
 		return pad;
 	}
 
+	if (!v4l2_subdev_has_op(subdev, pad, get_frame_desc)) {
+		dev_err(priv->dev,
+			"Subdev %s bound failed: missing get_frame_desc()\n",
+			subdev->name);
+		return -EINVAL;
+	}
+
 	priv->remote = subdev;
 	priv->remote_pad = pad;
 
-- 
2.44.0


