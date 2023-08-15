Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01ADF77D1B6
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 20:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239072AbjHOSYi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 14:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239067AbjHOSYf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 14:24:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6FF1BC1
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 11:24:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9E7D58618;
        Tue, 15 Aug 2023 20:23:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692123800;
        bh=YLhwuSUZpfRqnRfRyEQsDkmxfSgycVJiZ6X0fh1GKJQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SSXTkVLWzkk0i+MOY3EOoXlmDOzOI8Y9BVt4Ji7zOukab5TtPDQHtX6gTVbjCmtOf
         xOgqgG1rUN2MThkOotJwAI2m3isXeUbN3vHvwd+PFnrlvmIIBwNiWcVajA8I4sK9VX
         ETiuWcDPsZbMiLcQRLl6/JXoRn3wiFZw7ao05tSU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v1 06/12] media: i2c: imx219: Merge format and binning setting functions
Date:   Tue, 15 Aug 2023 21:24:25 +0300
Message-ID: <20230815182431.18409-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815182431.18409-1-laurent.pinchart@ideasonboard.com>
References: <20230815182431.18409-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx219_set_binning() function sets registers based on the bpp value,
which is computed in imx219_set_framefmt(). As both functions are called
from the same place consecutively, and set registers based on the
selected mode, merge them together to simplify the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 43 +++++++++-----------------------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 9f1656bc3302..8c61b748d9a5 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -618,6 +618,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 {
 	const struct imx219_mode *mode = imx219->mode;
 	unsigned int bpp;
+	u16 bin_mode;
 	int ret = 0;
 
 	switch (format->code) {
@@ -648,6 +649,15 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 		  mode->crop.top - IMX219_PIXEL_ARRAY_TOP + mode->crop.height - 1,
 		  &ret);
 
+	if (!imx219->mode->binning)
+		bin_mode = IMX219_BINNING_NONE;
+	else if (bpp == 8)
+		bin_mode = IMX219_BINNING_2X2_ANALOG;
+	else
+		bin_mode = IMX219_BINNING_2X2;
+
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE, bin_mode, &ret);
+
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
 	cci_write(imx219->regmap, IMX219_REG_Y_OUTPUT_SIZE,
@@ -665,32 +675,6 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	return ret;
 }
 
-static int imx219_set_binning(struct imx219 *imx219,
-			      const struct v4l2_mbus_framefmt *format)
-{
-	if (!imx219->mode->binning)
-		return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
-				 IMX219_BINNING_NONE, NULL);
-
-	switch (format->code) {
-	case MEDIA_BUS_FMT_SRGGB8_1X8:
-	case MEDIA_BUS_FMT_SGRBG8_1X8:
-	case MEDIA_BUS_FMT_SGBRG8_1X8:
-	case MEDIA_BUS_FMT_SBGGR8_1X8:
-		return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
-				 IMX219_BINNING_2X2_ANALOG, NULL);
-
-	case MEDIA_BUS_FMT_SRGGB10_1X10:
-	case MEDIA_BUS_FMT_SGRBG10_1X10:
-	case MEDIA_BUS_FMT_SGBRG10_1X10:
-	case MEDIA_BUS_FMT_SBGGR10_1X10:
-		return cci_write(imx219->regmap, IMX219_REG_BINNING_MODE,
-				 IMX219_BINNING_2X2, NULL);
-	}
-
-	return -EINVAL;
-}
-
 static int imx219_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
@@ -764,13 +748,6 @@ static int imx219_start_streaming(struct imx219 *imx219,
 		goto err_rpm_put;
 	}
 
-	ret = imx219_set_binning(imx219, format);
-	if (ret) {
-		dev_err(&client->dev, "%s failed to set binning: %d\n",
-			__func__, ret);
-		goto err_rpm_put;
-	}
-
 	/* Apply customized values from user */
 	ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
 	if (ret)
-- 
Regards,

Laurent Pinchart

