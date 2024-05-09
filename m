Return-Path: <linux-media+bounces-11227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 524758C128A
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 18:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A935DB2232C
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2024 16:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1812170822;
	Thu,  9 May 2024 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="shjOWrBF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CE816F84C;
	Thu,  9 May 2024 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715271272; cv=none; b=tsJIgtblQvHEPaB8ejwkSRvmdFdJcTb2gW1bA+oaVWH5D2z1LA7I+Egg5f9WDNK4A06SVcLwCAqbTwYuXy2feGy3l0Yel2yV3TYV2b+6HZuSmKCYRMnJCX4+LqtwC4WLrrVn7/7F7uK75GTudQzuG4HhTAwRt/toKJC8IYsBLr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715271272; c=relaxed/simple;
	bh=8A+hAm7nUK4UWzuhEGIxmeW4kO1uMBDgo9ht4P0P8Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sS9HDLG7gieZfwl7/v1dH4AhbcRknD+H0V2VxTw3THgYR2reLDl23A3DzhKZsYjn08uU0jNqxeJdi4Wm3FH6dEGO1ZXzLVKF8bwO7HOpEFdEOCPEfC67EzpXopK9oh1QZu/RF6oQtrkNL+83J9tuGIiexBKfaxbvev2R6EvR2fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=shjOWrBF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D14C2FA0;
	Thu,  9 May 2024 18:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715271258;
	bh=8A+hAm7nUK4UWzuhEGIxmeW4kO1uMBDgo9ht4P0P8Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=shjOWrBFI8MpRqQcD8D/hTQC8caanHVN/HzLmEvJLt2mUeDKY8jWEVT50Sy2Hswdq
	 wWeSUHdWYaV77SWV6RIu+YQ5M66/GB4v4HY5L3sNzab4TpA14mbs/0QhPBJwOwTEkH
	 DwbPAUeWBkTEoq131CDWgzLi8pFrl82eAJ4oS37I=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 07/11] media: adv748x-csi2: Use the subdev active state
Date: Thu,  9 May 2024 18:13:57 +0200
Message-ID: <20240509161403.111789-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
References: <20240509161403.111789-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize and use the subdev active state to store the subdevice
format.

This simplifies the implementation of the get_fmt and set_fmt pad
operations.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-csi2.c | 107 +++++++++--------------
 drivers/media/i2c/adv748x/adv748x.h      |   1 -
 2 files changed, 42 insertions(+), 66 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index 0cdb397d9e0a..ebe7da8ebed7 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/mutex.h>
 
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -68,7 +67,33 @@ static int adv748x_csi2_register_link(struct adv748x_csi2 *tx,
 
 /* -----------------------------------------------------------------------------
  * v4l2_subdev_internal_ops
- *
+ */
+
+static int adv748x_csi2_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	static const struct v4l2_mbus_framefmt adv748x_csi2_default_fmt = {
+		.width		= 1280,
+		.height		= 720,
+		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
+		.colorspace	= V4L2_COLORSPACE_SRGB,
+		.field		= V4L2_FIELD_NONE,
+		.ycbcr_enc	= V4L2_YCBCR_ENC_DEFAULT,
+		.quantization	= V4L2_QUANTIZATION_DEFAULT,
+		.xfer_func	= V4L2_XFER_FUNC_DEFAULT,
+	};
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, ADV748X_CSI2_SINK);
+	*fmt = adv748x_csi2_default_fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, ADV748X_CSI2_SOURCE);
+	*fmt = adv748x_csi2_default_fmt;
+
+	return 0;
+}
+
+/*
  * We use the internal registered operation to be able to ensure that our
  * incremental subdevices (not connected in the forward path) can be registered
  * against the resulting video path and media device.
@@ -118,6 +143,7 @@ static int adv748x_csi2_registered(struct v4l2_subdev *sd)
 }
 
 static const struct v4l2_subdev_internal_ops adv748x_csi2_internal_ops = {
+	.init_state = adv748x_csi2_init_state,
 	.registered = adv748x_csi2_registered,
 };
 
@@ -183,41 +209,6 @@ static int adv748x_csi2_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static struct v4l2_mbus_framefmt *
-adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
-			    struct v4l2_subdev_state *sd_state,
-			    unsigned int pad, u32 which)
-{
-	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
-
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_format(sd_state, pad);
-
-	return &tx->format;
-}
-
-static int adv748x_csi2_get_format(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_state *sd_state,
-				   struct v4l2_subdev_format *sdformat)
-{
-	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
-	struct adv748x_state *state = tx->state;
-	struct v4l2_mbus_framefmt *mbusformat;
-
-	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
-						 sdformat->which);
-	if (!mbusformat)
-		return -EINVAL;
-
-	mutex_lock(&state->mutex);
-
-	sdformat->format = *mbusformat;
-
-	mutex_unlock(&state->mutex);
-
-	return 0;
-}
-
 static bool adv748x_csi2_is_fmt_supported(struct adv748x_csi2 *tx, u32 code)
 {
 	const unsigned int *codes = is_txa(tx) ?
@@ -239,9 +230,10 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_format *sdformat)
 {
 	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
-	struct adv748x_state *state = tx->state;
 	struct v4l2_mbus_framefmt *mbusformat;
-	int ret = 0;
+
+	if (sdformat->pad == ADV748X_CSI2_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
 
 	/*
 	 * Make sure the format is supported, if not default it to
@@ -250,34 +242,14 @@ static int adv748x_csi2_set_format(struct v4l2_subdev *sd,
 	if (!adv748x_csi2_is_fmt_supported(tx, sdformat->format.code))
 		sdformat->format.code = MEDIA_BUS_FMT_UYVY8_1X16;
 
-	mbusformat = adv748x_csi2_get_pad_format(sd, sd_state, sdformat->pad,
-						 sdformat->which);
-	if (!mbusformat)
-		return -EINVAL;
-
-	mutex_lock(&state->mutex);
-
-	if (sdformat->pad == ADV748X_CSI2_SOURCE) {
-		const struct v4l2_mbus_framefmt *sink_fmt;
-
-		sink_fmt = adv748x_csi2_get_pad_format(sd, sd_state,
-						       ADV748X_CSI2_SINK,
-						       sdformat->which);
-
-		if (!sink_fmt) {
-			ret = -EINVAL;
-			goto unlock;
-		}
-
-		sdformat->format = *sink_fmt;
-	}
-
+	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 	*mbusformat = sdformat->format;
 
-unlock:
-	mutex_unlock(&state->mutex);
+	/* Propagate format to the source pad. */
+	mbusformat = v4l2_subdev_state_get_format(sd_state, ADV748X_CSI2_SOURCE);
+	*mbusformat = sdformat->format;
 
-	return ret;
+	return 0;
 }
 
 static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
@@ -296,7 +268,7 @@ static int adv748x_csi2_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad
 
 static const struct v4l2_subdev_pad_ops adv748x_csi2_pad_ops = {
 	.enum_mbus_code = adv748x_csi2_enum_mbus_code,
-	.get_fmt = adv748x_csi2_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = adv748x_csi2_set_format,
 	.get_mbus_config = adv748x_csi2_get_mbus_config,
 };
@@ -388,6 +360,11 @@ int adv748x_csi2_init(struct adv748x_state *state, struct adv748x_csi2 *tx)
 	if (ret)
 		goto err_cleanup_subdev;
 
+	tx->sd.state_lock = &state->mutex;
+	ret = v4l2_subdev_init_finalize(&tx->sd);
+	if (ret)
+		goto err_free_ctrl;
+
 	ret = v4l2_async_register_subdev(&tx->sd);
 	if (ret)
 		goto err_free_ctrl;
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index d2b5e722e997..9bc0121d0eff 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -75,7 +75,6 @@ enum adv748x_csi2_pads {
 
 struct adv748x_csi2 {
 	struct adv748x_state *state;
-	struct v4l2_mbus_framefmt format;
 	unsigned int page;
 	unsigned int port;
 	unsigned int num_lanes;
-- 
2.44.0


