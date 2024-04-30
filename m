Return-Path: <linux-media+bounces-10440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942398B6FE7
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5D751C21A4B
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0168212CDB5;
	Tue, 30 Apr 2024 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hke8nULh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9BD12C473;
	Tue, 30 Apr 2024 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473639; cv=none; b=FJm4rjI5qPFrr0a01DdqsWP20acJk9I6etOID0ucngP+w0f3iPAwHj3RZr6zt9L70DOb+Y1KpFLAijKJy2HmanQVUIkLA/d0Oh23JtLmCuJaaRJSvXWT1ugTznQ+uy7x6OEg0KPMtjfC6qx5f6k2bV1BUZvqq1HrSQXLemZ00Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473639; c=relaxed/simple;
	bh=Wxbe8p9hvaCBdbXirJUZKwQh08SGBKt5X5UI6CQi8hE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUjAB2wwiWoCXDonLyLaqICxG62cRJrlT+ChK38Duu2Y64D6hZlCzaCmDgXQysRErFHyVxeYPOkhvhVA2XczglIFnpd0eRpSh7Wc+Nxj6jPuZcA4PcOPOHb7FTlVG+tB4q1FVNZyrcqv1/2s6/BwCfu/9Jv1j5tcYkeN0F4bI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hke8nULh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A63E7E45;
	Tue, 30 Apr 2024 12:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714473566;
	bh=Wxbe8p9hvaCBdbXirJUZKwQh08SGBKt5X5UI6CQi8hE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hke8nULh9pPAi2drkaj8FIWKpI1mElDEiMRk4MmG9mGT0XtHzr7vW/+7YXsaBv29/
	 fd84QjZUUqHUvQ1f4Zx4zpGBx0DRTos9ejcAMqMEy9LfqOr0ML+1GGQEv4gjNcaVqU
	 FApFnSOh8CSsctIz0tf56/cBWxD0WNPssK4GE05U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 17/19] media: rcar-csi2: Store format in the subdev state
Date: Tue, 30 Apr 2024 12:39:53 +0200
Message-ID: <20240430103956.60190-18-jacopo.mondi@ideasonboard.com>
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

Store the format in the subdevice state. Disallow setting format
on the source pads, as formats are set on the sink pad streams and
propagated to the source streams.

Now that the driver doesn't store the active format in the
driver-specific structure, also remove the mutex and use the lock
associated with the state.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 54 +++++++---------------
 1 file changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index ffb73272543b..ed818a6fa655 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -621,8 +621,6 @@ struct rcar_csi2 {
 
 	int channel_vc[4];
 
-	struct mutex lock; /* Protects mf and stream_count. */
-	struct v4l2_mbus_framefmt mf;
 	int stream_count;
 
 	bool cphy;
@@ -1263,43 +1261,28 @@ static int rcsi2_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_format *format)
 {
-	struct rcar_csi2 *priv = sd_to_csi2(sd);
-	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(&priv->lock);
+	/*
+	 * Format is propagated from sink streams to source streams, so
+	 * disallow setting format on the source pads.
+	 */
+	if (format->pad > RCAR_CSI2_SINK)
+		return -EINVAL;
 
 	if (!rcsi2_code_to_fmt(format->format.code))
 		format->format.code = rcar_csi2_formats[0].code;
 
-	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		priv->mf = format->format;
-	} else {
-		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
-		*framefmt = format->format;
-	}
 
-	mutex_unlock(&priv->lock);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	*fmt = format->format;
 
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
-
-	mutex_unlock(&priv->lock);
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	*fmt = format->format;
 
 	return 0;
 }
@@ -1310,7 +1293,7 @@ static const struct v4l2_subdev_video_ops rcar_csi2_video_ops = {
 
 static const struct v4l2_subdev_pad_ops rcar_csi2_pad_ops = {
 	.set_fmt = rcsi2_set_pad_format,
-	.get_fmt = rcsi2_get_pad_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 };
 
 static const struct v4l2_subdev_ops rcar_csi2_subdev_ops = {
@@ -2031,20 +2014,19 @@ static int rcsi2_probe(struct platform_device *pdev)
 
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
@@ -2094,8 +2076,6 @@ static int rcsi2_probe(struct platform_device *pdev)
 error_async:
 	v4l2_async_nf_unregister(&priv->notifier);
 	v4l2_async_nf_cleanup(&priv->notifier);
-error_mutex:
-	mutex_destroy(&priv->lock);
 
 	return ret;
 }
@@ -2110,8 +2090,6 @@ static void rcsi2_remove(struct platform_device *pdev)
 	v4l2_subdev_cleanup(&priv->subdev);
 
 	pm_runtime_disable(&pdev->dev);
-
-	mutex_destroy(&priv->lock);
 }
 
 static struct platform_driver rcar_csi2_pdrv = {
-- 
2.44.0


