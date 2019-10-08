Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98132D040B
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 01:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729705AbfJHXWm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 19:22:42 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:27888 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727059AbfJHXWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 19:22:42 -0400
X-Halon-ID: 74ad2617-ea22-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 74ad2617-ea22-11e9-bdc3-005056917a89;
        Wed, 09 Oct 2019 01:22:12 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] rcar-vin: Create compose rectangle where it is used
Date:   Wed,  9 Oct 2019 01:22:01 +0200
Message-Id: <20191008232201.1768407-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191008232201.1768407-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191008232201.1768407-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The rectangle used to correct the compose settings when changing the
format was created inside a helper function and not where it was used.
This is confusing and makes the code harder to read, fix this.

This cleanup is made possible due to refactoring elsewhere and there is
no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 25 +++++++++------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index f809350c514c337c..9a9b89c0dc0b3be4 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -181,8 +181,7 @@ static int rvin_reset_format(struct rvin_dev *vin)
 
 static int rvin_try_format(struct rvin_dev *vin, u32 which,
 			   struct v4l2_pix_format *pix,
-			   struct v4l2_rect *src_rect,
-			   struct v4l2_rect *compose)
+			   struct v4l2_rect *src_rect)
 {
 	struct v4l2_subdev *sd = vin_to_source(vin);
 	struct v4l2_subdev_pad_config *pad_cfg;
@@ -229,13 +228,6 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
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
 
@@ -259,28 +251,33 @@ static int rvin_try_fmt_vid_cap(struct file *file, void *priv,
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
-	struct v4l2_rect src_rect, compose;
+	struct v4l2_rect fmt_rect, src_rect;
 	int ret;
 
 	if (vb2_is_busy(&vin->queue))
 		return -EBUSY;
 
 	ret = rvin_try_format(vin, V4L2_SUBDEV_FORMAT_ACTIVE, &f->fmt.pix,
-			      &src_rect, &compose);
+			      &src_rect);
 	if (ret)
 		return ret;
 
 	vin->format = f->fmt.pix;
+
+	fmt_rect.top = 0;
+	fmt_rect.left = 0;
+	fmt_rect.width = vin->format.width;
+	fmt_rect.height = vin->format.height;
+
 	v4l2_rect_map_inside(&vin->crop, &src_rect);
-	v4l2_rect_map_inside(&vin->compose, &compose);
+	v4l2_rect_map_inside(&vin->compose, &fmt_rect);
 	vin->src_rect = src_rect;
 
 	return 0;
-- 
2.23.0

