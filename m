Return-Path: <linux-media+bounces-54463-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TSywIEooqGkdpAAAu9opvQ
	(envelope-from <linux-media+bounces-54463-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 13:40:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 991E41FFBF1
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 13:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A08193014647
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 12:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78CED194098;
	Wed,  4 Mar 2026 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXEdkKF7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188BB611E
	for <linux-media@vger.kernel.org>; Wed,  4 Mar 2026 12:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772628035; cv=none; b=UlUDWNqcZIpLLgMVIbEnVE6zPkxuXyvs3UkC87F5hngcupi+40cvDDOpEXnv/+isQ1RquYKETMjIspNQXCCR5QIb0RIiOpqru/Fwc+wI9oz3+zJScDBeici0F5lirptX7pgrG+ILzbGYDiVPt4UUa77NX1PTPcdzpMB4zFTRn78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772628035; c=relaxed/simple;
	bh=R1yQoVBtfPFx6eXAa8Q4mFqAfcO5iZTshszzdzofQl0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PoF5tpIR/NDXOEqwDHB7hAVjcz4Io+PkEM7RIp6T1/3iu7uM7SH1QJ0+/wQ6kf/88DUZOJnepXfA3AC+coN0XEYZI0rxcl+eGW2odK0eAU5wuFCdIbbco6mhPPKIEqoNwrhOLkadZBs5gCxGW5pFSpZa4iwkxQWcFI548SxENBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXEdkKF7; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38a23dd61c1so27332551fa.1
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 04:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772628030; x=1773232830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ccjXH5k4GycJeI36DsCCPpDkk8RnqpW/HAJJR9lmVg=;
        b=HXEdkKF7cIAdwhM7/nST3pKOvn3+fvG+HsxGfEfbXhk8FTqzoxZAjfuyfP3ymSzf5J
         PCuJMbgeW2jolVogrmC0Md3AQXtYGy9nnS9rsCcP9eOA2pvimzwebYc1LuISrRDpY/gp
         eFfjAwdt3pkau29RwUS/FkSOwTHTV3HqyQeRAaUuUQ66dXkDgrPlC90gNsCnSBH1JDPn
         rhAtgMWfkxe0tDlLvtQSiVdtgJm1Uhrac5rLYYV1KAZt8hnRgaUdWjlMg354Ha1kGm2r
         fFpjLLx/tghnPF4tdMUEBvOgUouTQDEaZBRi9tX29Pv11QiUm0KKGvmkgHAlONvwlmcS
         Insw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772628030; x=1773232830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ccjXH5k4GycJeI36DsCCPpDkk8RnqpW/HAJJR9lmVg=;
        b=qYZG6U5zf+dLCpKL035OXEybFQqvapHc+XiuR1DeJSXCcTKspM1zcFX2CWdrtDIvhb
         4E1EMe+k2O8nYFC0yl6TUZMxVfOJnur3fwrcRLeFGofVr6csOpHhcIgUhFIQCHctVXy3
         SXTjKaLYtiUwzHpqX43fEp/U2jYG6+1TH8v95Jn8uga2mgzCTFhiiC4m/EDSo0bO/Qe8
         xbfUbK9UXDnFvpEYdAwlSXXoBd6/VUmdN4OWTHZE+E9l8i0rGjSVDhhaVcuYwP8l4cZ9
         KuXSzMkOlM3lm/CzS9Zp70jLyG2ezjQEk6hhwci04QXrW8v9d3NBKFsrEwZ9rJ+uHVLs
         UZmg==
X-Gm-Message-State: AOJu0YxAIKPjex5zyP7BmzF68D6eOLSpQkp0S7kjvEYS6fJmqJRsYGlv
	YCVrHoUZLlVqBfYuGL0p7ZC8M8l/K1yNRntpgaeWyJpBGHElvIiX4/OxhUAMA11B
X-Gm-Gg: ATEYQzyXDnm7P5iBZDpi06TpI8vZ7dpmqYlEjvOitmJ43bAmB/YlJvswfnP4E69sQPR
	FSCQEu8LhiPlwsYYxxhj53G/x287X3iBpnfnqgr767Umoy6A4BW2ixyi5EErPDmGSxT+MCXcIRi
	W8tJvLscQJ64ofcePTilEEt3Q1OJ+25vveXxkCl0qxiBECEO1xuHdd1ljOPnd776S6dLp5/I6Sf
	jcvTE70F28cUXYDohibSLpvix+NzLgZExmOLHGEVnb7A8QgCHFW+V6NRca40KARabqElYn+TxWy
	UQUaIgIFR54JD0bQZaHMQ3AjTsfCEi0ra32NqIFBrpq1B13mm8DSMW5oQX/01mWd4rQisYoMreE
	eQGvWRDVuPjkU7NRBYXlD7pxenlMpWgY0nPiGc1aWRAzXBKtJRdLn4UeXix+LrmgIFXHAKKW0qh
	r4NKi1RAt2ZyytVD8jLso87xzrARbFzB75jxEVDIM=
X-Received: by 2002:a2e:988f:0:b0:386:13d:40b6 with SMTP id 38308e7fff4ca-38a2c7b57ddmr12463481fa.39.1772628029208;
        Wed, 04 Mar 2026 04:40:29 -0800 (PST)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a129a21450sm594332e87.81.2026.03.04.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:40:28 -0800 (PST)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-media@vger.kernel.org
Cc: Hao Yao <hao.yao@intel.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH RFC v2] media: i2c: Add AR0234 camera sensor driver
Date: Wed,  4 Mar 2026 15:40:02 +0300
Message-ID: <20260304124002.3775067-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 991E41FFBF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,ideasonboard.com,raspberrypi.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54463-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,kurokesu.com:email]
X-Rspamd-Action: no action

This is the second RFC version of the AR0234 camera sensor driver.
I would like to thank Isaac Scott and Dave Stevenson for their valuable
feedback on v1, which helped improve the driver.

The driver supports the onsemi AR0234 CMOS image sensor in 10-bit raw
Bayer mode (SGRBG10) at 1920x1200 resolution up to 120 fps, using 2 or 4
CSI-2 data lanes.
It has been tested with 4 lanes and 2 lanes (both work) at 27 MHz external
clock on an ARM64 RK3568 Rockchip platform with custom ISP
(not a mainline CIF-driver).

Notes:
- Unfortunately, 1?lane mode did not function correctly and was temporarily
  removed from the driver?s lane handling. Further investigation is needed
  to make it work; any insights or testing help would be greatly appreciated.
- 8-bit mode (which should be easily added by extending the ar0234_modes
  table) was attempted but did not produce a valid image. The cause is
  still unknown; the mode may require different PLL settings or additional
  register writes not yet implemented. I decided to omit it from this
  version until the issue is resolved.
- I added a private streaming boolean that is set in enable_streams and
  cleared in disable_streams. Is this the correct approach, or is there
  a more standard way to query whether the subdev is currently streaming
  (e.g., through the V4L2 core or the subdev state)? I want to ensure I'm
  following best practices.

Changes since v1:
- Improved error handling: use cci_write() with &ret chaining for
  sequential register writes, as suggested by Isaac Scott.
- Refactored format and cropping support:
  Replaced static format list with dynamic cropping rectangle
  (struct v4l2_rect crop).
  Implemented get_selection and set_selection for V4L2_SEL_TGT_CROP,
  allowing runtime selection of the active sensor area.
- Migrated to modern streaming model: replaced s_stream with
  enable_streams/disable_streams using v4l2_subdev_s_stream_helper.
- Corrected blanking constants: replaced ambiguous AR0234_HBLANK_DEF
  with AR0234_LINE_LENGTH_PCK_MIN; updated min/max ranges.
- Added ACPI match table (untested).
- Style fixes.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
Cc: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
 drivers/media/i2c/Kconfig  |   12 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/ar0234.c | 1251 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1264 insertions(+)
 create mode 100644 drivers/media/i2c/ar0234.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 0db8a0add289..609b6a8fc6db 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -62,6 +62,18 @@ config VIDEO_AP1302
 	  This is a Video4Linux2 sensor-level driver for the external
 	  ISP AP1302.
 
+config VIDEO_AR0234
+	tristate "onsemi AR0234 sensor support"
+	depends on ACPI || OF || COMPILE_TEST
+	select V4L2_CCI_I2C
+	select VIDEO_CCS_PLL
+	help
+	  This is a Video4Linux2 sensor driver for the onsemi
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
index 000000000000..10f2bcb5a526
--- /dev/null
+++ b/drivers/media/i2c/ar0234.c
@@ -0,0 +1,1251 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the onsemi AR0234 camera sensor
+ *
+ * Copyright (C) 2026 Alexander Shiyan <eagle.alexander923@gmail.com>
+ *
+ * Some parts of code taken from Raspberry Pi driver ar0234.c by:
+ * Copyright (C) 2021, Raspberry Pi (Trading) Ltd
+ * Copyright (C) 2025-2026, UAB Kurokesu
+ * Author: Dave Stevenson <dave.stevenson@raspberrypi.com>
+ * Author: Danius Kalvaitis <danius@kurokesu.com>
+ *
+ * Some parts of code taken from imx290.c by:
+ * Copyright (C) 2019 FRAMOS GmbH.
+ * Copyright (C) 2019 Linaro Ltd.
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
+#	define AR0234_FRAME_LENGTH_LINES_MIN		(16)
+#	define AR0234_VBLANK_MAX			(0xf000)
+#define AR0234_REG_LINE_LENGTH_PCK			CCI_REG16(0x300c)
+#	define AR0234_LINE_LENGTH_PCK_MIN		(612)
+#	define AR0234_HBLANK_MAX			(0xf000)
+#define AR0234_REG_REVISION_NUMBER			CCI_REG16(0x300e)
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
+#	define DATA_FORMAT_LANES(x)			(0x200 | (x))
+
+#define AR0234_NATIVE_WIDTH				(1940U)
+#define AR0234_NATIVE_HEIGHT				(1220U)
+#define AR0234_PIXEL_ARRAY_LEFT				(8U)
+#define AR0234_PIXEL_ARRAY_TOP				(8U)
+#define AR0234_PIXEL_ARRAY_WIDTH			(1920U)
+#define AR0234_PIXEL_ARRAY_HEIGHT			(1200U)
+#define AR0234_MIN_CROP_WIDTH				(4U)
+#define AR0234_MIN_CROP_HEIGHT				(2U)
+#define AR0234_CROP_WIDTH_STEP				(4U)
+#define AR0234_CROP_HEIGHT_STEP				(2U)
+
+static const struct cci_reg_sequence ar0234_common_init[] = {
+	{ AR0234_REG_FINE_INTEGRATION_TIME, 0 },
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
+	struct v4l2_rect crop;
+
+	bool streaming;
+
+	struct v4l2_ctrl_handler ctrls;
+
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *link_freq;
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
+				fine_gain_q6 =
+					(AR0234_ANA_GAIN_BASE * 32) / (32 - t);
+			} else if (s == 1 || s == 3) {
+				fine_gain_q6 = (AR0234_ANA_GAIN_BASE * 16) /
+					       (16 - (t / 2));
+			} else {
+				fine_gain_q6 = (AR0234_ANA_GAIN_BASE * 8) /
+					       (8 - (t / 4));
+			}
+
+			total_gain_q6 = (coarse_mult * fine_gain_q6) /
+					AR0234_ANA_GAIN_BASE;
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
+	return cci_write(ar0234->regmap, AR0234_REG_MFR_30BA,
+			 mfr_30ba_val, NULL);
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
+
+	cci_write(ar0234->regmap, AR0234_REG_ANALOG_GAIN, reg_val, &ret);
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
+	int ret = 0;
+
+	if (ctrl->flags & V4L2_CTRL_FLAG_READ_ONLY)
+		return 0;
+
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		int exposure_max = ar0234->crop.height + ctrl->val - 1;
+		int exposure_val = clamp(ar0234->exposure->val,
+					 AR0234_EXPOSURE_MIN, exposure_max);
+
+		ret = __v4l2_ctrl_modify_range(ar0234->exposure,
+					       AR0234_EXPOSURE_MIN,
+					       exposure_max,
+					       AR0234_EXPOSURE_STEP,
+					       exposure_val);
+		if (ret)
+			return ret;
+	}
+
+	if (pm_runtime_get_if_in_use(ar0234->dev) == 0)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_HBLANK:
+		cci_write(ar0234->regmap, AR0234_REG_LINE_LENGTH_PCK,
+			  (ar0234->crop.width / 4) + ctrl->val, &ret);
+		break;
+	case V4L2_CID_VBLANK:
+		cci_write(ar0234->regmap, AR0234_REG_FRAME_LENGTH_LINES,
+			  ar0234->crop.height + ctrl->val, &ret);
+		if (ret)
+			break;
+		ctrl = ar0234->exposure;
+		fallthrough;
+	case V4L2_CID_EXPOSURE:
+		cci_write(ar0234->regmap, AR0234_REG_COARSE_INTEGRATION_TIME,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ar0234_set_analog_gain(ar0234, ctrl->val);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		cci_write(ar0234->regmap, AR0234_REG_GLOBAL_GAIN,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		cci_write(ar0234->regmap, AR0234_REG_TEST_PATTERN_MODE,
+			  ar0234_test_pattern_val[ctrl->val], &ret);
+		break;
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+		cci_write(ar0234->regmap, AR0234_REG_IMAGE_ORIENTATION,
+			  (ar0234->vflip->val << 1) | ar0234->hflip->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_RED:
+		cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_RED,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENR:
+		cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_GREENR,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_BLUE:
+		cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_BLUE,
+			  ctrl->val, &ret);
+		break;
+	case V4L2_CID_TEST_PATTERN_GREENB:
+		cci_write(ar0234->regmap, AR0234_REG_TEST_DATA_GREENB,
+			  ctrl->val, &ret);
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
+	struct ar0234 *ar0234 = to_ar0234(sd);
+
+	if (fse->index >= ARRAY_SIZE(ar0234_modes))
+		return -EINVAL;
+
+	if (fse->code != ar0234_modes[fse->index].code[ar0234->variant])
+		return -EINVAL;
+
+	fse->min_width = AR0234_MIN_CROP_WIDTH;
+	fse->max_width = AR0234_PIXEL_ARRAY_WIDTH;
+	fse->min_height = AR0234_MIN_CROP_HEIGHT;
+	fse->max_height = AR0234_PIXEL_ARRAY_HEIGHT;
+
+	return 0;
+}
+
+static void ar0234_set_framing_limits(struct ar0234 *ar0234)
+{
+	unsigned int width = ar0234->crop.width;
+	int hblank, hblank_min;
+
+	__v4l2_ctrl_modify_range(ar0234->vblank, AR0234_FRAME_LENGTH_LINES_MIN,
+				 AR0234_VBLANK_MAX, 1,
+				 AR0234_FRAME_LENGTH_LINES_MIN);
+	__v4l2_ctrl_s_ctrl(ar0234->vblank, AR0234_FRAME_LENGTH_LINES_MIN);
+
+	hblank = AR0234_LINE_LENGTH_PCK_MIN - width / 4;
+	hblank_min = AR0234_LINE_LENGTH_PCK_MIN - AR0234_PIXEL_ARRAY_WIDTH / 4;
+	__v4l2_ctrl_modify_range(ar0234->hblank, hblank_min,
+				 AR0234_HBLANK_MAX, 2, hblank);
+	__v4l2_ctrl_s_ctrl(ar0234->hblank, hblank);
+}
+
+static int ar0234_set_pad_format(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_format *fmt)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct ar0234_mode const *mode = NULL;
+	unsigned int width, height;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ar0234_modes); i++) {
+		if (ar0234_modes[i].code[ar0234->variant] == fmt->format.code) {
+			mode = &ar0234_modes[i];
+			break;
+		}
+	}
+	if (!mode)
+		return -EINVAL;
+
+	width = clamp_t(unsigned int, round_down(fmt->format.width,
+						 AR0234_CROP_WIDTH_STEP),
+			AR0234_MIN_CROP_WIDTH, AR0234_PIXEL_ARRAY_WIDTH);
+	height = clamp_t(unsigned int, round_down(fmt->format.height,
+						  AR0234_CROP_HEIGHT_STEP),
+			 AR0234_MIN_CROP_HEIGHT, AR0234_PIXEL_ARRAY_HEIGHT);
+
+	fmt->format.code = mode->code[ar0234->variant];
+	fmt->format.width = width;
+	fmt->format.height = height;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+		return 0;
+	}
+
+	if (ar0234->mode != mode) {
+		int ret;
+
+		ar0234->mode = mode;
+
+		ret = ar0234_calculate_pll(ar0234);
+
+		if (ret) {
+			dev_err(ar0234->dev,
+				"PLL recalculations failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	if (ar0234->crop.width != width || ar0234->crop.height != height) {
+		ar0234->crop.width = width;
+		ar0234->crop.height = height;
+		ar0234->crop.left =
+			min_t(u32, ar0234->crop.left, AR0234_PIXEL_ARRAY_LEFT +
+			      AR0234_PIXEL_ARRAY_WIDTH - width);
+		ar0234->crop.top =
+			min_t(u32, ar0234->crop.top, AR0234_PIXEL_ARRAY_TOP +
+			      AR0234_PIXEL_ARRAY_HEIGHT - height);
+		ar0234->crop.left =
+			max(ar0234->crop.left, AR0234_PIXEL_ARRAY_LEFT);
+		ar0234->crop.top =
+			max(ar0234->crop.top, AR0234_PIXEL_ARRAY_TOP);
+
+		ar0234_set_framing_limits(ar0234);
+	}
+
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+
+	return 0;
+}
+
+static int ar0234_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.format = {
+			.width = ar0234->crop.width,
+			.height = ar0234->crop.height,
+			.code = ar0234->mode->code[ar0234->variant],
+		},
+	};
+	int ret;
+
+	ret = ar0234_set_pad_format(sd, state, &format);
+	if (ret)
+		return ret;
+
+	*v4l2_subdev_state_get_crop(state, 0) = ar0234->crop;
+
+	return 0;
+}
+
+static int ar0234_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		if (sel->which == V4L2_SUBDEV_FORMAT_TRY)
+			sel->r =
+				*v4l2_subdev_state_get_crop(sd_state, sel->pad);
+		else
+			sel->r = ar0234->crop;
+
+		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = AR0234_PIXEL_ARRAY_LEFT;
+		sel->r.top = AR0234_PIXEL_ARRAY_TOP;
+		sel->r.width = AR0234_PIXEL_ARRAY_WIDTH;
+		sel->r.height = AR0234_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = AR0234_NATIVE_WIDTH;
+		sel->r.height = AR0234_NATIVE_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int ar0234_set_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	struct v4l2_rect rect = sel->r;
+	struct v4l2_rect *try_crop;
+	struct v4l2_mbus_framefmt *try_fmt;
+	u32 max_left, max_top;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	max_left = AR0234_PIXEL_ARRAY_LEFT + AR0234_PIXEL_ARRAY_WIDTH -
+		   AR0234_MIN_CROP_WIDTH;
+	max_top = AR0234_PIXEL_ARRAY_TOP + AR0234_PIXEL_ARRAY_HEIGHT -
+		  AR0234_MIN_CROP_HEIGHT;
+
+	rect.left = clamp_t(u32, rect.left, AR0234_PIXEL_ARRAY_LEFT, max_left);
+	rect.top = clamp_t(u32, rect.top, AR0234_PIXEL_ARRAY_TOP, max_top);
+
+	rect.width =
+		clamp_t(u32, round_down(rect.width, AR0234_CROP_WIDTH_STEP),
+			AR0234_MIN_CROP_WIDTH, AR0234_PIXEL_ARRAY_WIDTH);
+	rect.height =
+		clamp_t(u32, round_down(rect.height, AR0234_CROP_HEIGHT_STEP),
+			AR0234_MIN_CROP_HEIGHT, AR0234_PIXEL_ARRAY_HEIGHT);
+
+	if (rect.left + rect.width - 1 >
+	    AR0234_PIXEL_ARRAY_LEFT + AR0234_PIXEL_ARRAY_WIDTH - 1)
+		rect.left = AR0234_PIXEL_ARRAY_LEFT +
+			    AR0234_PIXEL_ARRAY_WIDTH - rect.width;
+	if (rect.top + rect.height - 1 >
+	    AR0234_PIXEL_ARRAY_TOP + AR0234_PIXEL_ARRAY_HEIGHT - 1)
+		rect.top = AR0234_PIXEL_ARRAY_TOP +
+			   AR0234_PIXEL_ARRAY_HEIGHT - rect.height;
+
+	if (sel->flags & V4L2_SEL_FLAG_GE) {
+		if (rect.width < sel->r.width) {
+			u32 new_width = rect.width + AR0234_CROP_WIDTH_STEP;
+
+			if (new_width <= AR0234_PIXEL_ARRAY_WIDTH)
+				rect.width = new_width;
+		}
+
+		if (rect.height < sel->r.height) {
+			u32 new_height = rect.height + AR0234_CROP_HEIGHT_STEP;
+
+			if (new_height <= AR0234_PIXEL_ARRAY_HEIGHT)
+				rect.height = new_height;
+		}
+	}
+
+	if (sel->flags & V4L2_SEL_FLAG_LE) {
+		if (rect.width > sel->r.width && rect.width >=
+		    AR0234_MIN_CROP_WIDTH + AR0234_CROP_WIDTH_STEP)
+			rect.width -= AR0234_CROP_WIDTH_STEP;
+
+		if (rect.height > sel->r.height && rect.height >=
+		    AR0234_MIN_CROP_HEIGHT + AR0234_CROP_HEIGHT_STEP)
+			rect.height -= AR0234_CROP_HEIGHT_STEP;
+	}
+
+	if (rect.width < AR0234_MIN_CROP_WIDTH ||
+	    rect.height < AR0234_MIN_CROP_HEIGHT)
+		return -EINVAL;
+
+	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
+		try_crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
+		*try_crop = rect;
+
+		try_fmt = v4l2_subdev_state_get_format(sd_state, sel->pad);
+		if (try_fmt) {
+			try_fmt->width = rect.width;
+			try_fmt->height = rect.height;
+		}
+
+		return 0;
+	}
+
+	if (ar0234->streaming)
+		return -EBUSY;
+
+	if (ar0234->crop.left == rect.left && ar0234->crop.top == rect.top &&
+	    ar0234->crop.width == rect.width &&
+	    ar0234->crop.height == rect.height) {
+		sel->r = rect;
+
+		return 0;
+	}
+
+	ar0234->crop = rect;
+
+	try_fmt = v4l2_subdev_state_get_format(sd_state, sel->pad);
+	if (try_fmt) {
+		try_fmt->width = rect.width;
+		try_fmt->height = rect.height;
+	}
+
+	ar0234_set_framing_limits(ar0234);
+
+	sel->r = rect;
+
+	return 0;
+}
+
+static int ar0234_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	int x_addr_start, x_addr_end, y_addr_start, y_addr_end, ret;
+
+	ret = pm_runtime_resume_and_get(ar0234->dev);
+	if (ret)
+		return ret;
+
+	/* Keep for debug for a while */
+//	pr_info("pre_pll_clk_div %i\n", ar0234->pll.vt_fr.pre_pll_clk_div);
+//	pr_info("pll_multiplier %i\n", ar0234->pll.vt_fr.pll_multiplier);
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
+	cci_write(ar0234->regmap, AR0234_REG_PRE_PLL_CLK_DIV,
+		  ar0234->pll.vt_fr.pre_pll_clk_div, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_PLL_MULTIPLIER,
+		  ar0234->pll.vt_fr.pll_multiplier, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_VT_SYS_CLK_DIV,
+		  ar0234->pll.vt_bk.sys_clk_div, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_VT_PIX_CLK_DIV,
+		  ar0234->pll.vt_bk.pix_clk_div, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_OP_SYS_CLK_DIV,
+		  ar0234->pll.op_bk.sys_clk_div, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_OP_PIX_CLK_DIV,
+		  ar0234->pll.op_bk.pix_clk_div, &ret);
+	if (ret) {
+		dev_err(ar0234->dev, "Failed to setup PLL\n");
+		goto start_err;
+	}
+
+	cci_multi_reg_write(ar0234->regmap, ar0234_common_init,
+			    ARRAY_SIZE(ar0234_common_init), &ret);
+
+	cci_write(ar0234->regmap, AR0234_REG_DATA_FORMAT_BITS,
+		  DATA_FORMAT_BITS(ar0234->mode->bpp), &ret);
+	cci_write(ar0234->regmap, AR0234_REG_SERIAL_FORMAT,
+		  DATA_FORMAT_LANES(ar0234->num_data_lanes), &ret);
+
+	x_addr_start = ar0234->crop.left;
+	y_addr_start = ar0234->crop.top;
+	x_addr_end = ar0234->crop.left + ar0234->crop.width - 1;
+	y_addr_end = ar0234->crop.top + ar0234->crop.height - 1;
+
+	cci_write(ar0234->regmap, AR0234_REG_X_ADDR_START, x_addr_start, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_Y_ADDR_START, y_addr_start, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_X_ADDR_END, x_addr_end, &ret);
+	cci_write(ar0234->regmap, AR0234_REG_Y_ADDR_END, y_addr_end, &ret);
+
+	if (ret) {
+		dev_err(ar0234->dev, "Failed to setup sensor\n");
+		goto start_err;
+	}
+
+	ret = __v4l2_ctrl_handler_setup(ar0234->sd.ctrl_handler);
+
+	cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT, 1, &ret);
+	if (!ret) {
+		ar0234->streaming = true;
+		return 0;
+	}
+
+start_err:
+	pm_runtime_put_autosuspend(ar0234->dev);
+
+	return ret;
+}
+
+static int ar0234_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct ar0234 *ar0234 = to_ar0234(sd);
+	int ret;
+
+	ret = cci_write(ar0234->regmap, AR0234_REG_MODE_SELECT, 0, NULL);
+
+	ar0234->streaming = false;
+
+	pm_runtime_put_autosuspend(ar0234->dev);
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
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops ar0234_pad_ops = {
+	.enum_mbus_code = ar0234_enum_mbus_code,
+	.enum_frame_size = ar0234_enum_frame_size,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ar0234_set_pad_format,
+	.get_selection = ar0234_get_selection,
+	.set_selection = ar0234_set_selection,
+	.enable_streams = ar0234_enable_streams,
+	.disable_streams = ar0234_disable_streams,
+	.get_mbus_config = ar0234_g_mbus_config,
+};
+
+static const struct v4l2_subdev_core_ops ar0234_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops ar0234_subdev_ops = {
+	.core = &ar0234_core_ops,
+	.video = &ar0234_video_ops,
+	.pad = &ar0234_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ar0234_internal_ops = {
+	.init_state = ar0234_init_state,
+};
+
+static const struct media_entity_operations ar0234_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int ar0234_ctrls_init(struct ar0234 *ar0234)
+{
+	struct v4l2_fwnode_device_properties props;
+	int i, pixel_rate, ret;
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
+	pixel_rate =
+		ar0234->pll.pixel_rate_pixel_array * ar0234->num_data_lanes;
+	v4l2_ctrl_new_std(&ar0234->ctrls, &ar0234_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  pixel_rate, pixel_rate, 1, pixel_rate);
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
+	ar0234->link_freq =
+		v4l2_ctrl_new_int_menu(&ar0234->ctrls, &ar0234_ctrl_ops,
+				       V4L2_CID_LINK_FREQ,
+				       __fls(ar0234->link_freq_bitmap),
+				       __ffs(ar0234->link_freq_bitmap),
+				       link_freqs);
+	if (ar0234->link_freq)
+		ar0234->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ret = v4l2_ctrl_new_fwnode_properties(&ar0234->ctrls, &ar0234_ctrl_ops,
+					      &props);
+
+	if (ret)
+		return dev_err_probe(ar0234->dev, ret,
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
+	ar0234->clk = devm_v4l2_sensor_clk_get(ar0234->dev, NULL);
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
+	ar0234->crop.left = AR0234_PIXEL_ARRAY_LEFT;
+	ar0234->crop.top = AR0234_PIXEL_ARRAY_TOP;
+	ar0234->crop.width = AR0234_PIXEL_ARRAY_WIDTH;
+	ar0234->crop.height = AR0234_PIXEL_ARRAY_HEIGHT;
+
+	ar0234->mode = &ar0234_modes[0];
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
+	ar0234->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+			    V4L2_SUBDEV_FL_HAS_EVENTS;
+	ar0234->sd.entity.ops = &ar0234_subdev_entity_ops;
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
+static const struct acpi_device_id ar0234_acpi_ids[] __maybe_unused = {
+	{ "INTC10C0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ar0234_acpi_ids);
+
+static const struct of_device_id ar0234_dt_ids[] __maybe_unused = {
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
+		.acpi_match_table = ACPI_PTR(ar0234_acpi_ids),
+		.of_match_table	= of_match_ptr(ar0234_dt_ids),
+		.pm = pm_ptr(&ar0234_pm_ops),
+	},
+	.probe = ar0234_probe,
+	.remove = ar0234_remove,
+};
+module_i2c_driver(ar0234_i2c_driver);
+
+MODULE_DESCRIPTION("onsemi AR0234 Camera Sensor Driver");
+MODULE_AUTHOR("Alexander Shiyan <eagle.alexander923@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.52.0


