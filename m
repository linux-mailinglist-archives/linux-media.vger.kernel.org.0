Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5ACA95A6
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 23:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbfIDVyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 17:54:41 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:62883 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730257AbfIDVyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Sep 2019 17:54:40 -0400
X-Halon-ID: 8a232e0e-cf5e-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.84.18])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 8a232e0e-cf5e-11e9-837a-0050569116f7;
        Wed, 04 Sep 2019 23:54:16 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 6/6] rcar-vin: Clean up how format is set on subdevice
Date:   Wed,  4 Sep 2019 23:54:09 +0200
Message-Id: <20190904215409.30136-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190904215409.30136-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190904215409.30136-1-niklas.soderlund+renesas@ragnatech.se>
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
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 42 ++++++++++-----------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index a7ee44dd248ea0a1..431ee01b0ee33e84 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -181,7 +181,7 @@ static int rvin_reset_format(struct rvin_dev *vin)
 
 static int rvin_try_format(struct rvin_dev *vin, u32 which,
 			   struct v4l2_pix_format *pix,
-			   struct v4l2_rect *crop, struct v4l2_rect *compose)
+			   struct v4l2_rect *src_rect)
 {
 	struct v4l2_subdev *sd = vin_to_source(vin);
 	struct v4l2_subdev_pad_config *pad_cfg;
@@ -200,13 +200,13 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
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
@@ -214,11 +214,11 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 
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
@@ -228,13 +228,6 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
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
 
@@ -258,29 +251,34 @@ static int rvin_try_fmt_vid_cap(struct file *file, void *priv,
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
2.23.0

