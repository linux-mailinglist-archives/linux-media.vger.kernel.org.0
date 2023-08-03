Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC8576E4A5
	for <lists+linux-media@lfdr.de>; Thu,  3 Aug 2023 11:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235160AbjHCJh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Aug 2023 05:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235154AbjHCJgZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Aug 2023 05:36:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9306C30F9
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 02:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691055289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F93W0SzacRsHfFSLj5FPz0pSJmAK+0CS06fYAkGWhAs=;
        b=V623jPRjpIUclJ6/OMqp+YoOdqtY8JuVUSmNVJmOdwKruKGP50GAniyDSOZWOFPWOiDXQG
        L8f2sLptUeXwn1AnSl1eWLUbBA/q024KMrrM6X0DQdhgQ5HJ5GpVc1QaKkLyMWtS5LNB+3
        3HU1oaJnT4eS5/3yOXF/41pza1K27CE=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-t1v1CbYjOLGrlaQlZVKTGA-1; Thu, 03 Aug 2023 05:34:44 -0400
X-MC-Unique: t1v1CbYjOLGrlaQlZVKTGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DED851C04B63;
        Thu,  3 Aug 2023 09:34:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 41E072166B25;
        Thu,  3 Aug 2023 09:34:42 +0000 (UTC)
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
        linux-media@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v5 32/32] media: atomisp: Drop atomisp-ov2680 sensor driver
Date:   Thu,  3 Aug 2023 11:33:47 +0200
Message-ID: <20230803093348.15679-33-hdegoede@redhat.com>
In-Reply-To: <20230803093348.15679-1-hdegoede@redhat.com>
References: <20230803093348.15679-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After recent improvements to atomisp and the standard ov2680
sensor driver, the atomisp driver now works fine with
the standard ov2680 driver.

Drop the no longer necessary atomisp specific atomisp-ov2680
sensor driver.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/Kconfig     |  13 -
 drivers/staging/media/atomisp/i2c/Makefile    |   1 -
 .../media/atomisp/i2c/atomisp-ov2680.c        | 828 ------------------
 drivers/staging/media/atomisp/i2c/ov2680.h    | 173 ----
 4 files changed, 1015 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
 delete mode 100644 drivers/staging/media/atomisp/i2c/ov2680.h

diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index e34646d7dadc..2d4165cda2f1 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -57,19 +57,6 @@ config VIDEO_ATOMISP_GC0310
 	  This is a Video4Linux2 sensor-level driver for the Galaxycore
 	  GC0310 0.3MP sensor.
 
-config VIDEO_ATOMISP_OV2680
-	tristate "Omnivision OV2680 sensor support"
-	depends on ACPI
-	depends on I2C && VIDEO_DEV
-	select V4L2_CCI_I2C
-	help
-	  This is a Video4Linux2 sensor-level driver for the Omnivision
-	  OV2680 raw camera.
-
-	  ov2680 is a 2M raw sensor.
-
-	  It currently only works with the atomisp driver.
-
 config VIDEO_ATOMISP_OV5693
 	tristate "Omnivision ov5693 sensor support"
 	depends on ACPI
diff --git a/drivers/staging/media/atomisp/i2c/Makefile b/drivers/staging/media/atomisp/i2c/Makefile
index 8d022986e199..fc55af5f3422 100644
--- a/drivers/staging/media/atomisp/i2c/Makefile
+++ b/drivers/staging/media/atomisp/i2c/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_VIDEO_ATOMISP_OV5693)     += ov5693/
 obj-$(CONFIG_VIDEO_ATOMISP_MT9M114)    += atomisp-mt9m114.o
 obj-$(CONFIG_VIDEO_ATOMISP_GC2235)     += atomisp-gc2235.o
 obj-$(CONFIG_VIDEO_ATOMISP_OV2722)     += atomisp-ov2722.o
-obj-$(CONFIG_VIDEO_ATOMISP_OV2680)     += atomisp-ov2680.o
 obj-$(CONFIG_VIDEO_ATOMISP_GC0310)     += atomisp-gc0310.o
 
 obj-$(CONFIG_VIDEO_ATOMISP_MSRLIST_HELPER) += atomisp-libmsrlisthelper.o
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
deleted file mode 100644
index f933a65ac8d4..000000000000
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ /dev/null
@@ -1,828 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Support for OmniVision OV2680 1080p HD camera sensor.
- *
- * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
-
-#include <linux/acpi.h>
-#include <linux/device.h>
-#include <linux/gpio/consumer.h>
-#include <linux/gpio/machine.h>
-#include <linux/i2c.h>
-#include <linux/module.h>
-#include <linux/pm_runtime.h>
-#include <linux/regmap.h>
-#include <linux/types.h>
-
-#include <media/v4l2-device.h>
-
-#include "ov2680.h"
-
-#define OV2680_CHIP_ID				0x2680
-
-#define OV2680_REG_STREAM_CTRL			CCI_REG8(0x0100)
-#define OV2680_REG_SOFT_RESET			CCI_REG8(0x0103)
-
-#define OV2680_REG_CHIP_ID			CCI_REG16(0x300a)
-#define OV2680_REG_SC_CMMN_SUB_ID		CCI_REG8(0x302a)
-
-#define OV2680_REG_EXPOSURE_PK			CCI_REG24(0x3500)
-#define OV2680_REG_R_MANUAL			CCI_REG8(0x3503)
-#define OV2680_REG_GAIN_PK			CCI_REG16(0x350a)
-
-#define OV2680_REG_SENSOR_CTRL_0A		CCI_REG8(0x370a)
-
-#define OV2680_REG_HORIZONTAL_START		CCI_REG16(0x3800)
-#define OV2680_REG_VERTICAL_START		CCI_REG16(0x3802)
-#define OV2680_REG_HORIZONTAL_END		CCI_REG16(0x3804)
-#define OV2680_REG_VERTICAL_END			CCI_REG16(0x3806)
-#define OV2680_REG_HORIZONTAL_OUTPUT_SIZE	CCI_REG16(0x3808)
-#define OV2680_REG_VERTICAL_OUTPUT_SIZE		CCI_REG16(0x380a)
-#define OV2680_REG_TIMING_HTS			CCI_REG16(0x380c)
-#define OV2680_REG_TIMING_VTS			CCI_REG16(0x380e)
-#define OV2680_REG_ISP_X_WIN			CCI_REG16(0x3810)
-#define OV2680_REG_ISP_Y_WIN			CCI_REG16(0x3812)
-#define OV2680_REG_X_INC			CCI_REG8(0x3814)
-#define OV2680_REG_Y_INC			CCI_REG8(0x3815)
-#define OV2680_REG_FORMAT1			CCI_REG8(0x3820)
-#define OV2680_REG_FORMAT2			CCI_REG8(0x3821)
-
-#define OV2680_REG_ISP_CTRL00			CCI_REG8(0x5080)
-
-#define OV2680_REG_X_WIN			CCI_REG16(0x5704)
-#define OV2680_REG_Y_WIN			CCI_REG16(0x5706)
-
-#define OV2680_FRAME_RATE			30
-#define OV2680_INTEGRATION_TIME_MARGIN		8
-
-static const struct v4l2_rect ov2680_default_crop = {
-	.left = OV2680_ACTIVE_START_LEFT,
-	.top = OV2680_ACTIVE_START_TOP,
-	.width = OV2680_ACTIVE_WIDTH,
-	.height = OV2680_ACTIVE_HEIGHT,
-};
-
-static void ov2680_set_bayer_order(struct ov2680_dev *sensor, struct v4l2_mbus_framefmt *fmt)
-{
-	static const int ov2680_hv_flip_bayer_order[] = {
-		MEDIA_BUS_FMT_SBGGR10_1X10,
-		MEDIA_BUS_FMT_SGRBG10_1X10,
-		MEDIA_BUS_FMT_SGBRG10_1X10,
-		MEDIA_BUS_FMT_SRGGB10_1X10,
-	};
-	int hv_flip = 0;
-
-	if (sensor->ctrls.vflip->val)
-		hv_flip += 1;
-
-	if (sensor->ctrls.hflip->val)
-		hv_flip += 2;
-
-	fmt->code = ov2680_hv_flip_bayer_order[hv_flip];
-}
-
-static int ov2680_set_vflip(struct ov2680_dev *sensor, s32 val)
-{
-	int ret;
-
-	if (sensor->is_streaming)
-		return -EBUSY;
-
-	ret = cci_update_bits(sensor->regmap, OV2680_REG_FORMAT1, BIT(2),
-			      val ? BIT(2) : 0, NULL);
-	if (ret < 0)
-		return ret;
-
-	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
-	return 0;
-}
-
-static int ov2680_set_hflip(struct ov2680_dev *sensor, s32 val)
-{
-	int ret;
-
-	if (sensor->is_streaming)
-		return -EBUSY;
-
-	ret = cci_update_bits(sensor->regmap, OV2680_REG_FORMAT2, BIT(2),
-			      val ? BIT(2) : 0, NULL);
-	if (ret < 0)
-		return ret;
-
-	ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
-	return 0;
-}
-
-static int ov2680_exposure_set(struct ov2680_dev *sensor, u32 exp)
-{
-	return cci_write(sensor->regmap, OV2680_REG_EXPOSURE_PK, exp << 4,
-			 NULL);
-}
-
-static int ov2680_gain_set(struct ov2680_dev *sensor, u32 gain)
-{
-	return cci_write(sensor->regmap, OV2680_REG_GAIN_PK, gain, NULL);
-}
-
-static int ov2680_test_pattern_set(struct ov2680_dev *sensor, int value)
-{
-	int ret = 0;
-
-	if (!value)
-		return cci_update_bits(sensor->regmap, OV2680_REG_ISP_CTRL00,
-				       BIT(7), 0, NULL);
-
-	cci_update_bits(sensor->regmap, OV2680_REG_ISP_CTRL00, 0x03, value - 1,
-			&ret);
-	cci_update_bits(sensor->regmap, OV2680_REG_ISP_CTRL00, BIT(7), BIT(7),
-			&ret);
-
-	return ret;
-}
-
-static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-	int ret;
-
-	/* Only apply changes to the controls if the device is powered up */
-	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
-		ov2680_set_bayer_order(sensor, &sensor->mode.fmt);
-		return 0;
-	}
-
-	switch (ctrl->id) {
-	case V4L2_CID_VFLIP:
-		ret = ov2680_set_vflip(sensor, ctrl->val);
-		break;
-	case V4L2_CID_HFLIP:
-		ret = ov2680_set_hflip(sensor, ctrl->val);
-		break;
-	case V4L2_CID_EXPOSURE:
-		ret = ov2680_exposure_set(sensor, ctrl->val);
-		break;
-	case V4L2_CID_GAIN:
-		ret = ov2680_gain_set(sensor, ctrl->val);
-		break;
-	case V4L2_CID_TEST_PATTERN:
-		ret = ov2680_test_pattern_set(sensor, ctrl->val);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	pm_runtime_put(sensor->sd.dev);
-	return ret;
-}
-
-static const struct v4l2_ctrl_ops ov2680_ctrl_ops = {
-	.s_ctrl = ov2680_s_ctrl,
-};
-
-static int ov2680_init_registers(struct v4l2_subdev *sd)
-{
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-	int ret;
-
-	ret = cci_write(sensor->regmap, OV2680_REG_SOFT_RESET, 0x01, NULL);
-	if (ret < 0)
-		return ret;
-
-	/* Wait for sensor reset */
-	usleep_range(1000, 2000);
-
-	return regmap_multi_reg_write(sensor->regmap, ov2680_global_setting,
-				      ARRAY_SIZE(ov2680_global_setting));
-}
-
-static struct v4l2_mbus_framefmt *
-__ov2680_get_pad_format(struct ov2680_dev *sensor, struct v4l2_subdev_state *state,
-			unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&sensor->sd, state, pad);
-
-	return &sensor->mode.fmt;
-}
-
-static struct v4l2_rect *
-__ov2680_get_pad_crop(struct ov2680_dev *sensor, struct v4l2_subdev_state *state,
-		      unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
-
-	return &sensor->mode.crop;
-}
-
-static void ov2680_fill_format(struct ov2680_dev *sensor,
-			       struct v4l2_mbus_framefmt *fmt,
-			       unsigned int width, unsigned int height)
-{
-	memset(fmt, 0, sizeof(*fmt));
-	fmt->width = width;
-	fmt->height = height;
-	fmt->field = V4L2_FIELD_NONE;
-	ov2680_set_bayer_order(sensor, fmt);
-}
-
-static void ov2680_calc_mode(struct ov2680_dev *sensor)
-{
-	int width = sensor->mode.fmt.width;
-	int height = sensor->mode.fmt.height;
-	int orig_width = width;
-	int orig_height = height;
-
-	if (width  <= (sensor->mode.crop.width / 2) &&
-	    height <= (sensor->mode.crop.height / 2)) {
-		sensor->mode.binning = true;
-		width *= 2;
-		height *= 2;
-	} else {
-		sensor->mode.binning = false;
-	}
-
-	sensor->mode.h_start =
-		(sensor->mode.crop.left + (sensor->mode.crop.width - width) / 2) & ~1;
-	sensor->mode.v_start =
-		(sensor->mode.crop.top + (sensor->mode.crop.height - height) / 2) & ~1;
-	sensor->mode.h_end = min(sensor->mode.h_start + width + OV2680_END_MARGIN - 1,
-				 OV2680_NATIVE_WIDTH - 1);
-	sensor->mode.v_end = min(sensor->mode.v_start + height + OV2680_END_MARGIN - 1,
-				 OV2680_NATIVE_HEIGHT - 1);
-	sensor->mode.h_output_size = orig_width;
-	sensor->mode.v_output_size = orig_height;
-	sensor->mode.hts = OV2680_PIXELS_PER_LINE;
-	sensor->mode.vts = OV2680_LINES_PER_FRAME;
-}
-
-static int ov2680_set_mode(struct ov2680_dev *sensor)
-{
-	u8 sensor_ctrl_0a, inc, fmt1, fmt2;
-	int ret = 0;
-
-	if (sensor->mode.binning) {
-		sensor_ctrl_0a = 0x23;
-		inc = 0x31;
-		fmt1 = 0xc2;
-		fmt2 = 0x01;
-	} else {
-		sensor_ctrl_0a = 0x21;
-		inc = 0x11;
-		fmt1 = 0xc0;
-		fmt2 = 0x00;
-	}
-
-	cci_write(sensor->regmap, OV2680_REG_SENSOR_CTRL_0A,
-		  sensor_ctrl_0a, &ret);
-	cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_START,
-		  sensor->mode.h_start, &ret);
-	cci_write(sensor->regmap, OV2680_REG_VERTICAL_START,
-		  sensor->mode.v_start, &ret);
-	cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_END,
-		  sensor->mode.h_end, &ret);
-	cci_write(sensor->regmap, OV2680_REG_VERTICAL_END,
-		  sensor->mode.v_end, &ret);
-	cci_write(sensor->regmap, OV2680_REG_HORIZONTAL_OUTPUT_SIZE,
-		  sensor->mode.h_output_size, &ret);
-	cci_write(sensor->regmap, OV2680_REG_VERTICAL_OUTPUT_SIZE,
-		  sensor->mode.v_output_size, &ret);
-	cci_write(sensor->regmap, OV2680_REG_TIMING_HTS,
-		  sensor->mode.hts, &ret);
-	cci_write(sensor->regmap, OV2680_REG_TIMING_VTS,
-		  sensor->mode.vts, &ret);
-	cci_write(sensor->regmap, OV2680_REG_ISP_X_WIN, 0, &ret);
-	cci_write(sensor->regmap, OV2680_REG_ISP_Y_WIN, 0, &ret);
-	cci_write(sensor->regmap, OV2680_REG_X_INC, inc, &ret);
-	cci_write(sensor->regmap, OV2680_REG_Y_INC, inc, &ret);
-	cci_write(sensor->regmap, OV2680_REG_X_WIN,
-		  sensor->mode.h_output_size, &ret);
-	cci_write(sensor->regmap, OV2680_REG_Y_WIN,
-		  sensor->mode.v_output_size, &ret);
-	cci_write(sensor->regmap, OV2680_REG_FORMAT1, fmt1, &ret);
-	cci_write(sensor->regmap, OV2680_REG_FORMAT2, fmt2, &ret);
-
-	return ret;
-}
-
-static int ov2680_set_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *format)
-{
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-	struct v4l2_mbus_framefmt *fmt;
-	const struct v4l2_rect *crop;
-	unsigned int width, height;
-
-	crop = __ov2680_get_pad_crop(sensor, sd_state, format->pad, format->which);
-
-	/* Limit set_fmt max size to crop width / height */
-	width = clamp_t(unsigned int, ALIGN(format->format.width, 2),
-			OV2680_MIN_CROP_WIDTH, crop->width);
-	height = clamp_t(unsigned int, ALIGN(format->format.height, 2),
-			 OV2680_MIN_CROP_HEIGHT, crop->height);
-
-	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
-	ov2680_fill_format(sensor, fmt, width, height);
-
-	format->format = *fmt;
-
-	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		return 0;
-
-	mutex_lock(&sensor->lock);
-	ov2680_calc_mode(sensor);
-	mutex_unlock(&sensor->lock);
-	return 0;
-}
-
-static int ov2680_get_fmt(struct v4l2_subdev *sd,
-			  struct v4l2_subdev_state *sd_state,
-			  struct v4l2_subdev_format *format)
-{
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-	struct v4l2_mbus_framefmt *fmt;
-
-	fmt = __ov2680_get_pad_format(sensor, sd_state, format->pad, format->which);
-	format->format = *fmt;
-	return 0;
-}
-
-static int ov2680_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *state,
-				struct v4l2_subdev_selection *sel)
-{
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-
-	switch (sel->target) {
-	case V4L2_SEL_TGT_CROP:
-		mutex_lock(&sensor->lock);
-		sel->r = *__ov2680_get_pad_crop(sensor, state, sel->pad, sel->which);
-		mutex_unlock(&sensor->lock);
-		break;
-	case V4L2_SEL_TGT_NATIVE_SIZE:
-	case V4L2_SEL_TGT_CROP_BOUNDS:
-		sel->r.top = 0;
-		sel->r.left = 0;
-		sel->r.width = OV2680_NATIVE_WIDTH;
-		sel->r.height = OV2680_NATIVE_HEIGHT;
-		break;
-	case V4L2_SEL_TGT_CROP_DEFAULT:
-		sel->r.top = OV2680_ACTIVE_START_TOP;
-		sel->r.left = OV2680_ACTIVE_START_LEFT;
-		sel->r.width = OV2680_ACTIVE_WIDTH;
-		sel->r.height = OV2680_ACTIVE_HEIGHT;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int ov2680_set_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *state,
-				struct v4l2_subdev_selection *sel)
-{
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-	struct v4l2_mbus_framefmt *format;
-	struct v4l2_rect *__crop;
-	struct v4l2_rect rect;
-
-	if (sel->target != V4L2_SEL_TGT_CROP)
-		return -EINVAL;
-
-	/*
-	 * Clamp the boundaries of the crop rectangle to the size of the sensor
-	 * pixel array. Align to multiples of 2 to ensure Bayer pattern isn't
-	 * disrupted.
-	 */
-	rect.left = clamp(ALIGN(sel->r.left, 2), OV2680_NATIVE_START_LEFT,
-			  OV2680_NATIVE_WIDTH);
-	rect.top = clamp(ALIGN(sel->r.top, 2), OV2680_NATIVE_START_TOP,
-			 OV2680_NATIVE_HEIGHT);
-	rect.width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
-			     OV2680_MIN_CROP_WIDTH, OV2680_NATIVE_WIDTH);
-	rect.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
-			      OV2680_MIN_CROP_HEIGHT, OV2680_NATIVE_HEIGHT);
-
-	/* Make sure the crop rectangle isn't outside the bounds of the array */
-	rect.width = min_t(unsigned int, rect.width,
-			   OV2680_NATIVE_WIDTH - rect.left);
-	rect.height = min_t(unsigned int, rect.height,
-			    OV2680_NATIVE_HEIGHT - rect.top);
-
-	__crop = __ov2680_get_pad_crop(sensor, state, sel->pad, sel->which);
-
-	if (rect.width != __crop->width || rect.height != __crop->height) {
-		/*
-		 * Reset the output image size if the crop rectangle size has
-		 * been modified.
-		 */
-		format = __ov2680_get_pad_format(sensor, state, sel->pad, sel->which);
-		format->width = rect.width;
-		format->height = rect.height;
-	}
-
-	*__crop = rect;
-	sel->r = rect;
-
-	return 0;
-}
-
-static int ov2680_init_cfg(struct v4l2_subdev *sd,
-			   struct v4l2_subdev_state *sd_state)
-{
-	struct v4l2_subdev_format fmt = {
-		.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-		: V4L2_SUBDEV_FORMAT_ACTIVE,
-		.format = {
-			.width = 800,
-			.height = 600,
-		},
-	};
-
-	sd_state->pads[0].try_crop = ov2680_default_crop;
-
-	return ov2680_set_fmt(sd, sd_state, &fmt);
-}
-
-static int ov2680_detect(struct ov2680_dev *sensor)
-{
-	u64 chip_id, rev;
-	int ret = 0;
-
-	cci_read(sensor->regmap, OV2680_REG_CHIP_ID, &chip_id, &ret);
-	cci_read(sensor->regmap, OV2680_REG_SC_CMMN_SUB_ID, &rev, &ret);
-	if (ret < 0) {
-		dev_err(sensor->dev, "failed to read chip id\n");
-		return -ENODEV;
-	}
-
-	if (chip_id != OV2680_CHIP_ID) {
-		dev_err(sensor->dev, "chip id: 0x%04llx does not match expected 0x%04x\n",
-			chip_id, OV2680_CHIP_ID);
-		return -ENODEV;
-	}
-
-	dev_info(sensor->dev, "sensor_revision id = 0x%llx, rev= %lld\n",
-		 chip_id, rev & 0x0f);
-
-	return 0;
-}
-
-static int ov2680_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret = 0;
-
-	mutex_lock(&sensor->lock);
-
-	if (sensor->is_streaming == enable) {
-		dev_warn(&client->dev, "stream already %s\n", enable ? "started" : "stopped");
-		goto error_unlock;
-	}
-
-	if (enable) {
-		ret = pm_runtime_get_sync(sensor->sd.dev);
-		if (ret < 0)
-			goto error_power_down;
-
-		ret = ov2680_set_mode(sensor);
-		if (ret)
-			goto error_power_down;
-
-		/* Restore value of all ctrls */
-		ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
-		if (ret)
-			goto error_power_down;
-
-		ret = cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 1,
-				NULL);
-		if (ret)
-			goto error_power_down;
-	} else {
-		cci_write(sensor->regmap, OV2680_REG_STREAM_CTRL, 0, NULL);
-		pm_runtime_put(sensor->sd.dev);
-	}
-
-	sensor->is_streaming = enable;
-	v4l2_ctrl_activate(sensor->ctrls.vflip, !enable);
-	v4l2_ctrl_activate(sensor->ctrls.hflip, !enable);
-
-	mutex_unlock(&sensor->lock);
-	return 0;
-
-error_power_down:
-	pm_runtime_put(sensor->sd.dev);
-	sensor->is_streaming = false;
-error_unlock:
-	mutex_unlock(&sensor->lock);
-	return ret;
-}
-
-static int ov2680_s_config(struct v4l2_subdev *sd)
-{
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = pm_runtime_get_sync(&client->dev);
-	if (ret < 0) {
-		dev_err(&client->dev, "ov2680 power-up err.\n");
-		goto fail_power_on;
-	}
-
-	/* config & detect sensor */
-	ret = ov2680_detect(sensor);
-	if (ret)
-		dev_err(&client->dev, "ov2680_detect err s_config.\n");
-
-fail_power_on:
-	pm_runtime_put(&client->dev);
-	return ret;
-}
-
-static int ov2680_g_frame_interval(struct v4l2_subdev *sd,
-				   struct v4l2_subdev_frame_interval *interval)
-{
-	interval->interval.numerator = 1;
-	interval->interval.denominator = OV2680_FRAME_RATE;
-	return 0;
-}
-
-static int ov2680_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
-				 struct v4l2_subdev_mbus_code_enum *code)
-{
-	/* We support only a single format */
-	if (code->index)
-		return -EINVAL;
-
-	code->code = MEDIA_BUS_FMT_SBGGR10_1X10;
-	return 0;
-}
-
-static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_state *sd_state,
-				  struct v4l2_subdev_frame_size_enum *fse)
-{
-	static const struct v4l2_frmsize_discrete ov2680_frame_sizes[] = {
-		{ 1616, 1216 },
-		{ 1616, 1096 },
-		{ 1616,  916 },
-		{ 1456, 1096 },
-		{ 1296,  976 },
-		{ 1296,  736 },
-		{  784,  592 },
-		{  656,  496 },
-	};
-	int index = fse->index;
-
-	if (index >= ARRAY_SIZE(ov2680_frame_sizes))
-		return -EINVAL;
-
-	fse->min_width = ov2680_frame_sizes[index].width;
-	fse->min_height = ov2680_frame_sizes[index].height;
-	fse->max_width = ov2680_frame_sizes[index].width;
-	fse->max_height = ov2680_frame_sizes[index].height;
-
-	return 0;
-}
-
-static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
-				      struct v4l2_subdev_state *sd_state,
-				      struct v4l2_subdev_frame_interval_enum *fie)
-{
-	/* Only 1 framerate */
-	if (fie->index)
-		return -EINVAL;
-
-	fie->interval.numerator = 1;
-	fie->interval.denominator = OV2680_FRAME_RATE;
-	return 0;
-}
-
-static int ov2680_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
-{
-	*frames = OV2680_SKIP_FRAMES;
-	return 0;
-}
-
-static const struct v4l2_subdev_video_ops ov2680_video_ops = {
-	.s_stream = ov2680_s_stream,
-	.g_frame_interval = ov2680_g_frame_interval,
-};
-
-static const struct v4l2_subdev_sensor_ops ov2680_sensor_ops = {
-	.g_skip_frames	= ov2680_g_skip_frames,
-};
-
-static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
-	.init_cfg = ov2680_init_cfg,
-	.enum_mbus_code = ov2680_enum_mbus_code,
-	.enum_frame_size = ov2680_enum_frame_size,
-	.enum_frame_interval = ov2680_enum_frame_interval,
-	.get_fmt = ov2680_get_fmt,
-	.set_fmt = ov2680_set_fmt,
-	.get_selection = ov2680_get_selection,
-	.set_selection = ov2680_set_selection,
-};
-
-static const struct v4l2_subdev_ops ov2680_ops = {
-	.video = &ov2680_video_ops,
-	.pad = &ov2680_pad_ops,
-	.sensor = &ov2680_sensor_ops,
-};
-
-static int ov2680_init_controls(struct ov2680_dev *sensor)
-{
-	static const char * const test_pattern_menu[] = {
-		"Disabled",
-		"Color Bars",
-		"Random Data",
-		"Square",
-		"Black Image",
-	};
-	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
-	struct ov2680_ctrls *ctrls = &sensor->ctrls;
-	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
-	int exp_max = OV2680_LINES_PER_FRAME - OV2680_INTEGRATION_TIME_MARGIN;
-
-	v4l2_ctrl_handler_init(hdl, 4);
-
-	hdl->lock = &sensor->lock;
-
-	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
-					    0, exp_max, 1, exp_max);
-	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN, 0, 1023, 1, 250);
-	ctrls->test_pattern =
-		v4l2_ctrl_new_std_menu_items(hdl,
-					     &ov2680_ctrl_ops, V4L2_CID_TEST_PATTERN,
-					     ARRAY_SIZE(test_pattern_menu) - 1,
-					     0, 0, test_pattern_menu);
-
-	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
-	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
-
-	if (hdl->error)
-		return hdl->error;
-
-	sensor->sd.ctrl_handler = hdl;
-	return 0;
-}
-
-static void ov2680_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-
-	dev_dbg(&client->dev, "ov2680_remove...\n");
-
-	v4l2_async_unregister_subdev(&sensor->sd);
-	media_entity_cleanup(&sensor->sd.entity);
-	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
-	mutex_destroy(&sensor->lock);
-	fwnode_handle_put(sensor->ep_fwnode);
-	pm_runtime_disable(&client->dev);
-}
-
-static int ov2680_probe(struct i2c_client *client)
-{
-	struct device *dev = &client->dev;
-	struct ov2680_dev *sensor;
-	int ret;
-
-	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
-	if (!sensor)
-		return -ENOMEM;
-
-	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
-	if (IS_ERR(sensor->regmap))
-		return PTR_ERR(sensor->regmap);
-
-	mutex_init(&sensor->lock);
-
-	sensor->dev = &client->dev;
-	v4l2_i2c_subdev_init(&sensor->sd, client, &ov2680_ops);
-
-	/*
-	 * Sometimes the fwnode graph is initialized by the bridge driver.
-	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
-	 */
-	sensor->ep_fwnode = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
-	if (!sensor->ep_fwnode)
-		return dev_err_probe(dev, -EPROBE_DEFER, "waiting for fwnode graph endpoint\n");
-
-	sensor->powerdown = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
-	if (IS_ERR(sensor->powerdown)) {
-		fwnode_handle_put(sensor->ep_fwnode);
-		return dev_err_probe(dev, PTR_ERR(sensor->powerdown), "getting powerdown GPIO\n");
-	}
-
-	pm_runtime_set_suspended(dev);
-	pm_runtime_enable(dev);
-	pm_runtime_set_autosuspend_delay(dev, 1000);
-	pm_runtime_use_autosuspend(dev);
-
-	ret = ov2680_s_config(&sensor->sd);
-	if (ret) {
-		ov2680_remove(client);
-		return ret;
-	}
-
-	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
-	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
-	sensor->sd.fwnode = sensor->ep_fwnode;
-
-	ret = ov2680_init_controls(sensor);
-	if (ret) {
-		ov2680_remove(client);
-		return ret;
-	}
-
-	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
-	if (ret) {
-		ov2680_remove(client);
-		return ret;
-	}
-
-	sensor->mode.crop = ov2680_default_crop;
-	ov2680_fill_format(sensor, &sensor->mode.fmt, OV2680_NATIVE_WIDTH, OV2680_NATIVE_HEIGHT);
-	ov2680_calc_mode(sensor);
-
-	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
-	if (ret) {
-		ov2680_remove(client);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov2680_suspend(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-
-	gpiod_set_value_cansleep(sensor->powerdown, 1);
-	return 0;
-}
-
-static int ov2680_resume(struct device *dev)
-{
-	struct v4l2_subdev *sd = dev_get_drvdata(dev);
-	struct ov2680_dev *sensor = to_ov2680_sensor(sd);
-
-	/* according to DS, at least 5ms is needed after DOVDD (enabled by ACPI) */
-	usleep_range(5000, 6000);
-
-	gpiod_set_value_cansleep(sensor->powerdown, 0);
-
-	/* according to DS, 20ms is needed between PWDN and i2c access */
-	msleep(20);
-
-	ov2680_init_registers(sd);
-	return 0;
-}
-
-static DEFINE_RUNTIME_DEV_PM_OPS(ov2680_pm_ops, ov2680_suspend, ov2680_resume, NULL);
-
-static const struct acpi_device_id ov2680_acpi_match[] = {
-	{"XXOV2680"},
-	{"OVTI2680"},
-	{},
-};
-MODULE_DEVICE_TABLE(acpi, ov2680_acpi_match);
-
-static struct i2c_driver ov2680_driver = {
-	.driver = {
-		.name = "ov2680",
-		.pm = pm_sleep_ptr(&ov2680_pm_ops),
-		.acpi_match_table = ov2680_acpi_match,
-	},
-	.probe = ov2680_probe,
-	.remove = ov2680_remove,
-};
-module_i2c_driver(ov2680_driver);
-
-MODULE_AUTHOR("Jacky Wang <Jacky_wang@ovt.com>");
-MODULE_DESCRIPTION("A low-level driver for OmniVision 2680 sensors");
-MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
deleted file mode 100644
index 7815522724f7..000000000000
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ /dev/null
@@ -1,173 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Support for OmniVision OV2680 5M camera sensor.
- *
- * Copyright (c) 2013 Intel Corporation. All Rights Reserved.
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- *
- */
-
-#ifndef __OV2680_H__
-#define __OV2680_H__
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/i2c.h>
-#include <linux/delay.h>
-#include <linux/videodev2.h>
-#include <linux/spinlock.h>
-#include <media/v4l2-cci.h>
-#include <media/v4l2-subdev.h>
-#include <media/v4l2-device.h>
-#include <media/v4l2-ctrls.h>
-#include <linux/v4l2-mediabus.h>
-#include <media/media-entity.h>
-
-#define OV2680_NATIVE_WIDTH			1616
-#define OV2680_NATIVE_HEIGHT			1216
-#define OV2680_NATIVE_START_LEFT		0
-#define OV2680_NATIVE_START_TOP			0
-#define OV2680_ACTIVE_WIDTH			1600
-#define OV2680_ACTIVE_HEIGHT			1200
-#define OV2680_ACTIVE_START_LEFT		8
-#define OV2680_ACTIVE_START_TOP			8
-#define OV2680_MIN_CROP_WIDTH			2
-#define OV2680_MIN_CROP_HEIGHT			2
-
-/* 1704 * 1294 * 30fps = 66MHz pixel clock */
-#define OV2680_PIXELS_PER_LINE			1704
-#define OV2680_LINES_PER_FRAME			1294
-
-#define OV2680_SKIP_FRAMES			3
-
-/* If possible send 16 extra rows / lines to the ISP as padding */
-#define OV2680_END_MARGIN			16
-
-/*
- * ov2680 device structure.
- */
-struct ov2680_dev {
-	struct v4l2_subdev sd;
-	struct media_pad pad;
-	/* Protect against concurrent changes to controls */
-	struct mutex lock;
-	struct device *dev;
-	struct regmap *regmap;
-	struct gpio_desc *powerdown;
-	struct fwnode_handle *ep_fwnode;
-	bool is_streaming;
-
-	struct ov2680_mode {
-		struct v4l2_rect crop;
-		struct v4l2_mbus_framefmt fmt;
-		bool binning;
-		u16 h_start;
-		u16 v_start;
-		u16 h_end;
-		u16 v_end;
-		u16 h_output_size;
-		u16 v_output_size;
-		u16 hts;
-		u16 vts;
-	} mode;
-
-	struct ov2680_ctrls {
-		struct v4l2_ctrl_handler handler;
-		struct v4l2_ctrl *hflip;
-		struct v4l2_ctrl *vflip;
-		struct v4l2_ctrl *exposure;
-		struct v4l2_ctrl *gain;
-		struct v4l2_ctrl *test_pattern;
-	} ctrls;
-};
-
-#define to_ov2680_sensor(x) container_of(x, struct ov2680_dev, sd)
-
-static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
-{
-	struct ov2680_dev *sensor =
-		container_of(ctrl->handler, struct ov2680_dev, ctrls.handler);
-
-	return &sensor->sd;
-}
-
-static const struct reg_sequence ov2680_global_setting[] = {
-	/* MIPI PHY, 0x10 -> 0x1c enable bp_c_hs_en_lat and bp_d_hs_en_lat */
-	{0x3016, 0x1c},
-
-	/* PLL MULT bits 0-7, datasheet default 0x37 for 24MHz extclk, use 0x45 for 19.2 Mhz extclk */
-	{0x3082, 0x45},
-
-	/* R MANUAL set exposure (0x01) and gain (0x02) to manual (hw does not do auto) */
-	{0x3503, 0x03},
-
-	/* Analog control register tweaks */
-	{0x3603, 0x39}, /* Reset value 0x99 */
-	{0x3604, 0x24}, /* Reset value 0x74 */
-	{0x3621, 0x37}, /* Reset value 0x44 */
-
-	/* Sensor control register tweaks */
-	{0x3701, 0x64}, /* Reset value 0x61 */
-	{0x3705, 0x3c}, /* Reset value 0x21 */
-	{0x370c, 0x50}, /* Reset value 0x10 */
-	{0x370d, 0xc0}, /* Reset value 0x00 */
-	{0x3718, 0x88}, /* Reset value 0x80 */
-
-	/* PSRAM tweaks */
-	{0x3781, 0x80}, /* Reset value 0x00 */
-	{0x3784, 0x0c}, /* Reset value 0x00, based on OV2680_R1A_AM10.ovt */
-	{0x3789, 0x60}, /* Reset value 0x50 */
-
-	/* BLC CTRL00 0x01 -> 0x81 set avg_weight to 8 */
-	{0x4000, 0x81},
-
-	/* Set black level compensation range to 0 - 3 (default 0 - 11) */
-	{0x4008, 0x00},
-	{0x4009, 0x03},
-
-	/* VFIFO R2 0x00 -> 0x02 set Frame reset enable */
-	{0x4602, 0x02},
-
-	/* MIPI ctrl CLK PREPARE MIN change from 0x26 (38) -> 0x36 (54) */
-	{0x481f, 0x36},
-
-	/* MIPI ctrl CLK LPX P MIN change from 0x32 (50) -> 0x36 (54) */
-	{0x4825, 0x36},
-
-	/* R ISP CTRL2 0x20 -> 0x30, set sof_sel bit */
-	{0x5002, 0x30},
-
-	/*
-	 * Window CONTROL 0x00 -> 0x01, enable manual window control,
-	 * this is necessary for full size flip and mirror support.
-	 */
-	{0x5708, 0x01},
-
-	/*
-	 * DPC CTRL0 0x14 -> 0x3e, set enable_tail, enable_3x3_cluster
-	 * and enable_general_tail bits based OV2680_R1A_AM10.ovt.
-	 */
-	{0x5780, 0x3e},
-
-	/* DPC MORE CONNECTION CASE THRE 0x0c (12) -> 0x02 (2) */
-	{0x5788, 0x02},
-
-	/* DPC GAIN LIST1 0x0f (15) -> 0x08 (8) */
-	{0x578e, 0x08},
-
-	/* DPC GAIN LIST2 0x3f (63) -> 0x0c (12) */
-	{0x578f, 0x0c},
-
-	/* DPC THRE RATIO 0x04 (4) -> 0x00 (0) */
-	{0x5792, 0x00},
-};
-
-#endif
-- 
2.41.0

