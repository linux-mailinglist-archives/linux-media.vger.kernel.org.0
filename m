Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB927CD928
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2019 22:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfJFUVZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Oct 2019 16:21:25 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38495 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbfJFUVZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Oct 2019 16:21:25 -0400
Received: by mail-qk1-f193.google.com with SMTP id u186so10743755qkc.5
        for <linux-media@vger.kernel.org>; Sun, 06 Oct 2019 13:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xoVsJE3aQY1CvIgfMNZ8hxbFwEBEAL+6BkqLC6wtjU=;
        b=IVHnBFu34rFw927dZxSvTQ8YHjq8F33j+DapJcle3zO0fLrU38s/K8u6kpb7pt8loP
         bvlJovB/f10Ul5YumL4t88zb0apwhwOq9ku80ze27UQtmFRijC0ZuQEpZ+ImXSVqBHlu
         a/qpXDZfGjmbRkknDzJgaZV5Id+ylgK2b3N3x+EomUdT4kcJghU2cu+csl8c0ZTtcTy3
         LeuAaxMixJdkzvVo+MvkLFeeaAIpIqJRV5YtSE1Zr1Xx00GIltYON8wY8zs33UvQnM6h
         6B+hWKdmQ20OQpEbyIRCOczODWFWzGm57oSyImrPa4Fg2s4dwzyYvK56p5Tju21teO0E
         Pm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9xoVsJE3aQY1CvIgfMNZ8hxbFwEBEAL+6BkqLC6wtjU=;
        b=E2kavxBFrVZgMf8A+hVUazqdbqAdolFqDZ37qnqVDUKSheGac8cxjWXj5FiNI2hcDA
         mB2WCV+PzesyOdBIrePVnWayVkqM2Kvi95E+xT44l1wKw6EnYxXaxpYxSFqwHobTPnlH
         7u4mkjQuX2u4hgZWEj33dJNuQvHwp78nEHZmCeLeOzAJHTCsAOGuWl/mJUEULcQrbl9X
         396T3cn4ONu55syYyQqqqqDMcHdCOR+Dr7wpwiPxPve8Vl6zCp/Siv8uH0qzgBNS5EEa
         EpMjt06p1HkueQyYzTN+6VtXs39hQSFO4z2oDieFMzjWN0TvnTXzXhEPA2Dbr9nxy8Ai
         QIyw==
X-Gm-Message-State: APjAAAUV1BvT6Cjl9XETv2AVRji7Mm0YZSl7XlDLtGa7EDm1ZP7Zc5/N
        FRLZRYl/o2KBLsooTfjlDmn/EfOTm/Q=
X-Google-Smtp-Source: APXvYqwoLl5wlziICELIMozZ9JZZHUF63Nl6CcPZoPRt24qhtGL4MSLoJDDf8hu8wx07v57AenYtJg==
X-Received: by 2002:ae9:d803:: with SMTP id u3mr20460257qkf.25.1570393283796;
        Sun, 06 Oct 2019 13:21:23 -0700 (PDT)
Received: from gagoddess.terracota.local ([177.103.155.130])
        by smtp.gmail.com with ESMTPSA id n44sm8832923qtf.51.2019.10.06.13.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2019 13:21:22 -0700 (PDT)
From:   Guilherme Alcarde Gallo <gagallo7@gmail.com>
To:     helen.koike@collabora.com, skhan@linuxfoundation.org,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        drocha.figueiredo@gmail.com, lkcamp@lists.libreplanetbr.org,
        hverkuil@xs4all.nl
Subject: [PATCH v2] media: vimc: Implement get/set selection
Date:   Sun,  6 Oct 2019 17:21:13 -0300
Message-Id: <20191006202113.11115-1-gagallo7@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the sink pad of scaler subdevice to respond
VIDIOC_G_SELECTION and VIDIOC_S_SELECTION ioctls with the following
targets: V4L2_SEL_TGT_COMPOSE_BOUNDS and V4L2_SEL_TGT_CROP.

* Added new const struct crop_rect_default to initialize subdev scaler
  properly.
* Make changes in sink pad format reflect to the crop rectangle. E.g.
  changing the frame format to a smaller size one can make the former
  crop rectangle selects a non existing frame area. To solve this
  situation the crop rectangle is clamped to the frame boundaries.
* Clamp crop rectangle respecting the sink bounds during set_selection
  ioctl.

Signed-off-by: Guilherme Alcarde Gallo <gagallo7@gmail.com>
Co-developed-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>
Signed-off-by: Danilo Figueiredo Rocha <drocha.figueiredo@gmail.com>


---
Changes in V2:
* Use v4l2_rect_map_inside to clamp the crop rectangle.
* Do the crop rectangle clamping after changing sink format.
* Implement try ioctls for selection with CROP* targets.
* Treat tiny rectangles with area smaller than minimal dimensions of vimc
  frames.
* Allow user to get selection when the streaming is on.
* Reuse bound rectangle generation in a static function.
* Disable get_selection for Source pads as we did before with
  set_selection.

Ran v4l2-compliance for scaler subdevice with:
v4l2-compliance -d /dev/v4l-subdev5

Output:
v4l2-compliance SHA: a52391af10c66f63a947298415880495cb58503d, 64 bits
[...]
Total for vimc device /dev/v4l-subdev5: 55, Succeeded: 55, Failed: 0,
      Warnings: 0
---
 drivers/media/platform/vimc/vimc-scaler.c | 169 ++++++++++++++++++++--
 1 file changed, 154 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index a6a3cc5be872..54f5d9e0cb68 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -9,6 +9,7 @@
 #include <linux/vmalloc.h>
 #include <linux/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
+#include <media/v4l2-rect.h>
 
 #include "vimc-common.h"
 
@@ -18,6 +19,9 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
 
 #define MAX_ZOOM	8
 
+#define VIMC_SCA_FMT_WIDTH_DEFAULT	640
+#define VIMC_SCA_FMT_HEIGHT_DEFAULT	480
+
 struct vimc_sca_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
@@ -26,6 +30,7 @@ struct vimc_sca_device {
 	 * with the width and hight multiplied by mult
 	 */
 	struct v4l2_mbus_framefmt sink_fmt;
+	struct v4l2_rect crop_rect;
 	/* Values calculated when the stream starts */
 	u8 *src_frame;
 	unsigned int src_line_size;
@@ -33,22 +38,63 @@ struct vimc_sca_device {
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
+static const struct v4l2_rect crop_rect_min = {
+	.width = VIMC_FRAME_MIN_WIDTH,
+	.height = VIMC_FRAME_MIN_HEIGHT,
+	.top = 0,
+	.left = 0,
+};
+
+static struct v4l2_rect
+vimc_get_bound_rect_for_sink(const struct v4l2_mbus_framefmt *sink_fmt)
+{
+	/* Get the crop bounds to clamp the crop rectangle correctly */
+	struct v4l2_rect r = {
+		.left = 0,
+		.top = 0,
+		.width = sink_fmt->width,
+		.height = sink_fmt->height,
+	};
+	return r;
+}
+
+static void vimc_rect_map_inside(struct v4l2_rect *r,
+				 const struct v4l2_mbus_framefmt *sink_fmt)
+{
+	const struct v4l2_rect sink_rect =
+		vimc_get_bound_rect_for_sink(sink_fmt);
+	/* Disallow rectangles smaller than the minimal one. */
+	v4l2_rect_set_min_size(r, &crop_rect_min);
+	v4l2_rect_map_inside(r, &sink_rect);
+}
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
@@ -107,16 +153,21 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
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
@@ -148,6 +199,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *crop_rect;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
@@ -155,8 +207,10 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 			return -EBUSY;
 
 		sink_fmt = &vsca->sink_fmt;
+		crop_rect = &vsca->crop_rect;
 	} else {
 		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
 	}
 
 	/*
@@ -165,8 +219,8 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
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
@@ -184,6 +238,82 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 			fmt->format.xfer_func, fmt->format.ycbcr_enc);
 
 		*sink_fmt = fmt->format;
+
+		/* Do the crop, but respect the current bounds */
+		vimc_rect_map_inside(crop_rect, sink_fmt);
+	}
+
+	return 0;
+}
+
+static int vimc_sca_get_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *crop_rect;
+
+	if (VIMC_IS_SRC(sel->pad))
+		return -EINVAL;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		sink_fmt = &vsca->sink_fmt;
+		crop_rect = &vsca->crop_rect;
+	} else {
+		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
+	}
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *crop_rect;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r = vimc_get_bound_rect_for_sink(sink_fmt);
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
+	struct v4l2_rect *crop_rect;
+	struct v4l2_rect sink_rect;
+	struct v4l2_mbus_framefmt *sink_fmt;
+
+	if (VIMC_IS_SRC(sel->pad))
+		return -EINVAL;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		/* Do not change the format while stream is on */
+		if (vsca->src_frame)
+			return -EBUSY;
+
+		crop_rect = &vsca->crop_rect;
+		sink_fmt = &vsca->sink_fmt;
+	} else {
+		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
+		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+	}
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		/* Do the crop, but respect the current bounds */
+		sink_rect = vimc_get_bound_rect_for_sink(sink_fmt);
+		vimc_rect_map_inside(&sel->r, sink_fmt);
+		*crop_rect = sel->r;
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		return -EINVAL;
+	default:
+		return -EINVAL;
 	}
 
 	return 0;
@@ -195,6 +325,8 @@ static const struct v4l2_subdev_pad_ops vimc_sca_pad_ops = {
 	.enum_frame_size	= vimc_sca_enum_frame_size,
 	.get_fmt		= vimc_sca_get_fmt,
 	.set_fmt		= vimc_sca_set_fmt,
+	.get_selection		= vimc_sca_get_selection,
+	.set_selection		= vimc_sca_set_selection,
 };
 
 static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
@@ -213,11 +345,11 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -259,11 +391,12 @@ static void vimc_sca_fill_pix(u8 *const ptr,
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
@@ -278,8 +411,10 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
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
@@ -308,11 +443,12 @@ static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
 				    const u8 *const sink_frame)
 {
 	unsigned int i, j;
+	const struct v4l2_rect r = vsca->crop_rect;
 
 	/* Scale each pixel from the original sink frame */
 	/* TODO: implement scale down, only scale up is supported for now */
-	for (i = 0; i < vsca->sink_fmt.height; i++)
-		for (j = 0; j < vsca->sink_fmt.width; j++)
+	for (i = r.top; i < r.top + r.height; i++)
+		for (j = r.left; j < r.left + r.width; j++)
 			vimc_sca_scale_pix(vsca, i, j, sink_frame);
 }
 
@@ -382,5 +518,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	/* Initialize the frame format */
 	vsca->sink_fmt = sink_fmt_default;
 
+	/* Initialize the crop selection */
+	vsca->crop_rect = crop_rect_default;
+
 	return &vsca->ved;
 }
-- 
2.21.0

