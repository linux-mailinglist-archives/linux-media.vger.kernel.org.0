Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0C087835BF
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbjHUWaW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbjHUWaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2363213D
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EA2829C2;
        Tue, 22 Aug 2023 00:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656930;
        bh=DAe92kQPFYZW1NvWsvcmrlFUoAX3AX+jy2DyuMxtPOo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cPsNPp1Td4Ded0BqTMy9GpgzNRAwBz6k4Qed1S9rZ1E+hKQLhhp+8IrZnZik9XuZl
         J2E+3FmAykZxALTDNPQvRpCykjeD2mEac2p2z18fhEbMtkuJltkkLXtQ7RErhM2j+4
         QlKXYQSD5d4HNZv3kG+DiDOxVWGW9SD4k8NKLHFg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 08/18] media: i2c: imx219: Use active crop rectangle to configure registers
Date:   Tue, 22 Aug 2023 01:29:51 +0300
Message-ID: <20230821223001.28480-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Configure the crop-related registers from the values stored in the
active crop rectangle instead of the mode structure. This removes usage
of the mode from the imx219_set_framefmt(). No functional change is
intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 16776a3ae84d..1205986ce47e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -615,9 +615,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx219_set_framefmt(struct imx219 *imx219,
-			       const struct v4l2_mbus_framefmt *format)
+			       const struct v4l2_mbus_framefmt *format,
+			       const struct v4l2_rect *crop)
 {
-	const struct imx219_mode *mode = imx219->mode;
 	unsigned int bpp;
 	u16 bin_mode;
 	int ret = 0;
@@ -640,15 +640,13 @@ static int imx219_set_framefmt(struct imx219 *imx219,
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
@@ -719,6 +717,7 @@ static int imx219_start_streaming(struct imx219 *imx219,
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
 	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(&client->dev);
@@ -742,7 +741,8 @@ static int imx219_start_streaming(struct imx219 *imx219,
 
 	/* Apply format and crop settings. */
 	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
-	ret = imx219_set_framefmt(imx219, format);
+	crop = v4l2_subdev_get_pad_crop(&imx219->sd, state, 0);
+	ret = imx219_set_framefmt(imx219, format, crop);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set frame format: %d\n",
 			__func__, ret);
-- 
Regards,

Laurent Pinchart

