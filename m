Return-Path: <linux-media+bounces-9364-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72EC8A4E61
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E8F92825F9
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2026CDDB;
	Mon, 15 Apr 2024 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VhSiouCk"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D886A03D
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713182584; cv=none; b=dXrb4Omz9oRud5pblQ/wzGd9KsHyrpqvuT9Zry7EpWpQXCsKRlhVDWM1N+lrEfnqcBfQA9DfoqantTNeKeEhVOQlHRS7GNqWWjUDY+tZ94sd6gRNei6cqydZQWcY+8d+fC7Vt8ocyK2TNMG1wx83pidxnfePglDCeuYgHS2Egn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713182584; c=relaxed/simple;
	bh=4bdV63xW3BNgp0tkK/Uu9VixCVRv9HXaQV4sT9MbgsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ICSUhRZwWRWj4B8f8ADHt1QOSMdyQg9b5jdFsi2KYhh7rZK6x3hzcK7gBpI2UDh1Qr8jeLCz6Xgik6lR13EuYPosnjX7A1kqOJ92/you/s2smFzf4Vdf7Z+FrxZo7mDa/Now67V5qIvowyO7LtTh+KAOUvOrDF3YlC4nKuDOZ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VhSiouCk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713182579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ACnU75nwZiaQZ6p0V7s8TicecX4otRBGb5R+/9u+Pn8=;
	b=VhSiouCk5AFJKS5l/rsOQdzNZEALjJ1+OjmlqIHycBC2076yvtxTSpNCrrpcsqEWe0a2+Q
	Nf8y11k6kWwNfQhe4lJwYpp5JWGLsE0XINsfzT4jzbE2W2jSk/Hx+rQIyZWJXMBEm4btFz
	ZqiNAlZW0QWrpuc1rOsiuTETTMTWB6U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-hOCPxSSeMa28NsfaMwKUjA-1; Mon, 15 Apr 2024 08:02:53 -0400
X-MC-Unique: hOCPxSSeMa28NsfaMwKUjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09D541887316;
	Mon, 15 Apr 2024 12:02:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5DDDC13FA2;
	Mon, 15 Apr 2024 12:02:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 13/23] media: atomisp: Drop the atomisp custom lm3554 flash driver
Date: Mon, 15 Apr 2024 14:02:10 +0200
Message-ID: <20240415120220.219480-14-hdegoede@redhat.com>
In-Reply-To: <20240415120220.219480-1-hdegoede@redhat.com>
References: <20240415120220.219480-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Drop the atomisp custom lm3554 flash driver, support for flash drivers
using the custom atomisp flash interface is going to be removed from
the atomisp driver.

If flash supports for the lm3554 turns out to be necessary on some
atomisp devices in the future then this should be re-implemented
using the new include/linux/led-class-flash.h APIs.

The atomisp specific lm3554 driver could still be usable as a reference
for how to use / driver the lm3554 for a future re-implementation
using standardized APIs, but for that it can be retrieved from
the git history.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/Kconfig     |  15 -
 drivers/staging/media/atomisp/i2c/Makefile    |   5 -
 .../media/atomisp/i2c/atomisp-lm3554.c        | 955 ------------------
 .../media/atomisp/include/media/lm3554.h      | 132 ---
 4 files changed, 1107 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
 delete mode 100644 drivers/staging/media/atomisp/include/media/lm3554.h

diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index f62d183b787f..8710c483015c 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -56,18 +56,3 @@ config VIDEO_ATOMISP_GC0310
 	help
 	  This is a Video4Linux2 sensor-level driver for the Galaxycore
 	  GC0310 0.3MP sensor.
-
-#
-# Kconfig for flash drivers
-#
-
-config VIDEO_ATOMISP_LM3554
-       tristate "LM3554 flash light driver"
-	depends on ACPI
-       depends on VIDEO_DEV && I2C
-	help
-	 This is a Video4Linux2 sub-dev driver for the LM3554
-	 flash light driver.
-
-	 To compile this driver as a module, choose M here: the
-	 module will be called lm3554
diff --git a/drivers/staging/media/atomisp/i2c/Makefile b/drivers/staging/media/atomisp/i2c/Makefile
index e946cc91e5ff..3073cfa75ecf 100644
--- a/drivers/staging/media/atomisp/i2c/Makefile
+++ b/drivers/staging/media/atomisp/i2c/Makefile
@@ -9,8 +9,3 @@ obj-$(CONFIG_VIDEO_ATOMISP_OV2722)     += atomisp-ov2722.o
 obj-$(CONFIG_VIDEO_ATOMISP_GC0310)     += atomisp-gc0310.o
 
 obj-$(CONFIG_VIDEO_ATOMISP_MSRLIST_HELPER) += atomisp-libmsrlisthelper.o
-
-# Makefile for flash drivers
-#
-
-obj-$(CONFIG_VIDEO_ATOMISP_LM3554) += atomisp-lm3554.o
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
deleted file mode 100644
index cf5d9317b11a..000000000000
--- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
+++ /dev/null
@@ -1,955 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * LED flash driver for LM3554
- *
- * Copyright (c) 2010-2012 Intel Corporation. All Rights Reserved.
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
-#include <linux/module.h>
-#include <linux/i2c.h>
-#include <linux/mutex.h>
-#include <linux/delay.h>
-#include <linux/gpio/consumer.h>
-#include <linux/slab.h>
-
-#include "../include/media/lm3554.h"
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
-#include <linux/acpi.h>
-#include "../include/linux/atomisp_gmin_platform.h"
-#include "../include/linux/atomisp.h"
-
-/* Registers */
-
-#define LM3554_TORCH_BRIGHTNESS_REG	0xA0
-#define LM3554_TORCH_MODE_SHIFT		0
-#define LM3554_TORCH_CURRENT_SHIFT	3
-#define LM3554_INDICATOR_CURRENT_SHIFT	6
-
-#define LM3554_FLASH_BRIGHTNESS_REG	0xB0
-#define LM3554_FLASH_MODE_SHIFT		0
-#define LM3554_FLASH_CURRENT_SHIFT	3
-#define LM3554_STROBE_SENSITIVITY_SHIFT	7
-
-#define LM3554_FLASH_DURATION_REG	0xC0
-#define LM3554_FLASH_TIMEOUT_SHIFT	0
-#define LM3554_CURRENT_LIMIT_SHIFT	5
-
-#define LM3554_FLAGS_REG		0xD0
-#define LM3554_FLAG_TIMEOUT		BIT(0)
-#define LM3554_FLAG_THERMAL_SHUTDOWN	BIT(1)
-#define LM3554_FLAG_LED_FAULT		BIT(2)
-#define LM3554_FLAG_TX1_INTERRUPT	BIT(3)
-#define LM3554_FLAG_TX2_INTERRUPT	BIT(4)
-#define LM3554_FLAG_LED_THERMAL_FAULT	BIT(5)
-#define LM3554_FLAG_UNUSED		BIT(6)
-#define LM3554_FLAG_INPUT_VOLTAGE_LOW	BIT(7)
-
-#define LM3554_CONFIG_REG_1		0xE0
-#define LM3554_ENVM_TX2_SHIFT		5
-#define LM3554_TX2_POLARITY_SHIFT	6
-
-struct lm3554 {
-	struct v4l2_subdev sd;
-
-	struct mutex power_lock;
-	struct v4l2_ctrl_handler ctrl_handler;
-	int power_count;
-
-	unsigned int mode;
-	int timeout;
-	u8 torch_current;
-	u8 indicator_current;
-	u8 flash_current;
-
-	struct timer_list flash_off_delay;
-	struct lm3554_platform_data *pdata;
-};
-
-#define to_lm3554(p_sd)	container_of(p_sd, struct lm3554, sd)
-
-/* Return negative errno else zero on success */
-static int lm3554_write(struct lm3554 *flash, u8 addr, u8 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&flash->sd);
-	int ret;
-
-	ret = i2c_smbus_write_byte_data(client, addr, val);
-
-	dev_dbg(&client->dev, "Write Addr:%02X Val:%02X %s\n", addr, val,
-		ret < 0 ? "fail" : "ok");
-
-	return ret;
-}
-
-/* Return negative errno else a data byte received from the device. */
-static int lm3554_read(struct lm3554 *flash, u8 addr)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&flash->sd);
-	int ret;
-
-	ret = i2c_smbus_read_byte_data(client, addr);
-
-	dev_dbg(&client->dev, "Read Addr:%02X Val:%02X %s\n", addr, ret,
-		ret < 0 ? "fail" : "ok");
-
-	return ret;
-}
-
-/* -----------------------------------------------------------------------------
- * Hardware configuration
- */
-
-static int lm3554_set_mode(struct lm3554 *flash, unsigned int mode)
-{
-	u8 val;
-	int ret;
-
-	val = (mode << LM3554_FLASH_MODE_SHIFT) |
-	      (flash->flash_current << LM3554_FLASH_CURRENT_SHIFT);
-
-	ret = lm3554_write(flash, LM3554_FLASH_BRIGHTNESS_REG, val);
-	if (ret == 0)
-		flash->mode = mode;
-	return ret;
-}
-
-static int lm3554_set_torch(struct lm3554 *flash)
-{
-	u8 val;
-
-	val = (flash->mode << LM3554_TORCH_MODE_SHIFT) |
-	      (flash->torch_current << LM3554_TORCH_CURRENT_SHIFT) |
-	      (flash->indicator_current << LM3554_INDICATOR_CURRENT_SHIFT);
-
-	return lm3554_write(flash, LM3554_TORCH_BRIGHTNESS_REG, val);
-}
-
-static int lm3554_set_flash(struct lm3554 *flash)
-{
-	u8 val;
-
-	val = (flash->mode << LM3554_FLASH_MODE_SHIFT) |
-	      (flash->flash_current << LM3554_FLASH_CURRENT_SHIFT);
-
-	return lm3554_write(flash, LM3554_FLASH_BRIGHTNESS_REG, val);
-}
-
-static int lm3554_set_duration(struct lm3554 *flash)
-{
-	u8 val;
-
-	val = (flash->timeout << LM3554_FLASH_TIMEOUT_SHIFT) |
-	      (flash->pdata->current_limit << LM3554_CURRENT_LIMIT_SHIFT);
-
-	return lm3554_write(flash, LM3554_FLASH_DURATION_REG, val);
-}
-
-static int lm3554_set_config1(struct lm3554 *flash)
-{
-	u8 val;
-
-	val = (flash->pdata->envm_tx2 << LM3554_ENVM_TX2_SHIFT) |
-	      (flash->pdata->tx2_polarity << LM3554_TX2_POLARITY_SHIFT);
-	return lm3554_write(flash, LM3554_CONFIG_REG_1, val);
-}
-
-/* -----------------------------------------------------------------------------
- * Hardware trigger
- */
-static void lm3554_flash_off_delay(struct timer_list *t)
-{
-	struct lm3554 *flash = from_timer(flash, t, flash_off_delay);
-	struct lm3554_platform_data *pdata = flash->pdata;
-
-	gpiod_set_value(pdata->gpio_strobe, 0);
-}
-
-static int lm3554_hw_strobe(struct i2c_client *client, bool strobe)
-{
-	int ret, timer_pending;
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct lm3554 *flash = to_lm3554(sd);
-	struct lm3554_platform_data *pdata = flash->pdata;
-
-	/*
-	 * An abnormal high flash current is observed when strobe off the
-	 * flash. Workaround here is firstly set flash current to lower level,
-	 * wait a short moment, and then strobe off the flash.
-	 */
-
-	timer_pending = del_timer_sync(&flash->flash_off_delay);
-
-	/* Flash off */
-	if (!strobe) {
-		/* set current to 70mA and wait a while */
-		ret = lm3554_write(flash, LM3554_FLASH_BRIGHTNESS_REG, 0);
-		if (ret < 0)
-			goto err;
-		mod_timer(&flash->flash_off_delay,
-			  jiffies + msecs_to_jiffies(LM3554_TIMER_DELAY));
-		return 0;
-	}
-
-	/* Flash on */
-
-	/*
-	 * If timer is killed before run, flash is not strobe off,
-	 * so must strobe off here
-	 */
-	if (timer_pending)
-		gpiod_set_value(pdata->gpio_strobe, 0);
-
-	/* Restore flash current settings */
-	ret = lm3554_set_flash(flash);
-	if (ret < 0)
-		goto err;
-
-	/* Strobe on Flash */
-	gpiod_set_value(pdata->gpio_strobe, 1);
-
-	return 0;
-err:
-	dev_err(&client->dev, "failed to %s flash strobe (%d)\n",
-		strobe ? "on" : "off", ret);
-	return ret;
-}
-
-/* -----------------------------------------------------------------------------
- * V4L2 controls
- */
-
-static int lm3554_read_status(struct lm3554 *flash)
-{
-	int ret;
-	struct i2c_client *client = v4l2_get_subdevdata(&flash->sd);
-
-	/* NOTE: reading register clear fault status */
-	ret = lm3554_read(flash, LM3554_FLAGS_REG);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * Accordingly to datasheet we read back '1' in bit 6.
-	 * Clear it first.
-	 */
-	ret &= ~LM3554_FLAG_UNUSED;
-
-	/*
-	 * Do not take TX1/TX2 signal as an error
-	 * because MSIC will not turn off flash, but turn to
-	 * torch mode according to gsm modem signal by hardware.
-	 */
-	ret &= ~(LM3554_FLAG_TX1_INTERRUPT | LM3554_FLAG_TX2_INTERRUPT);
-
-	if (ret > 0)
-		dev_dbg(&client->dev, "LM3554 flag status: %02x\n", ret);
-
-	return ret;
-}
-
-static int lm3554_s_flash_timeout(struct v4l2_subdev *sd, u32 val)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-
-	val = clamp(val, LM3554_MIN_TIMEOUT, LM3554_MAX_TIMEOUT);
-	val = val / LM3554_TIMEOUT_STEPSIZE - 1;
-
-	flash->timeout = val;
-
-	return lm3554_set_duration(flash);
-}
-
-static int lm3554_g_flash_timeout(struct v4l2_subdev *sd, s32 *val)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-
-	*val = (u32)(flash->timeout + 1) * LM3554_TIMEOUT_STEPSIZE;
-
-	return 0;
-}
-
-static int lm3554_s_flash_intensity(struct v4l2_subdev *sd, u32 intensity)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-
-	intensity = LM3554_CLAMP_PERCENTAGE(intensity);
-	intensity = LM3554_PERCENT_TO_VALUE(intensity, LM3554_FLASH_STEP);
-
-	flash->flash_current = intensity;
-
-	return lm3554_set_flash(flash);
-}
-
-static int lm3554_g_flash_intensity(struct v4l2_subdev *sd, s32 *val)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-
-	*val = LM3554_VALUE_TO_PERCENT((u32)flash->flash_current,
-				       LM3554_FLASH_STEP);
-
-	return 0;
-}
-
-static int lm3554_s_torch_intensity(struct v4l2_subdev *sd, u32 intensity)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-
-	intensity = LM3554_CLAMP_PERCENTAGE(intensity);
-	intensity = LM3554_PERCENT_TO_VALUE(intensity, LM3554_TORCH_STEP);
-
-	flash->torch_current = intensity;
-
-	return lm3554_set_torch(flash);
-}
-
-static int lm3554_g_torch_intensity(struct v4l2_subdev *sd, s32 *val)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-
-	*val = LM3554_VALUE_TO_PERCENT((u32)flash->torch_current,
-				       LM3554_TORCH_STEP);
-
-	return 0;
-}
-
-static int lm3554_s_indicator_intensity(struct v4l2_subdev *sd, u32 intensity)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-
-	intensity = LM3554_CLAMP_PERCENTAGE(intensity);
-	intensity = LM3554_PERCENT_TO_VALUE(intensity, LM3554_INDICATOR_STEP);
-
-	flash->indicator_current = intensity;
-
-	return lm3554_set_torch(flash);
-}
-
-static int lm3554_g_indicator_intensity(struct v4l2_subdev *sd, s32 *val)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-
-	*val = LM3554_VALUE_TO_PERCENT((u32)flash->indicator_current,
-				       LM3554_INDICATOR_STEP);
-
-	return 0;
-}
-
-static int lm3554_s_flash_strobe(struct v4l2_subdev *sd, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-	return lm3554_hw_strobe(client, val);
-}
-
-static int lm3554_s_flash_mode(struct v4l2_subdev *sd, u32 new_mode)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-	unsigned int mode;
-
-	switch (new_mode) {
-	case ATOMISP_FLASH_MODE_OFF:
-		mode = LM3554_MODE_SHUTDOWN;
-		break;
-	case ATOMISP_FLASH_MODE_FLASH:
-		mode = LM3554_MODE_FLASH;
-		break;
-	case ATOMISP_FLASH_MODE_INDICATOR:
-		mode = LM3554_MODE_INDICATOR;
-		break;
-	case ATOMISP_FLASH_MODE_TORCH:
-		mode = LM3554_MODE_TORCH;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return lm3554_set_mode(flash, mode);
-}
-
-static int lm3554_g_flash_mode(struct v4l2_subdev *sd, s32 *val)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-	*val = flash->mode;
-	return 0;
-}
-
-static int lm3554_g_flash_status(struct v4l2_subdev *sd, s32 *val)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-	int value;
-
-	value = lm3554_read_status(flash);
-	if (value < 0)
-		return value;
-
-	if (value & LM3554_FLAG_TIMEOUT)
-		*val = ATOMISP_FLASH_STATUS_TIMEOUT;
-	else if (value > 0)
-		*val = ATOMISP_FLASH_STATUS_HW_ERROR;
-	else
-		*val = ATOMISP_FLASH_STATUS_OK;
-
-	return 0;
-}
-
-static int lm3554_g_flash_status_register(struct v4l2_subdev *sd, s32 *val)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-	int ret;
-
-	ret = lm3554_read(flash, LM3554_FLAGS_REG);
-
-	if (ret < 0)
-		return ret;
-
-	*val = ret;
-	return 0;
-}
-
-static int lm3554_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct lm3554 *dev =
-	    container_of(ctrl->handler, struct lm3554, ctrl_handler);
-	int ret = 0;
-
-	switch (ctrl->id) {
-	case V4L2_CID_FLASH_TIMEOUT:
-		ret = lm3554_s_flash_timeout(&dev->sd, ctrl->val);
-		break;
-	case V4L2_CID_FLASH_INTENSITY:
-		ret = lm3554_s_flash_intensity(&dev->sd, ctrl->val);
-		break;
-	case V4L2_CID_FLASH_TORCH_INTENSITY:
-		ret = lm3554_s_torch_intensity(&dev->sd, ctrl->val);
-		break;
-	case V4L2_CID_FLASH_INDICATOR_INTENSITY:
-		ret = lm3554_s_indicator_intensity(&dev->sd, ctrl->val);
-		break;
-	case V4L2_CID_FLASH_STROBE:
-		ret = lm3554_s_flash_strobe(&dev->sd, ctrl->val);
-		break;
-	case V4L2_CID_FLASH_MODE:
-		ret = lm3554_s_flash_mode(&dev->sd, ctrl->val);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-	return ret;
-}
-
-static int lm3554_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct lm3554 *dev =
-	    container_of(ctrl->handler, struct lm3554, ctrl_handler);
-	int ret = 0;
-
-	switch (ctrl->id) {
-	case V4L2_CID_FLASH_TIMEOUT:
-		ret = lm3554_g_flash_timeout(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FLASH_INTENSITY:
-		ret = lm3554_g_flash_intensity(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FLASH_TORCH_INTENSITY:
-		ret = lm3554_g_torch_intensity(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FLASH_INDICATOR_INTENSITY:
-		ret = lm3554_g_indicator_intensity(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FLASH_MODE:
-		ret = lm3554_g_flash_mode(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FLASH_STATUS:
-		ret = lm3554_g_flash_status(&dev->sd, &ctrl->val);
-		break;
-	case V4L2_CID_FLASH_STATUS_REGISTER:
-		ret = lm3554_g_flash_status_register(&dev->sd, &ctrl->val);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
-static const struct v4l2_ctrl_ops ctrl_ops = {
-	.s_ctrl = lm3554_s_ctrl,
-	.g_volatile_ctrl = lm3554_g_volatile_ctrl
-};
-
-static const struct v4l2_ctrl_config lm3554_controls[] = {
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FLASH_TIMEOUT,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Flash Timeout",
-		.min = 0x0,
-		.max = LM3554_MAX_TIMEOUT,
-		.step = 0x01,
-		.def = LM3554_DEFAULT_TIMEOUT,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FLASH_INTENSITY,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Flash Intensity",
-		.min = LM3554_MIN_PERCENT,
-		.max = LM3554_MAX_PERCENT,
-		.step = 0x01,
-		.def = LM3554_FLASH_DEFAULT_BRIGHTNESS,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FLASH_TORCH_INTENSITY,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Torch Intensity",
-		.min = LM3554_MIN_PERCENT,
-		.max = LM3554_MAX_PERCENT,
-		.step = 0x01,
-		.def = LM3554_TORCH_DEFAULT_BRIGHTNESS,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FLASH_INDICATOR_INTENSITY,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Indicator Intensity",
-		.min = LM3554_MIN_PERCENT,
-		.max = LM3554_MAX_PERCENT,
-		.step = 0x01,
-		.def = LM3554_INDICATOR_DEFAULT_BRIGHTNESS,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FLASH_STROBE,
-		.type = V4L2_CTRL_TYPE_BOOLEAN,
-		.name = "Flash Strobe",
-		.min = 0,
-		.max = 1,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FLASH_MODE,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Flash Mode",
-		.min = 0,
-		.max = 100,
-		.step = 1,
-		.def = ATOMISP_FLASH_MODE_OFF,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FLASH_STATUS,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Flash Status",
-		.min = ATOMISP_FLASH_STATUS_OK,
-		.max = ATOMISP_FLASH_STATUS_TIMEOUT,
-		.step = 1,
-		.def = ATOMISP_FLASH_STATUS_OK,
-		.flags = 0,
-	},
-	{
-		.ops = &ctrl_ops,
-		.id = V4L2_CID_FLASH_STATUS_REGISTER,
-		.type = V4L2_CTRL_TYPE_INTEGER,
-		.name = "Flash Status Register",
-		.min = 0,
-		.max = 255,
-		.step = 1,
-		.def = 0,
-		.flags = 0,
-	},
-};
-
-/* -----------------------------------------------------------------------------
- * V4L2 subdev core operations
- */
-
-/* Put device into known state. */
-static int lm3554_setup(struct lm3554 *flash)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&flash->sd);
-	int ret;
-
-	/* clear the flags register */
-	ret = lm3554_read(flash, LM3554_FLAGS_REG);
-	if (ret < 0)
-		return ret;
-
-	dev_dbg(&client->dev, "Fault info: %02x\n", ret);
-
-	ret = lm3554_set_config1(flash);
-	if (ret < 0)
-		return ret;
-
-	ret = lm3554_set_duration(flash);
-	if (ret < 0)
-		return ret;
-
-	ret = lm3554_set_torch(flash);
-	if (ret < 0)
-		return ret;
-
-	ret = lm3554_set_flash(flash);
-	if (ret < 0)
-		return ret;
-
-	/* read status */
-	ret = lm3554_read_status(flash);
-	if (ret < 0)
-		return ret;
-
-	return ret ? -EIO : 0;
-}
-
-static int __lm3554_s_power(struct lm3554 *flash, int power)
-{
-	struct lm3554_platform_data *pdata = flash->pdata;
-	int ret;
-
-	/*initialize flash driver*/
-	gpiod_set_value(pdata->gpio_reset, power);
-	usleep_range(100, 100 + 1);
-
-	if (power) {
-		/* Setup default values. This makes sure that the chip
-		 * is in a known state.
-		 */
-		ret = lm3554_setup(flash);
-		if (ret < 0) {
-			__lm3554_s_power(flash, 0);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-static int lm3554_s_power(struct v4l2_subdev *sd, int power)
-{
-	struct lm3554 *flash = to_lm3554(sd);
-	int ret = 0;
-
-	mutex_lock(&flash->power_lock);
-
-	if (flash->power_count == !power) {
-		ret = __lm3554_s_power(flash, !!power);
-		if (ret < 0)
-			goto done;
-	}
-
-	flash->power_count += power ? 1 : -1;
-	WARN_ON(flash->power_count < 0);
-
-done:
-	mutex_unlock(&flash->power_lock);
-	return ret;
-}
-
-static const struct v4l2_subdev_core_ops lm3554_core_ops = {
-	.s_power = lm3554_s_power,
-};
-
-static const struct v4l2_subdev_ops lm3554_ops = {
-	.core = &lm3554_core_ops,
-};
-
-static int lm3554_detect(struct v4l2_subdev *sd)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct i2c_adapter *adapter = client->adapter;
-	struct lm3554 *flash = to_lm3554(sd);
-	int ret;
-
-	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
-		dev_err(&client->dev, "lm3554_detect i2c error\n");
-		return -ENODEV;
-	}
-
-	/* Power up the flash driver and reset it */
-	ret = lm3554_s_power(&flash->sd, 1);
-	if (ret < 0) {
-		dev_err(&client->dev, "Failed to power on lm3554 LED flash\n");
-	} else {
-		dev_dbg(&client->dev, "Successfully detected lm3554 LED flash\n");
-		lm3554_s_power(&flash->sd, 0);
-	}
-
-	return ret;
-}
-
-static int lm3554_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-{
-	return lm3554_s_power(sd, 1);
-}
-
-static int lm3554_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-{
-	return lm3554_s_power(sd, 0);
-}
-
-static const struct v4l2_subdev_internal_ops lm3554_internal_ops = {
-	.registered = lm3554_detect,
-	.open = lm3554_open,
-	.close = lm3554_close,
-};
-
-/* -----------------------------------------------------------------------------
- *  I2C driver
- */
-#ifdef CONFIG_PM
-
-static int lm3554_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct lm3554 *flash = to_lm3554(subdev);
-	int rval;
-
-	if (flash->power_count == 0)
-		return 0;
-
-	rval = __lm3554_s_power(flash, 0);
-
-	dev_dbg(&client->dev, "Suspend %s\n", rval < 0 ? "failed" : "ok");
-
-	return rval;
-}
-
-static int lm3554_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct lm3554 *flash = to_lm3554(subdev);
-	int rval;
-
-	if (flash->power_count == 0)
-		return 0;
-
-	rval = __lm3554_s_power(flash, 1);
-
-	dev_dbg(&client->dev, "Resume %s\n", rval < 0 ? "fail" : "ok");
-
-	return rval;
-}
-
-#else
-
-#define lm3554_suspend NULL
-#define lm3554_resume  NULL
-
-#endif /* CONFIG_PM */
-
-static int lm3554_gpio_init(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct lm3554 *flash = to_lm3554(sd);
-	struct lm3554_platform_data *pdata = flash->pdata;
-	int ret;
-
-	if (!pdata->gpio_reset)
-		return -EINVAL;
-
-	ret = gpiod_direction_output(pdata->gpio_reset, 0);
-	if (ret < 0)
-		return ret;
-
-	if (!pdata->gpio_strobe)
-		return -EINVAL;
-
-	ret = gpiod_direction_output(pdata->gpio_strobe, 0);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
-static void lm3554_gpio_uninit(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct lm3554 *flash = to_lm3554(sd);
-	struct lm3554_platform_data *pdata = flash->pdata;
-	int ret;
-
-	ret = gpiod_direction_output(pdata->gpio_strobe, 0);
-	if (ret < 0)
-		dev_err(&client->dev,
-			"gpio request/direction_output fail for gpio_strobe");
-
-	ret = gpiod_direction_output(pdata->gpio_reset, 0);
-	if (ret < 0)
-		dev_err(&client->dev,
-			"gpio request/direction_output fail for gpio_reset");
-}
-
-static void *lm3554_platform_data_func(struct i2c_client *client)
-{
-	static struct lm3554_platform_data platform_data;
-
-	platform_data.gpio_reset = gpiod_get_index(&client->dev,
-						   NULL, 2, GPIOD_OUT_LOW);
-	if (IS_ERR(platform_data.gpio_reset))
-		return ERR_CAST(platform_data.gpio_reset);
-	platform_data.gpio_strobe = gpiod_get_index(&client->dev,
-						    NULL, 0, GPIOD_OUT_LOW);
-	if (IS_ERR(platform_data.gpio_strobe))
-		return ERR_CAST(platform_data.gpio_strobe);
-	platform_data.gpio_torch = gpiod_get_index(&client->dev,
-						   NULL, 1, GPIOD_OUT_LOW);
-	if (IS_ERR(platform_data.gpio_torch))
-		return ERR_CAST(platform_data.gpio_torch);
-
-	/* Set to TX2 mode, then ENVM/TX2 pin is a power amplifier sync input:
-	 * ENVM/TX pin asserted, flash forced into torch;
-	 * ENVM/TX pin desserted, flash set back;
-	 */
-	platform_data.envm_tx2 = 1;
-	platform_data.tx2_polarity = 0;
-
-	/* set peak current limit to be 1000mA */
-	platform_data.current_limit = 0;
-
-	return &platform_data;
-}
-
-static int lm3554_probe(struct i2c_client *client)
-{
-	int err = 0;
-	struct lm3554 *flash;
-	unsigned int i;
-
-	flash = kzalloc(sizeof(*flash), GFP_KERNEL);
-	if (!flash)
-		return -ENOMEM;
-
-	flash->pdata = lm3554_platform_data_func(client);
-	if (IS_ERR(flash->pdata)) {
-		err = PTR_ERR(flash->pdata);
-		goto free_flash;
-	}
-
-	v4l2_i2c_subdev_init(&flash->sd, client, &lm3554_ops);
-	flash->sd.internal_ops = &lm3554_internal_ops;
-	flash->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	flash->mode = ATOMISP_FLASH_MODE_OFF;
-	flash->timeout = LM3554_MAX_TIMEOUT / LM3554_TIMEOUT_STEPSIZE - 1;
-	err =
-	    v4l2_ctrl_handler_init(&flash->ctrl_handler,
-				   ARRAY_SIZE(lm3554_controls));
-	if (err) {
-		dev_err(&client->dev, "error initialize a ctrl_handler.\n");
-		goto unregister_subdev;
-	}
-
-	for (i = 0; i < ARRAY_SIZE(lm3554_controls); i++)
-		v4l2_ctrl_new_custom(&flash->ctrl_handler, &lm3554_controls[i],
-				     NULL);
-
-	if (flash->ctrl_handler.error) {
-		dev_err(&client->dev, "ctrl_handler error.\n");
-		err = flash->ctrl_handler.error;
-		goto free_handler;
-	}
-
-	flash->sd.ctrl_handler = &flash->ctrl_handler;
-	err = media_entity_pads_init(&flash->sd.entity, 0, NULL);
-	if (err) {
-		dev_err(&client->dev, "error initialize a media entity.\n");
-		goto free_handler;
-	}
-
-	flash->sd.entity.function = MEDIA_ENT_F_FLASH;
-
-	mutex_init(&flash->power_lock);
-
-	timer_setup(&flash->flash_off_delay, lm3554_flash_off_delay, 0);
-
-	err = lm3554_gpio_init(client);
-	if (err) {
-		dev_err(&client->dev, "gpio request/direction_output fail.\n");
-		goto cleanup_media;
-	}
-
-	err = atomisp_register_i2c_module(&flash->sd, NULL, LED_FLASH);
-	if (err) {
-		dev_err(&client->dev, "fail to register atomisp i2c module.\n");
-		goto uninit_gpio;
-	}
-
-	return 0;
-
-uninit_gpio:
-	lm3554_gpio_uninit(client);
-cleanup_media:
-	media_entity_cleanup(&flash->sd.entity);
-free_handler:
-	v4l2_ctrl_handler_free(&flash->ctrl_handler);
-unregister_subdev:
-	v4l2_device_unregister_subdev(&flash->sd);
-free_flash:
-	kfree(flash);
-
-	return err;
-}
-
-static void lm3554_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct lm3554 *flash = to_lm3554(sd);
-
-	media_entity_cleanup(&flash->sd.entity);
-	v4l2_ctrl_handler_free(&flash->ctrl_handler);
-	v4l2_device_unregister_subdev(sd);
-
-	atomisp_gmin_remove_subdev(sd);
-
-	timer_shutdown_sync(&flash->flash_off_delay);
-
-	lm3554_gpio_uninit(client);
-
-	kfree(flash);
-}
-
-static const struct dev_pm_ops lm3554_pm_ops = {
-	.suspend = lm3554_suspend,
-	.resume = lm3554_resume,
-};
-
-static const struct acpi_device_id lm3554_acpi_match[] = {
-	{ "INTCF1C" },
-	{},
-};
-MODULE_DEVICE_TABLE(acpi, lm3554_acpi_match);
-
-static struct i2c_driver lm3554_driver = {
-	.driver = {
-		.name = "lm3554",
-		.pm   = &lm3554_pm_ops,
-		.acpi_match_table = lm3554_acpi_match,
-	},
-	.probe = lm3554_probe,
-	.remove = lm3554_remove,
-};
-module_i2c_driver(lm3554_driver);
-
-MODULE_AUTHOR("Jing Tao <jing.tao@intel.com>");
-MODULE_DESCRIPTION("LED flash driver for LM3554");
-MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/atomisp/include/media/lm3554.h b/drivers/staging/media/atomisp/include/media/lm3554.h
deleted file mode 100644
index 711b7d7c9950..000000000000
--- a/drivers/staging/media/atomisp/include/media/lm3554.h
+++ /dev/null
@@ -1,132 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * include/media/lm3554.h
- *
- * Copyright (c) 2010-2012 Intel Corporation. All Rights Reserved.
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
-#ifndef _LM3554_H_
-#define _LM3554_H_
-
-#include <linux/gpio/consumer.h>
-#include <linux/videodev2.h>
-#include <media/v4l2-subdev.h>
-
-#define LM3554_ID      3554
-
-#define	v4l2_queryctrl_entry_integer(_id, _name,\
-		_minimum, _maximum, _step, \
-		_default_value, _flags)	\
-	{\
-		.id = (_id), \
-		.type = V4L2_CTRL_TYPE_INTEGER, \
-		.name = _name, \
-		.minimum = (_minimum), \
-		.maximum = (_maximum), \
-		.step = (_step), \
-		.default_value = (_default_value),\
-		.flags = (_flags),\
-	}
-#define	v4l2_queryctrl_entry_boolean(_id, _name,\
-		_default_value, _flags)	\
-	{\
-		.id = (_id), \
-		.type = V4L2_CTRL_TYPE_BOOLEAN, \
-		.name = _name, \
-		.minimum = 0, \
-		.maximum = 1, \
-		.step = 1, \
-		.default_value = (_default_value),\
-		.flags = (_flags),\
-	}
-
-#define	s_ctrl_id_entry_integer(_id, _name, \
-		_minimum, _maximum, _step, \
-		_default_value, _flags, \
-		_s_ctrl, _g_ctrl)	\
-	{\
-		.qc = v4l2_queryctrl_entry_integer(_id, _name,\
-				_minimum, _maximum, _step,\
-				_default_value, _flags), \
-		.s_ctrl = _s_ctrl, \
-		.g_ctrl = _g_ctrl, \
-	}
-
-#define	s_ctrl_id_entry_boolean(_id, _name, \
-		_default_value, _flags, \
-		_s_ctrl, _g_ctrl)	\
-	{\
-		.qc = v4l2_queryctrl_entry_boolean(_id, _name,\
-				_default_value, _flags), \
-		.s_ctrl = _s_ctrl, \
-		.g_ctrl = _g_ctrl, \
-	}
-
-/* Value settings for Flash Time-out Duration*/
-#define LM3554_DEFAULT_TIMEOUT          512U
-#define LM3554_MIN_TIMEOUT              32U
-#define LM3554_MAX_TIMEOUT              1024U
-#define LM3554_TIMEOUT_STEPSIZE         32U
-
-/* Flash modes */
-#define LM3554_MODE_SHUTDOWN            0
-#define LM3554_MODE_INDICATOR           1
-#define LM3554_MODE_TORCH               2
-#define LM3554_MODE_FLASH               3
-
-/* timer delay time */
-#define LM3554_TIMER_DELAY		5
-
-/* Percentage <-> value macros */
-#define LM3554_MIN_PERCENT                   0U
-#define LM3554_MAX_PERCENT                   100U
-#define LM3554_CLAMP_PERCENTAGE(val) \
-	clamp(val, LM3554_MIN_PERCENT, LM3554_MAX_PERCENT)
-
-#define LM3554_VALUE_TO_PERCENT(v, step)     (((((unsigned long)(v)) * (step)) + 50) / 100)
-#define LM3554_PERCENT_TO_VALUE(p, step)     (((((unsigned long)(p)) * 100) + (step >> 1)) / (step))
-
-/* Product specific limits
- * TODO: get these from platform data */
-#define LM3554_FLASH_MAX_LVL   0x0F /* 1191mA */
-
-/* Flash brightness, input is percentage, output is [0..15] */
-#define LM3554_FLASH_STEP	\
-	((100ul * (LM3554_MAX_PERCENT) + ((LM3554_FLASH_MAX_LVL) >> 1)) / ((LM3554_FLASH_MAX_LVL)))
-#define LM3554_FLASH_DEFAULT_BRIGHTNESS \
-	LM3554_VALUE_TO_PERCENT(13, LM3554_FLASH_STEP)
-
-/* Torch brightness, input is percentage, output is [0..7] */
-#define LM3554_TORCH_STEP                    1250
-#define LM3554_TORCH_DEFAULT_BRIGHTNESS \
-	LM3554_VALUE_TO_PERCENT(2, LM3554_TORCH_STEP)
-
-/* Indicator brightness, input is percentage, output is [0..3] */
-#define LM3554_INDICATOR_STEP                2500
-#define LM3554_INDICATOR_DEFAULT_BRIGHTNESS \
-	LM3554_VALUE_TO_PERCENT(1, LM3554_INDICATOR_STEP)
-
-/*
- * lm3554_platform_data - Flash controller platform data
- */
-struct lm3554_platform_data {
-	struct gpio_desc *gpio_torch;
-	struct gpio_desc *gpio_strobe;
-	struct gpio_desc *gpio_reset;
-
-	unsigned int current_limit;
-	unsigned int envm_tx2;
-	unsigned int tx2_polarity;
-};
-
-#endif /* _LM3554_H_ */
-- 
2.44.0


