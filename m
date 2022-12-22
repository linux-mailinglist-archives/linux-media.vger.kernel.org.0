Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0495654535
	for <lists+linux-media@lfdr.de>; Thu, 22 Dec 2022 17:35:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbiLVQfc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Dec 2022 11:35:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbiLVQfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Dec 2022 11:35:30 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC5C27CF8
        for <linux-media@vger.kernel.org>; Thu, 22 Dec 2022 08:35:29 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BMGZJaE114192;
        Thu, 22 Dec 2022 10:35:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1671726919;
        bh=lTeA8L7388JXOcyVlZaXw3Mxyq5LrsaQjwugmZXtleI=;
        h=From:To:CC:Subject:Date;
        b=EuNQX0cAeVwVCKtvKA4GGRPun1xul7D/QLslUXZidcKSla5um5vWZihCajX5yTXNv
         /Lm+TSVaBdCRwmyMBaCAGxxCSulW4WEyqYMiU3JXP+7Dd2tYjjZGHqdvlnSMTX0PRB
         /+ITtvo8IbOuiClSMQjhf7ePBo8ZWkmHQWqvCtOo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BMGZJKj107000
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 22 Dec 2022 10:35:19 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 22
 Dec 2022 10:35:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 22 Dec 2022 10:35:19 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BMGZIwG076715;
        Thu, 22 Dec 2022 10:35:19 -0600
From:   Jai Luthra <j-luthra@ti.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, Jai Luthra <j-luthra@ti.com>
Subject: [PATCH] media: i2c: imx219: Fix binning for RAW8 capture
Date:   Thu, 22 Dec 2022 22:05:16 +0530
Message-ID: <20221222163516.20076-1-j-luthra@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2x2 binning worked fine for RAW10 capture, but for RAW8 capture it would
lead to corrupted frames [1][2] when using 1232p for capture.

Using the special 2x2 analog binning mode fixes RAW8 1232p capture, but
breaks RAW10 1232p capture. So now we choose the binning mode depending
upon the frame format selected.

As 480p RAW8/RAW10 capture works fine with both binning modes, it can
share the same code path as 1232p for selecting binning mode.

[1] https://forums.raspberrypi.com/viewtopic.php?t=332103
[2] https://github.com/raspberrypi/libcamera-apps/issues/281

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/i2c/imx219.c | 58 ++++++++++++++++++++++++++++++++------
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 77bd79a5954e..a7afd914214e 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -89,6 +89,12 @@
 
 #define IMX219_REG_ORIENTATION		0x0172
 
+/* Binning  Mode */
+#define IMX219_REG_BINNING_MODE		0x0174
+#define IMX219_BINNING_NONE		0x0000
+#define IMX219_BINNING_2X2		0x0101
+#define IMX219_BINNING_2X2_ANALOG	0x0303
+
 /* Test Pattern Control */
 #define IMX219_REG_TEST_PATTERN		0x0600
 #define IMX219_TEST_PATTERN_DISABLE	0
@@ -143,6 +149,9 @@ struct imx219_mode {
 
 	/* Default register values */
 	struct imx219_reg_list reg_list;
+
+	/* 2x2 binning is used */
+	bool binning;
 };
 
 /*
@@ -176,8 +185,6 @@ static const struct imx219_reg mode_3280x2464_regs[] = {
 	{0x016f, 0xa0},
 	{0x0170, 0x01},
 	{0x0171, 0x01},
-	{0x0174, 0x00},
-	{0x0175, 0x00},
 	{0x0301, 0x05},
 	{0x0303, 0x01},
 	{0x0304, 0x03},
@@ -235,8 +242,6 @@ static const struct imx219_reg mode_1920_1080_regs[] = {
 	{0x016f, 0x38},
 	{0x0170, 0x01},
 	{0x0171, 0x01},
-	{0x0174, 0x00},
-	{0x0175, 0x00},
 	{0x0301, 0x05},
 	{0x0303, 0x01},
 	{0x0304, 0x03},
@@ -290,8 +295,6 @@ static const struct imx219_reg mode_1640_1232_regs[] = {
 	{0x016f, 0xd0},
 	{0x0170, 0x01},
 	{0x0171, 0x01},
-	{0x0174, 0x01},
-	{0x0175, 0x01},
 	{0x0301, 0x05},
 	{0x0303, 0x01},
 	{0x0304, 0x03},
@@ -349,8 +352,6 @@ static const struct imx219_reg mode_640_480_regs[] = {
 	{0x016f, 0xe0},
 	{0x0170, 0x01},
 	{0x0171, 0x01},
-	{0x0174, 0x03},
-	{0x0175, 0x03},
 	{0x0301, 0x05},
 	{0x0303, 0x01},
 	{0x0304, 0x03},
@@ -485,6 +486,7 @@ static const struct imx219_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
 			.regs = mode_3280x2464_regs,
 		},
+		.binning = false,
 	},
 	{
 		/* 1080P 30fps cropped */
@@ -501,6 +503,7 @@ static const struct imx219_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1920_1080_regs),
 			.regs = mode_1920_1080_regs,
 		},
+		.binning = false,
 	},
 	{
 		/* 2x2 binned 30fps mode */
@@ -517,6 +520,7 @@ static const struct imx219_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_1640_1232_regs),
 			.regs = mode_1640_1232_regs,
 		},
+		.binning = true,
 	},
 	{
 		/* 640x480 30fps mode */
@@ -533,6 +537,7 @@ static const struct imx219_mode supported_modes[] = {
 			.num_of_regs = ARRAY_SIZE(mode_640_480_regs),
 			.regs = mode_640_480_regs,
 		},
+		.binning = true,
 	},
 };
 
@@ -979,6 +984,35 @@ static int imx219_set_framefmt(struct imx219 *imx219)
 	return -EINVAL;
 }
 
+static int imx219_set_binning(struct imx219 *imx219)
+{
+	if (!imx219->mode->binning) {
+		return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
+					IMX219_REG_VALUE_16BIT,
+					IMX219_BINNING_NONE);
+	}
+
+	switch (imx219->fmt.code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+		return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
+					IMX219_REG_VALUE_16BIT,
+					IMX219_BINNING_2X2_ANALOG);
+
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+		return imx219_write_reg(imx219, IMX219_REG_BINNING_MODE,
+					IMX219_REG_VALUE_16BIT,
+					IMX219_BINNING_2X2);
+	}
+
+	return -EINVAL;
+}
+
 static const struct v4l2_rect *
 __imx219_get_pad_crop(struct imx219 *imx219,
 		      struct v4l2_subdev_state *sd_state,
@@ -1056,6 +1090,14 @@ static int imx219_start_streaming(struct imx219 *imx219)
 		goto err_rpm_put;
 	}
 
+	ret = imx219_set_binning(imx219);
+	if (ret) {
+		dev_err(&client->dev, "%s failed to set binning: %d\n",
+			__func__, ret);
+		goto err_rpm_put;
+	}
+
+
 	/* Apply customized values from user */
 	ret =  __v4l2_ctrl_handler_setup(imx219->sd.ctrl_handler);
 	if (ret)
-- 
2.17.1

