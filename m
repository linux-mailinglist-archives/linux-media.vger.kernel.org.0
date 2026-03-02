Return-Path: <linux-media+bounces-54109-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sByGG5LEpWnEFgAAu9opvQ
	(envelope-from <linux-media+bounces-54109-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 18:10:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 725631DD938
	for <lists+linux-media@lfdr.de>; Mon, 02 Mar 2026 18:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D587301091E
	for <lists+linux-media@lfdr.de>; Mon,  2 Mar 2026 17:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9836C426685;
	Mon,  2 Mar 2026 17:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsjOWPbL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEAE425CE3
	for <linux-media@vger.kernel.org>; Mon,  2 Mar 2026 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470828; cv=none; b=ofgDHejq+z3zSfDHzUxtRBV+j/iqUqVQMTXsb2kxnVFk9UZeReEYOaR0BWO6Zs5l26MvjRuNz7oG4j5FPGgJp2+mkk8ihvtk+vmODAZQQKz1e9UPrUMHbP2B8DVDIa20r2b3+fKN7rQic1fmdbf0OE/A6H5WxT1Ah3iM80V0Yks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470828; c=relaxed/simple;
	bh=tYaNj1YN54sx5xwKn7lJ33hsDNCSZMJSdgR2Zs2EQv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9/PWGRvh/f2vdFr2eZ2/vQAwBfzyJ0fFtPsDbg2bLCV+8PDDCXnmFQBsFQFqRLSbgybCOUr9MSo0E3+fKBhmpGM6Kn73sjXhvYoM1anwgRfSKY6simzjcL45+MMfuHwbtppul9hsNk5Ka6fNMf7lsrJvZZ95bqpvrDBMT19m6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsjOWPbL; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38704f70ea3so80218771fa.2
        for <linux-media@vger.kernel.org>; Mon, 02 Mar 2026 09:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772470823; x=1773075623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zA6opmljdDT8EoYVUck6/Hb5utuSSAdgnmSlN82J4go=;
        b=CsjOWPbL+Fk1F2eD6SZwB/83CpjNt1/ZYIs6R7XaJQlQiu0CnxuE2N4c3hwqZCa2iB
         vhBbrUGOn/BBuqs4X5aGHtKFU7nIRmMaZ7tLHkFbtBixD9bGAMxGBGn30ic8xZkzG18a
         PFn28YnWl0ekDfb/8cDCK/e2Mm1BPuvXlZ2eH3HinBiGE2udTmaL77/RDqpPaw2RzDYb
         4Adih37jX5Sy8PCREa6tbOKgTBN6IOLypWV1z4UNEL2pUWE23aDSYYPjnGQsoEsavWH3
         Jf44rQZuFE34xAkIMSYq/Aizb3WuaYgJvLSOBtg3GlL7VQy071uAIOjn0jXIGWVGuzuB
         4LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772470823; x=1773075623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA6opmljdDT8EoYVUck6/Hb5utuSSAdgnmSlN82J4go=;
        b=BQyIszakELh0k9ZBcOUHW1BSJ3rcfR0De/eCOBIh3S1AhupuWlauFvWLMHDCAMDoGZ
         DlUX+VvBkiY70ix/wwgqyBVxtqXhRK7jDWR+jA9JosM2EAVxGi10jiBkvU+oLlEAb3aw
         KZQMNIGtad57ud2QP8Mu7mVoZFQv0rU/zlad+zHsOBd3IAuDXvhZrulhs3aukxWACG5m
         SGKyziYPeTq4g9c/APHlhQ2doqEQ9R1uMbMrQRfEu+EGfLM6GemRJviYEzrTCpS/J5k4
         4UydX5W+dbtdUwkNdKwiyac/jDWb0O0mV891j+2+BIpHapzajauIv6ygqrWMuJ8DCSrN
         Z+5w==
X-Gm-Message-State: AOJu0YzSvfnpReezuauV8f9N8PtpIwHY+Hi+IBr2T8iqVFIDI0VxU0CL
	N2zu9WQ4E/BKLXYhaPHBcKql8ceupfyrOQj48Ku5jx1WqMnOBVs6cop6Y01lhg==
X-Gm-Gg: ATEYQzwbK/FtGuNWz2r6WojA9A5mVc/WtH2NkfjqvF30AnfQXb2QU97fJ26J8akZYri
	30FtdHdENFk0oDp9lG5sTWzA02a5eGd/ocUtwyGmxqWAuTOBxiJ3LHFTbxYqd0wk+HVkB6jMVBb
	ZW7xoprZ3HmpCrXYLrBODoXNZ93FMHr5mEoO33mtS2q1TzbGwTyQqLsHYAJmZq8Z5CfF76JsQFL
	Y4tjSoKKuQWu2G8sUFhrAJbRWQuyYOjw5F9d26lirr8qnMx6s/xeJOvKv1n8opMe8entjBrQeVw
	CAp6zLwc0yEniQwVcgh8h3xRJrj7RcjpGUVf01L3ar7S443A9ddWENllvwtFEG6qDRlRru+B6q2
	2taGAPA5YxZjdLywsqg3Jyztf9DOijKH3/RBhlRf7Ispot/0MjFWK1HQUXxlCBP9BsCDl1hKY5d
	SdHJkNq283EpXg/tqKyn5wj5v1I5CWJMtp8wp27LI=
X-Received: by 2002:a05:651c:509:b0:383:b9d9:3fdd with SMTP id 38308e7fff4ca-389ff366abemr101777171fa.34.1772470822360;
        Mon, 02 Mar 2026 09:00:22 -0800 (PST)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357ceebsm13523e87.44.2026.03.02.09.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:00:20 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH RFC] media: i2c: Add AR0234 camera sensor driver
Date: Mon,  2 Mar 2026 19:59:32 +0300
Message-ID: <20260302165932.2408181-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 725631DD938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[raspberrypi.com,intel.com,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54109-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email,raspberrypi.com:email]
X-Rspamd-Action: no action

I would like to propose a driver for the ON Semiconductor AR0234 CMOS image sensor. This driver supports 10-bit raw Bayer output at 1920x1080 resolution up to 120 fps (tested with 4-lane MIPI CSI-2). It has been developed and tested on a platform with 27 MHz external clock.
The driver is based on the initial work by Dave Stevenson and Danius Kalvaitis from the Raspberry Pi team, and later extended by UAB Kurokesu. It also incorporates ideas from an Intel-authored version (Yan Dongcheng, Hao Yao) that attempted to use the latest sensor framework features. Unfortunately, neither of those external versions worked on my hardware, so I decided to create this consolidated version that does work for my setup.

Key features:
- Supports 10-bit raw Bayer (SGRBG10) at 1920x1200 (120 fps).
- PLL configuration using the common CCS PLL framework.
- V4L2 controls for exposure, analogue gain, digital gain, HBLANK, VBLANK, test patterns, and flips.
- Runtime PM support.
- Device tree probing.

However, there are a few areas where I would appreciate feedback and help:
- V4L2_CID_PIXEL_RATE handling: I am not entirely satisfied with the current implementation. The pixel rate depends on the number of lanes and the link frequency. Ideally it should be updated automatically when the link frequency changes (and when the bpp changes, though the sensor only supports 10-bit for now). I would like to make it a read-only control that always reflects the actual pixel rate, but I'm not sure about the best way to integrate it with the PLL calculations and the link_freq menu. Any guidance would be welcome.
- V4L2_CID_LINK_FREQ support: The driver currently includes a link frequency control, but it is not fully dynamic. The PLL is calculated only at probe and when the link frequency is changed via the control (which is currently disabled). I'd like to make it fully functional: when the user selects a different link frequency from the menu, the PLL should be recalculated and the sensor re-initialized accordingly. However, I'm unsure how to handle this cleanly. Any advice on the proper way to manage this would be greatly appreciated.
The driver is functional for my use case (1920x1200 @ 120 fps with 4 lanes, 27 MHz XCLK), but I believe it could be improved with community input. I am sending this as an RFC to gather feedback and hopefully move towards a mainline-ready driver.

Thank you for any suggestions.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/media/i2c/Kconfig  |   11 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/ar0234.c | 1083 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1095 insertions(+)
 create mode 100644 drivers/media/i2c/ar0234.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 0db8a0add289..1edc2db83f73 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -62,6 +62,17 @@ config VIDEO_AP1302
 	  This is a Video4Linux2 sensor-level driver for the external
 	  ISP AP1302.
 
+config VIDEO_AR0234
+	tristate "ON Semiconductor AR0234 sensor support"
+	select V4L2_CCI_I2C
+	select VIDEO_CCS_PLL
+	help
+	  This is a Video4Linux2 sensor driver for the ON Semiconductor
+	  AR0234 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ar0234.
+
 config VIDEO_AR0521
 	tristate "ON Semiconductor AR0521 sensor support"
 	help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 905ed0f675b8..35e6ccbe16d9 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_VIDEO_AK881X) += ak881x.o
 obj-$(CONFIG_VIDEO_ALVIUM_CSI2) += alvium-csi2.o
 obj-$(CONFIG_VIDEO_AP1302) += ap1302.o
 obj-$(CONFIG_VIDEO_APTINA_PLL) += aptina-pll.o
+obj-$(CONFIG_VIDEO_AR0234) += ar0234.o
 obj-$(CONFIG_VIDEO_AR0521) += ar0521.o
 obj-$(CONFIG_VIDEO_BT819) += bt819.o
 obj-$(CONFIG_VIDEO_BT856) += bt856.o
diff --git a/drivers/media/i2c/ar0234.c b/drivers/media/i2c/ar0234.c
new file mode 100644
index 000000000000..99f3fbef33e5
--- /dev/null
+++ b/drivers/media/i2c/ar0234.c
@@ -0,0 +1,1083 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the AR0234 camera sensor from ON Semiconductor
+ *
+ * Written by Alexander Shiyan <eagle.alexander923@gmail.com>
+ *
+ * Some parts of code taken from ar0234.c by:
+ * Dave Stevenson <dave.stevenson@raspberrypi.com>
+ * Danius Kalvaitis <danius@kurokesu.com>
+ *
+ * Some parts of code taken from imx290.c by:
+ * Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#include "ccs-pll.h"
+
+#define AR0234_REG_CHIP_VERSION				CCI_REG16(0x3000)
+#	define AR0234_CHIP_ID				(0x0a56)
+#	define AR0234_CHIP_ID_MONO			(0x1a56)
+#define AR0234_REG_Y_ADDR_START				CCI_REG16(0x3002)
+#define AR0234_REG_X_ADDR_START				CCI_REG16(0x3004)
+#define AR0234_REG_Y_ADDR_END				CCI_REG16(0x3006)
+#define AR0234_REG_X_ADDR_END				CCI_REG16(0x3008)
+#define AR0234_REG_FRAME_LENGTH_LINES			CCI_REG16(0x300a)
+#	define AR0234_VBLANK_MIN			(16)
+#	define AR0234_VBLANK_MAX			(0xfff0)
+#define AR0234_REG_LINE_LENGTH_PCK			CCI_REG16(0x300c)
+#	define AR0234_HBLANK_MIN			(4)
+#	define AR0234_HBLANK_DEF			(612)
+#	define AR0234_HBLANK_MAX			(0xfff0)
+#define AR0234_REG_REVISION_NUMBER			CCI_REG16(0x300e)
+#define AR0234_REG_LOCK_CONTROL				CCI_REG16(0x3010)
+#	define LOCK_CONTROL_MAGIC			(0xbeef)
+#define AR0234_REG_COARSE_INTEGRATION_TIME		CCI_REG16(0x3012)
+#	define AR0234_EXPOSURE_MIN			(2)
+#	define AR0234_EXPOSURE_STEP			(1)
+#define AR0234_REG_FINE_INTEGRATION_TIME		CCI_REG16(0x3014)
+#define AR0234_REG_RESET				CCI_REG16(0x301a)
+#define AR0234_REG_MODE_SELECT				CCI_REG8(0x301c)
+#define AR0234_REG_IMAGE_ORIENTATION			CCI_REG8(0x301d)
+#define AR0234_REG_GROUPED_PARAMETER_HOLD		CCI_REG8(0x3022)
+#define AR0234_REG_VT_PIX_CLK_DIV			CCI_REG16(0x302a)
+#define AR0234_REG_VT_SYS_CLK_DIV			CCI_REG16(0x302c)
+#define AR0234_REG_PRE_PLL_CLK_DIV			CCI_REG16(0x302e)
+#define AR0234_REG_PLL_MULTIPLIER			CCI_REG16(0x3030)
+#define AR0234_REG_OP_PIX_CLK_DIV			CCI_REG16(0x3036)
+#define AR0234_REG_OP_SYS_CLK_DIV			CCI_REG16(0x3038)
+#define AR0234_REG_GLOBAL_GAIN				CCI_REG16(0x305e)
+#	define AR0234_DGTL_GAIN_MIN			(0x0080)
+#	define AR0234_DGTL_GAIN_MAX			(0x07ff)
+#	define AR0234_DGTL_GAIN_DEFAULT			(0x0080)
+#	define AR0234_DGTL_GAIN_STEP			(1)
+#define AR0234_REG_ANALOG_GAIN				CCI_REG16(0x3060)
+#	define AR0234_ANA_GAIN_BASE			(64)
+#	define AR0234_ANA_GAIN_MIN			(AR0234_ANA_GAIN_BASE)
+#	define AR0234_ANA_GAIN_MAX			(16 * AR0234_ANA_GAIN_BASE)
+#	define AR0234_ANA_GAIN_STEP			(1)
+#	define AR0234_ANA_GAIN_DEFAULT			(AR0234_ANA_GAIN_BASE)
+#define AR0234_REG_TEST_PATTERN_MODE			CCI_REG16(0x3070)
+#	define AR0234_TEST_PATTERN_DISABLED		(0)
+#	define AR0234_TEST_PATTERN_SOLID_COLOR		(1)
+#	define AR0234_TEST_PATTERN_VERTICAL_COLOR_BARS	(2)
+#	define AR0234_TEST_PATTERN_FADE_TO_GREY		(3)
+#	define AR0234_TEST_PATTERN_WALKING_1S		(256)
+#define AR0234_REG_TEST_DATA_RED			CCI_REG16(0x3072)
+#define AR0234_REG_TEST_DATA_GREENR			CCI_REG16(0x3074)
+#define AR0234_REG_TEST_DATA_BLUE			CCI_REG16(0x3076)
+#define AR0234_REG_TEST_DATA_GREENB			CCI_REG16(0x3078)
+#	define AR0234_TESTP_COLOUR_MIN			(0)
+#	define AR0234_TESTP_COLOUR_MAX			(0x3ff)
+#	define AR0234_TESTP_COLOUR_STEP			(1)
+#define AR0234_REG_MFR_30BA				CCI_REG16(0x30ba)
+#	define AR0234_MFR_30BA_GAIN_BITS(x)		(0x7620 | (x))
+#define AR0234_REG_DATA_FORMAT_BITS			CCI_REG16(0x31ac)
+#	define DATA_FORMAT_BITS(x)			(((x) << 8) | (x))
+#define AR0234_REG_SERIAL_FORMAT			CCI_REG16(0x31ae)
+#	define DATA_FORMAT_LINES(x)			(0x200 | (x))
+
+#define AR0234_NATIVE_WIDTH				(1940U)
+#define AR0234_NATIVE_HEIGHT				(1220U)
+#define AR0234_PIXEL_ARRAY_WIDTH			(1920U)
+#define AR0234_PIXEL_ARRAY_HEIGHT			(1200U)
+
+struct reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
+struct ar0234_format {
+	unsigned int width;
+	unsigned int height;
+	struct reg_list reg_list;
+};
+
+static const struct cci_reg_sequence ar0234_common_init[] = {
+	{ AR0234_REG_FINE_INTEGRATION_TIME, 0 },
+};
+
+static const struct cci_reg_sequence ar0234_1920x1200[] = {
+	{ AR0234_REG_X_ADDR_START, 8 },
+	{ AR0234_REG_Y_ADDR_START, 8 },
+	{ AR0234_REG_X_ADDR_END, AR0234_PIXEL_ARRAY_WIDTH + 8 - 1 },
+	{ AR0234_REG_Y_ADDR_END, AR0234_PIXEL_ARRAY_HEIGHT + 8 - 1 },
+};
+
+static const char *const ar0234_test_pattern_menu[] = {
+	"Disabled",
+	"Solid Color",
+	"Vertical Color Bars",
+	"Fade to Grey Vertical Color Bars",
+	"Walking 1s",
+};
+
+static const unsigned int ar0234_test_pattern_val[] = {
+	AR0234_TEST_PATTERN_DISABLED,
+	AR0234_TEST_PATTERN_SOLID_COLOR,
+	AR0234_TEST_PATTERN_VERTICAL_COLOR_BARS,
+	AR0234_TEST_PATTERN_FADE_TO_GREY,
+	AR0234_TEST_PATTERN_WALKING_1S,
+};
+
+static const char *const ar0234_supply_names[] = {
+	"vana",
+	"vdig",
+	"vddl",
+};
+
+static const struct ar0234_format ar0234_formats[] = {
+	{
+		.width = 1920,
+		.height = 1200,
+		.reg_list = {
+			.regs = ar0234_1920x1200,
+			.num_of_regs = ARRAY_SIZE(ar0234_1920x1200),
+		},
+	},
+};
+
+enum ar0234_colour_variant {
+	AR0234_VARIANT_COLOUR,
+	AR0234_VARIANT_MONO,
+	AR0234_VARIANT_MAX
+};
+
+struct ar0234_mode {
+	u8 bpp;
+	u32 code[AR0234_VARIANT_MAX];
+};
+
+static const struct ar0234_mode ar0234_modes[] = {
+	{
+		.bpp = 10,
+		.code = {
+			[AR0234_VARIANT_COLOUR] = MEDIA_BUS_FMT_SGRBG10_1X10,
+			[AR0234_VARIANT_MONO] = MEDIA_BUS_FMT_Y10_1X10,
+		},
+	},
+};
+
+static const s64 link_freqs[] = {
+	450000000LL,
+};
+
+struct ar0234 {
+	struct device *dev;
+	struct clk *clk;
+	struct regmap *regmap;
+
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ar0234_supply_names)];
+	struct gpio_desc *reset;
+
+	unsigned int num_data_lanes;
+
+	unsigned long link_freq_bitmap;
+
+	enum ar0234_colour_variant variant;
+
+	struct ccs_pll pll;
+
+	struct ar0234_mode const *mode;
+	struct ar0234_format const *format;
+
+	struct v4l2_ctrl_handler ctrls;
+
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *a_gain;
+	struct {
+		struct v4l2_ctrl *hflip;
+		struct v4l2_ctrl *vflip;
+	};
+};
+
+static inline struct ar0234 *to_ar0234(struct v4l2_subdev *_sd)
+{
+	return container_of(_sd, struct ar0234, sd);
+}
+
+static const struct ccs_pll_limits ar0234_pll_limits = {
+	.min_ext_clk_freq_hz = 6000000,
+	.max_ext_clk_freq_hz = 54000000,
+	.vt_fr = {
+		.min_pre_pll_clk_div = 1,
+		.max_pre_pll_clk_div = 63,
+		.min_pll_ip_clk_freq_hz = 1500000,
+		.max_pll_ip_clk_freq_hz = 12000000,
+		.min_pll_multiplier = 2,
+		.max_pll_multiplier = 254,
+		.min_pll_op_clk_freq_hz = 384000000,
+		.max_pll_op_clk_freq_hz = 768000000,
+	},
+	.vt_bk = {
+		.min_sys_clk_div = 1,
+		.max_sys_clk_div = 63,
+		.min_sys_clk_freq_hz = 45000000,
+		.max_sys_clk_freq_hz = 768000000,
+		.min_pix_clk_div = 1,
+		.max_pix_clk_div = 63,
+		.min_pix_clk_freq_hz = 45000000,
+		.max_pix_clk_freq_hz = 90000000,
+	},
+	.op_bk = {
+		.min_sys_clk_div = 1,
+		.max_sys_clk_div = 63,
+		.min_sys_clk_freq_hz = 45000000,
+		.max_sys_clk_freq_hz = 768000000,
+		.min_pix_clk_div = 1,
+		.max_pix_clk_div = 63,
+		.min_pix_clk_freq_hz = 45000000,
+		.max_pix_clk_freq_hz = 90000000,
+	},
+};
+
+static int ar0234_calculate_pll(struct ar0234 *ar0234)
+{
+	memset(&ar0234->pll, 0, sizeof(ar0234->pll));
+
+	ar0234->pll.bus_type = CCS_PLL_BUS_TYPE_CSI2_DPHY;
+	ar0234->pll.op_lanes = ar0234->num_data_lanes;
+	ar0234->pll.vt_lanes = 1;
+	ar0234->pll.csi2.lanes = ar0234->num_data_lanes;
+	ar0234->pll.binning_horizontal = 1;
+	ar0234->pll.binning_vertical = 1;
+	ar0234->pll.scale_m = 1;
+	ar0234->pll.scale_n = 1;
+	ar0234->pll.bits_per_pixel = ar0234->mode->bpp;
+	ar0234->pll.flags = CCS_PLL_FLAG_LANE_SPEED_MODEL |
+			    CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER |
+			    CCS_PLL_FLAG_FIFO_DERATING |
+			    CCS_PLL_FLAG_FIFO_OVERRATING |
+			    CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER;
+	ar0234->pll.link_freq = link_freqs[__ffs(ar0234->link_freq_bitmap)];
+	ar0234->pll.link_freq /= 2;
+	ar0234->pll.ext_clk_freq_hz = clk_get_rate(ar0234->clk);
+
+	return ccs_pll_calculate(ar0234->dev, &ar0234_pll_limits, &ar0234->pll);
+}
+
+static u32 ar0234_calc_analog_gain(u32 req_gain_q6, u32 *reg_val)
+{
+	u32 s, t;
+	u32 best_gain = 0;
+	u32 best_reg = 0;
+	u32 min_diff = U32_MAX;
+	u32 coarse_mult, fine_gain_q6, total_gain_q6, diff;
+
+	for (s = 0; s <= 4; s++) {
+		coarse_mult = (1 << s) * AR0234_ANA_GAIN_BASE;
+
+		for (t = 0; t <= 15; t++) {
+			if (s == 0 || s == 2) {
+				fine_gain_q6 = (AR0234_ANA_GAIN_BASE * 32) / (32 - t);
+			} else if (s == 1 || s == 3) {
+				fine_gain_q6 = (AR0234_ANA_GAIN_BASE * 16) / (16 - (t / 2));
+			} else {
+				fine_gain_q6 = (AR0234_ANA_GAIN_BASE * 8) / (8 - (t / 4));
+			}
+
+			total_gain_q6 = (coarse_mult * fine_gain_q6) / AR0234_ANA_GAIN_BASE;
+
+			if (req_gain_q6 > total_gain_q6)
+				diff = req_gain_q6 - total_gain_q6;
+			else
+				diff = total_gain_q6 - req_gain_q6;
+
+			if (diff < min_diff) {
+				min_diff = diff;
+				best_gain = total_gain_q6;
+				best_reg = (s << 4) | t;
+			}
+		}
+	}
+
+	*reg_val = best_reg;
+
+	return best_gain;
+}
+
+static int ar0234_set_mfr_30ba(struct ar0234 *ar0234, u32 analog_reg_val)
+{
+	u16 mfr_30ba_val;
+	u32 coarse_idx = (analog_reg_val >> 4) & 0x7;
+
+	if (ar0234->pll.pixel_rate_pixel_array <= 45000000) {
+		if (coarse_idx < 3)
+			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(6);
+		else
+			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(0);
+	} else {
+		if (coarse_idx == 0)
+			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(2);
+		else if (coarse_idx == 1)
+			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(1);
+		else
+			mfr_30ba_val = AR0234_MFR_30BA_GAIN_BITS(0);
+	}
+
+	return cci_write(ar0234->regmap, AR0234_REG_MFR_30BA, mfr_30ba_val, NULL);
+}
+
+static int ar0234_set_analog_gain(struct ar0234 *ar0234, u64 val)
+{
+	u32 reg_val, actual_gain;
+	int ret;
+
+	actual_gain = ar0234_calc_analog_gain(val, &reg_val);
+
+	if (actual_gain != val) {
+		__v4l2_ctrl_modify_range(ar0234->a_gain, AR0234_ANA_GAIN_MIN,
+					 AR0234_ANA_GAIN_MAX,
+					 AR0234_ANA_GAIN_STEP, actual_gain);
+		__v4l2_ctrl_s_ctrl(ar0234->a_gain, actual_gain);
+	}
+
+	ret = cci_write(ar0234->regmap, AR0234_REG_GROUPED_PARAMETER_HOLD,
+			1, NULL);
+	if (ret)
+		return ret;
+
+	ret = ar0234_set_mfr_30ba(ar0234, reg_val);
+	if (!ret)
+		ret = cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN,
+				reg_val, NULL);
+
+	cci_write(ar0234->regmap, AR0234_REG_GROUPED_PARAMETER_HOLD, 0, NULL);
+
+	return ret;
+}
+
+static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ar0234 *ar0234 = container_of(ctrl->handler,
+					     struct ar0234, ctrls);
+	int ret;
+
+	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
+		return 0;
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max = ar0234->format->height + ctrl->val - 1;
+		int exposure_val = clamp(ar0234->exposure->val,
+					 AR0234_EXPOSURE_MIN, exposure_max);
+		
+		ret = __v4l2_ctrl_modify_range(ar0234->exposure,
+					       AR0234_EXPOSURE_MIN,
+					       exposure_max,
+					       AR0234_EXPOSURE_STEP,
+				 	       exposure_val);
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_in_use(ar0234->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_HBLANK:
+		ret = cci_write(ar0234->regmap, AR0234_REG_LINE_LENGTH_PCK,
+				(ar0234->format->width / 4) + ctrl->val, NULL);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = cci_write(ar0234->regmap, AR0234_REG_FRAME_LENGTH_LINES,
+				ar0234->format->height + ctrl->val, NULL);
+		if (ret)
+			break;
+		ctrl = ar0234->exposure;
+		fallthrough;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(ar0234->regmap,
+				AR0234_REG_COARSE_INTEGRATION_TIME,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ar0234_set_analog_gain(ar0234, ctrl->val);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = cci_write(ar0234->regmap, AR0234_REG_GLOBAL_GAIN,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = cci_write(ar0234->regmap, AR0234_REG_TEST_PATTERN_MODE,
+				ar0234_test_pattern_val[ctrl->val], NULL);
+		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		ret = cci_write(ar0234->regmap, AR0234_REG_IMAGE_ORIENTATION,
+				(ar0234->vflip->val << 1) | ar0234->hflip->val,
+				NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN_RED:
+		ret = cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_RED,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENR:
+		ret = cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_GREENR,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN_BLUE:
+		ret = cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_BLUE,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENB:
+		ret = cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_GREENB,
+				ctrl->val, NULL);
+		break;
+	default:
+		dev_err(ar0234->dev, "Invalid control %d\n", ctrl->id);
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put_autosuspend(ar0234->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ar0234_ctrl_ops = {
+	.s_ctrl = ar0234_set_ctrl,
+};
+
+static int ar0234_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+
+	if (code->index >= ARRAY_SIZE(ar0234_modes))
+		return -EINVAL;
+
+	code->code = ar0234_modes[code->index].code[ar0234->variant];
+
+	return 0;
+}
+
+static int ar0234_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(ar0234_formats))
+		return -EINVAL;
+
+	fse->min_width = ar0234_formats[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = ar0234_formats[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static void ar0234_set_framing_limits(struct ar0234 *ar0234)
+{
+	const struct ar0234_format *format = ar0234->format;
+	int hblank, pixel_rate;
+
+	__v4l2_ctrl_modify_range(ar0234->vblank, AR0234_VBLANK_MIN,
+				 AR0234_VBLANK_MAX - format->height,
+				 1, AR0234_VBLANK_MIN);
+	__v4l2_ctrl_s_ctrl(ar0234->vblank, AR0234_VBLANK_MIN);
+	hblank = AR0234_HBLANK_DEF - format->width / 4;
+	__v4l2_ctrl_modify_range(ar0234->hblank, AR0234_HBLANK_MIN,
+				 AR0234_HBLANK_MAX, 2, hblank);
+	__v4l2_ctrl_s_ctrl(ar0234->hblank, hblank);
+
+	 __v4l2_ctrl_s_ctrl(ar0234->link_freq,
+			    __ffs(ar0234->link_freq_bitmap));
+
+	pixel_rate = ar0234->pll.pixel_rate_pixel_array * ar0234->num_data_lanes;
+	__v4l2_ctrl_modify_range(ar0234->pixel_rate, pixel_rate, pixel_rate,
+				 1, pixel_rate);
+}
+
+static int ar0234_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct ar0234_format const *format;
+	struct v4l2_mbus_framefmt *framefmt;
+	int i;
+
+	format = v4l2_find_nearest_size(ar0234_formats,
+					ARRAY_SIZE(ar0234_formats), width,
+					height, fmt->format.width,
+					fmt->format.height);
+
+	for (i = 0; i < ARRAY_SIZE(ar0234_modes); i++) {
+		if (ar0234_modes[i].code[ar0234->variant] == fmt->format.code) {
+			fmt->format.code = ar0234_modes[i].code[ar0234->variant];
+			break;
+		}
+	}
+
+	fmt->format.width = format->width;
+	fmt->format.height = format->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+		*framefmt = fmt->format;
+	} else if (ar0234->format != format) {
+		ar0234->format = format;
+		ar0234_set_framing_limits(ar0234);
+	}
+
+	return 0;
+}
+
+static int ar0234_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct v4l2_subdev_format format = {
+		.format = {
+			.width = AR0234_PIXEL_ARRAY_WIDTH,
+			.height = AR0234_PIXEL_ARRAY_HEIGHT,
+			.code = ar0234->mode->code[ar0234->variant],
+		},
+	};
+
+	__v4l2_ctrl_modify_range(ar0234->link_freq, 0,
+				 __fls(ar0234->link_freq_bitmap),
+				 ~(ar0234->link_freq_bitmap),
+				 __ffs(ar0234->link_freq_bitmap));
+
+	return ar0234_set_pad_format(sd, state, &format);
+}
+
+static int ar0234_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+		case V4L2_SEL_TGT_CROP:
+		case V4L2_SEL_TGT_CROP_DEFAULT:
+		case V4L2_SEL_TGT_CROP_BOUNDS:
+			sel->r.top = 0;
+			sel->r.left = 0;
+			sel->r.width = AR0234_NATIVE_WIDTH;
+			sel->r.height = AR0234_NATIVE_HEIGHT;
+
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int ar0234_soft_reset(struct ar0234 *ar0234)
+{
+	int ret;
+
+	ret = cci_write(ar0234->regmap, AR0234_REG_RESET, 0x0001, NULL);
+	usleep_range(2000, 2100);
+	cci_write(ar0234->regmap, AR0234_REG_RESET, 0x2018, &ret);
+	usleep_range(2000, 2100);
+
+	return ret;
+}
+
+static inline int ar0234_set_stream(struct ar0234 *ar0234, bool on)
+{
+	return cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT, !!on,  NULL);
+}
+
+static int ar0234_start_streaming(struct ar0234 *ar0234)
+{
+	int ret;
+
+	ret = pm_runtime_resume_and_get(ar0234->dev);
+	if (ret)
+		return ret;
+
+//	pr_info("vt_fr.pre_pll_clk_div %i\n", ar0234->pll.vt_fr.pre_pll_clk_div);
+//	pr_info("vt_fr.pll_multiplier %i\n", ar0234->pll.vt_fr.pll_multiplier);
+	
+//	pr_info("vt_bk.sys_clk_div %i\n", ar0234->pll.vt_bk.sys_clk_div);
+//	pr_info("vt_bk.pix_clk_div %i\n", ar0234->pll.vt_bk.pix_clk_div);
+	
+//	pr_info("op_bk.pix_clk_div %i\n", ar0234->pll.op_bk.pix_clk_div);
+//	pr_info("op_bk.sys_clk_div %i\n", ar0234->pll.op_bk.sys_clk_div);
+	
+//	pr_info("pixel_rate_csi %u\n", ar0234->pll.pixel_rate_csi);
+//	pr_info("pixel_rate_pixel_array %u\n", ar0234->pll.pixel_rate_pixel_array);
+
+	ret = cci_write(ar0234->regmap, AR0234_REG_PRE_PLL_CLK_DIV,
+			ar0234->pll.vt_fr.pre_pll_clk_div, NULL);
+	ret = cci_write(ar0234->regmap, AR0234_REG_PLL_MULTIPLIER,
+			ar0234->pll.vt_fr.pll_multiplier, &ret);
+	ret = cci_write(ar0234->regmap, AR0234_REG_VT_SYS_CLK_DIV,
+			ar0234->pll.vt_bk.sys_clk_div, &ret);
+	ret = cci_write(ar0234->regmap, AR0234_REG_VT_PIX_CLK_DIV,
+			ar0234->pll.vt_bk.pix_clk_div, &ret);
+	ret = cci_write(ar0234->regmap, AR0234_REG_OP_SYS_CLK_DIV,
+			ar0234->pll.op_bk.sys_clk_div, &ret);
+	ret = cci_write(ar0234->regmap, AR0234_REG_OP_PIX_CLK_DIV,
+			ar0234->pll.op_bk.pix_clk_div, &ret);
+	if (ret) {
+		dev_err(ar0234->dev, "Failed to setup PLL\n");
+		return ret;
+	}
+
+	ret = cci_multi_reg_write(ar0234->regmap, ar0234_common_init,
+				  ARRAY_SIZE(ar0234_common_init), NULL);
+	ret = cci_write(ar0234->regmap, AR0234_REG_DATA_FORMAT_BITS,
+			DATA_FORMAT_BITS(ar0234->mode->bpp), &ret);
+	ret = cci_write(ar0234->regmap, AR0234_REG_SERIAL_FORMAT,
+			DATA_FORMAT_LINES(ar0234->num_data_lanes), &ret);
+	if (ret) {
+		dev_err(ar0234->dev, "Failed to set common settings\n");
+		return ret;
+	}
+
+	ret = cci_multi_reg_write(ar0234->regmap, ar0234->format->reg_list.regs,
+				  ar0234->format->reg_list.num_of_regs, NULL);
+	
+	if (ret) {
+		dev_err(ar0234->dev, "Failed to set frame format\n");
+		return ret;
+	}
+
+	ret = __v4l2_ctrl_handler_setup(ar0234->sd.ctrl_handler);
+	if (ret)
+		return ret;
+
+	return ar0234_set_stream(ar0234, true);
+}
+
+static void ar0234_stop_streaming(struct ar0234 *ar0234)
+{
+	if (ar0234_set_stream(ar0234, false))
+		dev_err(ar0234->dev, "Failed to set stream\n");
+
+	pm_runtime_put_autosuspend(ar0234->dev);
+}
+
+static int ar0234_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	if (enable)
+		ret = ar0234_start_streaming(ar0234);
+	else
+		ar0234_stop_streaming(ar0234);
+
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
+static int ar0234_g_mbus_config(struct v4l2_subdev *sd, unsigned int pad_id,
+				struct v4l2_mbus_config *config)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	
+	config->type = V4L2_MBUS_CSI2_DPHY;
+	config->bus.mipi_csi2.flags = V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+	config->bus.mipi_csi2.num_data_lanes = ar0234->num_data_lanes;
+	
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops ar0234_video_ops = {
+	.s_stream = ar0234_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops ar0234_pad_ops = {
+	.enum_mbus_code = ar0234_enum_mbus_code,
+	.enum_frame_size = ar0234_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ar0234_set_pad_format,
+	.get_selection = ar0234_get_selection,
+	.get_mbus_config = ar0234_g_mbus_config,
+};
+
+static const struct v4l2_subdev_ops ar0234_subdev_ops = {
+	.video = &ar0234_video_ops,
+	.pad = &ar0234_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ar0234_internal_ops = {
+	.init_state = ar0234_init_state,
+};
+
+static int ar0234_ctrls_init(struct ar0234 *ar0234)
+{
+	struct v4l2_fwnode_device_properties props;
+	int i, ret;
+
+	ret = v4l2_fwnode_device_parse(ar0234->dev, &props);
+	if (ret)
+		return ret;
+
+	ret = v4l2_ctrl_handler_init(&ar0234->ctrls, 14);
+	if (ret)
+		return ret;
+
+	ar0234->hblank = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
+					   V4L2_CID_HBLANK, 0,
+					   AR0234_HBLANK_MAX, 2, 0);
+
+	ar0234->vblank = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
+					   V4L2_CID_VBLANK, 0,
+					   AR0234_VBLANK_MAX, 1, 0);
+
+	ar0234->exposure = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     AR0234_EXPOSURE_MIN, U16_MAX,
+					     AR0234_EXPOSURE_STEP, 200);
+
+	ar0234->pixel_rate = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE, 1,
+					       INT_MAX, 1, 1);
+
+	ar0234->a_gain = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
+					   V4L2_CID_ANALOGUE_GAIN,
+					   AR0234_ANA_GAIN_MIN,
+					   AR0234_ANA_GAIN_MAX,
+					   AR0234_ANA_GAIN_STEP,
+					   AR0234_ANA_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
+			  V4L2_CID_DIGITAL_GAIN, AR0234_DGTL_GAIN_MIN,
+			  AR0234_DGTL_GAIN_MAX, AR0234_DGTL_GAIN_STEP,
+			  AR0234_DGTL_GAIN_DEFAULT);
+
+	ar0234->hflip = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	ar0234->vflip = v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_cluster(2, &ar0234->hflip);
+
+	v4l2_ctrl_new_std_menu_items(&ar0234->ctrls, &ar0234_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ar0234_test_pattern_menu) - 1,
+				     0, 0, ar0234_test_pattern_menu);
+
+	for (i = 0; i < 4; i++) {
+		v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops,
+				  V4L2_CID_TEST_PATTERN_RED + i,
+				  AR0234_TESTP_COLOUR_MIN,
+				  AR0234_TESTP_COLOUR_MAX,
+				  AR0234_TESTP_COLOUR_STEP,
+				  AR0234_TESTP_COLOUR_MAX);
+	}
+
+	ar0234->link_freq = v4l2_ctrl_new_int_menu(&ar0234->ctrls, &ar0234_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   __fls(ar0234->link_freq_bitmap),
+						   __ffs(ar0234->link_freq_bitmap),
+						   link_freqs);
+	if (ar0234->link_freq)
+		ar0234->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	v4l2_ctrl_new_fwnode_properties(&ar0234->ctrls, &ar0234_ctrl_ops,
+					&props);
+
+	if (ar0234->ctrls.error)
+		return dev_err_probe(ar0234->dev, ar0234->ctrls.error,
+				     "Failed to add controls\n");
+
+	ar0234->sd.ctrl_handler = &ar0234->ctrls;
+
+	ar0234_set_framing_limits(ar0234);
+
+	return 0;
+}
+
+static int ar0234_parse_hw_config(struct ar0234 *ar0234)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct fwnode_handle *ep;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(ar0234->supplies); i++)
+		ar0234->supplies[i].supply = ar0234_supply_names[i];
+
+	ret = devm_regulator_bulk_get(ar0234->dev,
+				      ARRAY_SIZE(ar0234->supplies),
+				      ar0234->supplies);
+	if (ret)
+		return dev_err_probe(ar0234->dev, ret,
+				     "Failed to get supplies\n");
+
+	ar0234->reset = devm_gpiod_get_optional(ar0234->dev, "reset",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(ar0234->reset))
+		return dev_err_probe(ar0234->dev, PTR_ERR(ar0234->reset),
+				     "Failed to get reset GPIO\n");
+
+	ar0234->clk = devm_clk_get(ar0234->dev, NULL);
+	if (IS_ERR(ar0234->clk))
+		return dev_err_probe(ar0234->dev, PTR_ERR(ar0234->clk),
+				     "Failed to get clock\n");
+
+	ep = fwnode_graph_get_next_endpoint(dev_fwnode(ar0234->dev), NULL);
+	if (!ep)
+		return -ENXIO;
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
+	case 1:
+	case 2:
+	case 4:
+		ar0234->num_data_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+		break;
+	default:
+		ret = dev_err_probe(ar0234->dev, -EINVAL,
+				    "Invalid number of CSI2 data lanes %d\n",
+		      bus_cfg.bus.mipi_csi2.num_data_lanes);
+		goto done_endpoint_free;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(ar0234->dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freqs, ARRAY_SIZE(link_freqs),
+				       &ar0234->link_freq_bitmap);
+	if (!ret && !ar0234->link_freq_bitmap)
+		ret = -EINVAL;
+
+done_endpoint_free:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int ar0234_identify_module(struct ar0234 *ar0234)
+{
+	u64 id, rev;
+	int ret;
+
+	ret = cci_read(ar0234->regmap, AR0234_REG_CHIP_VERSION, &id, NULL);
+	ret = cci_read(ar0234->regmap, AR0234_REG_REVISION_NUMBER, &rev, &ret);
+	if (ret)
+		return dev_err_probe(ar0234->dev, ret,
+				     "Failed to read chip id\n");
+
+	if (id == AR0234_CHIP_ID_MONO)
+		ar0234->variant = AR0234_VARIANT_MONO;
+	else if (id == AR0234_CHIP_ID)
+		ar0234->variant = AR0234_VARIANT_COLOUR;
+	else
+		return dev_err_probe(ar0234->dev, -ENODEV,
+				     "Invalid chip id: 0x%04x\n", (u16)id);
+
+	dev_info(ar0234->dev, "Success reading chip id: 0x%04x, Rev.%lld\n",
+		 (u16)id, (rev >> 12) & 0xf);
+
+	return ret;
+}
+
+static int ar0234_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ar0234->supplies),
+				    ar0234->supplies);
+	if (ret) {
+		dev_err(ar0234->dev, "Failed to enable regulators\n");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ar0234->clk);
+	if (ret) {
+		dev_err(ar0234->dev, "Failed to enable clock\n");
+		regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies),
+				       ar0234->supplies);
+		return ret;
+	}
+
+	gpiod_set_value_cansleep(ar0234->reset, 1);
+	/* ~160000 EXTCLKs */
+	usleep_range(27000, 28000);
+
+	return 0;
+}
+
+static int ar0234_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ar0234 *ar0234 = to_ar0234(sd);
+
+	gpiod_set_value_cansleep(ar0234->reset, 0);
+	regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies), ar0234->supplies);
+	clk_disable_unprepare(ar0234->clk);
+	/* 100ms PwrDown until next PwrUp */
+	usleep_range(100000, 110000);
+
+	return 0;
+}
+
+static void ar0234_subdev_cleanup(struct ar0234 *ar0234)
+{
+	media_entity_cleanup(&ar0234->sd.entity);
+	v4l2_ctrl_handler_free(&ar0234->ctrls);
+}
+
+static int ar0234_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct ar0234 *ar0234;
+	int ret;
+
+	ar0234 = devm_kzalloc(dev, sizeof(*ar0234), GFP_KERNEL);
+	if (!ar0234)
+		return -ENOMEM;
+
+	ar0234->dev = dev;
+
+	ar0234->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ar0234->regmap))
+		return PTR_ERR(ar0234->regmap);
+
+	ret = ar0234_parse_hw_config(ar0234);
+	if (ret)
+		return ret;
+
+	v4l2_i2c_subdev_init(&ar0234->sd, client, &ar0234_subdev_ops);
+
+	ret = ar0234_power_on(dev);
+	if (ret)
+		goto err_subdev;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+
+	ret = ar0234_soft_reset(ar0234);
+	if (ret)
+		goto error_pm;
+
+	ret = ar0234_identify_module(ar0234);
+	if (ret)
+		goto error_pm;
+
+	ar0234->mode = &ar0234_modes[0];
+	ar0234->format = &ar0234_formats[0];
+
+	ret = ar0234_calculate_pll(ar0234);
+	if (ret) {
+		dev_err(ar0234->dev, "PLL calculations failed: %d\n", ret);
+		goto error_pm;
+	}
+
+	ret = ar0234_ctrls_init(ar0234);
+	if (ret)
+		goto error_pm;
+
+	ar0234->sd.internal_ops = &ar0234_internal_ops;
+	ar0234->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ar0234->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	ar0234->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&ar0234->sd.entity, 1, &ar0234->pad);
+	if (ret) {
+		dev_err(dev, "Failed to init entity pads: %d\n", ret);
+		goto error_pm;
+	}
+
+	ar0234->sd.state_lock = ar0234->ctrls.lock;
+
+	ret = v4l2_subdev_init_finalize(&ar0234->sd);
+	if (ret) {
+		dev_err(ar0234->dev, "Subdev init error\n");
+		goto error_media;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&ar0234->sd);
+	if (ret) {
+		dev_err(dev, "Failed to register sensor sub-device: %d\n", ret);
+		goto error_media;
+	}
+
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+
+error_media:
+	media_entity_cleanup(&ar0234->sd.entity);
+
+error_pm:
+	pm_runtime_disable(ar0234->dev);
+	pm_runtime_put_noidle(ar0234->dev);
+	ar0234_power_off(ar0234->dev);
+
+err_subdev:
+	ar0234_subdev_cleanup(ar0234);
+
+	return ret;
+}
+
+static void ar0234_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ar0234 *ar0234 = to_ar0234(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	ar0234_subdev_cleanup(ar0234);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ar0234_power_off(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static const struct of_device_id ar0234_dt_ids[] = {
+	{ .compatible = "onnn,ar0234cs" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ar0234_dt_ids);
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ar0234_pm_ops, ar0234_power_off,
+				 ar0234_power_on, NULL);
+
+static struct i2c_driver ar0234_i2c_driver = {
+	.driver = {
+		.name = "ar0234",
+		.of_match_table	= ar0234_dt_ids,
+		.pm = pm_ptr(&ar0234_pm_ops),
+	},
+	.probe = ar0234_probe,
+	.remove = ar0234_remove,
+};
+module_i2c_driver(ar0234_i2c_driver);
+
+MODULE_DESCRIPTION("Onsemi AR0234 Camera Sensor Driver");
+MODULE_AUTHOR("Alexander Shiyan <eagle.alexander923@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.52.0


