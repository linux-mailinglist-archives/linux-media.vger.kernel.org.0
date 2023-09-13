Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43DF479EA3D
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241187AbjIMN4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241183AbjIMN4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:56:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7E619B1
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 06:56:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD77D2D14;
        Wed, 13 Sep 2023 15:55:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694613315;
        bh=LRSTE3qM4IKlYsDxBpa3oNhgKNwTozhY/B9IRL39Xs0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s30oDv5QMWod2T7Zp+xFO5P13Y8LmtrDVQorzKMif7IaGdr6AdPU9rOupc9E7KW4T
         UIEYiQ9TXj322JR/DS0GyjkEazER0asobh7OlwHw8BjNrftIDqtRTCQ8zQv3ONeWjS
         Sb8UIJpiRJOt3+M2vJXHqeo52L+AAi9ep9fqN6lo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 16/20] media: i2c: imx219: Implement .init_cfg() using .set_fmt()
Date:   Wed, 13 Sep 2023 16:56:34 +0300
Message-ID: <20230913135638.26277-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of duplicating the logical implemented in the .set_fmt()
operation in .init_cfg(), call .set_fmt() directly. This centralizes the
format and crop rectangle calculations in a single place.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 40 +++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index a12ebf288dd2..6bfdceaf5044 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -784,28 +784,6 @@ static void imx219_update_pad_format(struct imx219 *imx219,
 	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
-static int imx219_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *state)
-{
-	struct imx219 *imx219 = to_imx219(sd);
-	struct v4l2_mbus_framefmt *format;
-	struct v4l2_rect *crop;
-
-	/* Initialize the format. */
-	format = v4l2_subdev_get_pad_format(sd, state, 0);
-	imx219_update_pad_format(imx219, &supported_modes[0], format,
-				 MEDIA_BUS_FMT_SRGGB10_1X10);
-
-	/* Initialize the crop rectangle. */
-	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
-	crop->top = IMX219_PIXEL_ARRAY_TOP;
-	crop->left = IMX219_PIXEL_ARRAY_LEFT;
-	crop->width = IMX219_PIXEL_ARRAY_WIDTH;
-	crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
-
-	return 0;
-}
-
 static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -924,6 +902,24 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
+static int imx219_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.pad = 0,
+		.format = {
+			.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+			.width = supported_modes[0].width,
+			.height = supported_modes[0].height,
+		},
+	};
+
+	imx219_set_pad_format(sd, state, &fmt);
+
+	return 0;
+}
+
 static const struct v4l2_subdev_core_ops imx219_core_ops = {
 	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
-- 
Regards,

Laurent Pinchart

