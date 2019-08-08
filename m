Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3353585780
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 03:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389608AbfHHBTv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 21:19:51 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:17999 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389592AbfHHBTv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 21:19:51 -0400
X-Halon-ID: 98664559-b97a-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 98664559-b97a-11e9-bdc3-005056917a89;
        Thu, 08 Aug 2019 03:19:41 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 3/6] rcar-vin: Rename rectangle holding the video source information
Date:   Thu,  8 Aug 2019 03:18:47 +0200
Message-Id: <20190808011850.21219-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The variable to hold the video source information dimensions was poorly
named 'source'. This is confusing as a lot of other members of structs
share the same name with different purposes, rename it src_rect in
preparation of refactoring code.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 33 +++++++++++----------
 drivers/media/platform/rcar-vin/rcar-vin.h  |  4 +--
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 402b40fcf7184fde..8b30267f1636aaf1 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -163,13 +163,13 @@ static int rvin_reset_format(struct rvin_dev *vin)
 
 	rvin_format_align(vin, &vin->format);
 
-	vin->source.top = 0;
-	vin->source.left = 0;
-	vin->source.width = vin->format.width;
-	vin->source.height = vin->format.height;
+	vin->src_rect.top = 0;
+	vin->src_rect.left = 0;
+	vin->src_rect.width = vin->format.width;
+	vin->src_rect.height = vin->format.height;
 
-	vin->crop = vin->source;
-	vin->compose = vin->source;
+	vin->crop = vin->src_rect;
+	vin->compose = vin->src_rect;
 
 	return 0;
 }
@@ -281,7 +281,7 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
 	vin->format = f->fmt.pix;
 	vin->crop = crop;
 	vin->compose = compose;
-	vin->source = crop;
+	vin->src_rect = crop;
 
 	return 0;
 }
@@ -319,8 +319,8 @@ static int rvin_g_selection(struct file *file, void *fh,
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 		s->r.left = s->r.top = 0;
-		s->r.width = vin->source.width;
-		s->r.height = vin->source.height;
+		s->r.width = vin->src_rect.width;
+		s->r.height = vin->src_rect.height;
 		break;
 	case V4L2_SEL_TGT_CROP:
 		s->r = vin->crop;
@@ -362,21 +362,22 @@ static int rvin_s_selection(struct file *file, void *fh,
 	case V4L2_SEL_TGT_CROP:
 		/* Can't crop outside of source input */
 		max_rect.top = max_rect.left = 0;
-		max_rect.width = vin->source.width;
-		max_rect.height = vin->source.height;
+		max_rect.width = vin->src_rect.width;
+		max_rect.height = vin->src_rect.height;
 		v4l2_rect_map_inside(&r, &max_rect);
 
-		v4l_bound_align_image(&r.width, 6, vin->source.width, 0,
-				      &r.height, 2, vin->source.height, 0, 0);
+		v4l_bound_align_image(&r.width, 6, vin->src_rect.width, 0,
+				      &r.height, 2, vin->src_rect.height, 0, 0);
 
-		r.top  = clamp_t(s32, r.top, 0, vin->source.height - r.height);
-		r.left = clamp_t(s32, r.left, 0, vin->source.width - r.width);
+		r.top  = clamp_t(s32, r.top, 0,
+				 vin->src_rect.height - r.height);
+		r.left = clamp_t(s32, r.left, 0, vin->src_rect.width - r.width);
 
 		vin->crop = s->r = r;
 
 		vin_dbg(vin, "Cropped %dx%d@%d:%d of %dx%d\n",
 			r.width, r.height, r.left, r.top,
-			vin->source.width, vin->source.height);
+			vin->src_rect.width, vin->src_rect.height);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
 		/* Make sure compose rect fits inside output format */
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index e562c2ff21ec7e7b..86e9bad44484092c 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -176,7 +176,7 @@ struct rvin_info {
  *
  * @crop:		active cropping
  * @compose:		active composing
- * @source:		active size of the video source
+ * @src_rect:		active size of the video source
  * @std:		active video standard of the video source
  *
  * @alpha:		Alpha component to fill in for supported pixel formats
@@ -215,7 +215,7 @@ struct rvin_dev {
 
 	struct v4l2_rect crop;
 	struct v4l2_rect compose;
-	struct v4l2_rect source;
+	struct v4l2_rect src_rect;
 	v4l2_std_id std;
 
 	unsigned int alpha;
-- 
2.22.0

