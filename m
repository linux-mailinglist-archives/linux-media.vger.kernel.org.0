Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86D8B76E47E
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbjHCJfa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235018AbjHCJf2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6C4358D
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055250;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q3MA44Ema+uNPDJkgWrO8iTRnhCzEMkhsNWD8j7RjXk=;
        b=Fm0NFADTPL/j0d4107uD9Zp4Da4qNLHZ+rQzK6kHDP67O2Fz/w0c+c/TRCsibTdXY/5U6g
        08PhDAQVN3JHuQVbPVeYiLzFETqBrBb6uNB3U7gXGWgNwdB1mFbqo1TPZHc2Z0WlEB+Bj2
        EOOLgog9ohD1jrpubq0UEcOuo8rk53U=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-u1onL2SMMdmTaOo0I8m3mQ-1; Thu, 03 Aug 2023 05:34:06 -0400
X-MC-Unique: u1onL2SMMdmTaOo0I8m3mQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E19F3C0CEE2;
        Thu,  3 Aug 2023 09:34:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B84A02166B25;
        Thu,  3 Aug 2023 09:34:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 09/32] media: ov2680: Convert to new CCI register access helpers
Date:   Thu,  3 Aug 2023 11:33:24 +0200
Message-ID: <20230803093348.15679-10-hdegoede@redhat.com>
In-Reply-To: <20230803093348.15679-1-hdegoede@redhat.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new comon CCI register access helpers to replace the private
register access helpers in the ov2680 driver.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov2680.c | 224 ++++++++++---------------------------
 2 files changed, 58 insertions(+), 167 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index aa55582a2cd0..74ff833ff48c 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -332,6 +332,7 @@ config VIDEO_OV2659
 
 config VIDEO_OV2680
 	tristate "OmniVision OV2680 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV2680 camera.
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 1f923acbbc07..02ac5b5e6583 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -10,49 +10,45 @@
  *
  */
 
-#include <asm/unaligned.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/gpio/consumer.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
-#define OV2680_XVCLK_VALUE	24000000
+#define OV2680_XVCLK_VALUE			24000000
 
-#define OV2680_CHIP_ID		0x2680
+#define OV2680_CHIP_ID				0x2680
 
-#define OV2680_REG_STREAM_CTRL		0x0100
-#define OV2680_REG_SOFT_RESET		0x0103
+#define OV2680_REG_STREAM_CTRL			CCI_REG8(0x0100)
+#define OV2680_REG_SOFT_RESET			CCI_REG8(0x0103)
 
-#define OV2680_REG_CHIP_ID_HIGH		0x300a
-#define OV2680_REG_CHIP_ID_LOW		0x300b
+#define OV2680_REG_CHIP_ID			CCI_REG16(0x300a)
 
-#define OV2680_REG_R_MANUAL		0x3503
-#define OV2680_REG_GAIN_PK		0x350a
-#define OV2680_REG_EXPOSURE_PK_HIGH	0x3500
-#define OV2680_REG_TIMING_HTS		0x380c
-#define OV2680_REG_TIMING_VTS		0x380e
-#define OV2680_REG_FORMAT1		0x3820
-#define OV2680_REG_FORMAT2		0x3821
+#define OV2680_REG_EXPOSURE_PK			CCI_REG24(0x3500)
+#define OV2680_REG_R_MANUAL			CCI_REG8(0x3503)
+#define OV2680_REG_GAIN_PK			CCI_REG16(0x350a)
+#define OV2680_REG_TIMING_HTS			CCI_REG16(0x380c)
+#define OV2680_REG_TIMING_VTS			CCI_REG16(0x380e)
+#define OV2680_REG_FORMAT1			CCI_REG8(0x3820)
+#define OV2680_REG_FORMAT2			CCI_REG8(0x3821)
 
-#define OV2680_REG_ISP_CTRL00		0x5080
+#define OV2680_REG_ISP_CTRL00			CCI_REG8(0x5080)
 
-#define OV2680_FRAME_RATE		30
+#define OV2680_FRAME_RATE			30
 
-#define OV2680_REG_VALUE_8BIT		1
-#define OV2680_REG_VALUE_16BIT		2
-#define OV2680_REG_VALUE_24BIT		3
-
-#define OV2680_WIDTH_MAX		1600
-#define OV2680_HEIGHT_MAX		1200
+#define OV2680_WIDTH_MAX			1600
+#define OV2680_HEIGHT_MAX			1200
 
 #define OV2680_DEFAULT_WIDTH			800
 #define OV2680_DEFAULT_HEIGHT			600
@@ -64,11 +60,6 @@ enum ov2680_mode_id {
 	OV2680_MODE_MAX,
 };
 
-struct reg_value {
-	u16 reg_addr;
-	u8 val;
-};
-
 static const char * const ov2680_supply_name[] = {
 	"DOVDD",
 	"DVDD",
@@ -82,7 +73,7 @@ struct ov2680_mode_info {
 	enum ov2680_mode_id id;
 	u32 width;
 	u32 height;
-	const struct reg_value *reg_data;
+	const struct reg_sequence *reg_data;
 	u32 reg_data_size;
 };
 
@@ -97,6 +88,7 @@ struct ov2680_ctrls {
 
 struct ov2680_dev {
 	struct i2c_client		*i2c_client;
+	struct regmap			*regmap;
 	struct v4l2_subdev		sd;
 
 	struct media_pad		pad;
@@ -133,7 +125,7 @@ static const int ov2680_hv_flip_bayer_order[] = {
 	MEDIA_BUS_FMT_SRGGB10_1X10,
 };
 
-static const struct reg_value ov2680_setting_30fps_QUXGA_800_600[] = {
+static const struct reg_sequence ov2680_setting_30fps_QUXGA_800_600[] = {
 	{0x3086, 0x01}, {0x370a, 0x23}, {0x3808, 0x03}, {0x3809, 0x20},
 	{0x380a, 0x02}, {0x380b, 0x58}, {0x380c, 0x06}, {0x380d, 0xac},
 	{0x380e, 0x02}, {0x380f, 0x84}, {0x3811, 0x04}, {0x3813, 0x04},
@@ -142,14 +134,14 @@ static const struct reg_value ov2680_setting_30fps_QUXGA_800_600[] = {
 	{0x3503, 0x03},
 };
 
-static const struct reg_value ov2680_setting_30fps_720P_1280_720[] = {
+static const struct reg_sequence ov2680_setting_30fps_720P_1280_720[] = {
 	{0x3086, 0x00}, {0x3808, 0x05}, {0x3809, 0x00}, {0x380a, 0x02},
 	{0x380b, 0xd0}, {0x380c, 0x06}, {0x380d, 0xa8}, {0x380e, 0x05},
 	{0x380f, 0x0e}, {0x3811, 0x08}, {0x3813, 0x06}, {0x3814, 0x11},
 	{0x3815, 0x11}, {0x3820, 0xc0}, {0x4008, 0x00},
 };
 
-static const struct reg_value ov2680_setting_30fps_UXGA_1600_1200[] = {
+static const struct reg_sequence ov2680_setting_30fps_UXGA_1600_1200[] = {
 	{0x3086, 0x00}, {0x3501, 0x4e}, {0x3502, 0xe0}, {0x3808, 0x06},
 	{0x3809, 0x40}, {0x380a, 0x04}, {0x380b, 0xb0}, {0x380c, 0x06},
 	{0x380d, 0xa8}, {0x380e, 0x05}, {0x380f, 0x0e}, {0x3811, 0x00},
@@ -191,115 +183,6 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 			     ctrls.handler)->sd;
 }
 
-static int __ov2680_write_reg(struct ov2680_dev *sensor, u16 reg,
-			      unsigned int len, u32 val)
-{
-	struct i2c_client *client = sensor->i2c_client;
-	u8 buf[6];
-	int ret;
-
-	if (len > 4)
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
-	ret = i2c_master_send(client, buf, len + 2);
-	if (ret != len + 2) {
-		dev_err(&client->dev, "write error: reg=0x%4x: %d\n", reg, ret);
-		return -EIO;
-	}
-
-	return 0;
-}
-
-#define ov2680_write_reg(s, r, v) \
-	__ov2680_write_reg(s, r, OV2680_REG_VALUE_8BIT, v)
-
-#define ov2680_write_reg16(s, r, v) \
-	__ov2680_write_reg(s, r, OV2680_REG_VALUE_16BIT, v)
-
-#define ov2680_write_reg24(s, r, v) \
-	__ov2680_write_reg(s, r, OV2680_REG_VALUE_24BIT, v)
-
-static int __ov2680_read_reg(struct ov2680_dev *sensor, u16 reg,
-			     unsigned int len, u32 *val)
-{
-	struct i2c_client *client = sensor->i2c_client;
-	struct i2c_msg msgs[2];
-	u8 addr_buf[2] = { reg >> 8, reg & 0xff };
-	u8 data_buf[4] = { 0, };
-	int ret;
-
-	if (len > 4)
-		return -EINVAL;
-
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs)) {
-		dev_err(&client->dev, "read error: reg=0x%4x: %d\n", reg, ret);
-		return -EIO;
-	}
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-#define ov2680_read_reg(s, r, v) \
-	__ov2680_read_reg(s, r, OV2680_REG_VALUE_8BIT, v)
-
-#define ov2680_read_reg16(s, r, v) \
-	__ov2680_read_reg(s, r, OV2680_REG_VALUE_16BIT, v)
-
-#define ov2680_read_reg24(s, r, v) \
-	__ov2680_read_reg(s, r, OV2680_REG_VALUE_24BIT, v)
-
-static int ov2680_mod_reg(struct ov2680_dev *sensor, u16 reg, u8 mask, u8 val)
-{
-	u32 readval;
-	int ret;
-
-	ret = ov2680_read_reg(sensor, reg, &readval);
-	if (ret < 0)
-		return ret;
-
-	readval &= ~mask;
-	val &= mask;
-	val |= readval;
-
-	return ov2680_write_reg(sensor, reg, val);
-}
-
-static int ov2680_load_regs(struct ov2680_dev *sensor,
-			    const struct ov2680_mode_info *mode)
-{
-	const struct reg_value *regs = mode->reg_data;
-	unsigned int i;
-	int ret = 0;
-	u16 reg_addr;
-	u8 val;
-
-	for (i = 0; i < mode->reg_data_size; ++i, ++regs) {
-		reg_addr = regs->reg_addr;
-		val = regs->val;
-
-		ret = ov2680_write_reg(sensor, reg_addr, val);
-		if (ret)
-			break;
-	}
-
-	return ret;
-}
-
 static void ov2680_power_up(struct ov2680_dev *sensor)
 {
 	if (!sensor->reset_gpio)
@@ -351,8 +234,8 @@ static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
 	if (sensor->is_streaming)
 		return -EBUSY;
 
-	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT1,
-			     BIT(2), val ? BIT(2) : 0);
+	ret = cci_update_bits(sensor->regmap, OV2680_REG_FORMAT1,
+			      BIT(2), val ? BIT(2) : 0, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -367,8 +250,8 @@ static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 	if (sensor->is_streaming)
 		return -EBUSY;
 
-	ret = ov2680_mod_reg(sensor, OV2680_REG_FORMAT2,
-			     BIT(2), val ? BIT(2) : 0);
+	ret = cci_update_bits(sensor->regmap, OV2680_REG_FORMAT2,
+			      BIT(2), val ? BIT(2) : 0, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -378,48 +261,48 @@ static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 
 static int ov2680_test_pattern_set(struct ov2680_dev *sensor, int value)
 {
-	int ret;
+	int ret = 0;
 
 	if (!value)
-		return ov2680_mod_reg(sensor, OV2680_REG_ISP_CTRL00, BIT(7), 0);
+		return cci_update_bits(sensor->regmap, OV2680_REG_ISP_CTRL00,
+				       BIT(7), 0, NULL);
 
-	ret = ov2680_mod_reg(sensor, OV2680_REG_ISP_CTRL00, 0x03, value - 1);
-	if (ret < 0)
-		return ret;
+	cci_update_bits(sensor->regmap, OV2680_REG_ISP_CTRL00,
+			0x03, value - 1, &ret);
+	cci_update_bits(sensor->regmap, OV2680_REG_ISP_CTRL00,
+			BIT(7), BIT(7), &ret);
 
-	ret = ov2680_mod_reg(sensor, OV2680_REG_ISP_CTRL00, BIT(7), BIT(7));
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return ret;
 }
 
 static int ov2680_gain_set(struct ov2680_dev *sensor, u32 gain)
 {
-	return ov2680_write_reg16(sensor, OV2680_REG_GAIN_PK, gain);
+	return cci_write(sensor->regmap, OV2680_REG_GAIN_PK, gain, NULL);
 }
 
 static int ov2680_exposure_set(struct ov2680_dev *sensor, u32 exp)
 {
-	return ov2680_write_reg24(sensor, OV2680_REG_EXPOSURE_PK_HIGH,
-				  exp << 4);
+	return cci_write(sensor->regmap, OV2680_REG_EXPOSURE_PK, exp << 4,
+			 NULL);
 }
 
 static int ov2680_stream_enable(struct ov2680_dev *sensor)
 {
-	return ov2680_write_reg(sensor, OV2680_REG_STREAM_CTRL, 1);
+	return cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 1, NULL);
 }
 
 static int ov2680_stream_disable(struct ov2680_dev *sensor)
 {
-	return ov2680_write_reg(sensor, OV2680_REG_STREAM_CTRL, 0);
+	return cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 0, NULL);
 }
 
 static int ov2680_mode_set(struct ov2680_dev *sensor)
 {
 	int ret;
 
-	ret = ov2680_load_regs(sensor, sensor->current_mode);
+	ret = regmap_multi_reg_write(sensor->regmap,
+				     sensor->current_mode->reg_data,
+				     sensor->current_mode->reg_data_size);
 	if (ret < 0)
 		return ret;
 
@@ -437,7 +320,9 @@ static int ov2680_mode_restore(struct ov2680_dev *sensor)
 {
 	int ret;
 
-	ret = ov2680_load_regs(sensor, &ov2680_mode_init_data);
+	ret = regmap_multi_reg_write(sensor->regmap,
+				     ov2680_mode_init_data.reg_data,
+				     ov2680_mode_init_data.reg_data_size);
 	if (ret < 0)
 		return ret;
 
@@ -472,7 +357,8 @@ static int ov2680_power_on(struct ov2680_dev *sensor)
 	}
 
 	if (!sensor->reset_gpio) {
-		ret = ov2680_write_reg(sensor, OV2680_REG_SOFT_RESET, 0x01);
+		ret = cci_write(sensor->regmap, OV2680_REG_SOFT_RESET, 0x01,
+				NULL);
 		if (ret != 0) {
 			dev_err(dev, "sensor soft reset failed\n");
 			goto err_disable_regulators;
@@ -841,19 +727,19 @@ static int ov2680_get_regulators(struct ov2680_dev *sensor)
 static int ov2680_check_id(struct ov2680_dev *sensor)
 {
 	struct device *dev = ov2680_to_dev(sensor);
-	u32 chip_id;
+	u64 chip_id;
 	int ret;
 
 	ov2680_power_on(sensor);
 
-	ret = ov2680_read_reg16(sensor, OV2680_REG_CHIP_ID_HIGH, &chip_id);
+	ret = cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, NULL);
 	if (ret < 0) {
-		dev_err(dev, "failed to read chip id high\n");
+		dev_err(dev, "failed to read chip id\n");
 		return -ENODEV;
 	}
 
 	if (chip_id != OV2680_CHIP_ID) {
-		dev_err(dev, "chip id: 0x%04x does not match expected 0x%04x\n",
+		dev_err(dev, "chip id: 0x%04llx does not match expected 0x%04x\n",
 			chip_id, OV2680_CHIP_ID);
 		return -ENODEV;
 	}
@@ -902,6 +788,10 @@ static int ov2680_probe(struct i2c_client *client)
 
 	sensor->i2c_client = client;
 
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap))
+		return PTR_ERR(sensor->regmap);
+
 	ret = ov2680_parse_dt(sensor);
 	if (ret < 0)
 		return -EINVAL;
-- 
2.41.0

