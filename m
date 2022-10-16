Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E335FFD7C
	for <lists+linux-media@lfdr.de>; Sun, 16 Oct 2022 08:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiJPGQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Oct 2022 02:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbiJPGQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Oct 2022 02:16:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88EA936DF0
        for <linux-media@vger.kernel.org>; Sat, 15 Oct 2022 23:16:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 08C1615D2;
        Sun, 16 Oct 2022 08:16:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665900962;
        bh=GuzbWxLeyuyxp+Ys25YNBQoNoypiYkEleBQiq3gzGj4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sc+WL9EV8JvZHlG7twGnkjUMnyDUUIYlIIIxbAgu6ltd6dbAYikN0m2Cq/sRqyrYn
         C+0DKveqFbTmbKKJkOYHFvNADFQGauvwis7eOi33ZMJ/Bh5tttfteiOmMtvAlCN4gh
         lHi3PjBe0YEMOQefnClM/2lQRs8vhjV7sv++qKBo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 09/20] media: i2c: imx290: Correct register sizes
Date:   Sun, 16 Oct 2022 09:15:12 +0300
Message-Id: <20221016061523.30127-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
References: <20221016061523.30127-1-laurent.pinchart@ideasonboard.com>
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

Define registers with the appropriate size, using the variable-size
register access mechanism that has just been introduced. This simplifies
the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 39 +++++++++-----------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6e4662caec62..cfcfa04e83e1 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -32,12 +32,11 @@
 #define IMX290_REGHOLD					IMX290_REG_8BIT(0x3001)
 #define IMX290_XMSTA					IMX290_REG_8BIT(0x3002)
 #define IMX290_FR_FDG_SEL				IMX290_REG_8BIT(0x3009)
-#define IMX290_BLKLEVEL_LOW				IMX290_REG_8BIT(0x300a)
-#define IMX290_BLKLEVEL_HIGH				IMX290_REG_8BIT(0x300b)
+#define IMX290_BLKLEVEL					IMX290_REG_16BIT(0x300a)
 #define IMX290_GAIN					IMX290_REG_8BIT(0x3014)
-#define IMX290_HMAX_LOW					IMX290_REG_8BIT(0x301c)
-#define IMX290_HMAX_HIGH				IMX290_REG_8BIT(0x301d)
+#define IMX290_HMAX					IMX290_REG_16BIT(0x301c)
 #define IMX290_PGCTRL					IMX290_REG_8BIT(0x308c)
+#define IMX290_CHIP_ID					IMX290_REG_16BIT(0x319a)
 #define IMX290_PHY_LANE_NUM				IMX290_REG_8BIT(0x3407)
 #define IMX290_CSI_LANE_MODE				IMX290_REG_8BIT(0x3443)
 
@@ -461,8 +460,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		if (ctrl->val) {
-			imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW, 0x00);
-			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
+			imx290_write_reg(imx290, IMX290_BLKLEVEL, 0);
 			usleep_range(10000, 11000);
 			imx290_write_reg(imx290, IMX290_PGCTRL,
 					 (u8)(IMX290_PGCTRL_REGEN |
@@ -472,12 +470,11 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 			imx290_write_reg(imx290, IMX290_PGCTRL, 0x00);
 			usleep_range(10000, 11000);
 			if (imx290->bpp == 10)
-				imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
+				imx290_write_reg(imx290, IMX290_BLKLEVEL,
 						 0x3c);
 			else /* 12 bits per pixel */
-				imx290_write_reg(imx290, IMX290_BLKLEVEL_LOW,
+				imx290_write_reg(imx290, IMX290_BLKLEVEL,
 						 0xf0);
-			imx290_write_reg(imx290, IMX290_BLKLEVEL_HIGH, 0x00);
 		}
 		break;
 	default:
@@ -669,25 +666,6 @@ static int imx290_write_current_format(struct imx290 *imx290)
 	return 0;
 }
 
-static int imx290_set_hmax(struct imx290 *imx290, u32 val)
-{
-	int ret;
-
-	ret = imx290_write_reg(imx290, IMX290_HMAX_LOW, (val & 0xff));
-	if (ret) {
-		dev_err(imx290->dev, "Error setting HMAX register\n");
-		return ret;
-	}
-
-	ret = imx290_write_reg(imx290, IMX290_HMAX_HIGH, ((val >> 8) & 0xff));
-	if (ret) {
-		dev_err(imx290->dev, "Error setting HMAX register\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 /* Start streaming */
 static int imx290_start_streaming(struct imx290 *imx290)
 {
@@ -716,8 +694,9 @@ static int imx290_start_streaming(struct imx290 *imx290)
 		dev_err(imx290->dev, "Could not set current mode\n");
 		return ret;
 	}
-	ret = imx290_set_hmax(imx290, imx290->current_mode->hmax);
-	if (ret < 0)
+
+	ret = imx290_write_reg(imx290, IMX290_HMAX, imx290->current_mode->hmax);
+	if (ret)
 		return ret;
 
 	/* Apply customized values from user */
-- 
Regards,

Laurent Pinchart

