Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4F83A65EE
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 13:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235899AbhFNLqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 07:46:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236870AbhFNLoe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 07:44:34 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A8BB5EBF;
        Mon, 14 Jun 2021 13:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623669856;
        bh=ldOiqektYk1KFKR+QZstm5X+O5XBsfa+x0khRZh+qMc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PHXvDsDKO8TrmhjIKUKBJ8xuSssUMcThBNROXUxPFRsDf/1Pz6HyJ2tC9NyCWsXvR
         Q13b+NLXh74aIMk3wZcATRrMDqTkasuQQWFDHX2Wd/tT9oYSTGAoho2Hyt//7l8YhO
         s1itR4utPqnGTxYiG4OUrJGt5ONYAwVfgqQuCV9Y=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 32/35] media: ti-vpe: cal: add camerarx locking
Date:   Mon, 14 Jun 2021 14:23:42 +0300
Message-Id: <20210614112345.2032435-33-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
References: <20210614112345.2032435-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We don't have any locking in camerarx for the subdev ops. We have
managed fine so far without locking, but in the future multiple video
capture devices can use the same camerarx, and locking is a must.

Add a mutex to protect the camerarx subdev ops. Some of the functions
were slightly restructured to make lock handling cleaner.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-camerarx.c | 81 ++++++++++++++------
 drivers/media/platform/ti-vpe/cal.h          |  6 ++
 2 files changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 82392499e663..f799047c70f7 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -601,12 +601,18 @@ cal_camerarx_get_pad_format(struct cal_camerarx *phy,
 static int cal_camerarx_sd_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	int ret = 0;
+
+	mutex_lock(&phy->mutex);
 
 	if (enable)
-		return cal_camerarx_start(phy);
+		ret = cal_camerarx_start(phy);
+	else
+		cal_camerarx_stop(phy);
 
-	cal_camerarx_stop(phy);
-	return 0;
+	mutex_unlock(&phy->mutex);
+
+	return ret;
 }
 
 static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
@@ -614,27 +620,36 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
+	int ret = 0;
+
+	mutex_lock(&phy->mutex);
 
 	/* No transcoding, source and sink codes must match. */
 	if (code->pad == CAL_CAMERARX_PAD_SOURCE) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		if (code->index > 0)
-			return -EINVAL;
+		if (code->index > 0) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		fmt = cal_camerarx_get_pad_format(phy, sd_state,
 						  CAL_CAMERARX_PAD_SINK,
 						  code->which);
 		code->code = fmt->code;
-		return 0;
-	}
+	} else {
+		if (code->index >= cal_num_formats) {
+			ret = -EINVAL;
+			goto out;
+		}
 
-	if (code->index >= cal_num_formats)
-		return -EINVAL;
+		code->code = cal_formats[code->index].code;
+	}
 
-	code->code = cal_formats[code->index].code;
+out:
+	mutex_unlock(&phy->mutex);
 
-	return 0;
+	return ret;
 }
 
 static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
@@ -643,10 +658,13 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 {
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
 	const struct cal_format_info *fmtinfo;
+	int ret = 0;
 
 	if (fse->index > 0)
 		return -EINVAL;
 
+	mutex_lock(&phy->mutex);
+
 	/* No transcoding, source and sink formats must match. */
 	if (fse->pad == CAL_CAMERARX_PAD_SOURCE) {
 		struct v4l2_mbus_framefmt *fmt;
@@ -654,27 +672,32 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 		fmt = cal_camerarx_get_pad_format(phy, sd_state,
 						  CAL_CAMERARX_PAD_SINK,
 						  fse->which);
-		if (fse->code != fmt->code)
-			return -EINVAL;
+		if (fse->code != fmt->code) {
+			ret = -EINVAL;
+			goto out;
+		}
 
 		fse->min_width = fmt->width;
 		fse->max_width = fmt->width;
 		fse->min_height = fmt->height;
 		fse->max_height = fmt->height;
+	} else {
+		fmtinfo = cal_format_by_code(fse->code);
+		if (!fmtinfo) {
+			ret = -EINVAL;
+			goto out;
+		}
 
-		return 0;
+		fse->min_width = CAL_MIN_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
+		fse->max_width = CAL_MAX_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
+		fse->min_height = CAL_MIN_HEIGHT_LINES;
+		fse->max_height = CAL_MAX_HEIGHT_LINES;
 	}
 
-	fmtinfo = cal_format_by_code(fse->code);
-	if (!fmtinfo)
-		return -EINVAL;
-
-	fse->min_width = CAL_MIN_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
-	fse->max_width = CAL_MAX_WIDTH_BYTES * 8 / ALIGN(fmtinfo->bpp, 8);
-	fse->min_height = CAL_MIN_HEIGHT_LINES;
-	fse->max_height = CAL_MAX_HEIGHT_LINES;
+out:
+	mutex_unlock(&phy->mutex);
 
-	return 0;
+	return ret;
 }
 
 static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
@@ -684,10 +707,14 @@ static int cal_camerarx_sd_get_fmt(struct v4l2_subdev *sd,
 	struct cal_camerarx *phy = to_cal_camerarx(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
+	mutex_lock(&phy->mutex);
+
 	fmt = cal_camerarx_get_pad_format(phy, sd_state, format->pad,
 					  format->which);
 	format->format = *fmt;
 
+	mutex_unlock(&phy->mutex);
+
 	return 0;
 }
 
@@ -725,6 +752,9 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 	format->format.field = V4L2_FIELD_NONE;
 
 	/* Store the format and propagate it to the source pad. */
+
+	mutex_lock(&phy->mutex);
+
 	fmt = cal_camerarx_get_pad_format(phy, sd_state,
 					  CAL_CAMERARX_PAD_SINK,
 					  format->which);
@@ -735,6 +765,8 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 					  format->which);
 	*fmt = format->format;
 
+	mutex_unlock(&phy->mutex);
+
 	return 0;
 }
 
@@ -801,6 +833,8 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	phy->cal = cal;
 	phy->instance = instance;
 
+	mutex_init(&phy->mutex);
+
 	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						(instance == 0) ?
 						"cal_rx_core0" :
@@ -864,5 +898,6 @@ void cal_camerarx_destroy(struct cal_camerarx *phy)
 	media_entity_cleanup(&phy->subdev.entity);
 	of_node_put(phy->source_ep_node);
 	of_node_put(phy->source_node);
+	mutex_destroy(&phy->mutex);
 	kfree(phy);
 }
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index 400f95485d7c..cf0b8f5d4378 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -163,6 +163,12 @@ struct cal_camerarx {
 	struct v4l2_subdev	subdev;
 	struct media_pad	pads[2];
 	struct v4l2_mbus_framefmt	formats[2];
+
+	/*
+	 * Lock for camerarx ops. Protects:
+	 * - formats
+	 */
+	struct mutex		mutex;
 };
 
 struct cal_dev {
-- 
2.25.1

