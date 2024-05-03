Return-Path: <linux-media+bounces-10694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6B48BB056
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 17:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823082869DA
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 15:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA671553B2;
	Fri,  3 May 2024 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LmIyBWuC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14D155312;
	Fri,  3 May 2024 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751517; cv=none; b=bj1f6vzhOBD40/4wLHLUTnCHEM9NFYECOoQ2FCGzDYxNYPW65Okjd6Hu+DEIbhd3DAyQNnQ6ymC7HynEbhurdcZI23XtfZMRmD121wjvO0EeE5XfmgRHFnVnAbDj9Qe6qjfbnb1rrJh4iBuGlNRtRdhNZcHOXwoVYNLhZz1aUo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751517; c=relaxed/simple;
	bh=XsbQZU6wAkUA3NC/87b/hjIvZMgu/NW315wLgbH7pEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNgcgkRcm1YCvKK7iOetR/0Lb28pOY8pSaJJvqIN7DNoLZSKTMXmLbDynrS/Lyy1BPavHQ6Uoh3Nx5xdnmJWHceqU87EP1BepJk+bL+zqmXLgY/6nPqoagx0SVR6DNqdDMM4nXE0qvDsPVKpG7Dx/kDaXUMCW8BsT+HhhvwSEro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LmIyBWuC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C07425E9;
	Fri,  3 May 2024 17:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714751450;
	bh=XsbQZU6wAkUA3NC/87b/hjIvZMgu/NW315wLgbH7pEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LmIyBWuC1GYihEomAoaMRdGhJ2OVigbx07VIlBvPg9n41MR/JxxLRidFUjX4dx1w4
	 40y7s49wcok0LfTMxhP2UVCJvj30SSI7V5xpMfq1BoUQmRSjs4STzFWELZRKiVOo02
	 EDosBWKXDeMRSU4901vk4R+3Pj3AkEVuy1XyL0yw=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 04/11] media: rcar-csi2: Use the subdev active state
Date: Fri,  3 May 2024 17:51:19 +0200
Message-ID: <20240503155127.105235-5-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
References: <20240503155127.105235-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create the subdevice state with v4l2_subdev_init_finalize() and
implement the init_state() operation to guarantee the state is initialized.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 138 +++++++++++----------
 1 file changed, 75 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 2d464e43a5be..4d4dfb59b025 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -587,7 +587,8 @@ enum rcar_csi2_pads {
 struct rcar_csi2_info {
 	int (*init_phtw)(struct rcar_csi2 *priv, unsigned int mbps);
 	int (*phy_post_init)(struct rcar_csi2 *priv);
-	int (*start_receiver)(struct rcar_csi2 *priv);
+	int (*start_receiver)(struct rcar_csi2 *priv,
+			      struct v4l2_subdev_state *state);
 	void (*enter_standby)(struct rcar_csi2 *priv);
 	const struct rcsi2_mbps_reg *hsfreqrange;
 	unsigned int csi0clkfreqrange;
@@ -613,8 +614,6 @@ struct rcar_csi2 {
 
 	int channel_vc[4];
 
-	struct mutex lock; /* Protects mf and stream_count. */
-	struct v4l2_mbus_framefmt mf;
 	int stream_count;
 
 	bool cphy;
@@ -808,20 +807,25 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 	return 0;
 }
 
-static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
+static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
+				     struct v4l2_subdev_state *state)
 {
 	const struct rcar_csi2_format *format;
 	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
+	struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	unsigned int i;
 	int mbps, ret;
 
+	/* Use the format on the sink pad to compute the receiver config. */
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+
 	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
-		priv->mf.width, priv->mf.height,
-		priv->mf.field == V4L2_FIELD_NONE ? 'p' : 'i');
+		fmt->width, fmt->height,
+		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
 
 	/* Code is validated in set_fmt. */
-	format = rcsi2_code_to_fmt(priv->mf.code);
+	format = rcsi2_code_to_fmt(fmt->code);
 	if (!format)
 		return -EINVAL;
 
@@ -849,11 +853,11 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv)
 			vcdt2 |= vcdt_part << ((i % 2) * 16);
 	}
 
-	if (priv->mf.field == V4L2_FIELD_ALTERNATE) {
+	if (fmt->field == V4L2_FIELD_ALTERNATE) {
 		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
 			| FLD_FLD_EN;
 
-		if (priv->mf.height == 240)
+		if (fmt->height == 240)
 			fld |= FLD_FLD_NUM(0);
 		else
 			fld |= FLD_FLD_NUM(1);
@@ -1049,15 +1053,18 @@ static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
 	return 0;
 }
 
-static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
+static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
+				    struct v4l2_subdev_state *state)
 {
 	const struct rcar_csi2_format *format;
+	struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
 	int msps;
 	int ret;
 
-	/* Calculate parameters */
-	format = rcsi2_code_to_fmt(priv->mf.code);
+	/* Use the format on the sink pad to compute the receiver config. */
+	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+	format = rcsi2_code_to_fmt(fmt->code);
 	if (!format)
 		return -EINVAL;
 
@@ -1114,7 +1121,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv)
 	return 0;
 }
 
-static int rcsi2_start(struct rcar_csi2 *priv)
+static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
 {
 	int ret;
 
@@ -1122,7 +1129,7 @@ static int rcsi2_start(struct rcar_csi2 *priv)
 	if (ret < 0)
 		return ret;
 
-	ret = priv->info->start_receiver(priv);
+	ret = priv->info->start_receiver(priv, state);
 	if (ret) {
 		rcsi2_enter_standby(priv);
 		return ret;
@@ -1146,17 +1153,16 @@ static void rcsi2_stop(struct rcar_csi2 *priv)
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
 
 	if (enable && priv->stream_count == 0) {
-		ret = rcsi2_start(priv);
+		ret = rcsi2_start(priv, state);
 		if (ret)
 			goto out;
 	} else if (!enable && priv->stream_count == 1) {
@@ -1165,49 +1171,26 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
 
 	priv->stream_count += enable ? 1 : -1;
 out:
-	mutex_unlock(&priv->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	struct v4l2_mbus_framefmt *framefmt;
-
-	mutex_lock(&priv->lock);
+	if (format->pad > RCAR_CSI2_SINK)
+		return v4l2_subdev_get_fmt(sd, state, format);
 
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		priv->mf = format->format;
-	} else {
-		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
-		*framefmt = format->format;
-	}
-
-	mutex_unlock(&priv->lock);
-
-	return 0;
-}
-
-static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state,
-				struct v4l2_subdev_format *format)
-{
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-
-	mutex_lock(&priv->lock);
-
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		format->format = priv->mf;
-	else
-		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
+	*v4l2_subdev_state_get_format(state, format->pad) = format->format;
 
-	mutex_unlock(&priv->lock);
+	/* Propagate the format to the source pads. */
+	for (unsigned int i = RCAR_CSI2_SOURCE_VC0; i < NR_OF_RCAR_CSI2_PAD; i++)
+		*v4l2_subdev_state_get_format(state, i) = format->format;
 
 	return 0;
 }
@@ -1218,7 +1201,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
 
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.set_fmt = rcsi2_set_pad_format,
-	.get_fmt = rcsi2_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
@@ -1226,6 +1209,30 @@ static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
 	.pad	= &rcar_csi2_pad_ops,
 };
 
+static int rcsi2_init_state(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state)
+{
+	static const struct v4l2_mbus_framefmt rcar_csi2_default_fmt = {
+		.width		= 1920,
+		.height		= 1080,
+		.code		= MEDIA_BUS_FMT_RGB888_1X24,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.field		= V4L2_FIELD_NONE,
+		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
+		.quantization	= V4L2_QUANTIZATION_DEFAULT,
+		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
+	};
+
+	for (unsigned int i = RCAR_CSI2_SINK; i < NR_OF_RCAR_CSI2_PAD; i++)
+		*v4l2_subdev_state_get_format(state, i) = rcar_csi2_default_fmt;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops rcar_csi2_internal_ops = {
+	.init_state = rcsi2_init_state,
+};
+
 static irqreturn_t rcsi2_irq(int irq, void *data)
 {
 	struct rcar_csi2 *priv = data;
@@ -1251,14 +1258,17 @@ static irqreturn_t rcsi2_irq(int irq, void *data)
 
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
@@ -1870,23 +1880,23 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	priv->dev = &pdev->dev;
 
-	mutex_init(&priv->lock);
 	priv->stream_count = 0;
 
 	ret = rcsi2_probe_resources(priv, pdev);
 	if (ret) {
 		dev_err(priv->dev, "Failed to get resources\n");
-		goto error_mutex;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, priv);
 
 	ret = rcsi2_parse_dt(priv);
 	if (ret)
-		goto error_mutex;
+		return ret;
 
 	priv->subdev.owner = THIS_MODULE;
 	priv->subdev.dev = &pdev->dev;
+	priv->subdev.internal_ops = &rcar_csi2_internal_ops;
 	v4l2_subdev_init(&priv->subdev, &rcar_csi2_subdev_ops);
 	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
 	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
@@ -1912,21 +1922,25 @@ static int rcsi2_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
+	ret = v4l2_subdev_init_finalize(&priv->subdev);
+	if (ret)
+		goto error_pm_runtime;
+
 	ret = v4l2_async_register_subdev(&priv->subdev);
 	if (ret < 0)
-		goto error_pm_runtime;
+		goto error_subdev;
 
 	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
 
 	return 0;
 
+error_subdev:
+	v4l2_subdev_cleanup(&priv->subdev);
 error_pm_runtime:
 	pm_runtime_disable(&pdev->dev);
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
-error_mutex:
-	mutex_destroy(&priv->lock);
 
 	return ret;
 }
@@ -1941,8 +1955,6 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 
 	pm_runtime_disable(&pdev->dev);
-
-	mutex_destroy(&priv->lock);
 }
 
 static struct platform_driver rcar_csi2_pdrv = {
-- 
2.44.0


