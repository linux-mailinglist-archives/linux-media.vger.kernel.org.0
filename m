Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1236B7ACA8B
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjIXPdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjIXPdX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75AB3FE
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:33:16 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4ACF1891;
        Sun, 24 Sep 2023 17:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569494;
        bh=fUUWq76+XLOkbRUY37F/5rk/Wj0bFkYLYyKKwEVAY8g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U49hNEb9v6KfryweuiC3sK+P/Su3i53PwCG/9Epz7sfCVQU3rWcqFC2AFT7Tjt+Ho
         kQoFTA/QZUuh3rRmtYTl8XyzsjIlGmVI0PeQ66gYwjfCtozmRk4oBUGRqUxvDFM5GO
         xaNUEWLB07gwVpkV5pBP/VQKdlyBMm67Dgrybpig=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 12/20] media: i2c: imx219: Don't store the current mode in the imx219 structure
Date:   Sun, 24 Sep 2023 18:33:01 +0300
Message-ID: <20230924153309.12423-13-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
References: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mode field of the imx219 structure is only used in
imx219_init_controls(), after the probe function sets it to point to the
default mode. Use the default mode directly when initializing controls,
and drop the mode field from the imx219 structure.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f4f684bda4fa..82e5d1dad14a 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -362,9 +362,6 @@ struct imx219 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 
-	/* Current mode */
-	const struct imx219_mode *mode;
-
 	/* Two or Four lanes */
 	u8 lanes;
 };
@@ -580,7 +577,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	*crop = mode->crop;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		imx219->mode = mode;
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
 					 IMX219_VTS_MAX - mode->height, 1,
@@ -923,8 +919,8 @@ static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
 static int imx219_init_controls(struct imx219 *imx219)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
+	const struct imx219_mode *mode = &supported_modes[0];
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	unsigned int height = imx219->mode->height;
 	struct v4l2_fwnode_device_properties props;
 	int exposure_max, exposure_def, hblank;
 	int i, ret;
@@ -953,15 +949,15 @@ static int imx219_init_controls(struct imx219 *imx219)
 	/* Initial vblank/hblank/exposure parameters based on current mode */
 	imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
-					   IMX219_VTS_MAX - height, 1,
-					   imx219->mode->vts_def - height);
-	hblank = IMX219_PPL_DEFAULT - imx219->mode->width;
+					   IMX219_VTS_MAX - mode->height, 1,
+					   mode->vts_def - mode->height);
+	hblank = IMX219_PPL_DEFAULT - mode->width;
 	imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
 					   V4L2_CID_HBLANK, hblank, hblank,
 					   1, hblank);
 	if (imx219->hblank)
 		imx219->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	exposure_max = imx219->mode->vts_def - 4;
+	exposure_max = mode->vts_def - 4;
 	exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
 		exposure_max : IMX219_EXPOSURE_DEFAULT;
 	imx219->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
@@ -1148,10 +1144,8 @@ static int imx219_probe(struct i2c_client *client)
 	if (ret)
 		goto error_power_off;
 
-	/* Set default mode to max resolution */
-	imx219->mode = &supported_modes[0];
-
-	/* sensor doesn't enter LP-11 state upon power up until and unless
+	/*
+	 * Sensor doesn't enter LP-11 state upon power up until and unless
 	 * streaming is started, so upon power up switch the modes to:
 	 * streaming -> standby
 	 */
-- 
Regards,

Laurent Pinchart

