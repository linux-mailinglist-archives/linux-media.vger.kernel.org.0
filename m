Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E1FF6ACA
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 19:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfKJSdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 13:33:35 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42745 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbfKJSde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 13:33:34 -0500
Received: by mail-qk1-f195.google.com with SMTP id m4so9391285qke.9;
        Sun, 10 Nov 2019 10:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5BqxWoG9689o7tlizwTw2GSpJ0BZd5QftUdl66Fe2A=;
        b=fF4fnKo1N6s+AGYUbCPETGoRtaXKlEov9kb2p4KmZJbiDfsz12nkc/MWegoMiK+IRu
         IwIvCJnX84OJHWW5EPCNg5zE4oeZ9602SB3Z1g07RjuA1G2qvsr8dAgtTuEhlUYIDn7D
         kcfxmvfmRQ+Px47QoXZvNBhUft7e4nnX5n3xxg6A+H0HKR/WAOj8NKeRkpVKoJy8QTGS
         +HKzcBRjpV9h1XJBrWI9NO62xHFRknHXGpA//qJNtMqCW2S3zkyIL7UpmHHtGT/NKDOf
         EJuux/vtn5ZvpSZ97WAmKB4ddZYBMFOUVPUPsmKhxver1JzqAJZ8jYzBt1cFiNplGT0c
         HuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e5BqxWoG9689o7tlizwTw2GSpJ0BZd5QftUdl66Fe2A=;
        b=WkaneI2ndDhdDv4SyVpBYNcJo+JpFZH2czw+6EnxubUnX4T1a/2doIff4l4aLZtC6V
         wAc2fNk2+zdgrcxKZ0CTa+CREnvS2QVcTyBirau1m/jGcu9E0dXpuvTsxIcU82e/+1+l
         JcF41mr2ilMbuk9zQI8zZoUb+T0IsdsnPM3z2ANFAxN+oBrVW8PumXvv+oEwWIeo4+t+
         cIcy7Q/kq3YjaP2Ee4v/wKGbnL8QESNmtUWQ+4uzKxMiOtXQ9p70KAHoMt3+qi++Y/Ym
         h4MBhTE+j9tEjZjn/FCyGs3E2le3CgqUuzggW2A4MwyskxHh2yQSXqZ+rW7jebptPTXt
         oSCg==
X-Gm-Message-State: APjAAAVuJtgAaUc+b01l7BEfwPq5Qb5xoaXrHdC+93zZzqW8rbk6w0vc
        X5ljQEtHpqToM5ZRICcoFQY=
X-Google-Smtp-Source: APXvYqzhJG49OG421Zx+UDwz8e2x5MoOaZ0udVaXFgVmz8Prj48HMHUFMe3auNNVDk33txHq1MzflQ==
X-Received: by 2002:a37:9083:: with SMTP id s125mr7431222qkd.192.1573410811410;
        Sun, 10 Nov 2019 10:33:31 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7d2:34d:4541:a49a:bab2:a597])
        by smtp.gmail.com with ESMTPSA id f185sm4778469qkd.110.2019.11.10.10.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2019 10:33:30 -0800 (PST)
From:   Guilherme Alcarde Gallo <gagallo7@gmail.com>
To:     helen.koike@collabora.com, drocha.figueiredo@gmail.com,
        skhan@linuxfoundation.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, lkcamp@lists.libreplanetbr.org,
        kieran.bingham@ideasonboard.com, jacopo@jmondi.org,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        gabrielabittencourt00@gmail.com, pedro@terraco.de
Subject: [PATCH v5] media: vimc: Implement get/set selection in sink
Date:   Sun, 10 Nov 2019 15:33:21 -0300
Message-Id: <20191110183321.8859-1-gagallo7@gmail.com>
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

* Add new const struct crop_rect_default to initialize subdev scaler
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
Acked-by: Helen Koike <helen.koike@collabora.com>

---
Changes in V5:
* Remove an unused variable from vimc_sca_set_selection function.

Changes in V4:
* Revert an unnecessary change in headers include order.
* Sort the declaration order for local variables in function by the size
  descending.

Changes in V3:
* Sort the headers in alphabetical order.
* Change all functions prefix to 'vimc_sca_'.
* Remove useless case.
* Change commit message subject.

Changes in V2:
* Use v4l2_rect_map_inside to clamp the crop rectangle.
* Do the crop rectangle clamping after changing sink format.
* Implement try ioctls for selection with CROP* targets.
* Treat tiny rectangles with area smaller than minimal dimensions of
  vimc frames.
* Allow user to get selection when the streaming is on.
* Reuse bound rectangle generation in a static function.
* Disable get_selection for Source pads as we did before with
  set_selection.
---
 drivers/media/platform/vimc/vimc-scaler.c | 166 ++++++++++++++++++++--
 1 file changed, 151 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-scaler.c b/drivers/media/platform/vimc/vimc-scaler.c
index 2f88a7d9d67b..e2e551bc3ded 100644
--- a/drivers/media/platform/vimc/vimc-scaler.c
+++ b/drivers/media/platform/vimc/vimc-scaler.c
@@ -8,6 +8,7 @@
 #include <linux/moduleparam.h>
 #include <linux/vmalloc.h>
 #include <linux/v4l2-mediabus.h>
+#include <media/v4l2-rect.h>
 #include <media/v4l2-subdev.h>
 
 #include "vimc-common.h"
@@ -18,6 +19,9 @@ MODULE_PARM_DESC(sca_mult, " the image size multiplier");
 
 #define MAX_ZOOM	8
 
+#define VIMC_SCA_FMT_WIDTH_DEFAULT  640
+#define VIMC_SCA_FMT_HEIGHT_DEFAULT 480
+
 struct vimc_sca_device {
 	struct vimc_ent_device ved;
 	struct v4l2_subdev sd;
@@ -25,6 +29,7 @@ struct vimc_sca_device {
 	 * with the width and hight multiplied by mult
 	 */
 	struct v4l2_mbus_framefmt sink_fmt;
+	struct v4l2_rect crop_rect;
 	/* Values calculated when the stream starts */
 	u8 *src_frame;
 	unsigned int src_line_size;
@@ -33,22 +38,64 @@ struct vimc_sca_device {
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
+vimc_sca_get_crop_bound_sink(const struct v4l2_mbus_framefmt *sink_fmt)
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
+static void vimc_sca_adjust_sink_crop(struct v4l2_rect *r,
+				      const struct v4l2_mbus_framefmt *sink_fmt)
+{
+	const struct v4l2_rect sink_rect =
+		vimc_sca_get_crop_bound_sink(sink_fmt);
+
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
@@ -107,16 +154,21 @@ static int vimc_sca_get_fmt(struct v4l2_subdev *sd,
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
@@ -148,6 +200,7 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 {
 	struct vimc_sca_device *vsca = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *crop_rect;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		/* Do not change the format while stream is on */
@@ -155,8 +208,10 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 			return -EBUSY;
 
 		sink_fmt = &vsca->sink_fmt;
+		crop_rect = &vsca->crop_rect;
 	} else {
 		sink_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
+		crop_rect = v4l2_subdev_get_try_crop(sd, cfg, 0);
 	}
 
 	/*
@@ -165,8 +220,8 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
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
@@ -184,6 +239,78 @@ static int vimc_sca_set_fmt(struct v4l2_subdev *sd,
 			fmt->format.xfer_func, fmt->format.ycbcr_enc);
 
 		*sink_fmt = fmt->format;
+
+		/* Do the crop, but respect the current bounds */
+		vimc_sca_adjust_sink_crop(crop_rect, sink_fmt);
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
+		sel->r = vimc_sca_get_crop_bound_sink(sink_fmt);
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
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *crop_rect;
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
+		vimc_sca_adjust_sink_crop(&sel->r, sink_fmt);
+		*crop_rect = sel->r;
+		break;
+	default:
+		return -EINVAL;
 	}
 
 	return 0;
@@ -195,6 +322,8 @@ static const struct v4l2_subdev_pad_ops vimc_sca_pad_ops = {
 	.enum_frame_size	= vimc_sca_enum_frame_size,
 	.get_fmt		= vimc_sca_get_fmt,
 	.set_fmt		= vimc_sca_set_fmt,
+	.get_selection		= vimc_sca_get_selection,
+	.set_selection		= vimc_sca_set_selection,
 };
 
 static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
@@ -213,11 +342,11 @@ static int vimc_sca_s_stream(struct v4l2_subdev *sd, int enable)
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
@@ -259,9 +388,10 @@ static void vimc_sca_fill_pix(u8 *const ptr,
 }
 
 static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
-			       const unsigned int lin, const unsigned int col,
+			       unsigned int lin, unsigned int col,
 			       const u8 *const sink_frame)
 {
+	const struct v4l2_rect crop_rect = vsca->crop_rect;
 	unsigned int i, j, index;
 	const u8 *pixel;
 
@@ -278,8 +408,10 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
 	/* point to the place we are going to put the first pixel
 	 * in the scaled src frame
 	 */
+	lin -= crop_rect.top;
+	col -= crop_rect.left;
 	index = VIMC_FRAME_INDEX(lin * sca_mult, col * sca_mult,
-				 vsca->sink_fmt.width * sca_mult, vsca->bpp);
+				 crop_rect.width * sca_mult, vsca->bpp);
 
 	dev_dbg(vsca->ved.dev, "sca: %s: scale_pix src pos %dx%d, index %d\n",
 		vsca->sd.name, lin * sca_mult, col * sca_mult, index);
@@ -307,12 +439,13 @@ static void vimc_sca_scale_pix(const struct vimc_sca_device *const vsca,
 static void vimc_sca_fill_src_frame(const struct vimc_sca_device *const vsca,
 				    const u8 *const sink_frame)
 {
+	const struct v4l2_rect r = vsca->crop_rect;
 	unsigned int i, j;
 
 	/* Scale each pixel from the original sink frame */
 	/* TODO: implement scale down, only scale up is supported for now */
-	for (i = 0; i < vsca->sink_fmt.height; i++)
-		for (j = 0; j < vsca->sink_fmt.width; j++)
+	for (i = r.top; i < r.top + r.height; i++)
+		for (j = r.left; j < r.left + r.width; j++)
 			vimc_sca_scale_pix(vsca, i, j, sink_frame);
 }
 
@@ -384,5 +517,8 @@ struct vimc_ent_device *vimc_sca_add(struct vimc_device *vimc,
 	/* Initialize the frame format */
 	vsca->sink_fmt = sink_fmt_default;
 
+	/* Initialize the crop selection */
+	vsca->crop_rect = crop_rect_default;
+
 	return &vsca->ved;
 }
-- 
2.21.0

