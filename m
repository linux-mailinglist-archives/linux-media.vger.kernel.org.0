Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8347ACA91
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjIXPdg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjIXPdc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC5AC6
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:33:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5BBD3394;
        Sun, 24 Sep 2023 17:31:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569500;
        bh=avWzOpszzA92qoVwyz9dCUas3tZd7djkGdOeHV+si60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L2HTJjvHRnNH4xXuNNJiAgTvkMc8cSUy9eqHsLajh8+wK2I4YQKDHLVsuaab5d6HZ
         nSpMPRlifANfDtak16ampVWbkIhjwqi77Q33GylvlgjVXnUaa8yD9wjWHTWkifd9/p
         L6vX23V/KMbUOcX22kM5FKYGjPFU1hoGDLSOqkAo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 17/20] media: i2c: imx219: Separate horizontal and vertical binning
Date:   Sun, 24 Sep 2023 18:33:06 +0300
Message-ID: <20230924153309.12423-18-laurent.pinchart@ideasonboard.com>
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

The IMX219 has distinct binning registers for the horizontal and
vertical directions. Calculate their value and write them separately.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 39 ++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 6bfdceaf5044..bf1c2a1dad95 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -90,10 +90,11 @@
 #define IMX219_REG_ORIENTATION		CCI_REG8(0x0172)
 
 /* Binning  Mode */
-#define IMX219_REG_BINNING_MODE		CCI_REG16(0x0174)
-#define IMX219_BINNING_NONE		0x0000
-#define IMX219_BINNING_2X2		0x0101
-#define IMX219_BINNING_2X2_ANALOG	0x0303
+#define IMX219_REG_BINNING_MODE_H	CCI_REG8(0x0174)
+#define IMX219_REG_BINNING_MODE_V	CCI_REG8(0x0175)
+#define IMX219_BINNING_NONE		0x00
+#define IMX219_BINNING_X2		0x01
+#define IMX219_BINNING_X2_ANALOG	0x03
 
 #define IMX219_REG_CSI_DATA_FORMAT_A	CCI_REG16(0x018c)
 
@@ -615,7 +616,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	const struct v4l2_mbus_framefmt *format;
 	const struct v4l2_rect *crop;
 	unsigned int bpp;
-	u64 bin_mode;
+	u64 bin_h, bin_v;
 	int ret = 0;
 
 	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
@@ -647,14 +648,28 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
 
-	if (format->width == crop->width && format->height == crop->height)
-		bin_mode = IMX219_BINNING_NONE;
-	else if (bpp == 8)
-		bin_mode = IMX219_BINNING_2X2_ANALOG;
-	else
-		bin_mode = IMX219_BINNING_2X2;
+	switch (crop->width / format->width) {
+	case 1:
+	default:
+		bin_h = IMX219_BINNING_NONE;
+		break;
+	case 2:
+		bin_h = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
+		break;
+	}
 
-	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE, bin_mode, &ret);
+	switch (crop->height / format->height) {
+	case 1:
+	default:
+		bin_v = IMX219_BINNING_NONE;
+		break;
+	case 2:
+		bin_v = bpp == 8 ? IMX219_BINNING_X2_ANALOG : IMX219_BINNING_X2;
+		break;
+	}
+
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_H, bin_h, &ret);
+	cci_write(imx219->regmap, IMX219_REG_BINNING_MODE_V, bin_v, &ret);
 
 	cci_write(imx219->regmap, IMX219_REG_X_OUTPUT_SIZE,
 		  format->width, &ret);
-- 
Regards,

Laurent Pinchart

