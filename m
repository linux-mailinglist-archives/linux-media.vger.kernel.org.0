Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5679679EA35
	for <lists+linux-media@lfdr.de>; Wed, 13 Sep 2023 15:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241171AbjIMN4n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Sep 2023 09:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241144AbjIMN4m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Sep 2023 09:56:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07F919B1
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 06:56:38 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A594A22A4;
        Wed, 13 Sep 2023 15:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694613305;
        bh=16Nh2MIOvulTMgDKpNlgrqzKiaHVzrTOBikaM7Wgfgk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H06Zx37Kf5f5pJ4/iXGhRi86mcg8sxrj/zhTHGZY2qqANGjMm6tRorz1lrdIJIt76
         pkU3CiDd6KrzJLFa7m+Q0qOYtHrTC6VGHZvFEZrU4LGSe2P9jODpLnWbtJc9XVQ14w
         OmfJbUQoLYHVkkx8Q7E9CF4a2UK3fsvdnoa3XdVM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 09/20] media: i2c: imx219: Use active crop rectangle to configure registers
Date:   Wed, 13 Sep 2023 16:56:27 +0300
Message-ID: <20230913135638.26277-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
References: <20230913135638.26277-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Configure the crop-related registers from the values stored in the
active crop rectangle instead of the mode structure. This removes usage
of the mode from the imx219_set_framefmt(). No functional change is
intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Changes since v2:

- Pass state to imx219_set_framefmt()
---
 drivers/media/i2c/imx219.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index f53812ad4560..7a87a439a0fe 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -614,13 +614,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx219_set_framefmt(struct imx219 *imx219,
-			       const struct v4l2_mbus_framefmt *format)
+			       struct v4l2_subdev_state *state)
 {
-	const struct imx219_mode *mode = imx219->mode;
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
 	unsigned int bpp;
 	u64 bin_mode;
 	int ret = 0;
 
+	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
+	crop = v4l2_subdev_get_pad_crop(&imx219->sd, state, 0);
+
 	switch (format->code) {
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
@@ -639,15 +643,13 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	}
 
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_STA_A,
-		  mode->crop.left - IMX219_PIXEL_ARRAY_LEFT, &ret);
+		  crop->left - IMX219_PIXEL_ARRAY_LEFT, &ret);
 	cci_write(imx219->regmap, IMX219_REG_X_ADD_END_A,
-		  mode->crop.left - IMX219_PIXEL_ARRAY_LEFT + mode->crop.width - 1,
-		  &ret);
+		  crop->left - IMX219_PIXEL_ARRAY_LEFT + crop->width - 1, &ret);
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_STA_A,
-		  mode->crop.top - IMX219_PIXEL_ARRAY_TOP, &ret);
+		  crop->top - IMX219_PIXEL_ARRAY_TOP, &ret);
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
-		  mode->crop.top - IMX219_PIXEL_ARRAY_TOP + mode->crop.height - 1,
-		  &ret);
+		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
 
 	if (!imx219->mode->binning)
 		bin_mode = IMX219_BINNING_NONE;
@@ -717,7 +719,6 @@ static int imx219_start_streaming(struct imx219 *imx219,
 				  struct v4l2_subdev_state *state)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
-	const struct v4l2_mbus_framefmt *format;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(&client->dev);
@@ -740,8 +741,7 @@ static int imx219_start_streaming(struct imx219 *imx219,
 	}
 
 	/* Apply format and crop settings. */
-	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
-	ret = imx219_set_framefmt(imx219, format);
+	ret = imx219_set_framefmt(imx219, state);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set frame format: %d\n",
 			__func__, ret);
-- 
Regards,

Laurent Pinchart

