Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0BCC66ACF9
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 18:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbjANRSQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 12:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbjANRSN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 12:18:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A92B762
        for <linux-media@vger.kernel.org>; Sat, 14 Jan 2023 09:18:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 174B44DD;
        Sat, 14 Jan 2023 18:18:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673716691;
        bh=GkHNl/vEqXrWZl6GyNKNShGMhT09G4TRj0d0QsJ0+Q0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DQHs7Ui/Kll9VK9e4S/90ZWXrCmSmdaBs08dK4Ef4R2dcI3poir8LzyPzHuozFVq/
         Xd2v6VKC3ZRwZe1JGd00X05cry/k47q6Zspj0NQRn2aNQ3l4YxtDNYRD6yuxbdbtVW
         EkjZfW6MrIq5miVvQO6Tr67G2jvYpT5ItxM4vQvU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 07/17] media: i2c: imx290: Factor out black level setting to a function
Date:   Sat, 14 Jan 2023 19:17:52 +0200
Message-Id: <20230114171802.13878-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com>
 <20230114171802.13878-1-laurent.pinchart@ideasonboard.com>
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

The black level programmed in the BLKLEVEL register depends on the
output format. The black level value computation is currently performed
in imx290_set_ctrl(), in addition to having different black level values
in the output-specific register value tables. Move it to a separate
function to simplify the imx290_set_ctrl() code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes since v1:

- Drop bpp variable in imx290_write_current_format()
---
 drivers/media/i2c/imx290.c | 50 ++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 66cb16f20852..0dc536893ebf 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -152,6 +152,9 @@
 #define IMX290_PIXEL_ARRAY_RECORDING_WIDTH		1920
 #define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT		1080
 
+/* Equivalent value for 16bpp */
+#define IMX290_BLACK_LEVEL_DEFAULT			3840
+
 #define IMX290_NUM_SUPPLIES				3
 
 struct imx290_regval {
@@ -315,7 +318,6 @@ static const struct imx290_regval imx290_10bit_settings[] = {
 	{ IMX290_ADBIT2, IMX290_ADBIT2_10BIT },
 	{ IMX290_ADBIT3, IMX290_ADBIT3_10BIT },
 	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW10 },
-	{ IMX290_BLKLEVEL, 60 },
 };
 
 static const struct imx290_regval imx290_12bit_settings[] = {
@@ -325,7 +327,6 @@ static const struct imx290_regval imx290_12bit_settings[] = {
 	{ IMX290_ADBIT2, IMX290_ADBIT2_12BIT },
 	{ IMX290_ADBIT3, IMX290_ADBIT3_12BIT },
 	{ IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
-	{ IMX290_BLKLEVEL, 240 },
 };
 
 /* supported link frequencies */
@@ -516,35 +517,40 @@ static int imx290_set_data_lanes(struct imx290 *imx290)
 	return ret;
 }
 
+static int imx290_set_black_level(struct imx290 *imx290,
+				  unsigned int black_level, int *err)
+{
+	return imx290_write(imx290, IMX290_BLKLEVEL,
+			    black_level >> (16 - imx290->bpp), err);
+}
+
 static int imx290_write_current_format(struct imx290 *imx290)
 {
+	const struct imx290_regval *regs;
+	unsigned int num_regs;
 	int ret;
 
 	switch (imx290->current_format.code) {
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
-		ret = imx290_set_register_array(imx290, imx290_10bit_settings,
-						ARRAY_SIZE(
-							imx290_10bit_settings));
-		if (ret < 0) {
-			dev_err(imx290->dev, "Could not set format registers\n");
-			return ret;
-		}
+		regs = imx290_10bit_settings;
+		num_regs = ARRAY_SIZE(imx290_10bit_settings);
 		break;
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
-		ret = imx290_set_register_array(imx290, imx290_12bit_settings,
-						ARRAY_SIZE(
-							imx290_12bit_settings));
-		if (ret < 0) {
-			dev_err(imx290->dev, "Could not set format registers\n");
-			return ret;
-		}
+		regs = imx290_12bit_settings;
+		num_regs = ARRAY_SIZE(imx290_12bit_settings);
 		break;
 	default:
 		dev_err(imx290->dev, "Unknown pixel format\n");
 		return -EINVAL;
 	}
 
-	return 0;
+	ret = imx290_set_register_array(imx290, regs, num_regs);
+	if (ret < 0) {
+		dev_err(imx290->dev, "Could not set format registers\n");
+		return ret;
+	}
+
+	return imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT, &ret);
 }
 
 /* ----------------------------------------------------------------------------
@@ -573,7 +579,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	case V4L2_CID_TEST_PATTERN:
 		if (ctrl->val) {
-			imx290_write(imx290, IMX290_BLKLEVEL, 0, &ret);
+			imx290_set_black_level(imx290, 0, &ret);
 			usleep_range(10000, 11000);
 			imx290_write(imx290, IMX290_PGCTRL,
 				     (u8)(IMX290_PGCTRL_REGEN |
@@ -582,12 +588,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		} else {
 			imx290_write(imx290, IMX290_PGCTRL, 0x00, &ret);
 			usleep_range(10000, 11000);
-			if (imx290->bpp == 10)
-				imx290_write(imx290, IMX290_BLKLEVEL, 0x3c,
-					     &ret);
-			else /* 12 bits per pixel */
-				imx290_write(imx290, IMX290_BLKLEVEL, 0xf0,
-					     &ret);
+			imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT,
+					       &ret);
 		}
 		break;
 	default:
-- 
Regards,

Laurent Pinchart

