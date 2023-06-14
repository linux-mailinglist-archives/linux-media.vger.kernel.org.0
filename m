Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747167249A4
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 18:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237797AbjFFQ7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 12:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237730AbjFFQ67 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 12:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EC410EA
        for <linux-media@vger.kernel.org>; Tue,  6 Jun 2023 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686070697;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XpzbuEHZv0SEw2Pw2gxWDjMQwdkImK4r+Onm9+KDtIM=;
        b=No8hsAqzZpJEBcPq7zShUxk+4y9xZMiSHwie/E/7yeuDsP8qlzSaHWtBFezQpvQwNRWi0f
        V7a9a9ktZJn0iABLLIcCGjeZnh6NAkRGNISUyAQLD6s9SBo1kda78r8m7S/f37YV/op2bd
        38aOeGx2hnUmN2pNGTKS6xrsp4yGxDw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-sXYClgYpOri5CGcNGAdluw-1; Tue, 06 Jun 2023 12:58:13 -0400
X-MC-Unique: sXYClgYpOri5CGcNGAdluw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A61B101A53A;
        Tue,  6 Jun 2023 16:58:13 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.155])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 62EE9492B00;
        Tue,  6 Jun 2023 16:58:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH 2/3] media: atomisp: ov2680: Convert to new CCI register access helpers
Date:   Tue,  6 Jun 2023 18:58:07 +0200
Message-Id: <20230606165808.70751-3-hdegoede@redhat.com>
In-Reply-To: <20230606165808.70751-1-hdegoede@redhat.com>
References: <20230606165808.70751-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new comon CCI register access helpers to replace the private
register access helpers in the ov2680 driver.

While at it also switch to using the same register address defines
as the standard drivers/media/i2c/ov2680.c driver to make merging
the 2 drivers simpler.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/Kconfig     |   1 +
 .../media/atomisp/i2c/atomisp-ov2680.c        | 233 ++++++++----------
 drivers/staging/media/atomisp/i2c/ov2680.h    |  73 +-----
 3 files changed, 104 insertions(+), 203 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index 16b6b808d4a7..e353b7fdbff0 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -53,6 +53,7 @@ config VIDEO_ATOMISP_OV2680
 	tristate "Omnivision OV2680 sensor support"
 	depends on ACPI
 	depends on I2C && VIDEO_DEV
+	select V4L2_CCI
 	help
 	  This is a Video4Linux2 sensor-level driver for the Omnivision
 	  OV2680 raw camera.
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index 77070bbd0157..3cc56090677c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -25,11 +25,47 @@
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
 
-#include <media/ov_16bit_addr_reg_helpers.h>
 #include <media/v4l2-device.h>
 
 #include "ov2680.h"
 
+#define OV2680_CHIP_ID				0x2680
+
+#define OV2680_REG_STREAM_CTRL			CCI_REG8(0x0100)
+#define OV2680_REG_SOFT_RESET			CCI_REG8(0x0103)
+
+#define OV2680_REG_CHIP_ID			CCI_REG16(0x300a)
+#define OV2680_REG_SC_CMMN_SUB_ID		CCI_REG8(0x302a)
+
+#define OV2680_REG_EXPOSURE_PK			CCI_REG24(0x3500)
+#define OV2680_REG_R_MANUAL			CCI_REG8(0x3503)
+#define OV2680_REG_GAIN_PK			CCI_REG16(0x350a)
+
+#define OV2680_REG_SENSOR_CTRL_0A		CCI_REG8(0x370a)
+
+#define OV2680_REG_HORIZONTAL_START		CCI_REG16(0x3800)
+#define OV2680_REG_VERTICAL_START		CCI_REG16(0x3802)
+#define OV2680_REG_HORIZONTAL_END		CCI_REG16(0x3804)
+#define OV2680_REG_VERTICAL_END			CCI_REG16(0x3806)
+#define OV2680_REG_HORIZONTAL_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OV2680_REG_VERTICAL_OUTPUT_SIZE		CCI_REG16(0x380a)
+#define OV2680_REG_TIMING_HTS			CCI_REG16(0x380c)
+#define OV2680_REG_TIMING_VTS			CCI_REG16(0x380e)
+#define OV2680_REG_ISP_X_WIN			CCI_REG16(0x3810)
+#define OV2680_REG_ISP_Y_WIN			CCI_REG16(0x3812)
+#define OV2680_REG_X_INC			CCI_REG8(0x3814)
+#define OV2680_REG_Y_INC			CCI_REG8(0x3815)
+#define OV2680_REG_FORMAT1			CCI_REG8(0x3820)
+#define OV2680_REG_FORMAT2			CCI_REG8(0x3821)
+
+#define OV2680_REG_ISP_CTRL00			CCI_REG8(0x5080)
+
+#define OV2680_REG_X_WIN			CCI_REG16(0x5704)
+#define OV2680_REG_Y_WIN			CCI_REG16(0x5706)
+
+#define OV2680_FRAME_RATE			30
+#define OV2680_INTEGRATION_TIME_MARGIN		8
+
 static const struct v4l2_rect ov2680_default_crop = {
 	.left = OV2680_ACTIVE_START_LEFT,
 	.top = OV2680_ACTIVE_START_TOP,
@@ -37,21 +73,6 @@ static const struct v4l2_rect ov2680_default_crop = {
 	.height = OV2680_ACTIVE_HEIGHT,
 };
 
-static int ov2680_write_reg_array(struct i2c_client *client,
-				  const struct ov2680_reg *reglist)
-{
-	const struct ov2680_reg *next = reglist;
-	int ret;
-
-	for (; next->reg != 0; next++) {
-		ret = ov_write_reg8(client, next->reg, next->val);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static void ov2680_set_bayer_order(struct ov2680_dev *sensor, struct v4l2_mbus_framefmt *fmt)
 {
 	static const int ov2680_hv_flip_bayer_order[] = {
@@ -78,7 +99,8 @@ static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
 	if (sensor->is_streaming)
 		return -EBUSY;
 
-	ret = ov_update_reg(sensor->client, OV2680_REG_FORMAT1, BIT(2), val ? BIT(2) : 0);
+	ret = cci_update_bits(sensor->regmap, OV2680_REG_FORMAT1, BIT(2),
+			      val ? BIT(2) : 0, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -93,7 +115,8 @@ static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 	if (sensor->is_streaming)
 		return -EBUSY;
 
-	ret = ov_update_reg(sensor->client, OV2680_REG_FORMAT2, BIT(2), val ? BIT(2) : 0);
+	ret = cci_update_bits(sensor->regmap, OV2680_REG_FORMAT2, BIT(2),
+			      val ? BIT(2) : 0, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -103,30 +126,25 @@ static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
 
 static int ov2680_exposure_set(struct ov2680_dev *sensor, u32 exp)
 {
-	return ov_write_reg24(sensor->client, OV2680_REG_EXPOSURE_PK_HIGH, exp << 4);
+	return cci_write(sensor->regmap, OV2680_REG_EXPOSURE_PK, exp << 4, NULL);
 }
 
 static int ov2680_gain_set(struct ov2680_dev *sensor, u32 gain)
 {
-	return ov_write_reg16(sensor->client, OV2680_REG_GAIN_PK, gain);
+	return cci_write(sensor->regmap, OV2680_REG_GAIN_PK, gain, NULL);
 }
 
 static int ov2680_test_pattern_set(struct ov2680_dev *sensor, int value)
 {
-	int ret;
+	int ret = 0;
 
 	if (!value)
-		return ov_update_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), 0);
+		return cci_update_bits(sensor->regmap, OV2680_REG_ISP_CTRL00, BIT(7), 0, NULL);
 
-	ret = ov_update_reg(sensor->client, OV2680_REG_ISP_CTRL00, 0x03, value - 1);
-	if (ret < 0)
-		return ret;
+	cci_update_bits(sensor->regmap, OV2680_REG_ISP_CTRL00, 0x03, value - 1, &ret);
+	cci_update_bits(sensor->regmap, OV2680_REG_ISP_CTRL00, BIT(7), BIT(7), &ret);
 
-	ret = ov_update_reg(sensor->client, OV2680_REG_ISP_CTRL00, BIT(7), BIT(7));
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return ret;
 }
 
 static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -171,15 +189,16 @@ static const struct v4l2_ctrl_ops ov2680_ctrl_ops = {
 
 static int ov2680_init_registers(struct v4l2_subdev *sd)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
+	int ret = 0;
 
-	ret = ov_write_reg8(client, OV2680_SW_RESET, 0x01);
+	cci_write(sensor->regmap, OV2680_REG_SOFT_RESET, 0x01, &ret);
 
 	/* Wait for sensor reset */
 	usleep_range(1000, 2000);
 
-	ret |= ov2680_write_reg_array(client, ov2680_global_setting);
+	cci_multi_reg_write(sensor->regmap, ov2680_global_setting,
+			    ARRAY_SIZE(ov2680_global_setting), &ret);
 
 	return ret;
 }
@@ -247,9 +266,8 @@ static void ov2680_calc_mode(struct ov2680_dev *sensor)
 
 static int ov2680_set_mode(struct ov2680_dev *sensor)
 {
-	struct i2c_client *client = sensor->client;
 	u8 sensor_ctrl_0a, inc, fmt1, fmt2;
-	int ret;
+	int ret = 0;
 
 	if (sensor->mode.binning) {
 		sensor_ctrl_0a = 0x23;
@@ -263,77 +281,27 @@ static int ov2680_set_mode(struct ov2680_dev *sensor)
 		fmt2 = 0x00;
 	}
 
-	ret = ov_write_reg8(client, OV2680_REG_SENSOR_CTRL_0A, sensor_ctrl_0a);
-	if (ret)
-		return ret;
+	cci_write(sensor->regmap, OV2680_REG_SENSOR_CTRL_0A, sensor_ctrl_0a, &ret);
+	cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_START, sensor->mode.h_start, &ret);
+	cci_write(sensor->regmap, OV2680_REG_VERTICAL_START, sensor->mode.v_start, &ret);
+	cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_END, sensor->mode.h_end, &ret);
+	cci_write(sensor->regmap, OV2680_REG_VERTICAL_END, sensor->mode.v_end, &ret);
+	cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_OUTPUT_SIZE,
+		  sensor->mode.h_output_size, &ret);
+	cci_write(sensor->regmap, OV2680_REG_VERTICAL_OUTPUT_SIZE,
+		  sensor->mode.v_output_size, &ret);
+	cci_write(sensor->regmap, OV2680_REG_TIMING_HTS, sensor->mode.hts, &ret);
+	cci_write(sensor->regmap, OV2680_REG_TIMING_VTS, sensor->mode.vts, &ret);
+	cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
+	cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
+	cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
+	cci_write(sensor->regmap, OV2680_REG_Y_INC, inc, &ret);
+	cci_write(sensor->regmap, OV2680_REG_X_WIN, sensor->mode.h_output_size, &ret);
+	cci_write(sensor->regmap, OV2680_REG_Y_WIN, sensor->mode.v_output_size, &ret);
+	cci_write(sensor->regmap, OV2680_REG_FORMAT1, fmt1, &ret);
+	cci_write(sensor->regmap, OV2680_REG_FORMAT2, fmt2, &ret);
 
-	ret = ov_write_reg16(client, OV2680_HORIZONTAL_START_H, sensor->mode.h_start);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_VERTICAL_START_H, sensor->mode.v_start);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_HORIZONTAL_END_H, sensor->mode.h_end);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_VERTICAL_END_H, sensor->mode.v_end);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_HORIZONTAL_OUTPUT_SIZE_H,
-				 sensor->mode.h_output_size);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_VERTICAL_OUTPUT_SIZE_H,
-				 sensor->mode.v_output_size);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_HTS, sensor->mode.hts);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_VTS, sensor->mode.vts);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_ISP_X_WIN, 0);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_ISP_Y_WIN, 0);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg8(client, OV2680_X_INC, inc);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg8(client, OV2680_Y_INC, inc);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_X_WIN, sensor->mode.h_output_size);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg16(client, OV2680_Y_WIN, sensor->mode.v_output_size);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg8(client, OV2680_REG_FORMAT1, fmt1);
-	if (ret)
-		return ret;
-
-	ret = ov_write_reg8(client, OV2680_REG_FORMAT2, fmt2);
-	if (ret)
-		return ret;
-
-	return 0;
+	return ret;
 }
 
 static int ov2680_set_fmt(struct v4l2_subdev *sd,
@@ -478,35 +446,25 @@ static int ov2680_init_cfg(struct v4l2_subdev *sd,
 	return ov2680_set_fmt(sd, sd_state, &fmt);
 }
 
-static int ov2680_detect(struct i2c_client *client)
+static int ov2680_detect(struct ov2680_dev *sensor)
 {
-	struct i2c_adapter *adapter = client->adapter;
-	u32 high, low;
-	int ret;
-	u16 id;
-	u8 revision;
+	u32 chip_id, rev;
+	int ret = 0;
 
-	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
-		return -ENODEV;
-
-	ret = ov_read_reg8(client, OV2680_SC_CMMN_CHIP_ID_H, &high);
-	if (ret) {
-		dev_err(&client->dev, "sensor_id_high = 0x%x\n", high);
-		return -ENODEV;
-	}
-	ret = ov_read_reg8(client, OV2680_SC_CMMN_CHIP_ID_L, &low);
-	id = ((((u16)high) << 8) | (u16)low);
-
-	if (id != OV2680_ID) {
-		dev_err(&client->dev, "sensor ID error 0x%x\n", id);
+	cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, &ret);
+	cci_read(sensor->regmap, OV2680_REG_SC_CMMN_SUB_ID, &rev, &ret);
+	if (ret < 0) {
+		dev_err(sensor->dev, "failed to read chip id\n");
 		return -ENODEV;
 	}
 
-	ret = ov_read_reg8(client, OV2680_SC_CMMN_SUB_ID, &high);
-	revision = (u8)high & 0x0f;
+	if (chip_id != OV2680_CHIP_ID) {
+		dev_err(sensor->dev, "chip id: 0x%04x does not match expected 0x%04x\n",
+			chip_id, OV2680_CHIP_ID);
+		return -ENODEV;
+	}
 
-	dev_info(&client->dev, "sensor_revision id = 0x%x, rev= %d\n",
-		 id, revision);
+	dev_info(sensor->dev, "sensor_revision id = 0x%x, rev= %d\n", chip_id, rev & 0x0f);
 
 	return 0;
 }
@@ -538,11 +496,11 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 		if (ret)
 			goto error_power_down;
 
-		ret = ov_write_reg8(client, OV2680_SW_STREAM, OV2680_START_STREAMING);
+		ret = cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 1, NULL);
 		if (ret)
 			goto error_power_down;
 	} else {
-		ov_write_reg8(client, OV2680_SW_STREAM, OV2680_STOP_STREAMING);
+		cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 0, NULL);
 		pm_runtime_put(sensor->sd.dev);
 	}
 
@@ -563,6 +521,7 @@ static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
 
 static int ov2680_s_config(struct v4l2_subdev *sd)
 {
+	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret;
 
@@ -573,7 +532,7 @@ static int ov2680_s_config(struct v4l2_subdev *sd)
 	}
 
 	/* config & detect sensor */
-	ret = ov2680_detect(client);
+	ret = ov2680_detect(sensor);
 	if (ret)
 		dev_err(&client->dev, "ov2680_detect err s_config.\n");
 
@@ -586,7 +545,7 @@ static int ov2680_g_frame_interval(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_frame_interval *interval)
 {
 	interval->interval.numerator = 1;
-	interval->interval.denominator = OV2680_FPS;
+	interval->interval.denominator = OV2680_FRAME_RATE;
 	return 0;
 }
 
@@ -638,7 +597,7 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	fie->interval.numerator = 1;
-	fie->interval.denominator = OV2680_FPS;
+	fie->interval.denominator = OV2680_FRAME_RATE;
 	return 0;
 }
 
@@ -738,9 +697,13 @@ static int ov2680_probe(struct i2c_client *client)
 	if (!sensor)
 		return -ENOMEM;
 
+	sensor->regmap = cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap))
+		return PTR_ERR(sensor->regmap);
+
 	mutex_init(&sensor->lock);
 
-	sensor->client = client;
+	sensor->dev = &client->dev;
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_ops);
 
 	/*
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index d032af245674..d547846c2d13 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -24,6 +24,7 @@
 #include <linux/delay.h>
 #include <linux/videodev2.h>
 #include <linux/spinlock.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-subdev.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
@@ -44,75 +45,12 @@
 /* 1704 * 1294 * 30fps = 66MHz pixel clock */
 #define OV2680_PIXELS_PER_LINE			1704
 #define OV2680_LINES_PER_FRAME			1294
-#define OV2680_FPS				30
+
 #define OV2680_SKIP_FRAMES			3
 
 /* If possible send 16 extra rows / lines to the ISP as padding */
 #define OV2680_END_MARGIN			16
 
-#define OV2680_FOCAL_LENGTH_NUM			334	/*3.34mm*/
-
-#define OV2680_INTEGRATION_TIME_MARGIN		8
-#define OV2680_ID				0x2680
-
-/*
- * OV2680 System control registers
- */
-#define OV2680_SW_SLEEP				0x0100
-#define OV2680_SW_RESET				0x0103
-#define OV2680_SW_STREAM			0x0100
-
-#define OV2680_SC_CMMN_CHIP_ID_H		0x300A
-#define OV2680_SC_CMMN_CHIP_ID_L		0x300B
-#define OV2680_SC_CMMN_SCCB_ID			0x302B /* 0x300C*/
-#define OV2680_SC_CMMN_SUB_ID			0x302A /* process, version*/
-
-#define OV2680_GROUP_ACCESS			0x3208 /*Bit[7:4] Group control, Bit[3:0] Group ID*/
-
-#define OV2680_REG_EXPOSURE_PK_HIGH		0x3500
-#define OV2680_REG_GAIN_PK			0x350a
-
-#define OV2680_REG_SENSOR_CTRL_0A		0x370a
-
-#define OV2680_HORIZONTAL_START_H		0x3800 /* Bit[11:8] */
-#define OV2680_HORIZONTAL_START_L		0x3801 /* Bit[7:0]  */
-#define OV2680_VERTICAL_START_H			0x3802 /* Bit[11:8] */
-#define OV2680_VERTICAL_START_L			0x3803 /* Bit[7:0]  */
-#define OV2680_HORIZONTAL_END_H			0x3804 /* Bit[11:8] */
-#define OV2680_HORIZONTAL_END_L			0x3805 /* Bit[7:0]  */
-#define OV2680_VERTICAL_END_H			0x3806 /* Bit[11:8] */
-#define OV2680_VERTICAL_END_L			0x3807 /* Bit[7:0]  */
-#define OV2680_HORIZONTAL_OUTPUT_SIZE_H		0x3808 /* Bit[11:8] */
-#define OV2680_HORIZONTAL_OUTPUT_SIZE_L		0x3809 /* Bit[7:0]  */
-#define OV2680_VERTICAL_OUTPUT_SIZE_H		0x380a /* Bit[11:8] */
-#define OV2680_VERTICAL_OUTPUT_SIZE_L		0x380b /* Bit[7:0]  */
-#define OV2680_HTS				0x380c
-#define OV2680_VTS				0x380e
-#define OV2680_ISP_X_WIN			0x3810
-#define OV2680_ISP_Y_WIN			0x3812
-#define OV2680_X_INC				0x3814
-#define OV2680_Y_INC				0x3815
-
-#define OV2680_FRAME_OFF_NUM			0x4202
-
-/*Flip/Mirror*/
-#define OV2680_REG_FORMAT1			0x3820
-#define OV2680_REG_FORMAT2			0x3821
-
-#define OV2680_MWB_RED_GAIN_H			0x5004/*0x3400*/
-#define OV2680_MWB_GREEN_GAIN_H			0x5006/*0x3402*/
-#define OV2680_MWB_BLUE_GAIN_H			0x5008/*0x3404*/
-#define OV2680_MWB_GAIN_MAX			0x0fff
-
-#define OV2680_REG_ISP_CTRL00			0x5080
-
-#define OV2680_X_WIN				0x5704
-#define OV2680_Y_WIN				0x5706
-#define OV2680_WIN_CONTROL			0x5708
-
-#define OV2680_START_STREAMING			0x01
-#define OV2680_STOP_STREAMING			0x00
-
 /*
  * ov2680 device structure.
  */
@@ -121,7 +59,8 @@ struct ov2680_dev {
 	struct media_pad pad;
 	/* Protect against concurrent changes to controls */
 	struct mutex lock;
-	struct i2c_client *client;
+	struct device *dev;
+	struct regmap *regmap;
 	struct gpio_desc *powerdown;
 	struct fwnode_handle *ep_fwnode;
 	bool is_streaming;
@@ -173,7 +112,7 @@ static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 	return &sensor->sd;
 }
 
-static struct ov2680_reg const ov2680_global_setting[] = {
+static const struct reg_sequence ov2680_global_setting[] = {
 	/* MIPI PHY, 0x10 -> 0x1c enable bp_c_hs_en_lat and bp_d_hs_en_lat */
 	{0x3016, 0x1c},
 
@@ -242,8 +181,6 @@ static struct ov2680_reg const ov2680_global_setting[] = {
 
 	/* DPC THRE RATIO 0x04 (4) -> 0x00 (0) */
 	{0x5792, 0x00},
-
-	{}
 };
 
 #endif
-- 
2.40.1

