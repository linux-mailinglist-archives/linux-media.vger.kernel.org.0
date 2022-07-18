Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C951577957
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 03:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbiGRBma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jul 2022 21:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbiGRBm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jul 2022 21:42:29 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A08913F21
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 18:42:26 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id c18so1368571wmh.1
        for <linux-media@vger.kernel.org>; Sun, 17 Jul 2022 18:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K6T0w5YvhU331+i5XaLLyPcpmrU4kLoa2C2KYCxe5p8=;
        b=FwMUFt3oBcT6AdPb5sHrMuozBQloddHEXWdKnCNpR3qYNk3haiaF9eNqXRF40KEfNo
         HnJ9muy+1lryVP4Om6p0u47qeKQOmKSWZP8HdINRTO+EOT2MdDN7YJBVedJX0F1cuwGQ
         8whwvMMbIqNFRf4pcp5uizypknScbUktf6/YsV4m3Kt0FaGjGAsGLvG6HbIv+4RZWk1U
         L9XZCoXDUYPI81ymfkxQC7B2QQk/p6ADbjL52JgIWHsgoZF1lGuLFjX80GgV/LNieIuq
         VSr1JNPdC3QCwc/MkRDPMG6EG7Dvhw1YB8iHh95e5UvFNIp0B/q3/6STDmlQI7dKrHot
         1AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K6T0w5YvhU331+i5XaLLyPcpmrU4kLoa2C2KYCxe5p8=;
        b=jllPRg4UgDcROrYxPaTNuAoGyQKc1Zm5dWS8r2fTyBJW1oiiMmoftjOInRtMiyvEaM
         Aiz7+5h9R7ARZuuwfyekWtsg6mKc78SZXUkw0Kip2FAhKDU1Yh622sUfywkUsom5ghwU
         3kJTUWd+JrDaMb7P6H3NEIiJm36W7tvv95S/9dEXuXDtCZtVfNS3g2/ct8Jkg30ucoJH
         3QlXjSV+KvcvskAIp9OpMY3FaNCMj2Jf6y62IqO7sFpZQPiRZdoqi/DfIkKIImlu4vh0
         uP5LcFhDL3z78Zufk6NM6toSnN7gpJuShNr3Ruu9M45/yUqhCDfxxuwDHKl8J0n4LL5G
         5t2Q==
X-Gm-Message-State: AJIora+J6PcJlhau0uIY1fn3Cyx7lImtCOmyRajdy6Z6mRtn0J1PSsWv
        MSFzG606Dw1g7FVP77IgriqaIw==
X-Google-Smtp-Source: AGRyM1uVydFNFzUjp2y8fVaZP1NKzyk9L7lMulHOLQCEMyZJ8Es1Vj8/wSHKagLnbT97EJbpcJdtsQ==
X-Received: by 2002:a05:600c:4f52:b0:3a3:1673:51f1 with SMTP id m18-20020a05600c4f5200b003a3167351f1mr6457365wmq.116.1658108544724;
        Sun, 17 Jul 2022 18:42:24 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v10-20020adfebca000000b0021d76a1b0e3sm1685139wrn.6.2022.07.17.18.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 18:42:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/3] media: i2c: imx577: Rename imx412.c to imx577.c
Date:   Mon, 18 Jul 2022 02:42:14 +0100
Message-Id: <20220718014215.1240114-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
References: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now we have an inconsistency in that the following drivers
interrogate i2c address 0x0016 to validate the chip id but only imx412.c
names itself something different to the contents of that register.

drivers/media/i2c/imx258.c:#define IMX258_REG_CHIP_ID    0x0016
drivers/media/i2c/imx258.c:#define IMX258_CHIP_ID        0x0258

drivers/media/i2c/imx319.c:#define IMX319_REG_CHIP_ID    0x0016
drivers/media/i2c/imx319.c:#define IMX319_CHIP_ID        0x0319

drivers/media/i2c/imx355.c:#define IMX355_REG_CHIP_ID    0x0016
drivers/media/i2c/imx355.c:#define IMX355_CHIP_ID        0x0355

Right now imx412.c does:

drivers/media/i2c/imx412.c:#define IMX412_REG_ID         0x0016
drivers/media/i2c/imx412.c:#define IMX412_ID             0x577

This gets even more perplexing for me as the Qualcomm CAMX stack has a
imx577.cpp which interrogates and validates register 0x0016 as 0x577.

The schematic for my board also declares chip as an imx577 not an imx412.
The init sequence in the Qualcomm reference code is nearly the same as here
in imx412.c and the upstream Linux 412.c driver works perfectly with the
imx577 chip as-is.

Even if imx412 works with imx577 init code the driver we have here is
looking for chip id 0x577 @ offset 0x0016 which implies this driver is
more appropriately named imx577.c not imx412.c.

Fixes: 9214e86c0cc1 ("media: i2c: Add imx412 camera sensor driver")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/Kconfig                |   8 +-
 drivers/media/i2c/Makefile               |   2 +-
 drivers/media/i2c/{imx412.c => imx577.c} | 622 +++++++++++------------
 3 files changed, 316 insertions(+), 316 deletions(-)
 rename drivers/media/i2c/{imx412.c => imx577.c} (55%)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 2b20aa6c37b1..6c62f3ba314d 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -199,8 +199,8 @@ config VIDEO_IMX355
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx355.
 
-config VIDEO_IMX412
-	tristate "Sony IMX412 sensor support"
+config VIDEO_IMX577
+	tristate "Sony IMX577 sensor support"
 	depends on OF_GPIO
 	depends on I2C && VIDEO_DEV
 	select VIDEO_V4L2_SUBDEV_API
@@ -208,10 +208,10 @@ config VIDEO_IMX412
 	select V4L2_FWNODE
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
-	  IMX412 camera.
+	  IMX577 camera.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called imx412.
+	  module will be called imx577.
 
 config VIDEO_MAX9271_LIB
 	tristate
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 3e1696963e7f..41dc159cdad0 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -46,7 +46,7 @@ obj-$(CONFIG_VIDEO_IMX319) += imx319.o
 obj-$(CONFIG_VIDEO_IMX334) += imx334.o
 obj-$(CONFIG_VIDEO_IMX335) += imx335.o
 obj-$(CONFIG_VIDEO_IMX355) += imx355.o
-obj-$(CONFIG_VIDEO_IMX412) += imx412.o
+obj-$(CONFIG_VIDEO_IMX577) += imx577.o
 obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
 obj-$(CONFIG_VIDEO_KS0127) += ks0127.o
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx577.c
similarity index 55%
rename from drivers/media/i2c/imx412.c
rename to drivers/media/i2c/imx577.c
index a1394d6c1432..519b523c4091 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx577.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Sony imx412 Camera Sensor Driver
+ * Sony imx577 Camera Sensor Driver
  *
  * Copyright (C) 2021 Intel Corporation
  */
@@ -18,66 +18,66 @@
 #include <media/v4l2-subdev.h>
 
 /* Streaming Mode */
-#define IMX412_REG_MODE_SELECT	0x0100
-#define IMX412_MODE_STANDBY	0x00
-#define IMX412_MODE_STREAMING	0x01
+#define IMX577_REG_MODE_SELECT	0x0100
+#define IMX577_MODE_STANDBY	0x00
+#define IMX577_MODE_STREAMING	0x01
 
 /* Lines per frame */
-#define IMX412_REG_LPFR		0x0340
+#define IMX577_REG_LPFR		0x0340
 
 /* Chip ID */
-#define IMX412_REG_ID		0x0016
-#define IMX412_ID		0x577
+#define IMX577_REG_ID		0x0016
+#define IMX577_ID		0x577
 
 /* Exposure control */
-#define IMX412_REG_EXPOSURE_CIT	0x0202
-#define IMX412_EXPOSURE_MIN	8
-#define IMX412_EXPOSURE_OFFSET	22
-#define IMX412_EXPOSURE_STEP	1
-#define IMX412_EXPOSURE_DEFAULT	0x0648
+#define IMX577_REG_EXPOSURE_CIT	0x0202
+#define IMX577_EXPOSURE_MIN	8
+#define IMX577_EXPOSURE_OFFSET	22
+#define IMX577_EXPOSURE_STEP	1
+#define IMX577_EXPOSURE_DEFAULT	0x0648
 
 /* Analog gain control */
-#define IMX412_REG_AGAIN	0x0204
-#define IMX412_AGAIN_MIN	0
-#define IMX412_AGAIN_MAX	978
-#define IMX412_AGAIN_STEP	1
-#define IMX412_AGAIN_DEFAULT	0
+#define IMX577_REG_AGAIN	0x0204
+#define IMX577_AGAIN_MIN	0
+#define IMX577_AGAIN_MAX	978
+#define IMX577_AGAIN_STEP	1
+#define IMX577_AGAIN_DEFAULT	0
 
 /* Group hold register */
-#define IMX412_REG_HOLD		0x0104
+#define IMX577_REG_HOLD		0x0104
 
 /* Input clock rate */
-#define IMX412_INCLK_RATE	24000000
+#define IMX577_INCLK_RATE	24000000
 
 /* CSI2 HW configuration */
-#define IMX412_LINK_FREQ	600000000
-#define IMX412_NUM_DATA_LANES	4
+#define IMX577_LINK_FREQ	600000000
+#define IMX577_NUM_DATA_LANES	4
 
-#define IMX412_REG_MIN		0x00
-#define IMX412_REG_MAX		0xffff
+#define IMX577_REG_MIN		0x00
+#define IMX577_REG_MAX		0xffff
 
 /**
- * struct imx412_reg - imx412 sensor register
+ * struct imx577_reg - imx577 sensor register
  * @address: Register address
  * @val: Register value
  */
-struct imx412_reg {
+struct imx577_reg {
 	u16 address;
 	u8 val;
 };
 
 /**
- * struct imx412_reg_list - imx412 sensor register list
+ * struct imx577_reg_list - imx577 sensor register list
  * @num_of_regs: Number of registers in the list
  * @regs: Pointer to register list
  */
-struct imx412_reg_list {
+struct imx577_reg_list {
 	u32 num_of_regs;
-	const struct imx412_reg *regs;
+	const struct imx577_reg *regs;
 };
 
 /**
- * struct imx412_mode - imx412 sensor mode structure
+ * struct imx577_mode - imx577 sensor mode structure
  * @width: Frame width
  * @height: Frame height
  * @code: Format code
@@ -89,7 +89,7 @@ struct imx412_reg_list {
  * @link_freq_idx: Link frequency index
  * @reg_list: Register list for sensor mode
  */
-struct imx412_mode {
+struct imx577_mode {
 	u32 width;
 	u32 height;
 	u32 code;
@@ -99,17 +99,17 @@ struct imx412_mode {
 	u32 vblank_max;
 	u64 pclk;
 	u32 link_freq_idx;
-	struct imx412_reg_list reg_list;
+	struct imx577_reg_list reg_list;
 };
 
-static const char * const imx412_supply_names[] = {
+static const char * const imx577_supply_names[] = {
 	"dovdd",	/* Digital I/O power */
 	"avdd",		/* Analog power */
 	"dvdd",		/* Digital core power */
 };
 
 /**
- * struct imx412 - imx412 sensor device structure
+ * struct imx577 - imx577 sensor device structure
  * @dev: Pointer to generic device
  * @client: Pointer to i2c client
  * @sd: V4L2 sub-device
@@ -129,14 +129,14 @@ static const char * const imx412_supply_names[] = {
  * @mutex: Mutex for serializing sensor controls
  * @streaming: Flag indicating streaming state
  */
-struct imx412 {
+struct imx577 {
 	struct device *dev;
 	struct i2c_client *client;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
 	struct clk *inclk;
-	struct regulator_bulk_data supplies[ARRAY_SIZE(imx412_supply_names)];
+	struct regulator_bulk_data supplies[ARRAY_SIZE(imx577_supply_names)];
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *link_freq_ctrl;
 	struct v4l2_ctrl *pclk_ctrl;
@@ -147,17 +147,17 @@ struct imx412 {
 		struct v4l2_ctrl *again_ctrl;
 	};
 	u32 vblank;
-	const struct imx412_mode *cur_mode;
+	const struct imx577_mode *cur_mode;
 	struct mutex mutex;
 	bool streaming;
 };
 
 static const s64 link_freq[] = {
-	IMX412_LINK_FREQ,
+	IMX577_LINK_FREQ,
 };
 
 /* Sensor mode registers */
-static const struct imx412_reg mode_4056x3040_regs[] = {
+static const struct imx577_reg mode_4056x3040_regs[] = {
 	{0x0136, 0x18},
 	{0x0137, 0x00},
 	{0x3c7e, 0x08},
@@ -392,7 +392,7 @@ static const struct imx412_reg mode_4056x3040_regs[] = {
 };
 
 /* Supported sensor mode configurations */
-static const struct imx412_mode supported_mode = {
+static const struct imx577_mode supported_mode = {
 	.width = 4056,
 	.height = 3040,
 	.hblank = 456,
@@ -409,28 +409,28 @@ static const struct imx412_mode supported_mode = {
 };
 
 /**
- * to_imx412() - imx412 V4L2 sub-device to imx412 device.
- * @subdev: pointer to imx412 V4L2 sub-device
+ * to_imx577() - imx577 V4L2 sub-device to imx577 device.
+ * @subdev: pointer to imx577 V4L2 sub-device
  *
- * Return: pointer to imx412 device
+ * Return: pointer to imx577 device
  */
-static inline struct imx412 *to_imx412(struct v4l2_subdev *subdev)
+static inline struct imx577 *to_imx577(struct v4l2_subdev *subdev)
 {
-	return container_of(subdev, struct imx412, sd);
+	return container_of(subdev, struct imx577, sd);
 }
 
 /**
- * imx412_read_reg() - Read registers.
- * @imx412: pointer to imx412 device
+ * imx577_read_reg() - Read registers.
+ * @imx577: pointer to imx577 device
  * @reg: register address
  * @len: length of bytes to read. Max supported bytes is 4
  * @val: pointer to register value to be filled.
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_read_reg(struct imx412 *imx412, u16 reg, u32 len, u32 *val)
+static int imx577_read_reg(struct imx577 *imx577, u16 reg, u32 len, u32 *val)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx412->sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&imx577->sd);
 	struct i2c_msg msgs[2] = {0};
 	u8 addr_buf[2] = {0};
 	u8 data_buf[4] = {0};
@@ -463,17 +463,17 @@ static int imx412_read_reg(struct imx412 *imx412, u16 reg, u32 len, u32 *val)
 }
 
 /**
- * imx412_write_reg() - Write register
- * @imx412: pointer to imx412 device
+ * imx577_write_reg() - Write register
+ * @imx577: pointer to imx577 device
  * @reg: register address
  * @len: length of bytes. Max supported bytes is 4
  * @val: register value
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_write_reg(struct imx412 *imx412, u16 reg, u32 len, u32 val)
+static int imx577_write_reg(struct imx577 *imx577, u16 reg, u32 len, u32 val)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx412->sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&imx577->sd);
 	u8 buf[6] = {0};
 
 	if (WARN_ON(len > 4))
@@ -488,21 +488,21 @@ static int imx412_write_reg(struct imx412 *imx412, u16 reg, u32 len, u32 val)
 }
 
 /**
- * imx412_write_regs() - Write a list of registers
- * @imx412: pointer to imx412 device
+ * imx577_write_regs() - Write a list of registers
+ * @imx577: pointer to imx577 device
  * @regs: list of registers to be written
  * @len: length of registers array
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_write_regs(struct imx412 *imx412,
-			     const struct imx412_reg *regs, u32 len)
+static int imx577_write_regs(struct imx577 *imx577,
+			     const struct imx577_reg *regs, u32 len)
 {
 	unsigned int i;
 	int ret;
 
 	for (i = 0; i < len; i++) {
-		ret = imx412_write_reg(imx412, regs[i].address, 1, regs[i].val);
+		ret = imx577_write_reg(imx577, regs[i].address, 1, regs[i].val);
 		if (ret)
 			return ret;
 	}
@@ -511,70 +511,70 @@ static int imx412_write_regs(struct imx412 *imx412,
 }
 
 /**
- * imx412_update_controls() - Update control ranges based on streaming mode
- * @imx412: pointer to imx412 device
- * @mode: pointer to imx412_mode sensor mode
+ * imx577_update_controls() - Update control ranges based on streaming mode
+ * @imx577: pointer to imx577 device
+ * @mode: pointer to imx577_mode sensor mode
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_update_controls(struct imx412 *imx412,
-				  const struct imx412_mode *mode)
+static int imx577_update_controls(struct imx577 *imx577,
+				  const struct imx577_mode *mode)
 {
 	int ret;
 
-	ret = __v4l2_ctrl_s_ctrl(imx412->link_freq_ctrl, mode->link_freq_idx);
+	ret = __v4l2_ctrl_s_ctrl(imx577->link_freq_ctrl, mode->link_freq_idx);
 	if (ret)
 		return ret;
 
-	ret = __v4l2_ctrl_s_ctrl(imx412->hblank_ctrl, mode->hblank);
+	ret = __v4l2_ctrl_s_ctrl(imx577->hblank_ctrl, mode->hblank);
 	if (ret)
 		return ret;
 
-	return __v4l2_ctrl_modify_range(imx412->vblank_ctrl, mode->vblank_min,
+	return __v4l2_ctrl_modify_range(imx577->vblank_ctrl, mode->vblank_min,
 					mode->vblank_max, 1, mode->vblank);
 }
 
 /**
- * imx412_update_exp_gain() - Set updated exposure and gain
- * @imx412: pointer to imx412 device
+ * imx577_update_exp_gain() - Set updated exposure and gain
+ * @imx577: pointer to imx577 device
  * @exposure: updated exposure value
  * @gain: updated analog gain value
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
+static int imx577_update_exp_gain(struct imx577 *imx577, u32 exposure, u32 gain)
 {
 	u32 lpfr, shutter;
 	int ret;
 
-	lpfr = imx412->vblank + imx412->cur_mode->height;
+	lpfr = imx577->vblank + imx577->cur_mode->height;
 	shutter = lpfr - exposure;
 
-	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, shutter %u, lpfr %u",
+	dev_dbg(imx577->dev, "Set exp %u, analog gain %u, shutter %u, lpfr %u",
 		exposure, gain, shutter, lpfr);
 
-	ret = imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);
+	ret = imx577_write_reg(imx577, IMX577_REG_HOLD, 1, 1);
 	if (ret)
 		return ret;
 
-	ret = imx412_write_reg(imx412, IMX412_REG_LPFR, 2, lpfr);
+	ret = imx577_write_reg(imx577, IMX577_REG_LPFR, 2, lpfr);
 	if (ret)
 		goto error_release_group_hold;
 
-	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, shutter);
+	ret = imx577_write_reg(imx577, IMX577_REG_EXPOSURE_CIT, 2, shutter);
 	if (ret)
 		goto error_release_group_hold;
 
-	ret = imx412_write_reg(imx412, IMX412_REG_AGAIN, 2, gain);
+	ret = imx577_write_reg(imx577, IMX577_REG_AGAIN, 2, gain);
 
 error_release_group_hold:
-	imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 0);
+	imx577_write_reg(imx577, IMX577_REG_HOLD, 1, 0);
 
 	return ret;
 }
 
 /**
- * imx412_set_ctrl() - Set subdevice control
+ * imx577_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
  *
  * Supported controls:
@@ -585,47 +585,47 @@ static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
+static int imx577_set_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct imx412 *imx412 =
-		container_of(ctrl->handler, struct imx412, ctrl_handler);
+	struct imx577 *imx577 =
+		container_of(ctrl->handler, struct imx577, ctrl_handler);
 	u32 analog_gain;
 	u32 exposure;
 	int ret;
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		imx412->vblank = imx412->vblank_ctrl->val;
-
-		dev_dbg(imx412->dev, "Received vblank %u, new lpfr %u",
-			imx412->vblank,
-			imx412->vblank + imx412->cur_mode->height);
-
-		ret = __v4l2_ctrl_modify_range(imx412->exp_ctrl,
-					       IMX412_EXPOSURE_MIN,
-					       imx412->vblank +
-					       imx412->cur_mode->height -
-					       IMX412_EXPOSURE_OFFSET,
-					       1, IMX412_EXPOSURE_DEFAULT);
+		imx577->vblank = imx577->vblank_ctrl->val;
+
+		dev_dbg(imx577->dev, "Received vblank %u, new lpfr %u",
+			imx577->vblank,
+			imx577->vblank + imx577->cur_mode->height);
+
+		ret = __v4l2_ctrl_modify_range(imx577->exp_ctrl,
+					       IMX577_EXPOSURE_MIN,
+					       imx577->vblank +
+					       imx577->cur_mode->height -
+					       IMX577_EXPOSURE_OFFSET,
+					       1, IMX577_EXPOSURE_DEFAULT);
 		break;
 	case V4L2_CID_EXPOSURE:
 		/* Set controls only if sensor is in power on state */
-		if (!pm_runtime_get_if_in_use(imx412->dev))
+		if (!pm_runtime_get_if_in_use(imx577->dev))
 			return 0;
 
 		exposure = ctrl->val;
-		analog_gain = imx412->again_ctrl->val;
+		analog_gain = imx577->again_ctrl->val;
 
-		dev_dbg(imx412->dev, "Received exp %u, analog gain %u",
+		dev_dbg(imx577->dev, "Received exp %u, analog gain %u",
 			exposure, analog_gain);
 
-		ret = imx412_update_exp_gain(imx412, exposure, analog_gain);
+		ret = imx577_update_exp_gain(imx577, exposure, analog_gain);
 
-		pm_runtime_put(imx412->dev);
+		pm_runtime_put(imx577->dev);
 
 		break;
 	default:
-		dev_err(imx412->dev, "Invalid control %d", ctrl->id);
+		dev_err(imx577->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
 	}
 
@@ -633,19 +633,19 @@ static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
 }
 
 /* V4l2 subdevice control ops*/
-static const struct v4l2_ctrl_ops imx412_ctrl_ops = {
-	.s_ctrl = imx412_set_ctrl,
+static const struct v4l2_ctrl_ops imx577_ctrl_ops = {
+	.s_ctrl = imx577_set_ctrl,
 };
 
 /**
- * imx412_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
- * @sd: pointer to imx412 V4L2 sub-device structure
+ * imx577_enum_mbus_code() - Enumerate V4L2 sub-device mbus codes
+ * @sd: pointer to imx577 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  * @code: V4L2 sub-device code enumeration need to be filled
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_enum_mbus_code(struct v4l2_subdev *sd,
+static int imx577_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
@@ -658,14 +658,14 @@ static int imx412_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 /**
- * imx412_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
- * @sd: pointer to imx412 V4L2 sub-device structure
+ * imx577_enum_frame_size() - Enumerate V4L2 sub-device frame sizes
+ * @sd: pointer to imx577 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  * @fsize: V4L2 sub-device size enumeration need to be filled
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_enum_frame_size(struct v4l2_subdev *sd,
+static int imx577_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fsize)
 {
@@ -684,14 +684,14 @@ static int imx412_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 /**
- * imx412_fill_pad_format() - Fill subdevice pad format
+ * imx577_fill_pad_format() - Fill subdevice pad format
  *                            from selected sensor mode
- * @imx412: pointer to imx412 device
- * @mode: pointer to imx412_mode sensor mode
+ * @imx577: pointer to imx577 device
+ * @mode: pointer to imx577_mode sensor mode
  * @fmt: V4L2 sub-device format need to be filled
  */
-static void imx412_fill_pad_format(struct imx412 *imx412,
-				   const struct imx412_mode *mode,
+static void imx577_fill_pad_format(struct imx577 *imx577,
+				   const struct imx577_mode *mode,
 				   struct v4l2_subdev_format *fmt)
 {
 	fmt->format.width = mode->width;
@@ -705,20 +705,20 @@ static void imx412_fill_pad_format(struct imx412 *imx412,
 }
 
 /**
- * imx412_get_pad_format() - Get subdevice pad format
- * @sd: pointer to imx412 V4L2 sub-device structure
+ * imx577_get_pad_format() - Get subdevice pad format
+ * @sd: pointer to imx577 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  * @fmt: V4L2 sub-device format need to be set
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_get_pad_format(struct v4l2_subdev *sd,
+static int imx577_get_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
-	struct imx412 *imx412 = to_imx412(sd);
+	struct imx577 *imx577 = to_imx577(sd);
 
-	mutex_lock(&imx412->mutex);
+	mutex_lock(&imx577->mutex);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
@@ -726,34 +726,34 @@ static int imx412_get_pad_format(struct v4l2_subdev *sd,
 		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
-		imx412_fill_pad_format(imx412, imx412->cur_mode, fmt);
+		imx577_fill_pad_format(imx577, imx577->cur_mode, fmt);
 	}
 
-	mutex_unlock(&imx412->mutex);
+	mutex_unlock(&imx577->mutex);
 
 	return 0;
 }
 
 /**
- * imx412_set_pad_format() - Set subdevice pad format
- * @sd: pointer to imx412 V4L2 sub-device structure
+ * imx577_set_pad_format() - Set subdevice pad format
+ * @sd: pointer to imx577 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  * @fmt: V4L2 sub-device format need to be set
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_set_pad_format(struct v4l2_subdev *sd,
+static int imx577_set_pad_format(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_format *fmt)
 {
-	struct imx412 *imx412 = to_imx412(sd);
-	const struct imx412_mode *mode;
+	struct imx577 *imx577 = to_imx577(sd);
+	const struct imx577_mode *mode;
 	int ret = 0;
 
-	mutex_lock(&imx412->mutex);
+	mutex_lock(&imx577->mutex);
 
 	mode = &supported_mode;
-	imx412_fill_pad_format(imx412, mode, fmt);
+	imx577_fill_pad_format(imx577, mode, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
@@ -761,59 +761,59 @@ static int imx412_set_pad_format(struct v4l2_subdev *sd,
 		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
-		ret = imx412_update_controls(imx412, mode);
+		ret = imx577_update_controls(imx577, mode);
 		if (!ret)
-			imx412->cur_mode = mode;
+			imx577->cur_mode = mode;
 	}
 
-	mutex_unlock(&imx412->mutex);
+	mutex_unlock(&imx577->mutex);
 
 	return ret;
 }
 
 /**
- * imx412_init_pad_cfg() - Initialize sub-device pad configuration
- * @sd: pointer to imx412 V4L2 sub-device structure
+ * imx577_init_pad_cfg() - Initialize sub-device pad configuration
+ * @sd: pointer to imx577 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_init_pad_cfg(struct v4l2_subdev *sd,
+static int imx577_init_pad_cfg(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *sd_state)
 {
-	struct imx412 *imx412 = to_imx412(sd);
+	struct imx577 *imx577 = to_imx577(sd);
 	struct v4l2_subdev_format fmt = { 0 };
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	imx412_fill_pad_format(imx412, &supported_mode, &fmt);
+	imx577_fill_pad_format(imx577, &supported_mode, &fmt);
 
-	return imx412_set_pad_format(sd, sd_state, &fmt);
+	return imx577_set_pad_format(sd, sd_state, &fmt);
 }
 
 /**
- * imx412_start_streaming() - Start sensor stream
- * @imx412: pointer to imx412 device
+ * imx577_start_streaming() - Start sensor stream
+ * @imx577: pointer to imx577 device
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_start_streaming(struct imx412 *imx412)
+static int imx577_start_streaming(struct imx577 *imx577)
 {
-	const struct imx412_reg_list *reg_list;
+	const struct imx577_reg_list *reg_list;
 	int ret;
 
 	/* Write sensor mode registers */
-	reg_list = &imx412->cur_mode->reg_list;
-	ret = imx412_write_regs(imx412, reg_list->regs,
+	reg_list = &imx577->cur_mode->reg_list;
+	ret = imx577_write_regs(imx577, reg_list->regs,
 				reg_list->num_of_regs);
 	if (ret) {
-		dev_err(imx412->dev, "fail to write initial registers");
+		dev_err(imx577->dev, "fail to write initial registers");
 		return ret;
 	}
 
 	/* Setup handler will write actual exposure and gain */
-	ret =  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
+	ret =  __v4l2_ctrl_handler_setup(imx577->sd.ctrl_handler);
 	if (ret) {
-		dev_err(imx412->dev, "fail to setup handler");
+		dev_err(imx577->dev, "fail to setup handler");
 		return ret;
 	}
 
@@ -821,10 +821,10 @@ static int imx412_start_streaming(struct imx412 *imx412)
 	usleep_range(7400, 8000);
 
 	/* Start streaming */
-	ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
-			       1, IMX412_MODE_STREAMING);
+	ret = imx577_write_reg(imx577, IMX577_REG_MODE_SELECT,
+			       1, IMX577_MODE_STREAMING);
 	if (ret) {
-		dev_err(imx412->dev, "fail to start streaming");
+		dev_err(imx577->dev, "fail to start streaming");
 		return ret;
 	}
 
@@ -832,81 +832,81 @@ static int imx412_start_streaming(struct imx412 *imx412)
 }
 
 /**
- * imx412_stop_streaming() - Stop sensor stream
- * @imx412: pointer to imx412 device
+ * imx577_stop_streaming() - Stop sensor stream
+ * @imx577: pointer to imx577 device
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_stop_streaming(struct imx412 *imx412)
+static int imx577_stop_streaming(struct imx577 *imx577)
 {
-	return imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
-				1, IMX412_MODE_STANDBY);
+	return imx577_write_reg(imx577, IMX577_REG_MODE_SELECT,
+				1, IMX577_MODE_STANDBY);
 }
 
 /**
- * imx412_set_stream() - Enable sensor streaming
- * @sd: pointer to imx412 subdevice
+ * imx577_set_stream() - Enable sensor streaming
+ * @sd: pointer to imx577 subdevice
  * @enable: set to enable sensor streaming
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
+static int imx577_set_stream(struct v4l2_subdev *sd, int enable)
 {
-	struct imx412 *imx412 = to_imx412(sd);
+	struct imx577 *imx577 = to_imx577(sd);
 	int ret;
 
-	mutex_lock(&imx412->mutex);
+	mutex_lock(&imx577->mutex);
 
-	if (imx412->streaming == enable) {
-		mutex_unlock(&imx412->mutex);
+	if (imx577->streaming == enable) {
+		mutex_unlock(&imx577->mutex);
 		return 0;
 	}
 
 	if (enable) {
-		ret = pm_runtime_resume_and_get(imx412->dev);
+		ret = pm_runtime_resume_and_get(imx577->dev);
 		if (ret)
 			goto error_unlock;
 
-		ret = imx412_start_streaming(imx412);
+		ret = imx577_start_streaming(imx577);
 		if (ret)
 			goto error_power_off;
 	} else {
-		imx412_stop_streaming(imx412);
-		pm_runtime_put(imx412->dev);
+		imx577_stop_streaming(imx577);
+		pm_runtime_put(imx577->dev);
 	}
 
-	imx412->streaming = enable;
+	imx577->streaming = enable;
 
-	mutex_unlock(&imx412->mutex);
+	mutex_unlock(&imx577->mutex);
 
 	return 0;
 
 error_power_off:
-	pm_runtime_put(imx412->dev);
+	pm_runtime_put(imx577->dev);
 error_unlock:
-	mutex_unlock(&imx412->mutex);
+	mutex_unlock(&imx577->mutex);
 
 	return ret;
 }
 
 /**
- * imx412_detect() - Detect imx412 sensor
- * @imx412: pointer to imx412 device
+ * imx577_detect() - Detect imx577 sensor
+ * @imx577: pointer to imx577 device
  *
  * Return: 0 if successful, -EIO if sensor id does not match
  */
-static int imx412_detect(struct imx412 *imx412)
+static int imx577_detect(struct imx577 *imx577)
 {
 	int ret;
 	u32 val;
 
-	ret = imx412_read_reg(imx412, IMX412_REG_ID, 2, &val);
+	ret = imx577_read_reg(imx577, IMX577_REG_ID, 2, &val);
 	if (ret)
 		return ret;
 
-	if (val != IMX412_ID) {
-		dev_err(imx412->dev, "chip id mismatch: %x!=%x",
-			IMX412_ID, val);
+	if (val != IMX577_ID) {
+		dev_err(imx577->dev, "chip id mismatch: %x!=%x",
+			IMX577_ID, val);
 		return -ENXIO;
 	}
 
@@ -914,14 +914,14 @@ static int imx412_detect(struct imx412 *imx412)
 }
 
 /**
- * imx412_parse_hw_config() - Parse HW configuration and check if supported
- * @imx412: pointer to imx412 device
+ * imx577_parse_hw_config() - Parse HW configuration and check if supported
+ * @imx577: pointer to imx577 device
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_parse_hw_config(struct imx412 *imx412)
+static int imx577_parse_hw_config(struct imx577 *imx577)
 {
-	struct fwnode_handle *fwnode = dev_fwnode(imx412->dev);
+	struct fwnode_handle *fwnode = dev_fwnode(imx577->dev);
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
@@ -934,34 +934,34 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 		return -ENXIO;
 
 	/* Request optional reset pin */
-	imx412->reset_gpio = devm_gpiod_get_optional(imx412->dev, "reset",
+	imx577->reset_gpio = devm_gpiod_get_optional(imx577->dev, "reset",
 						     GPIOD_OUT_LOW);
-	if (IS_ERR(imx412->reset_gpio)) {
-		dev_err(imx412->dev, "failed to get reset gpio %ld",
-			PTR_ERR(imx412->reset_gpio));
-		return PTR_ERR(imx412->reset_gpio);
+	if (IS_ERR(imx577->reset_gpio)) {
+		dev_err(imx577->dev, "failed to get reset gpio %ld",
+			PTR_ERR(imx577->reset_gpio));
+		return PTR_ERR(imx577->reset_gpio);
 	}
 
 	/* Get sensor input clock */
-	imx412->inclk = devm_clk_get(imx412->dev, NULL);
-	if (IS_ERR(imx412->inclk)) {
-		dev_err(imx412->dev, "could not get inclk");
-		return PTR_ERR(imx412->inclk);
+	imx577->inclk = devm_clk_get(imx577->dev, NULL);
+	if (IS_ERR(imx577->inclk)) {
+		dev_err(imx577->dev, "could not get inclk");
+		return PTR_ERR(imx577->inclk);
 	}
 
-	rate = clk_get_rate(imx412->inclk);
-	if (rate != IMX412_INCLK_RATE) {
-		dev_err(imx412->dev, "inclk frequency mismatch");
+	rate = clk_get_rate(imx577->inclk);
+	if (rate != IMX577_INCLK_RATE) {
+		dev_err(imx577->dev, "inclk frequency mismatch");
 		return -EINVAL;
 	}
 
 	/* Get optional DT defined regulators */
-	for (i = 0; i < ARRAY_SIZE(imx412_supply_names); i++)
-		imx412->supplies[i].supply = imx412_supply_names[i];
+	for (i = 0; i < ARRAY_SIZE(imx577_supply_names); i++)
+		imx577->supplies[i].supply = imx577_supply_names[i];
 
-	ret = devm_regulator_bulk_get(imx412->dev,
-				      ARRAY_SIZE(imx412_supply_names),
-				      imx412->supplies);
+	ret = devm_regulator_bulk_get(imx577->dev,
+				      ARRAY_SIZE(imx577_supply_names),
+				      imx577->supplies);
 	if (ret)
 		return ret;
 
@@ -974,8 +974,8 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX412_NUM_DATA_LANES) {
-		dev_err(imx412->dev,
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX577_NUM_DATA_LANES) {
+		dev_err(imx577->dev,
 			"number of CSI2 data lanes %d is not supported",
 			bus_cfg.bus.mipi_csi2.num_data_lanes);
 		ret = -EINVAL;
@@ -983,13 +983,13 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 	}
 
 	if (!bus_cfg.nr_of_link_frequencies) {
-		dev_err(imx412->dev, "no link frequencies defined");
+		dev_err(imx577->dev, "no link frequencies defined");
 		ret = -EINVAL;
 		goto done_endpoint_free;
 	}
 
 	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
-		if (bus_cfg.link_frequencies[i] == IMX412_LINK_FREQ)
+		if (bus_cfg.link_frequencies[i] == IMX577_LINK_FREQ)
 			goto done_endpoint_free;
 
 	ret = -EINVAL;
@@ -1001,47 +1001,47 @@ static int imx412_parse_hw_config(struct imx412 *imx412)
 }
 
 /* V4l2 subdevice ops */
-static const struct v4l2_subdev_video_ops imx412_video_ops = {
-	.s_stream = imx412_set_stream,
+static const struct v4l2_subdev_video_ops imx577_video_ops = {
+	.s_stream = imx577_set_stream,
 };
 
-static const struct v4l2_subdev_pad_ops imx412_pad_ops = {
-	.init_cfg = imx412_init_pad_cfg,
-	.enum_mbus_code = imx412_enum_mbus_code,
-	.enum_frame_size = imx412_enum_frame_size,
-	.get_fmt = imx412_get_pad_format,
-	.set_fmt = imx412_set_pad_format,
+static const struct v4l2_subdev_pad_ops imx577_pad_ops = {
+	.init_cfg = imx577_init_pad_cfg,
+	.enum_mbus_code = imx577_enum_mbus_code,
+	.enum_frame_size = imx577_enum_frame_size,
+	.get_fmt = imx577_get_pad_format,
+	.set_fmt = imx577_set_pad_format,
 };
 
-static const struct v4l2_subdev_ops imx412_subdev_ops = {
-	.video = &imx412_video_ops,
-	.pad = &imx412_pad_ops,
+static const struct v4l2_subdev_ops imx577_subdev_ops = {
+	.video = &imx577_video_ops,
+	.pad = &imx577_pad_ops,
 };
 
 /**
- * imx412_power_on() - Sensor power on sequence
+ * imx577_power_on() - Sensor power on sequence
  * @dev: pointer to i2c device
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_power_on(struct device *dev)
+static int imx577_power_on(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx412 *imx412 = to_imx412(sd);
+	struct imx577 *imx577 = to_imx577(sd);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(imx412_supply_names),
-				    imx412->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx577_supply_names),
+				    imx577->supplies);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable regulators\n");
 		return ret;
 	}
 
-	gpiod_set_value_cansleep(imx412->reset_gpio, 0);
+	gpiod_set_value_cansleep(imx577->reset_gpio, 0);
 
-	ret = clk_prepare_enable(imx412->inclk);
+	ret = clk_prepare_enable(imx577->inclk);
 	if (ret) {
-		dev_err(imx412->dev, "fail to enable inclk");
+		dev_err(imx577->dev, "fail to enable inclk");
 		goto error_reset;
 	}
 
@@ -1050,44 +1050,44 @@ static int imx412_power_on(struct device *dev)
 	return 0;
 
 error_reset:
-	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
-	regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
-			       imx412->supplies);
+	gpiod_set_value_cansleep(imx577->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(imx577_supply_names),
+			       imx577->supplies);
 
 	return ret;
 }
 
 /**
- * imx412_power_off() - Sensor power off sequence
+ * imx577_power_off() - Sensor power off sequence
  * @dev: pointer to i2c device
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_power_off(struct device *dev)
+static int imx577_power_off(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct imx412 *imx412 = to_imx412(sd);
+	struct imx577 *imx577 = to_imx577(sd);
 
-	clk_disable_unprepare(imx412->inclk);
+	clk_disable_unprepare(imx577->inclk);
 
-	gpiod_set_value_cansleep(imx412->reset_gpio, 1);
+	gpiod_set_value_cansleep(imx577->reset_gpio, 1);
 
-	regulator_bulk_disable(ARRAY_SIZE(imx412_supply_names),
-			       imx412->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(imx577_supply_names),
+			       imx577->supplies);
 
 	return 0;
 }
 
 /**
- * imx412_init_controls() - Initialize sensor subdevice controls
- * @imx412: pointer to imx412 device
+ * imx577_init_controls() - Initialize sensor subdevice controls
+ * @imx577: pointer to imx577 device
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_init_controls(struct imx412 *imx412)
+static int imx577_init_controls(struct imx577 *imx577)
 {
-	struct v4l2_ctrl_handler *ctrl_hdlr = &imx412->ctrl_handler;
-	const struct imx412_mode *mode = imx412->cur_mode;
+	struct v4l2_ctrl_handler *ctrl_hdlr = &imx577->ctrl_handler;
+	const struct imx577_mode *mode = imx577->cur_mode;
 	u32 lpfr;
 	int ret;
 
@@ -1096,171 +1096,171 @@ static int imx412_init_controls(struct imx412 *imx412)
 		return ret;
 
 	/* Serialize controls with sensor device */
-	ctrl_hdlr->lock = &imx412->mutex;
+	ctrl_hdlr->lock = &imx577->mutex;
 
 	/* Initialize exposure and gain */
 	lpfr = mode->vblank + mode->height;
-	imx412->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
-					     &imx412_ctrl_ops,
+	imx577->exp_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+					     &imx577_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
-					     IMX412_EXPOSURE_MIN,
-					     lpfr - IMX412_EXPOSURE_OFFSET,
-					     IMX412_EXPOSURE_STEP,
-					     IMX412_EXPOSURE_DEFAULT);
+					     IMX577_EXPOSURE_MIN,
+					     lpfr - IMX577_EXPOSURE_OFFSET,
+					     IMX577_EXPOSURE_STEP,
+					     IMX577_EXPOSURE_DEFAULT);
 
-	imx412->again_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
-					       &imx412_ctrl_ops,
+	imx577->again_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+					       &imx577_ctrl_ops,
 					       V4L2_CID_ANALOGUE_GAIN,
-					       IMX412_AGAIN_MIN,
-					       IMX412_AGAIN_MAX,
-					       IMX412_AGAIN_STEP,
-					       IMX412_AGAIN_DEFAULT);
+					       IMX577_AGAIN_MIN,
+					       IMX577_AGAIN_MAX,
+					       IMX577_AGAIN_STEP,
+					       IMX577_AGAIN_DEFAULT);
 
-	v4l2_ctrl_cluster(2, &imx412->exp_ctrl);
+	v4l2_ctrl_cluster(2, &imx577->exp_ctrl);
 
-	imx412->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
-						&imx412_ctrl_ops,
+	imx577->vblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+						&imx577_ctrl_ops,
 						V4L2_CID_VBLANK,
 						mode->vblank_min,
 						mode->vblank_max,
 						1, mode->vblank);
 
 	/* Read only controls */
-	imx412->pclk_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
-					      &imx412_ctrl_ops,
+	imx577->pclk_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+					      &imx577_ctrl_ops,
 					      V4L2_CID_PIXEL_RATE,
 					      mode->pclk, mode->pclk,
 					      1, mode->pclk);
 
-	imx412->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
-							&imx412_ctrl_ops,
+	imx577->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
+							&imx577_ctrl_ops,
 							V4L2_CID_LINK_FREQ,
 							ARRAY_SIZE(link_freq) -
 							1,
 							mode->link_freq_idx,
 							link_freq);
-	if (imx412->link_freq_ctrl)
-		imx412->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (imx577->link_freq_ctrl)
+		imx577->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	imx412->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
-						&imx412_ctrl_ops,
+	imx577->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
+						&imx577_ctrl_ops,
 						V4L2_CID_HBLANK,
-						IMX412_REG_MIN,
-						IMX412_REG_MAX,
+						IMX577_REG_MIN,
+						IMX577_REG_MAX,
 						1, mode->hblank);
-	if (imx412->hblank_ctrl)
-		imx412->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (imx577->hblank_ctrl)
+		imx577->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	if (ctrl_hdlr->error) {
-		dev_err(imx412->dev, "control init failed: %d",
+		dev_err(imx577->dev, "control init failed: %d",
 			ctrl_hdlr->error);
 		v4l2_ctrl_handler_free(ctrl_hdlr);
 		return ctrl_hdlr->error;
 	}
 
-	imx412->sd.ctrl_handler = ctrl_hdlr;
+	imx577->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
 }
 
 /**
- * imx412_probe() - I2C client device binding
+ * imx577_probe() - I2C client device binding
  * @client: pointer to i2c client device
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_probe(struct i2c_client *client)
+static int imx577_probe(struct i2c_client *client)
 {
-	struct imx412 *imx412;
+	struct imx577 *imx577;
 	int ret;
 
-	imx412 = devm_kzalloc(&client->dev, sizeof(*imx412), GFP_KERNEL);
-	if (!imx412)
+	imx577 = devm_kzalloc(&client->dev, sizeof(*imx577), GFP_KERNEL);
+	if (!imx577)
 		return -ENOMEM;
 
-	imx412->dev = &client->dev;
+	imx577->dev = &client->dev;
 
 	/* Initialize subdev */
-	v4l2_i2c_subdev_init(&imx412->sd, client, &imx412_subdev_ops);
+	v4l2_i2c_subdev_init(&imx577->sd, client, &imx577_subdev_ops);
 
-	ret = imx412_parse_hw_config(imx412);
+	ret = imx577_parse_hw_config(imx577);
 	if (ret) {
-		dev_err(imx412->dev, "HW configuration is not supported");
+		dev_err(imx577->dev, "HW configuration is not supported");
 		return ret;
 	}
 
-	mutex_init(&imx412->mutex);
+	mutex_init(&imx577->mutex);
 
-	ret = imx412_power_on(imx412->dev);
+	ret = imx577_power_on(imx577->dev);
 	if (ret) {
-		dev_err(imx412->dev, "failed to power-on the sensor");
+		dev_err(imx577->dev, "failed to power-on the sensor");
 		goto error_mutex_destroy;
 	}
 
 	/* Check module identity */
-	ret = imx412_detect(imx412);
+	ret = imx577_detect(imx577);
 	if (ret) {
-		dev_err(imx412->dev, "failed to find sensor: %d", ret);
+		dev_err(imx577->dev, "failed to find sensor: %d", ret);
 		goto error_power_off;
 	}
 
 	/* Set default mode to max resolution */
-	imx412->cur_mode = &supported_mode;
-	imx412->vblank = imx412->cur_mode->vblank;
+	imx577->cur_mode = &supported_mode;
+	imx577->vblank = imx577->cur_mode->vblank;
 
-	ret = imx412_init_controls(imx412);
+	ret = imx577_init_controls(imx577);
 	if (ret) {
-		dev_err(imx412->dev, "failed to init controls: %d", ret);
+		dev_err(imx577->dev, "failed to init controls: %d", ret);
 		goto error_power_off;
 	}
 
 	/* Initialize subdev */
-	imx412->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	imx412->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	imx577->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx577->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
 	/* Initialize source pad */
-	imx412->pad.flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&imx412->sd.entity, 1, &imx412->pad);
+	imx577->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&imx577->sd.entity, 1, &imx577->pad);
 	if (ret) {
-		dev_err(imx412->dev, "failed to init entity pads: %d", ret);
+		dev_err(imx577->dev, "failed to init entity pads: %d", ret);
 		goto error_handler_free;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&imx412->sd);
+	ret = v4l2_async_register_subdev_sensor(&imx577->sd);
 	if (ret < 0) {
-		dev_err(imx412->dev,
+		dev_err(imx577->dev,
 			"failed to register async subdev: %d", ret);
 		goto error_media_entity;
 	}
 
-	pm_runtime_set_active(imx412->dev);
-	pm_runtime_enable(imx412->dev);
-	pm_runtime_idle(imx412->dev);
+	pm_runtime_set_active(imx577->dev);
+	pm_runtime_enable(imx577->dev);
+	pm_runtime_idle(imx577->dev);
 
 	return 0;
 
 error_media_entity:
-	media_entity_cleanup(&imx412->sd.entity);
+	media_entity_cleanup(&imx577->sd.entity);
 error_handler_free:
-	v4l2_ctrl_handler_free(imx412->sd.ctrl_handler);
+	v4l2_ctrl_handler_free(imx577->sd.ctrl_handler);
 error_power_off:
-	imx412_power_off(imx412->dev);
+	imx577_power_off(imx577->dev);
 error_mutex_destroy:
-	mutex_destroy(&imx412->mutex);
+	mutex_destroy(&imx577->mutex);
 
 	return ret;
 }
 
 /**
- * imx412_remove() - I2C client device unbinding
+ * imx577_remove() - I2C client device unbinding
  * @client: pointer to I2C client device
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_remove(struct i2c_client *client)
+static int imx577_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx412 *imx412 = to_imx412(sd);
+	struct imx577 *imx577 = to_imx577(sd);
 
 	v4l2_async_unregister_subdev(sd);
 	media_entity_cleanup(&sd->entity);
@@ -1268,36 +1268,36 @@ static int imx412_remove(struct i2c_client *client)
 
 	pm_runtime_disable(&client->dev);
 	if (!pm_runtime_status_suspended(&client->dev))
-		imx412_power_off(&client->dev);
+		imx577_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 
-	mutex_destroy(&imx412->mutex);
+	mutex_destroy(&imx577->mutex);
 
 	return 0;
 }
 
-static const struct dev_pm_ops imx412_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx412_power_off, imx412_power_on, NULL)
+static const struct dev_pm_ops imx577_pm_ops = {
+	SET_RUNTIME_PM_OPS(imx577_power_off, imx577_power_on, NULL)
 };
 
-static const struct of_device_id imx412_of_match[] = {
-	{ .compatible = "sony,imx412" },
+static const struct of_device_id imx577_of_match[] = {
+	{ .compatible = "sony,imx577" },
 	{ }
 };
 
-MODULE_DEVICE_TABLE(of, imx412_of_match);
+MODULE_DEVICE_TABLE(of, imx577_of_match);
 
-static struct i2c_driver imx412_driver = {
-	.probe_new = imx412_probe,
-	.remove = imx412_remove,
+static struct i2c_driver imx577_driver = {
+	.probe_new = imx577_probe,
+	.remove = imx577_remove,
 	.driver = {
-		.name = "imx412",
-		.pm = &imx412_pm_ops,
-		.of_match_table = imx412_of_match,
+		.name = "imx577",
+		.pm = &imx577_pm_ops,
+		.of_match_table = imx577_of_match,
 	},
 };
 
-module_i2c_driver(imx412_driver);
+module_i2c_driver(imx577_driver);
 
-MODULE_DESCRIPTION("Sony imx412 sensor driver");
+MODULE_DESCRIPTION("Sony imx577 sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

