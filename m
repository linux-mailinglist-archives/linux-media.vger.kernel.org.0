Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 801CAD040D
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 01:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729320AbfJHXWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 19:22:43 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:32414 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbfJHXWm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 19:22:42 -0400
X-Halon-ID: 742fd91a-ea22-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 742fd91a-ea22-11e9-bdc3-005056917a89;
        Wed, 09 Oct 2019 01:22:11 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] rcar-vin: Rename wrongly named rectangle
Date:   Wed,  9 Oct 2019 01:22:00 +0200
Message-Id: <20191008232201.1768407-2-niklas.soderlund+renesas@ragnatech.se>
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

After recent refactoring the rectangle named crop no longer reflects it
usage, to contain the source rectangle. Fix this by renaming it. There
is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index a7ee44dd248ea0a1..f809350c514c337c 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -181,7 +181,8 @@ static int rvin_reset_format(struct rvin_dev *vin)
 
 static int rvin_try_format(struct rvin_dev *vin, u32 which,
 			   struct v4l2_pix_format *pix,
-			   struct v4l2_rect *crop, struct v4l2_rect *compose)
+			   struct v4l2_rect *src_rect,
+			   struct v4l2_rect *compose)
 {
 	struct v4l2_subdev *sd = vin_to_source(vin);
 	struct v4l2_subdev_pad_config *pad_cfg;
@@ -214,11 +215,11 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 
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
@@ -266,21 +267,21 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
 			      struct v4l2_format *f)
 {
 	struct rvin_dev *vin = video_drvdata(file);
-	struct v4l2_rect crop, compose;
+	struct v4l2_rect src_rect, compose;
 	int ret;
 
 	if (vb2_is_busy(&vin->queue))
 		return -EBUSY;
 
 	ret = rvin_try_format(vin, V4L2_SUBDEV_FORMAT_ACTIVE, &f->fmt.pix,
-			      &crop, &compose);
+			      &src_rect, &compose);
 	if (ret)
 		return ret;
 
 	vin->format = f->fmt.pix;
-	v4l2_rect_map_inside(&vin->crop, &crop);
+	v4l2_rect_map_inside(&vin->crop, &src_rect);
 	v4l2_rect_map_inside(&vin->compose, &compose);
-	vin->src_rect = crop;
+	vin->src_rect = src_rect;
 
 	return 0;
 }
-- 
2.23.0

