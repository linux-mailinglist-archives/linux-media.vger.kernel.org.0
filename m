Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 284E27835C2
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbjHUWa3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbjHUWa2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED544132
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8A0336B0;
        Tue, 22 Aug 2023 00:28:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656935;
        bh=6sZRcwFHnMnC2rIYbnx4/7x1mZzsYCzO0LiGWRLyHQo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DnuANdvEp14f6nYywYpFxFlQUx8MeJyHo4+LOJgEVsbwAUfbBY7CT6hlr/LBxChGH
         kPCdRobn0Akl3A5Kijd21viEfYl220/VgXyttxMQ4siP2dMaw19E77aQMCUt/rl/3z
         Qos4Hc7eRnWZ2sxVPDWEM9zMqBVJfuKTYq5MrGtU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 11/18] media: i2c: imx219: Don't store the current mode in the imx219 structure
Date:   Tue, 22 Aug 2023 01:29:54 +0300
Message-ID: <20230821223001.28480-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
---
 drivers/media/i2c/imx219.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 4e9a50117a0a..67a30dc39641 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -363,9 +363,6 @@ struct imx219 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 
-	/* Current mode */
-	const struct imx219_mode *mode;
-
 	/* Streaming on/off */
 	bool streaming;
 
@@ -584,7 +581,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	*crop = mode->crop;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		imx219->mode = mode;
 		/* Update limits and set FPS to default */
 		__v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
 					 IMX219_VTS_MAX - mode->height, 1,
@@ -967,8 +963,8 @@ static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
 static int imx219_init_controls(struct imx219 *imx219)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
+	const struct imx219_mode *mode = &supported_modes[0];
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	unsigned int height = imx219->mode->height;
 	struct v4l2_fwnode_device_properties props;
 	int exposure_max, exposure_def, hblank;
 	int i, ret;
@@ -997,15 +993,15 @@ static int imx219_init_controls(struct imx219 *imx219)
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
@@ -1192,10 +1188,8 @@ static int imx219_probe(struct i2c_client *client)
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

