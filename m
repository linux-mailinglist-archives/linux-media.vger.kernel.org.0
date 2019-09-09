Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA229AD271
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 06:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbfIIEJE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 00:09:04 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46585 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfIIEJD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 00:09:03 -0400
Received: by mail-qt1-f195.google.com with SMTP id v11so14579952qto.13
        for <linux-media@vger.kernel.org>; Sun, 08 Sep 2019 21:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pljKBZZS/FZu8WR1RkuJfo1UK7q3YnA1Rjr43XxtWY=;
        b=blmW6ULNFJHKUAbIb31LB8Q3ZGwJtqGVD6wcdFC6/jD887QKxSS44UeYWXbEph3XF5
         7r9UHjVVCRu/u4DLtImNuoUINUmRQi7lVBHuNybiYgFxs7Okkbe/Yh68StAfC9jsEo+E
         eqmCha/RnhP96rveE0mc2kcAgNi7h64eRlAA0SgLfcHjIFDI9hge+R/jOXMI7NyUrKga
         n6/E9+2+pYVRBGQdX/XY9hMsK3Y0pUpeQwupRMIoGeWfI4I8JYF8Od83ilCSuANK7uLa
         tFhE9IHat/Md4Kv0tLUBFXinH3rZPkTGiDDfL40Rmt/0Gyg+ycu6B7y4hhoJt1tzkyIM
         oLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3pljKBZZS/FZu8WR1RkuJfo1UK7q3YnA1Rjr43XxtWY=;
        b=afTJS8975by5hisBPa3j7mJJhZfPSRJvjrWPEFkDv6W/yAA6Bpjib5FvwrjjFissO/
         ktI+s6LhkF6v5oLi5XAhf3Lz2Q+DARZBlB5XJwIf5SdCZD4ISQy9ITGMX5GLYez/KOob
         ZzgFMyR9UfCDw4PT+aKqZHsSxRVUQ+noGsuhLrmh+iUU4PJ0sc5XUK2RPAQIH8Bn2yzu
         Fx8gnMvFzbgCl3yLTpIRxjO8zs6H0h7zBWFUABQkKvGczDaYzvLKpWc5tsVruuc8e3/L
         LOxMtz0eWLHjdlsQOOl/GMFGM7p771Rc3YbgeaorOhAN65GBQA9p4ibwWp7sam4rEPxE
         tyqg==
X-Gm-Message-State: APjAAAWmQCqn9hoiOdB7tJScD2GzeTiLFUNy9AeIiciLyuU/WE1B5FGy
        Yv4S3/86v0zIK9PKQIWoS01PDlkr
X-Google-Smtp-Source: APXvYqze1bepm5j0fDKuNv8H1xX8bwTmZGsHLpcCi9h600bRpRHFK6+SVxX0kjy/BvsVA1T7vpoyDg==
X-Received: by 2002:ad4:5610:: with SMTP id ca16mr13305518qvb.199.1568002141834;
        Sun, 08 Sep 2019 21:09:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7d3:99e1:6465:fc62:b333:2e88])
        by smtp.gmail.com with ESMTPSA id c29sm8623954qtc.89.2019.09.08.21.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2019 21:09:00 -0700 (PDT)
From:   Guilherme Alcarde Gallo <gagallo7@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     lkcamp@lists.libreplanetbr.org, helen.koike@collabora.com,
        mchehab@kernel.org
Subject: [PATCH] media: vimc: Implement get/set selection
Date:   Mon,  9 Sep 2019 01:08:53 -0300
Message-Id: <20190909040853.22466-1-gagallo7@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the scaler subdevice to respond VIDIOC_G_SELECTION and
VIDIOC_S_SELECTION ioctls with the following targets:
V4L2_SEL_TGT_COMPOSE_BOUNDS and V4L2_SEL_TGT_CROP.

* Added new const struct crop_rect_default to initialize subdev scaler
  properly.
* Make changes in sink pad format reflect the crop rectangle. E.g.
  changing the frame format to a smaller size one can make the former
  crop rectangle selects a non existing frame area. To solve this
  situation the crop rectangle is clamped to the frame boundaries.
* Clamp crop rectangle respecting the sink bounds during set_selection
  ioctl.

Signed-off-by: Guilherme Alcarde Gallo <gagallo7@gmail.com>
Co-developed-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>
Signed-off-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>

---

This patch is based on the monolithic vimc driver from the patchset
named "Collapse vimc into single monolithic driver"
https://patchwork.kernel.org/patch/11136201/

---

 drivers/media/platform/vimc/vimc-scaler.c | 148 +++++++++++++++++++---
 1 file changed, 133 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index a5a0855ad9cd..b50d11e76a2b 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -18,6 +18,9 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
 
 #define MAX_ZOOM	8
 
+#define VIMC_SCA_FMT_WIDTH_DEFAULT	640
+#define VIMC_SCA_FMT_HEIGHT_DEFAULT	480
+
 struct vimc_sca_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
@@ -26,6 +29,7 @@ struct vimc_sca_device {
 	 * with the width and hight multiplied by mult
 	 */
 	struct v4l2_mbus_framefmt sink_fmt;
+	struct v4l2_rect crop_rect;
 	/* Values calculated when the stream starts */
 	u8 *src_frame;
 	unsigned int src_line_size;
@@ -33,22 +37,33 @@ struct vimc_sca_device {
 };
 
 static const struct v4l2_mbus_framefmt sink_fmt_default = {
-	.width = 640,
-	.height = 480,
+	.width = VIMC_SCA_FMT_WIDTH_DEFAULT,
+	.height = VIMC_SCA_FMT_HEIGHT_DEFAULT,
 	.code = MEDIA_BUS_FMT_RGB888_1X24,
 	.field = V4L2_FIELD_NONE,
 	.colorspace = V4L2_COLORSPACE_DEFAULT,
 };
 
+static const struct v4l2_rect crop_rect_default = {
+	.width = VIMC_SCA_FMT_WIDTH_DEFAULT,
+	.height = VIMC_SCA_FMT_HEIGHT_DEFAULT,
+	.top = 0,
+	.left = 0,
+};
+
 static int vimc_sca_init_cfg(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_pad_config *cfg)
 {
 	struct v4l2_mbus_framefmt *mf;
+	struct v4l2_rect *r;
 	unsigned int i;
 
 	mf = v4l2_subdev_get_try_format(sd, cfg, 0);
 	*mf = sink_fmt_default;
 
+	r = v4l2_subdev_get_try_crop(sd, cfg, 0);
+	*r = crop_rect_default;
+
 	for (i = 1; i < sd->entity.num_pads; i++) {
 		mf = v4l2_subdev_get_try_format(sd, cfg, i);
 		*mf = sink_fmt_default;
@@ -107,16 +122,21 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_format *format)
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
+	struct v4l2_rect *crop_rect;
 
 	/* Get the current sink format */
-	format->format = (format->which == V4L2_SUBDEV_FORMAT_TRY) ?
-			 *v4l2_subdev_get_try_format(sd, cfg, 0) :
-			 vsca->sink_fmt;
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		format->format = *v4l2_subdev_get_try_format(sd, cfg, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
+	} else {
+		format->format = vsca->sink_fmt;
+		crop_rect = &vsca->crop_rect;
+	}
 
 	/* Scale the frame size for the source pad */
 	if (VIMC_IS_SRC(format->pad)) {
-		format->format.width = vsca->sink_fmt.width * sca_mult;
-		format->format.height = vsca->sink_fmt.height * sca_mult;
+		format->format.width = crop_rect->width * sca_mult;
+		format->format.height = crop_rect->height * sca_mult;
 	}
 
 	return 0;
@@ -148,6 +168,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *crop_rect;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
@@ -155,8 +176,10 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 			return -EBUSY;
 
 		sink_fmt = &vsca->sink_fmt;
+		crop_rect = &vsca->crop_rect;
 	} else {
 		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
 	}
 
 	/*
@@ -165,12 +188,20 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 	 */
 	if (VIMC_IS_SRC(fmt->pad)) {
 		fmt->format = *sink_fmt;
-		fmt->format.width = sink_fmt->width * sca_mult;
-		fmt->format.height = sink_fmt->height * sca_mult;
+		fmt->format.width = crop_rect->width * sca_mult;
+		fmt->format.height = crop_rect->height * sca_mult;
 	} else {
 		/* Set the new format in the sink pad */
 		vimc_sca_adjust_sink_fmt(&fmt->format);
 
+		crop_rect->width = clamp_t(u32, crop_rect->width,
+					   VIMC_FRAME_MIN_WIDTH,
+					   fmt->format.width) & ~1;
+
+		crop_rect->height = clamp_t(u32, crop_rect->height,
+					    VIMC_FRAME_MIN_HEIGHT,
+					    fmt->format.height) & ~1;
+
 		dev_dbg(vsca->dev, "%s: sink format update: "
 			"old:%dx%d (0x%x, %d, %d, %d, %d) "
 			"new:%dx%d (0x%x, %d, %d, %d, %d)\n", vsca->sd.name,
@@ -189,12 +220,91 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int vimc_sca_get_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+		return -EINVAL;
+
+	if (vsca->src_frame)
+		return -EBUSY;
+
+	if (VIMC_IS_SRC(sel->pad))
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = vsca->crop_rect;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = vsca->sink_fmt.width;
+		sel->r.height = vsca->sink_fmt.height;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int vimc_sca_set_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
+	struct v4l2_rect *vsca_crop_rect = &vsca->crop_rect;
+	struct v4l2_subdev_selection bound_sel = *sel;
+	int ret = 0;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+		return -EINVAL;
+
+	/* Do not change the format while stream is on */
+	if (vsca->src_frame)
+		return -EBUSY;
+
+	if (VIMC_IS_SRC(sel->pad))
+		return -EINVAL;
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		/* Get the crop bounds to clamp the crop rectangle correctly */
+		bound_sel.target = V4L2_SEL_TGT_CROP_BOUNDS;
+		ret = vimc_sca_get_selection(sd, cfg, &bound_sel);
+		if (ret) {
+			pr_err("Error during call to vimc_sca_get_selection.");
+			return ret;
+		}
+
+		sel->r.width = clamp_t(u32, sel->r.width, VIMC_FRAME_MIN_WIDTH,
+				       bound_sel.r.width) & ~1;
+		sel->r.height = clamp_t(u32, sel->r.height,
+					VIMC_FRAME_MIN_HEIGHT,
+					bound_sel.r.height);
+		*vsca_crop_rect = sel->r;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		return -EINVAL;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops vimc_sca_pad_ops = {
 	.init_cfg		= vimc_sca_init_cfg,
 	.enum_mbus_code		= vimc_sca_enum_mbus_code,
 	.enum_frame_size	= vimc_sca_enum_frame_size,
 	.get_fmt		= vimc_sca_get_fmt,
 	.set_fmt		= vimc_sca_set_fmt,
+	.get_selection		= vimc_sca_get_selection,
+	.set_selection		= vimc_sca_set_selection,
 };
 
 static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
@@ -213,11 +323,11 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
 		vsca->bpp = vpix->bpp;
 
 		/* Calculate the width in bytes of the src frame */
-		vsca->src_line_size = vsca->sink_fmt.width *
+		vsca->src_line_size = vsca->crop_rect.width *
 				      sca_mult * vsca->bpp;
 
 		/* Calculate the frame size of the source pad */
-		frame_size = vsca->src_line_size * vsca->sink_fmt.height *
+		frame_size = vsca->src_line_size * vsca->crop_rect.height *
 			     sca_mult;
 
 		/* Allocate the frame buffer. Use vmalloc to be able to
@@ -259,11 +369,12 @@ static void vimc_sca_fill_pix(u8 *const ptr,
 }
 
 static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
-			       const unsigned int lin, const unsigned int col,
+			       unsigned int lin, unsigned int col,
 			       const u8 *const sink_frame)
 {
 	unsigned int i, j, index;
 	const u8 *pixel;
+	const struct v4l2_rect crop_rect = vsca->crop_rect;
 
 	/* Point to the pixel value in position (lin, col) in the sink frame */
 	index = VIMC_FRAME_INDEX(lin, col,
@@ -278,8 +389,10 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
 	/* point to the place we are going to put the first pixel
 	 * in the scaled src frame
 	 */
+	lin -= crop_rect.top;
+	col -= crop_rect.left;
 	index = VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
-				 vsca->sink_fmt.width * sca_mult, vsca->bpp);
+				 crop_rect.width * sca_mult, vsca->bpp);
 
 	dev_dbg(vsca->dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
 		vsca->sd.name, lin * sca_mult, col * sca_mult, index);
@@ -309,10 +422,12 @@ static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
 {
 	unsigned int i, j;
 
+	const struct v4l2_rect r = vsca->crop_rect;
+
 	/* Scale each pixel from the original sink frame */
 	/* TODO: implement scale down, only scale up is supported for now */
-	for (i = 0; i < vsca->sink_fmt.height; i++)
-		for (j = 0; j < vsca->sink_fmt.width; j++)
+	for (i = r.top; i < r.top + r.height; i++)
+		for (j = r.left; j < r.left + r.width; j++)
 			vimc_sca_scale_pix(vsca, i, j, sink_frame);
 }
 
@@ -382,5 +497,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	/* Initialize the frame format */
 	vsca->sink_fmt = sink_fmt_default;
 
+	/* Initialize the crop selection */
+	vsca->crop_rect = crop_rect_default;
+
 	return &vsca->ved;
 }
-- 
2.21.0

