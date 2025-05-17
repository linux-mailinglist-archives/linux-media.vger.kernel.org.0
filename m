Return-Path: <linux-media+bounces-32662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E7DABA9C9
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 13:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AC6717F378
	for <lists+linux-media@lfdr.de>; Sat, 17 May 2025 11:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A011F8725;
	Sat, 17 May 2025 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aHaYiJva"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E9A29CE1
	for <linux-media@vger.kernel.org>; Sat, 17 May 2025 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747482101; cv=none; b=fUnbtu+5Cwn8N30BUGkNgL+GscMdJ1uoZ600ageC9GfuVV+qNwdwM4H7naY8hwWSqIO+wyRXNi/QLEwR+rG+TvrhI5VGqPgxPPkmssAELUlL/6C1u5zuBm7ISu2g4WAy6bZBeYnkvf86ttDLVcOudqRS4rx+yWpo0gB5RY+l+pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747482101; c=relaxed/simple;
	bh=4l9cBoj2y+xtzV29+jyfNcoAhCv1ucpo7YUfo3fQKkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+psFa36i7bbAwGQ0P6MAKCtCB9C4y6uH4D4Om6iYjyLhzkdkMN+YnmY8Kwbng41+ISpl1P18wBtlNJy8g9kkM2OY9OjVTVmkxv6CbUKjEgBwCFqb5euxBiDLBe6kbmH8ujWoq5bXRwtvfN/q3U13C4y64aDWya4W4pw9om8s3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aHaYiJva; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747482099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Pnt0Ne9f+1zE39w31BHDdKjEhRgSKoQfN/9xm5jEh0=;
	b=aHaYiJvauAR22fh5E264CaxT3KVz8/LPk8NCfsIz/KzwHaMedmls6zsBu2MSruM7EiAXuh
	nkt1szzh0/QSmpiqgwfucEcYYcYAzWOWB0xU1J6Mvx2MB6arV8TCc1AsjHbskapvoNx+SG
	8sBi8NZof4r5FxOtwYm6W6aph++A5I8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-449-OuSEA-vMPQqVIVCXi5F3HQ-1; Sat,
 17 May 2025 07:41:37 -0400
X-MC-Unique: OuSEA-vMPQqVIVCXi5F3HQ-1
X-Mimecast-MFC-AGG-ID: OuSEA-vMPQqVIVCXi5F3HQ_1747482096
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 06C381800446;
	Sat, 17 May 2025 11:41:36 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.45.224.43])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DDD11180045B;
	Sat, 17 May 2025 11:41:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 04/23] media: atomisp: gc0310: Switch to CCI register access helpers
Date: Sat, 17 May 2025 13:40:47 +0200
Message-ID: <20250517114106.43494-5-hdegoede@redhat.com>
In-Reply-To: <20250517114106.43494-1-hdegoede@redhat.com>
References: <20250517114106.43494-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Switch the GC0310 driver over to the CCI register access helpers.

While at it also add a _REG prefix to all register address defines
to make clear they are register addresses and group register value
defines together with the address definition.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/Kconfig     |   1 +
 .../media/atomisp/i2c/atomisp-gc0310.c        | 143 +++++++-----------
 2 files changed, 55 insertions(+), 89 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/Kconfig b/drivers/staging/media/atomisp/i2c/Kconfig
index 4f46182da58b..ef2094c22347 100644
--- a/drivers/staging/media/atomisp/i2c/Kconfig
+++ b/drivers/staging/media/atomisp/i2c/Kconfig
@@ -31,6 +31,7 @@ config VIDEO_ATOMISP_GC0310
 	tristate "GC0310 sensor support"
 	depends on ACPI
 	depends on I2C && VIDEO_DEV
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor-level driver for the Galaxycore
 	  GC0310 0.3MP sensor.
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 6b11f0ff6088..ee039f3be4da 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -13,9 +13,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 
@@ -27,41 +29,32 @@
 
 #define GC0310_ID				0xa310
 
-#define GC0310_RESET_RELATED			0xFE
+#define GC0310_RESET_RELATED_REG		CCI_REG8(0xfe)
 #define GC0310_REGISTER_PAGE_0			0x0
 #define GC0310_REGISTER_PAGE_3			0x3
 
 /*
  * GC0310 System control registers
  */
-#define GC0310_SW_STREAM			0x10
-
-#define GC0310_SC_CMMN_CHIP_ID_H		0xf0
-#define GC0310_SC_CMMN_CHIP_ID_L		0xf1
-
-#define GC0310_AEC_PK_EXPO_H			0x03
-#define GC0310_AEC_PK_EXPO_L			0x04
-#define GC0310_AGC_ADJ				0x48
-#define GC0310_DGC_ADJ				0x71
-#define GC0310_GROUP_ACCESS			0x3208
-
-#define GC0310_H_CROP_START_H			0x09
-#define GC0310_H_CROP_START_L			0x0A
-#define GC0310_V_CROP_START_H			0x0B
-#define GC0310_V_CROP_START_L			0x0C
-#define GC0310_H_OUTSIZE_H			0x0F
-#define GC0310_H_OUTSIZE_L			0x10
-#define GC0310_V_OUTSIZE_H			0x0D
-#define GC0310_V_OUTSIZE_L			0x0E
-#define GC0310_H_BLANKING_H			0x05
-#define GC0310_H_BLANKING_L			0x06
-#define GC0310_V_BLANKING_H			0x07
-#define GC0310_V_BLANKING_L			0x08
-#define GC0310_SH_DELAY				0x11
+#define GC0310_SW_STREAM_REG			CCI_REG8(0x10)
 
 #define GC0310_START_STREAMING			0x94 /* 8-bit enable */
 #define GC0310_STOP_STREAMING			0x0 /* 8-bit disable */
 
+#define GC0310_SC_CMMN_CHIP_ID_REG		CCI_REG16(0xf0)
+
+#define GC0310_AEC_PK_EXPO_REG			CCI_REG16(0x03)
+#define GC0310_AGC_ADJ_REG			CCI_REG8(0x48)
+#define GC0310_DGC_ADJ_REG			CCI_REG8(0x71)
+
+#define GC0310_H_CROP_START_REG			CCI_REG16(0x09)
+#define GC0310_V_CROP_START_REG			CCI_REG16(0x0B)
+#define GC0310_H_OUTSIZE_REG			CCI_REG16(0x0F)
+#define GC0310_V_OUTSIZE_REG			CCI_REG16(0x0D)
+#define GC0310_H_BLANKING_REG			CCI_REG16(0x05)
+#define GC0310_V_BLANKING_REG			CCI_REG16(0x07)
+#define GC0310_SH_DELAY_REG			CCI_REG8(0x11)
+
 #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
 
 struct gc0310_device {
@@ -71,6 +64,7 @@ struct gc0310_device {
 	struct mutex input_lock;
 	bool is_streaming;
 
+	struct regmap *regmap;
 	struct gpio_desc *reset;
 	struct gpio_desc *powerdown;
 
@@ -90,7 +84,7 @@ struct gc0310_reg {
 	u8 val;
 };
 
-static const struct gc0310_reg gc0310_reset_register[] = {
+static const struct reg_sequence gc0310_reset_register[] = {
 	/* System registers */
 	{ 0xfe, 0xf0 },
 	{ 0xfe, 0xf0 },
@@ -233,7 +227,7 @@ static const struct gc0310_reg gc0310_reset_register[] = {
 	{ 0xfe, 0x00 },
 };
 
-static const struct gc0310_reg gc0310_VGA_30fps[] = {
+static const struct reg_sequence gc0310_VGA_30fps[] = {
 	{ 0xfe, 0x00 },
 	{ 0x0d, 0x01 }, /* height */
 	{ 0x0e, 0xf2 }, /* 0xf7 //height */
@@ -257,41 +251,10 @@ static const struct gc0310_reg gc0310_VGA_30fps[] = {
 	{ 0xfe, 0x00 },
 };
 
-/*
- * gc0310_write_reg_array - Initializes a list of GC0310 registers
- * @client: i2c driver client structure
- * @reglist: list of registers to be written
- * @count: number of register, value pairs in the list
- */
-static int gc0310_write_reg_array(struct i2c_client *client,
-				  const struct gc0310_reg *reglist, int count)
-{
-	int i, err;
-
-	for (i = 0; i < count; i++) {
-		err = i2c_smbus_write_byte_data(client, reglist[i].reg, reglist[i].val);
-		if (err) {
-			dev_err(&client->dev, "write error: wrote 0x%x to offset 0x%x error %d",
-				reglist[i].val, reglist[i].reg, err);
-			return err;
-		}
-	}
-
-	return 0;
-}
-
-static int gc0310_exposure_set(struct gc0310_device *sensor, u32 exp)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
-
-	return i2c_smbus_write_word_swapped(client, GC0310_AEC_PK_EXPO_H, exp);
-}
-
 static int gc0310_gain_set(struct gc0310_device *sensor, u32 gain)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	u8 again, dgain;
-	int ret;
+	int ret = 0;
 
 	/* Taken from original driver, this never sets dgain lower then 32? */
 
@@ -306,11 +269,9 @@ static int gc0310_gain_set(struct gc0310_device *sensor, u32 gain)
 		dgain = gain / 2;
 	}
 
-	ret = i2c_smbus_write_byte_data(client, GC0310_AGC_ADJ, again);
-	if (ret)
-		return ret;
-
-	return i2c_smbus_write_byte_data(client, GC0310_DGC_ADJ, dgain);
+	cci_write(sensor->regmap, GC0310_AGC_ADJ_REG, again, &ret);
+	cci_write(sensor->regmap, GC0310_DGC_ADJ_REG, dgain, &ret);
+	return ret;
 }
 
 static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -325,7 +286,8 @@ static int gc0310_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
-		ret = gc0310_exposure_set(sensor, ctrl->val);
+		ret = cci_write(sensor->regmap, GC0310_AEC_PK_EXPO_REG,
+				ctrl->val, NULL);
 		break;
 	case V4L2_CID_GAIN:
 		ret = gc0310_gain_set(sensor, ctrl->val);
@@ -390,28 +352,30 @@ static int gc0310_get_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int gc0310_detect(struct i2c_client *client)
+static int gc0310_detect(struct gc0310_device *sensor)
 {
-	struct i2c_adapter *adapter = client->adapter;
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	u64 val;
 	int ret;
 
-	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
 	ret = pm_runtime_get_sync(&client->dev);
 	if (ret >= 0)
-		ret = i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H);
+		ret = cci_read(sensor->regmap, GC0310_SC_CMMN_CHIP_ID_REG,
+			       &val, NULL);
 	pm_runtime_put(&client->dev);
 	if (ret < 0) {
 		dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
 		return -ENODEV;
 	}
 
-	dev_dbg(&client->dev, "sensor ID = 0x%x\n", ret);
+	dev_dbg(&client->dev, "sensor ID = 0x%llx\n", val);
 
-	if (ret != GC0310_ID) {
-		dev_err(&client->dev, "sensor ID error, read id = 0x%x, target id = 0x%x\n",
-			ret, GC0310_ID);
+	if (val != GC0310_ID) {
+		dev_err(&client->dev, "sensor ID error, read id = 0x%llx, target id = 0x%x\n",
+			val, GC0310_ID);
 		return -ENODEV;
 	}
 
@@ -436,12 +400,14 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 
 		msleep(100);
 
-		ret = gc0310_write_reg_array(client, gc0310_reset_register,
+		ret = regmap_multi_reg_write(sensor->regmap,
+					     gc0310_reset_register,
 					     ARRAY_SIZE(gc0310_reset_register));
 		if (ret)
 			goto error_power_down;
 
-		ret = gc0310_write_reg_array(client, gc0310_VGA_30fps,
+		ret = regmap_multi_reg_write(sensor->regmap,
+					     gc0310_VGA_30fps,
 					     ARRAY_SIZE(gc0310_VGA_30fps));
 		if (ret)
 			goto error_power_down;
@@ -452,21 +418,16 @@ static int gc0310_s_stream(struct v4l2_subdev *sd, int enable)
 			goto error_power_down;
 
 		/* enable per frame MIPI and sensor ctrl reset  */
-		ret = i2c_smbus_write_byte_data(client, 0xFE, 0x30);
-		if (ret)
-			goto error_power_down;
+		cci_write(sensor->regmap, GC0310_RESET_RELATED_REG, 0x30, &ret);
 	}
 
-	ret = i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_3);
-	if (ret)
-		goto error_power_down;
-
-	ret = i2c_smbus_write_byte_data(client, GC0310_SW_STREAM,
-					enable ? GC0310_START_STREAMING : GC0310_STOP_STREAMING);
-	if (ret)
-		goto error_power_down;
-
-	ret = i2c_smbus_write_byte_data(client, GC0310_RESET_RELATED, GC0310_REGISTER_PAGE_0);
+	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
+		  GC0310_REGISTER_PAGE_3, &ret);
+	cci_write(sensor->regmap, GC0310_SW_STREAM_REG,
+		  enable ? GC0310_START_STREAMING : GC0310_STOP_STREAMING,
+		  &ret);
+	cci_write(sensor->regmap, GC0310_RESET_RELATED_REG,
+		  GC0310_REGISTER_PAGE_0, &ret);
 	if (ret)
 		goto error_power_down;
 
@@ -627,12 +588,16 @@ static int gc0310_probe(struct i2c_client *client)
 	v4l2_i2c_subdev_init(&sensor->sd, client, &gc0310_ops);
 	gc0310_fill_format(&sensor->mode.fmt);
 
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(sensor->regmap))
+		return PTR_ERR(sensor->regmap);
+
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_enable(&client->dev);
 	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
 	pm_runtime_use_autosuspend(&client->dev);
 
-	ret = gc0310_detect(client);
+	ret = gc0310_detect(sensor);
 	if (ret) {
 		gc0310_remove(client);
 		return ret;
-- 
2.49.0


