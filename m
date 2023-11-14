Return-Path: <linux-media+bounces-325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 458427EACFA
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 10:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25832B20B77
	for <lists+linux-media@lfdr.de>; Tue, 14 Nov 2023 09:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B520171DC;
	Tue, 14 Nov 2023 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpEV1rHa"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA5E168DA
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 09:25:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB44136
	for <linux-media@vger.kernel.org>; Tue, 14 Nov 2023 01:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699953924; x=1731489924;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bf3FzWILAkOu5x0PnqjdCumLgThTzkip733FaUrqVRk=;
  b=lpEV1rHaUWZ3oE8K+ZTX9/lZ8jIAxBVBTllp2UBEWcA6j3VLTIqUvWnG
   ejaS9NnQ71BhPVy2/OAm743YUv51WZA18S/ofiG9Gc3Shz0UWCxHwwHXZ
   XUhQvxZx1XyAdfhKYDVzzSxgGwjf3DXyFSRVzk/NFIFkfZwjQSXK/W3/y
   14Ul9bI/V7xGMaPzRg2NBuIYH02QWuyZovASnHg8RJ5MmxVhIzMnmK24z
   rmmz1MsRrS3nkEF1C/VFVkocXBiYanFIrVEAQAHcFbS9PapJw/YG86USo
   dWAG1+xfB3NSk7G+WiGfOZN93Fa7u/hUbaYm1cJA29k0MRGPPMDf48pCc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387781736"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="387781736"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938015872"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="938015872"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 01:25:19 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 461CE11FB5E;
	Tue, 14 Nov 2023 11:25:15 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hdegoede@redhat.com
Subject: [PATCH v4 6/6] media: ccs: Use V4L2 CCI for accessing sensor registers
Date: Tue, 14 Nov 2023 11:25:10 +0200
Message-Id: <20231114092510.1443545-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114092510.1443545-1-sakari.ailus@linux.intel.com>
References: <20231114092510.1443545-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use V4L2 CCI for accessing device's registers. The 8-bit compatibility
read option is removed but this is supported by regmap through other
means.

Also the CCS register definitions are re-generated with V4L2 CCI
definitions. The older SMIA++ register definitions have been manually
converted.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ccs/ccs-core.c        |  84 +--
 drivers/media/i2c/ccs/ccs-reg-access.c  | 192 +----
 drivers/media/i2c/ccs/ccs-regs.h        | 906 +++++++++++-----------
 drivers/media/i2c/ccs/ccs.h             |   2 +
 drivers/media/i2c/ccs/smiapp-reg-defs.h | 951 ++++++++++++------------
 5 files changed, 999 insertions(+), 1136 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index d210b6c87db4..88eec1e9932e 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -25,8 +25,9 @@
 #include <linux/slab.h>
 #include <linux/smiapp.h>
 #include <linux/v4l2-mediabus.h>
-#include <media/v4l2-fwnode.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 #include <uapi/linux/ccs.h>
 
 #include "ccs.h"
@@ -98,7 +99,7 @@ static int ccs_limit_ptr(struct ccs_sensor *sensor, unsigned int limit,
 	linfo = &ccs_limits[ccs_limit_offsets[limit].info];
 
 	if (WARN_ON(!sensor->ccs_limits) ||
-	    WARN_ON(offset + ccs_reg_width(linfo->reg) >
+	    WARN_ON(offset + CCI_REG_WIDTH_BYTES(linfo->reg) >
 		    ccs_limit_offsets[limit + 1].lim))
 		return -EINVAL;
 
@@ -124,7 +125,7 @@ void ccs_replace_limit(struct ccs_sensor *sensor,
 	dev_dbg(&client->dev, "quirk: 0x%8.8x \"%s\" %u = %u, 0x%x\n",
 		linfo->reg, linfo->name, offset, val, val);
 
-	ccs_assign_limit(ptr, ccs_reg_width(linfo->reg), val);
+	ccs_assign_limit(ptr, CCI_REG_WIDTH_BYTES(linfo->reg), val);
 }
 
 u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
@@ -138,7 +139,7 @@ u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
 	if (ret)
 		return 0;
 
-	switch (ccs_reg_width(ccs_limits[ccs_limit_offsets[limit].info].reg)) {
+	switch (CCI_REG_WIDTH_BYTES(ccs_limits[ccs_limit_offsets[limit].info].reg)) {
 	case sizeof(u8):
 		val = *(u8 *)ptr;
 		break;
@@ -176,7 +177,7 @@ static int ccs_read_all_limits(struct ccs_sensor *sensor)
 
 	for (i = 0, l = 0, ptr = alloc; ccs_limits[i].size; i++) {
 		u32 reg = ccs_limits[i].reg;
-		unsigned int width = ccs_reg_width(reg);
+		unsigned int width = CCI_REG_WIDTH_BYTES(reg);
 		unsigned int j;
 
 		if (l == CCS_L_LAST) {
@@ -2725,66 +2726,54 @@ static int ccs_identify_module(struct ccs_sensor *sensor)
 	rval = ccs_read(sensor, MODULE_MANUFACTURER_ID,
 			&minfo->mipi_manufacturer_id);
 	if (!rval && !minfo->mipi_manufacturer_id)
-		rval = ccs_read_addr_8only(sensor,
-					   SMIAPP_REG_U8_MANUFACTURER_ID,
-					   &minfo->smia_manufacturer_id);
+		rval = ccs_read_addr(sensor, SMIAPP_REG_U8_MANUFACTURER_ID,
+				     &minfo->smia_manufacturer_id);
 	if (!rval)
-		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_MODEL_ID,
-					   &minfo->model_id);
+		rval = ccs_read(sensor, MODULE_MODEL_ID, &minfo->model_id);
 	if (!rval)
-		rval = ccs_read_addr_8only(sensor,
-					   CCS_R_MODULE_REVISION_NUMBER_MAJOR,
-					   &rev);
+		rval = ccs_read(sensor, MODULE_REVISION_NUMBER_MAJOR, &rev);
 	if (!rval) {
-		rval = ccs_read_addr_8only(sensor,
-					   CCS_R_MODULE_REVISION_NUMBER_MINOR,
-					   &minfo->revision_number);
+		rval = ccs_read(sensor, MODULE_REVISION_NUMBER_MINOR,
+				&minfo->revision_number);
 		minfo->revision_number |= rev << 8;
 	}
 	if (!rval)
-		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_YEAR,
-					   &minfo->module_year);
+		rval = ccs_read(sensor, MODULE_DATE_YEAR, &minfo->module_year);
 	if (!rval)
-		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_MONTH,
-					   &minfo->module_month);
+		rval = ccs_read(sensor, MODULE_DATE_MONTH,
+				&minfo->module_month);
 	if (!rval)
-		rval = ccs_read_addr_8only(sensor, CCS_R_MODULE_DATE_DAY,
-					   &minfo->module_day);
+		rval = ccs_read(sensor, MODULE_DATE_DAY, &minfo->module_day);
 
 	/* Sensor info */
 	if (!rval)
 		rval = ccs_read(sensor, SENSOR_MANUFACTURER_ID,
 				&minfo->sensor_mipi_manufacturer_id);
 	if (!rval && !minfo->sensor_mipi_manufacturer_id)
-		rval = ccs_read_addr_8only(sensor,
-					   CCS_R_SENSOR_MANUFACTURER_ID,
-					   &minfo->sensor_smia_manufacturer_id);
+		rval = ccs_read(sensor, SENSOR_MANUFACTURER_ID,
+				&minfo->sensor_smia_manufacturer_id);
 	if (!rval)
-		rval = ccs_read_addr_8only(sensor,
-					   CCS_R_SENSOR_MODEL_ID,
-					   &minfo->sensor_model_id);
+		rval = ccs_read(sensor, SENSOR_MODEL_ID,
+				&minfo->sensor_model_id);
 	if (!rval)
-		rval = ccs_read_addr_8only(sensor,
-					   CCS_R_SENSOR_REVISION_NUMBER,
-					   &minfo->sensor_revision_number);
+		rval = ccs_read(sensor, SENSOR_REVISION_NUMBER,
+				&minfo->sensor_revision_number);
 	if (!rval && !minfo->sensor_revision_number)
-		rval = ccs_read_addr_8only(sensor,
-					   CCS_R_SENSOR_REVISION_NUMBER_16,
-					   &minfo->sensor_revision_number);
+		rval = ccs_read(sensor, SENSOR_REVISION_NUMBER_16,
+				&minfo->sensor_revision_number);
 	if (!rval)
-		rval = ccs_read_addr_8only(sensor,
-					   CCS_R_SENSOR_FIRMWARE_VERSION,
-					   &minfo->sensor_firmware_version);
+		rval = ccs_read(sensor, SENSOR_FIRMWARE_VERSION,
+				&minfo->sensor_firmware_version);
 
 	/* SMIA */
 	if (!rval)
 		rval = ccs_read(sensor, MIPI_CCS_VERSION, &minfo->ccs_version);
 	if (!rval && !minfo->ccs_version)
-		rval = ccs_read_addr_8only(sensor, SMIAPP_REG_U8_SMIA_VERSION,
-					   &minfo->smia_version);
+		rval = ccs_read_addr(sensor, SMIAPP_REG_U8_SMIA_VERSION,
+				     &minfo->smia_version);
 	if (!rval && !minfo->ccs_version)
-		rval = ccs_read_addr_8only(sensor, SMIAPP_REG_U8_SMIAPP_VERSION,
-					   &minfo->smiapp_version);
+		rval = ccs_read_addr(sensor, SMIAPP_REG_U8_SMIAPP_VERSION,
+				     &minfo->smiapp_version);
 
 	if (rval) {
 		dev_err(&client->dev, "sensor detection failed\n");
@@ -3318,6 +3307,13 @@ static int ccs_probe(struct i2c_client *client)
 	if (IS_ERR(sensor->xshutdown))
 		return PTR_ERR(sensor->xshutdown);
 
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap)) {
+		dev_err(&client->dev, "can't initialise CCI (%ld)\n",
+			PTR_ERR(sensor->regmap));
+		return PTR_ERR(sensor->regmap);
+	}
+
 	rval = ccs_power_on(&client->dev);
 	if (rval < 0)
 		return rval;
@@ -3648,12 +3644,16 @@ static int ccs_module_init(void)
 {
 	unsigned int i, l;
 
+	CCS_BUILD_BUG;
+
 	for (i = 0, l = 0; ccs_limits[i].size && l < CCS_L_LAST; i++) {
 		if (!(ccs_limits[i].flags & CCS_L_FL_SAME_REG)) {
 			ccs_limit_offsets[l + 1].lim =
 				ALIGN(ccs_limit_offsets[l].lim +
 				      ccs_limits[i].size,
-				      ccs_reg_width(ccs_limits[i + 1].reg));
+				      ccs_limits[i + 1].reg ?
+				      CCI_REG_WIDTH_BYTES(ccs_limits[i + 1].reg) :
+				      1U);
 			ccs_limit_offsets[l].info = i;
 			l++;
 		} else {
diff --git a/drivers/media/i2c/ccs/ccs-reg-access.c b/drivers/media/i2c/ccs/ccs-reg-access.c
index 03daaa8310a6..ed79075505e6 100644
--- a/drivers/media/i2c/ccs/ccs-reg-access.c
+++ b/drivers/media/i2c/ccs/ccs-reg-access.c
@@ -62,87 +62,6 @@ static u32 float_to_u32_mul_1000000(struct i2c_client *client, u32 phloat)
 }
 
 
-/*
- * Read a 8/16/32-bit i2c register.  The value is returned in 'val'.
- * Returns zero if successful, or non-zero otherwise.
- */
-static int ____ccs_read_addr(struct ccs_sensor *sensor, u16 reg, u16 len,
-			     u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	struct i2c_msg msg;
-	unsigned char data_buf[sizeof(u32)] = { 0 };
-	unsigned char offset_buf[sizeof(u16)];
-	int r;
-
-	if (len > sizeof(data_buf))
-		return -EINVAL;
-
-	msg.addr = client->addr;
-	msg.flags = 0;
-	msg.len = sizeof(offset_buf);
-	msg.buf = offset_buf;
-	put_unaligned_be16(reg, offset_buf);
-
-	r = i2c_transfer(client->adapter, &msg, 1);
-	if (r != 1) {
-		if (r >= 0)
-			r = -EBUSY;
-		goto err;
-	}
-
-	msg.len = len;
-	msg.flags = I2C_M_RD;
-	msg.buf = &data_buf[sizeof(data_buf) - len];
-
-	r = i2c_transfer(client->adapter, &msg, 1);
-	if (r != 1) {
-		if (r >= 0)
-			r = -EBUSY;
-		goto err;
-	}
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-
-err:
-	dev_err(&client->dev, "read from offset 0x%x error %d\n", reg, r);
-
-	return r;
-}
-
-/* Read a register using 8-bit access only. */
-static int ____ccs_read_addr_8only(struct ccs_sensor *sensor, u16 reg,
-				   u16 len, u32 *val)
-{
-	unsigned int i;
-	int rval;
-
-	*val = 0;
-
-	for (i = 0; i < len; i++) {
-		u32 val8;
-
-		rval = ____ccs_read_addr(sensor, reg + i, 1, &val8);
-		if (rval < 0)
-			return rval;
-		*val |= val8 << ((len - i - 1) << 3);
-	}
-
-	return 0;
-}
-
-unsigned int ccs_reg_width(u32 reg)
-{
-	if (reg & CCS_FL_16BIT)
-		return sizeof(u16);
-	if (reg & CCS_FL_32BIT)
-		return sizeof(u32);
-
-	return sizeof(u8);
-}
-
 static u32 ireal32_to_u32_mul_1000000(struct i2c_client *client, u32 val)
 {
 	if (val >> 10 > U32_MAX / 15625) {
@@ -178,21 +97,14 @@ u32 ccs_reg_conv(struct ccs_sensor *sensor, u32 reg, u32 val)
 static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
 			   bool only8, bool conv)
 {
-	unsigned int len = ccs_reg_width(reg);
+	u64 __val;
 	int rval;
 
-	if (!only8)
-		rval = ____ccs_read_addr(sensor, CCS_REG_ADDR(reg), len, val);
-	else
-		rval = ____ccs_read_addr_8only(sensor, CCS_REG_ADDR(reg), len,
-					       val);
+	rval = cci_read(sensor->regmap, reg, &__val, NULL);
 	if (rval < 0)
 		return rval;
 
-	if (!conv)
-		return 0;
-
-	*val = ccs_reg_conv(sensor, reg, *val);
+	*val = conv ? ccs_reg_conv(sensor, reg, __val) : __val;
 
 	return 0;
 }
@@ -200,7 +112,7 @@ static int __ccs_read_addr(struct ccs_sensor *sensor, u32 reg, u32 *val,
 static int __ccs_static_data_read_ro_reg(struct ccs_reg *regs, size_t num_regs,
 					 u32 reg, u32 *val)
 {
-	unsigned int width = ccs_reg_width(reg);
+	unsigned int width = CCI_REG_WIDTH_BYTES(reg);
 	size_t i;
 
 	for (i = 0; i < num_regs; i++, regs++) {
@@ -292,71 +204,13 @@ int ccs_read_addr_noconv(struct ccs_sensor *sensor, u32 reg, u32 *val)
 	return ccs_read_addr_raw(sensor, reg, val, false, true, false, true);
 }
 
-static int ccs_write_retry(struct i2c_client *client, struct i2c_msg *msg)
-{
-	unsigned int retries;
-	int r;
-
-	for (retries = 0; retries < 10; retries++) {
-		/*
-		 * Due to unknown reason sensor stops responding. This
-		 * loop is a temporaty solution until the root cause
-		 * is found.
-		 */
-		r = i2c_transfer(client->adapter, msg, 1);
-		if (r != 1) {
-			usleep_range(1000, 2000);
-			continue;
-		}
-
-		if (retries)
-			dev_err(&client->dev,
-				"sensor i2c stall encountered. retries: %d\n",
-				retries);
-		return 0;
-	}
-
-	return r;
-}
-
-int ccs_write_addr_no_quirk(struct ccs_sensor *sensor, u32 reg, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	struct i2c_msg msg;
-	unsigned char data[6];
-	unsigned int len = ccs_reg_width(reg);
-	int r;
-
-	if (len > sizeof(data) - 2)
-		return -EINVAL;
-
-	msg.addr = client->addr;
-	msg.flags = 0; /* Write */
-	msg.len = 2 + len;
-	msg.buf = data;
-
-	put_unaligned_be16(CCS_REG_ADDR(reg), data);
-	put_unaligned_be32(val << (8 * (sizeof(val) - len)), data + 2);
-
-	dev_dbg(&client->dev, "writing reg 0x%4.4x value 0x%*.*x (%u)\n",
-		CCS_REG_ADDR(reg), ccs_reg_width(reg) << 1,
-		ccs_reg_width(reg) << 1, val, val);
-
-	r = ccs_write_retry(client, &msg);
-	if (r)
-		dev_err(&client->dev,
-			"wrote 0x%x to offset 0x%x error %d\n", val,
-			CCS_REG_ADDR(reg), r);
-
-	return r;
-}
-
 /*
  * Write to a 8/16-bit register.
  * Returns zero if successful, or non-zero otherwise.
  */
 int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
 {
+	unsigned int retries = 10;
 	int rval;
 
 	rval = ccs_call_quirk(sensor, reg_access, true, &reg, &val);
@@ -365,7 +219,13 @@ int ccs_write_addr(struct ccs_sensor *sensor, u32 reg, u32 val)
 	if (rval < 0)
 		return rval;
 
-	return ccs_write_addr_no_quirk(sensor, reg, val);
+	rval = 0;
+	do {
+		if (cci_write(sensor->regmap, reg, val, &rval))
+			fsleep(1000);
+	} while (rval && --retries);
+
+	return rval;
 }
 
 #define MAX_WRITE_LEN	32U
@@ -374,40 +234,38 @@ int ccs_write_data_regs(struct ccs_sensor *sensor, struct ccs_reg *regs,
 			size_t num_regs)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
-	unsigned char buf[2 + MAX_WRITE_LEN];
-	struct i2c_msg msg = {
-		.addr = client->addr,
-		.buf = buf,
-	};
 	size_t i;
 
 	for (i = 0; i < num_regs; i++, regs++) {
 		unsigned char *regdata = regs->value;
 		unsigned int j;
+		int len;
 
-		for (j = 0; j < regs->len;
-		     j += msg.len - 2, regdata += msg.len - 2) {
+		for (j = 0; j < regs->len; j += len, regdata += len) {
 			char printbuf[(MAX_WRITE_LEN << 1) +
 				      1 /* \0 */] = { 0 };
+			unsigned int retries = 10;
 			int rval;
 
-			msg.len = min(regs->len - j, MAX_WRITE_LEN);
+			len = min(regs->len - j, MAX_WRITE_LEN);
 
-			bin2hex(printbuf, regdata, msg.len);
+			bin2hex(printbuf, regdata, len);
 			dev_dbg(&client->dev,
 				"writing msr reg 0x%4.4x value 0x%s\n",
 				regs->addr + j, printbuf);
 
-			put_unaligned_be16(regs->addr + j, buf);
-			memcpy(buf + 2, regdata, msg.len);
-
-			msg.len += 2;
+			do {
+				rval = regmap_bulk_write(sensor->regmap,
+							 regs->addr + j,
+							 regdata, len);
+				if (rval)
+					fsleep(1000);
+			} while (rval && --retries);
 
-			rval = ccs_write_retry(client, &msg);
 			if (rval) {
 				dev_err(&client->dev,
 					"error writing %u octets to address 0x%4.4x\n",
-					msg.len, regs->addr + j);
+					len, regs->addr + j);
 				return rval;
 			}
 		}
diff --git a/drivers/media/i2c/ccs/ccs-regs.h b/drivers/media/i2c/ccs/ccs-regs.h
index 6ce84c5ecf20..7b5dbc86e4cd 100644
--- a/drivers/media/i2c/ccs/ccs-regs.h
+++ b/drivers/media/i2c/ccs/ccs-regs.h
@@ -10,59 +10,59 @@
 
 #include <linux/bits.h>
 
-#define CCS_FL_BASE		16
-#define CCS_FL_16BIT		BIT(CCS_FL_BASE)
-#define CCS_FL_32BIT		BIT(CCS_FL_BASE + 1)
-#define CCS_FL_FLOAT_IREAL	BIT(CCS_FL_BASE + 2)
-#define CCS_FL_IREAL		BIT(CCS_FL_BASE + 3)
-#define CCS_R_ADDR(r)		((r) & 0xffff)
+#include <media/v4l2-cci.h>
 
-#define CCS_R_MODULE_MODEL_ID					(0x0000 | CCS_FL_16BIT)
-#define CCS_R_MODULE_REVISION_NUMBER_MAJOR			0x0002
-#define CCS_R_FRAME_COUNT					0x0005
-#define CCS_R_PIXEL_ORDER					0x0006
+#define CCS_FL_BASE		CCI_REG_PRIVATE_SHIFT
+#define CCS_FL_FLOAT_IREAL	BIT(CCS_FL_BASE)
+#define CCS_FL_IREAL		BIT(CCS_FL_BASE + 1)
+#define CCS_BUILD_BUG \
+	BUILD_BUG_ON(~CCI_REG_PRIVATE_MASK & (BIT(CCS_FL_BASE) | BIT(CCS_FL_BASE + 1)))
+#define CCS_R_MODULE_MODEL_ID					CCI_REG16(0x0000)
+#define CCS_R_MODULE_REVISION_NUMBER_MAJOR			CCI_REG8(0x0002)
+#define CCS_R_FRAME_COUNT					CCI_REG8(0x0005)
+#define CCS_R_PIXEL_ORDER					CCI_REG8(0x0006)
 #define CCS_PIXEL_ORDER_GRBG					0U
 #define CCS_PIXEL_ORDER_RGGB					1U
 #define CCS_PIXEL_ORDER_BGGR					2U
 #define CCS_PIXEL_ORDER_GBRG					3U
-#define CCS_R_MIPI_CCS_VERSION					0x0007
+#define CCS_R_MIPI_CCS_VERSION					CCI_REG8(0x0007)
 #define CCS_MIPI_CCS_VERSION_V1_0				0x10
 #define CCS_MIPI_CCS_VERSION_V1_1				0x11
 #define CCS_MIPI_CCS_VERSION_MAJOR_SHIFT			4U
 #define CCS_MIPI_CCS_VERSION_MAJOR_MASK				0xf0
 #define CCS_MIPI_CCS_VERSION_MINOR_SHIFT			0U
 #define CCS_MIPI_CCS_VERSION_MINOR_MASK				0xf
-#define CCS_R_DATA_PEDESTAL					(0x0008 | CCS_FL_16BIT)
-#define CCS_R_MODULE_MANUFACTURER_ID				(0x000e | CCS_FL_16BIT)
-#define CCS_R_MODULE_REVISION_NUMBER_MINOR			0x0010
-#define CCS_R_MODULE_DATE_YEAR					0x0012
-#define CCS_R_MODULE_DATE_MONTH					0x0013
-#define CCS_R_MODULE_DATE_DAY					0x0014
-#define CCS_R_MODULE_DATE_PHASE					0x0015
+#define CCS_R_DATA_PEDESTAL					CCI_REG16(0x0008)
+#define CCS_R_MODULE_MANUFACTURER_ID				CCI_REG16(0x000e)
+#define CCS_R_MODULE_REVISION_NUMBER_MINOR			CCI_REG8(0x0010)
+#define CCS_R_MODULE_DATE_YEAR					CCI_REG8(0x0012)
+#define CCS_R_MODULE_DATE_MONTH					CCI_REG8(0x0013)
+#define CCS_R_MODULE_DATE_DAY					CCI_REG8(0x0014)
+#define CCS_R_MODULE_DATE_PHASE					CCI_REG8(0x0015)
 #define CCS_MODULE_DATE_PHASE_SHIFT				0U
 #define CCS_MODULE_DATE_PHASE_MASK				0x7
 #define CCS_MODULE_DATE_PHASE_TS				0U
 #define CCS_MODULE_DATE_PHASE_ES				1U
 #define CCS_MODULE_DATE_PHASE_CS				2U
 #define CCS_MODULE_DATE_PHASE_MP				3U
-#define CCS_R_SENSOR_MODEL_ID					(0x0016 | CCS_FL_16BIT)
-#define CCS_R_SENSOR_REVISION_NUMBER				0x0018
-#define CCS_R_SENSOR_FIRMWARE_VERSION				0x001a
-#define CCS_R_SERIAL_NUMBER					(0x001c | CCS_FL_32BIT)
-#define CCS_R_SENSOR_MANUFACTURER_ID				(0x0020 | CCS_FL_16BIT)
-#define CCS_R_SENSOR_REVISION_NUMBER_16				(0x0022 | CCS_FL_16BIT)
-#define CCS_R_FRAME_FORMAT_MODEL_TYPE				0x0040
+#define CCS_R_SENSOR_MODEL_ID					CCI_REG16(0x0016)
+#define CCS_R_SENSOR_REVISION_NUMBER				CCI_REG8(0x0018)
+#define CCS_R_SENSOR_FIRMWARE_VERSION				CCI_REG8(0x001a)
+#define CCS_R_SERIAL_NUMBER					CCI_REG32(0x001c)
+#define CCS_R_SENSOR_MANUFACTURER_ID				CCI_REG16(0x0020)
+#define CCS_R_SENSOR_REVISION_NUMBER_16				CCI_REG16(0x0022)
+#define CCS_R_FRAME_FORMAT_MODEL_TYPE				CCI_REG8(0x0040)
 #define CCS_FRAME_FORMAT_MODEL_TYPE_2_BYTE			1U
 #define CCS_FRAME_FORMAT_MODEL_TYPE_4_BYTE			2U
-#define CCS_R_FRAME_FORMAT_MODEL_SUBTYPE			0x0041
+#define CCS_R_FRAME_FORMAT_MODEL_SUBTYPE			CCI_REG8(0x0041)
 #define CCS_FRAME_FORMAT_MODEL_SUBTYPE_ROWS_SHIFT		0U
 #define CCS_FRAME_FORMAT_MODEL_SUBTYPE_ROWS_MASK		0xf
 #define CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_SHIFT		4U
 #define CCS_FRAME_FORMAT_MODEL_SUBTYPE_COLUMNS_MASK		0xf0
-#define CCS_R_FRAME_FORMAT_DESCRIPTOR(n)			((0x0042 | CCS_FL_16BIT) + (n) * 2)
+#define CCS_R_FRAME_FORMAT_DESCRIPTOR(n)			CCI_REG16(0x0042 + (n) * 2)
 #define CCS_LIM_FRAME_FORMAT_DESCRIPTOR_MIN_N			0U
 #define CCS_LIM_FRAME_FORMAT_DESCRIPTOR_MAX_N			14U
-#define CCS_R_FRAME_FORMAT_DESCRIPTOR_4(n)			((0x0060 | CCS_FL_32BIT) + (n) * 4)
+#define CCS_R_FRAME_FORMAT_DESCRIPTOR_4(n)			CCI_REG32(0x0060 + (n) * 4)
 #define CCS_FRAME_FORMAT_DESCRIPTOR_PIXELS_SHIFT		0U
 #define CCS_FRAME_FORMAT_DESCRIPTOR_PIXELS_MASK			0xfff
 #define CCS_FRAME_FORMAT_DESCRIPTOR_PCODE_SHIFT			12U
@@ -97,91 +97,91 @@
 #define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_4	12U
 #define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_5	13U
 #define CCS_FRAME_FORMAT_DESCRIPTOR_4_PCODE_MANUF_SPECIFIC_6	14U
-#define CCS_R_ANALOG_GAIN_CAPABILITY				(0x0080 | CCS_FL_16BIT)
+#define CCS_R_ANALOG_GAIN_CAPABILITY				CCI_REG16(0x0080)
 #define CCS_ANALOG_GAIN_CAPABILITY_GLOBAL			0U
 #define CCS_ANALOG_GAIN_CAPABILITY_ALTERNATE_GLOBAL		2U
-#define CCS_R_ANALOG_GAIN_CODE_MIN				(0x0084 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_GAIN_CODE_MAX				(0x0086 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_GAIN_CODE_STEP				(0x0088 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_GAIN_TYPE					(0x008a | CCS_FL_16BIT)
-#define CCS_R_ANALOG_GAIN_M0					(0x008c | CCS_FL_16BIT)
-#define CCS_R_ANALOG_GAIN_C0					(0x008e | CCS_FL_16BIT)
-#define CCS_R_ANALOG_GAIN_M1					(0x0090 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_GAIN_C1					(0x0092 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_LINEAR_GAIN_MIN				(0x0094 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_LINEAR_GAIN_MAX				(0x0096 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_LINEAR_GAIN_STEP_SIZE			(0x0098 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_EXPONENTIAL_GAIN_MIN			(0x009a | CCS_FL_16BIT)
-#define CCS_R_ANALOG_EXPONENTIAL_GAIN_MAX			(0x009c | CCS_FL_16BIT)
-#define CCS_R_ANALOG_EXPONENTIAL_GAIN_STEP_SIZE			(0x009e | CCS_FL_16BIT)
-#define CCS_R_DATA_FORMAT_MODEL_TYPE				0x00c0
+#define CCS_R_ANALOG_GAIN_CODE_MIN				CCI_REG16(0x0084)
+#define CCS_R_ANALOG_GAIN_CODE_MAX				CCI_REG16(0x0086)
+#define CCS_R_ANALOG_GAIN_CODE_STEP				CCI_REG16(0x0088)
+#define CCS_R_ANALOG_GAIN_TYPE					CCI_REG16(0x008a)
+#define CCS_R_ANALOG_GAIN_M0					CCI_REG16(0x008c)
+#define CCS_R_ANALOG_GAIN_C0					CCI_REG16(0x008e)
+#define CCS_R_ANALOG_GAIN_M1					CCI_REG16(0x0090)
+#define CCS_R_ANALOG_GAIN_C1					CCI_REG16(0x0092)
+#define CCS_R_ANALOG_LINEAR_GAIN_MIN				CCI_REG16(0x0094)
+#define CCS_R_ANALOG_LINEAR_GAIN_MAX				CCI_REG16(0x0096)
+#define CCS_R_ANALOG_LINEAR_GAIN_STEP_SIZE			CCI_REG16(0x0098)
+#define CCS_R_ANALOG_EXPONENTIAL_GAIN_MIN			CCI_REG16(0x009a)
+#define CCS_R_ANALOG_EXPONENTIAL_GAIN_MAX			CCI_REG16(0x009c)
+#define CCS_R_ANALOG_EXPONENTIAL_GAIN_STEP_SIZE			CCI_REG16(0x009e)
+#define CCS_R_DATA_FORMAT_MODEL_TYPE				CCI_REG8(0x00c0)
 #define CCS_DATA_FORMAT_MODEL_TYPE_NORMAL			1U
 #define CCS_DATA_FORMAT_MODEL_TYPE_EXTENDED			2U
-#define CCS_R_DATA_FORMAT_MODEL_SUBTYPE				0x00c1
+#define CCS_R_DATA_FORMAT_MODEL_SUBTYPE				CCI_REG8(0x00c1)
 #define CCS_DATA_FORMAT_MODEL_SUBTYPE_ROWS_SHIFT		0U
 #define CCS_DATA_FORMAT_MODEL_SUBTYPE_ROWS_MASK			0xf
 #define CCS_DATA_FORMAT_MODEL_SUBTYPE_COLUMNS_SHIFT		4U
 #define CCS_DATA_FORMAT_MODEL_SUBTYPE_COLUMNS_MASK		0xf0
-#define CCS_R_DATA_FORMAT_DESCRIPTOR(n)				((0x00c2 | CCS_FL_16BIT) + (n) * 2)
+#define CCS_R_DATA_FORMAT_DESCRIPTOR(n)				CCI_REG16(0x00c2 + (n) * 2)
 #define CCS_LIM_DATA_FORMAT_DESCRIPTOR_MIN_N			0U
 #define CCS_LIM_DATA_FORMAT_DESCRIPTOR_MAX_N			15U
 #define CCS_DATA_FORMAT_DESCRIPTOR_COMPRESSED_SHIFT		0U
 #define CCS_DATA_FORMAT_DESCRIPTOR_COMPRESSED_MASK		0xff
 #define CCS_DATA_FORMAT_DESCRIPTOR_UNCOMPRESSED_SHIFT		8U
 #define CCS_DATA_FORMAT_DESCRIPTOR_UNCOMPRESSED_MASK		0xff00
-#define CCS_R_MODE_SELECT					0x0100
+#define CCS_R_MODE_SELECT					CCI_REG8(0x0100)
 #define CCS_MODE_SELECT_SOFTWARE_STANDBY			0U
 #define CCS_MODE_SELECT_STREAMING				1U
-#define CCS_R_IMAGE_ORIENTATION					0x0101
+#define CCS_R_IMAGE_ORIENTATION					CCI_REG8(0x0101)
 #define CCS_IMAGE_ORIENTATION_HORIZONTAL_MIRROR			BIT(0)
 #define CCS_IMAGE_ORIENTATION_VERTICAL_FLIP			BIT(1)
-#define CCS_R_SOFTWARE_RESET					0x0103
+#define CCS_R_SOFTWARE_RESET					CCI_REG8(0x0103)
 #define CCS_SOFTWARE_RESET_OFF					0U
 #define CCS_SOFTWARE_RESET_ON					1U
-#define CCS_R_GROUPED_PARAMETER_HOLD				0x0104
-#define CCS_R_MASK_CORRUPTED_FRAMES				0x0105
+#define CCS_R_GROUPED_PARAMETER_HOLD				CCI_REG8(0x0104)
+#define CCS_R_MASK_CORRUPTED_FRAMES				CCI_REG8(0x0105)
 #define CCS_MASK_CORRUPTED_FRAMES_ALLOW				0U
 #define CCS_MASK_CORRUPTED_FRAMES_MASK				1U
-#define CCS_R_FAST_STANDBY_CTRL					0x0106
+#define CCS_R_FAST_STANDBY_CTRL					CCI_REG8(0x0106)
 #define CCS_FAST_STANDBY_CTRL_COMPLETE_FRAMES			0U
 #define CCS_FAST_STANDBY_CTRL_FRAME_TRUNCATION			1U
-#define CCS_R_CCI_ADDRESS_CTRL					0x0107
-#define CCS_R_2ND_CCI_IF_CTRL					0x0108
+#define CCS_R_CCI_ADDRESS_CTRL					CCI_REG8(0x0107)
+#define CCS_R_2ND_CCI_IF_CTRL					CCI_REG8(0x0108)
 #define CCS_2ND_CCI_IF_CTRL_ENABLE				BIT(0)
 #define CCS_2ND_CCI_IF_CTRL_ACK					BIT(1)
-#define CCS_R_2ND_CCI_ADDRESS_CTRL				0x0109
-#define CCS_R_CSI_CHANNEL_IDENTIFIER				0x0110
-#define CCS_R_CSI_SIGNALING_MODE				0x0111
+#define CCS_R_2ND_CCI_ADDRESS_CTRL				CCI_REG8(0x0109)
+#define CCS_R_CSI_CHANNEL_IDENTIFIER				CCI_REG8(0x0110)
+#define CCS_R_CSI_SIGNALING_MODE				CCI_REG8(0x0111)
 #define CCS_CSI_SIGNALING_MODE_CSI_2_DPHY			2U
 #define CCS_CSI_SIGNALING_MODE_CSI_2_CPHY			3U
-#define CCS_R_CSI_DATA_FORMAT					(0x0112 | CCS_FL_16BIT)
-#define CCS_R_CSI_LANE_MODE					0x0114
-#define CCS_R_DPCM_FRAME_DT					0x011d
-#define CCS_R_BOTTOM_EMBEDDED_DATA_DT				0x011e
-#define CCS_R_BOTTOM_EMBEDDED_DATA_VC				0x011f
-#define CCS_R_GAIN_MODE						0x0120
+#define CCS_R_CSI_DATA_FORMAT					CCI_REG16(0x0112)
+#define CCS_R_CSI_LANE_MODE					CCI_REG8(0x0114)
+#define CCS_R_DPCM_FRAME_DT					CCI_REG8(0x011d)
+#define CCS_R_BOTTOM_EMBEDDED_DATA_DT				CCI_REG8(0x011e)
+#define CCS_R_BOTTOM_EMBEDDED_DATA_VC				CCI_REG8(0x011f)
+#define CCS_R_GAIN_MODE						CCI_REG8(0x0120)
 #define CCS_GAIN_MODE_GLOBAL					0U
 #define CCS_GAIN_MODE_ALTERNATE					1U
-#define CCS_R_ADC_BIT_DEPTH					0x0121
-#define CCS_R_EMB_DATA_CTRL					0x0122
+#define CCS_R_ADC_BIT_DEPTH					CCI_REG8(0x0121)
+#define CCS_R_EMB_DATA_CTRL					CCI_REG8(0x0122)
 #define CCS_EMB_DATA_CTRL_RAW8_PACKING_FOR_RAW16		BIT(0)
 #define CCS_EMB_DATA_CTRL_RAW10_PACKING_FOR_RAW20		BIT(1)
 #define CCS_EMB_DATA_CTRL_RAW12_PACKING_FOR_RAW24		BIT(2)
-#define CCS_R_GPIO_TRIG_MODE					0x0130
-#define CCS_R_EXTCLK_FREQUENCY_MHZ				(0x0136 | (CCS_FL_16BIT | CCS_FL_IREAL))
-#define CCS_R_TEMP_SENSOR_CTRL					0x0138
+#define CCS_R_GPIO_TRIG_MODE					CCI_REG8(0x0130)
+#define CCS_R_EXTCLK_FREQUENCY_MHZ				(CCI_REG16(0x0136) | CCS_FL_IREAL)
+#define CCS_R_TEMP_SENSOR_CTRL					CCI_REG8(0x0138)
 #define CCS_TEMP_SENSOR_CTRL_ENABLE				BIT(0)
-#define CCS_R_TEMP_SENSOR_MODE					0x0139
-#define CCS_R_TEMP_SENSOR_OUTPUT				0x013a
-#define CCS_R_FINE_INTEGRATION_TIME				(0x0200 | CCS_FL_16BIT)
-#define CCS_R_COARSE_INTEGRATION_TIME				(0x0202 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_GAIN_CODE_GLOBAL				(0x0204 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_LINEAR_GAIN_GLOBAL				(0x0206 | CCS_FL_16BIT)
-#define CCS_R_ANALOG_EXPONENTIAL_GAIN_GLOBAL			(0x0208 | CCS_FL_16BIT)
-#define CCS_R_DIGITAL_GAIN_GLOBAL				(0x020e | CCS_FL_16BIT)
-#define CCS_R_SHORT_ANALOG_GAIN_GLOBAL				(0x0216 | CCS_FL_16BIT)
-#define CCS_R_SHORT_DIGITAL_GAIN_GLOBAL				(0x0218 | CCS_FL_16BIT)
-#define CCS_R_HDR_MODE						0x0220
+#define CCS_R_TEMP_SENSOR_MODE					CCI_REG8(0x0139)
+#define CCS_R_TEMP_SENSOR_OUTPUT				CCI_REG8(0x013a)
+#define CCS_R_FINE_INTEGRATION_TIME				CCI_REG16(0x0200)
+#define CCS_R_COARSE_INTEGRATION_TIME				CCI_REG16(0x0202)
+#define CCS_R_ANALOG_GAIN_CODE_GLOBAL				CCI_REG16(0x0204)
+#define CCS_R_ANALOG_LINEAR_GAIN_GLOBAL				CCI_REG16(0x0206)
+#define CCS_R_ANALOG_EXPONENTIAL_GAIN_GLOBAL			CCI_REG16(0x0208)
+#define CCS_R_DIGITAL_GAIN_GLOBAL				CCI_REG16(0x020e)
+#define CCS_R_SHORT_ANALOG_GAIN_GLOBAL				CCI_REG16(0x0216)
+#define CCS_R_SHORT_DIGITAL_GAIN_GLOBAL				CCI_REG16(0x0218)
+#define CCS_R_HDR_MODE						CCI_REG8(0x0220)
 #define CCS_HDR_MODE_ENABLED					BIT(0)
 #define CCS_HDR_MODE_SEPARATE_ANALOG_GAIN			BIT(1)
 #define CCS_HDR_MODE_UPSCALING					BIT(2)
@@ -189,421 +189,421 @@
 #define CCS_HDR_MODE_TIMING_MODE				BIT(4)
 #define CCS_HDR_MODE_EXPOSURE_CTRL_DIRECT			BIT(5)
 #define CCS_HDR_MODE_SEPARATE_DIGITAL_GAIN			BIT(6)
-#define CCS_R_HDR_RESOLUTION_REDUCTION				0x0221
+#define CCS_R_HDR_RESOLUTION_REDUCTION				CCI_REG8(0x0221)
 #define CCS_HDR_RESOLUTION_REDUCTION_ROW_SHIFT			0U
 #define CCS_HDR_RESOLUTION_REDUCTION_ROW_MASK			0xf
 #define CCS_HDR_RESOLUTION_REDUCTION_COLUMN_SHIFT		4U
 #define CCS_HDR_RESOLUTION_REDUCTION_COLUMN_MASK		0xf0
-#define CCS_R_EXPOSURE_RATIO					0x0222
-#define CCS_R_HDR_INTERNAL_BIT_DEPTH				0x0223
-#define CCS_R_DIRECT_SHORT_INTEGRATION_TIME			(0x0224 | CCS_FL_16BIT)
-#define CCS_R_SHORT_ANALOG_LINEAR_GAIN_GLOBAL			(0x0226 | CCS_FL_16BIT)
-#define CCS_R_SHORT_ANALOG_EXPONENTIAL_GAIN_GLOBAL		(0x0228 | CCS_FL_16BIT)
-#define CCS_R_VT_PIX_CLK_DIV					(0x0300 | CCS_FL_16BIT)
-#define CCS_R_VT_SYS_CLK_DIV					(0x0302 | CCS_FL_16BIT)
-#define CCS_R_PRE_PLL_CLK_DIV					(0x0304 | CCS_FL_16BIT)
-#define CCS_R_PLL_MULTIPLIER					(0x0306 | CCS_FL_16BIT)
-#define CCS_R_OP_PIX_CLK_DIV					(0x0308 | CCS_FL_16BIT)
-#define CCS_R_OP_SYS_CLK_DIV					(0x030a | CCS_FL_16BIT)
-#define CCS_R_OP_PRE_PLL_CLK_DIV				(0x030c | CCS_FL_16BIT)
-#define CCS_R_OP_PLL_MULTIPLIER					(0x030e | CCS_FL_16BIT)
-#define CCS_R_PLL_MODE						0x0310
+#define CCS_R_EXPOSURE_RATIO					CCI_REG8(0x0222)
+#define CCS_R_HDR_INTERNAL_BIT_DEPTH				CCI_REG8(0x0223)
+#define CCS_R_DIRECT_SHORT_INTEGRATION_TIME			CCI_REG16(0x0224)
+#define CCS_R_SHORT_ANALOG_LINEAR_GAIN_GLOBAL			CCI_REG16(0x0226)
+#define CCS_R_SHORT_ANALOG_EXPONENTIAL_GAIN_GLOBAL		CCI_REG16(0x0228)
+#define CCS_R_VT_PIX_CLK_DIV					CCI_REG16(0x0300)
+#define CCS_R_VT_SYS_CLK_DIV					CCI_REG16(0x0302)
+#define CCS_R_PRE_PLL_CLK_DIV					CCI_REG16(0x0304)
+#define CCS_R_PLL_MULTIPLIER					CCI_REG16(0x0306)
+#define CCS_R_OP_PIX_CLK_DIV					CCI_REG16(0x0308)
+#define CCS_R_OP_SYS_CLK_DIV					CCI_REG16(0x030a)
+#define CCS_R_OP_PRE_PLL_CLK_DIV				CCI_REG16(0x030c)
+#define CCS_R_OP_PLL_MULTIPLIER					CCI_REG16(0x030e)
+#define CCS_R_PLL_MODE						CCI_REG8(0x0310)
 #define CCS_PLL_MODE_SHIFT					0U
 #define CCS_PLL_MODE_MASK					0x1
 #define CCS_PLL_MODE_SINGLE					0U
 #define CCS_PLL_MODE_DUAL					1U
-#define CCS_R_OP_PIX_CLK_DIV_REV				(0x0312 | CCS_FL_16BIT)
-#define CCS_R_OP_SYS_CLK_DIV_REV				(0x0314 | CCS_FL_16BIT)
-#define CCS_R_FRAME_LENGTH_LINES				(0x0340 | CCS_FL_16BIT)
-#define CCS_R_LINE_LENGTH_PCK					(0x0342 | CCS_FL_16BIT)
-#define CCS_R_X_ADDR_START					(0x0344 | CCS_FL_16BIT)
-#define CCS_R_Y_ADDR_START					(0x0346 | CCS_FL_16BIT)
-#define CCS_R_X_ADDR_END					(0x0348 | CCS_FL_16BIT)
-#define CCS_R_Y_ADDR_END					(0x034a | CCS_FL_16BIT)
-#define CCS_R_X_OUTPUT_SIZE					(0x034c | CCS_FL_16BIT)
-#define CCS_R_Y_OUTPUT_SIZE					(0x034e | CCS_FL_16BIT)
-#define CCS_R_FRAME_LENGTH_CTRL					0x0350
+#define CCS_R_OP_PIX_CLK_DIV_REV				CCI_REG16(0x0312)
+#define CCS_R_OP_SYS_CLK_DIV_REV				CCI_REG16(0x0314)
+#define CCS_R_FRAME_LENGTH_LINES				CCI_REG16(0x0340)
+#define CCS_R_LINE_LENGTH_PCK					CCI_REG16(0x0342)
+#define CCS_R_X_ADDR_START					CCI_REG16(0x0344)
+#define CCS_R_Y_ADDR_START					CCI_REG16(0x0346)
+#define CCS_R_X_ADDR_END					CCI_REG16(0x0348)
+#define CCS_R_Y_ADDR_END					CCI_REG16(0x034a)
+#define CCS_R_X_OUTPUT_SIZE					CCI_REG16(0x034c)
+#define CCS_R_Y_OUTPUT_SIZE					CCI_REG16(0x034e)
+#define CCS_R_FRAME_LENGTH_CTRL					CCI_REG8(0x0350)
 #define CCS_FRAME_LENGTH_CTRL_AUTOMATIC				BIT(0)
-#define CCS_R_TIMING_MODE_CTRL					0x0352
+#define CCS_R_TIMING_MODE_CTRL					CCI_REG8(0x0352)
 #define CCS_TIMING_MODE_CTRL_MANUAL_READOUT			BIT(0)
 #define CCS_TIMING_MODE_CTRL_DELAYED_EXPOSURE			BIT(1)
-#define CCS_R_START_READOUT_RS					0x0353
+#define CCS_R_START_READOUT_RS					CCI_REG8(0x0353)
 #define CCS_START_READOUT_RS_MANUAL_READOUT_START		BIT(0)
-#define CCS_R_FRAME_MARGIN					(0x0354 | CCS_FL_16BIT)
-#define CCS_R_X_EVEN_INC					(0x0380 | CCS_FL_16BIT)
-#define CCS_R_X_ODD_INC						(0x0382 | CCS_FL_16BIT)
-#define CCS_R_Y_EVEN_INC					(0x0384 | CCS_FL_16BIT)
-#define CCS_R_Y_ODD_INC						(0x0386 | CCS_FL_16BIT)
-#define CCS_R_MONOCHROME_EN					0x0390
+#define CCS_R_FRAME_MARGIN					CCI_REG16(0x0354)
+#define CCS_R_X_EVEN_INC					CCI_REG16(0x0380)
+#define CCS_R_X_ODD_INC						CCI_REG16(0x0382)
+#define CCS_R_Y_EVEN_INC					CCI_REG16(0x0384)
+#define CCS_R_Y_ODD_INC						CCI_REG16(0x0386)
+#define CCS_R_MONOCHROME_EN					CCI_REG8(0x0390)
 #define CCS_MONOCHROME_EN_ENABLED				0U
-#define CCS_R_SCALING_MODE					(0x0400 | CCS_FL_16BIT)
+#define CCS_R_SCALING_MODE					CCI_REG16(0x0400)
 #define CCS_SCALING_MODE_NO_SCALING				0U
 #define CCS_SCALING_MODE_HORIZONTAL				1U
-#define CCS_R_SCALE_M						(0x0404 | CCS_FL_16BIT)
-#define CCS_R_SCALE_N						(0x0406 | CCS_FL_16BIT)
-#define CCS_R_DIGITAL_CROP_X_OFFSET				(0x0408 | CCS_FL_16BIT)
-#define CCS_R_DIGITAL_CROP_Y_OFFSET				(0x040a | CCS_FL_16BIT)
-#define CCS_R_DIGITAL_CROP_IMAGE_WIDTH				(0x040c | CCS_FL_16BIT)
-#define CCS_R_DIGITAL_CROP_IMAGE_HEIGHT				(0x040e | CCS_FL_16BIT)
-#define CCS_R_COMPRESSION_MODE					(0x0500 | CCS_FL_16BIT)
+#define CCS_R_SCALE_M						CCI_REG16(0x0404)
+#define CCS_R_SCALE_N						CCI_REG16(0x0406)
+#define CCS_R_DIGITAL_CROP_X_OFFSET				CCI_REG16(0x0408)
+#define CCS_R_DIGITAL_CROP_Y_OFFSET				CCI_REG16(0x040a)
+#define CCS_R_DIGITAL_CROP_IMAGE_WIDTH				CCI_REG16(0x040c)
+#define CCS_R_DIGITAL_CROP_IMAGE_HEIGHT				CCI_REG16(0x040e)
+#define CCS_R_COMPRESSION_MODE					CCI_REG16(0x0500)
 #define CCS_COMPRESSION_MODE_NONE				0U
 #define CCS_COMPRESSION_MODE_DPCM_PCM_SIMPLE			1U
-#define CCS_R_TEST_PATTERN_MODE					(0x0600 | CCS_FL_16BIT)
+#define CCS_R_TEST_PATTERN_MODE					CCI_REG16(0x0600)
 #define CCS_TEST_PATTERN_MODE_NONE				0U
 #define CCS_TEST_PATTERN_MODE_SOLID_COLOR			1U
 #define CCS_TEST_PATTERN_MODE_COLOR_BARS			2U
 #define CCS_TEST_PATTERN_MODE_FADE_TO_GREY			3U
 #define CCS_TEST_PATTERN_MODE_PN9				4U
 #define CCS_TEST_PATTERN_MODE_COLOR_TILE			5U
-#define CCS_R_TEST_DATA_RED					(0x0602 | CCS_FL_16BIT)
-#define CCS_R_TEST_DATA_GREENR					(0x0604 | CCS_FL_16BIT)
-#define CCS_R_TEST_DATA_BLUE					(0x0606 | CCS_FL_16BIT)
-#define CCS_R_TEST_DATA_GREENB					(0x0608 | CCS_FL_16BIT)
-#define CCS_R_VALUE_STEP_SIZE_SMOOTH				0x060a
-#define CCS_R_VALUE_STEP_SIZE_QUANTISED				0x060b
-#define CCS_R_TCLK_POST						0x0800
-#define CCS_R_THS_PREPARE					0x0801
-#define CCS_R_THS_ZERO_MIN					0x0802
-#define CCS_R_THS_TRAIL						0x0803
-#define CCS_R_TCLK_TRAIL_MIN					0x0804
-#define CCS_R_TCLK_PREPARE					0x0805
-#define CCS_R_TCLK_ZERO						0x0806
-#define CCS_R_TLPX						0x0807
-#define CCS_R_PHY_CTRL						0x0808
+#define CCS_R_TEST_DATA_RED					CCI_REG16(0x0602)
+#define CCS_R_TEST_DATA_GREENR					CCI_REG16(0x0604)
+#define CCS_R_TEST_DATA_BLUE					CCI_REG16(0x0606)
+#define CCS_R_TEST_DATA_GREENB					CCI_REG16(0x0608)
+#define CCS_R_VALUE_STEP_SIZE_SMOOTH				CCI_REG8(0x060a)
+#define CCS_R_VALUE_STEP_SIZE_QUANTISED				CCI_REG8(0x060b)
+#define CCS_R_TCLK_POST						CCI_REG8(0x0800)
+#define CCS_R_THS_PREPARE					CCI_REG8(0x0801)
+#define CCS_R_THS_ZERO_MIN					CCI_REG8(0x0802)
+#define CCS_R_THS_TRAIL						CCI_REG8(0x0803)
+#define CCS_R_TCLK_TRAIL_MIN					CCI_REG8(0x0804)
+#define CCS_R_TCLK_PREPARE					CCI_REG8(0x0805)
+#define CCS_R_TCLK_ZERO						CCI_REG8(0x0806)
+#define CCS_R_TLPX						CCI_REG8(0x0807)
+#define CCS_R_PHY_CTRL						CCI_REG8(0x0808)
 #define CCS_PHY_CTRL_AUTO					0U
 #define CCS_PHY_CTRL_UI						1U
 #define CCS_PHY_CTRL_MANUAL					2U
-#define CCS_R_TCLK_POST_EX					(0x080a | CCS_FL_16BIT)
-#define CCS_R_THS_PREPARE_EX					(0x080c | CCS_FL_16BIT)
-#define CCS_R_THS_ZERO_MIN_EX					(0x080e | CCS_FL_16BIT)
-#define CCS_R_THS_TRAIL_EX					(0x0810 | CCS_FL_16BIT)
-#define CCS_R_TCLK_TRAIL_MIN_EX					(0x0812 | CCS_FL_16BIT)
-#define CCS_R_TCLK_PREPARE_EX					(0x0814 | CCS_FL_16BIT)
-#define CCS_R_TCLK_ZERO_EX					(0x0816 | CCS_FL_16BIT)
-#define CCS_R_TLPX_EX						(0x0818 | CCS_FL_16BIT)
-#define CCS_R_REQUESTED_LINK_RATE				(0x0820 | CCS_FL_32BIT)
-#define CCS_R_DPHY_EQUALIZATION_MODE				0x0824
+#define CCS_R_TCLK_POST_EX					CCI_REG16(0x080a)
+#define CCS_R_THS_PREPARE_EX					CCI_REG16(0x080c)
+#define CCS_R_THS_ZERO_MIN_EX					CCI_REG16(0x080e)
+#define CCS_R_THS_TRAIL_EX					CCI_REG16(0x0810)
+#define CCS_R_TCLK_TRAIL_MIN_EX					CCI_REG16(0x0812)
+#define CCS_R_TCLK_PREPARE_EX					CCI_REG16(0x0814)
+#define CCS_R_TCLK_ZERO_EX					CCI_REG16(0x0816)
+#define CCS_R_TLPX_EX						CCI_REG16(0x0818)
+#define CCS_R_REQUESTED_LINK_RATE				CCI_REG32(0x0820)
+#define CCS_R_DPHY_EQUALIZATION_MODE				CCI_REG8(0x0824)
 #define CCS_DPHY_EQUALIZATION_MODE_EQ2				BIT(0)
-#define CCS_R_PHY_EQUALIZATION_CTRL				0x0825
+#define CCS_R_PHY_EQUALIZATION_CTRL				CCI_REG8(0x0825)
 #define CCS_PHY_EQUALIZATION_CTRL_ENABLE			BIT(0)
-#define CCS_R_DPHY_PREAMBLE_CTRL				0x0826
+#define CCS_R_DPHY_PREAMBLE_CTRL				CCI_REG8(0x0826)
 #define CCS_DPHY_PREAMBLE_CTRL_ENABLE				BIT(0)
-#define CCS_R_DPHY_PREAMBLE_LENGTH				0x0826
-#define CCS_R_PHY_SSC_CTRL					0x0828
+#define CCS_R_DPHY_PREAMBLE_LENGTH				CCI_REG8(0x0826)
+#define CCS_R_PHY_SSC_CTRL					CCI_REG8(0x0828)
 #define CCS_PHY_SSC_CTRL_ENABLE					BIT(0)
-#define CCS_R_MANUAL_LP_CTRL					0x0829
+#define CCS_R_MANUAL_LP_CTRL					CCI_REG8(0x0829)
 #define CCS_MANUAL_LP_CTRL_ENABLE				BIT(0)
-#define CCS_R_TWAKEUP						0x082a
-#define CCS_R_TINIT						0x082b
-#define CCS_R_THS_EXIT						0x082c
-#define CCS_R_THS_EXIT_EX					(0x082e | CCS_FL_16BIT)
-#define CCS_R_PHY_PERIODIC_CALIBRATION_CTRL			0x0830
+#define CCS_R_TWAKEUP						CCI_REG8(0x082a)
+#define CCS_R_TINIT						CCI_REG8(0x082b)
+#define CCS_R_THS_EXIT						CCI_REG8(0x082c)
+#define CCS_R_THS_EXIT_EX					CCI_REG16(0x082e)
+#define CCS_R_PHY_PERIODIC_CALIBRATION_CTRL			CCI_REG8(0x0830)
 #define CCS_PHY_PERIODIC_CALIBRATION_CTRL_FRAME_BLANKING	BIT(0)
-#define CCS_R_PHY_PERIODIC_CALIBRATION_INTERVAL			0x0831
-#define CCS_R_PHY_INIT_CALIBRATION_CTRL				0x0832
+#define CCS_R_PHY_PERIODIC_CALIBRATION_INTERVAL			CCI_REG8(0x0831)
+#define CCS_R_PHY_INIT_CALIBRATION_CTRL				CCI_REG8(0x0832)
 #define CCS_PHY_INIT_CALIBRATION_CTRL_STREAM_START		BIT(0)
-#define CCS_R_DPHY_CALIBRATION_MODE				0x0833
+#define CCS_R_DPHY_CALIBRATION_MODE				CCI_REG8(0x0833)
 #define CCS_DPHY_CALIBRATION_MODE_ALSO_ALTERNATE		BIT(0)
-#define CCS_R_CPHY_CALIBRATION_MODE				0x0834
+#define CCS_R_CPHY_CALIBRATION_MODE				CCI_REG8(0x0834)
 #define CCS_CPHY_CALIBRATION_MODE_FORMAT_1			0U
 #define CCS_CPHY_CALIBRATION_MODE_FORMAT_2			1U
 #define CCS_CPHY_CALIBRATION_MODE_FORMAT_3			2U
-#define CCS_R_T3_CALPREAMBLE_LENGTH				0x0835
-#define CCS_R_T3_CALPREAMBLE_LENGTH_PER				0x0836
-#define CCS_R_T3_CALALTSEQ_LENGTH				0x0837
-#define CCS_R_T3_CALALTSEQ_LENGTH_PER				0x0838
-#define CCS_R_FM2_INIT_SEED					(0x083a | CCS_FL_16BIT)
-#define CCS_R_T3_CALUDEFSEQ_LENGTH				(0x083c | CCS_FL_16BIT)
-#define CCS_R_T3_CALUDEFSEQ_LENGTH_PER				(0x083e | CCS_FL_16BIT)
-#define CCS_R_TGR_PREAMBLE_LENGTH				0x0841
+#define CCS_R_T3_CALPREAMBLE_LENGTH				CCI_REG8(0x0835)
+#define CCS_R_T3_CALPREAMBLE_LENGTH_PER				CCI_REG8(0x0836)
+#define CCS_R_T3_CALALTSEQ_LENGTH				CCI_REG8(0x0837)
+#define CCS_R_T3_CALALTSEQ_LENGTH_PER				CCI_REG8(0x0838)
+#define CCS_R_FM2_INIT_SEED					CCI_REG16(0x083a)
+#define CCS_R_T3_CALUDEFSEQ_LENGTH				CCI_REG16(0x083c)
+#define CCS_R_T3_CALUDEFSEQ_LENGTH_PER				CCI_REG16(0x083e)
+#define CCS_R_TGR_PREAMBLE_LENGTH				CCI_REG8(0x0841)
 #define CCS_TGR_PREAMBLE_LENGTH_PREAMABLE_PROG_SEQ		BIT(7)
 #define CCS_TGR_PREAMBLE_LENGTH_BEGIN_PREAMBLE_LENGTH_SHIFT	0U
 #define CCS_TGR_PREAMBLE_LENGTH_BEGIN_PREAMBLE_LENGTH_MASK	0x3f
-#define CCS_R_TGR_POST_LENGTH					0x0842
+#define CCS_R_TGR_POST_LENGTH					CCI_REG8(0x0842)
 #define CCS_TGR_POST_LENGTH_POST_LENGTH_SHIFT			0U
 #define CCS_TGR_POST_LENGTH_POST_LENGTH_MASK			0x1f
-#define CCS_R_TGR_PREAMBLE_PROG_SEQUENCE(n2)			(0x0843 + (n2))
+#define CCS_R_TGR_PREAMBLE_PROG_SEQUENCE(n2)			CCI_REG8(0x0843 + (n2))
 #define CCS_LIM_TGR_PREAMBLE_PROG_SEQUENCE_MIN_N2		0U
 #define CCS_LIM_TGR_PREAMBLE_PROG_SEQUENCE_MAX_N2		6U
 #define CCS_TGR_PREAMBLE_PROG_SEQUENCE_SYMBOL_N_1_SHIFT		3U
 #define CCS_TGR_PREAMBLE_PROG_SEQUENCE_SYMBOL_N_1_MASK		0x38
 #define CCS_TGR_PREAMBLE_PROG_SEQUENCE_SYMBOL_N_SHIFT		0U
 #define CCS_TGR_PREAMBLE_PROG_SEQUENCE_SYMBOL_N_MASK		0x7
-#define CCS_R_T3_PREPARE					(0x084e | CCS_FL_16BIT)
-#define CCS_R_T3_LPX						(0x0850 | CCS_FL_16BIT)
-#define CCS_R_ALPS_CTRL						0x085a
+#define CCS_R_T3_PREPARE					CCI_REG16(0x084e)
+#define CCS_R_T3_LPX						CCI_REG16(0x0850)
+#define CCS_R_ALPS_CTRL						CCI_REG8(0x085a)
 #define CCS_ALPS_CTRL_LVLP_DPHY					BIT(0)
 #define CCS_ALPS_CTRL_LVLP_CPHY					BIT(1)
 #define CCS_ALPS_CTRL_ALP_CPHY					BIT(2)
-#define CCS_R_TX_REG_CSI_EPD_EN_SSP_CPHY			(0x0860 | CCS_FL_16BIT)
-#define CCS_R_TX_REG_CSI_EPD_OP_SLP_CPHY			(0x0862 | CCS_FL_16BIT)
-#define CCS_R_TX_REG_CSI_EPD_EN_SSP_DPHY			(0x0864 | CCS_FL_16BIT)
-#define CCS_R_TX_REG_CSI_EPD_OP_SLP_DPHY			(0x0866 | CCS_FL_16BIT)
-#define CCS_R_TX_REG_CSI_EPD_MISC_OPTION_CPHY			0x0868
-#define CCS_R_TX_REG_CSI_EPD_MISC_OPTION_DPHY			0x0869
-#define CCS_R_SCRAMBLING_CTRL					0x0870
+#define CCS_R_TX_REG_CSI_EPD_EN_SSP_CPHY			CCI_REG16(0x0860)
+#define CCS_R_TX_REG_CSI_EPD_OP_SLP_CPHY			CCI_REG16(0x0862)
+#define CCS_R_TX_REG_CSI_EPD_EN_SSP_DPHY			CCI_REG16(0x0864)
+#define CCS_R_TX_REG_CSI_EPD_OP_SLP_DPHY			CCI_REG16(0x0866)
+#define CCS_R_TX_REG_CSI_EPD_MISC_OPTION_CPHY			CCI_REG8(0x0868)
+#define CCS_R_TX_REG_CSI_EPD_MISC_OPTION_DPHY			CCI_REG8(0x0869)
+#define CCS_R_SCRAMBLING_CTRL					CCI_REG8(0x0870)
 #define CCS_SCRAMBLING_CTRL_ENABLED				BIT(0)
 #define CCS_SCRAMBLING_CTRL_SHIFT				2U
 #define CCS_SCRAMBLING_CTRL_MASK				0xc
 #define CCS_SCRAMBLING_CTRL_1_SEED_CPHY				0U
 #define CCS_SCRAMBLING_CTRL_4_SEED_CPHY				3U
-#define CCS_R_LANE_SEED_VALUE(seed, lane)			((0x0872 | CCS_FL_16BIT) + (seed) * 16 + (lane) * 2)
+#define CCS_R_LANE_SEED_VALUE(seed, lane)			CCI_REG16(0x0872 + (seed) * 16 + (lane) * 2)
 #define CCS_LIM_LANE_SEED_VALUE_MIN_SEED			0U
 #define CCS_LIM_LANE_SEED_VALUE_MAX_SEED			3U
 #define CCS_LIM_LANE_SEED_VALUE_MIN_LANE			0U
 #define CCS_LIM_LANE_SEED_VALUE_MAX_LANE			7U
-#define CCS_R_TX_USL_REV_ENTRY					(0x08c0 | CCS_FL_16BIT)
-#define CCS_R_TX_USL_REV_CLOCK_COUNTER				(0x08c2 | CCS_FL_16BIT)
-#define CCS_R_TX_USL_REV_LP_COUNTER				(0x08c4 | CCS_FL_16BIT)
-#define CCS_R_TX_USL_REV_FRAME_COUNTER				(0x08c6 | CCS_FL_16BIT)
-#define CCS_R_TX_USL_REV_CHRONOLOGICAL_TIMER			(0x08c8 | CCS_FL_16BIT)
-#define CCS_R_TX_USL_FWD_ENTRY					(0x08ca | CCS_FL_16BIT)
-#define CCS_R_TX_USL_GPIO					(0x08cc | CCS_FL_16BIT)
-#define CCS_R_TX_USL_OPERATION					(0x08ce | CCS_FL_16BIT)
+#define CCS_R_TX_USL_REV_ENTRY					CCI_REG16(0x08c0)
+#define CCS_R_TX_USL_REV_CLOCK_COUNTER				CCI_REG16(0x08c2)
+#define CCS_R_TX_USL_REV_LP_COUNTER				CCI_REG16(0x08c4)
+#define CCS_R_TX_USL_REV_FRAME_COUNTER				CCI_REG16(0x08c6)
+#define CCS_R_TX_USL_REV_CHRONOLOGICAL_TIMER			CCI_REG16(0x08c8)
+#define CCS_R_TX_USL_FWD_ENTRY					CCI_REG16(0x08ca)
+#define CCS_R_TX_USL_GPIO					CCI_REG16(0x08cc)
+#define CCS_R_TX_USL_OPERATION					CCI_REG16(0x08ce)
 #define CCS_TX_USL_OPERATION_RESET				BIT(0)
-#define CCS_R_TX_USL_ALP_CTRL					(0x08d0 | CCS_FL_16BIT)
+#define CCS_R_TX_USL_ALP_CTRL					CCI_REG16(0x08d0)
 #define CCS_TX_USL_ALP_CTRL_CLOCK_PAUSE				BIT(0)
-#define CCS_R_TX_USL_APP_BTA_ACK_TIMEOUT			(0x08d2 | CCS_FL_16BIT)
-#define CCS_R_TX_USL_SNS_BTA_ACK_TIMEOUT			(0x08d2 | CCS_FL_16BIT)
-#define CCS_R_USL_CLOCK_MODE_D_CTRL				0x08d2
+#define CCS_R_TX_USL_APP_BTA_ACK_TIMEOUT			CCI_REG16(0x08d2)
+#define CCS_R_TX_USL_SNS_BTA_ACK_TIMEOUT			CCI_REG16(0x08d2)
+#define CCS_R_USL_CLOCK_MODE_D_CTRL				CCI_REG8(0x08d2)
 #define CCS_USL_CLOCK_MODE_D_CTRL_CONT_CLOCK_STANDBY		BIT(0)
 #define CCS_USL_CLOCK_MODE_D_CTRL_CONT_CLOCK_VBLANK		BIT(1)
 #define CCS_USL_CLOCK_MODE_D_CTRL_CONT_CLOCK_HBLANK		BIT(2)
-#define CCS_R_BINNING_MODE					0x0900
-#define CCS_R_BINNING_TYPE					0x0901
-#define CCS_R_BINNING_WEIGHTING					0x0902
-#define CCS_R_DATA_TRANSFER_IF_1_CTRL				0x0a00
+#define CCS_R_BINNING_MODE					CCI_REG8(0x0900)
+#define CCS_R_BINNING_TYPE					CCI_REG8(0x0901)
+#define CCS_R_BINNING_WEIGHTING					CCI_REG8(0x0902)
+#define CCS_R_DATA_TRANSFER_IF_1_CTRL				CCI_REG8(0x0a00)
 #define CCS_DATA_TRANSFER_IF_1_CTRL_ENABLE			BIT(0)
 #define CCS_DATA_TRANSFER_IF_1_CTRL_WRITE			BIT(1)
 #define CCS_DATA_TRANSFER_IF_1_CTRL_CLEAR_ERROR			BIT(2)
-#define CCS_R_DATA_TRANSFER_IF_1_STATUS				0x0a01
+#define CCS_R_DATA_TRANSFER_IF_1_STATUS				CCI_REG8(0x0a01)
 #define CCS_DATA_TRANSFER_IF_1_STATUS_READ_IF_READY		BIT(0)
 #define CCS_DATA_TRANSFER_IF_1_STATUS_WRITE_IF_READY		BIT(1)
 #define CCS_DATA_TRANSFER_IF_1_STATUS_DATA_CORRUPTED		BIT(2)
 #define CCS_DATA_TRANSFER_IF_1_STATUS_IMPROPER_IF_USAGE		BIT(3)
-#define CCS_R_DATA_TRANSFER_IF_1_PAGE_SELECT			0x0a02
-#define CCS_R_DATA_TRANSFER_IF_1_DATA(p)			(0x0a04 + (p))
+#define CCS_R_DATA_TRANSFER_IF_1_PAGE_SELECT			CCI_REG8(0x0a02)
+#define CCS_R_DATA_TRANSFER_IF_1_DATA(p)			CCI_REG8(0x0a04 + (p))
 #define CCS_LIM_DATA_TRANSFER_IF_1_DATA_MIN_P			0U
 #define CCS_LIM_DATA_TRANSFER_IF_1_DATA_MAX_P			63U
-#define CCS_R_SHADING_CORRECTION_EN				0x0b00
+#define CCS_R_SHADING_CORRECTION_EN				CCI_REG8(0x0b00)
 #define CCS_SHADING_CORRECTION_EN_ENABLE			BIT(0)
-#define CCS_R_LUMINANCE_CORRECTION_LEVEL			0x0b01
-#define CCS_R_GREEN_IMBALANCE_FILTER_EN				0x0b02
+#define CCS_R_LUMINANCE_CORRECTION_LEVEL			CCI_REG8(0x0b01)
+#define CCS_R_GREEN_IMBALANCE_FILTER_EN				CCI_REG8(0x0b02)
 #define CCS_GREEN_IMBALANCE_FILTER_EN_ENABLE			BIT(0)
-#define CCS_R_MAPPED_DEFECT_CORRECT_EN				0x0b05
+#define CCS_R_MAPPED_DEFECT_CORRECT_EN				CCI_REG8(0x0b05)
 #define CCS_MAPPED_DEFECT_CORRECT_EN_ENABLE			BIT(0)
-#define CCS_R_SINGLE_DEFECT_CORRECT_EN				0x0b06
+#define CCS_R_SINGLE_DEFECT_CORRECT_EN				CCI_REG8(0x0b06)
 #define CCS_SINGLE_DEFECT_CORRECT_EN_ENABLE			BIT(0)
-#define CCS_R_DYNAMIC_COUPLET_CORRECT_EN			0x0b08
+#define CCS_R_DYNAMIC_COUPLET_CORRECT_EN			CCI_REG8(0x0b08)
 #define CCS_DYNAMIC_COUPLET_CORRECT_EN_ENABLE			BIT(0)
-#define CCS_R_COMBINED_DEFECT_CORRECT_EN			0x0b0a
+#define CCS_R_COMBINED_DEFECT_CORRECT_EN			CCI_REG8(0x0b0a)
 #define CCS_COMBINED_DEFECT_CORRECT_EN_ENABLE			BIT(0)
-#define CCS_R_MODULE_SPECIFIC_CORRECTION_EN			0x0b0c
+#define CCS_R_MODULE_SPECIFIC_CORRECTION_EN			CCI_REG8(0x0b0c)
 #define CCS_MODULE_SPECIFIC_CORRECTION_EN_ENABLE		BIT(0)
-#define CCS_R_DYNAMIC_TRIPLET_DEFECT_CORRECT_EN			0x0b13
+#define CCS_R_DYNAMIC_TRIPLET_DEFECT_CORRECT_EN			CCI_REG8(0x0b13)
 #define CCS_DYNAMIC_TRIPLET_DEFECT_CORRECT_EN_ENABLE		BIT(0)
-#define CCS_R_NF_CTRL						0x0b15
+#define CCS_R_NF_CTRL						CCI_REG8(0x0b15)
 #define CCS_NF_CTRL_LUMA					BIT(0)
 #define CCS_NF_CTRL_CHROMA					BIT(1)
 #define CCS_NF_CTRL_COMBINED					BIT(2)
-#define CCS_R_OB_READOUT_CONTROL				0x0b30
+#define CCS_R_OB_READOUT_CONTROL				CCI_REG8(0x0b30)
 #define CCS_OB_READOUT_CONTROL_ENABLE				BIT(0)
 #define CCS_OB_READOUT_CONTROL_INTERLEAVING			BIT(1)
-#define CCS_R_OB_VIRTUAL_CHANNEL				0x0b31
-#define CCS_R_OB_DT						0x0b32
-#define CCS_R_OB_DATA_FORMAT					0x0b33
-#define CCS_R_COLOR_TEMPERATURE					(0x0b8c | CCS_FL_16BIT)
-#define CCS_R_ABSOLUTE_GAIN_GREENR				(0x0b8e | CCS_FL_16BIT)
-#define CCS_R_ABSOLUTE_GAIN_RED					(0x0b90 | CCS_FL_16BIT)
-#define CCS_R_ABSOLUTE_GAIN_BLUE				(0x0b92 | CCS_FL_16BIT)
-#define CCS_R_ABSOLUTE_GAIN_GREENB				(0x0b94 | CCS_FL_16BIT)
-#define CCS_R_CFA_CONVERSION_CTRL				0x0ba0
+#define CCS_R_OB_VIRTUAL_CHANNEL				CCI_REG8(0x0b31)
+#define CCS_R_OB_DT						CCI_REG8(0x0b32)
+#define CCS_R_OB_DATA_FORMAT					CCI_REG8(0x0b33)
+#define CCS_R_COLOR_TEMPERATURE					CCI_REG16(0x0b8c)
+#define CCS_R_ABSOLUTE_GAIN_GREENR				CCI_REG16(0x0b8e)
+#define CCS_R_ABSOLUTE_GAIN_RED					CCI_REG16(0x0b90)
+#define CCS_R_ABSOLUTE_GAIN_BLUE				CCI_REG16(0x0b92)
+#define CCS_R_ABSOLUTE_GAIN_GREENB				CCI_REG16(0x0b94)
+#define CCS_R_CFA_CONVERSION_CTRL				CCI_REG8(0x0ba0)
 #define CCS_CFA_CONVERSION_CTRL_BAYER_CONVERSION_ENABLE		BIT(0)
-#define CCS_R_FLASH_STROBE_ADJUSTMENT				0x0c12
-#define CCS_R_FLASH_STROBE_START_POINT				(0x0c14 | CCS_FL_16BIT)
-#define CCS_R_TFLASH_STROBE_DELAY_RS_CTRL			(0x0c16 | CCS_FL_16BIT)
-#define CCS_R_TFLASH_STROBE_WIDTH_HIGH_RS_CTRL			(0x0c18 | CCS_FL_16BIT)
-#define CCS_R_FLASH_MODE_RS					0x0c1a
+#define CCS_R_FLASH_STROBE_ADJUSTMENT				CCI_REG8(0x0c12)
+#define CCS_R_FLASH_STROBE_START_POINT				CCI_REG16(0x0c14)
+#define CCS_R_TFLASH_STROBE_DELAY_RS_CTRL			CCI_REG16(0x0c16)
+#define CCS_R_TFLASH_STROBE_WIDTH_HIGH_RS_CTRL			CCI_REG16(0x0c18)
+#define CCS_R_FLASH_MODE_RS					CCI_REG8(0x0c1a)
 #define CCS_FLASH_MODE_RS_CONTINUOUS				BIT(0)
 #define CCS_FLASH_MODE_RS_TRUNCATE				BIT(1)
 #define CCS_FLASH_MODE_RS_ASYNC					BIT(3)
-#define CCS_R_FLASH_TRIGGER_RS					0x0c1b
-#define CCS_R_FLASH_STATUS					0x0c1c
+#define CCS_R_FLASH_TRIGGER_RS					CCI_REG8(0x0c1b)
+#define CCS_R_FLASH_STATUS					CCI_REG8(0x0c1c)
 #define CCS_FLASH_STATUS_RETIMED				BIT(0)
-#define CCS_R_SA_STROBE_MODE					0x0c1d
+#define CCS_R_SA_STROBE_MODE					CCI_REG8(0x0c1d)
 #define CCS_SA_STROBE_MODE_CONTINUOUS				BIT(0)
 #define CCS_SA_STROBE_MODE_TRUNCATE				BIT(1)
 #define CCS_SA_STROBE_MODE_ASYNC				BIT(3)
 #define CCS_SA_STROBE_MODE_ADJUST_EDGE				BIT(4)
-#define CCS_R_SA_STROBE_START_POINT				(0x0c1e | CCS_FL_16BIT)
-#define CCS_R_TSA_STROBE_DELAY_CTRL				(0x0c20 | CCS_FL_16BIT)
-#define CCS_R_TSA_STROBE_WIDTH_CTRL				(0x0c22 | CCS_FL_16BIT)
-#define CCS_R_SA_STROBE_TRIGGER					0x0c24
-#define CCS_R_SA_STROBE_STATUS					0x0c25
+#define CCS_R_SA_STROBE_START_POINT				CCI_REG16(0x0c1e)
+#define CCS_R_TSA_STROBE_DELAY_CTRL				CCI_REG16(0x0c20)
+#define CCS_R_TSA_STROBE_WIDTH_CTRL				CCI_REG16(0x0c22)
+#define CCS_R_SA_STROBE_TRIGGER					CCI_REG8(0x0c24)
+#define CCS_R_SA_STROBE_STATUS					CCI_REG8(0x0c25)
 #define CCS_SA_STROBE_STATUS_RETIMED				BIT(0)
-#define CCS_R_TSA_STROBE_RE_DELAY_CTRL				(0x0c30 | CCS_FL_16BIT)
-#define CCS_R_TSA_STROBE_FE_DELAY_CTRL				(0x0c32 | CCS_FL_16BIT)
-#define CCS_R_PDAF_CTRL						(0x0d00 | CCS_FL_16BIT)
+#define CCS_R_TSA_STROBE_RE_DELAY_CTRL				CCI_REG16(0x0c30)
+#define CCS_R_TSA_STROBE_FE_DELAY_CTRL				CCI_REG16(0x0c32)
+#define CCS_R_PDAF_CTRL						CCI_REG16(0x0d00)
 #define CCS_PDAF_CTRL_ENABLE					BIT(0)
 #define CCS_PDAF_CTRL_PROCESSED					BIT(1)
 #define CCS_PDAF_CTRL_INTERLEAVED				BIT(2)
 #define CCS_PDAF_CTRL_VISIBLE_PDAF_CORRECTION			BIT(3)
-#define CCS_R_PDAF_VC						0x0d02
-#define CCS_R_PDAF_DT						0x0d03
-#define CCS_R_PD_X_ADDR_START					(0x0d04 | CCS_FL_16BIT)
-#define CCS_R_PD_Y_ADDR_START					(0x0d06 | CCS_FL_16BIT)
-#define CCS_R_PD_X_ADDR_END					(0x0d08 | CCS_FL_16BIT)
-#define CCS_R_PD_Y_ADDR_END					(0x0d0a | CCS_FL_16BIT)
-#define CCS_R_BRACKETING_LUT_CTRL				0x0e00
-#define CCS_R_BRACKETING_LUT_MODE				0x0e01
+#define CCS_R_PDAF_VC						CCI_REG8(0x0d02)
+#define CCS_R_PDAF_DT						CCI_REG8(0x0d03)
+#define CCS_R_PD_X_ADDR_START					CCI_REG16(0x0d04)
+#define CCS_R_PD_Y_ADDR_START					CCI_REG16(0x0d06)
+#define CCS_R_PD_X_ADDR_END					CCI_REG16(0x0d08)
+#define CCS_R_PD_Y_ADDR_END					CCI_REG16(0x0d0a)
+#define CCS_R_BRACKETING_LUT_CTRL				CCI_REG8(0x0e00)
+#define CCS_R_BRACKETING_LUT_MODE				CCI_REG8(0x0e01)
 #define CCS_BRACKETING_LUT_MODE_CONTINUE_STREAMING		BIT(0)
 #define CCS_BRACKETING_LUT_MODE_LOOP_MODE			BIT(1)
-#define CCS_R_BRACKETING_LUT_ENTRY_CTRL				0x0e02
-#define CCS_R_BRACKETING_LUT_FRAME(n)				(0x0e10 + (n))
+#define CCS_R_BRACKETING_LUT_ENTRY_CTRL				CCI_REG8(0x0e02)
+#define CCS_R_BRACKETING_LUT_FRAME(n)				CCI_REG8(0x0e10 + (n))
 #define CCS_LIM_BRACKETING_LUT_FRAME_MIN_N			0U
 #define CCS_LIM_BRACKETING_LUT_FRAME_MAX_N			239U
-#define CCS_R_INTEGRATION_TIME_CAPABILITY			(0x1000 | CCS_FL_16BIT)
+#define CCS_R_INTEGRATION_TIME_CAPABILITY			CCI_REG16(0x1000)
 #define CCS_INTEGRATION_TIME_CAPABILITY_FINE			BIT(0)
-#define CCS_R_COARSE_INTEGRATION_TIME_MIN			(0x1004 | CCS_FL_16BIT)
-#define CCS_R_COARSE_INTEGRATION_TIME_MAX_MARGIN		(0x1006 | CCS_FL_16BIT)
-#define CCS_R_FINE_INTEGRATION_TIME_MIN				(0x1008 | CCS_FL_16BIT)
-#define CCS_R_FINE_INTEGRATION_TIME_MAX_MARGIN			(0x100a | CCS_FL_16BIT)
-#define CCS_R_DIGITAL_GAIN_CAPABILITY				0x1081
+#define CCS_R_COARSE_INTEGRATION_TIME_MIN			CCI_REG16(0x1004)
+#define CCS_R_COARSE_INTEGRATION_TIME_MAX_MARGIN		CCI_REG16(0x1006)
+#define CCS_R_FINE_INTEGRATION_TIME_MIN				CCI_REG16(0x1008)
+#define CCS_R_FINE_INTEGRATION_TIME_MAX_MARGIN			CCI_REG16(0x100a)
+#define CCS_R_DIGITAL_GAIN_CAPABILITY				CCI_REG8(0x1081)
 #define CCS_DIGITAL_GAIN_CAPABILITY_NONE			0U
 #define CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL			2U
-#define CCS_R_DIGITAL_GAIN_MIN					(0x1084 | CCS_FL_16BIT)
-#define CCS_R_DIGITAL_GAIN_MAX					(0x1086 | CCS_FL_16BIT)
-#define CCS_R_DIGITAL_GAIN_STEP_SIZE				(0x1088 | CCS_FL_16BIT)
-#define CCS_R_PEDESTAL_CAPABILITY				0x10e0
-#define CCS_R_ADC_CAPABILITY					0x10f0
+#define CCS_R_DIGITAL_GAIN_MIN					CCI_REG16(0x1084)
+#define CCS_R_DIGITAL_GAIN_MAX					CCI_REG16(0x1086)
+#define CCS_R_DIGITAL_GAIN_STEP_SIZE				CCI_REG16(0x1088)
+#define CCS_R_PEDESTAL_CAPABILITY				CCI_REG8(0x10e0)
+#define CCS_R_ADC_CAPABILITY					CCI_REG8(0x10f0)
 #define CCS_ADC_CAPABILITY_BIT_DEPTH_CTRL			BIT(0)
-#define CCS_R_ADC_BIT_DEPTH_CAPABILITY				(0x10f4 | CCS_FL_32BIT)
-#define CCS_R_MIN_EXT_CLK_FREQ_MHZ				(0x1100 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_EXT_CLK_FREQ_MHZ				(0x1104 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MIN_PRE_PLL_CLK_DIV				(0x1108 | CCS_FL_16BIT)
-#define CCS_R_MAX_PRE_PLL_CLK_DIV				(0x110a | CCS_FL_16BIT)
-#define CCS_R_MIN_PLL_IP_CLK_FREQ_MHZ				(0x110c | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_PLL_IP_CLK_FREQ_MHZ				(0x1110 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MIN_PLL_MULTIPLIER				(0x1114 | CCS_FL_16BIT)
-#define CCS_R_MAX_PLL_MULTIPLIER				(0x1116 | CCS_FL_16BIT)
-#define CCS_R_MIN_PLL_OP_CLK_FREQ_MHZ				(0x1118 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_PLL_OP_CLK_FREQ_MHZ				(0x111c | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MIN_VT_SYS_CLK_DIV				(0x1120 | CCS_FL_16BIT)
-#define CCS_R_MAX_VT_SYS_CLK_DIV				(0x1122 | CCS_FL_16BIT)
-#define CCS_R_MIN_VT_SYS_CLK_FREQ_MHZ				(0x1124 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_VT_SYS_CLK_FREQ_MHZ				(0x1128 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MIN_VT_PIX_CLK_FREQ_MHZ				(0x112c | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_VT_PIX_CLK_FREQ_MHZ				(0x1130 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MIN_VT_PIX_CLK_DIV				(0x1134 | CCS_FL_16BIT)
-#define CCS_R_MAX_VT_PIX_CLK_DIV				(0x1136 | CCS_FL_16BIT)
-#define CCS_R_CLOCK_CALCULATION					0x1138
+#define CCS_R_ADC_BIT_DEPTH_CAPABILITY				CCI_REG32(0x10f4)
+#define CCS_R_MIN_EXT_CLK_FREQ_MHZ				(CCI_REG32(0x1100) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_EXT_CLK_FREQ_MHZ				(CCI_REG32(0x1104) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MIN_PRE_PLL_CLK_DIV				CCI_REG16(0x1108)
+#define CCS_R_MAX_PRE_PLL_CLK_DIV				CCI_REG16(0x110a)
+#define CCS_R_MIN_PLL_IP_CLK_FREQ_MHZ				(CCI_REG32(0x110c) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_PLL_IP_CLK_FREQ_MHZ				(CCI_REG32(0x1110) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MIN_PLL_MULTIPLIER				CCI_REG16(0x1114)
+#define CCS_R_MAX_PLL_MULTIPLIER				CCI_REG16(0x1116)
+#define CCS_R_MIN_PLL_OP_CLK_FREQ_MHZ				(CCI_REG32(0x1118) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_PLL_OP_CLK_FREQ_MHZ				(CCI_REG32(0x111c) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MIN_VT_SYS_CLK_DIV				CCI_REG16(0x1120)
+#define CCS_R_MAX_VT_SYS_CLK_DIV				CCI_REG16(0x1122)
+#define CCS_R_MIN_VT_SYS_CLK_FREQ_MHZ				(CCI_REG32(0x1124) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_VT_SYS_CLK_FREQ_MHZ				(CCI_REG32(0x1128) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MIN_VT_PIX_CLK_FREQ_MHZ				(CCI_REG32(0x112c) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_VT_PIX_CLK_FREQ_MHZ				(CCI_REG32(0x1130) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MIN_VT_PIX_CLK_DIV				CCI_REG16(0x1134)
+#define CCS_R_MAX_VT_PIX_CLK_DIV				CCI_REG16(0x1136)
+#define CCS_R_CLOCK_CALCULATION					CCI_REG8(0x1138)
 #define CCS_CLOCK_CALCULATION_LANE_SPEED			BIT(0)
 #define CCS_CLOCK_CALCULATION_LINK_DECOUPLED			BIT(1)
 #define CCS_CLOCK_CALCULATION_DUAL_PLL_OP_SYS_DDR		BIT(2)
 #define CCS_CLOCK_CALCULATION_DUAL_PLL_OP_PIX_DDR		BIT(3)
-#define CCS_R_NUM_OF_VT_LANES					0x1139
-#define CCS_R_NUM_OF_OP_LANES					0x113a
-#define CCS_R_OP_BITS_PER_LANE					0x113b
-#define CCS_R_MIN_FRAME_LENGTH_LINES				(0x1140 | CCS_FL_16BIT)
-#define CCS_R_MAX_FRAME_LENGTH_LINES				(0x1142 | CCS_FL_16BIT)
-#define CCS_R_MIN_LINE_LENGTH_PCK				(0x1144 | CCS_FL_16BIT)
-#define CCS_R_MAX_LINE_LENGTH_PCK				(0x1146 | CCS_FL_16BIT)
-#define CCS_R_MIN_LINE_BLANKING_PCK				(0x1148 | CCS_FL_16BIT)
-#define CCS_R_MIN_FRAME_BLANKING_LINES				(0x114a | CCS_FL_16BIT)
-#define CCS_R_MIN_LINE_LENGTH_PCK_STEP_SIZE			0x114c
-#define CCS_R_TIMING_MODE_CAPABILITY				0x114d
+#define CCS_R_NUM_OF_VT_LANES					CCI_REG8(0x1139)
+#define CCS_R_NUM_OF_OP_LANES					CCI_REG8(0x113a)
+#define CCS_R_OP_BITS_PER_LANE					CCI_REG8(0x113b)
+#define CCS_R_MIN_FRAME_LENGTH_LINES				CCI_REG16(0x1140)
+#define CCS_R_MAX_FRAME_LENGTH_LINES				CCI_REG16(0x1142)
+#define CCS_R_MIN_LINE_LENGTH_PCK				CCI_REG16(0x1144)
+#define CCS_R_MAX_LINE_LENGTH_PCK				CCI_REG16(0x1146)
+#define CCS_R_MIN_LINE_BLANKING_PCK				CCI_REG16(0x1148)
+#define CCS_R_MIN_FRAME_BLANKING_LINES				CCI_REG16(0x114a)
+#define CCS_R_MIN_LINE_LENGTH_PCK_STEP_SIZE			CCI_REG8(0x114c)
+#define CCS_R_TIMING_MODE_CAPABILITY				CCI_REG8(0x114d)
 #define CCS_TIMING_MODE_CAPABILITY_AUTO_FRAME_LENGTH		BIT(0)
 #define CCS_TIMING_MODE_CAPABILITY_ROLLING_SHUTTER_MANUAL_READOUT      BIT(2)
 #define CCS_TIMING_MODE_CAPABILITY_DELAYED_EXPOSURE_START	BIT(3)
 #define CCS_TIMING_MODE_CAPABILITY_MANUAL_EXPOSURE_EMBEDDED_DATA       BIT(4)
-#define CCS_R_FRAME_MARGIN_MAX_VALUE				(0x114e | CCS_FL_16BIT)
-#define CCS_R_FRAME_MARGIN_MIN_VALUE				0x1150
-#define CCS_R_GAIN_DELAY_TYPE					0x1151
+#define CCS_R_FRAME_MARGIN_MAX_VALUE				CCI_REG16(0x114e)
+#define CCS_R_FRAME_MARGIN_MIN_VALUE				CCI_REG8(0x1150)
+#define CCS_R_GAIN_DELAY_TYPE					CCI_REG8(0x1151)
 #define CCS_GAIN_DELAY_TYPE_FIXED				0U
 #define CCS_GAIN_DELAY_TYPE_VARIABLE				1U
-#define CCS_R_MIN_OP_SYS_CLK_DIV				(0x1160 | CCS_FL_16BIT)
-#define CCS_R_MAX_OP_SYS_CLK_DIV				(0x1162 | CCS_FL_16BIT)
-#define CCS_R_MIN_OP_SYS_CLK_FREQ_MHZ				(0x1164 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_OP_SYS_CLK_FREQ_MHZ				(0x1168 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MIN_OP_PIX_CLK_DIV				(0x116c | CCS_FL_16BIT)
-#define CCS_R_MAX_OP_PIX_CLK_DIV				(0x116e | CCS_FL_16BIT)
-#define CCS_R_MIN_OP_PIX_CLK_FREQ_MHZ				(0x1170 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_OP_PIX_CLK_FREQ_MHZ				(0x1174 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_X_ADDR_MIN					(0x1180 | CCS_FL_16BIT)
-#define CCS_R_Y_ADDR_MIN					(0x1182 | CCS_FL_16BIT)
-#define CCS_R_X_ADDR_MAX					(0x1184 | CCS_FL_16BIT)
-#define CCS_R_Y_ADDR_MAX					(0x1186 | CCS_FL_16BIT)
-#define CCS_R_MIN_X_OUTPUT_SIZE					(0x1188 | CCS_FL_16BIT)
-#define CCS_R_MIN_Y_OUTPUT_SIZE					(0x118a | CCS_FL_16BIT)
-#define CCS_R_MAX_X_OUTPUT_SIZE					(0x118c | CCS_FL_16BIT)
-#define CCS_R_MAX_Y_OUTPUT_SIZE					(0x118e | CCS_FL_16BIT)
-#define CCS_R_X_ADDR_START_DIV_CONSTANT				0x1190
-#define CCS_R_Y_ADDR_START_DIV_CONSTANT				0x1191
-#define CCS_R_X_ADDR_END_DIV_CONSTANT				0x1192
-#define CCS_R_Y_ADDR_END_DIV_CONSTANT				0x1193
-#define CCS_R_X_SIZE_DIV					0x1194
-#define CCS_R_Y_SIZE_DIV					0x1195
-#define CCS_R_X_OUTPUT_DIV					0x1196
-#define CCS_R_Y_OUTPUT_DIV					0x1197
-#define CCS_R_NON_FLEXIBLE_RESOLUTION_SUPPORT			0x1198
+#define CCS_R_MIN_OP_SYS_CLK_DIV				CCI_REG16(0x1160)
+#define CCS_R_MAX_OP_SYS_CLK_DIV				CCI_REG16(0x1162)
+#define CCS_R_MIN_OP_SYS_CLK_FREQ_MHZ				(CCI_REG32(0x1164) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_OP_SYS_CLK_FREQ_MHZ				(CCI_REG32(0x1168) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MIN_OP_PIX_CLK_DIV				CCI_REG16(0x116c)
+#define CCS_R_MAX_OP_PIX_CLK_DIV				CCI_REG16(0x116e)
+#define CCS_R_MIN_OP_PIX_CLK_FREQ_MHZ				(CCI_REG32(0x1170) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_OP_PIX_CLK_FREQ_MHZ				(CCI_REG32(0x1174) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_X_ADDR_MIN					CCI_REG16(0x1180)
+#define CCS_R_Y_ADDR_MIN					CCI_REG16(0x1182)
+#define CCS_R_X_ADDR_MAX					CCI_REG16(0x1184)
+#define CCS_R_Y_ADDR_MAX					CCI_REG16(0x1186)
+#define CCS_R_MIN_X_OUTPUT_SIZE					CCI_REG16(0x1188)
+#define CCS_R_MIN_Y_OUTPUT_SIZE					CCI_REG16(0x118a)
+#define CCS_R_MAX_X_OUTPUT_SIZE					CCI_REG16(0x118c)
+#define CCS_R_MAX_Y_OUTPUT_SIZE					CCI_REG16(0x118e)
+#define CCS_R_X_ADDR_START_DIV_CONSTANT				CCI_REG8(0x1190)
+#define CCS_R_Y_ADDR_START_DIV_CONSTANT				CCI_REG8(0x1191)
+#define CCS_R_X_ADDR_END_DIV_CONSTANT				CCI_REG8(0x1192)
+#define CCS_R_Y_ADDR_END_DIV_CONSTANT				CCI_REG8(0x1193)
+#define CCS_R_X_SIZE_DIV					CCI_REG8(0x1194)
+#define CCS_R_Y_SIZE_DIV					CCI_REG8(0x1195)
+#define CCS_R_X_OUTPUT_DIV					CCI_REG8(0x1196)
+#define CCS_R_Y_OUTPUT_DIV					CCI_REG8(0x1197)
+#define CCS_R_NON_FLEXIBLE_RESOLUTION_SUPPORT			CCI_REG8(0x1198)
 #define CCS_NON_FLEXIBLE_RESOLUTION_SUPPORT_NEW_PIX_ADDR	BIT(0)
 #define CCS_NON_FLEXIBLE_RESOLUTION_SUPPORT_NEW_OUTPUT_RES	BIT(1)
 #define CCS_NON_FLEXIBLE_RESOLUTION_SUPPORT_OUTPUT_CROP_NO_PAD	BIT(2)
 #define CCS_NON_FLEXIBLE_RESOLUTION_SUPPORT_OUTPUT_SIZE_LANE_DEP       BIT(3)
-#define CCS_R_MIN_OP_PRE_PLL_CLK_DIV				(0x11a0 | CCS_FL_16BIT)
-#define CCS_R_MAX_OP_PRE_PLL_CLK_DIV				(0x11a2 | CCS_FL_16BIT)
-#define CCS_R_MIN_OP_PLL_IP_CLK_FREQ_MHZ			(0x11a4 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_OP_PLL_IP_CLK_FREQ_MHZ			(0x11a8 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MIN_OP_PLL_MULTIPLIER				(0x11ac | CCS_FL_16BIT)
-#define CCS_R_MAX_OP_PLL_MULTIPLIER				(0x11ae | CCS_FL_16BIT)
-#define CCS_R_MIN_OP_PLL_OP_CLK_FREQ_MHZ			(0x11b0 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_OP_PLL_OP_CLK_FREQ_MHZ			(0x11b4 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_CLOCK_TREE_PLL_CAPABILITY				0x11b8
+#define CCS_R_MIN_OP_PRE_PLL_CLK_DIV				CCI_REG16(0x11a0)
+#define CCS_R_MAX_OP_PRE_PLL_CLK_DIV				CCI_REG16(0x11a2)
+#define CCS_R_MIN_OP_PLL_IP_CLK_FREQ_MHZ			(CCI_REG32(0x11a4) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_OP_PLL_IP_CLK_FREQ_MHZ			(CCI_REG32(0x11a8) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MIN_OP_PLL_MULTIPLIER				CCI_REG16(0x11ac)
+#define CCS_R_MAX_OP_PLL_MULTIPLIER				CCI_REG16(0x11ae)
+#define CCS_R_MIN_OP_PLL_OP_CLK_FREQ_MHZ			(CCI_REG32(0x11b0) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_OP_PLL_OP_CLK_FREQ_MHZ			(CCI_REG32(0x11b4) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_CLOCK_TREE_PLL_CAPABILITY				CCI_REG8(0x11b8)
 #define CCS_CLOCK_TREE_PLL_CAPABILITY_DUAL_PLL			BIT(0)
 #define CCS_CLOCK_TREE_PLL_CAPABILITY_SINGLE_PLL		BIT(1)
 #define CCS_CLOCK_TREE_PLL_CAPABILITY_EXT_DIVIDER		BIT(2)
 #define CCS_CLOCK_TREE_PLL_CAPABILITY_FLEXIBLE_OP_PIX_CLK_DIV	BIT(3)
-#define CCS_R_CLOCK_CAPA_TYPE_CAPABILITY			0x11b9
+#define CCS_R_CLOCK_CAPA_TYPE_CAPABILITY			CCI_REG8(0x11b9)
 #define CCS_CLOCK_CAPA_TYPE_CAPABILITY_IREAL			BIT(0)
-#define CCS_R_MIN_EVEN_INC					(0x11c0 | CCS_FL_16BIT)
-#define CCS_R_MIN_ODD_INC					(0x11c2 | CCS_FL_16BIT)
-#define CCS_R_MAX_EVEN_INC					(0x11c4 | CCS_FL_16BIT)
-#define CCS_R_MAX_ODD_INC					(0x11c6 | CCS_FL_16BIT)
-#define CCS_R_AUX_SUBSAMP_CAPABILITY				0x11c8
+#define CCS_R_MIN_EVEN_INC					CCI_REG16(0x11c0)
+#define CCS_R_MIN_ODD_INC					CCI_REG16(0x11c2)
+#define CCS_R_MAX_EVEN_INC					CCI_REG16(0x11c4)
+#define CCS_R_MAX_ODD_INC					CCI_REG16(0x11c6)
+#define CCS_R_AUX_SUBSAMP_CAPABILITY				CCI_REG8(0x11c8)
 #define CCS_AUX_SUBSAMP_CAPABILITY_FACTOR_POWER_OF_2		BIT(1)
-#define CCS_R_AUX_SUBSAMP_MONO_CAPABILITY			0x11c9
+#define CCS_R_AUX_SUBSAMP_MONO_CAPABILITY			CCI_REG8(0x11c9)
 #define CCS_AUX_SUBSAMP_MONO_CAPABILITY_FACTOR_POWER_OF_2	BIT(1)
-#define CCS_R_MONOCHROME_CAPABILITY				0x11ca
+#define CCS_R_MONOCHROME_CAPABILITY				CCI_REG8(0x11ca)
 #define CCS_MONOCHROME_CAPABILITY_INC_ODD			0U
 #define CCS_MONOCHROME_CAPABILITY_INC_EVEN			1U
-#define CCS_R_PIXEL_READOUT_CAPABILITY				0x11cb
+#define CCS_R_PIXEL_READOUT_CAPABILITY				CCI_REG8(0x11cb)
 #define CCS_PIXEL_READOUT_CAPABILITY_BAYER			0U
 #define CCS_PIXEL_READOUT_CAPABILITY_MONOCHROME			1U
 #define CCS_PIXEL_READOUT_CAPABILITY_BAYER_AND_MONO		2U
-#define CCS_R_MIN_EVEN_INC_MONO					(0x11cc | CCS_FL_16BIT)
-#define CCS_R_MAX_EVEN_INC_MONO					(0x11ce | CCS_FL_16BIT)
-#define CCS_R_MIN_ODD_INC_MONO					(0x11d0 | CCS_FL_16BIT)
-#define CCS_R_MAX_ODD_INC_MONO					(0x11d2 | CCS_FL_16BIT)
-#define CCS_R_MIN_EVEN_INC_BC2					(0x11d4 | CCS_FL_16BIT)
-#define CCS_R_MAX_EVEN_INC_BC2					(0x11d6 | CCS_FL_16BIT)
-#define CCS_R_MIN_ODD_INC_BC2					(0x11d8 | CCS_FL_16BIT)
-#define CCS_R_MAX_ODD_INC_BC2					(0x11da | CCS_FL_16BIT)
-#define CCS_R_MIN_EVEN_INC_MONO_BC2				(0x11dc | CCS_FL_16BIT)
-#define CCS_R_MAX_EVEN_INC_MONO_BC2				(0x11de | CCS_FL_16BIT)
-#define CCS_R_MIN_ODD_INC_MONO_BC2				(0x11f0 | CCS_FL_16BIT)
-#define CCS_R_MAX_ODD_INC_MONO_BC2				(0x11f2 | CCS_FL_16BIT)
-#define CCS_R_SCALING_CAPABILITY				(0x1200 | CCS_FL_16BIT)
+#define CCS_R_MIN_EVEN_INC_MONO					CCI_REG16(0x11cc)
+#define CCS_R_MAX_EVEN_INC_MONO					CCI_REG16(0x11ce)
+#define CCS_R_MIN_ODD_INC_MONO					CCI_REG16(0x11d0)
+#define CCS_R_MAX_ODD_INC_MONO					CCI_REG16(0x11d2)
+#define CCS_R_MIN_EVEN_INC_BC2					CCI_REG16(0x11d4)
+#define CCS_R_MAX_EVEN_INC_BC2					CCI_REG16(0x11d6)
+#define CCS_R_MIN_ODD_INC_BC2					CCI_REG16(0x11d8)
+#define CCS_R_MAX_ODD_INC_BC2					CCI_REG16(0x11da)
+#define CCS_R_MIN_EVEN_INC_MONO_BC2				CCI_REG16(0x11dc)
+#define CCS_R_MAX_EVEN_INC_MONO_BC2				CCI_REG16(0x11de)
+#define CCS_R_MIN_ODD_INC_MONO_BC2				CCI_REG16(0x11f0)
+#define CCS_R_MAX_ODD_INC_MONO_BC2				CCI_REG16(0x11f2)
+#define CCS_R_SCALING_CAPABILITY				CCI_REG16(0x1200)
 #define CCS_SCALING_CAPABILITY_NONE				0U
 #define CCS_SCALING_CAPABILITY_HORIZONTAL			1U
 #define CCS_SCALING_CAPABILITY_RESERVED				2U
-#define CCS_R_SCALER_M_MIN					(0x1204 | CCS_FL_16BIT)
-#define CCS_R_SCALER_M_MAX					(0x1206 | CCS_FL_16BIT)
-#define CCS_R_SCALER_N_MIN					(0x1208 | CCS_FL_16BIT)
-#define CCS_R_SCALER_N_MAX					(0x120a | CCS_FL_16BIT)
-#define CCS_R_DIGITAL_CROP_CAPABILITY				0x120e
+#define CCS_R_SCALER_M_MIN					CCI_REG16(0x1204)
+#define CCS_R_SCALER_M_MAX					CCI_REG16(0x1206)
+#define CCS_R_SCALER_N_MIN					CCI_REG16(0x1208)
+#define CCS_R_SCALER_N_MAX					CCI_REG16(0x120a)
+#define CCS_R_DIGITAL_CROP_CAPABILITY				CCI_REG8(0x120e)
 #define CCS_DIGITAL_CROP_CAPABILITY_NONE			0U
 #define CCS_DIGITAL_CROP_CAPABILITY_INPUT_CROP			1U
-#define CCS_R_HDR_CAPABILITY_1					0x1210
+#define CCS_R_HDR_CAPABILITY_1					CCI_REG8(0x1210)
 #define CCS_HDR_CAPABILITY_1_2X2_BINNING			BIT(0)
 #define CCS_HDR_CAPABILITY_1_COMBINED_ANALOG_GAIN		BIT(1)
 #define CCS_HDR_CAPABILITY_1_SEPARATE_ANALOG_GAIN		BIT(2)
@@ -611,66 +611,66 @@
 #define CCS_HDR_CAPABILITY_1_RESET_SYNC				BIT(4)
 #define CCS_HDR_CAPABILITY_1_DIRECT_SHORT_EXP_TIMING		BIT(5)
 #define CCS_HDR_CAPABILITY_1_DIRECT_SHORT_EXP_SYNTHESIS		BIT(6)
-#define CCS_R_MIN_HDR_BIT_DEPTH					0x1211
-#define CCS_R_HDR_RESOLUTION_SUB_TYPES				0x1212
-#define CCS_R_HDR_RESOLUTION_SUB_TYPE(n)			(0x1213 + (n))
+#define CCS_R_MIN_HDR_BIT_DEPTH					CCI_REG8(0x1211)
+#define CCS_R_HDR_RESOLUTION_SUB_TYPES				CCI_REG8(0x1212)
+#define CCS_R_HDR_RESOLUTION_SUB_TYPE(n)			CCI_REG8(0x1213 + (n))
 #define CCS_LIM_HDR_RESOLUTION_SUB_TYPE_MIN_N			0U
 #define CCS_LIM_HDR_RESOLUTION_SUB_TYPE_MAX_N			1U
 #define CCS_HDR_RESOLUTION_SUB_TYPE_ROW_SHIFT			0U
 #define CCS_HDR_RESOLUTION_SUB_TYPE_ROW_MASK			0xf
 #define CCS_HDR_RESOLUTION_SUB_TYPE_COLUMN_SHIFT		4U
 #define CCS_HDR_RESOLUTION_SUB_TYPE_COLUMN_MASK			0xf0
-#define CCS_R_HDR_CAPABILITY_2					0x121b
+#define CCS_R_HDR_CAPABILITY_2					CCI_REG8(0x121b)
 #define CCS_HDR_CAPABILITY_2_COMBINED_DIGITAL_GAIN		BIT(0)
 #define CCS_HDR_CAPABILITY_2_SEPARATE_DIGITAL_GAIN		BIT(1)
 #define CCS_HDR_CAPABILITY_2_TIMING_MODE			BIT(3)
 #define CCS_HDR_CAPABILITY_2_SYNTHESIS_MODE			BIT(4)
-#define CCS_R_MAX_HDR_BIT_DEPTH					0x121c
-#define CCS_R_USL_SUPPORT_CAPABILITY				0x1230
+#define CCS_R_MAX_HDR_BIT_DEPTH					CCI_REG8(0x121c)
+#define CCS_R_USL_SUPPORT_CAPABILITY				CCI_REG8(0x1230)
 #define CCS_USL_SUPPORT_CAPABILITY_CLOCK_TREE			BIT(0)
 #define CCS_USL_SUPPORT_CAPABILITY_REV_CLOCK_TREE		BIT(1)
 #define CCS_USL_SUPPORT_CAPABILITY_REV_CLOCK_CALC		BIT(2)
-#define CCS_R_USL_CLOCK_MODE_D_CAPABILITY			0x1231
+#define CCS_R_USL_CLOCK_MODE_D_CAPABILITY			CCI_REG8(0x1231)
 #define CCS_USL_CLOCK_MODE_D_CAPABILITY_CONT_CLOCK_STANDBY	BIT(0)
 #define CCS_USL_CLOCK_MODE_D_CAPABILITY_CONT_CLOCK_VBLANK	BIT(1)
 #define CCS_USL_CLOCK_MODE_D_CAPABILITY_CONT_CLOCK_HBLANK	BIT(2)
 #define CCS_USL_CLOCK_MODE_D_CAPABILITY_NONCONT_CLOCK_STANDBY	BIT(3)
 #define CCS_USL_CLOCK_MODE_D_CAPABILITY_NONCONT_CLOCK_VBLANK	BIT(4)
 #define CCS_USL_CLOCK_MODE_D_CAPABILITY_NONCONT_CLOCK_HBLANK	BIT(5)
-#define CCS_R_MIN_OP_SYS_CLK_DIV_REV				0x1234
-#define CCS_R_MAX_OP_SYS_CLK_DIV_REV				0x1236
-#define CCS_R_MIN_OP_PIX_CLK_DIV_REV				0x1238
-#define CCS_R_MAX_OP_PIX_CLK_DIV_REV				0x123a
-#define CCS_R_MIN_OP_SYS_CLK_FREQ_REV_MHZ			(0x123c | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_OP_SYS_CLK_FREQ_REV_MHZ			(0x1240 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MIN_OP_PIX_CLK_FREQ_REV_MHZ			(0x1244 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_OP_PIX_CLK_FREQ_REV_MHZ			(0x1248 | (CCS_FL_32BIT | CCS_FL_FLOAT_IREAL))
-#define CCS_R_MAX_BITRATE_REV_D_MODE_MBPS			(0x124c | (CCS_FL_32BIT | CCS_FL_IREAL))
-#define CCS_R_MAX_SYMRATE_REV_C_MODE_MSPS			(0x1250 | (CCS_FL_32BIT | CCS_FL_IREAL))
-#define CCS_R_COMPRESSION_CAPABILITY				0x1300
+#define CCS_R_MIN_OP_SYS_CLK_DIV_REV				CCI_REG8(0x1234)
+#define CCS_R_MAX_OP_SYS_CLK_DIV_REV				CCI_REG8(0x1236)
+#define CCS_R_MIN_OP_PIX_CLK_DIV_REV				CCI_REG8(0x1238)
+#define CCS_R_MAX_OP_PIX_CLK_DIV_REV				CCI_REG8(0x123a)
+#define CCS_R_MIN_OP_SYS_CLK_FREQ_REV_MHZ			(CCI_REG32(0x123c) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_OP_SYS_CLK_FREQ_REV_MHZ			(CCI_REG32(0x1240) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MIN_OP_PIX_CLK_FREQ_REV_MHZ			(CCI_REG32(0x1244) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_OP_PIX_CLK_FREQ_REV_MHZ			(CCI_REG32(0x1248) | CCS_FL_FLOAT_IREAL)
+#define CCS_R_MAX_BITRATE_REV_D_MODE_MBPS			(CCI_REG32(0x124c) | CCS_FL_IREAL)
+#define CCS_R_MAX_SYMRATE_REV_C_MODE_MSPS			(CCI_REG32(0x1250) | CCS_FL_IREAL)
+#define CCS_R_COMPRESSION_CAPABILITY				CCI_REG8(0x1300)
 #define CCS_COMPRESSION_CAPABILITY_DPCM_PCM_SIMPLE		BIT(0)
-#define CCS_R_TEST_MODE_CAPABILITY				(0x1310 | CCS_FL_16BIT)
+#define CCS_R_TEST_MODE_CAPABILITY				CCI_REG16(0x1310)
 #define CCS_TEST_MODE_CAPABILITY_SOLID_COLOR			BIT(0)
 #define CCS_TEST_MODE_CAPABILITY_COLOR_BARS			BIT(1)
 #define CCS_TEST_MODE_CAPABILITY_FADE_TO_GREY			BIT(2)
 #define CCS_TEST_MODE_CAPABILITY_PN9				BIT(3)
 #define CCS_TEST_MODE_CAPABILITY_COLOR_TILE			BIT(5)
-#define CCS_R_PN9_DATA_FORMAT1					0x1312
-#define CCS_R_PN9_DATA_FORMAT2					0x1313
-#define CCS_R_PN9_DATA_FORMAT3					0x1314
-#define CCS_R_PN9_DATA_FORMAT4					0x1315
-#define CCS_R_PN9_MISC_CAPABILITY				0x1316
+#define CCS_R_PN9_DATA_FORMAT1					CCI_REG8(0x1312)
+#define CCS_R_PN9_DATA_FORMAT2					CCI_REG8(0x1313)
+#define CCS_R_PN9_DATA_FORMAT3					CCI_REG8(0x1314)
+#define CCS_R_PN9_DATA_FORMAT4					CCI_REG8(0x1315)
+#define CCS_R_PN9_MISC_CAPABILITY				CCI_REG8(0x1316)
 #define CCS_PN9_MISC_CAPABILITY_NUM_PIXELS_SHIFT		0U
 #define CCS_PN9_MISC_CAPABILITY_NUM_PIXELS_MASK			0x7
 #define CCS_PN9_MISC_CAPABILITY_COMPRESSION			BIT(3)
-#define CCS_R_TEST_PATTERN_CAPABILITY				0x1317
+#define CCS_R_TEST_PATTERN_CAPABILITY				CCI_REG8(0x1317)
 #define CCS_TEST_PATTERN_CAPABILITY_NO_REPEAT			BIT(1)
-#define CCS_R_PATTERN_SIZE_DIV_M1				0x1318
-#define CCS_R_FIFO_SUPPORT_CAPABILITY				0x1502
+#define CCS_R_PATTERN_SIZE_DIV_M1				CCI_REG8(0x1318)
+#define CCS_R_FIFO_SUPPORT_CAPABILITY				CCI_REG8(0x1502)
 #define CCS_FIFO_SUPPORT_CAPABILITY_NONE			0U
 #define CCS_FIFO_SUPPORT_CAPABILITY_DERATING			1U
 #define CCS_FIFO_SUPPORT_CAPABILITY_DERATING_OVERRATING		2U
-#define CCS_R_PHY_CTRL_CAPABILITY				0x1600
+#define CCS_R_PHY_CTRL_CAPABILITY				CCI_REG8(0x1600)
 #define CCS_PHY_CTRL_CAPABILITY_AUTO_PHY_CTL			BIT(0)
 #define CCS_PHY_CTRL_CAPABILITY_UI_PHY_CTL			BIT(1)
 #define CCS_PHY_CTRL_CAPABILITY_DPHY_TIME_UI_REG_1_CTL		BIT(2)
@@ -679,7 +679,7 @@
 #define CCS_PHY_CTRL_CAPABILITY_DPHY_EXT_TIME_UI_REG_1_CTL	BIT(5)
 #define CCS_PHY_CTRL_CAPABILITY_DPHY_EXT_TIME_UI_REG_2_CTL	BIT(6)
 #define CCS_PHY_CTRL_CAPABILITY_DPHY_EXT_TIME_CTL		BIT(7)
-#define CCS_R_CSI_DPHY_LANE_MODE_CAPABILITY			0x1601
+#define CCS_R_CSI_DPHY_LANE_MODE_CAPABILITY			CCI_REG8(0x1601)
 #define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_1_LANE		BIT(0)
 #define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_2_LANE		BIT(1)
 #define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_3_LANE		BIT(2)
@@ -688,22 +688,22 @@
 #define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_6_LANE		BIT(5)
 #define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_7_LANE		BIT(6)
 #define CCS_CSI_DPHY_LANE_MODE_CAPABILITY_8_LANE		BIT(7)
-#define CCS_R_CSI_SIGNALING_MODE_CAPABILITY			0x1602
+#define CCS_R_CSI_SIGNALING_MODE_CAPABILITY			CCI_REG8(0x1602)
 #define CCS_CSI_SIGNALING_MODE_CAPABILITY_CSI_DPHY		BIT(2)
 #define CCS_CSI_SIGNALING_MODE_CAPABILITY_CSI_CPHY		BIT(3)
-#define CCS_R_FAST_STANDBY_CAPABILITY				0x1603
+#define CCS_R_FAST_STANDBY_CAPABILITY				CCI_REG8(0x1603)
 #define CCS_FAST_STANDBY_CAPABILITY_NO_FRAME_TRUNCATION		0U
 #define CCS_FAST_STANDBY_CAPABILITY_FRAME_TRUNCATION		1U
-#define CCS_R_CSI_ADDRESS_CONTROL_CAPABILITY			0x1604
+#define CCS_R_CSI_ADDRESS_CONTROL_CAPABILITY			CCI_REG8(0x1604)
 #define CCS_CSI_ADDRESS_CONTROL_CAPABILITY_CCI_ADDR_CHANGE	BIT(0)
 #define CCS_CSI_ADDRESS_CONTROL_CAPABILITY_2ND_CCI_ADDR		BIT(1)
 #define CCS_CSI_ADDRESS_CONTROL_CAPABILITY_SW_CHANGEABLE_2ND_CCI_ADDR  BIT(2)
-#define CCS_R_DATA_TYPE_CAPABILITY				0x1605
+#define CCS_R_DATA_TYPE_CAPABILITY				CCI_REG8(0x1605)
 #define CCS_DATA_TYPE_CAPABILITY_DPCM_PROGRAMMABLE		BIT(0)
 #define CCS_DATA_TYPE_CAPABILITY_BOTTOM_EMBEDDED_DT_PROGRAMMABLE       BIT(1)
 #define CCS_DATA_TYPE_CAPABILITY_BOTTOM_EMBEDDED_VC_PROGRAMMABLE       BIT(2)
 #define CCS_DATA_TYPE_CAPABILITY_EXT_VC_RANGE			BIT(3)
-#define CCS_R_CSI_CPHY_LANE_MODE_CAPABILITY			0x1606
+#define CCS_R_CSI_CPHY_LANE_MODE_CAPABILITY			CCI_REG8(0x1606)
 #define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_1_LANE		BIT(0)
 #define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_2_LANE		BIT(1)
 #define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_3_LANE		BIT(2)
@@ -712,44 +712,44 @@
 #define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_6_LANE		BIT(5)
 #define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_7_LANE		BIT(6)
 #define CCS_CSI_CPHY_LANE_MODE_CAPABILITY_8_LANE		BIT(7)
-#define CCS_R_EMB_DATA_CAPABILITY				0x1607
+#define CCS_R_EMB_DATA_CAPABILITY				CCI_REG8(0x1607)
 #define CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW16		BIT(0)
 #define CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW20		BIT(1)
 #define CCS_EMB_DATA_CAPABILITY_TWO_BYTES_PER_RAW24		BIT(2)
 #define CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW16		BIT(3)
 #define CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW20		BIT(4)
 #define CCS_EMB_DATA_CAPABILITY_NO_ONE_BYTE_PER_RAW24		BIT(5)
-#define CCS_R_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS(n)		((0x1608 | (CCS_FL_32BIT | CCS_FL_IREAL)) + ((n) < 4 ? (n) * 4 : 0x32 + ((n) - 4) * 4))
+#define CCS_R_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS(n)		(CCI_REG32(0x1608 + ((n) < 4 ? (n) * 4 : 0x32 + ((n) - 4) * 4)) | CCS_FL_IREAL)
 #define CCS_LIM_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS_MIN_N	0U
 #define CCS_LIM_MAX_PER_LANE_BITRATE_LANE_D_MODE_MBPS_MAX_N	7U
-#define CCS_R_TEMP_SENSOR_CAPABILITY				0x1618
+#define CCS_R_TEMP_SENSOR_CAPABILITY				CCI_REG8(0x1618)
 #define CCS_TEMP_SENSOR_CAPABILITY_SUPPORTED			BIT(0)
 #define CCS_TEMP_SENSOR_CAPABILITY_CCS_FORMAT			BIT(1)
 #define CCS_TEMP_SENSOR_CAPABILITY_RESET_0X80			BIT(2)
-#define CCS_R_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS(n)		((0x161a | (CCS_FL_32BIT | CCS_FL_IREAL)) + ((n) < 4 ? (n) * 4 : 0x30 + ((n) - 4) * 4))
+#define CCS_R_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS(n)		(CCI_REG32(0x161a + ((n) < 4 ? (n) * 4 : 0x30 + ((n) - 4) * 4)) | CCS_FL_IREAL)
 #define CCS_LIM_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS_MIN_N	0U
 #define CCS_LIM_MAX_PER_LANE_BITRATE_LANE_C_MODE_MBPS_MAX_N	7U
-#define CCS_R_DPHY_EQUALIZATION_CAPABILITY			0x162b
+#define CCS_R_DPHY_EQUALIZATION_CAPABILITY			CCI_REG8(0x162b)
 #define CCS_DPHY_EQUALIZATION_CAPABILITY_EQUALIZATION_CTRL	BIT(0)
 #define CCS_DPHY_EQUALIZATION_CAPABILITY_EQ1			BIT(1)
 #define CCS_DPHY_EQUALIZATION_CAPABILITY_EQ2			BIT(2)
-#define CCS_R_CPHY_EQUALIZATION_CAPABILITY			0x162c
+#define CCS_R_CPHY_EQUALIZATION_CAPABILITY			CCI_REG8(0x162c)
 #define CCS_CPHY_EQUALIZATION_CAPABILITY_EQUALIZATION_CTRL	BIT(0)
-#define CCS_R_DPHY_PREAMBLE_CAPABILITY				0x162d
+#define CCS_R_DPHY_PREAMBLE_CAPABILITY				CCI_REG8(0x162d)
 #define CCS_DPHY_PREAMBLE_CAPABILITY_PREAMBLE_SEQ_CTRL		BIT(0)
-#define CCS_R_DPHY_SSC_CAPABILITY				0x162e
+#define CCS_R_DPHY_SSC_CAPABILITY				CCI_REG8(0x162e)
 #define CCS_DPHY_SSC_CAPABILITY_SUPPORTED			BIT(0)
-#define CCS_R_CPHY_CALIBRATION_CAPABILITY			0x162f
+#define CCS_R_CPHY_CALIBRATION_CAPABILITY			CCI_REG8(0x162f)
 #define CCS_CPHY_CALIBRATION_CAPABILITY_MANUAL			BIT(0)
 #define CCS_CPHY_CALIBRATION_CAPABILITY_MANUAL_STREAMING	BIT(1)
 #define CCS_CPHY_CALIBRATION_CAPABILITY_FORMAT_1_CTRL		BIT(2)
 #define CCS_CPHY_CALIBRATION_CAPABILITY_FORMAT_2_CTRL		BIT(3)
 #define CCS_CPHY_CALIBRATION_CAPABILITY_FORMAT_3_CTRL		BIT(4)
-#define CCS_R_DPHY_CALIBRATION_CAPABILITY			0x1630
+#define CCS_R_DPHY_CALIBRATION_CAPABILITY			CCI_REG8(0x1630)
 #define CCS_DPHY_CALIBRATION_CAPABILITY_MANUAL			BIT(0)
 #define CCS_DPHY_CALIBRATION_CAPABILITY_MANUAL_STREAMING	BIT(1)
 #define CCS_DPHY_CALIBRATION_CAPABILITY_ALTERNATE_SEQ		BIT(2)
-#define CCS_R_PHY_CTRL_CAPABILITY_2				0x1631
+#define CCS_R_PHY_CTRL_CAPABILITY_2				CCI_REG8(0x1631)
 #define CCS_PHY_CTRL_CAPABILITY_2_TGR_LENGTH			BIT(0)
 #define CCS_PHY_CTRL_CAPABILITY_2_TGR_PREAMBLE_PROG_SEQ		BIT(1)
 #define CCS_PHY_CTRL_CAPABILITY_2_EXTRA_CPHY_MANUAL_TIMING	BIT(2)
@@ -758,13 +758,13 @@
 #define CCS_PHY_CTRL_CAPABILITY_2_CLOCK_BASED_MANUAL_CPHY	BIT(5)
 #define CCS_PHY_CTRL_CAPABILITY_2_MANUAL_LP_DPHY		BIT(6)
 #define CCS_PHY_CTRL_CAPABILITY_2_MANUAL_LP_CPHY		BIT(7)
-#define CCS_R_LRTE_CPHY_CAPABILITY				0x1632
+#define CCS_R_LRTE_CPHY_CAPABILITY				CCI_REG8(0x1632)
 #define CCS_LRTE_CPHY_CAPABILITY_PDQ_SHORT			BIT(0)
 #define CCS_LRTE_CPHY_CAPABILITY_SPACER_SHORT			BIT(1)
 #define CCS_LRTE_CPHY_CAPABILITY_PDQ_LONG			BIT(2)
 #define CCS_LRTE_CPHY_CAPABILITY_SPACER_LONG			BIT(3)
 #define CCS_LRTE_CPHY_CAPABILITY_SPACER_NO_PDQ			BIT(4)
-#define CCS_R_LRTE_DPHY_CAPABILITY				0x1633
+#define CCS_R_LRTE_DPHY_CAPABILITY				CCI_REG8(0x1633)
 #define CCS_LRTE_DPHY_CAPABILITY_PDQ_SHORT_OPT1			BIT(0)
 #define CCS_LRTE_DPHY_CAPABILITY_SPACER_SHORT_OPT1		BIT(1)
 #define CCS_LRTE_DPHY_CAPABILITY_PDQ_LONG_OPT1			BIT(2)
@@ -773,18 +773,18 @@
 #define CCS_LRTE_DPHY_CAPABILITY_SPACER_LONG_OPT2		BIT(5)
 #define CCS_LRTE_DPHY_CAPABILITY_SPACER_NO_PDQ_OPT1		BIT(6)
 #define CCS_LRTE_DPHY_CAPABILITY_SPACER_VARIABLE_OPT2		BIT(7)
-#define CCS_R_ALPS_CAPABILITY_DPHY				0x1634
+#define CCS_R_ALPS_CAPABILITY_DPHY				CCI_REG8(0x1634)
 #define CCS_ALPS_CAPABILITY_DPHY_LVLP_NOT_SUPPORTED		0U
 #define CCS_ALPS_CAPABILITY_DPHY_LVLP_SUPPORTED			1U
 #define CCS_ALPS_CAPABILITY_DPHY_CONTROLLABLE_LVLP		2U
-#define CCS_R_ALPS_CAPABILITY_CPHY				0x1635
+#define CCS_R_ALPS_CAPABILITY_CPHY				CCI_REG8(0x1635)
 #define CCS_ALPS_CAPABILITY_CPHY_LVLP_NOT_SUPPORTED		0U
 #define CCS_ALPS_CAPABILITY_CPHY_LVLP_SUPPORTED			1U
 #define CCS_ALPS_CAPABILITY_CPHY_CONTROLLABLE_LVLP		2U
 #define CCS_ALPS_CAPABILITY_CPHY_ALP_NOT_SUPPORTED		0xc
 #define CCS_ALPS_CAPABILITY_CPHY_ALP_SUPPORTED			0xd
 #define CCS_ALPS_CAPABILITY_CPHY_CONTROLLABLE_ALP		0xe
-#define CCS_R_SCRAMBLING_CAPABILITY				0x1636
+#define CCS_R_SCRAMBLING_CAPABILITY				CCI_REG8(0x1636)
 #define CCS_SCRAMBLING_CAPABILITY_SCRAMBLING_SUPPORTED		BIT(0)
 #define CCS_SCRAMBLING_CAPABILITY_MAX_SEEDS_PER_LANE_C_SHIFT	1U
 #define CCS_SCRAMBLING_CAPABILITY_MAX_SEEDS_PER_LANE_C_MASK	0x6
@@ -796,11 +796,11 @@
 #define CCS_SCRAMBLING_CAPABILITY_NUM_SEED_REGS_1		1U
 #define CCS_SCRAMBLING_CAPABILITY_NUM_SEED_REGS_4		4U
 #define CCS_SCRAMBLING_CAPABILITY_NUM_SEED_PER_LANE		BIT(6)
-#define CCS_R_DPHY_MANUAL_CONSTANT				0x1637
-#define CCS_R_CPHY_MANUAL_CONSTANT				0x1638
-#define CCS_R_CSI2_INTERFACE_CAPABILITY_MISC			0x1639
+#define CCS_R_DPHY_MANUAL_CONSTANT				CCI_REG8(0x1637)
+#define CCS_R_CPHY_MANUAL_CONSTANT				CCI_REG8(0x1638)
+#define CCS_R_CSI2_INTERFACE_CAPABILITY_MISC			CCI_REG8(0x1639)
 #define CCS_CSI2_INTERFACE_CAPABILITY_MISC_EOTP_SHORT_PKT_OPT2	BIT(0)
-#define CCS_R_PHY_CTRL_CAPABILITY_3				0x165c
+#define CCS_R_PHY_CTRL_CAPABILITY_3				CCI_REG8(0x165c)
 #define CCS_PHY_CTRL_CAPABILITY_3_DPHY_TIMING_NOT_MULTIPLE	BIT(0)
 #define CCS_PHY_CTRL_CAPABILITY_3_DPHY_MIN_TIMING_VALUE_1	BIT(1)
 #define CCS_PHY_CTRL_CAPABILITY_3_TWAKEUP_SUPPORTED		BIT(2)
@@ -808,130 +808,130 @@
 #define CCS_PHY_CTRL_CAPABILITY_3_THS_EXIT_SUPPORTED		BIT(4)
 #define CCS_PHY_CTRL_CAPABILITY_3_CPHY_TIMING_NOT_MULTIPLE	BIT(5)
 #define CCS_PHY_CTRL_CAPABILITY_3_CPHY_MIN_TIMING_VALUE_1	BIT(6)
-#define CCS_R_DPHY_SF						0x165d
-#define CCS_R_CPHY_SF						0x165e
+#define CCS_R_DPHY_SF						CCI_REG8(0x165d)
+#define CCS_R_CPHY_SF						CCI_REG8(0x165e)
 #define CCS_CPHY_SF_TWAKEUP_SHIFT				0U
 #define CCS_CPHY_SF_TWAKEUP_MASK				0xf
 #define CCS_CPHY_SF_TINIT_SHIFT					4U
 #define CCS_CPHY_SF_TINIT_MASK					0xf0
-#define CCS_R_DPHY_LIMITS_1					0x165f
+#define CCS_R_DPHY_LIMITS_1					CCI_REG8(0x165f)
 #define CCS_DPHY_LIMITS_1_THS_PREPARE_SHIFT			0U
 #define CCS_DPHY_LIMITS_1_THS_PREPARE_MASK			0xf
 #define CCS_DPHY_LIMITS_1_THS_ZERO_SHIFT			4U
 #define CCS_DPHY_LIMITS_1_THS_ZERO_MASK				0xf0
-#define CCS_R_DPHY_LIMITS_2					0x1660
+#define CCS_R_DPHY_LIMITS_2					CCI_REG8(0x1660)
 #define CCS_DPHY_LIMITS_2_THS_TRAIL_SHIFT			0U
 #define CCS_DPHY_LIMITS_2_THS_TRAIL_MASK			0xf
 #define CCS_DPHY_LIMITS_2_TCLK_TRAIL_MIN_SHIFT			4U
 #define CCS_DPHY_LIMITS_2_TCLK_TRAIL_MIN_MASK			0xf0
-#define CCS_R_DPHY_LIMITS_3					0x1661
+#define CCS_R_DPHY_LIMITS_3					CCI_REG8(0x1661)
 #define CCS_DPHY_LIMITS_3_TCLK_PREPARE_SHIFT			0U
 #define CCS_DPHY_LIMITS_3_TCLK_PREPARE_MASK			0xf
 #define CCS_DPHY_LIMITS_3_TCLK_ZERO_SHIFT			4U
 #define CCS_DPHY_LIMITS_3_TCLK_ZERO_MASK			0xf0
-#define CCS_R_DPHY_LIMITS_4					0x1662
+#define CCS_R_DPHY_LIMITS_4					CCI_REG8(0x1662)
 #define CCS_DPHY_LIMITS_4_TCLK_POST_SHIFT			0U
 #define CCS_DPHY_LIMITS_4_TCLK_POST_MASK			0xf
 #define CCS_DPHY_LIMITS_4_TLPX_SHIFT				4U
 #define CCS_DPHY_LIMITS_4_TLPX_MASK				0xf0
-#define CCS_R_DPHY_LIMITS_5					0x1663
+#define CCS_R_DPHY_LIMITS_5					CCI_REG8(0x1663)
 #define CCS_DPHY_LIMITS_5_THS_EXIT_SHIFT			0U
 #define CCS_DPHY_LIMITS_5_THS_EXIT_MASK				0xf
 #define CCS_DPHY_LIMITS_5_TWAKEUP_SHIFT				4U
 #define CCS_DPHY_LIMITS_5_TWAKEUP_MASK				0xf0
-#define CCS_R_DPHY_LIMITS_6					0x1664
+#define CCS_R_DPHY_LIMITS_6					CCI_REG8(0x1664)
 #define CCS_DPHY_LIMITS_6_TINIT_SHIFT				0U
 #define CCS_DPHY_LIMITS_6_TINIT_MASK				0xf
-#define CCS_R_CPHY_LIMITS_1					0x1665
+#define CCS_R_CPHY_LIMITS_1					CCI_REG8(0x1665)
 #define CCS_CPHY_LIMITS_1_T3_PREPARE_MAX_SHIFT			0U
 #define CCS_CPHY_LIMITS_1_T3_PREPARE_MAX_MASK			0xf
 #define CCS_CPHY_LIMITS_1_T3_LPX_MAX_SHIFT			4U
 #define CCS_CPHY_LIMITS_1_T3_LPX_MAX_MASK			0xf0
-#define CCS_R_CPHY_LIMITS_2					0x1666
+#define CCS_R_CPHY_LIMITS_2					CCI_REG8(0x1666)
 #define CCS_CPHY_LIMITS_2_THS_EXIT_MAX_SHIFT			0U
 #define CCS_CPHY_LIMITS_2_THS_EXIT_MAX_MASK			0xf
 #define CCS_CPHY_LIMITS_2_TWAKEUP_MAX_SHIFT			4U
 #define CCS_CPHY_LIMITS_2_TWAKEUP_MAX_MASK			0xf0
-#define CCS_R_CPHY_LIMITS_3					0x1667
+#define CCS_R_CPHY_LIMITS_3					CCI_REG8(0x1667)
 #define CCS_CPHY_LIMITS_3_TINIT_MAX_SHIFT			0U
 #define CCS_CPHY_LIMITS_3_TINIT_MAX_MASK			0xf
-#define CCS_R_MIN_FRAME_LENGTH_LINES_BIN			(0x1700 | CCS_FL_16BIT)
-#define CCS_R_MAX_FRAME_LENGTH_LINES_BIN			(0x1702 | CCS_FL_16BIT)
-#define CCS_R_MIN_LINE_LENGTH_PCK_BIN				(0x1704 | CCS_FL_16BIT)
-#define CCS_R_MAX_LINE_LENGTH_PCK_BIN				(0x1706 | CCS_FL_16BIT)
-#define CCS_R_MIN_LINE_BLANKING_PCK_BIN				(0x1708 | CCS_FL_16BIT)
-#define CCS_R_FINE_INTEGRATION_TIME_MIN_BIN			(0x170a | CCS_FL_16BIT)
-#define CCS_R_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN		(0x170c | CCS_FL_16BIT)
-#define CCS_R_BINNING_CAPABILITY				0x1710
+#define CCS_R_MIN_FRAME_LENGTH_LINES_BIN			CCI_REG16(0x1700)
+#define CCS_R_MAX_FRAME_LENGTH_LINES_BIN			CCI_REG16(0x1702)
+#define CCS_R_MIN_LINE_LENGTH_PCK_BIN				CCI_REG16(0x1704)
+#define CCS_R_MAX_LINE_LENGTH_PCK_BIN				CCI_REG16(0x1706)
+#define CCS_R_MIN_LINE_BLANKING_PCK_BIN				CCI_REG16(0x1708)
+#define CCS_R_FINE_INTEGRATION_TIME_MIN_BIN			CCI_REG16(0x170a)
+#define CCS_R_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN		CCI_REG16(0x170c)
+#define CCS_R_BINNING_CAPABILITY				CCI_REG8(0x1710)
 #define CCS_BINNING_CAPABILITY_UNSUPPORTED			0U
 #define CCS_BINNING_CAPABILITY_BINNING_THEN_SUBSAMPLING		1U
 #define CCS_BINNING_CAPABILITY_SUBSAMPLING_THEN_BINNING		2U
-#define CCS_R_BINNING_WEIGHTING_CAPABILITY			0x1711
+#define CCS_R_BINNING_WEIGHTING_CAPABILITY			CCI_REG8(0x1711)
 #define CCS_BINNING_WEIGHTING_CAPABILITY_AVERAGED		BIT(0)
 #define CCS_BINNING_WEIGHTING_CAPABILITY_SUMMED			BIT(1)
 #define CCS_BINNING_WEIGHTING_CAPABILITY_BAYER_CORRECTED	BIT(2)
 #define CCS_BINNING_WEIGHTING_CAPABILITY_MODULE_SPECIFIC_WEIGHT	BIT(3)
-#define CCS_R_BINNING_SUB_TYPES					0x1712
-#define CCS_R_BINNING_SUB_TYPE(n)				(0x1713 + (n))
+#define CCS_R_BINNING_SUB_TYPES					CCI_REG8(0x1712)
+#define CCS_R_BINNING_SUB_TYPE(n)				CCI_REG8(0x1713 + (n))
 #define CCS_LIM_BINNING_SUB_TYPE_MIN_N				0U
 #define CCS_LIM_BINNING_SUB_TYPE_MAX_N				63U
 #define CCS_BINNING_SUB_TYPE_ROW_SHIFT				0U
 #define CCS_BINNING_SUB_TYPE_ROW_MASK				0xf
 #define CCS_BINNING_SUB_TYPE_COLUMN_SHIFT			4U
 #define CCS_BINNING_SUB_TYPE_COLUMN_MASK			0xf0
-#define CCS_R_BINNING_WEIGHTING_MONO_CAPABILITY			0x1771
+#define CCS_R_BINNING_WEIGHTING_MONO_CAPABILITY			CCI_REG8(0x1771)
 #define CCS_BINNING_WEIGHTING_MONO_CAPABILITY_AVERAGED		BIT(0)
 #define CCS_BINNING_WEIGHTING_MONO_CAPABILITY_SUMMED		BIT(1)
 #define CCS_BINNING_WEIGHTING_MONO_CAPABILITY_BAYER_CORRECTED	BIT(2)
 #define CCS_BINNING_WEIGHTING_MONO_CAPABILITY_MODULE_SPECIFIC_WEIGHT   BIT(3)
-#define CCS_R_BINNING_SUB_TYPES_MONO				0x1772
-#define CCS_R_BINNING_SUB_TYPE_MONO(n)				(0x1773 + (n))
+#define CCS_R_BINNING_SUB_TYPES_MONO				CCI_REG8(0x1772)
+#define CCS_R_BINNING_SUB_TYPE_MONO(n)				CCI_REG8(0x1773 + (n))
 #define CCS_LIM_BINNING_SUB_TYPE_MONO_MIN_N			0U
 #define CCS_LIM_BINNING_SUB_TYPE_MONO_MAX_N			63U
-#define CCS_R_DATA_TRANSFER_IF_CAPABILITY			0x1800
+#define CCS_R_DATA_TRANSFER_IF_CAPABILITY			CCI_REG8(0x1800)
 #define CCS_DATA_TRANSFER_IF_CAPABILITY_SUPPORTED		BIT(0)
 #define CCS_DATA_TRANSFER_IF_CAPABILITY_POLLING			BIT(2)
-#define CCS_R_SHADING_CORRECTION_CAPABILITY			0x1900
+#define CCS_R_SHADING_CORRECTION_CAPABILITY			CCI_REG8(0x1900)
 #define CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING		BIT(0)
 #define CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION	BIT(1)
-#define CCS_R_GREEN_IMBALANCE_CAPABILITY			0x1901
+#define CCS_R_GREEN_IMBALANCE_CAPABILITY			CCI_REG8(0x1901)
 #define CCS_GREEN_IMBALANCE_CAPABILITY_SUPPORTED		BIT(0)
-#define CCS_R_MODULE_SPECIFIC_CORRECTION_CAPABILITY		0x1903
-#define CCS_R_DEFECT_CORRECTION_CAPABILITY			(0x1904 | CCS_FL_16BIT)
+#define CCS_R_MODULE_SPECIFIC_CORRECTION_CAPABILITY		CCI_REG8(0x1903)
+#define CCS_R_DEFECT_CORRECTION_CAPABILITY			CCI_REG16(0x1904)
 #define CCS_DEFECT_CORRECTION_CAPABILITY_MAPPED_DEFECT		BIT(0)
 #define CCS_DEFECT_CORRECTION_CAPABILITY_DYNAMIC_COUPLET	BIT(2)
 #define CCS_DEFECT_CORRECTION_CAPABILITY_DYNAMIC_SINGLE		BIT(5)
 #define CCS_DEFECT_CORRECTION_CAPABILITY_COMBINED_DYNAMIC	BIT(8)
-#define CCS_R_DEFECT_CORRECTION_CAPABILITY_2			(0x1906 | CCS_FL_16BIT)
+#define CCS_R_DEFECT_CORRECTION_CAPABILITY_2			CCI_REG16(0x1906)
 #define CCS_DEFECT_CORRECTION_CAPABILITY_2_DYNAMIC_TRIPLET	BIT(3)
-#define CCS_R_NF_CAPABILITY					0x1908
+#define CCS_R_NF_CAPABILITY					CCI_REG8(0x1908)
 #define CCS_NF_CAPABILITY_LUMA					BIT(0)
 #define CCS_NF_CAPABILITY_CHROMA				BIT(1)
 #define CCS_NF_CAPABILITY_COMBINED				BIT(2)
-#define CCS_R_OB_READOUT_CAPABILITY				0x1980
+#define CCS_R_OB_READOUT_CAPABILITY				CCI_REG8(0x1980)
 #define CCS_OB_READOUT_CAPABILITY_CONTROLLABLE_READOUT		BIT(0)
 #define CCS_OB_READOUT_CAPABILITY_VISIBLE_PIXEL_READOUT		BIT(1)
 #define CCS_OB_READOUT_CAPABILITY_DIFFERENT_VC_READOUT		BIT(2)
 #define CCS_OB_READOUT_CAPABILITY_DIFFERENT_DT_READOUT		BIT(3)
 #define CCS_OB_READOUT_CAPABILITY_PROG_DATA_FORMAT		BIT(4)
-#define CCS_R_COLOR_FEEDBACK_CAPABILITY				0x1987
+#define CCS_R_COLOR_FEEDBACK_CAPABILITY				CCI_REG8(0x1987)
 #define CCS_COLOR_FEEDBACK_CAPABILITY_KELVIN			BIT(0)
 #define CCS_COLOR_FEEDBACK_CAPABILITY_AWB_GAIN			BIT(1)
-#define CCS_R_CFA_PATTERN_CAPABILITY				0x1990
+#define CCS_R_CFA_PATTERN_CAPABILITY				CCI_REG8(0x1990)
 #define CCS_CFA_PATTERN_CAPABILITY_BAYER			0U
 #define CCS_CFA_PATTERN_CAPABILITY_MONOCHROME			1U
 #define CCS_CFA_PATTERN_CAPABILITY_4X4_QUAD_BAYER		2U
 #define CCS_CFA_PATTERN_CAPABILITY_VENDOR_SPECIFIC		3U
-#define CCS_R_CFA_PATTERN_CONVERSION_CAPABILITY			0x1991
+#define CCS_R_CFA_PATTERN_CONVERSION_CAPABILITY			CCI_REG8(0x1991)
 #define CCS_CFA_PATTERN_CONVERSION_CAPABILITY_BAYER		BIT(0)
-#define CCS_R_FLASH_MODE_CAPABILITY				0x1a02
+#define CCS_R_FLASH_MODE_CAPABILITY				CCI_REG8(0x1a02)
 #define CCS_FLASH_MODE_CAPABILITY_SINGLE_STROBE			BIT(0)
-#define CCS_R_SA_STROBE_MODE_CAPABILITY				0x1a03
+#define CCS_R_SA_STROBE_MODE_CAPABILITY				CCI_REG8(0x1a03)
 #define CCS_SA_STROBE_MODE_CAPABILITY_FIXED_WIDTH		BIT(0)
 #define CCS_SA_STROBE_MODE_CAPABILITY_EDGE_CTRL			BIT(1)
-#define CCS_R_RESET_MAX_DELAY					0x1a10
-#define CCS_R_RESET_MIN_TIME					0x1a11
-#define CCS_R_PDAF_CAPABILITY_1					0x1b80
+#define CCS_R_RESET_MAX_DELAY					CCI_REG8(0x1a10)
+#define CCS_R_RESET_MIN_TIME					CCI_REG8(0x1a11)
+#define CCS_R_PDAF_CAPABILITY_1					CCI_REG8(0x1b80)
 #define CCS_PDAF_CAPABILITY_1_SUPPORTED				BIT(0)
 #define CCS_PDAF_CAPABILITY_1_PROCESSED_BOTTOM_EMBEDDED		BIT(1)
 #define CCS_PDAF_CAPABILITY_1_PROCESSED_INTERLEAVED		BIT(2)
@@ -940,19 +940,19 @@
 #define CCS_PDAF_CAPABILITY_1_VISIBLE_PDAF_CORRECTION		BIT(5)
 #define CCS_PDAF_CAPABILITY_1_VC_INTERLEAVING			BIT(6)
 #define CCS_PDAF_CAPABILITY_1_DT_INTERLEAVING			BIT(7)
-#define CCS_R_PDAF_CAPABILITY_2					0x1b81
+#define CCS_R_PDAF_CAPABILITY_2					CCI_REG8(0x1b81)
 #define CCS_PDAF_CAPABILITY_2_ROI				BIT(0)
 #define CCS_PDAF_CAPABILITY_2_AFTER_DIGITAL_CROP		BIT(1)
 #define CCS_PDAF_CAPABILITY_2_CTRL_RETIMED			BIT(2)
-#define CCS_R_BRACKETING_LUT_CAPABILITY_1			0x1c00
+#define CCS_R_BRACKETING_LUT_CAPABILITY_1			CCI_REG8(0x1c00)
 #define CCS_BRACKETING_LUT_CAPABILITY_1_COARSE_INTEGRATION	BIT(0)
 #define CCS_BRACKETING_LUT_CAPABILITY_1_GLOBAL_ANALOG_GAIN	BIT(1)
 #define CCS_BRACKETING_LUT_CAPABILITY_1_FLASH			BIT(4)
 #define CCS_BRACKETING_LUT_CAPABILITY_1_GLOBAL_DIGITAL_GAIN	BIT(5)
 #define CCS_BRACKETING_LUT_CAPABILITY_1_ALTERNATE_GLOBAL_ANALOG_GAIN   BIT(6)
-#define CCS_R_BRACKETING_LUT_CAPABILITY_2			0x1c01
+#define CCS_R_BRACKETING_LUT_CAPABILITY_2			CCI_REG8(0x1c01)
 #define CCS_BRACKETING_LUT_CAPABILITY_2_SINGLE_BRACKETING_MODE	BIT(0)
 #define CCS_BRACKETING_LUT_CAPABILITY_2_LOOPED_BRACKETING_MODE	BIT(1)
-#define CCS_R_BRACKETING_LUT_SIZE				0x1c02
+#define CCS_R_BRACKETING_LUT_SIZE				CCI_REG8(0x1c02)
 
 #endif /* __CCS_REGS_H__ */
diff --git a/drivers/media/i2c/ccs/ccs.h b/drivers/media/i2c/ccs/ccs.h
index 2c013d96adcc..096573845a10 100644
--- a/drivers/media/i2c/ccs/ccs.h
+++ b/drivers/media/i2c/ccs/ccs.h
@@ -13,6 +13,7 @@
 #define __CCS_H__
 
 #include <linux/mutex.h>
+#include <linux/regmap.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-subdev.h>
 
@@ -211,6 +212,7 @@ struct ccs_sensor {
 	struct clk *ext_clk;
 	struct gpio_desc *xshutdown;
 	struct gpio_desc *reset;
+	struct regmap *regmap;
 	void *ccs_limits;
 	u8 nbinning_subtypes;
 	struct ccs_binning_subtype binning_subtypes[CCS_LIM_BINNING_SUB_TYPE_MAX_N + 1];
diff --git a/drivers/media/i2c/ccs/smiapp-reg-defs.h b/drivers/media/i2c/ccs/smiapp-reg-defs.h
index 177e3e51207a..ebd0f90e1092 100644
--- a/drivers/media/i2c/ccs/smiapp-reg-defs.h
+++ b/drivers/media/i2c/ccs/smiapp-reg-defs.h
@@ -12,481 +12,484 @@
 #ifndef __SMIAPP_REG_DEFS_H__
 #define __SMIAPP_REG_DEFS_H__
 
+#include <linux/bits.h>
+#include <media/v4l2-cci.h>
+
 /* Register addresses */
-#define SMIAPP_REG_U16_MODEL_ID					(0x0000 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_REVISION_NUMBER_MAJOR			0x0002
-#define SMIAPP_REG_U8_MANUFACTURER_ID				0x0003
-#define SMIAPP_REG_U8_SMIA_VERSION				0x0004
-#define SMIAPP_REG_U8_FRAME_COUNT				0x0005
-#define SMIAPP_REG_U8_PIXEL_ORDER				0x0006
-#define SMIAPP_REG_U16_DATA_PEDESTAL				(0x0008 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_PIXEL_DEPTH				0x000c
-#define SMIAPP_REG_U8_REVISION_NUMBER_MINOR			0x0010
-#define SMIAPP_REG_U8_SMIAPP_VERSION				0x0011
-#define SMIAPP_REG_U8_MODULE_DATE_YEAR				0x0012
-#define SMIAPP_REG_U8_MODULE_DATE_MONTH				0x0013
-#define SMIAPP_REG_U8_MODULE_DATE_DAY				0x0014
-#define SMIAPP_REG_U8_MODULE_DATE_PHASE				0x0015
-#define SMIAPP_REG_U16_SENSOR_MODEL_ID				(0x0016 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_SENSOR_REVISION_NUMBER			0x0018
-#define SMIAPP_REG_U8_SENSOR_MANUFACTURER_ID			0x0019
-#define SMIAPP_REG_U8_SENSOR_FIRMWARE_VERSION			0x001a
-#define SMIAPP_REG_U32_SERIAL_NUMBER				(0x001c | CCS_FL_32BIT)
-#define SMIAPP_REG_U8_FRAME_FORMAT_MODEL_TYPE			0x0040
-#define SMIAPP_REG_U8_FRAME_FORMAT_MODEL_SUBTYPE		0x0041
-#define SMIAPP_REG_U16_FRAME_FORMAT_DESCRIPTOR_2(n)		((0x0042 + ((n) << 1)) | CCS_FL_16BIT) /* 0 <= n <= 14 */
-#define SMIAPP_REG_U32_FRAME_FORMAT_DESCRIPTOR_4(n)		((0x0060 + ((n) << 2)) | CCS_FL_32BIT) /* 0 <= n <= 7 */
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_CAPABILITY			(0x0080 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_MIN			(0x0084 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_MAX			(0x0086 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_STEP			(0x0088 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_TYPE			(0x008a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_M0				(0x008c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_C0				(0x008e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_M1				(0x0090 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_C1				(0x0092 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_DATA_FORMAT_MODEL_TYPE			0x00c0
-#define SMIAPP_REG_U8_DATA_FORMAT_MODEL_SUBTYPE			0x00c1
-#define SMIAPP_REG_U16_DATA_FORMAT_DESCRIPTOR(n)		((0x00c2 + ((n) << 1)) | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_MODE_SELECT				0x0100
-#define SMIAPP_REG_U8_IMAGE_ORIENTATION				0x0101
-#define SMIAPP_REG_U8_SOFTWARE_RESET				0x0103
-#define SMIAPP_REG_U8_GROUPED_PARAMETER_HOLD			0x0104
-#define SMIAPP_REG_U8_MASK_CORRUPTED_FRAMES			0x0105
-#define SMIAPP_REG_U8_FAST_STANDBY_CTRL				0x0106
-#define SMIAPP_REG_U8_CCI_ADDRESS_CONTROL			0x0107
-#define SMIAPP_REG_U8_2ND_CCI_IF_CONTROL			0x0108
-#define SMIAPP_REG_U8_2ND_CCI_ADDRESS_CONTROL			0x0109
-#define SMIAPP_REG_U8_CSI_CHANNEL_IDENTIFIER			0x0110
-#define SMIAPP_REG_U8_CSI_SIGNALLING_MODE			0x0111
-#define SMIAPP_REG_U16_CSI_DATA_FORMAT				(0x0112 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_CSI_LANE_MODE				0x0114
-#define SMIAPP_REG_U8_CSI2_10_TO_8_DT				0x0115
-#define SMIAPP_REG_U8_CSI2_10_TO_7_DT				0x0116
-#define SMIAPP_REG_U8_CSI2_10_TO_6_DT				0x0117
-#define SMIAPP_REG_U8_CSI2_12_TO_8_DT				0x0118
-#define SMIAPP_REG_U8_CSI2_12_TO_7_DT				0x0119
-#define SMIAPP_REG_U8_CSI2_12_TO_6_DT				0x011a
-#define SMIAPP_REG_U8_CSI2_14_TO_10_DT				0x011b
-#define SMIAPP_REG_U8_CSI2_14_TO_8_DT				0x011c
-#define SMIAPP_REG_U8_CSI2_16_TO_10_DT				0x011d
-#define SMIAPP_REG_U8_CSI2_16_TO_8_DT				0x011e
-#define SMIAPP_REG_U8_GAIN_MODE					0x0120
-#define SMIAPP_REG_U16_VANA_VOLTAGE				(0x0130 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_VDIG_VOLTAGE				(0x0132 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_VIO_VOLTAGE				(0x0134 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_EXTCLK_FREQUENCY_MHZ			(0x0136 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_TEMP_SENSOR_CONTROL			0x0138
-#define SMIAPP_REG_U8_TEMP_SENSOR_MODE				0x0139
-#define SMIAPP_REG_U8_TEMP_SENSOR_OUTPUT			0x013a
-#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME			(0x0200 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_COARSE_INTEGRATION_TIME			(0x0202 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_GLOBAL		(0x0204 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_GREENR		(0x0206 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_RED			(0x0208 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_BLUE			(0x020a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_GREENB		(0x020c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_GAIN_GREENR			(0x020e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_GAIN_RED				(0x0210 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_GAIN_BLUE			(0x0212 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_GAIN_GREENB			(0x0214 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_VT_PIX_CLK_DIV				(0x0300 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_VT_SYS_CLK_DIV				(0x0302 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_PRE_PLL_CLK_DIV				(0x0304 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_PLL_MULTIPLIER				(0x0306 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_OP_PIX_CLK_DIV				(0x0308 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_OP_SYS_CLK_DIV				(0x030a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FRAME_LENGTH_LINES			(0x0340 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_LINE_LENGTH_PCK				(0x0342 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_X_ADDR_START				(0x0344 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_Y_ADDR_START				(0x0346 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_X_ADDR_END				(0x0348 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_Y_ADDR_END				(0x034a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_X_OUTPUT_SIZE				(0x034c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_Y_OUTPUT_SIZE				(0x034e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_X_EVEN_INC				(0x0380 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_X_ODD_INC				(0x0382 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_Y_EVEN_INC				(0x0384 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_Y_ODD_INC				(0x0386 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SCALING_MODE				(0x0400 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SPATIAL_SAMPLING				(0x0402 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SCALE_M					(0x0404 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SCALE_N					(0x0406 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_CROP_X_OFFSET			(0x0408 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_CROP_Y_OFFSET			(0x040a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_CROP_IMAGE_WIDTH			(0x040c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_CROP_IMAGE_HEIGHT		(0x040e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_COMPRESSION_MODE				(0x0500 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TEST_PATTERN_MODE			(0x0600 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TEST_DATA_RED				(0x0602 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TEST_DATA_GREENR				(0x0604 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TEST_DATA_BLUE				(0x0606 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TEST_DATA_GREENB				(0x0608 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_HORIZONTAL_CURSOR_WIDTH			(0x060a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_HORIZONTAL_CURSOR_POSITION		(0x060c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_VERTICAL_CURSOR_WIDTH			(0x060e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_VERTICAL_CURSOR_POSITION			(0x0610 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FIFO_WATER_MARK_PIXELS			(0x0700 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_TCLK_POST					0x0800
-#define SMIAPP_REG_U8_THS_PREPARE				0x0801
-#define SMIAPP_REG_U8_THS_ZERO_MIN				0x0802
-#define SMIAPP_REG_U8_THS_TRAIL					0x0803
-#define SMIAPP_REG_U8_TCLK_TRAIL_MIN				0x0804
-#define SMIAPP_REG_U8_TCLK_PREPARE				0x0805
-#define SMIAPP_REG_U8_TCLK_ZERO					0x0806
-#define SMIAPP_REG_U8_TLPX					0x0807
-#define SMIAPP_REG_U8_DPHY_CTRL					0x0808
-#define SMIAPP_REG_U32_REQUESTED_LINK_BIT_RATE_MBPS		(0x0820 | CCS_FL_32BIT)
-#define SMIAPP_REG_U8_BINNING_MODE				0x0900
-#define SMIAPP_REG_U8_BINNING_TYPE				0x0901
-#define SMIAPP_REG_U8_BINNING_WEIGHTING				0x0902
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_CTRL			0x0a00
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_STATUS			0x0a01
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_PAGE_SELECT		0x0a02
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_0			0x0a04
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_1			0x0a05
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_2			0x0a06
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_3			0x0a07
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_4			0x0a08
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_5			0x0a09
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_12		0x0a10
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_13		0x0a11
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_14		0x0a12
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_15		0x0a13
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_16		0x0a14
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_17		0x0a15
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_18		0x0a16
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_19		0x0a17
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_20		0x0a18
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_21		0x0a19
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_22		0x0a1a
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_23		0x0a1b
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_24		0x0a1c
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_25		0x0a1d
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_26		0x0a1e
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_27		0x0a1f
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_28		0x0a20
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_29		0x0a21
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_30		0x0a22
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_31		0x0a23
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_32		0x0a24
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_33		0x0a25
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_34		0x0a26
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_35		0x0a27
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_36		0x0a28
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_37		0x0a29
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_38		0x0a2a
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_39		0x0a2b
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_40		0x0a2c
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_41		0x0a2d
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_42		0x0a2e
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_43		0x0a2f
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_44		0x0a30
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_45		0x0a31
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_46		0x0a32
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_47		0x0a33
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_48		0x0a34
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_49		0x0a35
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_50		0x0a36
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_51		0x0a37
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_52		0x0a38
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_53		0x0a39
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_54		0x0a3a
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_55		0x0a3b
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_56		0x0a3c
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_57		0x0a3d
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_58		0x0a3e
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_59		0x0a3f
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_60		0x0a40
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_61		0x0a41
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_62		0x0a42
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_63		0x0a43
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_CTRL			0x0a44
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_STATUS			0x0a45
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_PAGE_SELECT		0x0a46
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_0			0x0a48
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_1			0x0a49
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_2			0x0a4a
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_3			0x0a4b
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_4			0x0a4c
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_5			0x0a4d
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_6			0x0a4e
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_7			0x0a4f
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_8			0x0a50
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_9			0x0a51
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_10		0x0a52
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_11		0x0a53
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_12		0x0a54
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_13		0x0a55
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_14		0x0a56
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_15		0x0a57
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_16		0x0a58
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_17		0x0a59
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_18		0x0a5a
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_19		0x0a5b
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_20		0x0a5c
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_21		0x0a5d
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_22		0x0a5e
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_23		0x0a5f
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_24		0x0a60
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_25		0x0a61
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_26		0x0a62
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_27		0x0a63
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_28		0x0a64
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_29		0x0a65
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_30		0x0a66
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_31		0x0a67
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_32		0x0a68
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_33		0x0a69
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_34		0x0a6a
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_35		0x0a6b
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_36		0x0a6c
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_37		0x0a6d
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_38		0x0a6e
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_39		0x0a6f
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_40		0x0a70
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_41		0x0a71
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_42		0x0a72
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_43		0x0a73
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_44		0x0a74
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_45		0x0a75
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_46		0x0a76
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_47		0x0a77
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_48		0x0a78
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_49		0x0a79
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_50		0x0a7a
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_51		0x0a7b
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_52		0x0a7c
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_53		0x0a7d
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_54		0x0a7e
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_55		0x0a7f
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_56		0x0a80
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_57		0x0a81
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_58		0x0a82
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_59		0x0a83
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_60		0x0a84
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_61		0x0a85
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_62		0x0a86
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_63		0x0a87
-#define SMIAPP_REG_U8_SHADING_CORRECTION_ENABLE			0x0b00
-#define SMIAPP_REG_U8_LUMINANCE_CORRECTION_LEVEL		0x0b01
-#define SMIAPP_REG_U8_GREEN_IMBALANCE_FILTER_ENABLE		0x0b02
-#define SMIAPP_REG_U8_GREEN_IMBALANCE_FILTER_WEIGHT		0x0b03
-#define SMIAPP_REG_U8_BLACK_LEVEL_CORRECTION_ENABLE		0x0b04
-#define SMIAPP_REG_U8_MAPPED_COUPLET_CORRECT_ENABLE		0x0b05
-#define SMIAPP_REG_U8_SINGLE_DEFECT_CORRECT_ENABLE		0x0b06
-#define SMIAPP_REG_U8_SINGLE_DEFECT_CORRECT_WEIGHT		0x0b07
-#define SMIAPP_REG_U8_DYNAMIC_COUPLET_CORRECT_ENABLE		0x0b08
-#define SMIAPP_REG_U8_DYNAMIC_COUPLET_CORRECT_WEIGHT		0x0b09
-#define SMIAPP_REG_U8_COMBINED_DEFECT_CORRECT_ENABLE		0x0b0a
-#define SMIAPP_REG_U8_COMBINED_DEFECT_CORRECT_WEIGHT		0x0b0b
-#define SMIAPP_REG_U8_MODULE_SPECIFIC_CORRECTION_ENABLE		0x0b0c
-#define SMIAPP_REG_U8_MODULE_SPECIFIC_CORRECTION_WEIGHT		0x0b0d
-#define SMIAPP_REG_U8_MAPPED_LINE_DEFECT_CORRECT_ENABLE		0x0b0e
-#define SMIAPP_REG_U8_MAPPED_LINE_DEFECT_CORRECT_ADJUST		0x0b0f
-#define SMIAPP_REG_U8_MAPPED_COUPLET_CORRECT_ADJUST		0x0b10
-#define SMIAPP_REG_U8_MAPPED_TRIPLET_DEFECT_CORRECT_ENABLE	0x0b11
-#define SMIAPP_REG_U8_MAPPED_TRIPLET_DEFECT_CORRECT_ADJUST	0x0b12
-#define SMIAPP_REG_U8_DYNAMIC_TRIPLET_DEFECT_CORRECT_ENABLE	0x0b13
-#define SMIAPP_REG_U8_DYNAMIC_TRIPLET_DEFECT_CORRECT_ADJUST	0x0b14
-#define SMIAPP_REG_U8_DYNAMIC_LINE_DEFECT_CORRECT_ENABLE	0x0b15
-#define SMIAPP_REG_U8_DYNAMIC_LINE_DEFECT_CORRECT_ADJUST	0x0b16
-#define SMIAPP_REG_U8_EDOF_MODE					0x0b80
-#define SMIAPP_REG_U8_SHARPNESS					0x0b83
-#define SMIAPP_REG_U8_DENOISING					0x0b84
-#define SMIAPP_REG_U8_MODULE_SPECIFIC				0x0b85
-#define SMIAPP_REG_U16_DEPTH_OF_FIELD				(0x0b86 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FOCUS_DISTANCE				(0x0b88 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_ESTIMATION_MODE_CTRL			0x0b8a
-#define SMIAPP_REG_U16_COLOUR_TEMPERATURE			(0x0b8c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ABSOLUTE_GAIN_GREENR			(0x0b8e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ABSOLUTE_GAIN_RED			(0x0b90 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ABSOLUTE_GAIN_BLUE			(0x0b92 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_ABSOLUTE_GAIN_GREENB			(0x0b94 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_ESTIMATION_ZONE_MODE			0x0bc0
-#define SMIAPP_REG_U16_FIXED_ZONE_WEIGHTING			(0x0bc2 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_CUSTOM_ZONE_X_START			(0x0bc4 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_CUSTOM_ZONE_Y_START			(0x0bc6 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_CUSTOM_ZONE_WIDTH			(0x0bc8 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_CUSTOM_ZONE_HEIGHT			(0x0bca | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_GLOBAL_RESET_CTRL1			0x0c00
-#define SMIAPP_REG_U8_GLOBAL_RESET_CTRL2			0x0c01
-#define SMIAPP_REG_U8_GLOBAL_RESET_MODE_CONFIG_1		0x0c02
-#define SMIAPP_REG_U8_GLOBAL_RESET_MODE_CONFIG_2		0x0c03
-#define SMIAPP_REG_U16_TRDY_CTRL				(0x0c04 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TRDOUT_CTRL				(0x0c06 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TSHUTTER_STROBE_DELAY_CTRL		(0x0c08 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TSHUTTER_STROBE_WIDTH_CTRL		(0x0c0a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TFLASH_STROBE_DELAY_CTRL			(0x0c0c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH_HIGH_CTRL		(0x0c0e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TGRST_INTERVAL_CTRL			(0x0c10 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_FLASH_STROBE_ADJUSTMENT			0x0c12
-#define SMIAPP_REG_U16_FLASH_STROBE_START_POINT			(0x0c14 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TFLASH_STROBE_DELAY_RS_CTRL		(0x0c16 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH_HIGH_RS_CTRL		(0x0c18 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_FLASH_MODE_RS				0x0c1a
-#define SMIAPP_REG_U8_FLASH_TRIGGER_RS				0x0c1b
-#define SMIAPP_REG_U8_FLASH_STATUS				0x0c1c
-#define SMIAPP_REG_U8_SA_STROBE_MODE				0x0c1d
-#define SMIAPP_REG_U16_SA_STROBE_START_POINT			(0x0c1e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TSA_STROBE_DELAY_CTRL			(0x0c20 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TSA_STROBE_WIDTH_CTRL			(0x0c22 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_SA_STROBE_TRIGGER				0x0c24
-#define SMIAPP_REG_U8_SPECIAL_ACTUATOR_STATUS			0x0c25
-#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH2_HIGH_RS_CTRL	(0x0c26 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH_LOW_RS_CTRL		(0x0c28 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_TFLASH_STROBE_COUNT_RS_CTRL		0x0c2a
-#define SMIAPP_REG_U8_TFLASH_STROBE_COUNT_CTRL			0x0c2b
-#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH2_HIGH_CTRL		(0x0c2c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH_LOW_CTRL		(0x0c2e | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_LOW_LEVEL_CTRL				0x0c80
-#define SMIAPP_REG_U16_MAIN_TRIGGER_REF_POINT			(0x0c82 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAIN_TRIGGER_T3				(0x0c84 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_MAIN_TRIGGER_COUNT			0x0c86
-#define SMIAPP_REG_U16_PHASE1_TRIGGER_T3			(0x0c88 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_PHASE1_TRIGGER_COUNT			0x0c8a
-#define SMIAPP_REG_U16_PHASE2_TRIGGER_T3			(0x0c8c | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_PHASE2_TRIGGER_COUNT			0x0c8e
-#define SMIAPP_REG_U8_MECH_SHUTTER_CTRL				0x0d00
-#define SMIAPP_REG_U8_OPERATION_MODE				0x0d01
-#define SMIAPP_REG_U8_ACT_STATE1				0x0d02
-#define SMIAPP_REG_U8_ACT_STATE2				0x0d03
-#define SMIAPP_REG_U16_FOCUS_CHANGE				(0x0d80 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FOCUS_CHANGE_CONTROL			(0x0d82 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FOCUS_CHANGE_NUMBER_PHASE1		(0x0d84 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FOCUS_CHANGE_NUMBER_PHASE2		(0x0d86 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_STROBE_COUNT_PHASE1			0x0d88
-#define SMIAPP_REG_U8_STROBE_COUNT_PHASE2			0x0d89
-#define SMIAPP_REG_U8_POSITION					0x0d8a
-#define SMIAPP_REG_U8_BRACKETING_LUT_CONTROL			0x0e00
-#define SMIAPP_REG_U8_BRACKETING_LUT_MODE			0x0e01
-#define SMIAPP_REG_U8_BRACKETING_LUT_ENTRY_CONTROL		0x0e02
-#define SMIAPP_REG_U8_LUT_PARAMETERS_START			0x0e10
-#define SMIAPP_REG_U8_LUT_PARAMETERS_END			0x0eff
-#define SMIAPP_REG_U16_INTEGRATION_TIME_CAPABILITY		(0x1000 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_COARSE_INTEGRATION_TIME_MIN		(0x1004 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_COARSE_INTEGRATION_TIME_MAX_MARGIN	(0x1006 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MIN		(0x1008 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MAX_MARGIN		(0x100a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_GAIN_CAPABILITY			(0x1080 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_GAIN_MIN				(0x1084 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_GAIN_MAX				(0x1086 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DIGITAL_GAIN_STEP_SIZE			(0x1088 | CCS_FL_16BIT)
-#define SMIAPP_REG_F32_MIN_EXT_CLK_FREQ_HZ			(0x1100 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_F32_MAX_EXT_CLK_FREQ_HZ			(0x1104 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_U16_MIN_PRE_PLL_CLK_DIV			(0x1108 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_PRE_PLL_CLK_DIV			(0x110a | CCS_FL_16BIT)
-#define SMIAPP_REG_F32_MIN_PLL_IP_FREQ_HZ			(0x110c | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_F32_MAX_PLL_IP_FREQ_HZ			(0x1110 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_U16_MIN_PLL_MULTIPLIER			(0x1114 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_PLL_MULTIPLIER			(0x1116 | CCS_FL_16BIT)
-#define SMIAPP_REG_F32_MIN_PLL_OP_FREQ_HZ			(0x1118 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_F32_MAX_PLL_OP_FREQ_HZ			(0x111c | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_U16_MIN_VT_SYS_CLK_DIV			(0x1120 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_VT_SYS_CLK_DIV			(0x1122 | CCS_FL_16BIT)
-#define SMIAPP_REG_F32_MIN_VT_SYS_CLK_FREQ_HZ			(0x1124 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_F32_MAX_VT_SYS_CLK_FREQ_HZ			(0x1128 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_F32_MIN_VT_PIX_CLK_FREQ_HZ			(0x112c | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_F32_MAX_VT_PIX_CLK_FREQ_HZ			(0x1130 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_U16_MIN_VT_PIX_CLK_DIV			(0x1134 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_VT_PIX_CLK_DIV			(0x1136 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_FRAME_LENGTH_LINES			(0x1140 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_FRAME_LENGTH_LINES			(0x1142 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_LINE_LENGTH_PCK			(0x1144 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_LINE_LENGTH_PCK			(0x1146 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_LINE_BLANKING_PCK			(0x1148 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_FRAME_BLANKING_LINES			(0x114a | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_MIN_LINE_LENGTH_PCK_STEP_SIZE		0x114c
-#define SMIAPP_REG_U16_MIN_OP_SYS_CLK_DIV			(0x1160 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_OP_SYS_CLK_DIV			(0x1162 | CCS_FL_16BIT)
-#define SMIAPP_REG_F32_MIN_OP_SYS_CLK_FREQ_HZ			(0x1164 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_F32_MAX_OP_SYS_CLK_FREQ_HZ			(0x1168 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_U16_MIN_OP_PIX_CLK_DIV			(0x116c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_OP_PIX_CLK_DIV			(0x116e | CCS_FL_16BIT)
-#define SMIAPP_REG_F32_MIN_OP_PIX_CLK_FREQ_HZ			(0x1170 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_F32_MAX_OP_PIX_CLK_FREQ_HZ			(0x1174 | CCS_FL_FLOAT_IREAL | CCS_FL_32BIT)
-#define SMIAPP_REG_U16_X_ADDR_MIN				(0x1180 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_Y_ADDR_MIN				(0x1182 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_X_ADDR_MAX				(0x1184 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_Y_ADDR_MAX				(0x1186 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_X_OUTPUT_SIZE			(0x1188 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_Y_OUTPUT_SIZE			(0x118a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_X_OUTPUT_SIZE			(0x118c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_Y_OUTPUT_SIZE			(0x118e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_EVEN_INC				(0x11c0 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_EVEN_INC				(0x11c2 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_ODD_INC				(0x11c4 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_ODD_INC				(0x11c6 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SCALING_CAPABILITY			(0x1200 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SCALER_M_MIN				(0x1204 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SCALER_M_MAX				(0x1206 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SCALER_N_MIN				(0x1208 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SCALER_N_MAX				(0x120a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_SPATIAL_SAMPLING_CAPABILITY		(0x120c | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_DIGITAL_CROP_CAPABILITY			0x120e
-#define SMIAPP_REG_U16_COMPRESSION_CAPABILITY			(0x1300 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MATRIX_ELEMENT_REDINRED			(0x1400 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MATRIX_ELEMENT_GREENINRED		(0x1402 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MATRIX_ELEMENT_BLUEINRED			(0x1404 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MATRIX_ELEMENT_REDINGREEN		(0x1406 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MATRIX_ELEMENT_GREENINGREEN		(0x1408 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MATRIX_ELEMENT_BLUEINGREEN		(0x140a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MATRIX_ELEMENT_REDINBLUE			(0x140c | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MATRIX_ELEMENT_GREENINBLUE		(0x140e | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MATRIX_ELEMENT_BLUEINBLUE		(0x1410 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FIFO_SIZE_PIXELS				(0x1500 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_FIFO_SUPPORT_CAPABILITY			0x1502
-#define SMIAPP_REG_U8_DPHY_CTRL_CAPABILITY			0x1600
-#define SMIAPP_REG_U8_CSI_LANE_MODE_CAPABILITY			0x1601
-#define SMIAPP_REG_U8_CSI_SIGNALLING_MODE_CAPABILITY		0x1602
-#define SMIAPP_REG_U8_FAST_STANDBY_CAPABILITY			0x1603
-#define SMIAPP_REG_U8_CCI_ADDRESS_CONTROL_CAPABILITY		0x1604
-#define SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_1_LANE_MODE_MBPS	(0x1608 | CCS_FL_32BIT)
-#define SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_2_LANE_MODE_MBPS	(0x160c | CCS_FL_32BIT)
-#define SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_3_LANE_MODE_MBPS	(0x1610 | CCS_FL_32BIT)
-#define SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_4_LANE_MODE_MBPS	(0x1614 | CCS_FL_32BIT)
-#define SMIAPP_REG_U8_TEMP_SENSOR_CAPABILITY			0x1618
-#define SMIAPP_REG_U16_MIN_FRAME_LENGTH_LINES_BIN		(0x1700 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_FRAME_LENGTH_LINES_BIN		(0x1702 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_LINE_LENGTH_PCK_BIN			(0x1704 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MAX_LINE_LENGTH_PCK_BIN			(0x1706 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_MIN_LINE_BLANKING_PCK_BIN		(0x1708 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MIN_BIN		(0x170a | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN	(0x170c | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_BINNING_CAPABILITY			0x1710
-#define SMIAPP_REG_U8_BINNING_WEIGHTING_CAPABILITY		0x1711
-#define SMIAPP_REG_U8_BINNING_SUBTYPES				0x1712
-#define SMIAPP_REG_U8_BINNING_TYPE_n(n)				(0x1713 + (n)) /* 1 <= n <= 237 */
-#define SMIAPP_REG_U8_DATA_TRANSFER_IF_CAPABILITY		0x1800
-#define SMIAPP_REG_U8_SHADING_CORRECTION_CAPABILITY		0x1900
-#define SMIAPP_REG_U8_GREEN_IMBALANCE_CAPABILITY		0x1901
-#define SMIAPP_REG_U8_BLACK_LEVEL_CAPABILITY			0x1902
-#define SMIAPP_REG_U8_MODULE_SPECIFIC_CORRECTION_CAPABILITY	0x1903
-#define SMIAPP_REG_U16_DEFECT_CORRECTION_CAPABILITY		(0x1904 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_DEFECT_CORRECTION_CAPABILITY_2		(0x1906 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_EDOF_CAPABILITY				0x1980
-#define SMIAPP_REG_U8_ESTIMATION_FRAMES				0x1981
-#define SMIAPP_REG_U8_SUPPORTS_SHARPNESS_ADJ			0x1982
-#define SMIAPP_REG_U8_SUPPORTS_DENOISING_ADJ			0x1983
-#define SMIAPP_REG_U8_SUPPORTS_MODULE_SPECIFIC_ADJ		0x1984
-#define SMIAPP_REG_U8_SUPPORTS_DEPTH_OF_FIELD_ADJ		0x1985
-#define SMIAPP_REG_U8_SUPPORTS_FOCUS_DISTANCE_ADJ		0x1986
-#define SMIAPP_REG_U8_COLOUR_FEEDBACK_CAPABILITY		0x1987
-#define SMIAPP_REG_U8_EDOF_SUPPORT_AB_NXM			0x1988
-#define SMIAPP_REG_U8_ESTIMATION_MODE_CAPABILITY		0x19c0
-#define SMIAPP_REG_U8_ESTIMATION_ZONE_CAPABILITY		0x19c1
-#define SMIAPP_REG_U16_EST_DEPTH_OF_FIELD			(0x19c2 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_EST_FOCUS_DISTANCE			(0x19c4 | CCS_FL_16BIT)
-#define SMIAPP_REG_U16_CAPABILITY_TRDY_MIN			(0x1a00 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_FLASH_MODE_CAPABILITY			0x1a02
-#define SMIAPP_REG_U16_MECH_SHUT_AND_ACT_START_ADDR		(0x1b02 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_ACTUATOR_CAPABILITY			0x1b04
-#define SMIAPP_REG_U16_ACTUATOR_TYPE				(0x1b40 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_AF_DEVICE_ADDRESS				0x1b42
-#define SMIAPP_REG_U16_FOCUS_CHANGE_ADDRESS			(0x1b44 | CCS_FL_16BIT)
-#define SMIAPP_REG_U8_BRACKETING_LUT_CAPABILITY_1		0x1c00
-#define SMIAPP_REG_U8_BRACKETING_LUT_CAPABILITY_2		0x1c01
-#define SMIAPP_REG_U8_BRACKETING_LUT_SIZE			0x1c02
+#define SMIAPP_REG_U16_MODEL_ID					CCI_REG16(0x0000)
+#define SMIAPP_REG_U8_REVISION_NUMBER_MAJOR			CCI_REG8(0x0002)
+#define SMIAPP_REG_U8_MANUFACTURER_ID				CCI_REG8(0x0003)
+#define SMIAPP_REG_U8_SMIA_VERSION				CCI_REG8(0x0004)
+#define SMIAPP_REG_U8_FRAME_COUNT				CCI_REG8(0x0005)
+#define SMIAPP_REG_U8_PIXEL_ORDER				CCI_REG8(0x0006)
+#define SMIAPP_REG_U16_DATA_PEDESTAL				CCI_REG16(0x0008)
+#define SMIAPP_REG_U8_PIXEL_DEPTH				CCI_REG8(0x000c)
+#define SMIAPP_REG_U8_REVISION_NUMBER_MINOR			CCI_REG8(0x0010)
+#define SMIAPP_REG_U8_SMIAPP_VERSION				CCI_REG8(0x0011)
+#define SMIAPP_REG_U8_MODULE_DATE_YEAR				CCI_REG8(0x0012)
+#define SMIAPP_REG_U8_MODULE_DATE_MONTH				CCI_REG8(0x0013)
+#define SMIAPP_REG_U8_MODULE_DATE_DAY				CCI_REG8(0x0014)
+#define SMIAPP_REG_U8_MODULE_DATE_PHASE				CCI_REG8(0x0015)
+#define SMIAPP_REG_U16_SENSOR_MODEL_ID				CCI_REG16(0x0016)
+#define SMIAPP_REG_U8_SENSOR_REVISION_NUMBER			CCI_REG8(0x0018)
+#define SMIAPP_REG_U8_SENSOR_MANUFACTURER_ID			CCI_REG8(0x0019)
+#define SMIAPP_REG_U8_SENSOR_FIRMWARE_VERSION			CCI_REG8(0x001a)
+#define SMIAPP_REG_U32_SERIAL_NUMBER				CCI_REG32(0x001c)
+#define SMIAPP_REG_U8_FRAME_FORMAT_MODEL_TYPE			CCI_REG8(0x0040)
+#define SMIAPP_REG_U8_FRAME_FORMAT_MODEL_SUBTYPE		CCI_REG8(0x0041)
+#define SMIAPP_REG_U16_FRAME_FORMAT_DESCRIPTOR_2(n)		CCI_REG16(0x0042 + ((n) << 1)) /* 0 <= n <= 14 */
+#define SMIAPP_REG_U32_FRAME_FORMAT_DESCRIPTOR_4(n)		CCI_REG32(0x0060 + ((n) << 2)) /* 0 <= n <= 7 */
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_CAPABILITY			CCI_REG16(0x0080)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_MIN			CCI_REG16(0x0084)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_MAX			CCI_REG16(0x0086)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_STEP			CCI_REG16(0x0088)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_TYPE			CCI_REG16(0x008a)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_M0				CCI_REG16(0x008c)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_C0				CCI_REG16(0x008e)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_M1				CCI_REG16(0x0090)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_C1				CCI_REG16(0x0092)
+#define SMIAPP_REG_U8_DATA_FORMAT_MODEL_TYPE			CCI_REG8(0x00c0)
+#define SMIAPP_REG_U8_DATA_FORMAT_MODEL_SUBTYPE			CCI_REG8(0x00c1)
+#define SMIAPP_REG_U16_DATA_FORMAT_DESCRIPTOR(n)		CCI_REG16(0x00c2 + ((n) << 1))
+#define SMIAPP_REG_U8_MODE_SELECT				CCI_REG8(0x0100)
+#define SMIAPP_REG_U8_IMAGE_ORIENTATION				CCI_REG8(0x0101)
+#define SMIAPP_REG_U8_SOFTWARE_RESET				CCI_REG8(0x0103)
+#define SMIAPP_REG_U8_GROUPED_PARAMETER_HOLD			CCI_REG8(0x0104)
+#define SMIAPP_REG_U8_MASK_CORRUPTED_FRAMES			CCI_REG8(0x0105)
+#define SMIAPP_REG_U8_FAST_STANDBY_CTRL				CCI_REG8(0x0106)
+#define SMIAPP_REG_U8_CCI_ADDRESS_CONTROL			CCI_REG8(0x0107)
+#define SMIAPP_REG_U8_2ND_CCI_IF_CONTROL			CCI_REG8(0x0108)
+#define SMIAPP_REG_U8_2ND_CCI_ADDRESS_CONTROL			CCI_REG8(0x0109)
+#define SMIAPP_REG_U8_CSI_CHANNEL_IDENTIFIER			CCI_REG8(0x0110)
+#define SMIAPP_REG_U8_CSI_SIGNALLING_MODE			CCI_REG8(0x0111)
+#define SMIAPP_REG_U16_CSI_DATA_FORMAT				CCI_REG16(0x0112)
+#define SMIAPP_REG_U8_CSI_LANE_MODE				CCI_REG8(0x0114)
+#define SMIAPP_REG_U8_CSI2_10_TO_8_DT				CCI_REG8(0x0115)
+#define SMIAPP_REG_U8_CSI2_10_TO_7_DT				CCI_REG8(0x0116)
+#define SMIAPP_REG_U8_CSI2_10_TO_6_DT				CCI_REG8(0x0117)
+#define SMIAPP_REG_U8_CSI2_12_TO_8_DT				CCI_REG8(0x0118)
+#define SMIAPP_REG_U8_CSI2_12_TO_7_DT				CCI_REG8(0x0119)
+#define SMIAPP_REG_U8_CSI2_12_TO_6_DT				CCI_REG8(0x011a)
+#define SMIAPP_REG_U8_CSI2_14_TO_10_DT				CCI_REG8(0x011b)
+#define SMIAPP_REG_U8_CSI2_14_TO_8_DT				CCI_REG8(0x011c)
+#define SMIAPP_REG_U8_CSI2_16_TO_10_DT				CCI_REG8(0x011d)
+#define SMIAPP_REG_U8_CSI2_16_TO_8_DT				CCI_REG8(0x011e)
+#define SMIAPP_REG_U8_GAIN_MODE					CCI_REG8(0x0120)
+#define SMIAPP_REG_U16_VANA_VOLTAGE				CCI_REG16(0x0130)
+#define SMIAPP_REG_U16_VDIG_VOLTAGE				CCI_REG16(0x0132)
+#define SMIAPP_REG_U16_VIO_VOLTAGE				CCI_REG16(0x0134)
+#define SMIAPP_REG_U16_EXTCLK_FREQUENCY_MHZ			CCI_REG16(0x0136)
+#define SMIAPP_REG_U8_TEMP_SENSOR_CONTROL			CCI_REG8(0x0138)
+#define SMIAPP_REG_U8_TEMP_SENSOR_MODE				CCI_REG8(0x0139)
+#define SMIAPP_REG_U8_TEMP_SENSOR_OUTPUT			CCI_REG8(0x013a)
+#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME			CCI_REG16(0x0200)
+#define SMIAPP_REG_U16_COARSE_INTEGRATION_TIME			CCI_REG16(0x0202)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_GLOBAL		CCI_REG16(0x0204)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_GREENR		CCI_REG16(0x0206)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_RED			CCI_REG16(0x0208)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_BLUE			CCI_REG16(0x020a)
+#define SMIAPP_REG_U16_ANALOGUE_GAIN_CODE_GREENB		CCI_REG16(0x020c)
+#define SMIAPP_REG_U16_DIGITAL_GAIN_GREENR			CCI_REG16(0x020e)
+#define SMIAPP_REG_U16_DIGITAL_GAIN_RED				CCI_REG16(0x0210)
+#define SMIAPP_REG_U16_DIGITAL_GAIN_BLUE			CCI_REG16(0x0212)
+#define SMIAPP_REG_U16_DIGITAL_GAIN_GREENB			CCI_REG16(0x0214)
+#define SMIAPP_REG_U16_VT_PIX_CLK_DIV				CCI_REG16(0x0300)
+#define SMIAPP_REG_U16_VT_SYS_CLK_DIV				CCI_REG16(0x0302)
+#define SMIAPP_REG_U16_PRE_PLL_CLK_DIV				CCI_REG16(0x0304)
+#define SMIAPP_REG_U16_PLL_MULTIPLIER				CCI_REG16(0x0306)
+#define SMIAPP_REG_U16_OP_PIX_CLK_DIV				CCI_REG16(0x0308)
+#define SMIAPP_REG_U16_OP_SYS_CLK_DIV				CCI_REG16(0x030a)
+#define SMIAPP_REG_U16_FRAME_LENGTH_LINES			CCI_REG16(0x0340)
+#define SMIAPP_REG_U16_LINE_LENGTH_PCK				CCI_REG16(0x0342)
+#define SMIAPP_REG_U16_X_ADDR_START				CCI_REG16(0x0344)
+#define SMIAPP_REG_U16_Y_ADDR_START				CCI_REG16(0x0346)
+#define SMIAPP_REG_U16_X_ADDR_END				CCI_REG16(0x0348)
+#define SMIAPP_REG_U16_Y_ADDR_END				CCI_REG16(0x034a)
+#define SMIAPP_REG_U16_X_OUTPUT_SIZE				CCI_REG16(0x034c)
+#define SMIAPP_REG_U16_Y_OUTPUT_SIZE				CCI_REG16(0x034e)
+#define SMIAPP_REG_U16_X_EVEN_INC				CCI_REG16(0x0380)
+#define SMIAPP_REG_U16_X_ODD_INC				CCI_REG16(0x0382)
+#define SMIAPP_REG_U16_Y_EVEN_INC				CCI_REG16(0x0384)
+#define SMIAPP_REG_U16_Y_ODD_INC				CCI_REG16(0x0386)
+#define SMIAPP_REG_U16_SCALING_MODE				CCI_REG16(0x0400)
+#define SMIAPP_REG_U16_SPATIAL_SAMPLING				CCI_REG16(0x0402)
+#define SMIAPP_REG_U16_SCALE_M					CCI_REG16(0x0404)
+#define SMIAPP_REG_U16_SCALE_N					CCI_REG16(0x0406)
+#define SMIAPP_REG_U16_DIGITAL_CROP_X_OFFSET			CCI_REG16(0x0408)
+#define SMIAPP_REG_U16_DIGITAL_CROP_Y_OFFSET			CCI_REG16(0x040a)
+#define SMIAPP_REG_U16_DIGITAL_CROP_IMAGE_WIDTH			CCI_REG16(0x040c)
+#define SMIAPP_REG_U16_DIGITAL_CROP_IMAGE_HEIGHT		CCI_REG16(0x040e)
+#define SMIAPP_REG_U16_COMPRESSION_MODE				CCI_REG16(0x0500)
+#define SMIAPP_REG_U16_TEST_PATTERN_MODE			CCI_REG16(0x0600)
+#define SMIAPP_REG_U16_TEST_DATA_RED				CCI_REG16(0x0602)
+#define SMIAPP_REG_U16_TEST_DATA_GREENR				CCI_REG16(0x0604)
+#define SMIAPP_REG_U16_TEST_DATA_BLUE				CCI_REG16(0x0606)
+#define SMIAPP_REG_U16_TEST_DATA_GREENB				CCI_REG16(0x0608)
+#define SMIAPP_REG_U16_HORIZONTAL_CURSOR_WIDTH			CCI_REG16(0x060a)
+#define SMIAPP_REG_U16_HORIZONTAL_CURSOR_POSITION		CCI_REG16(0x060c)
+#define SMIAPP_REG_U16_VERTICAL_CURSOR_WIDTH			CCI_REG16(0x060e)
+#define SMIAPP_REG_U16_VERTICAL_CURSOR_POSITION			CCI_REG16(0x0610)
+#define SMIAPP_REG_U16_FIFO_WATER_MARK_PIXELS			CCI_REG16(0x0700)
+#define SMIAPP_REG_U8_TCLK_POST					CCI_REG8(0x0800)
+#define SMIAPP_REG_U8_THS_PREPARE				CCI_REG8(0x0801)
+#define SMIAPP_REG_U8_THS_ZERO_MIN				CCI_REG8(0x0802)
+#define SMIAPP_REG_U8_THS_TRAIL					CCI_REG8(0x0803)
+#define SMIAPP_REG_U8_TCLK_TRAIL_MIN				CCI_REG8(0x0804)
+#define SMIAPP_REG_U8_TCLK_PREPARE				CCI_REG8(0x0805)
+#define SMIAPP_REG_U8_TCLK_ZERO					CCI_REG8(0x0806)
+#define SMIAPP_REG_U8_TLPX					CCI_REG8(0x0807)
+#define SMIAPP_REG_U8_DPHY_CTRL					CCI_REG8(0x0808)
+#define SMIAPP_REG_U32_REQUESTED_LINK_BIT_RATE_MBPS		CCI_REG32(0x0820)
+#define SMIAPP_REG_U8_BINNING_MODE				CCI_REG8(0x0900)
+#define SMIAPP_REG_U8_BINNING_TYPE				CCI_REG8(0x0901)
+#define SMIAPP_REG_U8_BINNING_WEIGHTING				CCI_REG8(0x0902)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_CTRL			CCI_REG8(0x0a00)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_STATUS			CCI_REG8(0x0a01)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_PAGE_SELECT		CCI_REG8(0x0a02)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_0			CCI_REG8(0x0a04)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_1			CCI_REG8(0x0a05)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_2			CCI_REG8(0x0a06)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_3			CCI_REG8(0x0a07)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_4			CCI_REG8(0x0a08)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_5			CCI_REG8(0x0a09)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_12		CCI_REG8(0x0a10)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_13		CCI_REG8(0x0a11)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_14		CCI_REG8(0x0a12)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_15		CCI_REG8(0x0a13)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_16		CCI_REG8(0x0a14)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_17		CCI_REG8(0x0a15)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_18		CCI_REG8(0x0a16)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_19		CCI_REG8(0x0a17)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_20		CCI_REG8(0x0a18)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_21		CCI_REG8(0x0a19)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_22		CCI_REG8(0x0a1a)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_23		CCI_REG8(0x0a1b)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_24		CCI_REG8(0x0a1c)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_25		CCI_REG8(0x0a1d)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_26		CCI_REG8(0x0a1e)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_27		CCI_REG8(0x0a1f)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_28		CCI_REG8(0x0a20)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_29		CCI_REG8(0x0a21)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_30		CCI_REG8(0x0a22)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_31		CCI_REG8(0x0a23)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_32		CCI_REG8(0x0a24)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_33		CCI_REG8(0x0a25)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_34		CCI_REG8(0x0a26)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_35		CCI_REG8(0x0a27)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_36		CCI_REG8(0x0a28)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_37		CCI_REG8(0x0a29)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_38		CCI_REG8(0x0a2a)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_39		CCI_REG8(0x0a2b)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_40		CCI_REG8(0x0a2c)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_41		CCI_REG8(0x0a2d)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_42		CCI_REG8(0x0a2e)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_43		CCI_REG8(0x0a2f)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_44		CCI_REG8(0x0a30)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_45		CCI_REG8(0x0a31)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_46		CCI_REG8(0x0a32)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_47		CCI_REG8(0x0a33)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_48		CCI_REG8(0x0a34)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_49		CCI_REG8(0x0a35)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_50		CCI_REG8(0x0a36)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_51		CCI_REG8(0x0a37)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_52		CCI_REG8(0x0a38)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_53		CCI_REG8(0x0a39)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_54		CCI_REG8(0x0a3a)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_55		CCI_REG8(0x0a3b)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_56		CCI_REG8(0x0a3c)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_57		CCI_REG8(0x0a3d)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_58		CCI_REG8(0x0a3e)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_59		CCI_REG8(0x0a3f)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_60		CCI_REG8(0x0a40)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_61		CCI_REG8(0x0a41)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_62		CCI_REG8(0x0a42)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_1_DATA_63		CCI_REG8(0x0a43)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_CTRL			CCI_REG8(0x0a44)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_STATUS			CCI_REG8(0x0a45)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_PAGE_SELECT		CCI_REG8(0x0a46)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_0			CCI_REG8(0x0a48)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_1			CCI_REG8(0x0a49)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_2			CCI_REG8(0x0a4a)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_3			CCI_REG8(0x0a4b)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_4			CCI_REG8(0x0a4c)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_5			CCI_REG8(0x0a4d)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_6			CCI_REG8(0x0a4e)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_7			CCI_REG8(0x0a4f)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_8			CCI_REG8(0x0a50)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_9			CCI_REG8(0x0a51)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_10		CCI_REG8(0x0a52)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_11		CCI_REG8(0x0a53)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_12		CCI_REG8(0x0a54)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_13		CCI_REG8(0x0a55)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_14		CCI_REG8(0x0a56)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_15		CCI_REG8(0x0a57)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_16		CCI_REG8(0x0a58)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_17		CCI_REG8(0x0a59)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_18		CCI_REG8(0x0a5a)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_19		CCI_REG8(0x0a5b)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_20		CCI_REG8(0x0a5c)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_21		CCI_REG8(0x0a5d)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_22		CCI_REG8(0x0a5e)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_23		CCI_REG8(0x0a5f)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_24		CCI_REG8(0x0a60)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_25		CCI_REG8(0x0a61)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_26		CCI_REG8(0x0a62)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_27		CCI_REG8(0x0a63)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_28		CCI_REG8(0x0a64)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_29		CCI_REG8(0x0a65)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_30		CCI_REG8(0x0a66)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_31		CCI_REG8(0x0a67)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_32		CCI_REG8(0x0a68)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_33		CCI_REG8(0x0a69)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_34		CCI_REG8(0x0a6a)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_35		CCI_REG8(0x0a6b)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_36		CCI_REG8(0x0a6c)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_37		CCI_REG8(0x0a6d)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_38		CCI_REG8(0x0a6e)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_39		CCI_REG8(0x0a6f)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_40		CCI_REG8(0x0a70)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_41		CCI_REG8(0x0a71)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_42		CCI_REG8(0x0a72)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_43		CCI_REG8(0x0a73)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_44		CCI_REG8(0x0a74)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_45		CCI_REG8(0x0a75)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_46		CCI_REG8(0x0a76)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_47		CCI_REG8(0x0a77)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_48		CCI_REG8(0x0a78)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_49		CCI_REG8(0x0a79)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_50		CCI_REG8(0x0a7a)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_51		CCI_REG8(0x0a7b)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_52		CCI_REG8(0x0a7c)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_53		CCI_REG8(0x0a7d)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_54		CCI_REG8(0x0a7e)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_55		CCI_REG8(0x0a7f)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_56		CCI_REG8(0x0a80)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_57		CCI_REG8(0x0a81)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_58		CCI_REG8(0x0a82)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_59		CCI_REG8(0x0a83)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_60		CCI_REG8(0x0a84)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_61		CCI_REG8(0x0a85)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_62		CCI_REG8(0x0a86)
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_2_DATA_63		CCI_REG8(0x0a87)
+#define SMIAPP_REG_U8_SHADING_CORRECTION_ENABLE			CCI_REG8(0x0b00)
+#define SMIAPP_REG_U8_LUMINANCE_CORRECTION_LEVEL		CCI_REG8(0x0b01)
+#define SMIAPP_REG_U8_GREEN_IMBALANCE_FILTER_ENABLE		CCI_REG8(0x0b02)
+#define SMIAPP_REG_U8_GREEN_IMBALANCE_FILTER_WEIGHT		CCI_REG8(0x0b03)
+#define SMIAPP_REG_U8_BLACK_LEVEL_CORRECTION_ENABLE		CCI_REG8(0x0b04)
+#define SMIAPP_REG_U8_MAPPED_COUPLET_CORRECT_ENABLE		CCI_REG8(0x0b05)
+#define SMIAPP_REG_U8_SINGLE_DEFECT_CORRECT_ENABLE		CCI_REG8(0x0b06)
+#define SMIAPP_REG_U8_SINGLE_DEFECT_CORRECT_WEIGHT		CCI_REG8(0x0b07)
+#define SMIAPP_REG_U8_DYNAMIC_COUPLET_CORRECT_ENABLE		CCI_REG8(0x0b08)
+#define SMIAPP_REG_U8_DYNAMIC_COUPLET_CORRECT_WEIGHT		CCI_REG8(0x0b09)
+#define SMIAPP_REG_U8_COMBINED_DEFECT_CORRECT_ENABLE		CCI_REG8(0x0b0a)
+#define SMIAPP_REG_U8_COMBINED_DEFECT_CORRECT_WEIGHT		CCI_REG8(0x0b0b)
+#define SMIAPP_REG_U8_MODULE_SPECIFIC_CORRECTION_ENABLE		CCI_REG8(0x0b0c)
+#define SMIAPP_REG_U8_MODULE_SPECIFIC_CORRECTION_WEIGHT		CCI_REG8(0x0b0d)
+#define SMIAPP_REG_U8_MAPPED_LINE_DEFECT_CORRECT_ENABLE		CCI_REG8(0x0b0e)
+#define SMIAPP_REG_U8_MAPPED_LINE_DEFECT_CORRECT_ADJUST		CCI_REG8(0x0b0f)
+#define SMIAPP_REG_U8_MAPPED_COUPLET_CORRECT_ADJUST		CCI_REG8(0x0b10)
+#define SMIAPP_REG_U8_MAPPED_TRIPLET_DEFECT_CORRECT_ENABLE	CCI_REG8(0x0b11)
+#define SMIAPP_REG_U8_MAPPED_TRIPLET_DEFECT_CORRECT_ADJUST	CCI_REG8(0x0b12)
+#define SMIAPP_REG_U8_DYNAMIC_TRIPLET_DEFECT_CORRECT_ENABLE	CCI_REG8(0x0b13)
+#define SMIAPP_REG_U8_DYNAMIC_TRIPLET_DEFECT_CORRECT_ADJUST	CCI_REG8(0x0b14)
+#define SMIAPP_REG_U8_DYNAMIC_LINE_DEFECT_CORRECT_ENABLE	CCI_REG8(0x0b15)
+#define SMIAPP_REG_U8_DYNAMIC_LINE_DEFECT_CORRECT_ADJUST	CCI_REG8(0x0b16)
+#define SMIAPP_REG_U8_EDOF_MODE					CCI_REG8(0x0b80)
+#define SMIAPP_REG_U8_SHARPNESS					CCI_REG8(0x0b83)
+#define SMIAPP_REG_U8_DENOISING					CCI_REG8(0x0b84)
+#define SMIAPP_REG_U8_MODULE_SPECIFIC				CCI_REG8(0x0b85)
+#define SMIAPP_REG_U16_DEPTH_OF_FIELD				CCI_REG16(0x0b86)
+#define SMIAPP_REG_U16_FOCUS_DISTANCE				CCI_REG16(0x0b88)
+#define SMIAPP_REG_U8_ESTIMATION_MODE_CTRL			CCI_REG8(0x0b8a)
+#define SMIAPP_REG_U16_COLOUR_TEMPERATURE			CCI_REG16(0x0b8c)
+#define SMIAPP_REG_U16_ABSOLUTE_GAIN_GREENR			CCI_REG16(0x0b8e)
+#define SMIAPP_REG_U16_ABSOLUTE_GAIN_RED			CCI_REG16(0x0b90)
+#define SMIAPP_REG_U16_ABSOLUTE_GAIN_BLUE			CCI_REG16(0x0b92)
+#define SMIAPP_REG_U16_ABSOLUTE_GAIN_GREENB			CCI_REG16(0x0b94)
+#define SMIAPP_REG_U8_ESTIMATION_ZONE_MODE			CCI_REG8(0x0bc0)
+#define SMIAPP_REG_U16_FIXED_ZONE_WEIGHTING			CCI_REG16(0x0bc2)
+#define SMIAPP_REG_U16_CUSTOM_ZONE_X_START			CCI_REG16(0x0bc4)
+#define SMIAPP_REG_U16_CUSTOM_ZONE_Y_START			CCI_REG16(0x0bc6)
+#define SMIAPP_REG_U16_CUSTOM_ZONE_WIDTH			CCI_REG16(0x0bc8)
+#define SMIAPP_REG_U16_CUSTOM_ZONE_HEIGHT			CCI_REG16(0x0bca)
+#define SMIAPP_REG_U8_GLOBAL_RESET_CTRL1			CCI_REG8(0x0c00)
+#define SMIAPP_REG_U8_GLOBAL_RESET_CTRL2			CCI_REG8(0x0c01)
+#define SMIAPP_REG_U8_GLOBAL_RESET_MODE_CONFIG_1		CCI_REG8(0x0c02)
+#define SMIAPP_REG_U8_GLOBAL_RESET_MODE_CONFIG_2		CCI_REG8(0x0c03)
+#define SMIAPP_REG_U16_TRDY_CTRL				CCI_REG16(0x0c04)
+#define SMIAPP_REG_U16_TRDOUT_CTRL				CCI_REG16(0x0c06)
+#define SMIAPP_REG_U16_TSHUTTER_STROBE_DELAY_CTRL		CCI_REG16(0x0c08)
+#define SMIAPP_REG_U16_TSHUTTER_STROBE_WIDTH_CTRL		CCI_REG16(0x0c0a)
+#define SMIAPP_REG_U16_TFLASH_STROBE_DELAY_CTRL			CCI_REG16(0x0c0c)
+#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH_HIGH_CTRL		CCI_REG16(0x0c0e)
+#define SMIAPP_REG_U16_TGRST_INTERVAL_CTRL			CCI_REG16(0x0c10)
+#define SMIAPP_REG_U8_FLASH_STROBE_ADJUSTMENT			CCI_REG8(0x0c12)
+#define SMIAPP_REG_U16_FLASH_STROBE_START_POINT			CCI_REG16(0x0c14)
+#define SMIAPP_REG_U16_TFLASH_STROBE_DELAY_RS_CTRL		CCI_REG16(0x0c16)
+#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH_HIGH_RS_CTRL		CCI_REG16(0x0c18)
+#define SMIAPP_REG_U8_FLASH_MODE_RS				CCI_REG8(0x0c1a)
+#define SMIAPP_REG_U8_FLASH_TRIGGER_RS				CCI_REG8(0x0c1b)
+#define SMIAPP_REG_U8_FLASH_STATUS				CCI_REG8(0x0c1c)
+#define SMIAPP_REG_U8_SA_STROBE_MODE				CCI_REG8(0x0c1d)
+#define SMIAPP_REG_U16_SA_STROBE_START_POINT			CCI_REG16(0x0c1e)
+#define SMIAPP_REG_U16_TSA_STROBE_DELAY_CTRL			CCI_REG16(0x0c20)
+#define SMIAPP_REG_U16_TSA_STROBE_WIDTH_CTRL			CCI_REG16(0x0c22)
+#define SMIAPP_REG_U8_SA_STROBE_TRIGGER				CCI_REG8(0x0c24)
+#define SMIAPP_REG_U8_SPECIAL_ACTUATOR_STATUS			CCI_REG8(0x0c25)
+#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH2_HIGH_RS_CTRL	CCI_REG16(0x0c26)
+#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH_LOW_RS_CTRL		CCI_REG16(0x0c28)
+#define SMIAPP_REG_U8_TFLASH_STROBE_COUNT_RS_CTRL		CCI_REG8(0x0c2a)
+#define SMIAPP_REG_U8_TFLASH_STROBE_COUNT_CTRL			CCI_REG8(0x0c2b)
+#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH2_HIGH_CTRL		CCI_REG16(0x0c2c)
+#define SMIAPP_REG_U16_TFLASH_STROBE_WIDTH_LOW_CTRL		CCI_REG16(0x0c2e)
+#define SMIAPP_REG_U8_LOW_LEVEL_CTRL				CCI_REG8(0x0c80)
+#define SMIAPP_REG_U16_MAIN_TRIGGER_REF_POINT			CCI_REG16(0x0c82)
+#define SMIAPP_REG_U16_MAIN_TRIGGER_T3				CCI_REG16(0x0c84)
+#define SMIAPP_REG_U8_MAIN_TRIGGER_COUNT			CCI_REG8(0x0c86)
+#define SMIAPP_REG_U16_PHASE1_TRIGGER_T3			CCI_REG16(0x0c88)
+#define SMIAPP_REG_U8_PHASE1_TRIGGER_COUNT			CCI_REG8(0x0c8a)
+#define SMIAPP_REG_U16_PHASE2_TRIGGER_T3			CCI_REG16(0x0c8c)
+#define SMIAPP_REG_U8_PHASE2_TRIGGER_COUNT			CCI_REG8(0x0c8e)
+#define SMIAPP_REG_U8_MECH_SHUTTER_CTRL				CCI_REG8(0x0d00)
+#define SMIAPP_REG_U8_OPERATION_MODE				CCI_REG8(0x0d01)
+#define SMIAPP_REG_U8_ACT_STATE1				CCI_REG8(0x0d02)
+#define SMIAPP_REG_U8_ACT_STATE2				CCI_REG8(0x0d03)
+#define SMIAPP_REG_U16_FOCUS_CHANGE				CCI_REG16(0x0d80)
+#define SMIAPP_REG_U16_FOCUS_CHANGE_CONTROL			CCI_REG16(0x0d82)
+#define SMIAPP_REG_U16_FOCUS_CHANGE_NUMBER_PHASE1		CCI_REG16(0x0d84)
+#define SMIAPP_REG_U16_FOCUS_CHANGE_NUMBER_PHASE2		CCI_REG16(0x0d86)
+#define SMIAPP_REG_U8_STROBE_COUNT_PHASE1			CCI_REG8(0x0d88)
+#define SMIAPP_REG_U8_STROBE_COUNT_PHASE2			CCI_REG8(0x0d89)
+#define SMIAPP_REG_U8_POSITION					CCI_REG8(0x0d8a)
+#define SMIAPP_REG_U8_BRACKETING_LUT_CONTROL			CCI_REG8(0x0e00)
+#define SMIAPP_REG_U8_BRACKETING_LUT_MODE			CCI_REG8(0x0e01)
+#define SMIAPP_REG_U8_BRACKETING_LUT_ENTRY_CONTROL		CCI_REG8(0x0e02)
+#define SMIAPP_REG_U8_LUT_PARAMETERS_START			CCI_REG8(0x0e10)
+#define SMIAPP_REG_U8_LUT_PARAMETERS_END			CCI_REG8(0x0eff)
+#define SMIAPP_REG_U16_INTEGRATION_TIME_CAPABILITY		CCI_REG16(0x1000)
+#define SMIAPP_REG_U16_COARSE_INTEGRATION_TIME_MIN		CCI_REG16(0x1004)
+#define SMIAPP_REG_U16_COARSE_INTEGRATION_TIME_MAX_MARGIN	CCI_REG16(0x1006)
+#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MIN		CCI_REG16(0x1008)
+#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MAX_MARGIN		CCI_REG16(0x100a)
+#define SMIAPP_REG_U16_DIGITAL_GAIN_CAPABILITY			CCI_REG16(0x1080)
+#define SMIAPP_REG_U16_DIGITAL_GAIN_MIN				CCI_REG16(0x1084)
+#define SMIAPP_REG_U16_DIGITAL_GAIN_MAX				CCI_REG16(0x1086)
+#define SMIAPP_REG_U16_DIGITAL_GAIN_STEP_SIZE			CCI_REG16(0x1088)
+#define SMIAPP_REG_F32_MIN_EXT_CLK_FREQ_HZ			(CCI_REG32(0x1100) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_F32_MAX_EXT_CLK_FREQ_HZ			(CCI_REG32(0x1104) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_U16_MIN_PRE_PLL_CLK_DIV			CCI_REG16(0x1108)
+#define SMIAPP_REG_U16_MAX_PRE_PLL_CLK_DIV			CCI_REG16(0x110a)
+#define SMIAPP_REG_F32_MIN_PLL_IP_FREQ_HZ			(CCI_REG32(0x110c) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_F32_MAX_PLL_IP_FREQ_HZ			(CCI_REG32(0x1110) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_U16_MIN_PLL_MULTIPLIER			CCI_REG16(0x1114)
+#define SMIAPP_REG_U16_MAX_PLL_MULTIPLIER			CCI_REG16(0x1116)
+#define SMIAPP_REG_F32_MIN_PLL_OP_FREQ_HZ			(CCI_REG32(0x1118) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_F32_MAX_PLL_OP_FREQ_HZ			(CCI_REG32(0x111c) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_U16_MIN_VT_SYS_CLK_DIV			CCI_REG16(0x1120)
+#define SMIAPP_REG_U16_MAX_VT_SYS_CLK_DIV			CCI_REG16(0x1122)
+#define SMIAPP_REG_F32_MIN_VT_SYS_CLK_FREQ_HZ			(CCI_REG32(0x1124) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_F32_MAX_VT_SYS_CLK_FREQ_HZ			(CCI_REG32(0x1128) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_F32_MIN_VT_PIX_CLK_FREQ_HZ			(CCI_REG32(0x112c) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_F32_MAX_VT_PIX_CLK_FREQ_HZ			(CCI_REG32(0x1130) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_U16_MIN_VT_PIX_CLK_DIV			CCI_REG16(0x1134)
+#define SMIAPP_REG_U16_MAX_VT_PIX_CLK_DIV			CCI_REG16(0x1136)
+#define SMIAPP_REG_U16_MIN_FRAME_LENGTH_LINES			CCI_REG16(0x1140)
+#define SMIAPP_REG_U16_MAX_FRAME_LENGTH_LINES			CCI_REG16(0x1142)
+#define SMIAPP_REG_U16_MIN_LINE_LENGTH_PCK			CCI_REG16(0x1144)
+#define SMIAPP_REG_U16_MAX_LINE_LENGTH_PCK			CCI_REG16(0x1146)
+#define SMIAPP_REG_U16_MIN_LINE_BLANKING_PCK			CCI_REG16(0x1148)
+#define SMIAPP_REG_U16_MIN_FRAME_BLANKING_LINES			CCI_REG16(0x114a)
+#define SMIAPP_REG_U8_MIN_LINE_LENGTH_PCK_STEP_SIZE		CCI_REG8(0x114c)
+#define SMIAPP_REG_U16_MIN_OP_SYS_CLK_DIV			CCI_REG16(0x1160)
+#define SMIAPP_REG_U16_MAX_OP_SYS_CLK_DIV			CCI_REG16(0x1162)
+#define SMIAPP_REG_F32_MIN_OP_SYS_CLK_FREQ_HZ			(CCI_REG32(0x1164) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_F32_MAX_OP_SYS_CLK_FREQ_HZ			(CCI_REG32(0x1168) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_U16_MIN_OP_PIX_CLK_DIV			CCI_REG16(0x116c)
+#define SMIAPP_REG_U16_MAX_OP_PIX_CLK_DIV			CCI_REG16(0x116e)
+#define SMIAPP_REG_F32_MIN_OP_PIX_CLK_FREQ_HZ			(CCI_REG32(0x1170) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_F32_MAX_OP_PIX_CLK_FREQ_HZ			(CCI_REG32(0x1174) | CCS_FL_FLOAT_IREAL)
+#define SMIAPP_REG_U16_X_ADDR_MIN				CCI_REG16(0x1180)
+#define SMIAPP_REG_U16_Y_ADDR_MIN				CCI_REG16(0x1182)
+#define SMIAPP_REG_U16_X_ADDR_MAX				CCI_REG16(0x1184)
+#define SMIAPP_REG_U16_Y_ADDR_MAX				CCI_REG16(0x1186)
+#define SMIAPP_REG_U16_MIN_X_OUTPUT_SIZE			CCI_REG16(0x1188)
+#define SMIAPP_REG_U16_MIN_Y_OUTPUT_SIZE			CCI_REG16(0x118a)
+#define SMIAPP_REG_U16_MAX_X_OUTPUT_SIZE			CCI_REG16(0x118c)
+#define SMIAPP_REG_U16_MAX_Y_OUTPUT_SIZE			CCI_REG16(0x118e)
+#define SMIAPP_REG_U16_MIN_EVEN_INC				CCI_REG16(0x11c0)
+#define SMIAPP_REG_U16_MAX_EVEN_INC				CCI_REG16(0x11c2)
+#define SMIAPP_REG_U16_MIN_ODD_INC				CCI_REG16(0x11c4)
+#define SMIAPP_REG_U16_MAX_ODD_INC				CCI_REG16(0x11c6)
+#define SMIAPP_REG_U16_SCALING_CAPABILITY			CCI_REG16(0x1200)
+#define SMIAPP_REG_U16_SCALER_M_MIN				CCI_REG16(0x1204)
+#define SMIAPP_REG_U16_SCALER_M_MAX				CCI_REG16(0x1206)
+#define SMIAPP_REG_U16_SCALER_N_MIN				CCI_REG16(0x1208)
+#define SMIAPP_REG_U16_SCALER_N_MAX				CCI_REG16(0x120a)
+#define SMIAPP_REG_U16_SPATIAL_SAMPLING_CAPABILITY		CCI_REG16(0x120c)
+#define SMIAPP_REG_U8_DIGITAL_CROP_CAPABILITY			CCI_REG8(0x120e)
+#define SMIAPP_REG_U16_COMPRESSION_CAPABILITY			CCI_REG16(0x1300)
+#define SMIAPP_REG_U16_MATRIX_ELEMENT_REDINRED			CCI_REG16(0x1400)
+#define SMIAPP_REG_U16_MATRIX_ELEMENT_GREENINRED		CCI_REG16(0x1402)
+#define SMIAPP_REG_U16_MATRIX_ELEMENT_BLUEINRED			CCI_REG16(0x1404)
+#define SMIAPP_REG_U16_MATRIX_ELEMENT_REDINGREEN		CCI_REG16(0x1406)
+#define SMIAPP_REG_U16_MATRIX_ELEMENT_GREENINGREEN		CCI_REG16(0x1408)
+#define SMIAPP_REG_U16_MATRIX_ELEMENT_BLUEINGREEN		CCI_REG16(0x140a)
+#define SMIAPP_REG_U16_MATRIX_ELEMENT_REDINBLUE			CCI_REG16(0x140c)
+#define SMIAPP_REG_U16_MATRIX_ELEMENT_GREENINBLUE		CCI_REG16(0x140e)
+#define SMIAPP_REG_U16_MATRIX_ELEMENT_BLUEINBLUE		CCI_REG16(0x1410)
+#define SMIAPP_REG_U16_FIFO_SIZE_PIXELS				CCI_REG16(0x1500)
+#define SMIAPP_REG_U8_FIFO_SUPPORT_CAPABILITY			CCI_REG8(0x1502)
+#define SMIAPP_REG_U8_DPHY_CTRL_CAPABILITY			CCI_REG8(0x1600)
+#define SMIAPP_REG_U8_CSI_LANE_MODE_CAPABILITY			CCI_REG8(0x1601)
+#define SMIAPP_REG_U8_CSI_SIGNALLING_MODE_CAPABILITY		CCI_REG8(0x1602)
+#define SMIAPP_REG_U8_FAST_STANDBY_CAPABILITY			CCI_REG8(0x1603)
+#define SMIAPP_REG_U8_CCI_ADDRESS_CONTROL_CAPABILITY		CCI_REG8(0x1604)
+#define SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_1_LANE_MODE_MBPS	CCI_REG32(0x1608)
+#define SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_2_LANE_MODE_MBPS	CCI_REG32(0x160c)
+#define SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_3_LANE_MODE_MBPS	CCI_REG32(0x1610)
+#define SMIAPP_REG_U32_MAX_PER_LANE_BITRATE_4_LANE_MODE_MBPS	CCI_REG32(0x1614)
+#define SMIAPP_REG_U8_TEMP_SENSOR_CAPABILITY			CCI_REG8(0x1618)
+#define SMIAPP_REG_U16_MIN_FRAME_LENGTH_LINES_BIN		CCI_REG16(0x1700)
+#define SMIAPP_REG_U16_MAX_FRAME_LENGTH_LINES_BIN		CCI_REG16(0x1702)
+#define SMIAPP_REG_U16_MIN_LINE_LENGTH_PCK_BIN			CCI_REG16(0x1704)
+#define SMIAPP_REG_U16_MAX_LINE_LENGTH_PCK_BIN			CCI_REG16(0x1706)
+#define SMIAPP_REG_U16_MIN_LINE_BLANKING_PCK_BIN		CCI_REG16(0x1708)
+#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MIN_BIN		CCI_REG16(0x170a)
+#define SMIAPP_REG_U16_FINE_INTEGRATION_TIME_MAX_MARGIN_BIN	CCI_REG16(0x170c)
+#define SMIAPP_REG_U8_BINNING_CAPABILITY			CCI_REG8(0x1710)
+#define SMIAPP_REG_U8_BINNING_WEIGHTING_CAPABILITY		CCI_REG8(0x1711)
+#define SMIAPP_REG_U8_BINNING_SUBTYPES				CCI_REG8(0x1712)
+#define SMIAPP_REG_U8_BINNING_TYPE_n(n)				CCI_REG8(0x1713 + (n)) /* 1 <= n <= 237 */
+#define SMIAPP_REG_U8_DATA_TRANSFER_IF_CAPABILITY		CCI_REG8(0x1800)
+#define SMIAPP_REG_U8_SHADING_CORRECTION_CAPABILITY		CCI_REG8(0x1900)
+#define SMIAPP_REG_U8_GREEN_IMBALANCE_CAPABILITY		CCI_REG8(0x1901)
+#define SMIAPP_REG_U8_BLACK_LEVEL_CAPABILITY			CCI_REG8(0x1902)
+#define SMIAPP_REG_U8_MODULE_SPECIFIC_CORRECTION_CAPABILITY	CCI_REG8(0x1903)
+#define SMIAPP_REG_U16_DEFECT_CORRECTION_CAPABILITY		CCI_REG16(0x1904)
+#define SMIAPP_REG_U16_DEFECT_CORRECTION_CAPABILITY_2		CCI_REG16(0x1906)
+#define SMIAPP_REG_U8_EDOF_CAPABILITY				CCI_REG8(0x1980)
+#define SMIAPP_REG_U8_ESTIMATION_FRAMES				CCI_REG8(0x1981)
+#define SMIAPP_REG_U8_SUPPORTS_SHARPNESS_ADJ			CCI_REG8(0x1982)
+#define SMIAPP_REG_U8_SUPPORTS_DENOISING_ADJ			CCI_REG8(0x1983)
+#define SMIAPP_REG_U8_SUPPORTS_MODULE_SPECIFIC_ADJ		CCI_REG8(0x1984)
+#define SMIAPP_REG_U8_SUPPORTS_DEPTH_OF_FIELD_ADJ		CCI_REG8(0x1985)
+#define SMIAPP_REG_U8_SUPPORTS_FOCUS_DISTANCE_ADJ		CCI_REG8(0x1986)
+#define SMIAPP_REG_U8_COLOUR_FEEDBACK_CAPABILITY		CCI_REG8(0x1987)
+#define SMIAPP_REG_U8_EDOF_SUPPORT_AB_NXM			CCI_REG8(0x1988)
+#define SMIAPP_REG_U8_ESTIMATION_MODE_CAPABILITY		CCI_REG8(0x19c0)
+#define SMIAPP_REG_U8_ESTIMATION_ZONE_CAPABILITY		CCI_REG8(0x19c1)
+#define SMIAPP_REG_U16_EST_DEPTH_OF_FIELD			CCI_REG16(0x19c2)
+#define SMIAPP_REG_U16_EST_FOCUS_DISTANCE			CCI_REG16(0x19c4)
+#define SMIAPP_REG_U16_CAPABILITY_TRDY_MIN			CCI_REG16(0x1a00)
+#define SMIAPP_REG_U8_FLASH_MODE_CAPABILITY			CCI_REG8(0x1a02)
+#define SMIAPP_REG_U16_MECH_SHUT_AND_ACT_START_ADDR		CCI_REG16(0x1b02)
+#define SMIAPP_REG_U8_ACTUATOR_CAPABILITY			CCI_REG8(0x1b04)
+#define SMIAPP_REG_U16_ACTUATOR_TYPE				CCI_REG16(0x1b40)
+#define SMIAPP_REG_U8_AF_DEVICE_ADDRESS				CCI_REG8(0x1b42)
+#define SMIAPP_REG_U16_FOCUS_CHANGE_ADDRESS			CCI_REG16(0x1b44)
+#define SMIAPP_REG_U8_BRACKETING_LUT_CAPABILITY_1		CCI_REG8(0x1c00)
+#define SMIAPP_REG_U8_BRACKETING_LUT_CAPABILITY_2		CCI_REG8(0x1c01)
+#define SMIAPP_REG_U8_BRACKETING_LUT_SIZE			CCI_REG8(0x1c02)
 
 /* Register bit definitions */
 #define SMIAPP_IMAGE_ORIENTATION_HFLIP			BIT(0)
-- 
2.39.2


