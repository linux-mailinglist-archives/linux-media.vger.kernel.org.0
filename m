Return-Path: <linux-media+bounces-44455-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 619B7BDACEE
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 535E24E9558
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF7230B51F;
	Tue, 14 Oct 2025 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eQK+6Xa2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F60304BDA
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463652; cv=none; b=UbW7/huwltumtJEsZXstr9e8fltAUN+VCcV0vahefWg9PxmmRlVn7vwrCHBS8wHggsjkldxWFO1EtLwMU8aFaOYjOkW604NwbLiDh7080kLBVY8ZtNizddUsNNCZVXBG0Z1SYGdG2NrUC746ywXMM0S51vhcibRfutO9jE2p5GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463652; c=relaxed/simple;
	bh=aOHehS5LlLnQcLJZEb5Zwhj5+qk7vlaCA5gdRDoftmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/SRjqt+/OfGi4NsX6H41FdhUXXhFECmcmYt62fT5lmherKN/lOZ3v2gaR8UILOpBILHO7buud1b8Rtmn1iNVOqhzUfqD3iptJtbet+7zbWIsTXaOhCxhrmBUl9SESaSsEQ9TqPkGvNiHo/PSe80Lv361/6CjLici9aSObCnSkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eQK+6Xa2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A22C4CEE7;
	Tue, 14 Oct 2025 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463652;
	bh=aOHehS5LlLnQcLJZEb5Zwhj5+qk7vlaCA5gdRDoftmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQK+6Xa2I/tS9XIQ+eWPFEY958SzxF4fOM9OG9mP1V2fVuURQ02vn8KhBvftoJbMG
	 8VJBh7NL9/TjG4NlVZyDm+TsJb2/n26tv3HIyyw7I9H8XxUaa48utoXsAEFcSppVAg
	 RhE9DYmyF8HlHJLuHzt//onWPkqMeDLBcqOuHUlenFBvJVkTByW+f4vh4aDaAZ4d1x
	 7gBsbCtzOGkRQ+d0UDqfRWyb7M0PniBqJMa49VKkzn1yt/EPR9LlEfRF/RAgq2K2Tu
	 aMQD4P6dzhDNkBnNrqw9UhQEz6dbM6dWBWJ/kMrEel0kfpwabt7IyV8PF5wXkq2SoO
	 ODzleKZ2lNW+Q==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 08/25] media: i2c: ov01a10: Convert to new CCI register access helpers
Date: Tue, 14 Oct 2025 19:40:16 +0200
Message-ID: <20251014174033.20534-9-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new comon CCI register access helpers to replace the private
register access helpers in the ov01a10 driver.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/Kconfig   |   1 +
 drivers/media/i2c/ov01a10.c | 219 ++++++++++--------------------------
 2 files changed, 59 insertions(+), 161 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 6fed163803d3..a14332a700be 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -364,6 +364,7 @@ config VIDEO_OG0VE1B
 
 config VIDEO_OV01A10
 	tristate "OmniVision OV01A10 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV01A10 camera.
diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 0ae23d435a65..d17a04f4ca5b 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -10,7 +10,9 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -19,10 +21,10 @@
 #define OV01A10_SCLK			80000000LL
 #define OV01A10_DATA_LANES		1
 
-#define OV01A10_REG_CHIP_ID		0x300a
+#define OV01A10_REG_CHIP_ID		CCI_REG24(0x300a)
 #define OV01A10_CHIP_ID			0x560141
 
-#define OV01A10_REG_MODE_SELECT		0x0100
+#define OV01A10_REG_MODE_SELECT		CCI_REG8(0x0100)
 #define OV01A10_MODE_STANDBY		0x00
 #define OV01A10_MODE_STREAMING		0x01
 
@@ -33,47 +35,47 @@
 #define OV01A10_ACITVE_HEIGHT		800
 
 /* vertical and horizontal timings */
-#define OV01A10_REG_VTS			0x380e
+#define OV01A10_REG_VTS			CCI_REG16(0x380e)
 #define OV01A10_VTS_DEF			0x0700
 #define OV01A10_VTS_MIN			0x0380
 #define OV01A10_VTS_MAX			0xffff
 #define OV01A10_HTS_DEF			1488
 
 /* exposure controls */
-#define OV01A10_REG_EXPOSURE		0x3501
+#define OV01A10_REG_EXPOSURE		CCI_REG16(0x3501)
 #define OV01A10_EXPOSURE_MIN		4
 #define OV01A10_EXPOSURE_MAX_MARGIN	8
 #define OV01A10_EXPOSURE_STEP		1
 
 /* analog gain controls */
-#define OV01A10_REG_ANALOG_GAIN		0x3508
+#define OV01A10_REG_ANALOG_GAIN		CCI_REG16(0x3508)
 #define OV01A10_ANAL_GAIN_MIN		0x100
 #define OV01A10_ANAL_GAIN_MAX		0xfff
 #define OV01A10_ANAL_GAIN_STEP		1
 
 /* digital gain controls */
-#define OV01A10_REG_DIGITAL_GAIN_B	0x350a
-#define OV01A10_REG_DIGITAL_GAIN_GB	0x3510
-#define OV01A10_REG_DIGITAL_GAIN_GR	0x3513
-#define OV01A10_REG_DIGITAL_GAIN_R	0x3516
+#define OV01A10_REG_DIGITAL_GAIN_B	CCI_REG24(0x350a)
+#define OV01A10_REG_DIGITAL_GAIN_GB	CCI_REG24(0x3510)
+#define OV01A10_REG_DIGITAL_GAIN_GR	CCI_REG24(0x3513)
+#define OV01A10_REG_DIGITAL_GAIN_R	CCI_REG24(0x3516)
 #define OV01A10_DGTL_GAIN_MIN		0
 #define OV01A10_DGTL_GAIN_MAX		0x3ffff
 #define OV01A10_DGTL_GAIN_STEP		1
 #define OV01A10_DGTL_GAIN_DEFAULT	1024
 
 /* test pattern control */
-#define OV01A10_REG_TEST_PATTERN	0x4503
+#define OV01A10_REG_TEST_PATTERN	CCI_REG8(0x4503)
 #define OV01A10_TEST_PATTERN_ENABLE	BIT(7)
 #define OV01A10_LINK_FREQ_400MHZ_INDEX	0
 
 /* flip and mirror control */
-#define OV01A10_REG_FORMAT1		0x3820
+#define OV01A10_REG_FORMAT1		CCI_REG8(0x3820)
 #define OV01A10_VFLIP_MASK		BIT(4)
 #define OV01A10_HFLIP_MASK		BIT(3)
 
 /* window offset */
-#define OV01A10_REG_X_WIN		0x3811
-#define OV01A10_REG_Y_WIN		0x3813
+#define OV01A10_REG_X_WIN		CCI_REG16(0x3810)
+#define OV01A10_REG_Y_WIN		CCI_REG16(0x3812)
 
 /*
  * The native ov01a10 bayer-pattern is GBRG, but there was a driver bug enabling
@@ -84,14 +86,9 @@
  */
 #define OV01A10_MEDIA_BUS_FMT		MEDIA_BUS_FMT_SBGGR10_1X10
 
-struct ov01a10_reg {
-	u16 address;
-	u8 val;
-};
-
 struct ov01a10_reg_list {
 	u32 num_of_regs;
-	const struct ov01a10_reg *regs;
+	const struct reg_sequence *regs;
 };
 
 struct ov01a10_link_freq_config {
@@ -109,7 +106,7 @@ struct ov01a10_mode {
 	const struct ov01a10_reg_list reg_list;
 };
 
-static const struct ov01a10_reg mipi_data_rate_720mbps[] = {
+static const struct reg_sequence mipi_data_rate_720mbps[] = {
 	{0x0103, 0x01},
 	{0x0302, 0x00},
 	{0x0303, 0x06},
@@ -125,7 +122,7 @@ static const struct ov01a10_reg mipi_data_rate_720mbps[] = {
 	{0x0325, 0x68},
 };
 
-static const struct ov01a10_reg sensor_1280x800_setting[] = {
+static const struct reg_sequence sensor_1280x800_setting[] = {
 	{0x3002, 0xa1},
 	{0x301e, 0xf0},
 	{0x3022, 0x01},
@@ -283,6 +280,7 @@ static const struct ov01a10_mode supported_modes[] = {
 };
 
 struct ov01a10 {
+	struct regmap *regmap;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -302,104 +300,15 @@ static inline struct ov01a10 *to_ov01a10(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct ov01a10, sd);
 }
 
-static int ov01a10_read_reg(struct ov01a10 *ov01a10, u16 reg, u16 len, u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
-	struct i2c_msg msgs[2];
-	u8 addr_buf[2];
-	u8 data_buf[4] = {0};
-	int ret = 0;
-
-	if (len > sizeof(data_buf))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = sizeof(addr_buf);
-	msgs[0].buf = addr_buf;
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[sizeof(data_buf) - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-
-	if (ret != ARRAY_SIZE(msgs))
-		return ret < 0 ? ret : -EIO;
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-static int ov01a10_write_reg(struct ov01a10 *ov01a10, u16 reg, u16 len, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
-	u8 buf[6];
-	int ret = 0;
-
-	if (len > 4)
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << 8 * (4 - len), buf + 2);
-
-	ret = i2c_master_send(client, buf, len + 2);
-	if (ret != len + 2)
-		return ret < 0 ? ret : -EIO;
-
-	return 0;
-}
-
-static int ov01a10_write_reg_list(struct ov01a10 *ov01a10,
-				  const struct ov01a10_reg_list *r_list)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
-	unsigned int i;
-	int ret = 0;
-
-	for (i = 0; i < r_list->num_of_regs; i++) {
-		ret = ov01a10_write_reg(ov01a10, r_list->regs[i].address, 1,
-					r_list->regs[i].val);
-		if (ret) {
-			dev_err_ratelimited(&client->dev,
-					    "write reg 0x%4.4x err = %d\n",
-					    r_list->regs[i].address, ret);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	u32 real = d_gain << 6;
 	int ret = 0;
 
-	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_DIGITAL_GAIN_B, 3, real);
-	if (ret) {
-		dev_err(&client->dev, "failed to set DIGITAL_GAIN_B\n");
-		return ret;
-	}
-
-	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_DIGITAL_GAIN_GB, 3, real);
-	if (ret) {
-		dev_err(&client->dev, "failed to set DIGITAL_GAIN_GB\n");
-		return ret;
-	}
-
-	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_DIGITAL_GAIN_GR, 3, real);
-	if (ret) {
-		dev_err(&client->dev, "failed to set DIGITAL_GAIN_GR\n");
-		return ret;
-	}
-
-	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_DIGITAL_GAIN_R, 3, real);
-	if (ret)
-		dev_err(&client->dev, "failed to set DIGITAL_GAIN_R\n");
+	cci_write(ov01a10->regmap, OV01A10_REG_DIGITAL_GAIN_B, real, &ret);
+	cci_write(ov01a10->regmap, OV01A10_REG_DIGITAL_GAIN_GB, real, &ret);
+	cci_write(ov01a10->regmap, OV01A10_REG_DIGITAL_GAIN_GR, real, &ret);
+	cci_write(ov01a10->regmap, OV01A10_REG_DIGITAL_GAIN_R, real, &ret);
 
 	return ret;
 }
@@ -409,48 +318,39 @@ static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 	if (pattern)
 		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
 
-	return ov01a10_write_reg(ov01a10, OV01A10_REG_TEST_PATTERN, 1, pattern);
+	return cci_write(ov01a10->regmap, OV01A10_REG_TEST_PATTERN, pattern,
+			 NULL);
 }
 
 /* for vflip and hflip, use 0x9 as window offset to keep the bayer */
 static int ov01a10_set_hflip(struct ov01a10 *ov01a10, u32 hflip)
 {
-	int ret;
 	u32 val, offset;
+	int ret = 0;
 
 	offset = hflip ? 0x8 : 0x9;
-	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_X_WIN, 1, offset);
-	if (ret)
-		return ret;
+	val = hflip ? 0 : FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
 
-	ret = ov01a10_read_reg(ov01a10, OV01A10_REG_FORMAT1, 1, &val);
-	if (ret)
-		return ret;
+	cci_write(ov01a10->regmap, OV01A10_REG_X_WIN, offset, &ret);
+	cci_update_bits(ov01a10->regmap, OV01A10_REG_FORMAT1,
+			OV01A10_HFLIP_MASK, val, &ret);
 
-	val = hflip ? val & ~OV01A10_HFLIP_MASK :
-		      val | FIELD_PREP(OV01A10_HFLIP_MASK, 0x1);
-
-	return ov01a10_write_reg(ov01a10, OV01A10_REG_FORMAT1, 1, val);
+	return ret;
 }
 
 static int ov01a10_set_vflip(struct ov01a10 *ov01a10, u32 vflip)
 {
-	int ret;
 	u32 val, offset;
+	int ret = 0;
 
 	offset = vflip ? 0x9 : 0x8;
-	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_Y_WIN, 1, offset);
-	if (ret)
-		return ret;
+	val = vflip ? FIELD_PREP(OV01A10_VFLIP_MASK, 0x1) : 0;
 
-	ret = ov01a10_read_reg(ov01a10, OV01A10_REG_FORMAT1, 1, &val);
-	if (ret)
-		return ret;
+	cci_write(ov01a10->regmap, OV01A10_REG_Y_WIN, offset, &ret);
+	cci_update_bits(ov01a10->regmap, OV01A10_REG_FORMAT1,
+			OV01A10_VFLIP_MASK, val, &ret);
 
-	val = vflip ? val | FIELD_PREP(OV01A10_VFLIP_MASK, 0x1) :
-		val & ~OV01A10_VFLIP_MASK;
-
-	return ov01a10_write_reg(ov01a10, OV01A10_REG_FORMAT1, 1, val);
+	return ret;
 }
 
 static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -475,8 +375,8 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
-		ret = ov01a10_write_reg(ov01a10, OV01A10_REG_ANALOG_GAIN, 2,
-					ctrl->val);
+		ret = cci_write(ov01a10->regmap, OV01A10_REG_ANALOG_GAIN,
+				ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
@@ -484,13 +384,13 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 
 	case V4L2_CID_EXPOSURE:
-		ret = ov01a10_write_reg(ov01a10, OV01A10_REG_EXPOSURE, 2,
-					ctrl->val);
+		ret = cci_write(ov01a10->regmap, OV01A10_REG_EXPOSURE,
+				ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_VBLANK:
-		ret = ov01a10_write_reg(ov01a10, OV01A10_REG_VTS, 2,
-					ov01a10->cur_mode->height + ctrl->val);
+		ret = cci_write(ov01a10->regmap, OV01A10_REG_VTS,
+				ov01a10->cur_mode->height + ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_TEST_PATTERN:
@@ -631,14 +531,16 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 
 	link_freq_index = ov01a10->cur_mode->link_freq_index;
 	reg_list = &link_freq_configs[link_freq_index].reg_list;
-	ret = ov01a10_write_reg_list(ov01a10, reg_list);
+	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
+				     reg_list->num_of_regs);
 	if (ret) {
 		dev_err(&client->dev, "failed to set plls\n");
 		return ret;
 	}
 
 	reg_list = &ov01a10->cur_mode->reg_list;
-	ret = ov01a10_write_reg_list(ov01a10, reg_list);
+	ret = regmap_multi_reg_write(ov01a10->regmap, reg_list->regs,
+				     reg_list->num_of_regs);
 	if (ret) {
 		dev_err(&client->dev, "failed to set mode\n");
 		return ret;
@@ -648,23 +550,14 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 	if (ret)
 		return ret;
 
-	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_MODE_SELECT, 1,
-				OV01A10_MODE_STREAMING);
-	if (ret)
-		dev_err(&client->dev, "failed to start streaming\n");
-
-	return ret;
+	return cci_write(ov01a10->regmap, OV01A10_REG_MODE_SELECT,
+			 OV01A10_MODE_STREAMING, NULL);
 }
 
 static void ov01a10_stop_streaming(struct ov01a10 *ov01a10)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
-	int ret = 0;
-
-	ret = ov01a10_write_reg(ov01a10, OV01A10_REG_MODE_SELECT, 1,
-				OV01A10_MODE_STANDBY);
-	if (ret)
-		dev_err(&client->dev, "failed to stop streaming\n");
+	cci_write(ov01a10->regmap, OV01A10_REG_MODE_SELECT,
+		  OV01A10_MODE_STANDBY, NULL);
 }
 
 static int ov01a10_set_stream(struct v4l2_subdev *sd, int enable)
@@ -842,14 +735,14 @@ static int ov01a10_identify_module(struct ov01a10 *ov01a10)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov01a10->sd);
 	int ret;
-	u32 val;
+	u64 val;
 
-	ret = ov01a10_read_reg(ov01a10, OV01A10_REG_CHIP_ID, 3, &val);
+	ret = cci_read(ov01a10->regmap, OV01A10_REG_CHIP_ID, &val, NULL);
 	if (ret)
 		return ret;
 
 	if (val != OV01A10_CHIP_ID) {
-		dev_err(&client->dev, "chip id mismatch: %x!=%x\n",
+		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
 			OV01A10_CHIP_ID, val);
 		return -EIO;
 	}
@@ -880,6 +773,10 @@ static int ov01a10_probe(struct i2c_client *client)
 	if (!ov01a10)
 		return -ENOMEM;
 
+	ov01a10->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov01a10->regmap))
+		return PTR_ERR(ov01a10->regmap);
+
 	v4l2_i2c_subdev_init(&ov01a10->sd, client, &ov01a10_subdev_ops);
 	ov01a10->sd.internal_ops = &ov01a10_internal_ops;
 
-- 
2.51.0


