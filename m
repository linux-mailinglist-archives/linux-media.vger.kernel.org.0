Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89ECA1A4DF
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 23:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbfEJVuf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 May 2019 17:50:35 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40178 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728352AbfEJVuf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 May 2019 17:50:35 -0400
Received: by mail-pf1-f193.google.com with SMTP id u17so3883385pfn.7;
        Fri, 10 May 2019 14:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CyjREGYTzE7t+M0F2sY+PqenAwf3veqlsJcnGpFRNuE=;
        b=ZpXNHvPvWemv+0yUC4axtThxnmrODDc0eQqpV9AoNm+xA8CVBqMeJ7UvmwayR3Cp9I
         2h83LViAEq2R/JqyLDj4fE7Vv9UwGAFk2m5IVv4Os3vJ1SG7jB8tv7OdJR5jA8/JqtbB
         QXzyU9kknoFhKfnGxQjsdFHFPOy8+3gG1Zv1kIz8ujqG2JuEZGzPqjI8krRdYfobE3H+
         +zZJvOnCbb+LbdVuh2B6ilr73hLkoYs2dRqrUTwl2X3rObFFvjq0EfBt0LfDU0C5f2eJ
         FYsv82ZgEvr19ettdWNosImhhfXfd+8cfUTpZoOLi7mx0jlIS50YMy6jZnBztfVpGGd+
         qYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CyjREGYTzE7t+M0F2sY+PqenAwf3veqlsJcnGpFRNuE=;
        b=sLpgVJtrR3qV01auKgz/GwikSjQGJW0zPtPpxCfFDN0cjxn4OcVRxJeq7JJeE0AdKq
         Uoai6DzIrXJvAhliGqg6uzjhdfKMxwCrvuJL/CDREl7uDnx/HcOeT+ViuPjWGoxCS6nm
         bagI1dXBT0D1DcMUAjnpYCUYXfKtrp6diUGoNAxckL7s+cU9m/2/Nb019p5xuoTNxOgb
         wj3TVs8+aBNcV/tmQqR627nXpBkP28R8bvwR5fN3Txaw/6hAO7aTuExX54rOdr7fDuHL
         cMCkKwBR8gS/DKw5AvJhUZbTzG9BbNtA4XMNluBRTt5LfGgtry0nBonLxufhwXk4FDn1
         Cp3w==
X-Gm-Message-State: APjAAAV9tt/MkwBn4nH/sThW/NY0VmqHcRFNIE9hteWkBan9mpNQc3Lq
        ab6Jycp7aQSI1EjADwfakfaovsF4
X-Google-Smtp-Source: APXvYqzxB4XgherBUAM4op0BkmW+Bsc0ZeEI/STQSzajtL7ehdGjttbKvq9pB0+0XIRpzttulBwEkw==
X-Received: by 2002:a63:f703:: with SMTP id x3mr16089128pgh.394.1557525033389;
        Fri, 10 May 2019 14:50:33 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id e14sm1524108pff.60.2019.05.10.14.50.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 14:50:32 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 5/9] Revert "media: imx: Set capture compose rectangle in capture_device_set_format"
Date:   Fri, 10 May 2019 14:50:08 -0700
Message-Id: <20190510215012.13881-6-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510215012.13881-1-slongerbeam@gmail.com>
References: <20190510215012.13881-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rvert this commit, as imx_media_capture_device_set_format() will be
removed. The arguments to mx_media_mbus_fmt_to_pix_fmt() and
imx_media_capture_device_set_format() in imx7_csi_set_fmt() are also
reverted.

This reverts commit 5964cbd8692252615370b77eb96764dd70c2f837.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Chnges in v3:
- revert to previous args in imx7_csi_set_fmt().
---
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  5 ++--
 drivers/staging/media/imx/imx-media-capture.c | 24 +++++++++----------
 drivers/staging/media/imx/imx-media-csi.c     |  5 ++--
 drivers/staging/media/imx/imx-media-utils.c   | 20 ++++------------
 drivers/staging/media/imx/imx-media.h         |  6 ++---
 drivers/staging/media/imx/imx7-media-csi.c    |  5 ++--
 6 files changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 8242d88dfb82..afaa3a8b15e9 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -910,7 +910,6 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 	const struct imx_media_pixfmt *cc;
 	struct v4l2_pix_format vdev_fmt;
 	struct v4l2_mbus_framefmt *fmt;
-	struct v4l2_rect vdev_compose;
 	int ret = 0;
 
 	if (sdformat->pad >= PRPENCVF_NUM_PADS)
@@ -952,11 +951,11 @@ static int prp_set_fmt(struct v4l2_subdev *sd,
 	priv->cc[sdformat->pad] = cc;
 
 	/* propagate output pad format to capture device */
-	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt, &vdev_compose,
+	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt,
 				      &priv->format_mbus[PRPENCVF_SRC_PAD],
 				      priv->cc[PRPENCVF_SRC_PAD]);
 	mutex_unlock(&priv->lock);
-	imx_media_capture_device_set_format(vdev, &vdev_fmt, &vdev_compose);
+	imx_media_capture_device_set_format(vdev, &vdev_fmt);
 
 	return 0;
 out:
diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 335084a6b0cd..555f6204660b 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -205,8 +205,7 @@ static int capture_g_fmt_vid_cap(struct file *file, void *fh,
 
 static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
 				     struct v4l2_subdev_format *fmt_src,
-				     struct v4l2_format *f,
-				     struct v4l2_rect *compose)
+				     struct v4l2_format *f)
 {
 	const struct imx_media_pixfmt *cc, *cc_src;
 
@@ -246,8 +245,7 @@ static int __capture_try_fmt_vid_cap(struct capture_priv *priv,
 		}
 	}
 
-	imx_media_mbus_fmt_to_pix_fmt(&f->fmt.pix, compose,
-				      &fmt_src->format, cc);
+	imx_media_mbus_fmt_to_pix_fmt(&f->fmt.pix, &fmt_src->format, cc);
 
 	return 0;
 }
@@ -265,7 +263,7 @@ static int capture_try_fmt_vid_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	return __capture_try_fmt_vid_cap(priv, &fmt_src, f, NULL);
+	return __capture_try_fmt_vid_cap(priv, &fmt_src, f);
 }
 
 static int capture_s_fmt_vid_cap(struct file *file, void *fh,
@@ -273,7 +271,6 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 {
 	struct capture_priv *priv = video_drvdata(file);
 	struct v4l2_subdev_format fmt_src;
-	struct v4l2_rect compose;
 	int ret;
 
 	if (vb2_is_busy(&priv->q)) {
@@ -287,14 +284,17 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 	if (ret)
 		return ret;
 
-	ret = __capture_try_fmt_vid_cap(priv, &fmt_src, f, &compose);
+	ret = __capture_try_fmt_vid_cap(priv, &fmt_src, f);
 	if (ret)
 		return ret;
 
 	priv->vdev.fmt.fmt.pix = f->fmt.pix;
 	priv->vdev.cc = imx_media_find_format(f->fmt.pix.pixelformat,
 					      CS_SEL_ANY, true);
-	priv->vdev.compose = compose;
+	priv->vdev.compose.left = 0;
+	priv->vdev.compose.top = 0;
+	priv->vdev.compose.width = fmt_src.format.width;
+	priv->vdev.compose.height = fmt_src.format.height;
 
 	return 0;
 }
@@ -655,8 +655,7 @@ static struct video_device capture_videodev = {
 };
 
 void imx_media_capture_device_set_format(struct imx_media_video_dev *vdev,
-					 const struct v4l2_pix_format *pix,
-					 const struct v4l2_rect *compose)
+					 struct v4l2_pix_format *pix)
 {
 	struct capture_priv *priv = to_capture_priv(vdev);
 
@@ -664,7 +663,6 @@ void imx_media_capture_device_set_format(struct imx_media_video_dev *vdev,
 	priv->vdev.fmt.fmt.pix = *pix;
 	priv->vdev.cc = imx_media_find_format(pix->pixelformat, CS_SEL_ANY,
 					      true);
-	priv->vdev.compose = *compose;
 	mutex_unlock(&priv->mutex);
 }
 EXPORT_SYMBOL_GPL(imx_media_capture_device_set_format);
@@ -770,8 +768,10 @@ int imx_media_capture_device_register(struct imx_media_video_dev *vdev)
 	}
 
 	vdev->fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt.fmt.pix, &vdev->compose,
+	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt.fmt.pix,
 				      &fmt_src.format, NULL);
+	vdev->compose.width = fmt_src.format.width;
+	vdev->compose.height = fmt_src.format.height;
 	vdev->cc = imx_media_find_format(vdev->fmt.fmt.pix.pixelformat,
 					 CS_SEL_ANY, false);
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index c70fa6b509ae..09b89a72eaa2 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1512,7 +1512,6 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_pix_format vdev_fmt;
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_rect *crop, *compose;
-	struct v4l2_rect vdev_compose;
 	int ret;
 
 	if (sdformat->pad >= CSI_NUM_PADS)
@@ -1568,11 +1567,11 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 	priv->cc[sdformat->pad] = cc;
 
 	/* propagate IDMAC output pad format to capture device */
-	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt, &vdev_compose,
+	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt,
 				      &priv->format_mbus[CSI_SRC_PAD_IDMAC],
 				      priv->cc[CSI_SRC_PAD_IDMAC]);
 	mutex_unlock(&priv->lock);
-	imx_media_capture_device_set_format(vdev, &vdev_fmt, &vdev_compose);
+	imx_media_capture_device_set_format(vdev, &vdev_fmt);
 
 	return 0;
 out:
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 8a6e57652402..a80ef0b087ad 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -577,8 +577,7 @@ void imx_media_fill_default_mbus_fields(struct v4l2_mbus_framefmt *tryfmt,
 EXPORT_SYMBOL_GPL(imx_media_fill_default_mbus_fields);
 
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_rect *compose,
-				  const struct v4l2_mbus_framefmt *mbus,
+				  struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc)
 {
 	u32 width;
@@ -625,17 +624,6 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	pix->sizeimage = cc->planar ? ((stride * pix->height * cc->bpp) >> 3) :
 			 stride * pix->height;
 
-	/*
-	 * set capture compose rectangle, which is fixed to the
-	 * source subdevice mbus format.
-	 */
-	if (compose) {
-		compose->left = 0;
-		compose->top = 0;
-		compose->width = mbus->width;
-		compose->height = mbus->height;
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
@@ -647,11 +635,13 @@ int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
 
 	memset(image, 0, sizeof(*image));
 
-	ret = imx_media_mbus_fmt_to_pix_fmt(&image->pix, &image->rect,
-					    mbus, NULL);
+	ret = imx_media_mbus_fmt_to_pix_fmt(&image->pix, mbus, NULL);
 	if (ret)
 		return ret;
 
+	image->rect.width = mbus->width;
+	image->rect.height = mbus->height;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_ipu_image);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 71e20f53ed7b..ddea972b7bc4 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -174,8 +174,7 @@ void imx_media_fill_default_mbus_fields(struct v4l2_mbus_framefmt *tryfmt,
 					struct v4l2_mbus_framefmt *fmt,
 					bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_rect *compose,
-				  const struct v4l2_mbus_framefmt *mbus,
+				  struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc);
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
 				    struct v4l2_mbus_framefmt *mbus);
@@ -280,8 +279,7 @@ void imx_media_capture_device_unregister(struct imx_media_video_dev *vdev);
 struct imx_media_buffer *
 imx_media_capture_device_next_buf(struct imx_media_video_dev *vdev);
 void imx_media_capture_device_set_format(struct imx_media_video_dev *vdev,
-					 const struct v4l2_pix_format *pix,
-					 const struct v4l2_rect *compose);
+					 struct v4l2_pix_format *pix);
 void imx_media_capture_device_error(struct imx_media_video_dev *vdev);
 
 /* subdev group ids */
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index f2037aba6e0e..e2622c05a793 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1035,7 +1035,6 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 	const struct imx_media_pixfmt *outcc;
 	struct v4l2_mbus_framefmt *outfmt;
 	struct v4l2_pix_format vdev_fmt;
-	struct v4l2_rect vdev_compose;
 	const struct imx_media_pixfmt *cc;
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_subdev_format format;
@@ -1086,11 +1085,11 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 	csi->cc[sdformat->pad] = cc;
 
 	/* propagate output pad format to capture device */
-	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt, &vdev_compose,
+	imx_media_mbus_fmt_to_pix_fmt(&vdev_fmt,
 				      &csi->format_mbus[IMX7_CSI_PAD_SRC],
 				      csi->cc[IMX7_CSI_PAD_SRC]);
 	mutex_unlock(&csi->lock);
-	imx_media_capture_device_set_format(vdev, &vdev_fmt, &vdev_compose);
+	imx_media_capture_device_set_format(vdev, &vdev_fmt);
 
 	return 0;
 
-- 
2.17.1

