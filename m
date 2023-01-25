Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C91567C028
	for <lists+linux-media@lfdr.de>; Wed, 25 Jan 2023 23:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235772AbjAYWtQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Jan 2023 17:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjAYWtP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Jan 2023 17:49:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA95457C4
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 14:49:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A23E6188E
        for <linux-media@vger.kernel.org>; Wed, 25 Jan 2023 23:49:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674686946;
        bh=La7UcZ2Cc1jHFj4N945ptUrWoERPrCnTJwn3dcF4UvQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WOJCP+nVOEU/7iuuZPl6CLR4q65x5xQwqJQHVQrk1gAhdg+Nan9chzbxBLs3p5wRs
         nZxqG7lrT58K7c/oTsbLUaP23unxMeNDP5zpp+qou6bFdVDwFf1HxIo34zZkqUfUsP
         ESMO9gXFGqujofwfQPVvg0Pa4eZ0VzC0LF49+tTk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [RFC PATCH 4/8] media: i2c: Drop unused mt9t001 camera sensor driver
Date:   Thu, 26 Jan 2023 00:48:52 +0200
Message-Id: <20230125224856.22266-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125224856.22266-1-laurent.pinchart@ideasonboard.com>
References: <20230125224856.22266-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_PDS_OTHER_BAD_TLD autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mt9t001 camera sensor driver doesn't support DT and relies on
platform data. No board file has ever provided platform data for that
device. The driver has thus never been used in the mainline kernel since
its introduction in v3.2. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../admin-guide/media/i2c-cardlist.rst        |   1 -
 MAINTAINERS                                   |   8 -
 drivers/media/i2c/Kconfig                     |   9 -
 drivers/media/i2c/Makefile                    |   1 -
 drivers/media/i2c/mt9t001.c                   | 992 ------------------
 include/media/i2c/mt9t001.h                   |  10 -
 6 files changed, 1021 deletions(-)
 delete mode 100644 drivers/media/i2c/mt9t001.c
 delete mode 100644 include/media/i2c/mt9t001.h

diff --git a/Documentation/admin-guide/media/i2c-cardlist.rst b/Documentation/admin-guide/media/i2c-cardlist.rst
index 6db642460e25..35660b6c6cf5 100644
--- a/Documentation/admin-guide/media/i2c-cardlist.rst
+++ b/Documentation/admin-guide/media/i2c-cardlist.rst
@@ -75,7 +75,6 @@ imx412        Sony IMX412 sensor
 mt9m001       mt9m001
 mt9m111       mt9m111, mt9m112 and mt9m131
 mt9p031       Aptina MT9P031
-mt9t001       Aptina MT9T001
 mt9t112       Aptina MT9T111/MT9T112
 mt9v011       Micron mt9v011 sensor
 mt9v032       Micron MT9V032 sensor
diff --git a/MAINTAINERS b/MAINTAINERS
index dd63f8ed9a1b..21a468610095 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14215,14 +14215,6 @@ F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
 F:	drivers/media/i2c/mt9p031.c
 F:	include/media/i2c/mt9p031.h
 
-MT9T001 APTINA CAMERA SENSOR
-M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-L:	linux-media@vger.kernel.org
-S:	Maintained
-T:	git git://linuxtv.org/media_tree.git
-F:	drivers/media/i2c/mt9t001.c
-F:	include/media/i2c/mt9t001.h
-
 MT9T112 APTINA CAMERA SENSOR
 M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 6d365c5505c9..f8823a837763 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -259,15 +259,6 @@ config VIDEO_MT9P031
 	  This is a Video4Linux2 sensor driver for the Aptina
 	  (Micron) mt9p031 5 Mpixel camera.
 
-config VIDEO_MT9T001
-	tristate "Aptina MT9T001 support"
-	depends on I2C && VIDEO_DEV
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	help
-	  This is a Video4Linux2 sensor driver for the Aptina
-	  (Micron) mt0t001 3 Mpixel camera.
-
 config VIDEO_MT9T112
 	tristate "Aptina MT9T111/MT9T112 support"
 	depends on I2C && VIDEO_DEV
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 1c4cc791fd57..4d5962549c17 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -60,7 +60,6 @@ obj-$(CONFIG_VIDEO_MSP3400) += msp3400.o
 obj-$(CONFIG_VIDEO_MT9M001) += mt9m001.o
 obj-$(CONFIG_VIDEO_MT9M111) += mt9m111.o
 obj-$(CONFIG_VIDEO_MT9P031) += mt9p031.o
-obj-$(CONFIG_VIDEO_MT9T001) += mt9t001.o
 obj-$(CONFIG_VIDEO_MT9T112) += mt9t112.o
 obj-$(CONFIG_VIDEO_MT9V011) += mt9v011.o
 obj-$(CONFIG_VIDEO_MT9V032) += mt9v032.o
diff --git a/drivers/media/i2c/mt9t001.c b/drivers/media/i2c/mt9t001.c
deleted file mode 100644
index c635ed11388a..000000000000
--- a/drivers/media/i2c/mt9t001.c
+++ /dev/null
@@ -1,992 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Driver for MT9T001 CMOS Image Sensor from Aptina (Micron)
- *
- * Copyright (C) 2010-2011, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- *
- * Based on the MT9M001 driver,
- *
- * Copyright (C) 2008, Guennadi Liakhovetski <kernel@pengutronix.de>
- */
-
-#include <linux/clk.h>
-#include <linux/i2c.h>
-#include <linux/log2.h>
-#include <linux/module.h>
-#include <linux/regulator/consumer.h>
-#include <linux/slab.h>
-#include <linux/videodev2.h>
-#include <linux/v4l2-mediabus.h>
-
-#include <media/i2c/mt9t001.h>
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
-#include <media/v4l2-subdev.h>
-
-#define MT9T001_PIXEL_ARRAY_HEIGHT			1568
-#define MT9T001_PIXEL_ARRAY_WIDTH			2112
-
-#define MT9T001_CHIP_VERSION				0x00
-#define		MT9T001_CHIP_ID				0x1621
-#define MT9T001_ROW_START				0x01
-#define		MT9T001_ROW_START_MIN			0
-#define		MT9T001_ROW_START_DEF			20
-#define		MT9T001_ROW_START_MAX			1534
-#define MT9T001_COLUMN_START				0x02
-#define		MT9T001_COLUMN_START_MIN		0
-#define		MT9T001_COLUMN_START_DEF		32
-#define		MT9T001_COLUMN_START_MAX		2046
-#define MT9T001_WINDOW_HEIGHT				0x03
-#define		MT9T001_WINDOW_HEIGHT_MIN		1
-#define		MT9T001_WINDOW_HEIGHT_DEF		1535
-#define		MT9T001_WINDOW_HEIGHT_MAX		1567
-#define MT9T001_WINDOW_WIDTH				0x04
-#define		MT9T001_WINDOW_WIDTH_MIN		1
-#define		MT9T001_WINDOW_WIDTH_DEF		2047
-#define		MT9T001_WINDOW_WIDTH_MAX		2111
-#define MT9T001_HORIZONTAL_BLANKING			0x05
-#define		MT9T001_HORIZONTAL_BLANKING_MIN		21
-#define		MT9T001_HORIZONTAL_BLANKING_MAX		1023
-#define MT9T001_VERTICAL_BLANKING			0x06
-#define		MT9T001_VERTICAL_BLANKING_MIN		3
-#define		MT9T001_VERTICAL_BLANKING_MAX		1023
-#define MT9T001_OUTPUT_CONTROL				0x07
-#define		MT9T001_OUTPUT_CONTROL_SYNC		(1 << 0)
-#define		MT9T001_OUTPUT_CONTROL_CHIP_ENABLE	(1 << 1)
-#define		MT9T001_OUTPUT_CONTROL_TEST_DATA	(1 << 6)
-#define		MT9T001_OUTPUT_CONTROL_DEF		0x0002
-#define MT9T001_SHUTTER_WIDTH_HIGH			0x08
-#define MT9T001_SHUTTER_WIDTH_LOW			0x09
-#define		MT9T001_SHUTTER_WIDTH_MIN		1
-#define		MT9T001_SHUTTER_WIDTH_DEF		1561
-#define		MT9T001_SHUTTER_WIDTH_MAX		(1024 * 1024)
-#define MT9T001_PIXEL_CLOCK				0x0a
-#define		MT9T001_PIXEL_CLOCK_INVERT		(1 << 15)
-#define		MT9T001_PIXEL_CLOCK_SHIFT_MASK		(7 << 8)
-#define		MT9T001_PIXEL_CLOCK_SHIFT_SHIFT		8
-#define		MT9T001_PIXEL_CLOCK_DIVIDE_MASK		(0x7f << 0)
-#define MT9T001_FRAME_RESTART				0x0b
-#define MT9T001_SHUTTER_DELAY				0x0c
-#define		MT9T001_SHUTTER_DELAY_MAX		2047
-#define MT9T001_RESET					0x0d
-#define MT9T001_READ_MODE1				0x1e
-#define		MT9T001_READ_MODE_SNAPSHOT		(1 << 8)
-#define		MT9T001_READ_MODE_STROBE_ENABLE		(1 << 9)
-#define		MT9T001_READ_MODE_STROBE_WIDTH		(1 << 10)
-#define		MT9T001_READ_MODE_STROBE_OVERRIDE	(1 << 11)
-#define MT9T001_READ_MODE2				0x20
-#define		MT9T001_READ_MODE_BAD_FRAMES		(1 << 0)
-#define		MT9T001_READ_MODE_LINE_VALID_CONTINUOUS	(1 << 9)
-#define		MT9T001_READ_MODE_LINE_VALID_FRAME	(1 << 10)
-#define MT9T001_READ_MODE3				0x21
-#define		MT9T001_READ_MODE_GLOBAL_RESET		(1 << 0)
-#define		MT9T001_READ_MODE_GHST_CTL		(1 << 1)
-#define MT9T001_ROW_ADDRESS_MODE			0x22
-#define		MT9T001_ROW_SKIP_MASK			(7 << 0)
-#define		MT9T001_ROW_BIN_MASK			(3 << 3)
-#define		MT9T001_ROW_BIN_SHIFT			3
-#define MT9T001_COLUMN_ADDRESS_MODE			0x23
-#define		MT9T001_COLUMN_SKIP_MASK		(7 << 0)
-#define		MT9T001_COLUMN_BIN_MASK			(3 << 3)
-#define		MT9T001_COLUMN_BIN_SHIFT		3
-#define MT9T001_GREEN1_GAIN				0x2b
-#define MT9T001_BLUE_GAIN				0x2c
-#define MT9T001_RED_GAIN				0x2d
-#define MT9T001_GREEN2_GAIN				0x2e
-#define MT9T001_TEST_DATA				0x32
-#define MT9T001_GLOBAL_GAIN				0x35
-#define		MT9T001_GLOBAL_GAIN_MIN			8
-#define		MT9T001_GLOBAL_GAIN_MAX			1024
-#define MT9T001_BLACK_LEVEL				0x49
-#define MT9T001_ROW_BLACK_DEFAULT_OFFSET		0x4b
-#define MT9T001_BLC_DELTA_THRESHOLDS			0x5d
-#define MT9T001_CAL_THRESHOLDS				0x5f
-#define MT9T001_GREEN1_OFFSET				0x60
-#define MT9T001_GREEN2_OFFSET				0x61
-#define MT9T001_BLACK_LEVEL_CALIBRATION			0x62
-#define		MT9T001_BLACK_LEVEL_OVERRIDE		(1 << 0)
-#define		MT9T001_BLACK_LEVEL_DISABLE_OFFSET	(1 << 1)
-#define		MT9T001_BLACK_LEVEL_RECALCULATE		(1 << 12)
-#define		MT9T001_BLACK_LEVEL_LOCK_RED_BLUE	(1 << 13)
-#define		MT9T001_BLACK_LEVEL_LOCK_GREEN		(1 << 14)
-#define MT9T001_RED_OFFSET				0x63
-#define MT9T001_BLUE_OFFSET				0x64
-
-struct mt9t001 {
-	struct v4l2_subdev subdev;
-	struct media_pad pad;
-
-	struct clk *clk;
-	struct regulator_bulk_data regulators[2];
-
-	struct mutex power_lock; /* lock to protect power_count */
-	int power_count;
-
-	struct v4l2_mbus_framefmt format;
-	struct v4l2_rect crop;
-
-	struct v4l2_ctrl_handler ctrls;
-	struct v4l2_ctrl *gains[4];
-
-	u16 output_control;
-	u16 black_level;
-};
-
-static inline struct mt9t001 *to_mt9t001(struct v4l2_subdev *sd)
-{
-	return container_of(sd, struct mt9t001, subdev);
-}
-
-static int mt9t001_read(struct i2c_client *client, u8 reg)
-{
-	return i2c_smbus_read_word_swapped(client, reg);
-}
-
-static int mt9t001_write(struct i2c_client *client, u8 reg, u16 data)
-{
-	return i2c_smbus_write_word_swapped(client, reg, data);
-}
-
-static int mt9t001_set_output_control(struct mt9t001 *mt9t001, u16 clear,
-				      u16 set)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&mt9t001->subdev);
-	u16 value = (mt9t001->output_control & ~clear) | set;
-	int ret;
-
-	if (value == mt9t001->output_control)
-		return 0;
-
-	ret = mt9t001_write(client, MT9T001_OUTPUT_CONTROL, value);
-	if (ret < 0)
-		return ret;
-
-	mt9t001->output_control = value;
-	return 0;
-}
-
-static int mt9t001_reset(struct mt9t001 *mt9t001)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&mt9t001->subdev);
-	int ret;
-
-	/* Reset the chip and stop data read out */
-	ret = mt9t001_write(client, MT9T001_RESET, 1);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9t001_write(client, MT9T001_RESET, 0);
-	if (ret < 0)
-		return ret;
-
-	mt9t001->output_control = MT9T001_OUTPUT_CONTROL_DEF;
-
-	return mt9t001_set_output_control(mt9t001,
-					  MT9T001_OUTPUT_CONTROL_CHIP_ENABLE,
-					  0);
-}
-
-static int mt9t001_power_on(struct mt9t001 *mt9t001)
-{
-	int ret;
-
-	/* Bring up the supplies */
-	ret = regulator_bulk_enable(ARRAY_SIZE(mt9t001->regulators),
-				   mt9t001->regulators);
-	if (ret < 0)
-		return ret;
-
-	/* Enable clock */
-	ret = clk_prepare_enable(mt9t001->clk);
-	if (ret < 0)
-		regulator_bulk_disable(ARRAY_SIZE(mt9t001->regulators),
-				       mt9t001->regulators);
-
-	return ret;
-}
-
-static void mt9t001_power_off(struct mt9t001 *mt9t001)
-{
-	regulator_bulk_disable(ARRAY_SIZE(mt9t001->regulators),
-			       mt9t001->regulators);
-
-	clk_disable_unprepare(mt9t001->clk);
-}
-
-static int __mt9t001_set_power(struct mt9t001 *mt9t001, bool on)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&mt9t001->subdev);
-	int ret;
-
-	if (!on) {
-		mt9t001_power_off(mt9t001);
-		return 0;
-	}
-
-	ret = mt9t001_power_on(mt9t001);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9t001_reset(mt9t001);
-	if (ret < 0) {
-		dev_err(&client->dev, "Failed to reset the camera\n");
-		goto e_power;
-	}
-
-	ret = v4l2_ctrl_handler_setup(&mt9t001->ctrls);
-	if (ret < 0) {
-		dev_err(&client->dev, "Failed to set up control handlers\n");
-		goto e_power;
-	}
-
-	return 0;
-
-e_power:
-	mt9t001_power_off(mt9t001);
-
-	return ret;
-}
-
-/* -----------------------------------------------------------------------------
- * V4L2 subdev video operations
- */
-
-static struct v4l2_mbus_framefmt *
-__mt9t001_get_pad_format(struct mt9t001 *mt9t001,
-			 struct v4l2_subdev_state *sd_state,
-			 unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&mt9t001->subdev, sd_state,
-						  pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &mt9t001->format;
-	default:
-		return NULL;
-	}
-}
-
-static struct v4l2_rect *
-__mt9t001_get_pad_crop(struct mt9t001 *mt9t001,
-		       struct v4l2_subdev_state *sd_state,
-		       unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	switch (which) {
-	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&mt9t001->subdev, sd_state,
-						pad);
-	case V4L2_SUBDEV_FORMAT_ACTIVE:
-		return &mt9t001->crop;
-	default:
-		return NULL;
-	}
-}
-
-static int mt9t001_s_stream(struct v4l2_subdev *subdev, int enable)
-{
-	const u16 mode = MT9T001_OUTPUT_CONTROL_CHIP_ENABLE;
-	struct i2c_client *client = v4l2_get_subdevdata(subdev);
-	struct mt9t001_platform_data *pdata = client->dev.platform_data;
-	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
-	struct v4l2_mbus_framefmt *format = &mt9t001->format;
-	struct v4l2_rect *crop = &mt9t001->crop;
-	unsigned int hratio;
-	unsigned int vratio;
-	int ret;
-
-	if (!enable)
-		return mt9t001_set_output_control(mt9t001, mode, 0);
-
-	/* Configure the pixel clock polarity */
-	if (pdata->clk_pol) {
-		ret  = mt9t001_write(client, MT9T001_PIXEL_CLOCK,
-				     MT9T001_PIXEL_CLOCK_INVERT);
-		if (ret < 0)
-			return ret;
-	}
-
-	/* Configure the window size and row/column bin */
-	hratio = DIV_ROUND_CLOSEST(crop->width, format->width);
-	vratio = DIV_ROUND_CLOSEST(crop->height, format->height);
-
-	ret = mt9t001_write(client, MT9T001_ROW_ADDRESS_MODE, hratio - 1);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9t001_write(client, MT9T001_COLUMN_ADDRESS_MODE, vratio - 1);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9t001_write(client, MT9T001_COLUMN_START, crop->left);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9t001_write(client, MT9T001_ROW_START, crop->top);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9t001_write(client, MT9T001_WINDOW_WIDTH, crop->width - 1);
-	if (ret < 0)
-		return ret;
-
-	ret = mt9t001_write(client, MT9T001_WINDOW_HEIGHT, crop->height - 1);
-	if (ret < 0)
-		return ret;
-
-	/* Switch to master "normal" mode */
-	return mt9t001_set_output_control(mt9t001, 0, mode);
-}
-
-static int mt9t001_enum_mbus_code(struct v4l2_subdev *subdev,
-				  struct v4l2_subdev_state *sd_state,
-				  struct v4l2_subdev_mbus_code_enum *code)
-{
-	if (code->index > 0)
-		return -EINVAL;
-
-	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
-	return 0;
-}
-
-static int mt9t001_enum_frame_size(struct v4l2_subdev *subdev,
-				   struct v4l2_subdev_state *sd_state,
-				   struct v4l2_subdev_frame_size_enum *fse)
-{
-	if (fse->index >= 8 || fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
-		return -EINVAL;
-
-	fse->min_width = (MT9T001_WINDOW_WIDTH_DEF + 1) / fse->index;
-	fse->max_width = fse->min_width;
-	fse->min_height = (MT9T001_WINDOW_HEIGHT_DEF + 1) / fse->index;
-	fse->max_height = fse->min_height;
-
-	return 0;
-}
-
-static int mt9t001_get_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *format)
-{
-	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
-
-	format->format = *__mt9t001_get_pad_format(mt9t001, sd_state,
-						   format->pad,
-						   format->which);
-	return 0;
-}
-
-static int mt9t001_set_format(struct v4l2_subdev *subdev,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *format)
-{
-	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
-	struct v4l2_mbus_framefmt *__format;
-	struct v4l2_rect *__crop;
-	unsigned int width;
-	unsigned int height;
-	unsigned int hratio;
-	unsigned int vratio;
-
-	__crop = __mt9t001_get_pad_crop(mt9t001, sd_state, format->pad,
-					format->which);
-
-	/* Clamp the width and height to avoid dividing by zero. */
-	width = clamp_t(unsigned int, ALIGN(format->format.width, 2),
-			max_t(unsigned int, __crop->width / 8,
-			      MT9T001_WINDOW_HEIGHT_MIN + 1),
-			__crop->width);
-	height = clamp_t(unsigned int, ALIGN(format->format.height, 2),
-			 max_t(unsigned int, __crop->height / 8,
-			       MT9T001_WINDOW_HEIGHT_MIN + 1),
-			 __crop->height);
-
-	hratio = DIV_ROUND_CLOSEST(__crop->width, width);
-	vratio = DIV_ROUND_CLOSEST(__crop->height, height);
-
-	__format = __mt9t001_get_pad_format(mt9t001, sd_state, format->pad,
-					    format->which);
-	__format->width = __crop->width / hratio;
-	__format->height = __crop->height / vratio;
-
-	format->format = *__format;
-
-	return 0;
-}
-
-static int mt9t001_get_selection(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_state *sd_state,
-				 struct v4l2_subdev_selection *sel)
-{
-	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
-
-	if (sel->target != V4L2_SEL_TGT_CROP)
-		return -EINVAL;
-
-	sel->r = *__mt9t001_get_pad_crop(mt9t001, sd_state, sel->pad,
-					 sel->which);
-	return 0;
-}
-
-static int mt9t001_set_selection(struct v4l2_subdev *subdev,
-				 struct v4l2_subdev_state *sd_state,
-				 struct v4l2_subdev_selection *sel)
-{
-	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
-	struct v4l2_mbus_framefmt *__format;
-	struct v4l2_rect *__crop;
-	struct v4l2_rect rect;
-
-	if (sel->target != V4L2_SEL_TGT_CROP)
-		return -EINVAL;
-
-	/* Clamp the crop rectangle boundaries and align them to a multiple of 2
-	 * pixels.
-	 */
-	rect.left = clamp(ALIGN(sel->r.left, 2),
-			  MT9T001_COLUMN_START_MIN,
-			  MT9T001_COLUMN_START_MAX);
-	rect.top = clamp(ALIGN(sel->r.top, 2),
-			 MT9T001_ROW_START_MIN,
-			 MT9T001_ROW_START_MAX);
-	rect.width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
-			     MT9T001_WINDOW_WIDTH_MIN + 1,
-			     MT9T001_WINDOW_WIDTH_MAX + 1);
-	rect.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
-			      MT9T001_WINDOW_HEIGHT_MIN + 1,
-			      MT9T001_WINDOW_HEIGHT_MAX + 1);
-
-	rect.width = min_t(unsigned int, rect.width,
-			   MT9T001_PIXEL_ARRAY_WIDTH - rect.left);
-	rect.height = min_t(unsigned int, rect.height,
-			    MT9T001_PIXEL_ARRAY_HEIGHT - rect.top);
-
-	__crop = __mt9t001_get_pad_crop(mt9t001, sd_state, sel->pad,
-					sel->which);
-
-	if (rect.width != __crop->width || rect.height != __crop->height) {
-		/* Reset the output image size if the crop rectangle size has
-		 * been modified.
-		 */
-		__format = __mt9t001_get_pad_format(mt9t001, sd_state,
-						    sel->pad,
-						    sel->which);
-		__format->width = rect.width;
-		__format->height = rect.height;
-	}
-
-	*__crop = rect;
-	sel->r = rect;
-
-	return 0;
-}
-
-/* -----------------------------------------------------------------------------
- * V4L2 subdev control operations
- */
-
-#define V4L2_CID_TEST_PATTERN_COLOR	(V4L2_CID_USER_BASE | 0x1001)
-#define V4L2_CID_BLACK_LEVEL_AUTO	(V4L2_CID_USER_BASE | 0x1002)
-#define V4L2_CID_BLACK_LEVEL_OFFSET	(V4L2_CID_USER_BASE | 0x1003)
-#define V4L2_CID_BLACK_LEVEL_CALIBRATE	(V4L2_CID_USER_BASE | 0x1004)
-
-#define V4L2_CID_GAIN_RED		(V4L2_CTRL_CLASS_CAMERA | 0x1001)
-#define V4L2_CID_GAIN_GREEN_RED		(V4L2_CTRL_CLASS_CAMERA | 0x1002)
-#define V4L2_CID_GAIN_GREEN_BLUE	(V4L2_CTRL_CLASS_CAMERA | 0x1003)
-#define V4L2_CID_GAIN_BLUE		(V4L2_CTRL_CLASS_CAMERA | 0x1004)
-
-static u16 mt9t001_gain_value(s32 *gain)
-{
-	/* Gain is controlled by 2 analog stages and a digital stage. Valid
-	 * values for the 3 stages are
-	 *
-	 * Stage		Min	Max	Step
-	 * ------------------------------------------
-	 * First analog stage	x1	x2	1
-	 * Second analog stage	x1	x4	0.125
-	 * Digital stage	x1	x16	0.125
-	 *
-	 * To minimize noise, the gain stages should be used in the second
-	 * analog stage, first analog stage, digital stage order. Gain from a
-	 * previous stage should be pushed to its maximum value before the next
-	 * stage is used.
-	 */
-	if (*gain <= 32)
-		return *gain;
-
-	if (*gain <= 64) {
-		*gain &= ~1;
-		return (1 << 6) | (*gain >> 1);
-	}
-
-	*gain &= ~7;
-	return ((*gain - 64) << 5) | (1 << 6) | 32;
-}
-
-static int mt9t001_ctrl_freeze(struct mt9t001 *mt9t001, bool freeze)
-{
-	return mt9t001_set_output_control(mt9t001,
-		freeze ? 0 : MT9T001_OUTPUT_CONTROL_SYNC,
-		freeze ? MT9T001_OUTPUT_CONTROL_SYNC : 0);
-}
-
-static int mt9t001_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	static const u8 gains[4] = {
-		MT9T001_RED_GAIN, MT9T001_GREEN1_GAIN,
-		MT9T001_GREEN2_GAIN, MT9T001_BLUE_GAIN
-	};
-
-	struct mt9t001 *mt9t001 =
-			container_of(ctrl->handler, struct mt9t001, ctrls);
-	struct i2c_client *client = v4l2_get_subdevdata(&mt9t001->subdev);
-	unsigned int count;
-	unsigned int i;
-	u16 value;
-	int ret;
-
-	switch (ctrl->id) {
-	case V4L2_CID_GAIN_RED:
-	case V4L2_CID_GAIN_GREEN_RED:
-	case V4L2_CID_GAIN_GREEN_BLUE:
-	case V4L2_CID_GAIN_BLUE:
-
-		/* Disable control updates if more than one control has changed
-		 * in the cluster.
-		 */
-		for (i = 0, count = 0; i < 4; ++i) {
-			struct v4l2_ctrl *gain = mt9t001->gains[i];
-
-			if (gain->val != gain->cur.val)
-				count++;
-		}
-
-		if (count > 1) {
-			ret = mt9t001_ctrl_freeze(mt9t001, true);
-			if (ret < 0)
-				return ret;
-		}
-
-		/* Update the gain controls. */
-		for (i = 0; i < 4; ++i) {
-			struct v4l2_ctrl *gain = mt9t001->gains[i];
-
-			if (gain->val == gain->cur.val)
-				continue;
-
-			value = mt9t001_gain_value(&gain->val);
-			ret = mt9t001_write(client, gains[i], value);
-			if (ret < 0) {
-				mt9t001_ctrl_freeze(mt9t001, false);
-				return ret;
-			}
-		}
-
-		/* Enable control updates. */
-		if (count > 1) {
-			ret = mt9t001_ctrl_freeze(mt9t001, false);
-			if (ret < 0)
-				return ret;
-		}
-
-		break;
-
-	case V4L2_CID_EXPOSURE:
-		ret = mt9t001_write(client, MT9T001_SHUTTER_WIDTH_LOW,
-				    ctrl->val & 0xffff);
-		if (ret < 0)
-			return ret;
-
-		return mt9t001_write(client, MT9T001_SHUTTER_WIDTH_HIGH,
-				     ctrl->val >> 16);
-
-	case V4L2_CID_TEST_PATTERN:
-		return mt9t001_set_output_control(mt9t001,
-			ctrl->val ? 0 : MT9T001_OUTPUT_CONTROL_TEST_DATA,
-			ctrl->val ? MT9T001_OUTPUT_CONTROL_TEST_DATA : 0);
-
-	case V4L2_CID_TEST_PATTERN_COLOR:
-		return mt9t001_write(client, MT9T001_TEST_DATA, ctrl->val << 2);
-
-	case V4L2_CID_BLACK_LEVEL_AUTO:
-		value = ctrl->val ? 0 : MT9T001_BLACK_LEVEL_OVERRIDE;
-		ret = mt9t001_write(client, MT9T001_BLACK_LEVEL_CALIBRATION,
-				    value);
-		if (ret < 0)
-			return ret;
-
-		mt9t001->black_level = value;
-		break;
-
-	case V4L2_CID_BLACK_LEVEL_OFFSET:
-		ret = mt9t001_write(client, MT9T001_GREEN1_OFFSET, ctrl->val);
-		if (ret < 0)
-			return ret;
-
-		ret = mt9t001_write(client, MT9T001_GREEN2_OFFSET, ctrl->val);
-		if (ret < 0)
-			return ret;
-
-		ret = mt9t001_write(client, MT9T001_RED_OFFSET, ctrl->val);
-		if (ret < 0)
-			return ret;
-
-		return mt9t001_write(client, MT9T001_BLUE_OFFSET, ctrl->val);
-
-	case V4L2_CID_BLACK_LEVEL_CALIBRATE:
-		return mt9t001_write(client, MT9T001_BLACK_LEVEL_CALIBRATION,
-				     MT9T001_BLACK_LEVEL_RECALCULATE |
-				     mt9t001->black_level);
-	}
-
-	return 0;
-}
-
-static const struct v4l2_ctrl_ops mt9t001_ctrl_ops = {
-	.s_ctrl = mt9t001_s_ctrl,
-};
-
-static const char * const mt9t001_test_pattern_menu[] = {
-	"Disabled",
-	"Enabled",
-};
-
-static const struct v4l2_ctrl_config mt9t001_ctrls[] = {
-	{
-		.ops		= &mt9t001_ctrl_ops,
-		.id		= V4L2_CID_TEST_PATTERN_COLOR,
-		.type		= V4L2_CTRL_TYPE_INTEGER,
-		.name		= "Test Pattern Color",
-		.min		= 0,
-		.max		= 1023,
-		.step		= 1,
-		.def		= 0,
-		.flags		= 0,
-	}, {
-		.ops		= &mt9t001_ctrl_ops,
-		.id		= V4L2_CID_BLACK_LEVEL_AUTO,
-		.type		= V4L2_CTRL_TYPE_BOOLEAN,
-		.name		= "Black Level, Auto",
-		.min		= 0,
-		.max		= 1,
-		.step		= 1,
-		.def		= 1,
-		.flags		= 0,
-	}, {
-		.ops		= &mt9t001_ctrl_ops,
-		.id		= V4L2_CID_BLACK_LEVEL_OFFSET,
-		.type		= V4L2_CTRL_TYPE_INTEGER,
-		.name		= "Black Level, Offset",
-		.min		= -256,
-		.max		= 255,
-		.step		= 1,
-		.def		= 32,
-		.flags		= 0,
-	}, {
-		.ops		= &mt9t001_ctrl_ops,
-		.id		= V4L2_CID_BLACK_LEVEL_CALIBRATE,
-		.type		= V4L2_CTRL_TYPE_BUTTON,
-		.name		= "Black Level, Calibrate",
-		.min		= 0,
-		.max		= 0,
-		.step		= 0,
-		.def		= 0,
-		.flags		= V4L2_CTRL_FLAG_WRITE_ONLY,
-	},
-};
-
-static const struct v4l2_ctrl_config mt9t001_gains[] = {
-	{
-		.ops		= &mt9t001_ctrl_ops,
-		.id		= V4L2_CID_GAIN_RED,
-		.type		= V4L2_CTRL_TYPE_INTEGER,
-		.name		= "Gain, Red",
-		.min		= MT9T001_GLOBAL_GAIN_MIN,
-		.max		= MT9T001_GLOBAL_GAIN_MAX,
-		.step		= 1,
-		.def		= MT9T001_GLOBAL_GAIN_MIN,
-		.flags		= 0,
-	}, {
-		.ops		= &mt9t001_ctrl_ops,
-		.id		= V4L2_CID_GAIN_GREEN_RED,
-		.type		= V4L2_CTRL_TYPE_INTEGER,
-		.name		= "Gain, Green (R)",
-		.min		= MT9T001_GLOBAL_GAIN_MIN,
-		.max		= MT9T001_GLOBAL_GAIN_MAX,
-		.step		= 1,
-		.def		= MT9T001_GLOBAL_GAIN_MIN,
-		.flags		= 0,
-	}, {
-		.ops		= &mt9t001_ctrl_ops,
-		.id		= V4L2_CID_GAIN_GREEN_BLUE,
-		.type		= V4L2_CTRL_TYPE_INTEGER,
-		.name		= "Gain, Green (B)",
-		.min		= MT9T001_GLOBAL_GAIN_MIN,
-		.max		= MT9T001_GLOBAL_GAIN_MAX,
-		.step		= 1,
-		.def		= MT9T001_GLOBAL_GAIN_MIN,
-		.flags		= 0,
-	}, {
-		.ops		= &mt9t001_ctrl_ops,
-		.id		= V4L2_CID_GAIN_BLUE,
-		.type		= V4L2_CTRL_TYPE_INTEGER,
-		.name		= "Gain, Blue",
-		.min		= MT9T001_GLOBAL_GAIN_MIN,
-		.max		= MT9T001_GLOBAL_GAIN_MAX,
-		.step		= 1,
-		.def		= MT9T001_GLOBAL_GAIN_MIN,
-		.flags		= 0,
-	},
-};
-
-/* -----------------------------------------------------------------------------
- * V4L2 subdev core operations
- */
-
-static int mt9t001_set_power(struct v4l2_subdev *subdev, int on)
-{
-	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
-	int ret = 0;
-
-	mutex_lock(&mt9t001->power_lock);
-
-	/* If the power count is modified from 0 to != 0 or from != 0 to 0,
-	 * update the power state.
-	 */
-	if (mt9t001->power_count == !on) {
-		ret = __mt9t001_set_power(mt9t001, !!on);
-		if (ret < 0)
-			goto out;
-	}
-
-	/* Update the power count. */
-	mt9t001->power_count += on ? 1 : -1;
-	WARN_ON(mt9t001->power_count < 0);
-
-out:
-	mutex_unlock(&mt9t001->power_lock);
-	return ret;
-}
-
-/* -----------------------------------------------------------------------------
- * V4L2 subdev internal operations
- */
-
-static int mt9t001_registered(struct v4l2_subdev *subdev)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(subdev);
-	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
-	s32 data;
-	int ret;
-
-	ret = mt9t001_power_on(mt9t001);
-	if (ret < 0) {
-		dev_err(&client->dev, "MT9T001 power up failed\n");
-		return ret;
-	}
-
-	/* Read out the chip version register */
-	data = mt9t001_read(client, MT9T001_CHIP_VERSION);
-	mt9t001_power_off(mt9t001);
-
-	if (data != MT9T001_CHIP_ID) {
-		dev_err(&client->dev,
-			"MT9T001 not detected, wrong version 0x%04x\n", data);
-		return -ENODEV;
-	}
-
-	dev_info(&client->dev, "MT9T001 detected at address 0x%02x\n",
-		 client->addr);
-
-	return 0;
-}
-
-static int mt9t001_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
-{
-	struct v4l2_mbus_framefmt *format;
-	struct v4l2_rect *crop;
-
-	crop = v4l2_subdev_get_try_crop(subdev, fh->state, 0);
-	crop->left = MT9T001_COLUMN_START_DEF;
-	crop->top = MT9T001_ROW_START_DEF;
-	crop->width = MT9T001_WINDOW_WIDTH_DEF + 1;
-	crop->height = MT9T001_WINDOW_HEIGHT_DEF + 1;
-
-	format = v4l2_subdev_get_try_format(subdev, fh->state, 0);
-	format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
-	format->width = MT9T001_WINDOW_WIDTH_DEF + 1;
-	format->height = MT9T001_WINDOW_HEIGHT_DEF + 1;
-	format->field = V4L2_FIELD_NONE;
-	format->colorspace = V4L2_COLORSPACE_SRGB;
-
-	return mt9t001_set_power(subdev, 1);
-}
-
-static int mt9t001_close(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
-{
-	return mt9t001_set_power(subdev, 0);
-}
-
-static const struct v4l2_subdev_core_ops mt9t001_subdev_core_ops = {
-	.s_power = mt9t001_set_power,
-};
-
-static const struct v4l2_subdev_video_ops mt9t001_subdev_video_ops = {
-	.s_stream = mt9t001_s_stream,
-};
-
-static const struct v4l2_subdev_pad_ops mt9t001_subdev_pad_ops = {
-	.enum_mbus_code = mt9t001_enum_mbus_code,
-	.enum_frame_size = mt9t001_enum_frame_size,
-	.get_fmt = mt9t001_get_format,
-	.set_fmt = mt9t001_set_format,
-	.get_selection = mt9t001_get_selection,
-	.set_selection = mt9t001_set_selection,
-};
-
-static const struct v4l2_subdev_ops mt9t001_subdev_ops = {
-	.core = &mt9t001_subdev_core_ops,
-	.video = &mt9t001_subdev_video_ops,
-	.pad = &mt9t001_subdev_pad_ops,
-};
-
-static const struct v4l2_subdev_internal_ops mt9t001_subdev_internal_ops = {
-	.registered = mt9t001_registered,
-	.open = mt9t001_open,
-	.close = mt9t001_close,
-};
-
-static int mt9t001_probe(struct i2c_client *client)
-{
-	struct mt9t001_platform_data *pdata = client->dev.platform_data;
-	struct mt9t001 *mt9t001;
-	unsigned int i;
-	int ret;
-
-	if (pdata == NULL) {
-		dev_err(&client->dev, "No platform data\n");
-		return -EINVAL;
-	}
-
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_WORD_DATA)) {
-		dev_warn(&client->adapter->dev,
-			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
-		return -EIO;
-	}
-
-	mt9t001 = devm_kzalloc(&client->dev, sizeof(*mt9t001), GFP_KERNEL);
-	if (!mt9t001)
-		return -ENOMEM;
-
-	mutex_init(&mt9t001->power_lock);
-	mt9t001->output_control = MT9T001_OUTPUT_CONTROL_DEF;
-
-	mt9t001->regulators[0].supply = "vdd";
-	mt9t001->regulators[1].supply = "vaa";
-
-	ret = devm_regulator_bulk_get(&client->dev, 2, mt9t001->regulators);
-	if (ret < 0) {
-		dev_err(&client->dev, "Unable to get regulators\n");
-		return ret;
-	}
-
-	mt9t001->clk = devm_clk_get(&client->dev, NULL);
-	if (IS_ERR(mt9t001->clk)) {
-		dev_err(&client->dev, "Unable to get clock\n");
-		return PTR_ERR(mt9t001->clk);
-	}
-
-	v4l2_ctrl_handler_init(&mt9t001->ctrls, ARRAY_SIZE(mt9t001_ctrls) +
-						ARRAY_SIZE(mt9t001_gains) + 4);
-
-	v4l2_ctrl_new_std(&mt9t001->ctrls, &mt9t001_ctrl_ops,
-			  V4L2_CID_EXPOSURE, MT9T001_SHUTTER_WIDTH_MIN,
-			  MT9T001_SHUTTER_WIDTH_MAX, 1,
-			  MT9T001_SHUTTER_WIDTH_DEF);
-	v4l2_ctrl_new_std(&mt9t001->ctrls, &mt9t001_ctrl_ops,
-			  V4L2_CID_BLACK_LEVEL, 1, 1, 1, 1);
-	v4l2_ctrl_new_std(&mt9t001->ctrls, &mt9t001_ctrl_ops,
-			  V4L2_CID_PIXEL_RATE, pdata->ext_clk, pdata->ext_clk,
-			  1, pdata->ext_clk);
-	v4l2_ctrl_new_std_menu_items(&mt9t001->ctrls, &mt9t001_ctrl_ops,
-			V4L2_CID_TEST_PATTERN,
-			ARRAY_SIZE(mt9t001_test_pattern_menu) - 1, 0,
-			0, mt9t001_test_pattern_menu);
-
-	for (i = 0; i < ARRAY_SIZE(mt9t001_ctrls); ++i)
-		v4l2_ctrl_new_custom(&mt9t001->ctrls, &mt9t001_ctrls[i], NULL);
-
-	for (i = 0; i < ARRAY_SIZE(mt9t001_gains); ++i)
-		mt9t001->gains[i] = v4l2_ctrl_new_custom(&mt9t001->ctrls,
-			&mt9t001_gains[i], NULL);
-
-	v4l2_ctrl_cluster(ARRAY_SIZE(mt9t001_gains), mt9t001->gains);
-
-	mt9t001->subdev.ctrl_handler = &mt9t001->ctrls;
-
-	if (mt9t001->ctrls.error) {
-		printk(KERN_INFO "%s: control initialization error %d\n",
-		       __func__, mt9t001->ctrls.error);
-		ret = -EINVAL;
-		goto done;
-	}
-
-	mt9t001->crop.left = MT9T001_COLUMN_START_DEF;
-	mt9t001->crop.top = MT9T001_ROW_START_DEF;
-	mt9t001->crop.width = MT9T001_WINDOW_WIDTH_DEF + 1;
-	mt9t001->crop.height = MT9T001_WINDOW_HEIGHT_DEF + 1;
-
-	mt9t001->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
-	mt9t001->format.width = MT9T001_WINDOW_WIDTH_DEF + 1;
-	mt9t001->format.height = MT9T001_WINDOW_HEIGHT_DEF + 1;
-	mt9t001->format.field = V4L2_FIELD_NONE;
-	mt9t001->format.colorspace = V4L2_COLORSPACE_SRGB;
-
-	v4l2_i2c_subdev_init(&mt9t001->subdev, client, &mt9t001_subdev_ops);
-	mt9t001->subdev.internal_ops = &mt9t001_subdev_internal_ops;
-	mt9t001->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-
-	mt9t001->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	mt9t001->pad.flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&mt9t001->subdev.entity, 1, &mt9t001->pad);
-
-done:
-	if (ret < 0) {
-		v4l2_ctrl_handler_free(&mt9t001->ctrls);
-		media_entity_cleanup(&mt9t001->subdev.entity);
-	}
-
-	return ret;
-}
-
-static void mt9t001_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct mt9t001 *mt9t001 = to_mt9t001(subdev);
-
-	v4l2_ctrl_handler_free(&mt9t001->ctrls);
-	v4l2_device_unregister_subdev(subdev);
-	media_entity_cleanup(&subdev->entity);
-}
-
-static const struct i2c_device_id mt9t001_id[] = {
-	{ "mt9t001", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, mt9t001_id);
-
-static struct i2c_driver mt9t001_driver = {
-	.driver = {
-		.name = "mt9t001",
-	},
-	.probe_new	= mt9t001_probe,
-	.remove		= mt9t001_remove,
-	.id_table	= mt9t001_id,
-};
-
-module_i2c_driver(mt9t001_driver);
-
-MODULE_DESCRIPTION("Aptina (Micron) MT9T001 Camera driver");
-MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
-MODULE_LICENSE("GPL");
diff --git a/include/media/i2c/mt9t001.h b/include/media/i2c/mt9t001.h
deleted file mode 100644
index 4b1090554270..000000000000
--- a/include/media/i2c/mt9t001.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _MEDIA_MT9T001_H
-#define _MEDIA_MT9T001_H
-
-struct mt9t001_platform_data {
-	unsigned int clk_pol:1;
-	unsigned int ext_clk;
-};
-
-#endif
-- 
Regards,

Laurent Pinchart

