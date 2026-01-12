Return-Path: <linux-media+bounces-50421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAB2D11AC0
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 936BF3047AFA
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 10:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CBF283686;
	Mon, 12 Jan 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHht1FmC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2F283FC3
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212014; cv=none; b=LoAliJhxkdAp51vYeatRqddQQdz0s1fLICGYy7s2XjuJNzM5nLkDHnknS9QoFR2bY3fcH8RXasA7kj2GEsmZU83Hm7hRUrX6Ji31OByNbNhXS+/qAG+kcasDhgJd50HNIWHYsZfir0gsQxyDweKp0sjWaGsGKYOEJpvJ3KmqvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212014; c=relaxed/simple;
	bh=YRvXRBHW/EIHSU8EmTXxcMXSHchp3fWLQJOMgFai0LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0xw70v2U0sI7b+e5NRasM93Ku/GhG6/Ypiwa39sqH15qSc4lFjzzW1cYIOaTmUGwPeFZn3MH8h8FzZFj32i11QEwsWN/JNjS5eoqQh0dUvVZ2fr0yJIAMM9mhwZRzCvHNWEQAhC5fdx+WX2Z9ZynHkYTQFz4YTltQESISNaleU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHht1FmC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212011; x=1799748011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YRvXRBHW/EIHSU8EmTXxcMXSHchp3fWLQJOMgFai0LM=;
  b=VHht1FmCdvIbX53VxzF8E6353Amy0RUpOcBzR46KHFcxIP3dGm3IR2ep
   rbZ2+i1QMl0H5F7mBn6KhHozTyBBELQ5HTyjmkm0BZJD9yCRSfUVtlpra
   3QygGKQp0AbtxLpidLUEwB1JYFexEQ5iEv8GywaWvoei1GUNsipRin9K/
   44Y3cVTdLMdrHR4ACFBCIPvfrDRGc5Auer2XJ3F6rQVkZ0CDGnp3RVRhg
   XKN8gFFsy3m3P1hsdB8DBhEo6QNW3tOf/do+yrrL2QsJOf9gU/a1bk2XI
   IqPOsskYFSmaovCsPMdOF25TZbKhC3iJceLh1VuFBCFEY4nlRj5WvoVwA
   w==;
X-CSE-ConnectionGUID: sFRtkpRLRRqHqTzkxmHykA==
X-CSE-MsgGUID: yqSLQbIYQu6UmZ4bOEPjbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218801"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:58 -0800
X-CSE-ConnectionGUID: 20TSSbRISGekuG0o/axmOA==
X-CSE-MsgGUID: b3NypfAvSqmwTP1s5ZAWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743142"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:56 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 36054121F82;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000011c-0Kql;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 08/23] media: i2c: ov01a10: Convert to new CCI register access helpers
Date: Mon, 12 Jan 2026 11:59:34 +0200
Message-ID: <20260112095949.3851-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

Use the new comon CCI register access helpers to replace the private
register access helpers in the ov01a10 driver.

Signed-off-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/Kconfig   |   1 +
 drivers/media/i2c/ov01a10.c | 219 ++++++++++--------------------------
 2 files changed, 59 insertions(+), 161 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4b4db8c4f496..42be3a5f36f6 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -373,6 +373,7 @@ config VIDEO_OG0VE1B
 
 config VIDEO_OV01A10
 	tristate "OmniVision OV01A10 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV01A10 camera.
diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 4f04bb8688b8..34b7ab6eb286 100644
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
 #define OV01A10_ANAL_GAIN_MAX		0x3fff
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
@@ -282,6 +279,7 @@ static const struct ov01a10_mode supported_modes[] = {
 };
 
 struct ov01a10 {
+	struct regmap *regmap;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -301,104 +299,15 @@ static inline struct ov01a10 *to_ov01a10(struct v4l2_subdev *subdev)
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
@@ -408,48 +317,39 @@ static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 	if (pattern)
 		pattern |= OV01A10_TEST_PATTERN_ENABLE;
 
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
-
-	ret = ov01a10_read_reg(ov01a10, OV01A10_REG_FORMAT1, 1, &val);
-	if (ret)
-		return ret;
+	val = vflip ? FIELD_PREP(OV01A10_VFLIP_MASK, 0x1) : 0;
 
-	val = vflip ? val | FIELD_PREP(OV01A10_VFLIP_MASK, 0x1) :
-		val & ~OV01A10_VFLIP_MASK;
+	cci_write(ov01a10->regmap, OV01A10_REG_Y_WIN, offset, &ret);
+	cci_update_bits(ov01a10->regmap, OV01A10_REG_FORMAT1,
+			OV01A10_VFLIP_MASK, val, &ret);
 
-	return ov01a10_write_reg(ov01a10, OV01A10_REG_FORMAT1, 1, val);
+	return ret;
 }
 
 static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
@@ -474,8 +374,8 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
-		ret = ov01a10_write_reg(ov01a10, OV01A10_REG_ANALOG_GAIN, 2,
-					ctrl->val);
+		ret = cci_write(ov01a10->regmap, OV01A10_REG_ANALOG_GAIN,
+				ctrl->val, NULL);
 		break;
 
 	case V4L2_CID_DIGITAL_GAIN:
@@ -483,13 +383,13 @@ static int ov01a10_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -630,14 +530,16 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
 
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
@@ -647,23 +549,14 @@ static int ov01a10_start_streaming(struct ov01a10 *ov01a10)
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
@@ -841,14 +734,14 @@ static int ov01a10_identify_module(struct ov01a10 *ov01a10)
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
@@ -879,6 +772,10 @@ static int ov01a10_probe(struct i2c_client *client)
 	if (!ov01a10)
 		return -ENOMEM;
 
+	ov01a10->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov01a10->regmap))
+		return PTR_ERR(ov01a10->regmap);
+
 	v4l2_i2c_subdev_init(&ov01a10->sd, client, &ov01a10_subdev_ops);
 	ov01a10->sd.internal_ops = &ov01a10_internal_ops;
 
-- 
2.47.3


