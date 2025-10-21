Return-Path: <linux-media+bounces-45108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF38BF5243
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 10:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A44FB4E2E8C
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 08:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC2E2E8E09;
	Tue, 21 Oct 2025 08:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NT0IZskE"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A73822FDFF
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033837; cv=none; b=ZbnILnvdVgWlrX30qmOhhlX6ha4XofyBUcOSJ1bMF8IHEDzsxOixFMva401CdNubPWFcBRNDtXU3RvSCWCywMWni4O1A/tzW8NRZy5CsBt7f80qzmf6WUsptHL9vJcOX7OEzGpuKBAMa757ngEUgcijgIPeKzAgmD6ltnudLNH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033837; c=relaxed/simple;
	bh=Vmy3r67iGUwRMeQFc71ZMdjQf8RphKXHKljUnxn1K1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RCUW9qVeSe3WiwZDT8qm3ccKb56524P4oHg1O05qGUyuttSPNx22n4KRpkkmXHzstTSSfHyht9PvCKpMsF6Gk2F1m9MsBRmJGXIDwfIxZhf6Cn3XK0QGmmqxIHj+dQ54z91SfB0lAg4m6UWG/Reu4vHb8A11M8vryDscXAm9o48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NT0IZskE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761033833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uHKu/BZb5GhfANOwIa/7avTxKNvZTBvxAGe90ggUsLc=;
	b=NT0IZskENkAIVOmSN0QbwI+WGNM3VDu6g2ASTopuEpui5sw6WJFKSLSbgG683KCKyE55+c
	MnCWimaEv1231U/0cuWQCV6I5fm9xvH65JJF0eDekPrbIur/kJGzP1vERekjQfD07xplXY
	0lFkG0Tdp6tfY02b4OL7fB2ncqa48pI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-HLM8KFQ7PbqSzEBwjqNCSg-1; Tue,
 21 Oct 2025 04:03:47 -0400
X-MC-Unique: HLM8KFQ7PbqSzEBwjqNCSg-1
X-Mimecast-MFC-AGG-ID: HLM8KFQ7PbqSzEBwjqNCSg_1761033826
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C01D91800657;
	Tue, 21 Oct 2025 08:03:46 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.32.85])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C3BF830001BE;
	Tue, 21 Oct 2025 08:03:42 +0000 (UTC)
From: kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v9] media: Add t4ka3 camera sensor driver
Date: Tue, 21 Oct 2025 16:03:25 +0800
Message-ID: <20251021080325.141435-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Kate Hsuan <hpa@redhat.com>

Add the t4ka3 driver from:
https://github.com/kitakar5525/surface3-atomisp-cameras.git

With many cleanups / changes (almost a full rewrite) to make it suitable
for upstream:

* Remove the VCM and VCM-OTP support, the mainline kernel models VCMs and
  calibration data eeproms as separate v4l2-subdev-s.

* Remove the integration-factor t4ka3_get_intg_factor() support and IOCTL,
  this provided info to userspace through an atomisp private IOCTL.

* Turn atomisp specific exposure/gain IOCTL into standard v4l2 controls.

* Use normal ACPI power-management in combination with runtime-pm support
  instead of atomisp specific GMIN power-management code.

* Turn into a standard V4L2 sensor driver using
  v4l2_async_register_subdev_sensor().

* Add vblank, hblank, and link-freq controls; drop get_frame_interval().

* Use CCI register helpers.

* Calculate values for modes instead of using fixed register-value lists,
  allowing arbritrary modes.

* Add get_selection() and set_selection() support

* Add a CSI2 bus configuration check

This been tested on a Xiaomi Mipad2 tablet which has a T4KA3 sensor with
DW9761 VCM as back sensor.

Co-developed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
Changes in v9:
1. Apply Hans' fix patch to fix the lock issue and squash it into this
   patch.
https://lore.kernel.org/linux-media/33dd5660-efb6-47e0-9672-f3ae65751185@kernel.org/

Changes in v8:
1. Drop the local mutex lock and v4l2-core manages all the locking.
2. __t4ka3_get_pad_format() and __t4ka3_get_pad_crop() are replaced with
   v4l2_subdev_state_get_format() and v4l2_subdev_state_get_crop().
3. The deprecated s_stream was replaced with enable_streams() and
   disable_streams().
4. Drop unused functions.
5. t4ka3_get_active_format() helper is used to get the active format.
6. v4l2_link_freq_to_bitmap() is used to check and get the supported
   link frequency.

Changes in v7:
1. Add pixel_rate control.

Changes in v6:
1. t4ka3_s_config() was removed.
2. The unused macros were removed.
3. The runtime pm initial flow was improved.
4. In remove(), if the device is not in the "suspend" state, the device
   will be manually turned off.

Changes in v5:
1. Improved Kconfig help description.

Changes in v4:
1. Another CI issue fixes.

Changes in v3:
1. Fix the issues reported by the CI system.

Changes in v2:
1. The regmap information was obtained before configuring runtime PM so
   probe() can return without disabling runtime PM.
2. In t4ka3_s_stream(), return -EBUSY when the streaming is enabled.

---
 drivers/media/i2c/Kconfig  |   12 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/t4ka3.c  | 1096 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1109 insertions(+)
 create mode 100644 drivers/media/i2c/t4ka3.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 6237fe804a5c..b60581dec514 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -713,6 +713,18 @@ config VIDEO_S5K6A3
 	  This is a V4L2 sensor driver for Samsung S5K6A3 raw
 	  camera sensor.
 
+config VIDEO_T4KA3
+	tristate "Toshiba T4KA3 sensor support"
+	depends on ACPI || COMPILE_TEST
+	depends on GPIOLIB
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the Toshiba T4KA3 8 MP
+	  camera sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called t4ka3.
+
 config VIDEO_VD55G1
 	tristate "ST VD55G1 sensor support"
 	select V4L2_CCI_I2C
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee..af4a18bebc42 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -132,6 +132,7 @@ obj-$(CONFIG_VIDEO_SAA717X) += saa717x.o
 obj-$(CONFIG_VIDEO_SAA7185) += saa7185.o
 obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
+obj-$(CONFIG_VIDEO_T4KA3) += t4ka3.o
 obj-$(CONFIG_VIDEO_TC358743) += tc358743.o
 obj-$(CONFIG_VIDEO_TC358746) += tc358746.o
 obj-$(CONFIG_VIDEO_TDA1997X) += tda1997x.o
diff --git a/drivers/media/i2c/t4ka3.c b/drivers/media/i2c/t4ka3.c
new file mode 100644
index 000000000000..966f351e6696
--- /dev/null
+++ b/drivers/media/i2c/t4ka3.c
@@ -0,0 +1,1096 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Support for T4KA3 8M camera sensor.
+ *
+ * Copyright (C) 2015 Intel Corporation. All Rights Reserved.
+ * Copyright (C) 2016 XiaoMi, Inc.
+ * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define T4KA3_NATIVE_WIDTH			3280
+#define T4KA3_NATIVE_HEIGHT			2464
+#define T4KA3_NATIVE_START_LEFT			0
+#define T4KA3_NATIVE_START_TOP			0
+#define T4KA3_ACTIVE_WIDTH			3280
+#define T4KA3_ACTIVE_HEIGHT			2460
+#define T4KA3_ACTIVE_START_LEFT			0
+#define T4KA3_ACTIVE_START_TOP			2
+#define T4KA3_MIN_CROP_WIDTH			2
+#define T4KA3_MIN_CROP_HEIGHT			2
+
+#define T4KA3_PIXELS_PER_LINE			3440
+#define T4KA3_LINES_PER_FRAME_30FPS		2492
+#define T4KA3_FPS				30
+#define T4KA3_PIXEL_RATE \
+	(T4KA3_PIXELS_PER_LINE * T4KA3_LINES_PER_FRAME_30FPS * T4KA3_FPS)
+
+/*
+ * TODO this really should be derived from the 19.2 MHz xvclk combined
+ * with the PLL settings. But without a datasheet this is the closest
+ * approximation possible.
+ *
+ * link-freq = pixel_rate * bpp / (lanes * 2)
+ * (lanes * 2) because CSI lanes use double-data-rate (DDR) signalling.
+ * bpp = 10 and lanes = 4
+ */
+#define T4KA3_LINK_FREQ				((u64)T4KA3_PIXEL_RATE * 10 / 8)
+
+/* For enum_frame_size() full-size + binned-/quarter-size */
+#define T4KA3_FRAME_SIZES			2
+
+#define T4KA3_REG_PRODUCT_ID_HIGH		CCI_REG8(0x0000)
+#define T4KA3_REG_PRODUCT_ID_LOW		CCI_REG8(0x0001)
+#define T4KA3_PRODUCT_ID			0x1490
+
+#define T4KA3_REG_STREAM			CCI_REG8(0x0100)
+#define T4KA3_REG_IMG_ORIENTATION		CCI_REG8(0x0101)
+#define T4KA3_HFLIP_BIT				BIT(0)
+#define T4KA3_VFLIP_BIT				BIT(1)
+#define T4KA3_REG_PARAM_HOLD			CCI_REG8(0x0104)
+#define T4KA3_REG_COARSE_INTEGRATION_TIME	CCI_REG16(0x0202)
+#define T4KA3_COARSE_INTEGRATION_TIME_MARGIN	6
+#define T4KA3_REG_DIGGAIN_GREEN_R		CCI_REG16(0x020e)
+#define T4KA3_REG_DIGGAIN_RED			CCI_REG16(0x0210)
+#define T4KA3_REG_DIGGAIN_BLUE			CCI_REG16(0x0212)
+#define T4KA3_REG_DIGGAIN_GREEN_B		CCI_REG16(0x0214)
+#define T4KA3_REG_GLOBAL_GAIN			CCI_REG16(0x0234)
+#define T4KA3_MIN_GLOBAL_GAIN_SUPPORTED		0x0080
+#define T4KA3_MAX_GLOBAL_GAIN_SUPPORTED		0x07ff
+#define T4KA3_REG_FRAME_LENGTH_LINES		CCI_REG16(0x0340) /* aka VTS */
+/* FIXME: need a datasheet to verify the min + max vblank values */
+#define T4KA3_MIN_VBLANK			4
+#define T4KA3_MAX_VBLANK			0xffff
+#define T4KA3_REG_PIXELS_PER_LINE		CCI_REG16(0x0342) /* aka HTS */
+/* These 2 being horz/vert start is a guess (no datasheet), always 0 */
+#define T4KA3_REG_HORZ_START			CCI_REG16(0x0344)
+#define T4KA3_REG_VERT_START			CCI_REG16(0x0346)
+/* Always 3279 (T4KA3_NATIVE_WIDTH - 1, window is used to crop */
+#define T4KA3_REG_HORZ_END			CCI_REG16(0x0348)
+/* Always 2463 (T4KA3_NATIVE_HEIGHT - 1, window is used to crop */
+#define T4KA3_REG_VERT_END			CCI_REG16(0x034a)
+/* Output size (after cropping/window) */
+#define T4KA3_REG_HORZ_OUTPUT_SIZE		CCI_REG16(0x034c)
+#define T4KA3_REG_VERT_OUTPUT_SIZE		CCI_REG16(0x034e)
+/* Window/crop start + size *after* binning */
+#define T4KA3_REG_WIN_START_X			CCI_REG16(0x0408)
+#define T4KA3_REG_WIN_START_Y			CCI_REG16(0x040a)
+#define T4KA3_REG_WIN_WIDTH			CCI_REG16(0x040c)
+#define T4KA3_REG_WIN_HEIGHT			CCI_REG16(0x040e)
+#define T4KA3_REG_TEST_PATTERN_MODE		CCI_REG8(0x0601)
+/* Unknown register at address 0x0900 */
+#define T4KA3_REG_0900				CCI_REG8(0x0900)
+#define T4KA3_REG_BINNING			CCI_REG8(0x0901)
+#define T4KA3_BINNING_VAL(_b) \
+	({ typeof(_b) (b) = (_b); \
+	((b) << 4) | (b); })
+
+struct t4ka3_ctrls {
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *vflip;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *test_pattern;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+};
+
+struct t4ka3_mode {
+	int				binning;
+	u16				win_x;
+	u16				win_y;
+};
+
+struct t4ka3_data {
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct mutex lock; /* serialize sensor's ioctl */
+	struct t4ka3_ctrls ctrls;
+	struct t4ka3_mode mode;
+	struct device *dev;
+	struct regmap *regmap;
+	struct gpio_desc *powerdown_gpio;
+	struct gpio_desc *reset_gpio;
+	s64 link_freq[1];
+	int streaming;
+
+	/* MIPI lane info */
+	u32 link_freq_index;
+	u8 mipi_lanes;
+};
+
+/* init settings */
+static const struct cci_reg_sequence t4ka3_init_config[] = {
+	{CCI_REG8(0x4136), 0x13},
+	{CCI_REG8(0x4137), 0x33},
+	{CCI_REG8(0x3094), 0x01},
+	{CCI_REG8(0x0233), 0x01},
+	{CCI_REG8(0x4B06), 0x01},
+	{CCI_REG8(0x4B07), 0x01},
+	{CCI_REG8(0x3028), 0x01},
+	{CCI_REG8(0x3032), 0x14},
+	{CCI_REG8(0x305C), 0x0C},
+	{CCI_REG8(0x306D), 0x0A},
+	{CCI_REG8(0x3071), 0xFA},
+	{CCI_REG8(0x307E), 0x0A},
+	{CCI_REG8(0x307F), 0xFC},
+	{CCI_REG8(0x3091), 0x04},
+	{CCI_REG8(0x3092), 0x60},
+	{CCI_REG8(0x3096), 0xC0},
+	{CCI_REG8(0x3100), 0x07},
+	{CCI_REG8(0x3101), 0x4C},
+	{CCI_REG8(0x3118), 0xCC},
+	{CCI_REG8(0x3139), 0x06},
+	{CCI_REG8(0x313A), 0x06},
+	{CCI_REG8(0x313B), 0x04},
+	{CCI_REG8(0x3143), 0x02},
+	{CCI_REG8(0x314F), 0x0E},
+	{CCI_REG8(0x3169), 0x99},
+	{CCI_REG8(0x316A), 0x99},
+	{CCI_REG8(0x3171), 0x05},
+	{CCI_REG8(0x31A1), 0xA7},
+	{CCI_REG8(0x31A2), 0x9C},
+	{CCI_REG8(0x31A3), 0x8F},
+	{CCI_REG8(0x31A4), 0x75},
+	{CCI_REG8(0x31A5), 0xEE},
+	{CCI_REG8(0x31A6), 0xEA},
+	{CCI_REG8(0x31A7), 0xE4},
+	{CCI_REG8(0x31A8), 0xE4},
+	{CCI_REG8(0x31DF), 0x05},
+	{CCI_REG8(0x31EC), 0x1B},
+	{CCI_REG8(0x31ED), 0x1B},
+	{CCI_REG8(0x31EE), 0x1B},
+	{CCI_REG8(0x31F0), 0x1B},
+	{CCI_REG8(0x31F1), 0x1B},
+	{CCI_REG8(0x31F2), 0x1B},
+	{CCI_REG8(0x3204), 0x3F},
+	{CCI_REG8(0x3205), 0x03},
+	{CCI_REG8(0x3210), 0x01},
+	{CCI_REG8(0x3216), 0x68},
+	{CCI_REG8(0x3217), 0x58},
+	{CCI_REG8(0x3218), 0x58},
+	{CCI_REG8(0x321A), 0x68},
+	{CCI_REG8(0x321B), 0x60},
+	{CCI_REG8(0x3238), 0x03},
+	{CCI_REG8(0x3239), 0x03},
+	{CCI_REG8(0x323A), 0x05},
+	{CCI_REG8(0x323B), 0x06},
+	{CCI_REG8(0x3243), 0x03},
+	{CCI_REG8(0x3244), 0x08},
+	{CCI_REG8(0x3245), 0x01},
+	{CCI_REG8(0x3307), 0x19},
+	{CCI_REG8(0x3308), 0x19},
+	{CCI_REG8(0x3320), 0x01},
+	{CCI_REG8(0x3326), 0x15},
+	{CCI_REG8(0x3327), 0x0D},
+	{CCI_REG8(0x3328), 0x01},
+	{CCI_REG8(0x3380), 0x01},
+	{CCI_REG8(0x339E), 0x07},
+	{CCI_REG8(0x3424), 0x00},
+	{CCI_REG8(0x343C), 0x01},
+	{CCI_REG8(0x3398), 0x04},
+	{CCI_REG8(0x343A), 0x10},
+	{CCI_REG8(0x339A), 0x22},
+	{CCI_REG8(0x33B4), 0x00},
+	{CCI_REG8(0x3393), 0x01},
+	{CCI_REG8(0x33B3), 0x6E},
+	{CCI_REG8(0x3433), 0x06},
+	{CCI_REG8(0x3433), 0x00},
+	{CCI_REG8(0x33B3), 0x00},
+	{CCI_REG8(0x3393), 0x03},
+	{CCI_REG8(0x33B4), 0x03},
+	{CCI_REG8(0x343A), 0x00},
+	{CCI_REG8(0x339A), 0x00},
+	{CCI_REG8(0x3398), 0x00}
+};
+
+static const struct cci_reg_sequence t4ka3_pre_mode_set_regs[] = {
+	{CCI_REG8(0x0112), 0x0A},
+	{CCI_REG8(0x0113), 0x0A},
+	{CCI_REG8(0x0114), 0x03},
+	{CCI_REG8(0x4136), 0x13},
+	{CCI_REG8(0x4137), 0x33},
+	{CCI_REG8(0x0820), 0x0A},
+	{CCI_REG8(0x0821), 0x0D},
+	{CCI_REG8(0x0822), 0x00},
+	{CCI_REG8(0x0823), 0x00},
+	{CCI_REG8(0x0301), 0x0A},
+	{CCI_REG8(0x0303), 0x01},
+	{CCI_REG8(0x0305), 0x04},
+	{CCI_REG8(0x0306), 0x02},
+	{CCI_REG8(0x0307), 0x18},
+	{CCI_REG8(0x030B), 0x01},
+};
+
+static const struct cci_reg_sequence t4ka3_post_mode_set_regs[] = {
+	{CCI_REG8(0x0902), 0x00},
+	{CCI_REG8(0x4220), 0x00},
+	{CCI_REG8(0x4222), 0x01},
+	{CCI_REG8(0x3380), 0x01},
+	{CCI_REG8(0x3090), 0x88},
+	{CCI_REG8(0x3394), 0x20},
+	{CCI_REG8(0x3090), 0x08},
+	{CCI_REG8(0x3394), 0x10}
+};
+
+static const s64 link_freq_menu_items[] = {
+	T4KA3_LINK_FREQ,
+};
+
+static inline struct t4ka3_data *to_t4ka3_sensor(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct t4ka3_data, sd);
+}
+
+static inline struct t4ka3_data *ctrl_to_t4ka3(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct t4ka3_data, ctrls.handler);
+}
+
+/* T4KA3 default GRBG */
+static const int t4ka3_hv_flip_bayer_order[] = {
+	MEDIA_BUS_FMT_SGRBG10_1X10,
+	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SRGGB10_1X10,
+	MEDIA_BUS_FMT_SGBRG10_1X10,
+};
+
+static const struct v4l2_rect t4ka3_default_crop = {
+	.left = T4KA3_ACTIVE_START_LEFT,
+	.top = T4KA3_ACTIVE_START_TOP,
+	.width = T4KA3_ACTIVE_WIDTH,
+	.height = T4KA3_ACTIVE_HEIGHT,
+};
+
+static int t4ka3_detect(struct t4ka3_data *sensor, u16 *id);
+
+static void t4ka3_set_bayer_order(struct t4ka3_data *sensor,
+				  struct v4l2_mbus_framefmt *fmt)
+{
+	int hv_flip = 0;
+
+	if (sensor->ctrls.vflip && sensor->ctrls.vflip->val)
+		hv_flip += 1;
+
+	if (sensor->ctrls.hflip && sensor->ctrls.hflip->val)
+		hv_flip += 2;
+
+	fmt->code = t4ka3_hv_flip_bayer_order[hv_flip];
+}
+
+static struct v4l2_mbus_framefmt *t4ka3_get_active_format(struct t4ka3_data *sensor)
+{
+	struct v4l2_subdev_state *active_state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+
+	return v4l2_subdev_state_get_format(active_state, 0);
+}
+
+static struct v4l2_rect *t4ka3_get_active_crop(struct t4ka3_data *sensor)
+{
+	struct v4l2_subdev_state *active_state =
+		v4l2_subdev_get_locked_active_state(&sensor->sd);
+
+	return v4l2_subdev_state_get_crop(active_state, 0);
+}
+
+static int t4ka3_update_exposure_range(struct t4ka3_data *sensor)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = t4ka3_get_active_format(sensor);
+
+	int exp_max = fmt->height + sensor->ctrls.vblank->val -
+		      T4KA3_COARSE_INTEGRATION_TIME_MARGIN;
+
+	return __v4l2_ctrl_modify_range(sensor->ctrls.exposure, 0, exp_max,
+					1, exp_max);
+}
+
+static void t4ka3_fill_format(struct t4ka3_data *sensor,
+			      struct v4l2_mbus_framefmt *fmt,
+			      unsigned int width, unsigned int height)
+{
+	memset(fmt, 0, sizeof(*fmt));
+	fmt->width = width;
+	fmt->height = height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	t4ka3_set_bayer_order(sensor, fmt);
+}
+
+static void t4ka3_calc_mode(struct t4ka3_data *sensor)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_rect *crop;
+	int width;
+	int height;
+	int binning;
+
+	fmt = t4ka3_get_active_format(sensor);
+	crop = t4ka3_get_active_crop(sensor);
+
+	width = fmt->width;
+	height = fmt->height;
+
+	if (width <= (crop->width / 2) && height <= (crop->height / 2))
+		binning = 2;
+	else
+		binning = 1;
+
+	width *= binning;
+	height *= binning;
+
+	sensor->mode.binning = binning;
+	sensor->mode.win_x = (crop->left + (crop->width - width) / 2) & ~1;
+	sensor->mode.win_y = (crop->top + (crop->height - height) / 2) & ~1;
+	/*
+	 * t4ka3's window is done after binning, but must still be a multiple of 2 ?
+	 * Round up to avoid top 2 black lines in 1640x1230 (quarter res) case.
+	 */
+	sensor->mode.win_x = DIV_ROUND_UP(sensor->mode.win_x, binning);
+	sensor->mode.win_y = DIV_ROUND_UP(sensor->mode.win_y, binning);
+}
+
+static void t4ka3_get_vblank_limits(struct t4ka3_data *sensor, int *min, int *max, int *def)
+{
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = t4ka3_get_active_format(sensor);
+
+	*min = T4KA3_MIN_VBLANK + (sensor->mode.binning - 1) * fmt->height;
+	*max = T4KA3_MAX_VBLANK - fmt->height;
+	*def = T4KA3_LINES_PER_FRAME_30FPS - fmt->height;
+}
+
+static int t4ka3_set_pad_format(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_format *format)
+{
+	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
+	struct v4l2_mbus_framefmt *try_fmt;
+	struct v4l2_mbus_framefmt *fmt;
+	const struct v4l2_rect *crop;
+	unsigned int width, height;
+	int min, max, def, ret = 0;
+
+	crop = t4ka3_get_active_crop(sensor);
+	fmt = t4ka3_get_active_format(sensor);
+
+	/* Limit set_fmt max size to crop width / height */
+	width = clamp_val(ALIGN(format->format.width, 2),
+			  T4KA3_MIN_CROP_WIDTH, crop->width);
+	height = clamp_val(ALIGN(format->format.height, 2),
+			   T4KA3_MIN_CROP_HEIGHT, crop->height);
+	t4ka3_fill_format(sensor, &format->format, width, height);
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
+		try_fmt = v4l2_subdev_state_get_format(sd_state, 0);
+		*try_fmt = format->format;
+		return 0;
+	}
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && sensor->streaming)
+		return -EBUSY;
+
+	*v4l2_subdev_state_get_format(sd_state, 0) = format->format;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	t4ka3_calc_mode(sensor);
+
+	/* vblank range is height dependent adjust and reset to default */
+	t4ka3_get_vblank_limits(sensor, &min, &max, &def);
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank, min, max, 1, def);
+	if (ret)
+		return ret;
+
+	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.vblank, def);
+	if (ret)
+		return ret;
+
+	def = T4KA3_ACTIVE_WIDTH - fmt->width;
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, def, def, 1, def);
+	if (ret)
+		return ret;
+	ret = __v4l2_ctrl_s_ctrl(sensor->ctrls.hblank, def);
+	if (ret)
+		return ret;
+
+	/* exposure range depends on vts which may have changed */
+	ret = t4ka3_update_exposure_range(sensor);
+
+	return ret;
+}
+
+/* Horizontal or vertically flip the image */
+static int t4ka3_t_vflip(struct v4l2_subdev *sd, int value, u8 flip_bit)
+{
+	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
+	struct v4l2_mbus_framefmt *fmt;
+	int ret;
+	u64 val;
+
+	if (sensor->streaming)
+		return -EBUSY;
+
+	val = value ? flip_bit : 0;
+
+	ret = cci_update_bits(sensor->regmap, T4KA3_REG_IMG_ORIENTATION,
+			      flip_bit, val, NULL);
+	if (ret)
+		return ret;
+
+	fmt = t4ka3_get_active_format(sensor);
+	t4ka3_set_bayer_order(sensor, fmt);
+	return 0;
+}
+
+static int t4ka3_test_pattern(struct t4ka3_data *sensor, s32 value)
+{
+	return cci_write(sensor->regmap, T4KA3_REG_TEST_PATTERN_MODE, value, NULL);
+}
+
+static int t4ka3_detect(struct t4ka3_data *sensor, u16 *id)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
+	struct i2c_adapter *adapter = client->adapter;
+	u64 high, low;
+	int ret = 0;
+
+	/* i2c check */
+	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
+		return -ENODEV;
+
+	/* check sensor chip ID	 */
+	cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_HIGH, &high, &ret);
+	cci_read(sensor->regmap, T4KA3_REG_PRODUCT_ID_LOW, &low, &ret);
+	if (ret)
+		return ret;
+
+	*id = (((u8)high) << 8) | (u8)low;
+	if (*id != T4KA3_PRODUCT_ID) {
+		dev_err(sensor->dev, "main sensor t4ka3 ID error\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int t4ka3_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct t4ka3_data *sensor = ctrl_to_t4ka3(ctrl);
+	struct v4l2_mbus_framefmt *fmt;
+	int ret;
+
+	/* Update exposure range on vblank changes */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		ret = t4ka3_update_exposure_range(sensor);
+		if (ret)
+			return ret;
+	}
+
+	fmt = t4ka3_get_active_format(sensor);
+
+	/* Only apply changes to the controls if the device is powered up */
+	if (!pm_runtime_get_if_in_use(sensor->sd.dev)) {
+		t4ka3_set_bayer_order(sensor, fmt);
+		return 0;
+	}
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		ret = t4ka3_test_pattern(sensor, ctrl->val);
+		break;
+	case V4L2_CID_VFLIP:
+		ret = t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_VFLIP_BIT);
+		break;
+	case V4L2_CID_HFLIP:
+		ret = t4ka3_t_vflip(&sensor->sd, ctrl->val, T4KA3_HFLIP_BIT);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES,
+				fmt->height + ctrl->val, NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(sensor->regmap, T4KA3_REG_COARSE_INTEGRATION_TIME,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(sensor->regmap, T4KA3_REG_GLOBAL_GAIN,
+				ctrl->val, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(sensor->sd.dev);
+	return ret;
+}
+
+static int t4ka3_set_mode(struct t4ka3_data *sensor)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
+
+	fmt = t4ka3_get_active_format(sensor);
+
+	cci_write(sensor->regmap, T4KA3_REG_HORZ_OUTPUT_SIZE, fmt->width, &ret);
+	/* Write mode-height - 2 otherwise things don't work, hw-bug ? */
+	cci_write(sensor->regmap, T4KA3_REG_VERT_OUTPUT_SIZE, fmt->height - 2, &ret);
+	/* Note overwritten by __v4l2_ctrl_handler_setup() based on vblank ctrl */
+	cci_write(sensor->regmap, T4KA3_REG_FRAME_LENGTH_LINES, T4KA3_LINES_PER_FRAME_30FPS, &ret);
+	cci_write(sensor->regmap, T4KA3_REG_PIXELS_PER_LINE, T4KA3_PIXELS_PER_LINE, &ret);
+	/* Always use the full sensor, using window to crop */
+	cci_write(sensor->regmap, T4KA3_REG_HORZ_START, 0, &ret);
+	cci_write(sensor->regmap, T4KA3_REG_VERT_START, 0, &ret);
+	cci_write(sensor->regmap, T4KA3_REG_HORZ_END, T4KA3_NATIVE_WIDTH - 1, &ret);
+	cci_write(sensor->regmap, T4KA3_REG_VERT_END, T4KA3_NATIVE_HEIGHT - 1, &ret);
+	/* Set window */
+	cci_write(sensor->regmap, T4KA3_REG_WIN_START_X, sensor->mode.win_x, &ret);
+	cci_write(sensor->regmap, T4KA3_REG_WIN_START_Y, sensor->mode.win_y, &ret);
+	cci_write(sensor->regmap, T4KA3_REG_WIN_WIDTH, fmt->width, &ret);
+	cci_write(sensor->regmap, T4KA3_REG_WIN_HEIGHT, fmt->height, &ret);
+	/* Write 1 to unknown register 0x0900 */
+	cci_write(sensor->regmap, T4KA3_REG_0900, 1, &ret);
+	cci_write(sensor->regmap, T4KA3_REG_BINNING, T4KA3_BINNING_VAL(sensor->mode.binning), &ret);
+
+	return ret;
+}
+
+static int t4ka3_enable_stream(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+			       u32 pad, u64 streams_mask)
+{
+	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
+	int ret;
+
+	ret = pm_runtime_get_sync(sensor->sd.dev);
+	if (ret < 0) {
+		dev_err(sensor->dev, "power-up err.\n");
+		goto error_exit;
+	}
+
+	cci_multi_reg_write(sensor->regmap, t4ka3_init_config,
+			    ARRAY_SIZE(t4ka3_init_config), &ret);
+	/* enable group hold */
+	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 1, &ret);
+	cci_multi_reg_write(sensor->regmap, t4ka3_pre_mode_set_regs,
+			    ARRAY_SIZE(t4ka3_pre_mode_set_regs), &ret);
+	if (ret)
+		goto error_powerdown;
+
+	ret = t4ka3_set_mode(sensor);
+	if (ret)
+		goto error_powerdown;
+
+	ret = cci_multi_reg_write(sensor->regmap, t4ka3_post_mode_set_regs,
+				  ARRAY_SIZE(t4ka3_post_mode_set_regs), NULL);
+	if (ret)
+		goto error_powerdown;
+
+	/* Restore value of all ctrls */
+	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+	if (ret)
+		goto error_powerdown;
+
+	/* disable group hold */
+	cci_write(sensor->regmap, T4KA3_REG_PARAM_HOLD, 0, &ret);
+	cci_write(sensor->regmap, T4KA3_REG_STREAM, 1, &ret);
+	if (ret)
+		goto error_powerdown;
+
+	sensor->streaming = 1;
+
+	return ret;
+
+error_powerdown:
+	pm_runtime_put(sensor->sd.dev);
+error_exit:
+	return ret;
+}
+
+static int t4ka3_disable_stream(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				u32 pad, u64 streams_mask)
+{
+	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
+	int ret;
+
+	ret = cci_write(sensor->regmap, T4KA3_REG_STREAM, 0, NULL);
+	pm_runtime_put(sensor->sd.dev);
+	sensor->streaming = 0;
+	return ret;
+}
+
+static int t4ka3_get_selection(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
+		break;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = T4KA3_NATIVE_WIDTH;
+		sel->r.height = T4KA3_NATIVE_HEIGHT;
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r = t4ka3_default_crop;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int t4ka3_set_selection(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_selection *sel)
+{
+	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+	struct v4l2_rect rect;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	/*
+	 * Clamp the boundaries of the crop rectangle to the size of the sensor
+	 * pixel array. Align to multiples of 2 to ensure Bayer pattern isn't
+	 * disrupted.
+	 */
+	rect.left = clamp_val(ALIGN(sel->r.left, 2),
+			      T4KA3_NATIVE_START_LEFT, T4KA3_NATIVE_WIDTH);
+	rect.top = clamp_val(ALIGN(sel->r.top, 2),
+			     T4KA3_NATIVE_START_TOP, T4KA3_NATIVE_HEIGHT);
+	rect.width = clamp_val(ALIGN(sel->r.width, 2),
+			       T4KA3_MIN_CROP_WIDTH, T4KA3_NATIVE_WIDTH);
+	rect.height = clamp_val(ALIGN(sel->r.height, 2),
+				T4KA3_MIN_CROP_HEIGHT, T4KA3_NATIVE_HEIGHT);
+
+	/* Make sure the crop rectangle isn't outside the bounds of the array */
+	rect.width = min_t(unsigned int, rect.width,
+			   T4KA3_NATIVE_WIDTH - rect.left);
+	rect.height = min_t(unsigned int, rect.height,
+			    T4KA3_NATIVE_HEIGHT - rect.top);
+
+	crop = v4l2_subdev_state_get_crop(state, sel->pad);
+
+	*crop = rect;
+
+	if (rect.width != crop->width || rect.height != crop->height) {
+		/*
+		 * Reset the output image size if the crop rectangle size has
+		 * been modified.
+		 */
+		format = v4l2_subdev_state_get_format(state, sel->pad);
+		format->width = rect.width;
+		format->height = rect.height;
+		if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+			t4ka3_calc_mode(sensor);
+	}
+
+	sel->r = rect;
+
+	return 0;
+}
+
+static int
+t4ka3_enum_mbus_code(struct v4l2_subdev *sd,
+		     struct v4l2_subdev_state *sd_state,
+		     struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	return 0;
+}
+
+static int t4ka3_enum_frame_size(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct v4l2_rect *crop;
+
+	if (fse->index >= T4KA3_FRAME_SIZES)
+		return -EINVAL;
+
+	crop = v4l2_subdev_state_get_crop(sd_state, fse->pad);
+	if (!crop)
+		return -EINVAL;
+
+	fse->min_width = crop->width / (fse->index + 1);
+	fse->min_height = crop->height / (fse->index + 1);
+	fse->max_width = fse->min_width;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int t4ka3_check_hwcfg(struct t4ka3_data *sensor)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(sensor->dev);
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct fwnode_handle *endpoint;
+	unsigned long link_freq_bitmap;
+	int ret;
+
+	/*
+	 * Sometimes the fwnode graph is initialized by the bridge driver.
+	 * Bridge drivers doing this may also add GPIO mappings, wait for this.
+	 */
+	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!endpoint)
+		return dev_err_probe(sensor->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
+	fwnode_handle_put(endpoint);
+	if (ret)
+		return ret;
+
+	ret = v4l2_link_freq_to_bitmap(sensor->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items),
+				       &link_freq_bitmap);
+
+	if (ret == -ENOENT) {
+		dev_err_probe(sensor->dev, -ENOENT,
+			      "No match found between driver-supported link frequencies.\n");
+		goto out_free_bus_cfg;
+	}
+
+	if (ret == -ENODATA) {
+		dev_err_probe(sensor->dev, -ENODATA,
+			      "No link frequency was specified in the firmware.\n");
+		goto out_free_bus_cfg;
+	}
+
+	sensor->link_freq_index = ffs(link_freq_bitmap) - 1;
+
+	/* 4 MIPI lanes */
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+		ret = dev_err_probe(sensor->dev, -EINVAL,
+				    "number of CSI2 data lanes %u is not supported\n",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
+		goto out_free_bus_cfg;
+	}
+
+	sensor->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+
+out_free_bus_cfg:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int t4ka3_init_state(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *sd_state)
+{
+	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
+
+	*v4l2_subdev_state_get_crop(sd_state, 0) = t4ka3_default_crop;
+
+	t4ka3_fill_format(sensor, v4l2_subdev_state_get_format(sd_state, 0),
+			  T4KA3_ACTIVE_WIDTH, T4KA3_ACTIVE_HEIGHT);
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops t4ka3_ctrl_ops = {
+	.s_ctrl = t4ka3_s_ctrl,
+};
+
+static const struct v4l2_subdev_video_ops t4ka3_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops t4ka3_pad_ops = {
+	.enum_mbus_code = t4ka3_enum_mbus_code,
+	.enum_frame_size = t4ka3_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = t4ka3_set_pad_format,
+	.get_selection = t4ka3_get_selection,
+	.set_selection = t4ka3_set_selection,
+	.enable_streams = t4ka3_enable_stream,
+	.disable_streams = t4ka3_disable_stream,
+};
+
+static const struct v4l2_subdev_ops t4ka3_ops = {
+	.video = &t4ka3_video_ops,
+	.pad = &t4ka3_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops t4ka3_internal_ops = {
+	.init_state = t4ka3_init_state,
+};
+
+static int t4ka3_init_controls(struct t4ka3_data *sensor)
+{
+	const struct v4l2_ctrl_ops *ops = &t4ka3_ctrl_ops;
+	struct t4ka3_ctrls *ctrls = &sensor->ctrls;
+	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct v4l2_fwnode_device_properties props;
+	int ret, min, max, def;
+	static const char * const test_pattern_menu[] = {
+		"Disabled",
+		"Solid White",
+		"Color Bars",
+		"Gradient",
+		"Random Data",
+	};
+
+	v4l2_ctrl_handler_init(hdl, 11);
+
+	hdl->lock = &sensor->lock;
+
+	ctrls->vflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	ctrls->hflip = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
+							   V4L2_CID_TEST_PATTERN,
+							   ARRAY_SIZE(test_pattern_menu) - 1,
+							   0, 0, test_pattern_menu);
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID_LINK_FREQ,
+						  0, 0, sensor->link_freq);
+	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL_RATE,
+					      0, T4KA3_PIXEL_RATE,
+					      1, T4KA3_PIXEL_RATE);
+
+	v4l2_subdev_lock_state(sensor->sd.active_state);
+	t4ka3_calc_mode(sensor);
+	t4ka3_get_vblank_limits(sensor, &min, &max, &def);
+	v4l2_subdev_unlock_state(sensor->sd.active_state);
+
+	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK, min, max, 1, def);
+
+	def = T4KA3_ACTIVE_WIDTH;
+	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
+					  def, def, 1, def);
+
+	max = T4KA3_LINES_PER_FRAME_30FPS - T4KA3_COARSE_INTEGRATION_TIME_MARGIN;
+	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
+					    0, max, 1, max);
+
+	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
+					T4KA3_MIN_GLOBAL_GAIN_SUPPORTED,
+					T4KA3_MAX_GLOBAL_GAIN_SUPPORTED,
+					1, T4KA3_MIN_GLOBAL_GAIN_SUPPORTED);
+
+	ret = v4l2_fwnode_device_parse(sensor->dev, &props);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
+
+	if (hdl->error)
+		return hdl->error;
+
+	ctrls->vflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	ctrls->hflip->flags |= V4L2_CTRL_FLAG_MODIFY_LAYOUT;
+	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	sensor->sd.ctrl_handler = hdl;
+	return 0;
+}
+
+static int t4ka3_pm_suspend(struct device *dev)
+{
+	struct t4ka3_data *sensor = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(sensor->powerdown_gpio, 1);
+	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
+
+	return 0;
+}
+
+static int t4ka3_pm_resume(struct device *dev)
+{
+	struct t4ka3_data *sensor = dev_get_drvdata(dev);
+	u16 sensor_id;
+	int ret;
+
+	usleep_range(5000, 6000);
+
+	gpiod_set_value_cansleep(sensor->powerdown_gpio, 0);
+	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
+
+	/* waiting for the sensor after powering up */
+	msleep(20);
+
+	ret = t4ka3_detect(sensor, &sensor_id);
+	if (ret) {
+		dev_err(sensor->dev, "sensor detect failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(t4ka3_pm_ops, t4ka3_pm_suspend, t4ka3_pm_resume, NULL);
+
+static void t4ka3_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct t4ka3_data *sensor = to_t4ka3_sensor(sd);
+
+	v4l2_async_unregister_subdev(&sensor->sd);
+	media_entity_cleanup(&sensor->sd.entity);
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+
+	/*
+	 * Disable runtime PM. In case runtime PM is disabled in the kernel,
+	 * make sure to turn power off manually.
+	 */
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		t4ka3_pm_suspend(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static int t4ka3_probe(struct i2c_client *client)
+{
+	struct t4ka3_data *sensor;
+	int ret;
+
+	/* allocate sensor device & init sub device */
+	sensor = devm_kzalloc(&client->dev, sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor->dev = &client->dev;
+
+	ret = t4ka3_check_hwcfg(sensor);
+	if (ret)
+		return ret;
+
+	mutex_init(&sensor->lock);
+
+	sensor->link_freq[0] = T4KA3_LINK_FREQ;
+
+	v4l2_i2c_subdev_init(&sensor->sd, client, &t4ka3_ops);
+	sensor->sd.internal_ops = &t4ka3_internal_ops;
+
+	sensor->powerdown_gpio = devm_gpiod_get(&client->dev, "powerdown",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->powerdown_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(sensor->powerdown_gpio),
+				     "getting powerdown GPIO\n");
+
+	sensor->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(sensor->reset_gpio),
+				     "getting reset GPIO\n");
+
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap))
+		return PTR_ERR(sensor->regmap);
+
+	ret = t4ka3_pm_resume(sensor->dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_get_noresume(&client->dev);
+	pm_runtime_enable(&client->dev);
+
+	sensor->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
+	sensor->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	ret = media_entity_pads_init(&sensor->sd.entity, 1, &sensor->pad);
+	if (ret)
+		goto err_media_entity;
+
+	sensor->sd.state_lock = sensor->ctrls.handler.lock;
+	ret = v4l2_subdev_init_finalize(&sensor->sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to init subdev: %d", ret);
+		goto err_subdev_entry;
+	}
+
+	ret = t4ka3_init_controls(sensor);
+	if (ret)
+		goto err_controls;
+
+	ret = v4l2_async_register_subdev_sensor(&sensor->sd);
+	if (ret)
+		goto err_subdev_entry;
+
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
+
+	return 0;
+
+err_subdev_entry:
+	v4l2_subdev_cleanup(&sensor->sd);
+
+err_controls:
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+
+err_media_entity:
+	media_entity_cleanup(&sensor->sd.entity);
+	pm_runtime_disable(&client->dev);
+	pm_runtime_put_noidle(&client->dev);
+
+	return ret;
+}
+
+static struct acpi_device_id t4ka3_acpi_match[] = {
+	{ "XMCC0003" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, t4ka3_acpi_match);
+
+static struct i2c_driver t4ka3_driver = {
+	.driver = {
+		.name = "t4ka3",
+		.acpi_match_table = ACPI_PTR(t4ka3_acpi_match),
+		.pm = pm_sleep_ptr(&t4ka3_pm_ops),
+	},
+	.probe = t4ka3_probe,
+	.remove = t4ka3_remove,
+};
+module_i2c_driver(t4ka3_driver)
+
+MODULE_DESCRIPTION("A low-level driver for T4KA3 sensor");
+MODULE_AUTHOR("HARVEY LV <harvey.lv@intel.com>");
+MODULE_AUTHOR("Kate Hsuan <hpa@redhat.com>");
+MODULE_LICENSE("GPL");
-- 
2.51.0


