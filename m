Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC6E27ECF1
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 17:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729432AbgI3PaX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 11:30:23 -0400
Received: from retiisi.org.uk ([95.216.213.190]:44656 "EHLO
        hillosipuli.retiisi.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730737AbgI3P3E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 11:29:04 -0400
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 62CD0634C98
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:28:47 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Subject: [PATCH 014/100] smiapp: Rename register access functions
Date:   Wed, 30 Sep 2020 18:27:32 +0300
Message-Id: <20200930152858.8471-15-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
References: <20200930152858.8471-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename register access functions by changing smiapp to ccs.

The functions operating on register addresses have "addr" appended to the
name.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c  | 67 +++++++++++++------------
 drivers/media/i2c/smiapp/smiapp-quirk.c | 22 ++++----
 drivers/media/i2c/smiapp/smiapp-regs.c  | 47 ++++++++---------
 drivers/media/i2c/smiapp/smiapp-regs.h  | 14 +++---
 4 files changed, 76 insertions(+), 74 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index b9faf38d4bba..5b322194cb4b 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -180,7 +180,7 @@ static int ccs_read_all_limits(struct smiapp_sensor *sensor)
 		     j++, reg += width, ptr += width) {
 			u32 val;
 
-			ret = smiapp_read(sensor, reg, &val);
+			ret = ccs_read_addr(sensor, reg, &val);
 			if (ret)
 				goto out_err;
 
@@ -2450,59 +2450,60 @@ static int smiapp_identify_module(struct smiapp_sensor *sensor)
 	rval = ccs_read(sensor, MODULE_MANUFACTURER_ID,
 			&minfo->mipi_manufacturer_id);
 	if (!rval && !minfo->mipi_manufacturer_id)
-		rval = smiapp_read_8only(sensor, SMIAPP_REG_U8_MANUFACTURER_ID,
-					 &minfo->smia_manufacturer_id);
+		rval = ccs_read_addr_8only(sensor,
+					   SMIAPP_REG_U8_MANUFACTURER_ID,
+					   &minfo->smia_manufacturer_id);
 	if (!rval)
-		rval = smiapp_read_8only(sensor, CCS_R_MODULE_MODEL_ID,
-					 &minfo->model_id);
+		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_MODEL_ID,
+					   &minfo->model_id);
 	if (!rval)
-		rval = smiapp_read_8only(sensor,
-					 CCS_R_MODULE_REVISION_NUMBER_MAJOR,
-					 &minfo->revision_number_major);
+		rval = ccs_read_addr_8only(sensor,
+					   CCS_R_MODULE_REVISION_NUMBER_MAJOR,
+					   &minfo->revision_number_major);
 	if (!rval)
-		rval = smiapp_read_8only(sensor,
-					 CCS_R_MODULE_REVISION_NUMBER_MINOR,
-					 &minfo->revision_number_minor);
+		rval = ccs_read_addr_8only(sensor,
+					   CCS_R_MODULE_REVISION_NUMBER_MINOR,
+					   &minfo->revision_number_minor);
 	if (!rval)
-		rval = smiapp_read_8only(sensor, CCS_R_MODULE_DATE_YEAR,
-					 &minfo->module_year);
+		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_YEAR,
+					   &minfo->module_year);
 	if (!rval)
-		rval = smiapp_read_8only(sensor, CCS_R_MODULE_DATE_MONTH,
-					 &minfo->module_month);
+		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_MONTH,
+					   &minfo->module_month);
 	if (!rval)
-		rval = smiapp_read_8only(sensor, CCS_R_MODULE_DATE_DAY,
-					 &minfo->module_day);
+		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_DAY,
+					   &minfo->module_day);
 
 	/* Sensor info */
 	if (!rval)
 		rval = ccs_read(sensor, SENSOR_MANUFACTURER_ID,
 				&minfo->sensor_mipi_manufacturer_id);
 	if (!rval && !minfo->sensor_mipi_manufacturer_id)
-		rval = smiapp_read_8only(sensor,
-					 CCS_R_SENSOR_MANUFACTURER_ID,
-					 &minfo->sensor_smia_manufacturer_id);
+		rval = ccs_read_addr_8only(sensor,
+					   CCS_R_SENSOR_MANUFACTURER_ID,
+					   &minfo->sensor_smia_manufacturer_id);
 	if (!rval)
-		rval = smiapp_read_8only(sensor,
-					 CCS_R_SENSOR_MODEL_ID,
-					 &minfo->sensor_model_id);
+		rval = ccs_read_addr_8only(sensor,
+					   CCS_R_SENSOR_MODEL_ID,
+					   &minfo->sensor_model_id);
 	if (!rval)
-		rval = smiapp_read_8only(sensor,
-					 CCS_R_SENSOR_REVISION_NUMBER,
-					 &minfo->sensor_revision_number);
+		rval = ccs_read_addr_8only(sensor,
+					   CCS_R_SENSOR_REVISION_NUMBER,
+					   &minfo->sensor_revision_number);
 	if (!rval)
-		rval = smiapp_read_8only(sensor,
-					 CCS_R_SENSOR_FIRMWARE_VERSION,
-					 &minfo->sensor_firmware_version);
+		rval = ccs_read_addr_8only(sensor,
+					   CCS_R_SENSOR_FIRMWARE_VERSION,
+					   &minfo->sensor_firmware_version);
 
 	/* SMIA */
 	if (!rval)
 		rval = ccs_read(sensor, MIPI_CCS_VERSION, &minfo->ccs_version);
 	if (!rval && !minfo->ccs_version)
-		rval = smiapp_read_8only(sensor, SMIAPP_REG_U8_SMIA_VERSION,
-					 &minfo->smia_version);
+		rval = ccs_read_addr_8only(sensor, SMIAPP_REG_U8_SMIA_VERSION,
+					   &minfo->smia_version);
 	if (!rval && !minfo->ccs_version)
-		rval = smiapp_read_8only(sensor, SMIAPP_REG_U8_SMIAPP_VERSION,
-					 &minfo->smiapp_version);
+		rval = ccs_read_addr_8only(sensor, SMIAPP_REG_U8_SMIAPP_VERSION,
+					   &minfo->smiapp_version);
 
 	if (rval) {
 		dev_err(&client->dev, "sensor detection failed\n");
diff --git a/drivers/media/i2c/smiapp/smiapp-quirk.c b/drivers/media/i2c/smiapp/smiapp-quirk.c
index 9422eb61b424..5db97a16eccf 100644
--- a/drivers/media/i2c/smiapp/smiapp-quirk.c
+++ b/drivers/media/i2c/smiapp/smiapp-quirk.c
@@ -14,14 +14,14 @@
 
 #include "smiapp.h"
 
-static int smiapp_write_8s(struct smiapp_sensor *sensor,
-			   const struct smiapp_reg_8 *regs, int len)
+static int ccs_write_addr_8s(struct smiapp_sensor *sensor,
+			     const struct smiapp_reg_8 *regs, int len)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
 	for (; len > 0; len--, regs++) {
-		rval = smiapp_write(sensor, regs->reg, regs->val);
+		rval = ccs_write_addr(sensor, regs->reg, regs->val);
 		if (rval < 0) {
 			dev_err(&client->dev,
 				"error %d writing reg 0x%4.4x, val 0x%2.2x",
@@ -81,7 +81,7 @@ static int jt8ew9_post_poweron(struct smiapp_sensor *sensor)
 
 	};
 
-	return smiapp_write_8s(sensor, regs, ARRAY_SIZE(regs));
+	return ccs_write_addr_8s(sensor, regs, ARRAY_SIZE(regs));
 }
 
 const struct smiapp_quirk smiapp_jt8ew9_quirk = {
@@ -102,7 +102,7 @@ static int imx125es_post_poweron(struct smiapp_sensor *sensor)
 		{ 0x3b08, 0x8c },
 	};
 
-	return smiapp_write_8s(sensor, regs, ARRAY_SIZE(regs));
+	return ccs_write_addr_8s(sensor, regs, ARRAY_SIZE(regs));
 }
 
 const struct smiapp_quirk smiapp_imx125es_quirk = {
@@ -148,13 +148,13 @@ static int jt8ev1_post_poweron(struct smiapp_sensor *sensor)
 		{ 0x30b0, 0x01 },
 	};
 
-	rval = smiapp_write_8s(sensor, regs, ARRAY_SIZE(regs));
+	rval = ccs_write_addr_8s(sensor, regs, ARRAY_SIZE(regs));
 	if (rval < 0)
 		return rval;
 
 	switch (sensor->hwcfg->ext_clk) {
 	case 9600000:
-		return smiapp_write_8s(sensor, regs_96,
+		return ccs_write_addr_8s(sensor, regs_96,
 				       ARRAY_SIZE(regs_96));
 	default:
 		dev_warn(&client->dev, "no MSRs for %d Hz ext_clk\n",
@@ -165,7 +165,7 @@ static int jt8ev1_post_poweron(struct smiapp_sensor *sensor)
 
 static int jt8ev1_pre_streamon(struct smiapp_sensor *sensor)
 {
-	return smiapp_write(sensor, 0x3328, 0x00);
+	return ccs_write_addr(sensor, 0x3328, 0x00);
 }
 
 static int jt8ev1_post_streamoff(struct smiapp_sensor *sensor)
@@ -173,7 +173,7 @@ static int jt8ev1_post_streamoff(struct smiapp_sensor *sensor)
 	int rval;
 
 	/* Workaround: allows fast standby to work properly */
-	rval = smiapp_write(sensor, 0x3205, 0x04);
+	rval = ccs_write_addr(sensor, 0x3205, 0x04);
 	if (rval < 0)
 		return rval;
 
@@ -181,11 +181,11 @@ static int jt8ev1_post_streamoff(struct smiapp_sensor *sensor)
 	usleep_range(2000, 2050);
 
 	/* Restore it */
-	rval = smiapp_write(sensor, 0x3205, 0x00);
+	rval = ccs_write_addr(sensor, 0x3205, 0x00);
 	if (rval < 0)
 		return rval;
 
-	return smiapp_write(sensor, 0x3328, 0x80);
+	return ccs_write_addr(sensor, 0x3328, 0x80);
 }
 
 static int jt8ev1_init(struct smiapp_sensor *sensor)
diff --git a/drivers/media/i2c/smiapp/smiapp-regs.c b/drivers/media/i2c/smiapp/smiapp-regs.c
index 904054d303ba..173d9f8fe56c 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.c
+++ b/drivers/media/i2c/smiapp/smiapp-regs.c
@@ -66,8 +66,8 @@ static uint32_t float_to_u32_mul_1000000(struct i2c_client *client,
  * Read a 8/16/32-bit i2c register.  The value is returned in 'val'.
  * Returns zero if successful, or non-zero otherwise.
  */
-static int ____smiapp_read(struct smiapp_sensor *sensor, u16 reg,
-			   u16 len, u32 *val)
+static int ____ccs_read_addr(struct smiapp_sensor *sensor, u16 reg, u16 len,
+			     u32 *val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct i2c_msg msg;
@@ -113,8 +113,8 @@ static int ____smiapp_read(struct smiapp_sensor *sensor, u16 reg,
 }
 
 /* Read a register using 8-bit access only. */
-static int ____smiapp_read_8only(struct smiapp_sensor *sensor, u16 reg,
-				 u16 len, u32 *val)
+static int ____ccs_read_addr_8only(struct smiapp_sensor *sensor, u16 reg,
+				   u16 len, u32 *val)
 {
 	unsigned int i;
 	int rval;
@@ -124,7 +124,7 @@ static int ____smiapp_read_8only(struct smiapp_sensor *sensor, u16 reg,
 	for (i = 0; i < len; i++) {
 		u32 val8;
 
-		rval = ____smiapp_read(sensor, reg + i, 1, &val8);
+		rval = ____ccs_read_addr(sensor, reg + i, 1, &val8);
 		if (rval < 0)
 			return rval;
 		*val |= val8 << ((len - i - 1) << 3);
@@ -147,18 +147,19 @@ unsigned int ccs_reg_width(u32 reg)
  * Read a 8/16/32-bit i2c register.  The value is returned in 'val'.
  * Returns zero if successful, or non-zero otherwise.
  */
-static int __smiapp_read(struct smiapp_sensor *sensor, u32 reg, u32 *val,
-			 bool only8)
+static int __ccs_read_addr(struct smiapp_sensor *sensor, u32 reg, u32 *val,
+			   bool only8)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	unsigned int len = ccs_reg_width(reg);
 	int rval;
 
 	if (!only8)
-		rval = ____smiapp_read(sensor, SMIAPP_REG_ADDR(reg), len, val);
+		rval = ____ccs_read_addr(sensor, SMIAPP_REG_ADDR(reg), len,
+					    val);
 	else
-		rval = ____smiapp_read_8only(sensor, SMIAPP_REG_ADDR(reg), len,
-					     val);
+		rval = ____ccs_read_addr_8only(sensor, SMIAPP_REG_ADDR(reg),
+						  len, val);
 	if (rval < 0)
 		return rval;
 
@@ -168,16 +169,16 @@ static int __smiapp_read(struct smiapp_sensor *sensor, u32 reg, u32 *val,
 	return 0;
 }
 
-int smiapp_read_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val)
+int ccs_read_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val)
 {
-	return __smiapp_read(
+	return __ccs_read_addr(
 		sensor, reg, val,
 		smiapp_needs_quirk(sensor,
 				   SMIAPP_QUIRK_FLAG_8BIT_READ_ONLY));
 }
 
-static int smiapp_read_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val,
-			     bool force8)
+static int ccs_read_addr_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val,
+			       bool force8)
 {
 	int rval;
 
@@ -189,22 +190,22 @@ static int smiapp_read_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val,
 		return rval;
 
 	if (force8)
-		return __smiapp_read(sensor, reg, val, true);
+		return __ccs_read_addr(sensor, reg, val, true);
 
-	return smiapp_read_no_quirk(sensor, reg, val);
+	return ccs_read_addr_no_quirk(sensor, reg, val);
 }
 
-int smiapp_read(struct smiapp_sensor *sensor, u32 reg, u32 *val)
+int ccs_read_addr(struct smiapp_sensor *sensor, u32 reg, u32 *val)
 {
-	return smiapp_read_quirk(sensor, reg, val, false);
+	return ccs_read_addr_quirk(sensor, reg, val, false);
 }
 
-int smiapp_read_8only(struct smiapp_sensor *sensor, u32 reg, u32 *val)
+int ccs_read_addr_8only(struct smiapp_sensor *sensor, u32 reg, u32 *val)
 {
-	return smiapp_read_quirk(sensor, reg, val, true);
+	return ccs_read_addr_quirk(sensor, reg, val, true);
 }
 
-int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
+int ccs_write_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	struct i2c_msg msg;
@@ -253,7 +254,7 @@ int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val)
  * Write to a 8/16-bit register.
  * Returns zero if successful, or non-zero otherwise.
  */
-int smiapp_write(struct smiapp_sensor *sensor, u32 reg, u32 val)
+int ccs_write_addr(struct smiapp_sensor *sensor, u32 reg, u32 val)
 {
 	int rval;
 
@@ -263,5 +264,5 @@ int smiapp_write(struct smiapp_sensor *sensor, u32 reg, u32 val)
 	if (rval < 0)
 		return rval;
 
-	return smiapp_write_no_quirk(sensor, reg, val);
+	return ccs_write_addr_no_quirk(sensor, reg, val);
 }
diff --git a/drivers/media/i2c/smiapp/smiapp-regs.h b/drivers/media/i2c/smiapp/smiapp-regs.h
index dc946096f368..5df794f65dfc 100644
--- a/drivers/media/i2c/smiapp/smiapp-regs.h
+++ b/drivers/media/i2c/smiapp/smiapp-regs.h
@@ -20,18 +20,18 @@
 
 struct smiapp_sensor;
 
-int smiapp_read_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val);
-int smiapp_read(struct smiapp_sensor *sensor, u32 reg, u32 *val);
-int smiapp_read_8only(struct smiapp_sensor *sensor, u32 reg, u32 *val);
-int smiapp_write_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val);
-int smiapp_write(struct smiapp_sensor *sensor, u32 reg, u32 val);
+int ccs_read_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 *val);
+int ccs_read_addr(struct smiapp_sensor *sensor, u32 reg, u32 *val);
+int ccs_read_addr_8only(struct smiapp_sensor *sensor, u32 reg, u32 *val);
+int ccs_write_addr_no_quirk(struct smiapp_sensor *sensor, u32 reg, u32 val);
+int ccs_write_addr(struct smiapp_sensor *sensor, u32 reg, u32 val);
 
 unsigned int ccs_reg_width(u32 reg);
 
 #define ccs_read(sensor, reg_name, val) \
-	smiapp_read(sensor, CCS_R_##reg_name, val)
+	ccs_read_addr(sensor, CCS_R_##reg_name, val)
 
 #define ccs_write(sensor, reg_name, val) \
-	smiapp_write(sensor, CCS_R_##reg_name, val)
+	ccs_write_addr(sensor, CCS_R_##reg_name, val)
 
 #endif
-- 
2.27.0

