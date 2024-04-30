Return-Path: <linux-media+bounces-10437-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 053A68B6FE0
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8539E1F235F1
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3E812C49C;
	Tue, 30 Apr 2024 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OFMILY4p"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B67112C46D;
	Tue, 30 Apr 2024 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473634; cv=none; b=epIAX8T6GCE0X5pDyp9hyyPOC1/InuLZo/Bu3Ns9Zp2Y6pWzDFA7o9z1rZWHCkMWeXfuHEV8PZxizNLm8zBSQ0/2DlF+KAyygE0N23wmMQ6KA2RrlOnn4VOOuV7cGv1hw+sc7TrUgINqrzo2q6djwLYxW4DNkI7HDMwM99SBYk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473634; c=relaxed/simple;
	bh=643EKCY0VKVvEP87/t7wh9Rtbo+xsrbLDuMNmnJ9t+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyr4PT5YqydX+dynlxybWxdZoXe3Q5Kix8lfyhRD+aDpnAI3eoUPq83UuDcq8lwn3U5tzXC+kwsRsrkYnM1qpMHZMmeWG6M4fjCw8H153eFW0MLOrB+ZHF75HvJM501bWlxujbXJsSXuSlmM3wIlGMzAsOk5Eh1mwKWn7YZDk9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OFMILY4p; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B5764D4;
	Tue, 30 Apr 2024 12:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473563;
	bh=643EKCY0VKVvEP87/t7wh9Rtbo+xsrbLDuMNmnJ9t+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OFMILY4pKcyKX+beO32qULZvCc4Q5dcRJ6NToo/iFUcxSpnr+tnD/riv7wtan3ElZ
	 l5PXsjhAYSGInnHAuh9BLI1aw02susc+NzFj6muuNQIvPClXW580n3SkjTRZ9uyHWA
	 aRlmRUk4zowBFePycmrxyffYeZke1/pApLoVcC0w=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 13/19] media: max9286: Implement support for LINK_FREQ
Date: Tue, 30 Apr 2024 12:39:49 +0200
Message-ID: <20240430103956.60190-14-jacopo.mondi@ideasonboard.com>
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

The max9286 now supports multiple streams. For this reason, reporting
the data bitrate through the PIXEL_RATE control is not meaningful
anymore (or better, is less meaningful that what it already was).

In order to support multiplexed receivers, which want to be informed
about the CSI-2 link frequency, implement support for the
V4L2_CID_LINK_FREQ control.

Record in the driver a set of pre-computed link frequencies in order to
support the two currently supported GMSL camera modules (rdacm20 and
rdacm21) and all the supported number of active channels and CSI-2 data
lanes.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 143 ++++++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 4b4f4c03c10a..0e08a1041eed 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -148,6 +148,12 @@ struct max9286_format_info {
 	u32 code;
 	/* The gmsl data format configuration. */
 	u8 gmsl_dt;
+	/*
+	 * gmsl_bpp is the pixel format bit-width per word as reported in
+	 * table 20. and it is used to calculate the GMSL bandwidth and CSI-2
+	 * link speed.
+	 */
+	u8 gmsl_bpp;
 	/* The format bpp, used for stride calculation. */
 	u8 bpp;
 	/* The Data Type identifier as defined by the MIPI CSI-2 standard. */
@@ -201,6 +207,7 @@ struct max9286_priv {
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *pixelrate_ctrl;
+	struct v4l2_ctrl *link_freq;
 	unsigned int pixelrate;
 
 	unsigned int nsources;
@@ -242,41 +249,49 @@ static const struct max9286_format_info max9286_formats[] = {
 	{
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.gmsl_dt = MAX9286_DATATYPE_YUV422_8BIT,
+		.gmsl_bpp = 8,
 		.bpp = 16,
 		.mipi_dt = MIPI_CSI2_DT_YUV422_8B,
 	}, {
 		.code = MEDIA_BUS_FMT_VYUY8_1X16,
 		.gmsl_dt = MAX9286_DATATYPE_YUV422_8BIT,
+		.gmsl_bpp = 8,
 		.bpp = 16,
 		.mipi_dt = MIPI_CSI2_DT_YUV422_8B,
 	}, {
 		.code = MEDIA_BUS_FMT_YUYV8_1X16,
 		.gmsl_dt = MAX9286_DATATYPE_YUV422_8BIT,
+		.gmsl_bpp = 8,
 		.bpp = 16,
 		.mipi_dt = MIPI_CSI2_DT_YUV422_8B,
 	}, {
 		.code = MEDIA_BUS_FMT_YVYU8_1X16,
 		.gmsl_dt = MAX9286_DATATYPE_YUV422_8BIT,
+		.gmsl_bpp = 8,
 		.bpp = 16,
 		.mipi_dt = MIPI_CSI2_DT_YUV422_8B,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
 		.gmsl_dt = MAX9286_DATATYPE_RAW12,
+		.gmsl_bpp = 12,
 		.bpp = 12,
 		.mipi_dt = MIPI_CSI2_DT_RAW12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
 		.gmsl_dt = MAX9286_DATATYPE_RAW12,
+		.gmsl_bpp = 12,
 		.bpp = 12,
 		.mipi_dt = MIPI_CSI2_DT_RAW12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
 		.gmsl_dt = MAX9286_DATATYPE_RAW12,
+		.gmsl_bpp = 12,
 		.bpp = 12,
 		.mipi_dt = MIPI_CSI2_DT_RAW12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
 		.gmsl_dt = MAX9286_DATATYPE_RAW12,
+		.gmsl_bpp = 12,
 		.bpp = 12,
 		.mipi_dt = MIPI_CSI2_DT_RAW12,
 	},
@@ -293,6 +308,60 @@ static const struct max9286_i2c_speed max9286_i2c_speeds[] = {
 	{ .rate = 837000, .mstbt = MAX9286_I2CMSTBT_837KBPS },
 };
 
+/*
+ * According to the chip manual the CSI-2 link frequency is calculated as:
+ *
+ *     f-CSI2 = pclk * ((width * channels) / lanes)
+ *
+ * Where:
+ *     pclk = serializer input word rate
+ *     width = pixel format bits per word (gmsl_bpp in max9286_format_info)
+ *     channels = number of enabled links
+ *     lanes = number of CSI-2 data lanes
+ *
+ * The following link frequencies have been computed by combining the following
+ * parameters:
+ *
+ * pixel_rates[] = { 44000000, 55000000 }; for RDACM20 and RDACM21
+ * bpps[] = { 8, 12 }; for the formats supported by the max9286 driver
+ * channels[] = { 1, 2, 3, 4 };
+ * lanes[] = { 1, 2, 3, 4 };
+ *
+ * and by filtering out all results that would lead to an invalid
+ * link_frequency, as the MAX9286 has a CSI-2 bandwidth limit of 1200Mbps per
+ * lane (600MHz clock frequency).
+ *
+ * If a new serializer with a different pixel rate, or a new image format with
+ * a different bpp is supported, the below table needs to be updated.
+ */
+static const s64 max9286_link_freqs[] = {
+	88000000,
+	110000000,
+	132000000,
+	165000000,
+	176000000,
+	220000000,
+	264000000,
+	275000000,
+	330000000,
+	352000000,
+	396000000,
+	440000000,
+	495000000,
+	528000000,
+	550000000,
+};
+
+static int max9286_get_link_freq_index(s64 link_freq)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(max9286_link_freqs); ++i) {
+		if (max9286_link_freqs[i] == link_freq)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
 /* -----------------------------------------------------------------------------
  * I2C IO
  */
@@ -636,10 +705,18 @@ static void max9286_set_fsync_period(struct max9286_priv *priv,
  * V4L2 Subdev
  */
 
-static int max9286_set_pixelrate(struct max9286_priv *priv)
+static int max9286_set_pixelrate(struct max9286_priv *priv,
+				 struct v4l2_subdev_state *state,
+				 unsigned int link_index)
 {
+	const struct max9286_format_info *info;
 	struct max9286_source *source = NULL;
+	struct v4l2_mbus_framefmt *fmt;
+	unsigned int num_sources = 0;
+	int link_freq_index;
 	u64 pixelrate = 0;
+	s64 link_freq;
+	int ret;
 
 	for_each_source(priv, source) {
 		struct v4l2_ctrl *ctrl;
@@ -662,6 +739,8 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
 				"Unable to calculate pixel rate\n");
 			return -EINVAL;
 		}
+
+		num_sources++;
 	}
 
 	if (!pixelrate) {
@@ -670,14 +749,33 @@ static int max9286_set_pixelrate(struct max9286_priv *priv)
 		return -EINVAL;
 	}
 
-	priv->pixelrate = pixelrate;
+	fmt = v4l2_subdev_state_get_format(state, link_index);
+	info = max9286_get_format_info(fmt->code);
+	if (WARN_ON(!info))
+		return -EINVAL;
+
+	/*
+	 * Compute the link frequency and find the right index to update
+	 * the menu control with.
+	 */
+	link_freq = pixelrate * ((info->gmsl_bpp * num_sources) /
+		    priv->csi2_data_lanes);
+
+	link_freq_index = max9286_get_link_freq_index(link_freq);
+	if (WARN_ON(link_freq_index < 0))
+		return -EINVAL;
 
 	/*
 	 * The CSI-2 transmitter pixel rate is the single source rate multiplied
 	 * by the number of available sources.
 	 */
-	return v4l2_ctrl_s_ctrl_int64(priv->pixelrate_ctrl,
-				      pixelrate * priv->nsources);
+	ret = __v4l2_ctrl_s_ctrl_int64(priv->pixelrate_ctrl,
+				       pixelrate * priv->nsources);
+	if (ret)
+		return -EINVAL;
+	priv->pixelrate = pixelrate;
+
+	return __v4l2_ctrl_s_ctrl(priv->link_freq, link_freq_index);
 }
 
 static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
@@ -687,6 +785,7 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
 	struct max9286_source *source = to_max9286_asd(asd)->source;
 	unsigned int index = to_index(priv, source);
+	struct v4l2_subdev_state *state;
 	unsigned int src_pad;
 	int ret;
 
@@ -739,7 +838,11 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
 	max9286_check_config_link(priv, priv->source_mask);
 	max9286_configure_i2c(priv, false);
 
-	return max9286_set_pixelrate(priv);
+	state = v4l2_subdev_lock_and_get_active_state(notifier->sd);
+	ret = max9286_set_pixelrate(priv, state, index);
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
 }
 
 static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -926,7 +1029,9 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state,
 			   struct v4l2_subdev_format *format)
 {
+	struct max9286_priv *priv = sd_to_max9286(sd);
 	const struct max9286_format_info *info;
+	int ret;
 
 	/*
 	 * Disable setting format on the source pad: format is propagated
@@ -949,7 +1054,22 @@ static int max9286_set_fmt(struct v4l2_subdev *sd,
 	*v4l2_subdev_state_get_opposite_stream_format(state, format->pad, 0) =
 		format->format;
 
-	return 0;
+	/*
+	 * Update the pixel rate and link_rate controls. We cannot do that in
+	 * s_stream() as the receiver is likely fetching the frame_desc and
+	 * reading the link_rate control before calling this driver's s_stream.
+	 *
+	 * Update the controls here.
+	 *
+	 * TODO: Once the routing table will be made writable and links
+	 * can be enabled/disabled, the controls need to be updated there too.
+	 */
+	ret = max9286_set_pixelrate(priv, state, format->pad);
+	if (ret)
+		dev_err(&priv->client->dev,
+			"Unsupported format/lanes/channel combination: clock rate too high");
+
+	return ret;
 }
 
 static int max9286_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
@@ -1068,6 +1188,7 @@ static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	switch (ctrl->id) {
 	case V4L2_CID_PIXEL_RATE:
+	case V4L2_CID_LINK_FREQ:
 		return 0;
 	default:
 		return -EINVAL;
@@ -1097,12 +1218,20 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			  V4L2_SUBDEV_FL_STREAMS;
 
-	v4l2_ctrl_handler_init(&priv->ctrls, 1);
+	v4l2_ctrl_handler_init(&priv->ctrls, 2);
 	priv->pixelrate_ctrl = v4l2_ctrl_new_std(&priv->ctrls,
 						 &max9286_ctrl_ops,
 						 V4L2_CID_PIXEL_RATE,
 						 1, INT_MAX, 1, 50000000);
 
+	priv->link_freq =
+		v4l2_ctrl_new_int_menu(&priv->ctrls, &max9286_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       ARRAY_SIZE(max9286_link_freqs) - 1, 0,
+				       max9286_link_freqs);
+	if (priv->link_freq)
+		priv->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
 	priv->sd.ctrl_handler = &priv->ctrls;
 	ret = priv->ctrls.error;
 	if (ret)
-- 
2.44.0


