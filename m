Return-Path: <linux-media+bounces-36217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEB4AED11E
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 22:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C03D816EE68
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 20:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22A823D2AC;
	Sun, 29 Jun 2025 20:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEqd8vWu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5090B3D6F
	for <linux-media@vger.kernel.org>; Sun, 29 Jun 2025 20:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751230610; cv=none; b=IxEYQfz/pM6gus7Clwd9tGdCmGEMHbWGt9+SKLjDvlcppKDfQgMgxyvr4/2etimFtQds93Yg7uXLQd3CDKyUVdUR0OAL1MzXoK5VXICuUqHM5PgVgFCXQA1LxTCrNMeW7Jd6/RteF8yCZtuhoGu9XVAvyXuERZIVkSw5gkwcGco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751230610; c=relaxed/simple;
	bh=F30y/yNXWqM7xvHXtaQlKdofbUn8MtXza+ImMK57gaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CK8ZTkHv/xEwum7kISP/lNY+urSxDzNIuCseuNOF+VFbUzd1mKGkJpUpp04PuDaiMAnXmDBv7fzizzkDMs9ANqAJRvY4mt7Ad6dvwGu5VG16cab1KTLhQLke+GVqSTDxmX5Cet3jMFdw2DoDdvDjFPjwGn6Qlm3wkemgpgi9l1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEqd8vWu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB799C4CEEB;
	Sun, 29 Jun 2025 20:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751230610;
	bh=F30y/yNXWqM7xvHXtaQlKdofbUn8MtXza+ImMK57gaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kEqd8vWuLg3wWHsraTBHvurFhcW6m061uaVXmrkckYnj9buHvxzCi0KIoPQpAsQVb
	 BtSXEY2hqMCGz/Fnb3Gjd3MI3pm/3MThgZC16I33BGdeEwTAa7vJZC1emuGychnuF4
	 vHYZRCnM9lTH5B2XKEAJrw8EOPDqKj8dBZZcDpOjJ71J0uOE39vD7PbCSQkqmaeHUI
	 3gO7EQjsymkY1ihYGI6GdzSI9TWLsnMjfAiUiKCEv8XoAby8JCrSRkZ0QJ3SVp37C7
	 4OUstzOCTgwwz1GtralacKJy+etwFrGTlGc88NvJNe1FWGbxLzI2V2HpxAP1wKsI3P
	 W4J4Rbw4daqaw==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mathis Foerst <mathis.foerst@mt.com>,
	linux-media@vger.kernel.org
Subject: [PATCH v3 09/15] media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
Date: Sun, 29 Jun 2025 22:56:19 +0200
Message-ID: <20250629205626.68341-10-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250629205626.68341-1-hansg@kernel.org>
References: <20250629205626.68341-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Normally the IFP removes a 4 pixel border all around its sink format
size for demosaicing. But in RAW10 mode it does not do this.

Add a new mt9m114_ifp_get_border() helper function to get the border size
(4 or 0) and use this where applicable instead of hardcoding a border
of 4 pixels everywhere.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- New patch in v3 of this patch-set
---
 drivers/media/i2c/mt9m114.c | 54 ++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index d4aad77b095b..020caae95a3d 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -843,6 +843,18 @@ static int mt9m114_configure_pa(struct mt9m114 *sensor,
 	return ret;
 }
 
+/*
+ * For src pad fmts other then RAW10 the IFP removes a 4 pixel border from its
+ * sink pad format size for demosaicing.
+ */
+static int mt9m114_ifp_get_border(struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *format =
+		v4l2_subdev_state_get_format(state, 1);
+
+	return format->code == MEDIA_BUS_FMT_SGRBG10_1X10 ? 0 : 4;
+}
+
 static int mt9m114_configure_ifp(struct mt9m114 *sensor,
 				 struct v4l2_subdev_state *state)
 {
@@ -850,6 +862,7 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
 	const struct v4l2_rect *compose;
+	unsigned int border;
 	u64 output_format;
 	int ret = 0;
 
@@ -864,15 +877,18 @@ static int mt9m114_configure_ifp(struct mt9m114 *sensor,
 		return ret;
 
 	/*
+	 * For src pad fmts other then RAW10 adjust cropping coordinates for
 	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
 	 * and top coordinates to compensate for the lines and columns removed
 	 * by demosaicing that are taken into account in the crop rectangle but
 	 * not in the hardware.
 	 */
+	border = mt9m114_ifp_get_border(state);
+
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_XOFFSET,
-		  crop->left - 4, &ret);
+		  crop->left - border, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_YOFFSET,
-		  crop->top - 4, &ret);
+		  crop->top - border, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_WIDTH,
 		  crop->width, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_HEIGHT,
@@ -1845,6 +1861,7 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 {
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
+	unsigned int border;
 	int ret = 0;
 
 	/* Crop and compose are only supported on the sink pad. */
@@ -1859,15 +1876,17 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
 		/*
-		 * The crop default and bounds are equal to the sink
-		 * format size minus 4 pixels on each side for demosaicing.
+		 * Crop defaults and bounds are equal to the sink format size.
+		 * For src pad fmts other then RAW10 this gets reduced by 4
+		 * pixels on each side for demosaicing.
 		 */
 		format = v4l2_subdev_state_get_format(state, 0);
+		border = mt9m114_ifp_get_border(state);
 
-		sel->r.left = 4;
-		sel->r.top = 4;
-		sel->r.width = format->width - 8;
-		sel->r.height = format->height - 8;
+		sel->r.left = border;
+		sel->r.top = border;
+		sel->r.width = format->width - 2 * border;
+		sel->r.height = format->height - 2 * border;
 		break;
 
 	case V4L2_SEL_TGT_COMPOSE:
@@ -1902,6 +1921,7 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 	struct v4l2_rect *compose;
+	unsigned int border;
 
 	if (sel->target != V4L2_SEL_TGT_CROP &&
 	    sel->target != V4L2_SEL_TGT_COMPOSE)
@@ -1917,21 +1937,23 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 
 	if (sel->target == V4L2_SEL_TGT_CROP) {
 		/*
-		 * Clamp the crop rectangle. Demosaicing removes 4 pixels on
-		 * each side of the image.
+		 * Clamp the crop rectangle. For src pad fmts other then RAW10
+		 * demosaicing removes 4 pixels on each side of the image.
 		 */
-		crop->left = clamp_t(unsigned int, ALIGN(sel->r.left, 2), 4,
-				     format->width - 4 -
+		border = mt9m114_ifp_get_border(state);
+
+		crop->left = clamp_t(unsigned int, ALIGN(sel->r.left, 2), border,
+				     format->width - border -
 				     MT9M114_SCALER_CROPPED_INPUT_WIDTH);
-		crop->top = clamp_t(unsigned int, ALIGN(sel->r.top, 2), 4,
-				    format->height - 4 -
+		crop->top = clamp_t(unsigned int, ALIGN(sel->r.top, 2), border,
+				    format->height - border -
 				    MT9M114_SCALER_CROPPED_INPUT_HEIGHT);
 		crop->width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
 				      MT9M114_SCALER_CROPPED_INPUT_WIDTH,
-				      format->width - 4 - crop->left);
+				      format->width - border - crop->left);
 		crop->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
 				       MT9M114_SCALER_CROPPED_INPUT_HEIGHT,
-				       format->height - 4 - crop->top);
+				       format->height - border - crop->top);
 
 		sel->r = *crop;
 
-- 
2.49.0


