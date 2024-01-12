Return-Path: <linux-media+bounces-3638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5186682BDED
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 10:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2101F274B6
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 09:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670915DF08;
	Fri, 12 Jan 2024 09:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="O1Xu3hAZ"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9C5DF11
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 09:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705053199;
	bh=/CpekKJSvkxSKBUtWlOL81WOubM11/+nVhB1zMjAvrM=;
	h=From:To:Cc:Subject:Date:From;
	b=O1Xu3hAZixUBxn6O0J0SUDgX+wbtsVDqvb0v+yOtRDActwNMjNaNO3v1uFTsQtsLn
	 APTRTjx4Pki2/uvsYhLFGYhVfbMBLPHttINl/YANExVnQwzoLmIcmO9vL9KjX3qWRW
	 4RGazuWWtlKYeGjsWnPq0zHhXOFAyJZKhl1KHXZuNIEvg0xP0UOjSrY1g4WwgV1fhH
	 skUUvD9Y+c+RzoQweMMnLdT1ECkwelur/ptUIhc7eC1tWnkBSnIA05iC1p7QkGn9HB
	 fYIF+HP/cVtTliseDDZe9W2y9xvCz5b7icgQMfj9OXnhrVAYTo9lDXWEXMvd4EvJeO
	 JilwvkS/W7YEQ==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1574E3781FCF;
	Fri, 12 Jan 2024 09:53:19 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH] media: i2c: st-vgxy61: Convert to CCI register access helpers
Date: Fri, 12 Jan 2024 10:52:28 +0100
Message-ID: <20240112095228.2842812-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the new common CCI register access helpers to replace the private
register access helpers in the st-vgxy61 driver. This simplifies the
driver by reducing the amount of code.

st-vgxy61 devices use little endianness arrangement, therefore
the driver uses the CCI_REGx_LE registers definition.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 drivers/media/i2c/Kconfig     |   1 +
 drivers/media/i2c/st-vgxy61.c | 390 +++++++++++++---------------------
 2 files changed, 154 insertions(+), 237 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index d0dfab513154..3961510fcf79 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -658,6 +658,7 @@ config VIDEO_S5K6A3
 
 config VIDEO_ST_VGXY61
 	tristate "ST VGXY61 sensor support"
+	select V4L2_CCI_I2C
 	depends on OF && GPIOLIB
 	help
 	  This is a Video4Linux2 sensor driver for the ST VGXY61
diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index e4d37a197724..2d64466d7ecf 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -12,6 +12,7 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/units.h>
 
@@ -19,79 +20,74 @@
 
 #include <media/mipi-csi2.h>
 #include <media/v4l2-async.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
-#define VGXY61_REG_8BIT(n)				((1 << 16) | (n))
-#define VGXY61_REG_16BIT(n)				((2 << 16) | (n))
-#define VGXY61_REG_32BIT(n)				((4 << 16) | (n))
-#define VGXY61_REG_SIZE_SHIFT				16
-#define VGXY61_REG_ADDR_MASK				0xffff
-
-#define VGXY61_REG_MODEL_ID				VGXY61_REG_16BIT(0x0000)
+#define VGXY61_REG_MODEL_ID				CCI_REG16_LE(0x0000)
 #define VG5661_MODEL_ID					0x5661
 #define VG5761_MODEL_ID					0x5761
-#define VGXY61_REG_REVISION				VGXY61_REG_16BIT(0x0002)
-#define VGXY61_REG_FWPATCH_REVISION			VGXY61_REG_16BIT(0x0014)
-#define VGXY61_REG_FWPATCH_START_ADDR			VGXY61_REG_8BIT(0x2000)
-#define VGXY61_REG_SYSTEM_FSM				VGXY61_REG_8BIT(0x0020)
+#define VGXY61_REG_REVISION				CCI_REG16_LE(0x0002)
+#define VGXY61_REG_FWPATCH_REVISION			CCI_REG16_LE(0x0014)
+#define VGXY61_REG_FWPATCH_START_ADDR			CCI_REG8(0x2000)
+#define VGXY61_REG_SYSTEM_FSM				CCI_REG8(0x0020)
 #define VGXY61_SYSTEM_FSM_SW_STBY			0x03
 #define VGXY61_SYSTEM_FSM_STREAMING			0x04
-#define VGXY61_REG_NVM					VGXY61_REG_8BIT(0x0023)
+#define VGXY61_REG_NVM					CCI_REG8(0x0023)
 #define VGXY61_NVM_OK					0x04
-#define VGXY61_REG_STBY					VGXY61_REG_8BIT(0x0201)
+#define VGXY61_REG_STBY					CCI_REG8(0x0201)
 #define VGXY61_STBY_NO_REQ				0
 #define VGXY61_STBY_REQ_TMP_READ			BIT(2)
-#define VGXY61_REG_STREAMING				VGXY61_REG_8BIT(0x0202)
+#define VGXY61_REG_STREAMING				CCI_REG8(0x0202)
 #define VGXY61_STREAMING_NO_REQ				0
 #define VGXY61_STREAMING_REQ_STOP			BIT(0)
 #define VGXY61_STREAMING_REQ_START			BIT(1)
-#define VGXY61_REG_EXT_CLOCK				VGXY61_REG_32BIT(0x0220)
-#define VGXY61_REG_CLK_PLL_PREDIV			VGXY61_REG_8BIT(0x0224)
-#define VGXY61_REG_CLK_SYS_PLL_MULT			VGXY61_REG_8BIT(0x0225)
-#define VGXY61_REG_GPIO_0_CTRL				VGXY61_REG_8BIT(0x0236)
-#define VGXY61_REG_GPIO_1_CTRL				VGXY61_REG_8BIT(0x0237)
-#define VGXY61_REG_GPIO_2_CTRL				VGXY61_REG_8BIT(0x0238)
-#define VGXY61_REG_GPIO_3_CTRL				VGXY61_REG_8BIT(0x0239)
-#define VGXY61_REG_SIGNALS_POLARITY_CTRL		VGXY61_REG_8BIT(0x023b)
-#define VGXY61_REG_LINE_LENGTH				VGXY61_REG_16BIT(0x0300)
-#define VGXY61_REG_ORIENTATION				VGXY61_REG_8BIT(0x0302)
-#define VGXY61_REG_VT_CTRL				VGXY61_REG_8BIT(0x0304)
-#define VGXY61_REG_FORMAT_CTRL				VGXY61_REG_8BIT(0x0305)
-#define VGXY61_REG_OIF_CTRL				VGXY61_REG_16BIT(0x0306)
-#define VGXY61_REG_OIF_ROI0_CTRL			VGXY61_REG_8BIT(0x030a)
-#define VGXY61_REG_ROI0_START_H				VGXY61_REG_16BIT(0x0400)
-#define VGXY61_REG_ROI0_START_V				VGXY61_REG_16BIT(0x0402)
-#define VGXY61_REG_ROI0_END_H				VGXY61_REG_16BIT(0x0404)
-#define VGXY61_REG_ROI0_END_V				VGXY61_REG_16BIT(0x0406)
-#define VGXY61_REG_PATGEN_CTRL				VGXY61_REG_32BIT(0x0440)
+#define VGXY61_REG_EXT_CLOCK				CCI_REG32_LE(0x0220)
+#define VGXY61_REG_CLK_PLL_PREDIV			CCI_REG8(0x0224)
+#define VGXY61_REG_CLK_SYS_PLL_MULT			CCI_REG8(0x0225)
+#define VGXY61_REG_GPIO_0_CTRL				CCI_REG8(0x0236)
+#define VGXY61_REG_GPIO_1_CTRL				CCI_REG8(0x0237)
+#define VGXY61_REG_GPIO_2_CTRL				CCI_REG8(0x0238)
+#define VGXY61_REG_GPIO_3_CTRL				CCI_REG8(0x0239)
+#define VGXY61_REG_SIGNALS_POLARITY_CTRL		CCI_REG8(0x023b)
+#define VGXY61_REG_LINE_LENGTH				CCI_REG16_LE(0x0300)
+#define VGXY61_REG_ORIENTATION				CCI_REG8(0x0302)
+#define VGXY61_REG_VT_CTRL				CCI_REG8(0x0304)
+#define VGXY61_REG_FORMAT_CTRL				CCI_REG8(0x0305)
+#define VGXY61_REG_OIF_CTRL				CCI_REG16_LE(0x0306)
+#define VGXY61_REG_OIF_ROI0_CTRL			CCI_REG8(0x030a)
+#define VGXY61_REG_ROI0_START_H				CCI_REG16_LE(0x0400)
+#define VGXY61_REG_ROI0_START_V				CCI_REG16_LE(0x0402)
+#define VGXY61_REG_ROI0_END_H				CCI_REG16_LE(0x0404)
+#define VGXY61_REG_ROI0_END_V				CCI_REG16_LE(0x0406)
+#define VGXY61_REG_PATGEN_CTRL				CCI_REG32_LE(0x0440)
 #define VGXY61_PATGEN_LONG_ENABLE			BIT(16)
 #define VGXY61_PATGEN_SHORT_ENABLE			BIT(0)
 #define VGXY61_PATGEN_LONG_TYPE_SHIFT			18
 #define VGXY61_PATGEN_SHORT_TYPE_SHIFT			4
-#define VGXY61_REG_FRAME_CONTENT_CTRL			VGXY61_REG_8BIT(0x0478)
-#define VGXY61_REG_COARSE_EXPOSURE_LONG			VGXY61_REG_16BIT(0x0500)
-#define VGXY61_REG_COARSE_EXPOSURE_SHORT		VGXY61_REG_16BIT(0x0504)
-#define VGXY61_REG_ANALOG_GAIN				VGXY61_REG_8BIT(0x0508)
-#define VGXY61_REG_DIGITAL_GAIN_LONG			VGXY61_REG_16BIT(0x050a)
-#define VGXY61_REG_DIGITAL_GAIN_SHORT			VGXY61_REG_16BIT(0x0512)
-#define VGXY61_REG_FRAME_LENGTH				VGXY61_REG_16BIT(0x051a)
-#define VGXY61_REG_SIGNALS_CTRL				VGXY61_REG_16BIT(0x0522)
+#define VGXY61_REG_FRAME_CONTENT_CTRL			CCI_REG8(0x0478)
+#define VGXY61_REG_COARSE_EXPOSURE_LONG			CCI_REG16_LE(0x0500)
+#define VGXY61_REG_COARSE_EXPOSURE_SHORT		CCI_REG16_LE(0x0504)
+#define VGXY61_REG_ANALOG_GAIN				CCI_REG8(0x0508)
+#define VGXY61_REG_DIGITAL_GAIN_LONG			CCI_REG16_LE(0x050a)
+#define VGXY61_REG_DIGITAL_GAIN_SHORT			CCI_REG16_LE(0x0512)
+#define VGXY61_REG_FRAME_LENGTH				CCI_REG16_LE(0x051a)
+#define VGXY61_REG_SIGNALS_CTRL				CCI_REG16_LE(0x0522)
 #define VGXY61_SIGNALS_GPIO_ID_SHIFT			4
-#define VGXY61_REG_READOUT_CTRL				VGXY61_REG_8BIT(0x0530)
-#define VGXY61_REG_HDR_CTRL				VGXY61_REG_8BIT(0x0532)
-#define VGXY61_REG_PATGEN_LONG_DATA_GR			VGXY61_REG_16BIT(0x092c)
-#define VGXY61_REG_PATGEN_LONG_DATA_R			VGXY61_REG_16BIT(0x092e)
-#define VGXY61_REG_PATGEN_LONG_DATA_B			VGXY61_REG_16BIT(0x0930)
-#define VGXY61_REG_PATGEN_LONG_DATA_GB			VGXY61_REG_16BIT(0x0932)
-#define VGXY61_REG_PATGEN_SHORT_DATA_GR			VGXY61_REG_16BIT(0x0950)
-#define VGXY61_REG_PATGEN_SHORT_DATA_R			VGXY61_REG_16BIT(0x0952)
-#define VGXY61_REG_PATGEN_SHORT_DATA_B			VGXY61_REG_16BIT(0x0954)
-#define VGXY61_REG_PATGEN_SHORT_DATA_GB			VGXY61_REG_16BIT(0x0956)
-#define VGXY61_REG_BYPASS_CTRL				VGXY61_REG_8BIT(0x0a60)
+#define VGXY61_REG_READOUT_CTRL				CCI_REG8(0x0530)
+#define VGXY61_REG_HDR_CTRL				CCI_REG8(0x0532)
+#define VGXY61_REG_PATGEN_LONG_DATA_GR			CCI_REG16_LE(0x092c)
+#define VGXY61_REG_PATGEN_LONG_DATA_R			CCI_REG16_LE(0x092e)
+#define VGXY61_REG_PATGEN_LONG_DATA_B			CCI_REG16_LE(0x0930)
+#define VGXY61_REG_PATGEN_LONG_DATA_GB			CCI_REG16_LE(0x0932)
+#define VGXY61_REG_PATGEN_SHORT_DATA_GR			CCI_REG16_LE(0x0950)
+#define VGXY61_REG_PATGEN_SHORT_DATA_R			CCI_REG16_LE(0x0952)
+#define VGXY61_REG_PATGEN_SHORT_DATA_B			CCI_REG16_LE(0x0954)
+#define VGXY61_REG_PATGEN_SHORT_DATA_GB			CCI_REG16_LE(0x0956)
+#define VGXY61_REG_BYPASS_CTRL				CCI_REG8(0x0a60)
 
 #define VGX661_WIDTH					1464
 #define VGX661_HEIGHT					1104
@@ -384,6 +380,7 @@ static const struct vgxy61_mode_info vgx761_mode_data[] = {
 
 struct vgxy61_dev {
 	struct i2c_client *i2c_client;
+	struct regmap *regmap;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(vgxy61_supply_name)];
@@ -510,82 +507,6 @@ static unsigned int get_chunk_size(struct vgxy61_dev *sensor)
 	return max(max_write_len, 1);
 }
 
-static int vgxy61_read_multiple(struct vgxy61_dev *sensor, u32 reg,
-				unsigned int len)
-{
-	struct i2c_client *client = sensor->i2c_client;
-	struct i2c_msg msg[2];
-	u8 buf[2];
-	u8 val[sizeof(u32)] = {0};
-	int ret;
-
-	if (len > sizeof(u32))
-		return -EINVAL;
-	buf[0] = reg >> 8;
-	buf[1] = reg & 0xff;
-
-	msg[0].addr = client->addr;
-	msg[0].flags = client->flags;
-	msg[0].buf = buf;
-	msg[0].len = sizeof(buf);
-
-	msg[1].addr = client->addr;
-	msg[1].flags = client->flags | I2C_M_RD;
-	msg[1].buf = val;
-	msg[1].len = len;
-
-	ret = i2c_transfer(client->adapter, msg, 2);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: %x i2c_transfer, reg: %x => %d\n",
-			__func__, client->addr, reg, ret);
-		return ret;
-	}
-
-	return get_unaligned_le32(val);
-}
-
-static inline int vgxy61_read_reg(struct vgxy61_dev *sensor, u32 reg)
-{
-	return vgxy61_read_multiple(sensor, reg & VGXY61_REG_ADDR_MASK,
-				     (reg >> VGXY61_REG_SIZE_SHIFT) & 7);
-}
-
-static int vgxy61_write_multiple(struct vgxy61_dev *sensor, u32 reg,
-				 const u8 *data, unsigned int len, int *err)
-{
-	struct i2c_client *client = sensor->i2c_client;
-	struct i2c_msg msg;
-	u8 buf[VGXY61_WRITE_MULTIPLE_CHUNK_MAX + 2];
-	unsigned int i;
-	int ret;
-
-	if (err && *err)
-		return *err;
-
-	if (len > VGXY61_WRITE_MULTIPLE_CHUNK_MAX)
-		return -EINVAL;
-	buf[0] = reg >> 8;
-	buf[1] = reg & 0xff;
-	for (i = 0; i < len; i++)
-		buf[i + 2] = data[i];
-
-	msg.addr = client->addr;
-	msg.flags = client->flags;
-	msg.buf = buf;
-	msg.len = len + 2;
-
-	ret = i2c_transfer(client->adapter, &msg, 1);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c_transfer, reg: %x => %d\n",
-			__func__, reg, ret);
-		if (err)
-			*err = ret;
-		return ret;
-	}
-
-	return 0;
-}
-
 static int vgxy61_write_array(struct vgxy61_dev *sensor, u32 reg,
 			      unsigned int nb, const u8 *array)
 {
@@ -595,7 +516,8 @@ static int vgxy61_write_array(struct vgxy61_dev *sensor, u32 reg,
 
 	while (nb) {
 		sz = min(nb, chunk_size);
-		ret = vgxy61_write_multiple(sensor, reg, array, sz, NULL);
+		ret = regmap_bulk_write(sensor->regmap, CCI_REG_ADDR(reg),
+					array, sz);
 		if (ret < 0)
 			return ret;
 		nb -= sz;
@@ -606,24 +528,17 @@ static int vgxy61_write_array(struct vgxy61_dev *sensor, u32 reg,
 	return 0;
 }
 
-static inline int vgxy61_write_reg(struct vgxy61_dev *sensor, u32 reg, u32 val,
-				   int *err)
-{
-	return vgxy61_write_multiple(sensor, reg & VGXY61_REG_ADDR_MASK,
-				     (u8 *)&val,
-				     (reg >> VGXY61_REG_SIZE_SHIFT) & 7, err);
-}
-
 static int vgxy61_poll_reg(struct vgxy61_dev *sensor, u32 reg, u8 poll_val,
 			   unsigned int timeout_ms)
 {
 	const unsigned int loop_delay_ms = 10;
+	u64 val;
 	int ret;
 
-	return read_poll_timeout(vgxy61_read_reg, ret,
-				 ((ret < 0) || (ret == poll_val)),
+	return read_poll_timeout(cci_read, ret,
+				 ((ret < 0) || (val == poll_val)),
 				 loop_delay_ms * 1000, timeout_ms * 1000,
-				 false, sensor, reg);
+				 false, sensor->regmap, reg, &val, NULL);
 }
 
 static int vgxy61_wait_state(struct vgxy61_dev *sensor, int state,
@@ -662,11 +577,11 @@ static int vgxy61_apply_exposure(struct vgxy61_dev *sensor)
 	int ret = 0;
 
 	 /* We first set expo to zero to avoid forbidden parameters couple */
-	vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_SHORT, 0, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_LONG,
-			 sensor->expo_long, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_COARSE_EXPOSURE_SHORT,
-			 sensor->expo_short, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_COARSE_EXPOSURE_SHORT, 0, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_COARSE_EXPOSURE_LONG,
+		  sensor->expo_long, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_COARSE_EXPOSURE_SHORT,
+		  sensor->expo_short, &ret);
 
 	return ret;
 }
@@ -827,8 +742,8 @@ static int vgxy61_update_analog_gain(struct vgxy61_dev *sensor, u32 target)
 	sensor->analog_gain = target;
 
 	if (sensor->streaming)
-		return vgxy61_write_reg(sensor, VGXY61_REG_ANALOG_GAIN, target,
-					NULL);
+		return cci_write(sensor->regmap, VGXY61_REG_ANALOG_GAIN, target,
+				 NULL);
 	return 0;
 }
 
@@ -842,10 +757,10 @@ static int vgxy61_apply_digital_gain(struct vgxy61_dev *sensor,
 	 * DIGITAL_GAIN_SHORT_CH0 is enough to configure the gain of all
 	 * four sub pixels.
 	 */
-	vgxy61_write_reg(sensor, VGXY61_REG_DIGITAL_GAIN_LONG, digital_gain,
-			 &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_DIGITAL_GAIN_SHORT, digital_gain,
-			 &ret);
+	cci_write(sensor->regmap, VGXY61_REG_DIGITAL_GAIN_LONG, digital_gain,
+		  &ret);
+	cci_write(sensor->regmap, VGXY61_REG_DIGITAL_GAIN_SHORT, digital_gain,
+		  &ret);
 
 	return ret;
 }
@@ -870,7 +785,7 @@ static int vgxy61_apply_patgen(struct vgxy61_dev *sensor, u32 index)
 
 	if (pattern)
 		reg |= VGXY61_PATGEN_LONG_ENABLE | VGXY61_PATGEN_SHORT_ENABLE;
-	return vgxy61_write_reg(sensor, VGXY61_REG_PATGEN_CTRL, reg, NULL);
+	return cci_write(sensor->regmap, VGXY61_REG_PATGEN_CTRL, reg, NULL);
 }
 
 static int vgxy61_update_patgen(struct vgxy61_dev *sensor, u32 pattern)
@@ -887,15 +802,13 @@ static int vgxy61_apply_gpiox_strobe_mode(struct vgxy61_dev *sensor,
 					  unsigned int idx)
 {
 	static const u8 index2val[] = {0x0, 0x1, 0x3};
-	int reg;
+	u16 mask, val;
 
-	reg = vgxy61_read_reg(sensor, VGXY61_REG_SIGNALS_CTRL);
-	if (reg < 0)
-		return reg;
-	reg &= ~(0xf << (idx * VGXY61_SIGNALS_GPIO_ID_SHIFT));
-	reg |= index2val[mode] << (idx * VGXY61_SIGNALS_GPIO_ID_SHIFT);
+	mask = 0xf << (idx * VGXY61_SIGNALS_GPIO_ID_SHIFT);
+	val = index2val[mode] << (idx * VGXY61_SIGNALS_GPIO_ID_SHIFT);
 
-	return vgxy61_write_reg(sensor, VGXY61_REG_SIGNALS_CTRL, reg, NULL);
+	return cci_update_bits(sensor->regmap, VGXY61_REG_SIGNALS_CTRL,
+			       mask, val, NULL);
 }
 
 static int vgxy61_update_gpios_strobe_mode(struct vgxy61_dev *sensor,
@@ -940,12 +853,12 @@ static int vgxy61_update_gpios_strobe_polarity(struct vgxy61_dev *sensor,
 	if (sensor->streaming)
 		return -EBUSY;
 
-	vgxy61_write_reg(sensor, VGXY61_REG_GPIO_0_CTRL, polarity << 1, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_GPIO_1_CTRL, polarity << 1, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_GPIO_2_CTRL, polarity << 1, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_GPIO_3_CTRL, polarity << 1, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_SIGNALS_POLARITY_CTRL, polarity,
-			 &ret);
+	cci_write(sensor->regmap, VGXY61_REG_GPIO_0_CTRL, polarity << 1, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_GPIO_1_CTRL, polarity << 1, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_GPIO_2_CTRL, polarity << 1, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_GPIO_3_CTRL, polarity << 1, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_SIGNALS_POLARITY_CTRL, polarity,
+		  &ret);
 
 	return ret;
 }
@@ -1057,8 +970,8 @@ static int vgxy61_update_exposure(struct vgxy61_dev *sensor, u16 new_expo_long,
 
 static int vgxy61_apply_framelength(struct vgxy61_dev *sensor)
 {
-	return vgxy61_write_reg(sensor, VGXY61_REG_FRAME_LENGTH,
-				sensor->frame_length, NULL);
+	return cci_write(sensor->regmap, VGXY61_REG_FRAME_LENGTH,
+			 sensor->frame_length, NULL);
 }
 
 static int vgxy61_update_vblank(struct vgxy61_dev *sensor, u16 vblank,
@@ -1086,8 +999,8 @@ static int vgxy61_apply_hdr(struct vgxy61_dev *sensor,
 {
 	static const u8 index2val[] = {0x1, 0x4, 0xa};
 
-	return vgxy61_write_reg(sensor, VGXY61_REG_HDR_CTRL, index2val[index],
-				NULL);
+	return cci_write(sensor->regmap, VGXY61_REG_HDR_CTRL, index2val[index],
+			 NULL);
 }
 
 static int vgxy61_update_hdr(struct vgxy61_dev *sensor,
@@ -1133,16 +1046,16 @@ static int vgxy61_apply_settings(struct vgxy61_dev *sensor)
 	if (ret)
 		return ret;
 
-	ret = vgxy61_write_reg(sensor, VGXY61_REG_ANALOG_GAIN,
-			       sensor->analog_gain, NULL);
+	ret = cci_write(sensor->regmap, VGXY61_REG_ANALOG_GAIN,
+			sensor->analog_gain, NULL);
 	if (ret)
 		return ret;
 	ret = vgxy61_apply_digital_gain(sensor, sensor->digital_gain);
 	if (ret)
 		return ret;
 
-	ret = vgxy61_write_reg(sensor, VGXY61_REG_ORIENTATION,
-			       sensor->hflip | (sensor->vflip << 1), NULL);
+	ret = cci_write(sensor->regmap, VGXY61_REG_ORIENTATION,
+			sensor->hflip | (sensor->vflip << 1), NULL);
 	if (ret)
 		return ret;
 
@@ -1174,19 +1087,19 @@ static int vgxy61_stream_enable(struct vgxy61_dev *sensor)
 	if (ret)
 		return ret;
 
-	vgxy61_write_reg(sensor, VGXY61_REG_FORMAT_CTRL,
-			 get_bpp_by_code(sensor->fmt.code), &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_OIF_ROI0_CTRL,
-			 get_data_type_by_code(sensor->fmt.code), &ret);
-
-	vgxy61_write_reg(sensor, VGXY61_REG_READOUT_CTRL,
-			 sensor->current_mode->bin_mode, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_ROI0_START_H, crop->left, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_ROI0_END_H,
-			 crop->left + crop->width - 1, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_ROI0_START_V, crop->top, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_ROI0_END_V,
-			 crop->top + crop->height - 1, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_FORMAT_CTRL,
+		  get_bpp_by_code(sensor->fmt.code), &ret);
+	cci_write(sensor->regmap, VGXY61_REG_OIF_ROI0_CTRL,
+		  get_data_type_by_code(sensor->fmt.code), &ret);
+
+	cci_write(sensor->regmap, VGXY61_REG_READOUT_CTRL,
+		  sensor->current_mode->bin_mode, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_ROI0_START_H, crop->left, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_ROI0_END_H,
+		  crop->left + crop->width - 1, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_ROI0_START_V, crop->top, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_ROI0_END_V,
+		  crop->top + crop->height - 1, &ret);
 	if (ret)
 		goto err_rpm_put;
 
@@ -1194,8 +1107,8 @@ static int vgxy61_stream_enable(struct vgxy61_dev *sensor)
 	if (ret)
 		goto err_rpm_put;
 
-	ret = vgxy61_write_reg(sensor, VGXY61_REG_STREAMING,
-			       VGXY61_STREAMING_REQ_START, NULL);
+	ret = cci_write(sensor->regmap, VGXY61_REG_STREAMING,
+			VGXY61_STREAMING_REQ_START, NULL);
 	if (ret)
 		goto err_rpm_put;
 
@@ -1225,8 +1138,8 @@ static int vgxy61_stream_disable(struct vgxy61_dev *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
 	int ret;
 
-	ret = vgxy61_write_reg(sensor, VGXY61_REG_STREAMING,
-			       VGXY61_STREAMING_REQ_STOP, NULL);
+	ret = cci_write(sensor->regmap, VGXY61_REG_STREAMING,
+			VGXY61_STREAMING_REQ_STOP, NULL);
 	if (ret)
 		goto err_str_dis;
 
@@ -1582,7 +1495,7 @@ static int vgxy61_configure(struct vgxy61_dev *sensor)
 {
 	u32 sensor_freq;
 	u8 prediv, mult;
-	int line_length;
+	u64 line_length;
 	int ret = 0;
 
 	compute_pll_parameters_by_freq(sensor->clk_freq, &prediv, &mult);
@@ -1592,28 +1505,28 @@ static int vgxy61_configure(struct vgxy61_dev *sensor)
 	/* Video timing ISP path (pixel clock)  requires 804/5 mhz = 160 mhz */
 	sensor->pclk = sensor_freq / 5;
 
-	line_length = vgxy61_read_reg(sensor, VGXY61_REG_LINE_LENGTH);
-	if (line_length < 0)
-		return line_length;
-	sensor->line_length = line_length;
-	vgxy61_write_reg(sensor, VGXY61_REG_EXT_CLOCK, sensor->clk_freq, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_CLK_PLL_PREDIV, prediv, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_CLK_SYS_PLL_MULT, mult, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_OIF_CTRL, sensor->oif_ctrl, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_FRAME_CONTENT_CTRL, 0, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_BYPASS_CTRL, 4, &ret);
+	cci_read(sensor->regmap, VGXY61_REG_LINE_LENGTH, &line_length, &ret);
+	if (ret < 0)
+		return ret;
+	sensor->line_length = (u16)line_length;
+	cci_write(sensor->regmap, VGXY61_REG_EXT_CLOCK, sensor->clk_freq, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_CLK_PLL_PREDIV, prediv, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_CLK_SYS_PLL_MULT, mult, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_OIF_CTRL, sensor->oif_ctrl, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_FRAME_CONTENT_CTRL, 0, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_BYPASS_CTRL, 4, &ret);
 	if (ret)
 		return ret;
 	vgxy61_update_gpios_strobe_polarity(sensor, sensor->gpios_polarity);
 	/* Set pattern generator solid to middle value */
-	vgxy61_write_reg(sensor, VGXY61_REG_PATGEN_LONG_DATA_GR, 0x800, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_PATGEN_LONG_DATA_R, 0x800, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_PATGEN_LONG_DATA_B, 0x800, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_PATGEN_LONG_DATA_GB, 0x800, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_PATGEN_SHORT_DATA_GR, 0x800, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_PATGEN_SHORT_DATA_R, 0x800, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_PATGEN_SHORT_DATA_B, 0x800, &ret);
-	vgxy61_write_reg(sensor, VGXY61_REG_PATGEN_SHORT_DATA_GB, 0x800, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_PATGEN_LONG_DATA_GR, 0x800, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_PATGEN_LONG_DATA_R, 0x800, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_PATGEN_LONG_DATA_B, 0x800, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_PATGEN_LONG_DATA_GB, 0x800, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_PATGEN_SHORT_DATA_GR, 0x800, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_PATGEN_SHORT_DATA_R, 0x800, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_PATGEN_SHORT_DATA_B, 0x800, &ret);
+	cci_write(sensor->regmap, VGXY61_REG_PATGEN_SHORT_DATA_GB, 0x800, &ret);
 	if (ret)
 		return ret;
 
@@ -1623,37 +1536,33 @@ static int vgxy61_configure(struct vgxy61_dev *sensor)
 static int vgxy61_patch(struct vgxy61_dev *sensor)
 {
 	struct i2c_client *client = sensor->i2c_client;
-	int patch, ret;
+	u64 patch;
+	int ret;
 
 	ret = vgxy61_write_array(sensor, VGXY61_REG_FWPATCH_START_ADDR,
 				 sizeof(patch_array), patch_array);
-	if (ret)
-		return ret;
-
-	ret = vgxy61_write_reg(sensor, VGXY61_REG_STBY, 0x10, NULL);
+	cci_write(sensor->regmap, VGXY61_REG_STBY, 0x10, &ret);
 	if (ret)
 		return ret;
 
 	ret = vgxy61_poll_reg(sensor, VGXY61_REG_STBY, 0, VGXY61_TIMEOUT_MS);
-	if (ret)
+	cci_read(sensor->regmap, VGXY61_REG_FWPATCH_REVISION, &patch, &ret);
+	if (ret < 0)
 		return ret;
 
-	patch = vgxy61_read_reg(sensor, VGXY61_REG_FWPATCH_REVISION);
-	if (patch < 0)
-		return patch;
-
 	if (patch != (VGXY61_FWPATCH_REVISION_MAJOR << 12) +
 		     (VGXY61_FWPATCH_REVISION_MINOR << 8) +
 		     VGXY61_FWPATCH_REVISION_MICRO) {
-		dev_err(&client->dev, "bad patch version expected %d.%d.%d got %d.%d.%d\n",
+		dev_err(&client->dev,
+			"bad patch version expected %d.%d.%d got %u.%u.%u\n",
 			VGXY61_FWPATCH_REVISION_MAJOR,
 			VGXY61_FWPATCH_REVISION_MINOR,
 			VGXY61_FWPATCH_REVISION_MICRO,
-			patch >> 12, (patch >> 8) & 0x0f, patch & 0xff);
+			(u16)patch >> 12, ((u16)patch >> 8) & 0x0f, (u16)patch & 0xff);
 		return -ENODEV;
 	}
-	dev_dbg(&client->dev, "patch %d.%d.%d applied\n",
-		patch >> 12, (patch >> 8) & 0x0f, patch & 0xff);
+	dev_dbg(&client->dev, "patch %u.%u.%u applied\n",
+		(u16)patch >> 12, ((u16)patch >> 8) & 0x0f, (u16)patch & 0xff);
 
 	return 0;
 }
@@ -1661,11 +1570,12 @@ static int vgxy61_patch(struct vgxy61_dev *sensor)
 static int vgxy61_detect_cut_version(struct vgxy61_dev *sensor)
 {
 	struct i2c_client *client = sensor->i2c_client;
-	int device_rev;
+	u64 device_rev;
+	int ret;
 
-	device_rev = vgxy61_read_reg(sensor, VGXY61_REG_REVISION);
-	if (device_rev < 0)
-		return device_rev;
+	ret = cci_read(sensor->regmap, VGXY61_REG_REVISION, &device_rev, NULL);
+	if (ret < 0)
+		return ret;
 
 	switch (device_rev >> 8) {
 	case 0xA:
@@ -1687,17 +1597,17 @@ static int vgxy61_detect_cut_version(struct vgxy61_dev *sensor)
 static int vgxy61_detect(struct vgxy61_dev *sensor)
 {
 	struct i2c_client *client = sensor->i2c_client;
-	int id = 0;
-	int ret, st;
+	u64 st, id = 0;
+	int ret;
 
-	id = vgxy61_read_reg(sensor, VGXY61_REG_MODEL_ID);
-	if (id < 0)
-		return id;
+	ret = cci_read(sensor->regmap, VGXY61_REG_MODEL_ID, &id, NULL);
+	if (ret < 0)
+		return ret;
 	if (id != VG5661_MODEL_ID && id != VG5761_MODEL_ID) {
-		dev_warn(&client->dev, "Unsupported sensor id %x\n", id);
+		dev_warn(&client->dev, "Unsupported sensor id %x\n", (u16)id);
 		return -ENODEV;
 	}
-	dev_dbg(&client->dev, "detected sensor id = 0x%04x\n", id);
+	dev_dbg(&client->dev, "detected sensor id = 0x%04x\n", (u16)id);
 	sensor->id = id;
 
 	ret = vgxy61_wait_state(sensor, VGXY61_SYSTEM_FSM_SW_STBY,
@@ -1705,11 +1615,11 @@ static int vgxy61_detect(struct vgxy61_dev *sensor)
 	if (ret)
 		return ret;
 
-	st = vgxy61_read_reg(sensor, VGXY61_REG_NVM);
-	if (st < 0)
+	ret = cci_read(sensor->regmap, VGXY61_REG_NVM, &st, NULL);
+	if (ret < 0)
 		return st;
 	if (st != VGXY61_NVM_OK)
-		dev_warn(&client->dev, "Bad nvm state got %d\n", st);
+		dev_warn(&client->dev, "Bad nvm state got %u\n", (u8)st);
 
 	ret = vgxy61_detect_cut_version(sensor);
 	if (ret)
@@ -1832,6 +1742,12 @@ static int vgxy61_probe(struct i2c_client *client)
 	sensor->analog_gain = 0;
 	sensor->digital_gain = 256;
 
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap)) {
+		ret = PTR_ERR(sensor->regmap);
+		return dev_err_probe(dev, ret, "Failed to init regmap\n");
+	}
+
 	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
 	if (!handle) {
 		dev_err(dev, "handle node not found\n");
-- 
2.43.0


