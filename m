Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F23357C65C
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 10:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiGUIf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 04:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiGUIfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 04:35:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A3913D62
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 01:35:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A458B496;
        Thu, 21 Jul 2022 10:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658392553;
        bh=J930+6ig15RXxeSPhQtaOA2PY3fGWc4PIgdWmQ4ZDbA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o4SU7zqRmHDiKjpqOn/L4frkidUFQ8UxvihjUBoCsfOAJ8GWZtLBjNxbSsMn4Rc6o
         blco8ssYtdEj2CmDTNJ0x732mgFsXfUS+JJctRSZhA/YyqjRX29sDeVX2Fpi6hZLvN
         SEZnNoOW5wnX/QYYR7rdgUiWDmdmeRc+IwLchMjI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 08/19] media: i2c: imx290: Correct register sizes
Date:   Thu, 21 Jul 2022 11:35:29 +0300
Message-Id: <20220721083540.1525-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com>
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
index ac58bfe6db7f..3f67c4d2417f 100644
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

