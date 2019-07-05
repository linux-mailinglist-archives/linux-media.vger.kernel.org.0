Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D01860053
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 06:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbfGEE4l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 00:56:41 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:59484 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726724AbfGEE4l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jul 2019 00:56:41 -0400
X-Halon-ID: 413a1c7b-9ee1-11e9-8d05-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 413a1c7b-9ee1-11e9-8d05-005056917f90;
        Fri, 05 Jul 2019 06:56:31 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/4] rcar-vin: Clean up how format is set on subdevice
Date:   Fri,  5 Jul 2019 06:55:57 +0200
Message-Id: <20190705045557.25463-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With support for V4L2_FIELD_ALTERNATE added it's possible to clean up
how formats are set on the subdevice. This makes the code easier to read
as variable names now more clearly express their intent.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 44 ++++++++++-----------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index bc96ed563e365448..fa6cc1b76f02133e 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -170,7 +170,7 @@ static int rvin_reset_format(struct rvin_dev *vin)
 
 static int rvin_try_format(struct rvin_dev *vin, u32 which,
 			   struct v4l2_pix_format *pix,
-			   struct v4l2_rect *crop, struct v4l2_rect *compose)
+			   struct v4l2_rect *src_rect)
 {
 	struct v4l2_subdev *sd = vin_to_source(vin);
 	struct v4l2_subdev_pad_config *pad_cfg;
@@ -189,24 +189,24 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	if (!rvin_format_from_pixel(vin, pix->pixelformat))
 		pix->pixelformat = RVIN_DEFAULT_FORMAT;
 
-	v4l2_fill_mbus_format(&format.format, pix, vin->mbus_code);
-
 	/* Allow the video device to override field and to scale */
 	field = pix->field;
 	width = pix->width;
 	height = pix->height;
 
+	v4l2_fill_mbus_format(&format.format, pix, vin->mbus_code);
+
 	ret = v4l2_subdev_call(sd, pad, set_fmt, pad_cfg, &format);
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		goto done;
 
 	v4l2_fill_pix_format(pix, &format.format);
 
-	if (crop) {
-		crop->top = 0;
-		crop->left = 0;
-		crop->width = pix->width;
-		crop->height = pix->height;
+	if (src_rect) {
+		src_rect->top = 0;
+		src_rect->left = 0;
+		src_rect->width = pix->width;
+		src_rect->height = pix->height;
 	}
 
 	if (field != V4L2_FIELD_ANY)
@@ -216,17 +216,10 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	pix->height = height;
 
 	rvin_format_align(vin, pix);
-
-	if (compose) {
-		compose->top = 0;
-		compose->left = 0;
-		compose->width = pix->width;
-		compose->height = pix->height;
-	}
 done:
 	v4l2_subdev_free_pad_config(pad_cfg);
 
-	return 0;
+	return ret;
 }
 
 static int rvin_querycap(struct file *file, void *priv,
@@ -246,29 +239,34 @@ static int rvin_try_fmt_vid_cap(struct file *file, void *priv,
 {
 	struct rvin_dev *vin = video_drvdata(file);
 
-	return rvin_try_format(vin, V4L2_SUBDEV_FORMAT_TRY, &f->fmt.pix, NULL,
-			       NULL);
+	return rvin_try_format(vin, V4L2_SUBDEV_FORMAT_TRY, &f->fmt.pix, NULL);
 }
 
 static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
 	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_rect crop, compose;
+	struct v4l2_rect fmt_rect, src_rect;
 	int ret;
 
 	if (vb2_is_busy(&vin->queue))
 		return -EBUSY;
 
 	ret = rvin_try_format(vin, V4L2_SUBDEV_FORMAT_ACTIVE, &f->fmt.pix,
-			      &crop, &compose);
+			      &src_rect);
 	if (ret)
 		return ret;
 
 	vin->format = f->fmt.pix;
-	v4l2_rect_map_inside(&vin->crop, &crop);
-	v4l2_rect_map_inside(&vin->compose, &compose);
-	vin->src_rect = crop;
+
+	fmt_rect.top = 0;
+	fmt_rect.left = 0;
+	fmt_rect.width = vin->format.width;
+	fmt_rect.height = vin->format.height;
+
+	v4l2_rect_map_inside(&vin->crop, &src_rect);
+	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
+	vin->src_rect = src_rect;
 
 	return 0;
 }
-- 
2.21.0

