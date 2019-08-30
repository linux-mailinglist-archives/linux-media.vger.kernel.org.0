Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFF7A33E1
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 11:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbfH3J0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Aug 2019 05:26:32 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39147 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728347AbfH3J0b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Aug 2019 05:26:31 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 3dAmiY5dCDqPe3dAqiRKhR; Fri, 30 Aug 2019 11:26:28 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/3] cedrus: choose default pixelformat in try_fmt
Date:   Fri, 30 Aug 2019 11:26:23 +0200
Message-Id: <20190830092624.18228-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190830092624.18228-1-hverkuil-cisco@xs4all.nl>
References: <20190830092624.18228-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfK4OYPJHY1sqD+Z5IOqh8Hgm5+CKyndrROiHCcdYchq5IV/z5BDqSnkF0daf4bAryKGWA9WmfYlsySO2954QZx6MQB0eTcrM2kpakwTHsQ3znV8sUPZP
 f6gr3yyOaUvtFwSFa7apNsFwAR26MLFkbppI90pORwenznfkJhEkaDGO7VGExh91GSpSUfBEBWo1HzJ7ijyrpwQ6hnqViZbQ3iZhzUl83hT5mXj2QYjnWpvw
 tM///bPlHtAcl2arJiburo+RkmKNdNqTdkUOW3Wh0R6L1yzON9R7P4j8UJyA5ECfhb6+nMPQTZeI3REsTTDlt8Dfmk398w41BqvSEpRXOtI5bHZPk1we9/Q3
 XlPZ0aRN
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If an unsupported pixelformat is passed to try_fmt, then pick
the first valid pixelformat instead. This is more standard V4L2
behavior.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../staging/media/sunxi/cedrus/cedrus_video.c | 46 ++++++++-----------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index eeee3efd247b..d69c9bcdb8e2 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -62,33 +62,30 @@ static inline struct cedrus_ctx *cedrus_file2ctx(struct file *file)
 static struct cedrus_format *cedrus_find_format(u32 pixelformat, u32 directions,
 						unsigned int capabilities)
 {
+	struct cedrus_format *first_valid_fmt = NULL;
 	struct cedrus_format *fmt;
 	unsigned int i;
 
 	for (i = 0; i < CEDRUS_FORMATS_COUNT; i++) {
 		fmt = &cedrus_formats[i];
 
-		if (fmt->capabilities && (fmt->capabilities & capabilities) !=
-		    fmt->capabilities)
+		if ((fmt->capabilities & capabilities) != fmt->capabilities ||
+		    !(fmt->directions & directions))
 			continue;
 
-		if (fmt->pixelformat == pixelformat &&
-		    (fmt->directions & directions) != 0)
+		if (fmt->pixelformat == pixelformat)
 			break;
+
+		if (!first_valid_fmt)
+			first_valid_fmt = fmt;
 	}
 
 	if (i == CEDRUS_FORMATS_COUNT)
-		return NULL;
+		return first_valid_fmt;
 
 	return &cedrus_formats[i];
 }
 
-static bool cedrus_check_format(u32 pixelformat, u32 directions,
-				unsigned int capabilities)
-{
-	return cedrus_find_format(pixelformat, directions, capabilities);
-}
-
 static void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
 {
 	unsigned int width = pix_fmt->width;
@@ -252,11 +249,14 @@ static int cedrus_try_fmt_vid_cap(struct file *file, void *priv,
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
 	struct cedrus_dev *dev = ctx->dev;
 	struct v4l2_pix_format *pix_fmt = &f->fmt.pix;
+	struct cedrus_format *fmt =
+		cedrus_find_format(pix_fmt->pixelformat, CEDRUS_DECODE_DST,
+				   dev->capabilities);
 
-	if (!cedrus_check_format(pix_fmt->pixelformat, CEDRUS_DECODE_DST,
-				 dev->capabilities))
+	if (!fmt)
 		return -EINVAL;
 
+	pix_fmt->pixelformat = fmt->pixelformat;
 	cedrus_prepare_format(pix_fmt);
 
 	return 0;
@@ -268,15 +268,18 @@ static int cedrus_try_fmt_vid_out(struct file *file, void *priv,
 	struct cedrus_ctx *ctx = cedrus_file2ctx(file);
 	struct cedrus_dev *dev = ctx->dev;
 	struct v4l2_pix_format *pix_fmt = &f->fmt.pix;
+	struct cedrus_format *fmt =
+		cedrus_find_format(pix_fmt->pixelformat, CEDRUS_DECODE_SRC,
+				   dev->capabilities);
 
-	if (!cedrus_check_format(pix_fmt->pixelformat, CEDRUS_DECODE_SRC,
-				 dev->capabilities))
+	if (!fmt)
 		return -EINVAL;
 
 	/* Source image size has to be provided by userspace. */
 	if (pix_fmt->sizeimage == 0)
 		return -EINVAL;
 
+	pix_fmt->pixelformat = fmt->pixelformat;
 	cedrus_prepare_format(pix_fmt);
 
 	return 0;
@@ -364,21 +367,12 @@ static int cedrus_queue_setup(struct vb2_queue *vq, unsigned int *nbufs,
 			      struct device *alloc_devs[])
 {
 	struct cedrus_ctx *ctx = vb2_get_drv_priv(vq);
-	struct cedrus_dev *dev = ctx->dev;
 	struct v4l2_pix_format *pix_fmt;
-	u32 directions;
 
-	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
-		directions = CEDRUS_DECODE_SRC;
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
 		pix_fmt = &ctx->src_fmt;
-	} else {
-		directions = CEDRUS_DECODE_DST;
+	else
 		pix_fmt = &ctx->dst_fmt;
-	}
-
-	if (!cedrus_check_format(pix_fmt->pixelformat, directions,
-				 dev->capabilities))
-		return -EINVAL;
 
 	if (*nplanes) {
 		if (sizes[0] < pix_fmt->sizeimage)
-- 
2.23.0.rc1

