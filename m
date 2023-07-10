Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE5C74DA7E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jul 2023 17:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjGJPyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jul 2023 11:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbjGJPxz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jul 2023 11:53:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C22E6B
        for <linux-media@vger.kernel.org>; Mon, 10 Jul 2023 08:53:38 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F333610BB;
        Mon, 10 Jul 2023 17:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689004289;
        bh=MPVqpusqOvX7SWy0W4v66P5BUicus4B968eSocP6ayM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CZaQ+IlqEZvmz3qryGtoo2EmY1o9TCvzTHNgb5VVookd576sRZLpUTW+gz099VO93
         aehuZ1W84LFT3Om+SzYVw8chjFpLXqggZpuirtY3ClBoDMGZYcaMY25Y3/+VTM4z8f
         ZWMS7knyQ3RfzaZQmqhgt8hTaCd8i3MT3lUysPDk=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Subject: [PATCH v2 2/7] media: i2c: imx219: Switch from open to init_cfg
Date:   Mon, 10 Jul 2023 17:51:58 +0200
Message-Id: <20230710155203.92366-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
References: <20230710155203.92366-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

Use the init_cfg pad level operation instead of the internal subdev
open operation to set default formats on the pads.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 63 +++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index ac6b0e7a838d..45b219321d98 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -608,34 +608,6 @@ static void imx219_set_default_format(struct imx219 *imx219)
 	fmt->field = V4L2_FIELD_NONE;
 }
 
-static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-{
-	struct imx219 *imx219 = to_imx219(sd);
-	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->state, 0);
-	struct v4l2_rect *try_crop;
-
-	mutex_lock(&imx219->mutex);
-
-	/* Initialize try_fmt */
-	try_fmt->width = supported_modes[0].width;
-	try_fmt->height = supported_modes[0].height;
-	try_fmt->code = imx219_get_format_code(imx219,
-					       MEDIA_BUS_FMT_SRGGB10_1X10);
-	try_fmt->field = V4L2_FIELD_NONE;
-
-	/* Initialize try_crop rectangle. */
-	try_crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
-	try_crop->top = IMX219_PIXEL_ARRAY_TOP;
-	try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
-	try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
-	try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
-
-	mutex_unlock(&imx219->mutex);
-
-	return 0;
-}
-
 static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct imx219 *imx219 =
@@ -725,6 +697,36 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
 	.s_ctrl = imx219_set_ctrl,
 };
 
+static int imx219_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	struct imx219 *imx219 = to_imx219(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+
+	/* imx219_get_format_code() wants mutex locked. */
+	mutex_lock(&imx219->mutex);
+
+	/* Initialize try_fmt */
+	format = v4l2_subdev_get_pad_format(sd, state, 0);
+	format->width = supported_modes[0].width;
+	format->height = supported_modes[0].height;
+	format->code = imx219_get_format_code(imx219,
+					      MEDIA_BUS_FMT_SRGGB10_1X10);
+	format->field = V4L2_FIELD_NONE;
+
+	/* Initialize crop rectangle. */
+	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
+	crop->top = IMX219_PIXEL_ARRAY_TOP;
+	crop->left = IMX219_PIXEL_ARRAY_LEFT;
+	crop->width = IMX219_PIXEL_ARRAY_WIDTH;
+	crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
+
+	mutex_unlock(&imx219->mutex);
+
+	return 0;
+}
+
 static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -1235,6 +1237,7 @@ static const struct v4l2_subdev_video_ops imx219_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
+	.init_cfg = imx219_init_cfg,
 	.enum_mbus_code = imx219_enum_mbus_code,
 	.get_fmt = imx219_get_pad_format,
 	.set_fmt = imx219_set_pad_format,
@@ -1248,9 +1251,6 @@ static const struct v4l2_subdev_ops imx219_subdev_ops = {
 	.pad = &imx219_pad_ops,
 };
 
-static const struct v4l2_subdev_internal_ops imx219_internal_ops = {
-	.open = imx219_open,
-};
 
 static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
 {
@@ -1509,7 +1509,6 @@ static int imx219_probe(struct i2c_client *client)
 		goto error_power_off;
 
 	/* Initialize subdev */
-	imx219->sd.internal_ops = &imx219_internal_ops;
 	imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-- 
2.40.1

