Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F396F7D41CF
	for <lists+linux-media@lfdr.de>; Mon, 23 Oct 2023 23:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbjJWVkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 17:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232119AbjJWVkS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 17:40:18 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3929910C
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 14:40:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE13E1AB3;
        Mon, 23 Oct 2023 23:40:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698097202;
        bh=jCyVgGa+u+Eexamy7JNRmB4nlXfIw/NXgQKFL6+P2T0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WJbHSfD3NnXzq4gnDyxCPElf7s65KAhK9a/eOxjlX1q8AeK4gFdsvTcO0zOHT0QsR
         kFJoxv8A4gqba2cVfzmN8LujKfCgBgTktA6h8jRbmUjobus2hFO1v4Ct4TxbUs5xsp
         AnS2MkBj+PO34SXG/xFofyua2erNSlJrEmRIu/f4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Leon Luo <leonl@leopardimaging.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Petr Cvek <petrcvekcz@gmail.com>
Subject: [PATCH 6/7] media: i2c: Use accessors for pad config 'try_*' fields
Date:   Tue, 24 Oct 2023 00:40:10 +0300
Message-ID: <20231023214011.17730-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
References: <20231023214011.17730-1-laurent.pinchart@ideasonboard.com>
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

The 'try_*' fields of the v4l2_subdev_pad_config structure are meant to
be accessed through helper functions. Replace direct access with usage
of the v4l2_subdev_get_pad_format(), v4l2_subdev_get_pad_crop() and
v4l2_subdev_get_pad_compose() helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv7183.c    |  2 +-
 drivers/media/i2c/imx274.c     | 12 ++++++------
 drivers/media/i2c/mt9m001.c    |  2 +-
 drivers/media/i2c/mt9m111.c    |  2 +-
 drivers/media/i2c/mt9t112.c    |  2 +-
 drivers/media/i2c/mt9v011.c    |  2 +-
 drivers/media/i2c/mt9v111.c    |  2 +-
 drivers/media/i2c/ov2640.c     |  2 +-
 drivers/media/i2c/ov2680.c     |  4 ++--
 drivers/media/i2c/ov6650.c     | 34 +++++++++++++++++++++-------------
 drivers/media/i2c/ov772x.c     |  2 +-
 drivers/media/i2c/ov9640.c     |  2 +-
 drivers/media/i2c/rj54n1cb0c.c |  2 +-
 drivers/media/i2c/saa6752hs.c  |  2 +-
 drivers/media/i2c/tw9910.c     |  2 +-
 15 files changed, 41 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
index 3659feafac69..0754bfefa073 100644
--- a/drivers/media/i2c/adv7183.c
+++ b/drivers/media/i2c/adv7183.c
@@ -443,7 +443,7 @@ static int adv7183_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		decoder->fmt = *fmt;
 	else
-		sd_state->pads->try_fmt = *fmt;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
 	return 0;
 }
 
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index f33b692e6951..1886eaab1c24 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1018,8 +1018,8 @@ static int __imx274_change_compose(struct stimx274 *imx274,
 	int best_goodness = INT_MIN;
 
 	if (which == V4L2_SUBDEV_FORMAT_TRY) {
-		cur_crop = &sd_state->pads->try_crop;
-		tgt_fmt = &sd_state->pads->try_fmt;
+		cur_crop = v4l2_subdev_get_pad_crop(&imx274->sd, sd_state, 0);
+		tgt_fmt = v4l2_subdev_get_pad_format(&imx274->sd, sd_state, 0);
 	} else {
 		cur_crop = &imx274->crop;
 		tgt_fmt = &imx274->format;
@@ -1112,7 +1112,7 @@ static int imx274_set_fmt(struct v4l2_subdev *sd,
 	 */
 	fmt->field = V4L2_FIELD_NONE;
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		sd_state->pads->try_fmt = *fmt;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
 	else
 		imx274->format = *fmt;
 
@@ -1143,8 +1143,8 @@ static int imx274_get_selection(struct v4l2_subdev *sd,
 	}
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		src_crop = &sd_state->pads->try_crop;
-		src_fmt = &sd_state->pads->try_fmt;
+		src_crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
+		src_fmt = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 	} else {
 		src_crop = &imx274->crop;
 		src_fmt = &imx274->format;
@@ -1215,7 +1215,7 @@ static int imx274_set_selection_crop(struct stimx274 *imx274,
 	sel->r = new_crop;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
-		tgt_crop = &sd_state->pads->try_crop;
+		tgt_crop = v4l2_subdev_get_pad_crop(&imx274->sd, sd_state, 0);
 	else
 		tgt_crop = &imx274->crop;
 
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 79192cf79d28..5c137fc2034e 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -405,7 +405,7 @@ static int mt9m001_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return mt9m001_s_fmt(sd, fmt, mf);
-	sd_state->pads->try_fmt = *mf;
+	*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *mf;
 	return 0;
 }
 
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 1f44b72e8a70..e17ff41ebba0 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -671,7 +671,7 @@ static int mt9m111_set_fmt(struct v4l2_subdev *sd,
 	mf->xfer_func	= V4L2_XFER_FUNC_DEFAULT;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *mf;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *mf;
 		return 0;
 	}
 
diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
index 93f34b767027..e3b9ff374500 100644
--- a/drivers/media/i2c/mt9t112.c
+++ b/drivers/media/i2c/mt9t112.c
@@ -982,7 +982,7 @@ static int mt9t112_set_fmt(struct v4l2_subdev *sd,
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return mt9t112_s_fmt(sd, mf);
-	sd_state->pads->try_fmt = *mf;
+	*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *mf;
 
 	return 0;
 }
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 37a634b92cd5..7f313d731839 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -356,7 +356,7 @@ static int mt9v011_set_fmt(struct v4l2_subdev *sd,
 
 		set_res(sd);
 	} else {
-		sd_state->pads->try_fmt = *fmt;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
 	}
 
 	return 0;
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index f859b49e13bf..2c321e4884be 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -951,7 +951,7 @@ static int mt9v111_set_format(struct v4l2_subdev *subdev,
 static int mt9v111_init_cfg(struct v4l2_subdev *subdev,
 			    struct v4l2_subdev_state *sd_state)
 {
-	sd_state->pads->try_fmt = mt9v111_def_fmt;
+	*v4l2_subdev_get_pad_format(subdev, sd_state, 0) = mt9v111_def_fmt;
 
 	return 0;
 }
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 28a01c6eff64..389b6119ddec 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -988,7 +988,7 @@ static int ov2640_set_fmt(struct v4l2_subdev *sd,
 		/* select format */
 		priv->cfmt_code = mf->code;
 	} else {
-		sd_state->pads->try_fmt = *mf;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *mf;
 	}
 out:
 	mutex_unlock(&priv->lock);
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 72bab0ff8a36..f58fa2eb86ee 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -760,9 +760,9 @@ static int ov2680_init_cfg(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
-	sd_state->pads[0].try_crop = ov2680_default_crop;
+	*v4l2_subdev_get_pad_crop(sd, sd_state, 0) = ov2680_default_crop;
 
-	ov2680_fill_format(sensor, &sd_state->pads[0].try_fmt,
+	ov2680_fill_format(sensor, v4l2_subdev_get_pad_format(sd, sd_state, 0),
 			   OV2680_DEFAULT_WIDTH, OV2680_DEFAULT_HEIGHT);
 	return 0;
 }
diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 1ad07935f046..38d21b40f5d8 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -476,7 +476,7 @@ static int ov6650_get_selection(struct v4l2_subdev *sd,
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
 		/* pre-select try crop rectangle */
-		rect = &sd_state->pads->try_crop;
+		rect = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
 
 	} else {
 		/* pre-select active crop rectangle */
@@ -531,8 +531,10 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 	ov6650_bind_align_crop_rectangle(&sel->r);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		struct v4l2_rect *crop = &sd_state->pads->try_crop;
-		struct v4l2_mbus_framefmt *mf = &sd_state->pads->try_fmt;
+		struct v4l2_rect *crop =
+			v4l2_subdev_get_pad_crop(sd, sd_state, 0);
+		struct v4l2_mbus_framefmt *mf =
+			v4l2_subdev_get_pad_format(sd, sd_state, 0);
 		/* detect current pad config scaling factor */
 		bool half_scale = !is_unscaled_ok(mf->width, mf->height, crop);
 
@@ -588,9 +590,12 @@ static int ov6650_get_fmt(struct v4l2_subdev *sd,
 
 	/* update media bus format code and frame size */
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf->width = sd_state->pads->try_fmt.width;
-		mf->height = sd_state->pads->try_fmt.height;
-		mf->code = sd_state->pads->try_fmt.code;
+		struct v4l2_mbus_framefmt *try_fmt =
+			v4l2_subdev_get_pad_format(sd, sd_state, 0);
+
+		mf->width = try_fmt->width;
+		mf->height = try_fmt->height;
+		mf->code = try_fmt->code;
 
 	} else {
 		mf->width = priv->rect.width >> priv->half_scale;
@@ -717,23 +722,26 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		crop = &sd_state->pads->try_crop;
+		crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
 	else
 		crop = &priv->rect;
 
 	half_scale = !is_unscaled_ok(mf->width, mf->height, crop);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		struct v4l2_mbus_framefmt *try_fmt =
+			v4l2_subdev_get_pad_format(sd, sd_state, 0);
+
 		/* store new mbus frame format code and size in pad config */
-		sd_state->pads->try_fmt.width = crop->width >> half_scale;
-		sd_state->pads->try_fmt.height = crop->height >> half_scale;
-		sd_state->pads->try_fmt.code = mf->code;
+		try_fmt->width = crop->width >> half_scale;
+		try_fmt->height = crop->height >> half_scale;
+		try_fmt->code = mf->code;
 
 		/* return default mbus frame format updated with pad config */
 		*mf = ov6650_def_fmt;
-		mf->width = sd_state->pads->try_fmt.width;
-		mf->height = sd_state->pads->try_fmt.height;
-		mf->code = sd_state->pads->try_fmt.code;
+		mf->width = try_fmt->width;
+		mf->height = try_fmt->height;
+		mf->code = try_fmt->code;
 
 	} else {
 		int ret = 0;
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 7618b58a7ad0..1fbf72152956 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -1220,7 +1220,7 @@ static int ov772x_set_fmt(struct v4l2_subdev *sd,
 	mf->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *mf;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *mf;
 		return 0;
 	}
 
diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
index cbaea049531d..a9adddde1006 100644
--- a/drivers/media/i2c/ov9640.c
+++ b/drivers/media/i2c/ov9640.c
@@ -547,7 +547,7 @@ static int ov9640_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return ov9640_s_fmt(sd, mf);
 
-	sd_state->pads->try_fmt = *mf;
+	*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *mf;
 
 	return 0;
 }
diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index b430046f9e2a..dbddb7a9f211 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1009,7 +1009,7 @@ static int rj54n1_set_fmt(struct v4l2_subdev *sd,
 			      &mf->height, 84, RJ54N1_MAX_HEIGHT, align, 0);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *mf;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *mf;
 		return 0;
 	}
 
diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.c
index c106e7a7d1f4..82976aee5e86 100644
--- a/drivers/media/i2c/saa6752hs.c
+++ b/drivers/media/i2c/saa6752hs.c
@@ -595,7 +595,7 @@ static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
 	f->colorspace = V4L2_COLORSPACE_SMPTE170M;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sd_state->pads->try_fmt = *f;
+		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *f;
 		return 0;
 	}
 
diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
index 477a64d8f8ab..5233c33b93df 100644
--- a/drivers/media/i2c/tw9910.c
+++ b/drivers/media/i2c/tw9910.c
@@ -829,7 +829,7 @@ static int tw9910_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return tw9910_s_fmt(sd, mf);
 
-	sd_state->pads->try_fmt = *mf;
+	*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *mf;
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

