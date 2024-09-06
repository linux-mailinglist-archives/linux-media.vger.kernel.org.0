Return-Path: <linux-media+bounces-17797-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A59296F84E
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 17:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C0101F25ED9
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 15:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277C51D3630;
	Fri,  6 Sep 2024 15:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RXUCHIh4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB21D31B1;
	Fri,  6 Sep 2024 15:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636878; cv=none; b=MqoHEQgXjEhLkSSID6QgARNNK38Hp8lE9CP01kUA7D+ZDMVN5qXwjri6hsvGHJbs4LJ0u6SZZ9FxTIkP7LDzN1TWBWmXzXEbbZ3SolXuZGBT99GbpSk7kfN5UHzVgr95yx5oKZL2y3UK4M2NmtkgxBGB5wapfXQceHRV87KgRcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636878; c=relaxed/simple;
	bh=/4CpJcJcaiOFKmTYmqpmHo6iJpMlwG6PNRkPooXMQ/0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ayV2DaRbC7xmGFdKjUdVWx36QMZ+/n0ZBCCtTbxa7sbeGubIcMuHvqvB7Uqxh93Ssx/LcNsWnuDxTl50EEFQaiqTxYCt1IxpZJrIqOZ/Xe/V0tHy+8vRsMx76al8rHoGw1mEDkyLjE2E53d0JFxk2+oYLv7YFOw3lLy/Og3NOTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RXUCHIh4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6E0C13BE;
	Fri,  6 Sep 2024 17:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725636788;
	bh=/4CpJcJcaiOFKmTYmqpmHo6iJpMlwG6PNRkPooXMQ/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RXUCHIh4gGwdkIIk3p3ZDByFNJd2GljlepDLKBDrgsTeqPZA6X3on1j2V909iKm13
	 bg4t86dGxWYVXwxrc9fchUManPnGKfEytkKt6l9afPfTuCF1tfy9ZNTNC9iSQBk/Cf
	 derDIxb7UoWCjXQvW60bZc6abMSBtu3CzMCKeXXo=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v7 06/17] media: mali-c55: Add Mali-C55 ISP driver
Date: Fri,  6 Sep 2024 16:33:55 +0100
Message-Id: <20240906153406.650105-7-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906153406.650105-1-dan.scally@ideasonboard.com>
References: <20240906153406.650105-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for Arm's Mali-C55 Image Signal Processor. The driver is
V4L2 and Media Controller compliant and creates subdevices to manage
the ISP itself, its internal test pattern generator as well as the
crop, scaler and output format functionality for each of its two
output devices.

Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v7:

	- Wrote configurable stride to hardware
	- Moved check of number of video devices in pipeline into this driver
	- Guarded v4l2_subdev_disable_streams() behind
	  v4l2_subdev_is_streaming()
	- Added the downshifted media bus code to mali_c55_isp_fmt (and renamed
	  to mali_c55_isp_format_info)
	- Reworked configuration of the ISP. On ISP start the function will
	  wait for completion before continuing. On ISP START interrupt the
	  DMA write completion handler will now update the ISP to use the other
	  config space
	- Reworked mali_c55_update_bits() to hold the spinlock throughout the
	  operation
	- Only released the dma channel in error paths if one had been taken
	- Switched back to .remove() rather than .remove_new()
	- Returned an error if there's a timeout on ISP start
	- Set all the colourspace fields in the .init_state() functions, and
	  stopped accepting them in .set_fmt()
	- Reworked the resizer .set_fmt(), .set_selection and .enum_frame_size()
	  functions
	- Lots of minor changes

Changes in v6:

	- Reverted the rework of mali_c55_update_bits() so it matches how the
	  regmap_update_bits() function works
	- Global rename of "rzr" abbreviation for "resizer" to "rsz"
	- Added separate functions to write to hardware and register buffer. 
	- Honoured custom strides from userspace
	- Used .enable_streams(), .disable_streams() and
	  v4l2_subdev_[en|dis]able_streams() throughout
	- Only call streamon for the sensor when all video devices included in
	  the pipeline through enabled links are started.
	- Don't write registers until streamon() in the capture devices
	- Commented mutex/spinlocks
	- Moved v4l2 async notifier from isp.c to core.c
	- Reconfigured hardware in pm_runtime_resume() callback to make sure
	  they are not lost on power-off
	- A lot of other changes, which are mostly stylistic in nature. THe full
	  list is too large to include but I can send a diff between the version
	  if needed.

Changes in v5:

	- Reworked input formats - previously we allowed representing input data
	  as any 8-16 bit format. Now we only allow input data to be represented
	  by the new 20-bit bayer formats, which is corrected to the equivalent
	  16-bit format in RAW bypass mode.
	- Stopped bypassing blocks that we haven't added supporting parameters
	  for yet.
	- Addressed most of Sakari's comments from the list

Changes not yet made in v5:

	- The output pipelines can still be started and stopped independently of
	  one another - I'd like to discuss that more. 
	- the TPG subdev still uses .s_stream() - I need to rebase onto a tree
	  with working .enable_streams() for a single-source-pad subdevice.

Changes in v4:

	- Reworked mali_c55_update_bits() to internally perform the bit-shift
	- Reworked the resizer to allow cropping during streaming
	- Fixed a bug in NV12 output

Changes in v3:

	- Mostly minor fixes suggested by Sakari
	- Fixed the sequencing of vb2 buffers to be synchronised across the two
	  capture devices.

Changes in v2:

	- Clock handling
	- Fixed the warnings raised by the kernel test robot

 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/arm/Kconfig            |    5 +
 drivers/media/platform/arm/Makefile           |    2 +
 drivers/media/platform/arm/mali-c55/Kconfig   |   17 +
 drivers/media/platform/arm/mali-c55/Makefile  |    9 +
 .../platform/arm/mali-c55/mali-c55-capture.c  |  955 ++++++++++++++
 .../platform/arm/mali-c55/mali-c55-common.h   |  250 ++++
 .../platform/arm/mali-c55/mali-c55-core.c     |  950 ++++++++++++++
 .../platform/arm/mali-c55/mali-c55-isp.c      |  558 ++++++++
 .../arm/mali-c55/mali-c55-registers.h         |  313 +++++
 .../platform/arm/mali-c55/mali-c55-resizer.c  | 1142 +++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-tpg.c      |  437 +++++++
 13 files changed, 4640 insertions(+)
 create mode 100644 drivers/media/platform/arm/Kconfig
 create mode 100644 drivers/media/platform/arm/Makefile
 create mode 100644 drivers/media/platform/arm/mali-c55/Kconfig
 create mode 100644 drivers/media/platform/arm/mali-c55/Makefile
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-capture.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-common.h
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-core.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-isp.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-registers.h
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
 create mode 100644 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 85d2627776b6..4138b38c5d3f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -65,6 +65,7 @@ config VIDEO_MUX
 source "drivers/media/platform/allegro-dvt/Kconfig"
 source "drivers/media/platform/amlogic/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
+source "drivers/media/platform/arm/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
 source "drivers/media/platform/broadcom/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index ace4e34483dd..beea38efe5e2 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -8,6 +8,7 @@
 obj-y += allegro-dvt/
 obj-y += amlogic/
 obj-y += amphion/
+obj-y += arm/
 obj-y += aspeed/
 obj-y += atmel/
 obj-y += broadcom/
diff --git a/drivers/media/platform/arm/Kconfig b/drivers/media/platform/arm/Kconfig
new file mode 100644
index 000000000000..4f0764c329c7
--- /dev/null
+++ b/drivers/media/platform/arm/Kconfig
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+comment "ARM media platform drivers"
+
+source "drivers/media/platform/arm/mali-c55/Kconfig"
diff --git a/drivers/media/platform/arm/Makefile b/drivers/media/platform/arm/Makefile
new file mode 100644
index 000000000000..8cc4918725ef
--- /dev/null
+++ b/drivers/media/platform/arm/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += mali-c55/
diff --git a/drivers/media/platform/arm/mali-c55/Kconfig b/drivers/media/platform/arm/mali-c55/Kconfig
new file mode 100644
index 000000000000..6ba70e765b8d
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config VIDEO_MALI_C55
+	tristate "ARM Mali-C55 Image Signal Processor driver"
+	depends on ARCH_VEXPRESS || COMPILE_TEST
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && OF
+	select GENERIC_PHY_MIPI_DPHY
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_VMALLOC
+	help
+	  Enable this to support Arm's Mali-C55 Image Signal Processor.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mali-c55.
diff --git a/drivers/media/platform/arm/mali-c55/Makefile b/drivers/media/platform/arm/mali-c55/Makefile
new file mode 100644
index 000000000000..9178ac35e50e
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+
+mali-c55-y := mali-c55-capture.o \
+	      mali-c55-core.o \
+	      mali-c55-isp.o \
+	      mali-c55-resizer.o \
+	      mali-c55-tpg.o
+
+obj-$(CONFIG_VIDEO_MALI_C55) += mali-c55.o
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
new file mode 100644
index 000000000000..1c3991b3e5d9
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -0,0 +1,955 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - Video capture devices
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#include <linux/cleanup.h>
+#include <linux/minmax.h>
+#include <linux/pm_runtime.h>
+#include <linux/string.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-dev.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mali-c55-common.h"
+#include "mali-c55-registers.h"
+
+static const struct mali_c55_format_info mali_c55_fmts[] = {
+	/*
+	 * This table is missing some entries which need further work or
+	 * investigation:
+	 *
+	 * Base mode 1 is a backwards V4L2_PIX_FMT_XRGB32 with no V4L2 equivalent
+	 * Base mode 5 is "Generic Data"
+	 * Base mode 8 is a backwards V4L2_PIX_FMT_XYUV32 - no V4L2 equivalent
+	 * Base mode 9 seems to have no V4L2 equivalent
+	 * Base mode 17, 19 and 20 describe formats which seem to have no V4L2
+	 * equivalent
+	 */
+	{
+		.fourcc = V4L2_PIX_FMT_ARGB2101010,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_RGB121212_1X36,
+			MEDIA_BUS_FMT_RGB202020_1X60,
+		},
+		.is_raw = false,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_A2R10G10B10,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_RGB565,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_RGB121212_1X36,
+			MEDIA_BUS_FMT_RGB202020_1X60,
+		},
+		.is_raw = false,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_RGB565,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_RGB121212_1X36,
+			MEDIA_BUS_FMT_RGB202020_1X60,
+		},
+		.is_raw = false,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_RGB24,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_YUV10_1X30,
+		},
+		.is_raw = false,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_YUY2,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_YUV10_1X30,
+		},
+		.is_raw = false,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_UYVY,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_Y210,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_YUV10_1X30,
+		},
+		.is_raw = false,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_Y210,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	/*
+	 * This is something of a hack, the ISP thinks it's running NV12M but
+	 * by setting uv_plane = 0 we simply discard that planes and only output
+	 * the Y-plane.
+	 */
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_YUV10_1X30,
+		},
+		.is_raw = false,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_NV12_21,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV12M,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_YUV10_1X30,
+		},
+		.is_raw = false,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_NV12_21,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT1
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_NV21M,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_YUV10_1X30,
+		},
+		.is_raw = false,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_NV12_21,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT2
+		}
+	},
+	/*
+	 * RAW uncompressed formats are all packed in 16 bpp.
+	 * TODO: Expand this list to encompass all possible RAW formats.
+	 */
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB16,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SRGGB16_1X16,
+		},
+		.is_raw = true,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_RAW16,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR16,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SBGGR16_1X16,
+		},
+		.is_raw = true,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_RAW16,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG16,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SGBRG16_1X16,
+		},
+		.is_raw = true,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_RAW16,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG16,
+		.mbus_codes = {
+			MEDIA_BUS_FMT_SGRBG16_1X16,
+		},
+		.is_raw = true,
+		.registers = {
+			.base_mode = MALI_C55_OUTPUT_RAW16,
+			.uv_plane = MALI_C55_OUTPUT_PLANE_ALT0
+		}
+	},
+};
+
+void mali_c55_cap_dev_write(struct mali_c55_cap_dev *cap_dev, unsigned int addr,
+			    u32 val)
+{
+	mali_c55_ctx_write(cap_dev->mali_c55, addr + cap_dev->reg_offset, val);
+}
+
+static u32 mali_c55_cap_dev_read(struct mali_c55_cap_dev *cap_dev, unsigned int addr)
+{
+	return mali_c55_ctx_read(cap_dev->mali_c55, addr + cap_dev->reg_offset);
+}
+
+static void mali_c55_cap_dev_update_bits(struct mali_c55_cap_dev *cap_dev,
+					 unsigned int addr, u32 mask, u32 val)
+{
+	u32 orig, tmp;
+
+	orig = mali_c55_cap_dev_read(cap_dev, addr);
+
+	tmp = orig & ~mask;
+	tmp |= val & mask;
+
+	if (tmp != orig)
+		mali_c55_cap_dev_write(cap_dev, addr, tmp);
+}
+
+static bool
+mali_c55_mbus_code_can_produce_fmt(const struct mali_c55_format_info *fmt,
+				   u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(fmt->mbus_codes); i++) {
+		if (fmt->mbus_codes[i] == code)
+			return true;
+	}
+
+	return false;
+}
+
+bool mali_c55_format_is_raw(unsigned int mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c55_fmts); i++) {
+		if (mali_c55_fmts[i].mbus_codes[0] == mbus_code)
+			return mali_c55_fmts[i].is_raw;
+	}
+
+	return false;
+}
+
+static const struct mali_c55_format_info *
+mali_c55_format_from_pix(const u32 pixelformat)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c55_fmts); i++) {
+		if (mali_c55_fmts[i].fourcc == pixelformat)
+			return &mali_c55_fmts[i];
+	}
+
+	/*
+	 * If we find no matching pixelformat, we'll just default to the first
+	 * one for now.
+	 */
+
+	return &mali_c55_fmts[0];
+}
+
+static const char * const capture_device_names[] = {
+	"mali-c55 fr",
+	"mali-c55 ds",
+};
+
+static int mali_c55_link_validate(struct media_link *link)
+{
+	struct video_device *vdev =
+		media_entity_to_video_device(link->sink->entity);
+	struct mali_c55_cap_dev *cap_dev = video_get_drvdata(vdev);
+	struct v4l2_subdev *sd =
+		media_entity_to_v4l2_subdev(link->source->entity);
+	const struct v4l2_pix_format_mplane *pix_mp;
+	const struct mali_c55_format_info *cap_fmt;
+	struct v4l2_subdev_format sd_fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.pad = link->source->index,
+	};
+	int ret;
+
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &sd_fmt);
+	if (ret)
+		return ret;
+
+	pix_mp = &cap_dev->format.format;
+	cap_fmt = cap_dev->format.info;
+
+	if (sd_fmt.format.width != pix_mp->width ||
+	    sd_fmt.format.height != pix_mp->height) {
+		dev_dbg(cap_dev->mali_c55->dev,
+			"link '%s':%u -> '%s':%u not valid: %ux%u != %ux%u\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			sd_fmt.format.width, sd_fmt.format.height,
+			pix_mp->width, pix_mp->height);
+		return -EPIPE;
+	}
+
+	if (!mali_c55_mbus_code_can_produce_fmt(cap_fmt, sd_fmt.format.code)) {
+		dev_dbg(cap_dev->mali_c55->dev,
+			"link '%s':%u -> '%s':%u not valid: mbus_code 0x%04x cannot produce pixel format %p4cc\n",
+			link->source->entity->name, link->source->index,
+			link->sink->entity->name, link->sink->index,
+			sd_fmt.format.code, &pix_mp->pixelformat);
+		return -EPIPE;
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations mali_c55_media_ops = {
+	.link_validate = mali_c55_link_validate,
+};
+
+static int mali_c55_vb2_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+				    unsigned int *num_planes, unsigned int sizes[],
+				    struct device *alloc_devs[])
+{
+	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
+	unsigned int i;
+
+	if (*num_planes) {
+		if (*num_planes != cap_dev->format.format.num_planes)
+			return -EINVAL;
+
+		for (i = 0; i < cap_dev->format.format.num_planes; i++)
+			if (sizes[i] < cap_dev->format.format.plane_fmt[i].sizeimage)
+				return -EINVAL;
+	} else {
+		*num_planes = cap_dev->format.format.num_planes;
+		for (i = 0; i < cap_dev->format.format.num_planes; i++)
+			sizes[i] = cap_dev->format.format.plane_fmt[i].sizeimage;
+	}
+
+	return 0;
+}
+
+static void mali_c55_buf_queue(struct vb2_buffer *vb)
+{
+	struct mali_c55_cap_dev *cap_dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_buffer *buf = container_of(vbuf,
+						   struct mali_c55_buffer, vb);
+	unsigned int i;
+
+	buf->planes_pending = cap_dev->format.format.num_planes;
+
+	for (i = 0; i < cap_dev->format.format.num_planes; i++) {
+		unsigned long size = cap_dev->format.format.plane_fmt[i].sizeimage;
+
+		vb2_set_plane_payload(vb, i, size);
+	}
+
+	buf->vb.field = V4L2_FIELD_NONE;
+
+	spin_lock(&cap_dev->buffers.lock);
+	list_add_tail(&buf->queue, &cap_dev->buffers.queue);
+	spin_unlock(&cap_dev->buffers.lock);
+}
+
+static int mali_c55_buf_init(struct vb2_buffer *vb)
+{
+	struct mali_c55_cap_dev *cap_dev = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct mali_c55_buffer *buf = container_of(vbuf,
+						   struct mali_c55_buffer, vb);
+	unsigned int i;
+
+	for (i = 0; i < cap_dev->format.format.num_planes; i++)
+		buf->addrs[i] = vb2_dma_contig_plane_dma_addr(vb, i);
+
+	return 0;
+}
+
+void mali_c55_set_next_buffer(struct mali_c55_cap_dev *cap_dev)
+{
+	guard(spinlock)(&cap_dev->buffers.lock);
+
+	cap_dev->buffers.curr = cap_dev->buffers.next;
+	cap_dev->buffers.next = NULL;
+
+	if (!list_empty(&cap_dev->buffers.queue)) {
+		struct v4l2_pix_format_mplane *pix_mp;
+		dma_addr_t *addrs;
+
+		pix_mp = &cap_dev->format.format;
+
+		mali_c55_cap_dev_update_bits(cap_dev,
+				MALI_C55_REG_Y_WRITER_MODE,
+				MALI_C55_WRITER_FRAME_WRITE_MASK,
+				MALI_C55_WRITER_FRAME_WRITE_ENABLE);
+		if (cap_dev->format.info->registers.uv_plane)
+			mali_c55_cap_dev_update_bits(cap_dev,
+				MALI_C55_REG_UV_WRITER_MODE,
+				MALI_C55_WRITER_FRAME_WRITE_MASK,
+				MALI_C55_WRITER_FRAME_WRITE_ENABLE);
+
+		cap_dev->buffers.next = list_first_entry(&cap_dev->buffers.queue,
+							 struct mali_c55_buffer,
+							 queue);
+		list_del(&cap_dev->buffers.next->queue);
+
+		addrs = cap_dev->buffers.next->addrs;
+		mali_c55_cap_dev_write(cap_dev,
+				       MALI_C55_REG_Y_WRITER_BANKS_BASE,
+				       addrs[MALI_C55_PLANE_Y]);
+		mali_c55_cap_dev_write(cap_dev,
+				       MALI_C55_REG_UV_WRITER_BANKS_BASE,
+				       addrs[MALI_C55_PLANE_UV]);
+
+		mali_c55_cap_dev_write(cap_dev,
+			MALI_C55_REG_Y_WRITER_OFFSET,
+			pix_mp->plane_fmt[MALI_C55_PLANE_Y].bytesperline);
+		mali_c55_cap_dev_write(cap_dev,
+			MALI_C55_REG_UV_WRITER_OFFSET,
+			pix_mp->plane_fmt[MALI_C55_PLANE_UV].bytesperline);
+	} else {
+		/*
+		 * If we underflow then we can tell the ISP that we don't want
+		 * to write out the next frame.
+		 */
+		mali_c55_cap_dev_update_bits(cap_dev,
+					     MALI_C55_REG_Y_WRITER_MODE,
+					     MALI_C55_WRITER_FRAME_WRITE_MASK,
+					     0x00);
+		mali_c55_cap_dev_update_bits(cap_dev,
+					     MALI_C55_REG_UV_WRITER_MODE,
+					     MALI_C55_WRITER_FRAME_WRITE_MASK,
+					     0x00);
+	}
+}
+
+static void mali_c55_handle_buffer(struct mali_c55_buffer *curr_buf,
+				   unsigned int framecount)
+{
+	curr_buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
+	curr_buf->vb.sequence = framecount;
+	vb2_buffer_done(&curr_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+}
+
+/**
+ * mali_c55_set_plane_done - mark the plane as written and process the buffer if
+ *			     both planes are finished.
+ * @cap_dev:  pointer to the fr or ds pipe output
+ * @plane:    the plane to mark as completed
+ *
+ * The Mali C55 ISP has muliplanar outputs for some formats that come with two
+ * separate "buffer write completed" interrupts - we need to flag each plane's
+ * completion and check whether both planes are done - if so, complete the buf
+ * in vb2.
+ */
+void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
+			     enum mali_c55_planes plane)
+{
+	struct mali_c55_isp *isp = &cap_dev->mali_c55->isp;
+	struct mali_c55_buffer *curr_buf;
+
+	guard(spinlock)(&cap_dev->buffers.lock);
+	curr_buf = cap_dev->buffers.curr;
+
+	/*
+	 * If the stream was stopped, the buffer might have been sent back to
+	 * userspace already.
+	 */
+	if (!curr_buf)
+		return;
+
+	/* If the other plane is also done... */
+	if (!--curr_buf->planes_pending) {
+		mali_c55_handle_buffer(curr_buf, isp->frame_sequence);
+		cap_dev->buffers.curr = NULL;
+		isp->frame_sequence++;
+	}
+}
+
+static void mali_c55_cap_dev_stream_disable(struct mali_c55_cap_dev *cap_dev)
+{
+	mali_c55_cap_dev_update_bits(cap_dev, MALI_C55_REG_Y_WRITER_MODE,
+				     MALI_C55_WRITER_FRAME_WRITE_MASK, 0x00);
+	mali_c55_cap_dev_update_bits(cap_dev, MALI_C55_REG_UV_WRITER_MODE,
+				     MALI_C55_WRITER_FRAME_WRITE_MASK, 0x00);
+}
+
+static void mali_c55_cap_dev_stream_enable(struct mali_c55_cap_dev *cap_dev)
+{
+	/*
+	 * The Mali ISP can hold up to 5 buffer addresses and simply cycle
+	 * through them, but it's not clear to me that the vb2 queue _guarantees_
+	 * it will queue buffers to the driver in a fixed order, and ensuring
+	 * we call vb2_buffer_done() for the right buffer seems to me to add
+	 * pointless complexity given in multi-context mode we'd need to
+	 * re-write those registers every frame anyway...so we tell the ISP to
+	 * use a single register and update it for each frame.
+	 */
+	mali_c55_cap_dev_update_bits(cap_dev,
+				     MALI_C55_REG_Y_WRITER_BANKS_CONFIG,
+				     MALI_C55_REG_Y_WRITER_MAX_BANKS_MASK, 0);
+	mali_c55_cap_dev_update_bits(cap_dev,
+				     MALI_C55_REG_UV_WRITER_BANKS_CONFIG,
+				     MALI_C55_REG_UV_WRITER_MAX_BANKS_MASK, 0);
+
+	mali_c55_set_next_buffer(cap_dev);
+}
+
+static void mali_c55_cap_dev_return_buffers(struct mali_c55_cap_dev *cap_dev,
+					    enum vb2_buffer_state state)
+{
+	struct mali_c55_buffer *buf, *tmp;
+
+	guard(spinlock)(&cap_dev->buffers.lock);
+
+	if (cap_dev->buffers.curr) {
+		vb2_buffer_done(&cap_dev->buffers.curr->vb.vb2_buf,
+				state);
+		cap_dev->buffers.curr = NULL;
+	}
+
+	if (cap_dev->buffers.next) {
+		vb2_buffer_done(&cap_dev->buffers.next->vb.vb2_buf,
+				state);
+		cap_dev->buffers.next = NULL;
+	}
+
+	list_for_each_entry_safe(buf, tmp, &cap_dev->buffers.queue, queue) {
+		list_del(&buf->queue);
+		vb2_buffer_done(&buf->vb.vb2_buf, state);
+	}
+}
+
+static void mali_c55_cap_dev_format_configure(struct mali_c55_cap_dev *cap_dev)
+{
+	const struct mali_c55_format_info *capture_format = cap_dev->format.info;
+	const struct v4l2_pix_format_mplane *pix_mp = &cap_dev->format.format;
+	const struct v4l2_format_info *info;
+
+	info = v4l2_format_info(pix_mp->pixelformat);
+	if (WARN_ON(!info))
+		return;
+
+	mali_c55_cap_dev_write(cap_dev, MALI_C55_REG_Y_WRITER_MODE,
+			       capture_format->registers.base_mode);
+	mali_c55_cap_dev_write(cap_dev, MALI_C55_REG_ACTIVE_OUT_Y_SIZE,
+			       MALI_C55_REG_ACTIVE_OUT_SIZE_W(pix_mp->width) |
+			       MALI_C55_REG_ACTIVE_OUT_SIZE_H(pix_mp->height));
+
+	if (info->mem_planes > 1) {
+		mali_c55_cap_dev_write(cap_dev, MALI_C55_REG_UV_WRITER_MODE,
+				       capture_format->registers.base_mode);
+		mali_c55_cap_dev_update_bits(cap_dev,
+			MALI_C55_REG_UV_WRITER_MODE,
+			MALI_C55_WRITER_SUBMODE_MASK,
+			MALI_C55_WRITER_SUBMODE(capture_format->registers.uv_plane));
+
+		mali_c55_cap_dev_write(cap_dev, MALI_C55_REG_ACTIVE_OUT_UV_SIZE,
+				MALI_C55_REG_ACTIVE_OUT_SIZE_W(pix_mp->width) |
+				MALI_C55_REG_ACTIVE_OUT_SIZE_H(pix_mp->height));
+	}
+
+	if (info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		mali_c55_cap_dev_write(cap_dev, MALI_C55_REG_CS_CONV_CONFIG,
+				       MALI_C55_CS_CONV_MATRIX_MASK);
+
+		if (info->hdiv > 1)
+			mali_c55_cap_dev_update_bits(cap_dev,
+				MALI_C55_REG_CS_CONV_CONFIG,
+				MALI_C55_CS_CONV_HORZ_DOWNSAMPLE_MASK,
+				MALI_C55_CS_CONV_HORZ_DOWNSAMPLE_ENABLE);
+		if (info->vdiv > 1)
+			mali_c55_cap_dev_update_bits(cap_dev,
+				MALI_C55_REG_CS_CONV_CONFIG,
+				MALI_C55_CS_CONV_VERT_DOWNSAMPLE_MASK,
+				MALI_C55_CS_CONV_VERT_DOWNSAMPLE_ENABLE);
+		if (info->hdiv > 1 || info->vdiv > 1)
+			mali_c55_cap_dev_update_bits(cap_dev,
+				MALI_C55_REG_CS_CONV_CONFIG,
+				MALI_C55_CS_CONV_FILTER_MASK,
+				MALI_C55_CS_CONV_FILTER_ENABLE);
+	}
+}
+
+static int mali_c55_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
+	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
+	struct mali_c55_resizer *rsz = cap_dev->rsz;
+	struct mali_c55_isp *isp = &mali_c55->isp;
+	int ret;
+
+	guard(mutex)(&isp->capture_lock);
+
+	ret = pm_runtime_resume_and_get(mali_c55->dev);
+	if (ret)
+		return ret;
+
+	ret = video_device_pipeline_start(&cap_dev->vdev,
+					  &cap_dev->mali_c55->pipe);
+	if (ret) {
+		dev_dbg(mali_c55->dev, "%s failed to start media pipeline\n",
+			cap_dev->vdev.name);
+		goto err_pm_put;
+	}
+
+	mali_c55_cap_dev_format_configure(cap_dev);
+	mali_c55_cap_dev_stream_enable(cap_dev);
+
+	ret = v4l2_subdev_enable_streams(&rsz->sd, MALI_C55_RSZ_SOURCE_PAD,
+					 BIT(0));
+	if (ret)
+		goto err_disable_cap_dev;
+
+	if (mali_c55_pipeline_ready(mali_c55)) {
+		/*
+		 * The ISP has a "processed" and "bypass" source pad, but they
+		 * don't have a separate start process so we'll just start the
+		 * processed pad unconditionally.
+		 */
+		ret = v4l2_subdev_enable_streams(&mali_c55->isp.sd,
+						 MALI_C55_ISP_PAD_SOURCE_VIDEO,
+						 BIT(0));
+		if (ret)
+			goto err_disable_rsz;
+	}
+
+	return 0;
+
+err_disable_rsz:
+	v4l2_subdev_disable_streams(&rsz->sd, MALI_C55_RSZ_SOURCE_PAD, BIT(0));
+err_disable_cap_dev:
+	mali_c55_cap_dev_stream_disable(cap_dev);
+	video_device_pipeline_stop(&cap_dev->vdev);
+err_pm_put:
+	pm_runtime_put(mali_c55->dev);
+	mali_c55_cap_dev_return_buffers(cap_dev, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void mali_c55_vb2_stop_streaming(struct vb2_queue *q)
+{
+	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
+	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
+	struct mali_c55_resizer *rsz = cap_dev->rsz;
+	struct mali_c55_isp *isp = &mali_c55->isp;
+
+	guard(mutex)(&isp->capture_lock);
+
+	if (v4l2_subdev_is_streaming(&mali_c55->isp.sd))
+		v4l2_subdev_disable_streams(&mali_c55->isp.sd,
+					MALI_C55_ISP_PAD_SOURCE_VIDEO, BIT(0));
+
+	v4l2_subdev_disable_streams(&rsz->sd, MALI_C55_RSZ_SOURCE_PAD, BIT(0));
+	mali_c55_cap_dev_stream_disable(cap_dev);
+	mali_c55_cap_dev_return_buffers(cap_dev, VB2_BUF_STATE_ERROR);
+	video_device_pipeline_stop(&cap_dev->vdev);
+	pm_runtime_put_autosuspend(mali_c55->dev);
+	pm_runtime_mark_last_busy(mali_c55->dev);
+}
+
+static const struct vb2_ops mali_c55_vb2_ops = {
+	.queue_setup		= &mali_c55_vb2_queue_setup,
+	.buf_queue		= &mali_c55_buf_queue,
+	.buf_init		= &mali_c55_buf_init,
+	.wait_prepare		= vb2_ops_wait_prepare,
+	.wait_finish		= vb2_ops_wait_finish,
+	.start_streaming	= &mali_c55_vb2_start_streaming,
+	.stop_streaming		= &mali_c55_vb2_stop_streaming,
+};
+
+static const struct v4l2_file_operations mali_c55_v4l2_fops = {
+	.owner = THIS_MODULE,
+	.unlocked_ioctl = video_ioctl2,
+	.open = v4l2_fh_open,
+	.release = vb2_fop_release,
+	.poll = vb2_fop_poll,
+	.mmap = vb2_fop_mmap,
+};
+
+static void mali_c55_try_fmt(struct v4l2_pix_format_mplane *pix_mp)
+{
+	const struct mali_c55_format_info *capture_format;
+	const struct v4l2_format_info *info;
+	struct v4l2_plane_pix_format *plane, *y_plane;
+	unsigned int padding;
+	unsigned int i;
+
+	capture_format = mali_c55_format_from_pix(pix_mp->pixelformat);
+	pix_mp->pixelformat = capture_format->fourcc;
+
+	pix_mp->width = clamp(pix_mp->width, MALI_C55_MIN_WIDTH,
+			      MALI_C55_MAX_WIDTH);
+	pix_mp->height = clamp(pix_mp->height, MALI_C55_MIN_HEIGHT,
+			       MALI_C55_MAX_HEIGHT);
+
+	pix_mp->field = V4L2_FIELD_NONE;
+	pix_mp->colorspace = V4L2_COLORSPACE_DEFAULT;
+	pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pix_mp->quantization = V4L2_QUANTIZATION_DEFAULT;
+
+	info = v4l2_format_info(pix_mp->pixelformat);
+	pix_mp->num_planes = info->mem_planes;
+	memset(pix_mp->plane_fmt, 0, sizeof(pix_mp->plane_fmt));
+
+	y_plane = &pix_mp->plane_fmt[0];
+	y_plane->bytesperline = clamp(y_plane->bytesperline,
+				      info->bpp[0] * pix_mp->width, 65535U);
+	y_plane->sizeimage = y_plane->bytesperline * pix_mp->height;
+
+	padding = y_plane->bytesperline - (pix_mp->width * info->bpp[0]);
+
+	for (i = 1; i < info->comp_planes; i++) {
+		plane = &pix_mp->plane_fmt[i];
+
+		plane->bytesperline = DIV_ROUND_UP(info->bpp[i] * pix_mp->width,
+						   info->hdiv) + padding;
+		plane->sizeimage = DIV_ROUND_UP(
+					plane->bytesperline * pix_mp->height,
+					info->vdiv);
+	}
+
+	if (info->mem_planes == 1) {
+		for (i = 1; i < info->comp_planes; i++) {
+			plane = &pix_mp->plane_fmt[i];
+			y_plane->sizeimage += plane->sizeimage;
+		}
+	}
+}
+
+static int mali_c55_try_fmt_vid_cap_mplane(struct file *file, void *fh,
+					   struct v4l2_format *f)
+{
+	mali_c55_try_fmt(&f->fmt.pix_mp);
+
+	return 0;
+}
+
+static void mali_c55_set_format(struct mali_c55_cap_dev *cap_dev,
+				struct v4l2_pix_format_mplane *pix_mp)
+{
+	mali_c55_try_fmt(pix_mp);
+
+	cap_dev->format.format = *pix_mp;
+	cap_dev->format.info = mali_c55_format_from_pix(pix_mp->pixelformat);
+}
+
+static int mali_c55_s_fmt_vid_cap_mplane(struct file *file, void *fh,
+					 struct v4l2_format *f)
+{
+	struct mali_c55_cap_dev *cap_dev = video_drvdata(file);
+
+	if (vb2_is_busy(&cap_dev->queue))
+		return -EBUSY;
+
+	mali_c55_set_format(cap_dev, &f->fmt.pix_mp);
+
+	return 0;
+}
+
+static int mali_c55_g_fmt_vid_cap_mplane(struct file *file, void *fh,
+					 struct v4l2_format *f)
+{
+	struct mali_c55_cap_dev *cap_dev = video_drvdata(file);
+
+	f->fmt.pix_mp = cap_dev->format.format;
+
+	return 0;
+}
+
+static int mali_c55_enum_fmt_vid_cap_mplane(struct file *file, void *fh,
+					    struct v4l2_fmtdesc *f)
+{
+	struct mali_c55_cap_dev *cap_dev = video_drvdata(file);
+	unsigned int j = 0;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c55_fmts); i++) {
+		if (f->mbus_code &&
+		    !mali_c55_mbus_code_can_produce_fmt(&mali_c55_fmts[i],
+							f->mbus_code))
+			continue;
+
+		/* Downscale pipe can't output RAW formats */
+		if (mali_c55_fmts[i].is_raw &&
+		    cap_dev->reg_offset == MALI_C55_CAP_DEV_DS_REG_OFFSET)
+			continue;
+
+		if (j++ == f->index) {
+			f->pixelformat = mali_c55_fmts[i].fourcc;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int mali_c55_querycap(struct file *file, void *fh,
+			     struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, MALI_C55_DRIVER_NAME, sizeof(cap->driver));
+	strscpy(cap->card, "ARM Mali-C55 ISP", sizeof(cap->card));
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops mali_c55_v4l2_ioctl_ops = {
+	.vidioc_reqbufs = vb2_ioctl_reqbufs,
+	.vidioc_querybuf = vb2_ioctl_querybuf,
+	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_qbuf = vb2_ioctl_qbuf,
+	.vidioc_expbuf = vb2_ioctl_expbuf,
+	.vidioc_dqbuf = vb2_ioctl_dqbuf,
+	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
+	.vidioc_streamon = vb2_ioctl_streamon,
+	.vidioc_streamoff = vb2_ioctl_streamoff,
+	.vidioc_try_fmt_vid_cap_mplane = mali_c55_try_fmt_vid_cap_mplane,
+	.vidioc_s_fmt_vid_cap_mplane = mali_c55_s_fmt_vid_cap_mplane,
+	.vidioc_g_fmt_vid_cap_mplane = mali_c55_g_fmt_vid_cap_mplane,
+	.vidioc_enum_fmt_vid_cap = mali_c55_enum_fmt_vid_cap_mplane,
+	.vidioc_querycap = mali_c55_querycap,
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static int mali_c55_register_cap_dev(struct mali_c55 *mali_c55,
+				     enum mali_c55_cap_devs cap_dev_id)
+{
+	struct mali_c55_cap_dev *cap_dev = &mali_c55->cap_devs[cap_dev_id];
+	struct v4l2_pix_format_mplane pix_mp;
+	struct video_device *vdev;
+	struct vb2_queue *vb2q;
+	int ret;
+
+	vdev = &cap_dev->vdev;
+	vb2q = &cap_dev->queue;
+
+	cap_dev->mali_c55 = mali_c55;
+	mutex_init(&cap_dev->lock);
+	INIT_LIST_HEAD(&cap_dev->buffers.queue);
+
+	switch (cap_dev_id) {
+	case MALI_C55_CAP_DEV_FR:
+		cap_dev->rsz = &mali_c55->resizers[MALI_C55_RSZ_FR];
+		cap_dev->reg_offset = MALI_C55_CAP_DEV_FR_REG_OFFSET;
+		break;
+	case MALI_C55_CAP_DEV_DS:
+		cap_dev->rsz = &mali_c55->resizers[MALI_C55_RSZ_DS];
+		cap_dev->reg_offset = MALI_C55_CAP_DEV_DS_REG_OFFSET;
+		break;
+	default:
+		ret = -EINVAL;
+		goto err_destroy_mutex;
+	}
+
+	cap_dev->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&cap_dev->vdev.entity, 1, &cap_dev->pad);
+	if (ret) {
+		mutex_destroy(&cap_dev->lock);
+		goto err_destroy_mutex;
+	}
+
+	vb2q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	vb2q->io_modes = VB2_MMAP | VB2_DMABUF;
+	vb2q->drv_priv = cap_dev;
+	vb2q->mem_ops = &vb2_dma_contig_memops;
+	vb2q->ops = &mali_c55_vb2_ops;
+	vb2q->buf_struct_size = sizeof(struct mali_c55_buffer);
+	vb2q->min_queued_buffers = 1;
+	vb2q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	vb2q->lock = &cap_dev->lock;
+	vb2q->dev = mali_c55->dev;
+
+	ret = vb2_queue_init(vb2q);
+	if (ret) {
+		dev_err(mali_c55->dev, "%s vb2 queue init failed\n",
+			cap_dev->vdev.name);
+		goto err_cleanup_media_entity;
+	}
+
+	strscpy(cap_dev->vdev.name, capture_device_names[cap_dev_id],
+		sizeof(cap_dev->vdev.name));
+	vdev->release = video_device_release_empty;
+	vdev->fops = &mali_c55_v4l2_fops;
+	vdev->ioctl_ops = &mali_c55_v4l2_ioctl_ops;
+	vdev->lock = &cap_dev->lock;
+	vdev->v4l2_dev = &mali_c55->v4l2_dev;
+	vdev->queue = &cap_dev->queue;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+				V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
+	vdev->entity.ops = &mali_c55_media_ops;
+	video_set_drvdata(vdev, cap_dev);
+
+	memset(&pix_mp, 0, sizeof(pix_mp));
+	pix_mp.pixelformat = V4L2_PIX_FMT_RGB565;
+	pix_mp.width = MALI_C55_DEFAULT_WIDTH;
+	pix_mp.height = MALI_C55_DEFAULT_HEIGHT;
+	mali_c55_set_format(cap_dev, &pix_mp);
+
+	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		dev_err(mali_c55->dev,
+			"%s failed to register video device\n",
+			cap_dev->vdev.name);
+		goto err_release_vb2q;
+	}
+
+	return 0;
+
+err_release_vb2q:
+	vb2_queue_release(vb2q);
+err_cleanup_media_entity:
+	media_entity_cleanup(&cap_dev->vdev.entity);
+err_destroy_mutex:
+	mutex_destroy(&cap_dev->lock);
+
+	return ret;
+}
+
+int mali_c55_register_capture_devs(struct mali_c55 *mali_c55)
+{
+	int ret;
+
+	ret = mali_c55_register_cap_dev(mali_c55, MALI_C55_CAP_DEV_FR);
+	if (ret)
+		return ret;
+
+	if (mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED) {
+		ret = mali_c55_register_cap_dev(mali_c55, MALI_C55_CAP_DEV_DS);
+		if (ret) {
+			mali_c55_unregister_capture_devs(mali_c55);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void mali_c55_unregister_cap_dev(struct mali_c55 *mali_c55,
+					enum mali_c55_cap_devs cap_dev_id)
+{
+	struct mali_c55_cap_dev *cap_dev = &mali_c55->cap_devs[cap_dev_id];
+
+	if (!video_is_registered(&cap_dev->vdev))
+		return;
+
+	vb2_video_unregister_device(&cap_dev->vdev);
+	media_entity_cleanup(&cap_dev->vdev.entity);
+	mutex_destroy(&cap_dev->lock);
+}
+
+void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55)
+{
+	mali_c55_unregister_cap_dev(mali_c55, MALI_C55_CAP_DEV_FR);
+	if (mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED)
+		mali_c55_unregister_cap_dev(mali_c55, MALI_C55_CAP_DEV_DS);
+}
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
new file mode 100644
index 000000000000..7926bb3f4437
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
@@ -0,0 +1,250 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ARM Mali-C55 ISP Driver - Common definitions
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#ifndef _MALI_C55_COMMON_H
+#define _MALI_C55_COMMON_H
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/videodev2.h>
+
+#include <media/media-device.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-dev.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+#include <media/videobuf2-core.h>
+#include <media/videobuf2-v4l2.h>
+
+#define MALI_C55_DRIVER_NAME		"mali-c55"
+
+/* min and max values for the image sizes */
+#define MALI_C55_MIN_WIDTH		640U
+#define MALI_C55_MIN_HEIGHT		480U
+#define MALI_C55_MAX_WIDTH		8192U
+#define MALI_C55_MAX_HEIGHT		8192U
+#define MALI_C55_DEFAULT_WIDTH		1920U
+#define MALI_C55_DEFAULT_HEIGHT		1080U
+
+#define MALI_C55_DEFAULT_MEDIA_BUS_FMT	MEDIA_BUS_FMT_RGB121212_1X36
+
+#define MALI_C55_NUM_CLKS		2
+
+struct device;
+struct dma_chan;
+struct mali_c55;
+struct mali_c55_cap_dev;
+struct platform_device;
+struct resource;
+
+enum mali_c55_isp_pads {
+	MALI_C55_ISP_PAD_SINK_VIDEO,
+	MALI_C55_ISP_PAD_SOURCE_VIDEO,
+	MALI_C55_ISP_PAD_SOURCE_BYPASS,
+	MALI_C55_ISP_NUM_PADS,
+};
+
+struct mali_c55_tpg {
+	struct mali_c55 *mali_c55;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct mali_c55_tpg_ctrls {
+		struct v4l2_ctrl_handler handler;
+		struct v4l2_ctrl *vblank;
+	} ctrls;
+};
+
+struct mali_c55_isp {
+	struct mali_c55 *mali_c55;
+	struct v4l2_subdev sd;
+	struct media_pad pads[MALI_C55_ISP_NUM_PADS];
+	struct media_pad *remote_src;
+	/* Mutex to guard vb2 start/stop streaming */
+	struct mutex capture_lock;
+	unsigned int frame_sequence;
+};
+
+enum mali_c55_resizer_ids {
+	MALI_C55_RSZ_FR,
+	MALI_C55_RSZ_DS,
+	MALI_C55_NUM_RSZS,
+};
+
+enum mali_c55_rsz_pads {
+	MALI_C55_RSZ_SINK_PAD,
+	MALI_C55_RSZ_SOURCE_PAD,
+	MALI_C55_RSZ_SINK_BYPASS_PAD,
+	MALI_C55_RSZ_NUM_PADS
+};
+
+struct mali_c55_resizer {
+	struct mali_c55 *mali_c55;
+	struct mali_c55_cap_dev *cap_dev;
+	enum mali_c55_resizer_ids id;
+	struct v4l2_subdev sd;
+	struct media_pad pads[MALI_C55_RSZ_NUM_PADS];
+	unsigned int num_routes;
+};
+
+enum mali_c55_cap_devs {
+	MALI_C55_CAP_DEV_FR,
+	MALI_C55_CAP_DEV_DS,
+	MALI_C55_NUM_CAP_DEVS
+};
+
+struct mali_c55_format_info {
+	u32 fourcc;
+	/*
+	 * The output formats can be produced by a couple of different media bus
+	 * formats, depending on how the ISP is configured.
+	 */
+	unsigned int mbus_codes[2];
+	bool is_raw;
+	struct {
+		u32 base_mode;
+		u32 uv_plane;
+	} registers;
+};
+
+struct mali_c55_isp_format_info {
+	u32 code;
+	u32 shifted_code;
+	bool bypass;
+	u32 order;
+};
+
+enum mali_c55_planes {
+	MALI_C55_PLANE_Y,
+	MALI_C55_PLANE_UV,
+	MALI_C55_NUM_PLANES
+};
+
+struct mali_c55_buffer {
+	struct vb2_v4l2_buffer vb;
+	unsigned int planes_pending;
+	struct list_head queue;
+	dma_addr_t addrs[MALI_C55_NUM_PLANES];
+};
+
+struct mali_c55_cap_dev {
+	struct mali_c55 *mali_c55;
+	struct mali_c55_resizer *rsz;
+	struct video_device vdev;
+	struct media_pad pad;
+	struct vb2_queue queue;
+	/* Mutex to provide to vb2 */
+	struct mutex lock;
+	unsigned int reg_offset;
+
+	struct {
+		const struct mali_c55_format_info *info;
+		struct v4l2_pix_format_mplane format;
+	} format;
+
+	struct {
+		/* Spinlock to guard buffer queue */
+		spinlock_t lock;
+		struct list_head queue;
+		struct mali_c55_buffer *curr;
+		struct mali_c55_buffer *next;
+	} buffers;
+
+	bool streaming;
+};
+
+enum mali_c55_config_spaces {
+	MALI_C55_CONFIG_PING,
+	MALI_C55_CONFIG_PONG,
+};
+
+/**
+ * struct mali_c55_context - Fields relating to a single camera context
+ *
+ * @mali_c55:	Pointer to the main struct mali_c55
+ * @registers:	A pointer to some allocated memory holding register
+ *		values to be written to the hardware at frame interrupt
+ * @base:	Base address of the config space in the hardware
+ * @lock:	A spinlock to protect against writes to @registers whilst that
+ *		space is being copied to the hardware
+ * @list:	A list head to facilitate a context queue
+ */
+struct mali_c55_context {
+	struct mali_c55 *mali_c55;
+	u32 *registers;
+	phys_addr_t base;
+	/* Spinlock to prevent simultaneous access of register space */
+	spinlock_t lock;
+	struct list_head list;
+};
+
+struct mali_c55 {
+	struct device *dev;
+	void __iomem *base;
+	struct dma_chan *channel;
+	struct clk_bulk_data clks[MALI_C55_NUM_CLKS];
+
+	u16 capabilities;
+	struct media_device media_dev;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_async_notifier notifier;
+	struct media_pipeline pipe;
+
+	struct mali_c55_tpg tpg;
+	struct mali_c55_isp isp;
+	struct mali_c55_resizer resizers[MALI_C55_NUM_RSZS];
+	struct mali_c55_cap_dev cap_devs[MALI_C55_NUM_CAP_DEVS];
+
+	struct mali_c55_context context;
+	u32 next_config;
+};
+
+void mali_c55_write(struct mali_c55 *mali_c55, unsigned int addr, u32 val);
+void mali_c55_cap_dev_write(struct mali_c55_cap_dev *cap_dev, unsigned int addr,
+			    u32 val);
+void mali_c55_update_bits(struct mali_c55 *mali_c55, unsigned int addr,
+			  u32 mask, u32 val);
+u32 mali_c55_read(struct mali_c55 *mali_c55, unsigned int addr);
+void mali_c55_ctx_write(struct mali_c55 *mali_c55, unsigned int addr, u32 val);
+u32 mali_c55_ctx_read(struct mali_c55 *mali_c55, unsigned int addr);
+void mali_c55_ctx_update_bits(struct mali_c55 *mali_c55, unsigned int addr,
+			      u32 mask, u32 val);
+
+int mali_c55_config_write(struct mali_c55_context *ctx,
+			  enum mali_c55_config_spaces cfg_space,
+			  bool force_synchronous);
+
+int mali_c55_register_isp(struct mali_c55 *mali_c55);
+int mali_c55_register_tpg(struct mali_c55 *mali_c55);
+void mali_c55_unregister_tpg(struct mali_c55 *mali_c55);
+void mali_c55_unregister_isp(struct mali_c55 *mali_c55);
+int mali_c55_register_resizers(struct mali_c55 *mali_c55);
+void mali_c55_unregister_resizers(struct mali_c55 *mali_c55);
+int mali_c55_register_capture_devs(struct mali_c55 *mali_c55);
+void mali_c55_unregister_capture_devs(struct mali_c55 *mali_c55);
+struct mali_c55_context *mali_c55_get_active_context(struct mali_c55 *mali_c55);
+void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
+			     enum mali_c55_planes plane);
+void mali_c55_set_next_buffer(struct mali_c55_cap_dev *cap_dev);
+void mali_c55_isp_queue_event_sof(struct mali_c55 *mali_c55);
+
+bool mali_c55_format_is_raw(unsigned int mbus_code);
+
+const struct mali_c55_isp_format_info *
+mali_c55_isp_fmt_next(const struct mali_c55_isp_format_info *fmt);
+const struct mali_c55_isp_format_info *
+mali_c55_isp_get_mbus_config_by_code(u32 code);
+const struct mali_c55_isp_format_info *
+mali_c55_isp_get_mbus_config_by_shifted_code(u32 code);
+const struct mali_c55_isp_format_info *
+mali_c55_isp_get_mbus_config_by_index(u32 index);
+bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55);
+
+#endif /* _MALI_C55_COMMON_H */
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
new file mode 100644
index 000000000000..48cd0bec3f58
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -0,0 +1,950 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - Core driver code
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/ioport.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mc.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "mali-c55-common.h"
+#include "mali-c55-registers.h"
+
+static const char * const mali_c55_interrupt_names[] = {
+	[MALI_C55_IRQ_ISP_START] = "ISP start",
+	[MALI_C55_IRQ_ISP_DONE] = "ISP done",
+	[MALI_C55_IRQ_MCM_ERROR] = "Multi-context management error",
+	[MALI_C55_IRQ_BROKEN_FRAME_ERROR] = "Broken frame error",
+	[MALI_C55_IRQ_MET_AF_DONE] = "AF metering done",
+	[MALI_C55_IRQ_MET_AEXP_DONE] = "AEXP metering done",
+	[MALI_C55_IRQ_MET_AWB_DONE] = "AWB metering done",
+	[MALI_C55_IRQ_AEXP_1024_DONE] = "AEXP 1024-bit histogram done",
+	[MALI_C55_IRQ_IRIDIX_MET_DONE] = "Iridix metering done",
+	[MALI_C55_IRQ_LUT_INIT_DONE] = "LUT memory init done",
+	[MALI_C55_IRQ_FR_Y_DONE] = "Full resolution Y plane DMA done",
+	[MALI_C55_IRQ_FR_UV_DONE] = "Full resolution U/V plane DMA done",
+	[MALI_C55_IRQ_DS_Y_DONE] = "Downscale Y plane DMA done",
+	[MALI_C55_IRQ_DS_UV_DONE] = "Downscale U/V plane DMA done",
+	[MALI_C55_IRQ_LINEARIZATION_DONE] = "Linearisation done",
+	[MALI_C55_IRQ_RAW_FRONTEND_DONE] = "Raw frontend processing done",
+	[MALI_C55_IRQ_NOISE_REDUCTION_DONE] = "Noise reduction done",
+	[MALI_C55_IRQ_IRIDIX_DONE] = "Iridix done",
+	[MALI_C55_IRQ_BAYER2RGB_DONE] = "Bayer to RGB conversion done",
+	[MALI_C55_IRQ_WATCHDOG_TIMER] = "Watchdog timer timed out",
+	[MALI_C55_IRQ_FRAME_COLLISION] = "Frame collision error",
+	[MALI_C55_IRQ_UNUSED] = "IRQ bit unused",
+	[MALI_C55_IRQ_DMA_ERROR] = "DMA error",
+	[MALI_C55_IRQ_INPUT_STOPPED] = "Input port safely stopped",
+	[MALI_C55_IRQ_MET_AWB_TARGET1_HIT] = "AWB metering target 1 address hit",
+	[MALI_C55_IRQ_MET_AWB_TARGET2_HIT] = "AWB metering target 2 address hit"
+};
+
+static const unsigned int config_space_addrs[] = {
+	[MALI_C55_CONFIG_PING] = 0x0ab6c,
+	[MALI_C55_CONFIG_PONG] = 0x22b2c,
+};
+
+static const char * const mali_c55_clk_names[MALI_C55_NUM_CLKS] = {
+	"aclk",
+	"hclk",
+};
+
+/*
+ * System IO
+ *
+ * The Mali-C55 ISP has up to two configuration register spaces (called 'ping'
+ * and 'pong'), with the expectation that the 'active' space will be left
+ * untouched whilst a frame is being processed and the 'inactive' space
+ * configured ready to be switched to during the blanking period before the next
+ * frame processing starts. These spaces should ideally be set via DMA transfer
+ * from a buffer rather than through individual register set operations. There
+ * is also a shared global register space which should be set normally. Of
+ * course, the ISP might be included in a system which lacks a suitable DMA
+ * engine, and the second configuration space might not be fitted at all, which
+ * means we need to support four scenarios:
+ *
+ * 1. Multi config space, with DMA engine.
+ * 2. Multi config space, no DMA engine.
+ * 3. Single config space, with DMA engine.
+ * 4. Single config space, no DMA engine.
+ *
+ * The first case is very easy, but the rest present annoying problems. The best
+ * way to solve them seems to be simply to replicate the concept of DMAing over
+ * the configuration buffer even if there's no DMA engine on the board, for
+ * which we rely on memcpy. To facilitate this any read/write call that is made
+ * to an address within those config spaces should infact be directed to a
+ * buffer that was allocated to hold them rather than the IO memory itself. The
+ * actual copy of that buffer to IO mem will happen on interrupt.
+ */
+
+void mali_c55_write(struct mali_c55 *mali_c55, unsigned int addr, u32 val)
+{
+	WARN_ON(addr >= MALI_C55_REG_CONFIG_SPACES_OFFSET);
+
+	writel(val, mali_c55->base + addr);
+}
+
+u32 mali_c55_read(struct mali_c55 *mali_c55, unsigned int addr)
+{
+	WARN_ON(addr >= MALI_C55_REG_CONFIG_SPACES_OFFSET);
+
+	return readl(mali_c55->base + addr);
+}
+
+void mali_c55_update_bits(struct mali_c55 *mali_c55, unsigned int addr,
+			  u32 mask, u32 val)
+{
+	u32 orig, new;
+
+	orig = mali_c55_read(mali_c55, addr);
+
+	new = orig & ~mask;
+	new |= val & mask;
+
+	if (new != orig)
+		mali_c55_write(mali_c55, addr, new);
+}
+
+static void __mali_c55_ctx_write(struct mali_c55_context *ctx,
+				 unsigned int addr, u32 val)
+{
+	addr = (addr - MALI_C55_REG_CONFIG_SPACES_OFFSET) / 4;
+	ctx->registers[addr] = val;
+}
+
+void mali_c55_ctx_write(struct mali_c55 *mali_c55, unsigned int addr, u32 val)
+{
+	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
+
+	WARN_ON(addr < MALI_C55_REG_CONFIG_SPACES_OFFSET);
+
+	spin_lock(&ctx->lock);
+	__mali_c55_ctx_write(ctx, addr, val);
+	spin_unlock(&ctx->lock);
+}
+
+static u32 __mali_c55_ctx_read(struct mali_c55_context *ctx, unsigned int addr)
+{
+	addr = (addr - MALI_C55_REG_CONFIG_SPACES_OFFSET) / 4;
+	return ctx->registers[addr];
+}
+
+u32 mali_c55_ctx_read(struct mali_c55 *mali_c55, unsigned int addr)
+{
+	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
+	u32 val;
+
+	WARN_ON(addr < MALI_C55_REG_CONFIG_SPACES_OFFSET);
+
+	spin_lock(&ctx->lock);
+	val = __mali_c55_ctx_read(ctx, addr);
+	spin_unlock(&ctx->lock);
+
+	return val;
+}
+
+void mali_c55_ctx_update_bits(struct mali_c55 *mali_c55, unsigned int addr,
+			      u32 mask, u32 val)
+{
+	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
+	u32 orig, tmp;
+
+	WARN_ON(addr < MALI_C55_REG_CONFIG_SPACES_OFFSET);
+
+	spin_lock(&ctx->lock);
+
+	orig = __mali_c55_ctx_read(ctx, addr);
+
+	tmp = orig & ~mask;
+	tmp |= val & mask;
+
+	if (tmp != orig)
+		__mali_c55_ctx_write(ctx, addr, tmp);
+
+	spin_unlock(&ctx->lock);
+}
+
+static void mali_c55_dma_xfer_complete(void *param,
+				       const struct dmaengine_result *result)
+{
+	struct mali_c55 *mali_c55 = param;
+
+	if (result->result != DMA_TRANS_NOERROR)
+		dev_err(mali_c55->dev, "Failed to DMA xfer ISP config\n");
+
+	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
+			     MALI_C55_REG_MCU_CONFIG_WRITE_MASK,
+			     MALI_C55_MCU_CONFIG_WRITE(mali_c55->next_config));
+}
+
+static int mali_c55_dma_xfer(struct mali_c55_context *ctx, dma_addr_t src,
+			     dma_addr_t dst, bool force_synchronous)
+{
+	struct mali_c55 *mali_c55 = ctx->mali_c55;
+	struct dma_async_tx_descriptor *tx;
+	enum dma_status status;
+	dma_cookie_t cookie;
+
+	tx = dmaengine_prep_dma_memcpy(mali_c55->channel, dst, src,
+				       MALI_C55_CONFIG_SPACE_SIZE, 0);
+	if (!tx) {
+		dev_err(mali_c55->dev, "failed to prep DMA memcpy\n");
+		return -EIO;
+	}
+
+	if (!force_synchronous) {
+		tx->callback_result = mali_c55_dma_xfer_complete;
+		tx->callback_param = mali_c55;
+	}
+
+	cookie = dmaengine_submit(tx);
+	if (dma_submit_error(cookie)) {
+		dev_err(mali_c55->dev, "error submitting dma transfer\n");
+		return -EIO;
+	}
+
+	if (force_synchronous) {
+		status = dma_sync_wait(mali_c55->channel, cookie);
+		if (status != DMA_COMPLETE) {
+			dev_err(mali_c55->dev,
+				"Failed to DMA xfer ISP config\n");
+			return -EIO;
+		}
+	} else {
+		dma_async_issue_pending(mali_c55->channel);
+	}
+
+	return 0;
+}
+
+static int mali_c55_dma_write(struct mali_c55_context *ctx,
+			      enum mali_c55_config_spaces cfg_space,
+			      bool force_synchronous)
+{
+	struct mali_c55 *mali_c55 = ctx->mali_c55;
+	struct device *dma_dev = mali_c55->channel->device->dev;
+	dma_addr_t dst = ctx->base + config_space_addrs[cfg_space];
+	dma_addr_t src;
+	int ret;
+
+	guard(spinlock)(&ctx->lock);
+
+	src = dma_map_single(dma_dev, ctx->registers,
+			     MALI_C55_CONFIG_SPACE_SIZE, DMA_TO_DEVICE);
+	if (dma_mapping_error(dma_dev, src)) {
+		dev_err(mali_c55->dev, "failed to map DMA addr\n");
+		return -EIO;
+	}
+
+	ret = mali_c55_dma_xfer(ctx, src, dst, force_synchronous);
+	dma_unmap_single(dma_dev, src, MALI_C55_CONFIG_SPACE_SIZE,
+			 DMA_TO_DEVICE);
+
+	return ret;
+}
+
+int mali_c55_config_write(struct mali_c55_context *ctx,
+			  enum mali_c55_config_spaces cfg_space,
+			  bool force_synchronous)
+{
+	struct mali_c55 *mali_c55 = ctx->mali_c55;
+
+	if (mali_c55->channel)
+		return mali_c55_dma_write(ctx, cfg_space, force_synchronous);
+
+	memcpy_toio(mali_c55->base + config_space_addrs[cfg_space],
+		    ctx->registers, MALI_C55_CONFIG_SPACE_SIZE);
+
+	return 0;
+}
+
+struct mali_c55_context *mali_c55_get_active_context(struct mali_c55 *mali_c55)
+{
+	return &mali_c55->context;
+}
+
+static void mali_c55_remove_links(struct mali_c55 *mali_c55)
+{
+	unsigned int i;
+
+	media_entity_remove_links(&mali_c55->tpg.sd.entity);
+	media_entity_remove_links(&mali_c55->isp.sd.entity);
+
+	for (i = 0; i < MALI_C55_NUM_RSZS; i++)
+		media_entity_remove_links(&mali_c55->resizers[i].sd.entity);
+
+	for (i = 0; i < MALI_C55_NUM_CAP_DEVS; i++)
+		media_entity_remove_links(&mali_c55->cap_devs[i].vdev.entity);
+}
+
+static int mali_c55_create_links(struct mali_c55 *mali_c55)
+{
+	int ret;
+
+	/* Test pattern generator to ISP */
+	ret = media_create_pad_link(&mali_c55->tpg.sd.entity, 0,
+				    &mali_c55->isp.sd.entity,
+				    MALI_C55_ISP_PAD_SINK_VIDEO, 0);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to link TPG and ISP\n");
+		goto err_remove_links;
+	}
+
+	/* Full resolution resizer pipe. */
+	ret = media_create_pad_link(&mali_c55->isp.sd.entity,
+			MALI_C55_ISP_PAD_SOURCE_VIDEO,
+			&mali_c55->resizers[MALI_C55_RSZ_FR].sd.entity,
+			MALI_C55_RSZ_SINK_PAD,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to link ISP and FR resizer\n");
+		goto err_remove_links;
+	}
+
+	/* Full resolution bypass. */
+	ret = media_create_pad_link(&mali_c55->isp.sd.entity,
+				    MALI_C55_ISP_PAD_SOURCE_BYPASS,
+				    &mali_c55->resizers[MALI_C55_RSZ_FR].sd.entity,
+				    MALI_C55_RSZ_SINK_BYPASS_PAD,
+				    MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to link ISP and FR resizer\n");
+		goto err_remove_links;
+	}
+
+	/* Resizer pipe to video capture nodes. */
+	ret = media_create_pad_link(&mali_c55->resizers[0].sd.entity,
+			MALI_C55_RSZ_SOURCE_PAD,
+			&mali_c55->cap_devs[MALI_C55_CAP_DEV_FR].vdev.entity,
+			0, MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(mali_c55->dev,
+			"failed to link FR resizer and video device\n");
+		goto err_remove_links;
+	}
+
+	/* The downscale pipe is an optional hardware block */
+	if (mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED) {
+		ret = media_create_pad_link(&mali_c55->isp.sd.entity,
+			MALI_C55_ISP_PAD_SOURCE_VIDEO,
+			&mali_c55->resizers[MALI_C55_RSZ_DS].sd.entity,
+			MALI_C55_RSZ_SINK_PAD,
+			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+		if (ret) {
+			dev_err(mali_c55->dev,
+				"failed to link ISP and DS resizer\n");
+			goto err_remove_links;
+		}
+
+		ret = media_create_pad_link(&mali_c55->resizers[1].sd.entity,
+			MALI_C55_RSZ_SOURCE_PAD,
+			&mali_c55->cap_devs[MALI_C55_CAP_DEV_DS].vdev.entity,
+			0, MEDIA_LNK_FL_ENABLED);
+		if (ret) {
+			dev_err(mali_c55->dev,
+				"failed to link DS resizer and video device\n");
+			goto err_remove_links;
+		}
+	}
+
+	return 0;
+
+err_remove_links:
+	mali_c55_remove_links(mali_c55);
+	return ret;
+}
+
+static void mali_c55_unregister_entities(struct mali_c55 *mali_c55)
+{
+	mali_c55_remove_links(mali_c55);
+	mali_c55_unregister_tpg(mali_c55);
+	mali_c55_unregister_isp(mali_c55);
+	mali_c55_unregister_resizers(mali_c55);
+	mali_c55_unregister_capture_devs(mali_c55);
+}
+
+static int mali_c55_register_entities(struct mali_c55 *mali_c55)
+{
+	int ret;
+
+	ret = mali_c55_register_tpg(mali_c55);
+	if (ret)
+		return ret;
+
+	ret = mali_c55_register_isp(mali_c55);
+	if (ret)
+		goto err_unregister_entities;
+
+	ret = mali_c55_register_resizers(mali_c55);
+	if (ret)
+		goto err_unregister_entities;
+
+	ret = mali_c55_register_capture_devs(mali_c55);
+	if (ret)
+		goto err_unregister_entities;
+
+	ret = mali_c55_create_links(mali_c55);
+	if (ret)
+		goto err_unregister_entities;
+
+	return 0;
+
+err_unregister_entities:
+	mali_c55_unregister_entities(mali_c55);
+
+	return ret;
+}
+
+static int mali_c55_notifier_bound(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *subdev,
+				   struct v4l2_async_connection *asc)
+{
+	struct mali_c55 *mali_c55 = container_of(notifier,
+						struct mali_c55, notifier);
+	struct media_pad *pad = &mali_c55->isp.pads[MALI_C55_ISP_PAD_SINK_VIDEO];
+	int ret;
+
+	/*
+	 * By default we'll flag this link enabled and the TPG disabled, but
+	 * no immutable flag because we need to be able to switch between the
+	 * two.
+	 */
+	ret = v4l2_create_fwnode_links_to_pad(subdev, pad,
+					      MEDIA_LNK_FL_ENABLED);
+	if (ret)
+		dev_err(mali_c55->dev, "failed to create link for %s\n",
+			subdev->name);
+
+	return ret;
+}
+
+static int mali_c55_notifier_complete(struct v4l2_async_notifier *notifier)
+{
+	struct mali_c55 *mali_c55 = container_of(notifier,
+						struct mali_c55, notifier);
+
+	return v4l2_device_register_subdev_nodes(&mali_c55->v4l2_dev);
+}
+
+static const struct v4l2_async_notifier_operations mali_c55_notifier_ops = {
+	.bound = mali_c55_notifier_bound,
+	.complete = mali_c55_notifier_complete,
+};
+
+static int mali_c55_parse_endpoint(struct mali_c55 *mali_c55)
+{
+	struct v4l2_async_connection *asc;
+	struct fwnode_handle *ep;
+
+	/*
+	 * The ISP should have a single endpoint pointing to some flavour of
+	 * CSI-2 receiver...but for now at least we do want everything to work
+	 * normally even with no sensors connected, as we have the TPG. If we
+	 * don't find a sensor just warn and return success.
+	 */
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(mali_c55->dev),
+					     0, 0, 0);
+	if (!ep) {
+		dev_warn(mali_c55->dev, "no local endpoint found\n");
+		return 0;
+	}
+
+	asc = v4l2_async_nf_add_fwnode_remote(&mali_c55->notifier, ep,
+					      struct v4l2_async_connection);
+	fwnode_handle_put(ep);
+	if (IS_ERR(asc)) {
+		dev_err(mali_c55->dev, "failed to add remote fwnode\n");
+		return PTR_ERR(asc);
+	}
+
+	return 0;
+}
+
+static int mali_c55_media_frameworks_init(struct mali_c55 *mali_c55)
+{
+	int ret;
+
+	strscpy(mali_c55->media_dev.model, "ARM Mali-C55 ISP",
+		sizeof(mali_c55->media_dev.model));
+
+	media_device_init(&mali_c55->media_dev);
+	ret = media_device_register(&mali_c55->media_dev);
+	if (ret)
+		goto err_cleanup_media_device;
+
+	mali_c55->v4l2_dev.mdev = &mali_c55->media_dev;
+	ret = v4l2_device_register(mali_c55->dev, &mali_c55->v4l2_dev);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to register V4L2 device\n");
+		goto err_unregister_media_device;
+	};
+
+	mali_c55->notifier.ops = &mali_c55_notifier_ops;
+	v4l2_async_nf_init(&mali_c55->notifier, &mali_c55->v4l2_dev);
+
+	ret = mali_c55_register_entities(mali_c55);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to register entities\n");
+		goto err_cleanup_nf;
+	}
+
+	ret = mali_c55_parse_endpoint(mali_c55);
+	if (ret)
+		goto err_cleanup_nf;
+
+	ret = v4l2_async_nf_register(&mali_c55->notifier);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to register notifier\n");
+		goto err_unregister_entities;
+	}
+
+	return 0;
+
+err_unregister_entities:
+	mali_c55_unregister_entities(mali_c55);
+err_cleanup_nf:
+	v4l2_async_nf_cleanup(&mali_c55->notifier);
+	v4l2_device_unregister(&mali_c55->v4l2_dev);
+err_unregister_media_device:
+	media_device_unregister(&mali_c55->media_dev);
+err_cleanup_media_device:
+	media_device_cleanup(&mali_c55->media_dev);
+
+	return ret;
+}
+
+static void mali_c55_media_frameworks_deinit(struct mali_c55 *mali_c55)
+{
+	v4l2_async_nf_unregister(&mali_c55->notifier);
+	mali_c55_unregister_entities(mali_c55);
+	v4l2_async_nf_cleanup(&mali_c55->notifier);
+	v4l2_device_unregister(&mali_c55->v4l2_dev);
+	media_device_unregister(&mali_c55->media_dev);
+	media_device_cleanup(&mali_c55->media_dev);
+}
+
+bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55)
+{
+	struct media_pipeline_entity_iter iter;
+	unsigned int n_video_devices = 0;
+	struct media_entity *entity;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(&mali_c55->pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(&mali_c55->pipe, &iter, entity) {
+		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
+			n_video_devices++;
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	return n_video_devices == mali_c55->pipe.start_count;
+}
+
+static int mali_c55_check_hwcfg(struct mali_c55 *mali_c55)
+{
+	u32 product, version, revision, capabilities;
+
+	product = mali_c55_read(mali_c55, MALI_C55_REG_PRODUCT);
+	version = mali_c55_read(mali_c55, MALI_C55_REG_VERSION);
+	revision = mali_c55_read(mali_c55, MALI_C55_REG_REVISION);
+
+	mali_c55->media_dev.hw_revision = version;
+
+	dev_info(mali_c55->dev, "Detected Mali-C55 ISP %u.%u.%u\n",
+		 product, version, revision);
+
+	capabilities = mali_c55_read(mali_c55,
+				     MALI_C55_REG_GLOBAL_PARAMETER_STATUS);
+
+	/*
+	 * In its current iteration, the driver only supports inline mode. Given
+	 * we cannot control input data timing in this mode, we cannot guarantee
+	 * that the vertical blanking periods between frames will be long enough
+	 * for us to write configuration data to the ISP during them. For that
+	 * reason we can't really support single config space configuration
+	 * until memory input mode is implemented.
+	 */
+	if (!capabilities & MALI_C55_GPS_PONG_FITTED) {
+		dev_err(mali_c55->dev, "Pong config space not fitted.\n");
+		return -EINVAL;
+	}
+
+	mali_c55->capabilities = capabilities & 0xffff;
+
+	return 0;
+}
+
+static void mali_c55_swap_next_config(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
+	u32 curr_config;
+
+	curr_config = mali_c55_read(mali_c55, MALI_C55_REG_PING_PONG_READ);
+	curr_config = (curr_config & MALI_C55_REG_PING_PONG_READ_MASK)
+		      >> (ffs(MALI_C55_REG_PING_PONG_READ_MASK) - 1);
+	mali_c55->next_config = curr_config ^ 1;
+
+	mali_c55_config_write(ctx, mali_c55->next_config ?
+			      MALI_C55_CONFIG_PING : MALI_C55_CONFIG_PONG,
+			      false);
+
+	/*
+	 * If there's a valid DMA channel then we'll wait for the completion
+	 * callback to tell the ISP to use the next config.
+	 */
+	if (!mali_c55->channel)
+		mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
+			MALI_C55_REG_MCU_CONFIG_WRITE_MASK,
+			MALI_C55_MCU_CONFIG_WRITE(mali_c55->next_config));
+}
+
+static irqreturn_t mali_c55_isr(int irq, void *context)
+{
+	struct device *dev = context;
+	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
+	u32 interrupt_status;
+	unsigned int i, j;
+
+	interrupt_status = mali_c55_read(mali_c55,
+					 MALI_C55_REG_INTERRUPT_STATUS_VECTOR);
+	if (!interrupt_status)
+		return IRQ_NONE;
+
+	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR_VECTOR,
+		       interrupt_status);
+	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0);
+	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 1);
+
+	for (i = 0; i < MALI_C55_NUM_IRQ_BITS; i++) {
+		if (!(interrupt_status & (1 << i)))
+			continue;
+
+		switch (i) {
+		case MALI_C55_IRQ_ISP_START:
+			mali_c55_isp_queue_event_sof(mali_c55);
+
+			for (j = i; j < MALI_C55_NUM_CAP_DEVS; j++)
+				mali_c55_set_next_buffer(&mali_c55->cap_devs[j]);
+
+			mali_c55_swap_next_config(mali_c55);
+
+			break;
+		case MALI_C55_IRQ_ISP_DONE:
+			/*
+			 * TODO: Where the ISP has no Pong config fitted, we'd
+			 * have to do the mali_c55_swap_next_config() call here.
+			 */
+			break;
+		case MALI_C55_IRQ_FR_Y_DONE:
+			mali_c55_set_plane_done(
+				&mali_c55->cap_devs[MALI_C55_CAP_DEV_FR],
+				MALI_C55_PLANE_Y);
+			break;
+		case MALI_C55_IRQ_FR_UV_DONE:
+			mali_c55_set_plane_done(
+				&mali_c55->cap_devs[MALI_C55_CAP_DEV_FR],
+				MALI_C55_PLANE_UV);
+			break;
+		case MALI_C55_IRQ_DS_Y_DONE:
+			mali_c55_set_plane_done(
+				&mali_c55->cap_devs[MALI_C55_CAP_DEV_DS],
+				MALI_C55_PLANE_Y);
+			break;
+		case MALI_C55_IRQ_DS_UV_DONE:
+			mali_c55_set_plane_done(
+				&mali_c55->cap_devs[MALI_C55_CAP_DEV_DS],
+				MALI_C55_PLANE_UV);
+			break;
+		default:
+			/*
+			 * Only the above interrupts are currently unmasked. If
+			 * we receive anything else here then something weird
+			 * has gone on.
+			 */
+			dev_err(dev, "masked interrupt %s triggered\n",
+				mali_c55_interrupt_names[i]);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int mali_c55_init_context(struct mali_c55 *mali_c55,
+				 struct resource *res)
+{
+	struct mali_c55_context *ctx = &mali_c55->context;
+
+	ctx->base = res->start;
+	ctx->mali_c55 = mali_c55;
+
+	ctx->registers = kzalloc(MALI_C55_CONFIG_SPACE_SIZE,
+				 GFP_KERNEL | GFP_DMA);
+	if (!ctx->registers)
+		return -ENOMEM;
+
+	/*
+	 * The allocated memory is empty, we need to load the default
+	 * register settings. We just read Ping; it's identical to Pong.
+	 */
+	memcpy_fromio(ctx->registers,
+		      mali_c55->base + config_space_addrs[MALI_C55_CONFIG_PING],
+		      MALI_C55_CONFIG_SPACE_SIZE);
+
+	/*
+	 * Some features of the ISP need to be disabled by default and only
+	 * enabled at the same time as they're configured by a parameters buffer
+	 */
+
+	/* Bypass the sqrt and square compression and expansion modules */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_1,
+				 MALI_C55_REG_BYPASS_1_FE_SQRT,
+				 MALI_C55_REG_BYPASS_1_FE_SQRT);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
+				 MALI_C55_REG_BYPASS_3_SQUARE_BE,
+				 MALI_C55_REG_BYPASS_3_SQUARE_BE);
+
+	/* Bypass the temper module */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_2,
+			   MALI_C55_REG_BYPASS_2_TEMPER);
+
+	/* Bypass the colour noise reduction  */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
+			   MALI_C55_REG_BYPASS_4_CNR);
+
+	/* Disable the sinter module */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_SINTER_CONFIG,
+				 MALI_C55_SINTER_ENABLE_MASK, 0);
+
+	/* Disable the RGB Gamma module for each output */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_FR_GAMMA_RGB_ENABLE, 0);
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_DS_GAMMA_RGB_ENABLE, 0);
+
+	/* Disable the colour correction matrix */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
+
+	return 0;
+}
+
+static int mali_c55_runtime_resume(struct device *dev)
+{
+	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
+	u32 val;
+	int ret;
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(mali_c55->clks),
+				      mali_c55->clks);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	/* Use "software only" context management. */
+	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
+			     MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0x01);
+
+	/*
+	 * Mask the interrupts and clear any that were set, then unmask the ones
+	 * that we actually want to handle.
+	 */
+	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_MASK_VECTOR,
+		       MALI_C55_INTERRUPT_MASK_ALL);
+	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR_VECTOR,
+		       MALI_C55_INTERRUPT_MASK_ALL);
+	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0x01);
+	mali_c55_write(mali_c55, MALI_C55_REG_INTERRUPT_CLEAR, 0x00);
+
+	mali_c55_update_bits(mali_c55, MALI_C55_REG_INTERRUPT_MASK_VECTOR,
+			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_ISP_START) |
+			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_ISP_DONE) |
+			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_FR_Y_DONE) |
+			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_FR_UV_DONE) |
+			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_DS_Y_DONE) |
+			     MALI_C55_INTERRUPT_BIT(MALI_C55_IRQ_DS_UV_DONE),
+			     0x00);
+
+	/* Set safe stop to ensure we're in a non-streaming state */
+	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
+		       MALI_C55_INPUT_SAFE_STOP);
+	readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
+			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
+
+	return 0;
+}
+
+static int mali_c55_runtime_suspend(struct device *dev)
+{
+	struct mali_c55 *mali_c55 = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
+	return 0;
+}
+
+static const struct dev_pm_ops mali_c55_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(mali_c55_runtime_suspend, mali_c55_runtime_resume,
+			   NULL)
+};
+
+static int mali_c55_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mali_c55 *mali_c55;
+	struct resource *res;
+	dma_cap_mask_t mask;
+	int ret;
+
+	mali_c55 = devm_kzalloc(dev, sizeof(*mali_c55), GFP_KERNEL);
+	if (!mali_c55)
+		return -ENOMEM;
+
+	mali_c55->dev = dev;
+	platform_set_drvdata(pdev, mali_c55);
+
+	mali_c55->base = devm_platform_get_and_ioremap_resource(pdev, 0,
+								&res);
+	if (IS_ERR(mali_c55->base))
+		return dev_err_probe(dev, PTR_ERR(mali_c55->base),
+				     "failed to map IO memory\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(mali_c55_clk_names); i++)
+		mali_c55->clks[i].id = mali_c55_clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(mali_c55->clks), mali_c55->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to acquire clocks\n");
+
+	of_reserved_mem_device_init(dev);
+	vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
+
+	dma_cap_zero(mask);
+	dma_cap_set(DMA_MEMCPY, mask);
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		goto err_pm_runtime_disable;
+
+	ret = mali_c55_check_hwcfg(mali_c55);
+	if (ret)
+		goto err_pm_runtime_put;
+
+	/*
+	 * No failure here because we will just fallback on memcpy if there is
+	 * no usable DMA channel on the system.
+	 */
+	mali_c55->channel = dma_request_channel(mask, NULL, NULL);
+		dev_dbg(mali_c55->dev,
+			"No DMA channel for config, falling back to memcpy\n");
+
+	ret = mali_c55_init_context(mali_c55, res);
+	if (ret)
+		goto err_release_dma_channel;
+
+	mali_c55->media_dev.dev = dev;
+
+	ret = mali_c55_media_frameworks_init(mali_c55);
+	if (ret)
+		goto err_free_context_registers;
+
+	pm_runtime_put(&pdev->dev);
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		dev_err(dev, "failed to get interrupt\n");
+		goto err_deinit_media_frameworks;
+	}
+
+	/*
+	 * The driver needs to transfer large amounts of register settings to
+	 * the ISP each frame, using either a DMA transfer or memcpy. We use a
+	 * threaded IRQ to avoid disabling interrupts the entire time that's
+	 * happening.
+	 */
+	ret = devm_request_threaded_irq(&pdev->dev, ret, NULL,
+					mali_c55_isr, IRQF_ONESHOT,
+					dev_driver_string(&pdev->dev),
+					&pdev->dev);
+	if (ret) {
+		dev_err(dev, "failed to request irq\n");
+		goto err_deinit_media_frameworks;
+	}
+
+	return 0;
+
+err_deinit_media_frameworks:
+	mali_c55_media_frameworks_deinit(mali_c55);
+err_free_context_registers:
+	kfree(mali_c55->context.registers);
+err_release_dma_channel:
+	if (mali_c55->channel)
+		dma_release_channel(mali_c55->channel);
+err_pm_runtime_put:
+	pm_runtime_put(&pdev->dev);
+err_pm_runtime_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void mali_c55_remove(struct platform_device *pdev)
+{
+	struct mali_c55 *mali_c55 = platform_get_drvdata(pdev);
+
+	kfree(mali_c55->context.registers);
+	mali_c55_media_frameworks_deinit(mali_c55);
+
+	if (mali_c55->channel)
+		dma_release_channel(mali_c55->channel);
+}
+
+static const struct of_device_id mali_c55_of_match[] = {
+	{ .compatible = "arm,mali-c55", },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mali_c55_of_match);
+
+static struct platform_driver mali_c55_driver = {
+	.driver = {
+		.name = "mali-c55",
+		.of_match_table = mali_c55_of_match,
+		.pm = &mali_c55_pm_ops,
+	},
+	.probe = mali_c55_probe,
+	.remove = mali_c55_remove,
+};
+
+module_platform_driver(mali_c55_driver);
+
+MODULE_AUTHOR("Daniel Scally <dan.scally@ideasonboard.com>");
+MODULE_AUTHOR("Jacopo Mondi <jacopo.mondi@ideasonboard.com>");
+MODULE_DESCRIPTION("ARM Mali-C55 ISP platform driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
new file mode 100644
index 000000000000..8c5a50988766
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/property.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#include "mali-c55-common.h"
+#include "mali-c55-registers.h"
+
+static const struct mali_c55_isp_format_info mali_c55_isp_fmts[] = {
+	{
+		.code = MEDIA_BUS_FMT_SRGGB20_1X20,
+		.shifted_code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.order = MALI_C55_BAYER_ORDER_RGGB,
+		.bypass = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG20_1X20,
+		.shifted_code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.order = MALI_C55_BAYER_ORDER_GRBG,
+		.bypass = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG20_1X20,
+		.shifted_code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.order = MALI_C55_BAYER_ORDER_GBRG,
+		.bypass = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR20_1X20,
+		.shifted_code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.order = MALI_C55_BAYER_ORDER_BGGR,
+		.bypass = false,
+	},
+	{
+		.code = MEDIA_BUS_FMT_RGB202020_1X60,
+		.shifted_code = 0, /* Not relevant for this format */
+		.order = 0, /* Not relevant for this format */
+		.bypass = true,
+	}
+	/*
+	 * TODO: Support MEDIA_BUS_FMT_YUV20_1X60 here. This is so that we can
+	 * also support YUV input from a sensor passed-through to the output. At
+	 * present we have no mechanism to test that though so it may have to
+	 * wait a while...
+	 */
+};
+
+const struct mali_c55_isp_format_info *
+mali_c55_isp_get_mbus_config_by_index(u32 index)
+{
+	if (index < ARRAY_SIZE(mali_c55_isp_fmts))
+		return &mali_c55_isp_fmts[index];
+
+	return NULL;
+}
+
+const struct mali_c55_isp_format_info *
+mali_c55_isp_get_mbus_config_by_code(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c55_isp_fmts); i++) {
+		if (mali_c55_isp_fmts[i].code == code)
+			return &mali_c55_isp_fmts[i];
+	}
+
+	return NULL;
+}
+
+const struct mali_c55_isp_format_info *
+mali_c55_isp_get_mbus_config_by_shifted_code(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c55_isp_fmts); i++) {
+		if (mali_c55_isp_fmts[i].shifted_code == code)
+			return &mali_c55_isp_fmts[i];
+	}
+
+	return NULL;
+}
+
+static void mali_c55_isp_stop(struct mali_c55 *mali_c55)
+{
+	u32 val;
+
+	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
+		       MALI_C55_INPUT_SAFE_STOP);
+	readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS,
+			   val, !val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
+}
+
+static int mali_c55_isp_start(struct mali_c55 *mali_c55,
+			      const struct v4l2_subdev_state *state)
+{
+	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
+	const struct mali_c55_isp_format_info *cfg;
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
+	u32 val;
+	int ret;
+
+	mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
+			     MALI_C55_REG_MCU_CONFIG_WRITE_MASK,
+			     MALI_C55_REG_MCU_CONFIG_WRITE_PING);
+
+	/* Apply input windowing */
+	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
+	format = v4l2_subdev_state_get_format(state,
+					      MALI_C55_ISP_PAD_SINK_VIDEO);
+	cfg = mali_c55_isp_get_mbus_config_by_code(format->code);
+
+	mali_c55_write(mali_c55, MALI_C55_REG_HC_START,
+		       MALI_C55_HC_START(crop->left));
+	mali_c55_write(mali_c55, MALI_C55_REG_HC_SIZE,
+		       MALI_C55_HC_SIZE(crop->width));
+	mali_c55_write(mali_c55, MALI_C55_REG_VC_START_SIZE,
+		       MALI_C55_VC_START(crop->top) |
+		       MALI_C55_VC_SIZE(crop->height));
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
+				 MALI_C55_REG_ACTIVE_WIDTH_MASK, format->width);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
+				 MALI_C55_REG_ACTIVE_HEIGHT_MASK,
+				 format->height << 16);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BAYER_ORDER,
+				 MALI_C55_BAYER_ORDER_MASK, cfg->order);
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_INPUT_WIDTH,
+				 MALI_C55_INPUT_WIDTH_MASK,
+				 MALI_C55_INPUT_WIDTH_20BIT);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
+				 MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK,
+				 cfg->bypass ? MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK :
+					     0x00);
+
+	ret = mali_c55_config_write(ctx, MALI_C55_CONFIG_PING, true);
+	if (ret) {
+		dev_err(mali_c55->dev, "failed to write ISP config\n");
+		return ret;
+	}
+
+	mali_c55_write(mali_c55, MALI_C55_REG_INPUT_MODE_REQUEST,
+		       MALI_C55_INPUT_SAFE_START);
+
+	ret = readl_poll_timeout(mali_c55->base + MALI_C55_REG_MODE_STATUS, val,
+				 val, 10 * USEC_PER_MSEC, 250 * USEC_PER_MSEC);
+	if (ret) {
+		mali_c55_isp_stop(mali_c55);
+		dev_err(mali_c55->dev, "timeout starting ISP\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mali_c55_isp_enum_mbus_code(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_mbus_code_enum *code)
+{
+	/*
+	 * Only the internal RGB processed format is allowed on the regular
+	 * processing source pad.
+	 */
+	if (code->pad == MALI_C55_ISP_PAD_SOURCE_VIDEO) {
+		if (code->index)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_RGB121212_1X36;
+		return 0;
+	}
+
+	/* On the sink and bypass pads all the supported formats are allowed. */
+	if (code->index >= ARRAY_SIZE(mali_c55_isp_fmts))
+		return -EINVAL;
+
+	code->code = mali_c55_isp_fmts[code->index].code;
+
+	return 0;
+}
+
+static int mali_c55_isp_enum_frame_size(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct mali_c55_isp_format_info *cfg;
+
+	if (fse->index > 0)
+		return -EINVAL;
+
+	/*
+	 * Only the internal RGB processed format is allowed on the regular
+	 * processing source pad.
+	 *
+	 * On the sink and bypass pads all the supported formats are allowed.
+	 */
+	if (fse->pad == MALI_C55_ISP_PAD_SOURCE_VIDEO) {
+		if (fse->code != MEDIA_BUS_FMT_RGB121212_1X36)
+			return -EINVAL;
+	} else {
+		cfg = mali_c55_isp_get_mbus_config_by_code(fse->code);
+		if (!cfg)
+			return -EINVAL;
+	}
+
+	fse->min_width = MALI_C55_MIN_WIDTH;
+	fse->min_height = MALI_C55_MIN_HEIGHT;
+	fse->max_width = MALI_C55_MAX_WIDTH;
+	fse->max_height = MALI_C55_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int mali_c55_isp_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
+	const struct mali_c55_isp_format_info *cfg;
+	struct v4l2_rect *crop;
+
+	/*
+	 * Disallow set_fmt on the source pads; format is fixed and the sizes
+	 * are the result of applying the sink crop rectangle to the sink
+	 * format.
+	 */
+	if (format->pad != MALI_C55_ISP_PAD_SINK_VIDEO)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink_fmt = v4l2_subdev_state_get_format(state,
+						MALI_C55_ISP_PAD_SINK_VIDEO);
+
+	cfg = mali_c55_isp_get_mbus_config_by_code(fmt->code);
+	sink_fmt->code = cfg ? fmt->code : MEDIA_BUS_FMT_SRGGB20_1X20;
+
+	/*
+	 * Clamp sizes in the accepted limits and clamp the crop rectangle in
+	 * the new sizes.
+	 */
+	sink_fmt->width = clamp(fmt->width, MALI_C55_MIN_WIDTH,
+				MALI_C55_MAX_WIDTH);
+	sink_fmt->height = clamp(fmt->height, MALI_C55_MIN_HEIGHT,
+				 MALI_C55_MAX_HEIGHT);
+
+	*fmt = *sink_fmt;
+
+	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
+	crop->left = 0;
+	crop->top = 0;
+	crop->width = sink_fmt->width;
+	crop->height = sink_fmt->height;
+
+	/*
+	 * Propagate format to source pads. On the 'regular' output pad use
+	 * the internal RGB processed format, while on the bypass pad simply
+	 * replicate the ISP sink format. The sizes on both pads are the same as
+	 * the ISP sink crop rectangle. The "field" and "colorspace" fields are
+	 * set in .init_state() and fixed for both source pads, as is the "code"
+	 * field for the processed data source pad.
+	 */
+	src_fmt = v4l2_subdev_state_get_format(state,
+					       MALI_C55_ISP_PAD_SOURCE_VIDEO);
+	src_fmt->width = crop->width;
+	src_fmt->height = crop->height;
+
+	src_fmt = v4l2_subdev_state_get_format(state,
+					       MALI_C55_ISP_PAD_SOURCE_BYPASS);
+	src_fmt->code = sink_fmt->code;
+	src_fmt->width = crop->width;
+	src_fmt->height = crop->height;
+
+	return 0;
+}
+
+static int mali_c55_isp_get_selection(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_selection *sel)
+{
+	if (sel->pad != MALI_C55_ISP_PAD_SINK_VIDEO ||
+	    sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	sel->r = *v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
+
+	return 0;
+}
+
+static int mali_c55_isp_set_selection(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_mbus_framefmt *src_fmt;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_rect *crop;
+
+	if (sel->pad != MALI_C55_ISP_PAD_SINK_VIDEO ||
+	    sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	fmt = v4l2_subdev_state_get_format(state, MALI_C55_ISP_PAD_SINK_VIDEO);
+
+	sel->r.left = clamp_t(unsigned int, sel->r.left, 0, fmt->width);
+	sel->r.top = clamp_t(unsigned int, sel->r.top, 0, fmt->height);
+	sel->r.width = clamp_t(unsigned int, sel->r.width, MALI_C55_MIN_WIDTH,
+			       fmt->width - sel->r.left);
+	sel->r.height = clamp_t(unsigned int, sel->r.height,
+				MALI_C55_MIN_HEIGHT,
+				fmt->height - sel->r.top);
+
+	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
+	*crop = sel->r;
+
+	/*
+	 * Propagate the crop rectangle sizes to the source pad format. The crop
+	 * isn't propagated to the bypass source pad, because the bypassed data
+	 * cannot be cropped.
+	 */
+	src_fmt = v4l2_subdev_state_get_format(state,
+					       MALI_C55_ISP_PAD_SOURCE_VIDEO);
+	src_fmt->width = crop->width;
+	src_fmt->height = crop->height;
+
+	return 0;
+}
+
+static int mali_c55_isp_enable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state, u32 pad,
+				       u64 streams_mask)
+{
+	struct mali_c55_isp *isp = container_of(sd, struct mali_c55_isp, sd);
+	struct mali_c55 *mali_c55 = isp->mali_c55;
+	struct v4l2_subdev *src_sd;
+	struct media_pad *sink_pad;
+	int ret;
+
+	/*
+	 * We have two source pads, both of which have only a single stream. The
+	 * core v4l2 code already validated those parameters so we can just get
+	 * on with starting the ISP.
+	 */
+
+	sink_pad = &isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO];
+	isp->remote_src = media_pad_remote_pad_unique(sink_pad);
+	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
+
+	isp->frame_sequence = 0;
+	ret = mali_c55_isp_start(mali_c55, state);
+	if (ret) {
+		dev_err(mali_c55->dev, "Failed to start ISP\n");
+		isp->remote_src = NULL;
+		return ret;
+	}
+
+	/*
+	 * We only support a single input stream, so we can just enable the 1st
+	 * entry in the streams mask.
+	 */
+	ret = v4l2_subdev_enable_streams(src_sd, isp->remote_src->index, BIT(0));
+	if (ret) {
+		dev_err(mali_c55->dev, "Failed to start ISP source\n");
+		mali_c55_isp_stop(mali_c55);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mali_c55_isp_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state, u32 pad,
+					u64 streams_mask)
+{
+	struct mali_c55_isp *isp = container_of(sd, struct mali_c55_isp, sd);
+	struct mali_c55 *mali_c55 = isp->mali_c55;
+	struct v4l2_subdev *src_sd;
+
+	if (isp->remote_src) {
+		src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
+		v4l2_subdev_disable_streams(src_sd, isp->remote_src->index,
+					    BIT(0));
+	}
+	isp->remote_src = NULL;
+
+	mali_c55_isp_stop(mali_c55);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mali_c55_isp_pad_ops = {
+	.enum_mbus_code		= mali_c55_isp_enum_mbus_code,
+	.enum_frame_size	= mali_c55_isp_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= mali_c55_isp_set_fmt,
+	.get_selection		= mali_c55_isp_get_selection,
+	.set_selection		= mali_c55_isp_set_selection,
+	.link_validate		= v4l2_subdev_link_validate_default,
+	.enable_streams		= mali_c55_isp_enable_streams,
+	.disable_streams	= mali_c55_isp_disable_streams,
+};
+
+void mali_c55_isp_queue_event_sof(struct mali_c55 *mali_c55)
+{
+	struct v4l2_event event = {
+		.type = V4L2_EVENT_FRAME_SYNC,
+	};
+
+	event.u.frame_sync.frame_sequence = mali_c55->isp.frame_sequence;
+	v4l2_event_queue(mali_c55->isp.sd.devnode, &event);
+}
+
+static int
+mali_c55_isp_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
+			     struct v4l2_event_subscription *sub)
+{
+	if (sub->type != V4L2_EVENT_FRAME_SYNC)
+		return -EINVAL;
+
+	/* V4L2_EVENT_FRAME_SYNC doesn't require an id, so zero should be set */
+	if (sub->id != 0)
+		return -EINVAL;
+
+	return v4l2_event_subscribe(fh, sub, 0, NULL);
+}
+
+static const struct v4l2_subdev_core_ops mali_c55_isp_core_ops = {
+	.subscribe_event = mali_c55_isp_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops mali_c55_isp_ops = {
+	.pad	= &mali_c55_isp_pad_ops,
+	.core	= &mali_c55_isp_core_ops,
+};
+
+static int mali_c55_isp_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *in_crop;
+
+	sink_fmt = v4l2_subdev_state_get_format(state,
+						MALI_C55_ISP_PAD_SINK_VIDEO);
+	src_fmt = v4l2_subdev_state_get_format(state,
+					       MALI_C55_ISP_PAD_SOURCE_VIDEO);
+	in_crop = v4l2_subdev_state_get_crop(state,
+					     MALI_C55_ISP_PAD_SINK_VIDEO);
+
+	sink_fmt->width = MALI_C55_DEFAULT_WIDTH;
+	sink_fmt->height = MALI_C55_DEFAULT_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
+					      sink_fmt->ycbcr_enc);
+
+	*v4l2_subdev_state_get_format(state,
+			      MALI_C55_ISP_PAD_SOURCE_BYPASS) = *sink_fmt;
+
+	src_fmt->width = MALI_C55_DEFAULT_WIDTH;
+	src_fmt->height = MALI_C55_DEFAULT_HEIGHT;
+	src_fmt->field = V4L2_FIELD_NONE;
+	src_fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
+	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
+	src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
+	src_fmt->quantization =
+		V4L2_MAP_QUANTIZATION_DEFAULT(false, sink_fmt->colorspace,
+					      sink_fmt->ycbcr_enc);
+
+	in_crop->top = 0;
+	in_crop->left = 0;
+	in_crop->width = MALI_C55_DEFAULT_WIDTH;
+	in_crop->height = MALI_C55_DEFAULT_HEIGHT;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops mali_c55_isp_internal_ops = {
+	.init_state = mali_c55_isp_init_state,
+};
+
+static const struct media_entity_operations mali_c55_isp_media_ops = {
+	.link_validate		= v4l2_subdev_link_validate,
+};
+
+int mali_c55_register_isp(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_isp *isp = &mali_c55->isp;
+	struct v4l2_subdev *sd = &isp->sd;
+	int ret;
+
+	isp->mali_c55 = mali_c55;
+
+	v4l2_subdev_init(sd, &mali_c55_isp_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->entity.ops = &mali_c55_isp_media_ops;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
+	sd->internal_ops = &mali_c55_isp_internal_ops;
+	strscpy(sd->name, MALI_C55_DRIVER_NAME " isp", sizeof(sd->name));
+
+	isp->pads[MALI_C55_ISP_PAD_SINK_VIDEO].flags = MEDIA_PAD_FL_SINK |
+						       MEDIA_PAD_FL_MUST_CONNECT;
+	isp->pads[MALI_C55_ISP_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
+	isp->pads[MALI_C55_ISP_PAD_SOURCE_BYPASS].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, MALI_C55_ISP_NUM_PADS,
+				     isp->pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_cleanup_media_entity;
+
+	ret = v4l2_device_register_subdev(&mali_c55->v4l2_dev, sd);
+	if (ret)
+		goto err_cleanup_subdev;
+
+	mutex_init(&isp->capture_lock);
+
+	return 0;
+
+err_cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+err_cleanup_media_entity:
+	media_entity_cleanup(&sd->entity);
+	isp->mali_c55 = NULL;
+
+	return ret;
+}
+
+void mali_c55_unregister_isp(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_isp *isp = &mali_c55->isp;
+
+	if (!isp->mali_c55)
+		return;
+
+	mutex_destroy(&isp->capture_lock);
+	v4l2_device_unregister_subdev(&isp->sd);
+	v4l2_subdev_cleanup(&isp->sd);
+	media_entity_cleanup(&isp->sd.entity);
+}
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
new file mode 100644
index 000000000000..e5070325176a
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
@@ -0,0 +1,313 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ARM Mali-C55 ISP Driver - Register definitions
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#ifndef _MALI_C55_REGISTERS_H
+#define _MALI_C55_REGISTERS_H
+
+#include <linux/bits.h>
+
+/* ISP Common 0x00000 - 0x000ff */
+
+#define MALI_C55_REG_API				0x00000
+#define MALI_C55_REG_PRODUCT				0x00004
+#define MALI_C55_REG_VERSION				0x00008
+#define MALI_C55_REG_REVISION				0x0000c
+#define MALI_C55_REG_PULSE_MODE				0x0003c
+#define MALI_C55_REG_INPUT_MODE_REQUEST			0x0009c
+#define MALI_C55_INPUT_SAFE_STOP			0x00
+#define MALI_C55_INPUT_SAFE_START			0x01
+#define MALI_C55_REG_MODE_STATUS			0x000a0
+#define MALI_C55_REG_INTERRUPT_MASK_VECTOR		0x00030
+#define MALI_C55_INTERRUPT_MASK_ALL			GENMASK(31, 0)
+
+#define MALI_C55_REG_GLOBAL_MONITOR			0x00050
+
+#define MALI_C55_REG_GEN_VIDEO				0x00080
+#define MALI_C55_REG_GEN_VIDEO_ON_MASK			BIT(0)
+#define MALI_C55_REG_GEN_VIDEO_MULTI_MASK		BIT(1)
+#define MALI_C55_REG_GEN_PREFETCH_MASK			GENMASK(31, 16)
+
+#define MALI_C55_REG_MCU_CONFIG				0x00020
+#define MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK		BIT(0)
+#define MALI_C55_REG_MCU_CONFIG_WRITE_MASK		BIT(1)
+#define MALI_C55_MCU_CONFIG_WRITE(x)			((x) << 1)
+#define MALI_C55_REG_MCU_CONFIG_WRITE_PING		BIT(1)
+#define MALI_C55_REG_MCU_CONFIG_WRITE_PONG		0x00
+#define MALI_C55_REG_MULTI_CONTEXT_MODE_MASK		BIT(8)
+#define MALI_C55_REG_PING_PONG_READ			0x00024
+#define MALI_C55_REG_PING_PONG_READ_MASK		BIT(2)
+
+#define MALI_C55_REG_INTERRUPT_CLEAR_VECTOR		0x00034
+#define MALI_C55_REG_INTERRUPT_CLEAR			0x00040
+#define MALI_C55_REG_INTERRUPT_STATUS_VECTOR		0x00044
+
+enum mali_c55_interrupts {
+	MALI_C55_IRQ_ISP_START,
+	MALI_C55_IRQ_ISP_DONE,
+	MALI_C55_IRQ_MCM_ERROR,
+	MALI_C55_IRQ_BROKEN_FRAME_ERROR,
+	MALI_C55_IRQ_MET_AF_DONE,
+	MALI_C55_IRQ_MET_AEXP_DONE,
+	MALI_C55_IRQ_MET_AWB_DONE,
+	MALI_C55_IRQ_AEXP_1024_DONE,
+	MALI_C55_IRQ_IRIDIX_MET_DONE,
+	MALI_C55_IRQ_LUT_INIT_DONE,
+	MALI_C55_IRQ_FR_Y_DONE,
+	MALI_C55_IRQ_FR_UV_DONE,
+	MALI_C55_IRQ_DS_Y_DONE,
+	MALI_C55_IRQ_DS_UV_DONE,
+	MALI_C55_IRQ_LINEARIZATION_DONE,
+	MALI_C55_IRQ_RAW_FRONTEND_DONE,
+	MALI_C55_IRQ_NOISE_REDUCTION_DONE,
+	MALI_C55_IRQ_IRIDIX_DONE,
+	MALI_C55_IRQ_BAYER2RGB_DONE,
+	MALI_C55_IRQ_WATCHDOG_TIMER,
+	MALI_C55_IRQ_FRAME_COLLISION,
+	MALI_C55_IRQ_UNUSED,
+	MALI_C55_IRQ_DMA_ERROR,
+	MALI_C55_IRQ_INPUT_STOPPED,
+	MALI_C55_IRQ_MET_AWB_TARGET1_HIT,
+	MALI_C55_IRQ_MET_AWB_TARGET2_HIT,
+	MALI_C55_NUM_IRQ_BITS
+};
+
+#define MALI_C55_INTERRUPT_BIT(x)			BIT(x)
+
+#define MALI_C55_REG_GLOBAL_PARAMETER_STATUS		0x00068
+#define MALI_C55_GPS_PONG_FITTED			BIT(0)
+#define MALI_C55_GPS_WDR_FITTED				BIT(1)
+#define MALI_C55_GPS_COMPRESSION_FITTED			BIT(2)
+#define MALI_C55_GPS_TEMPER_FITTED			BIT(3)
+#define MALI_C55_GPS_SINTER_LITE_FITTED			BIT(4)
+#define MALI_C55_GPS_SINTER_FITTED			BIT(5)
+#define MALI_C55_GPS_IRIDIX_LTM_FITTED			BIT(6)
+#define MALI_C55_GPS_IRIDIX_GTM_FITTED			BIT(7)
+#define MALI_C55_GPS_CNR_FITTED				BIT(8)
+#define MALI_C55_GPS_FRSCALER_FITTED			BIT(9)
+#define MALI_C55_GPS_DS_PIPE_FITTED			BIT(10)
+
+#define MALI_C55_REG_BLANKING				0x00084
+#define MALI_C55_REG_HBLANK_MASK			GENMASK(15, 0)
+#define MALI_C55_REG_VBLANK_MASK			GENMASK(31, 16)
+#define MALI_C55_VBLANK(x)				((x) << 16)
+
+#define MALI_C55_REG_HC_START				0x00088
+#define MALI_C55_HC_START(h)				(((h) & 0xffff) << 16)
+#define MALI_C55_REG_HC_SIZE				0x0008c
+#define MALI_C55_HC_SIZE(h)				((h) & 0xffff)
+#define MALI_C55_REG_VC_START_SIZE			0x00094
+#define MALI_C55_VC_START(v)				((v) & 0xffff)
+#define MALI_C55_VC_SIZE(v)				(((v) & 0xffff) << 16)
+
+/* Ping/Pong Configuration Space */
+#define MALI_C55_REG_BASE_ADDR				0x18e88
+#define MALI_C55_REG_BYPASS_0				0x18eac
+#define MALI_C55_REG_BYPASS_0_VIDEO_TEST		BIT(0)
+#define MALI_C55_REG_BYPASS_0_INPUT_FMT			BIT(1)
+#define MALI_C55_REG_BYPASS_0_DECOMPANDER		BIT(2)
+#define MALI_C55_REG_BYPASS_0_SENSOR_OFFSET_WDR		BIT(3)
+#define MALI_C55_REG_BYPASS_0_GAIN_WDR			BIT(4)
+#define MALI_C55_REG_BYPASS_0_FRAME_STITCH		BIT(5)
+#define MALI_C55_REG_BYPASS_1				0x18eb0
+#define MALI_C55_REG_BYPASS_1_DIGI_GAIN			BIT(0)
+#define MALI_C55_REG_BYPASS_1_FE_SENSOR_OFFS		BIT(1)
+#define MALI_C55_REG_BYPASS_1_FE_SQRT			BIT(2)
+#define MALI_C55_REG_BYPASS_1_RAW_FE			BIT(3)
+#define MALI_C55_REG_BYPASS_2				0x18eb8
+#define MALI_C55_REG_BYPASS_2_SINTER			BIT(0)
+#define MALI_C55_REG_BYPASS_2_TEMPER			BIT(1)
+#define MALI_C55_REG_BYPASS_3				0x18ebc
+#define MALI_C55_REG_BYPASS_3_SQUARE_BE			BIT(0)
+#define MALI_C55_REG_BYPASS_3_SENSOR_OFFSET_PRE_SH	BIT(1)
+#define MALI_C55_REG_BYPASS_3_MESH_SHADING		BIT(3)
+#define MALI_C55_REG_BYPASS_3_WHITE_BALANCE		BIT(4)
+#define MALI_C55_REG_BYPASS_3_IRIDIX			BIT(5)
+#define MALI_C55_REG_BYPASS_3_IRIDIX_GAIN		BIT(6)
+#define MALI_C55_REG_BYPASS_4				0x18ec0
+#define MALI_C55_REG_BYPASS_4_DEMOSAIC_RGB		BIT(1)
+#define MALI_C55_REG_BYPASS_4_PF_CORRECTION		BIT(3)
+#define MALI_C55_REG_BYPASS_4_CCM			BIT(4)
+#define MALI_C55_REG_BYPASS_4_CNR			BIT(5)
+#define MALI_C55_REG_FR_BYPASS				0x18ec4
+#define MALI_C55_REG_DS_BYPASS				0x18ec8
+#define MALI_C55_BYPASS_CROP				BIT(0)
+#define MALI_C55_BYPASS_SCALER				BIT(1)
+#define MALI_C55_BYPASS_GAMMA_RGB			BIT(2)
+#define MALI_C55_BYPASS_SHARPEN				BIT(3)
+#define MALI_C55_BYPASS_CS_CONV				BIT(4)
+#define MALI_C55_REG_ISP_RAW_BYPASS			0x18ecc
+#define MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK		BIT(0)
+#define MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK		GENMASK(9, 8)
+#define MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS		(2 << 8)
+#define MALI_C55_ISP_RAW_BYPASS_RGB_FR_BYPASS		(1 << 8)
+#define MALI_C55_ISP_RAW_BYPASS_DS_PIPE_DISABLE		BIT(1)
+#define MALI_C55_ISP_RAW_BYPASS_RAW_BYPASS		BIT(0)
+
+#define MALI_C55_REG_ACTIVE_WIDTH_MASK			0xffff
+#define MALI_C55_REG_ACTIVE_HEIGHT_MASK			0xffff0000
+#define MALI_C55_REG_BAYER_ORDER			0x18e8c
+#define MALI_C55_BAYER_ORDER_MASK			GENMASK(1, 0)
+#define MALI_C55_BAYER_ORDER_RGGB			0
+#define MALI_C55_BAYER_ORDER_GRBG			1
+#define MALI_C55_BAYER_ORDER_GBRG			2
+#define MALI_C55_BAYER_ORDER_BGGR			3
+
+#define MALI_C55_REG_TPG_CH0				0x18ed8
+#define MALI_C55_TEST_PATTERN_ON_OFF			BIT(0)
+#define MALI_C55_TEST_PATTERN_RGB_MASK			BIT(1)
+#define MALI_C55_TEST_PATTERN_RGB(x)			((x) << 1)
+#define MALI_C55_REG_TPG_R_BACKGROUND			0x18ee0
+#define MALI_C55_REG_TPG_G_BACKGROUND			0x18ee4
+#define MALI_C55_REG_TPG_B_BACKGROUND			0x18ee8
+#define MALI_C55_TPG_BACKGROUND_MAX			0xfffff
+#define MALI_C55_REG_INPUT_WIDTH			0x18f98
+#define MALI_C55_INPUT_WIDTH_MASK			GENMASK(18, 16)
+#define MALI_C55_INPUT_WIDTH_8BIT			(0 << 16)
+#define MALI_C55_INPUT_WIDTH_10BIT			(1 << 16)
+#define MALI_C55_INPUT_WIDTH_12BIT			(2 << 16)
+#define MALI_C55_INPUT_WIDTH_14BIT			(3 << 16)
+#define MALI_C55_INPUT_WIDTH_16BIT			(4 << 16)
+#define MALI_C55_INPUT_WIDTH_20BIT			(5 << 16)
+#define MALI_C55_REG_SPACE_SIZE				0x4000
+#define MALI_C55_REG_CONFIG_SPACES_OFFSET		0x0ab6c
+#define MALI_C55_CONFIG_SPACE_SIZE			0x1231c
+
+#define MALI_C55_REG_SINTER_CONFIG			0x19348
+#define MALI_C55_SINTER_VIEW_FILTER_MASK		GENMASK(1, 0)
+#define MALI_C55_SINTER_SCALE_MODE_MASK			GENMASK(3, 2)
+#define MALI_C55_SINTER_ENABLE_MASK			BIT(4)
+#define MALI_C55_SINTER_FILTER_SELECT_MASK		BIT(5)
+#define MALI_C55_SINTER_INT_SELECT_MASK			BIT(6)
+#define MALI_C55_SINTER_RM_ENABLE_MASK			BIT(7)
+
+/* Colour Correction Matrix Configuration */
+#define MALI_C55_REG_CCM_ENABLE				0x1b07c
+#define MALI_C55_CCM_ENABLE_MASK			BIT(0)
+#define MALI_C55_REG_CCM_COEF_R_R			0x1b080
+#define MALI_C55_REG_CCM_COEF_R_G			0x1b084
+#define MALI_C55_REG_CCM_COEF_R_B			0x1b088
+#define MALI_C55_REG_CCM_COEF_G_R			0x1b090
+#define MALI_C55_REG_CCM_COEF_G_G			0x1b094
+#define MALI_C55_REG_CCM_COEF_G_B			0x1b098
+#define MALI_C55_REG_CCM_COEF_B_R			0x1b0a0
+#define MALI_C55_REG_CCM_COEF_B_G			0x1b0a4
+#define MALI_C55_REG_CCM_COEF_B_B			0x1b0a8
+#define MALI_C55_CCM_COEF_MASK				GENMASK(12, 0)
+#define MALI_C55_REG_CCM_ANTIFOG_GAIN_R			0x1b0b0
+#define MALI_C55_REG_CCM_ANTIFOG_GAIN_G			0x1b0b4
+#define MALI_C55_REG_CCM_ANTIFOG_GAIN_B			0x1b0b8
+#define MALI_C55_CCM_ANTIFOG_GAIN_MASK			GENMASK(11, 0)
+#define MALI_C55_REG_CCM_ANTIFOG_OFFSET_R		0x1b0c0
+#define MALI_C55_REG_CCM_ANTIFOG_OFFSET_G		0x1b0c4
+#define MALI_C55_REG_CCM_ANTIFOG_OFFSET_B		0x1b0c8
+#define MALI_C55_CCM_ANTIFOG_OFFSET_MASK		GENMASK(11, 0)
+
+/*
+ * The Mali-C55 ISP has up to two output pipes; known as full resolution and
+ * down scaled. The register space for these is laid out identically, but offset
+ * by 372 bytes.
+ */
+#define MALI_C55_CAP_DEV_FR_REG_OFFSET		0x0
+#define MALI_C55_CAP_DEV_DS_REG_OFFSET		0x174
+
+#define MALI_C55_REG_CS_CONV_CONFIG			0x1c098
+#define MALI_C55_CS_CONV_MATRIX_MASK			BIT(0)
+#define MALI_C55_CS_CONV_FILTER_MASK			BIT(1)
+#define MALI_C55_CS_CONV_HORZ_DOWNSAMPLE_MASK		BIT(2)
+#define MALI_C55_CS_CONV_VERT_DOWNSAMPLE_MASK		BIT(3)
+#define MALI_C55_CS_CONV_FILTER_ENABLE			(0x01 << 1)
+#define MALI_C55_CS_CONV_HORZ_DOWNSAMPLE_ENABLE		(0x01 << 2)
+#define MALI_C55_CS_CONV_VERT_DOWNSAMPLE_ENABLE		(0x01 << 3)
+#define MALI_C55_REG_Y_WRITER_MODE			0x1c0ec
+#define MALI_C55_REG_UV_WRITER_MODE			0x1c144
+#define MALI_C55_WRITER_MODE_MASK			GENMASK(4, 0)
+#define MALI_C55_OUTPUT_DISABLED			0
+#define MALI_C55_OUTPUT_RGB32				1
+#define MALI_C55_OUTPUT_A2R10G10B10			2
+#define MALI_C55_OUTPUT_RGB565				3
+#define MALI_C55_OUTPUT_RGB24				4
+#define MALI_C55_OUTPUT_GEN32				5
+#define MALI_C55_OUTPUT_RAW16				6
+#define MALI_C55_OUTPUT_AYUV				8
+#define MALI_C55_OUTPUT_Y410				9
+#define MALI_C55_OUTPUT_YUY2				10
+#define MALI_C55_OUTPUT_UYVY				11
+#define MALI_C55_OUTPUT_Y210				12
+#define MALI_C55_OUTPUT_NV12_21				13
+#define MALI_C55_OUTPUT_YUV_420_422			17
+#define MALI_C55_OUTPUT_P210_P010			19
+#define MALI_C55_OUTPUT_YUV422				20
+#define MALI_C55_WRITER_SUBMODE_MASK			GENMASK(7, 6)
+#define MALI_C55_WRITER_SUBMODE(x)			((x) << 6)
+#define MALI_C55_OUTPUT_PLANE_ALT0			0
+#define MALI_C55_OUTPUT_PLANE_ALT1			1
+#define MALI_C55_OUTPUT_PLANE_ALT2			2
+#define MALI_C55_WRITER_FRAME_WRITE_MASK		BIT(9)
+#define MALI_C55_WRITER_FRAME_WRITE_ENABLE		(0x01 << 9)
+#define MALI_C55_REG_ACTIVE_OUT_Y_SIZE			0x1c0f0
+#define MALI_C55_REG_ACTIVE_OUT_UV_SIZE			0x1c148
+#define MALI_C55_REG_ACTIVE_OUT_SIZE_W(w)		((w) << 0)
+#define MALI_C55_REG_ACTIVE_OUT_SIZE_H(h)		((h) << 16)
+#define MALI_C55_REG_Y_WRITER_BANKS_BASE		0x1c0f4
+#define MALI_C55_REG_Y_WRITER_BANKS_CONFIG		0x1c108
+#define MALI_C55_REG_Y_WRITER_MAX_BANKS_MASK		GENMASK(2, 0)
+#define MALI_C55_REG_Y_WRITER_BANKS_RESTART		BIT(3)
+#define MALI_C55_REG_Y_WRITER_OFFSET			0x1c10c
+#define MALI_C55_REG_UV_WRITER_BANKS_BASE		0x1c14c
+#define MALI_C55_REG_UV_WRITER_BANKS_CONFIG		0x1c160
+#define MALI_C55_REG_UV_WRITER_MAX_BANKS_MASK		GENMASK(2, 0)
+#define MALI_C55_REG_UV_WRITER_BANKS_RESTART		BIT(3)
+#define MALI_C55_REG_UV_WRITER_OFFSET			0x1c164
+
+#define MALI_C55_REG_TEST_GEN_CH0_OFF_ON
+#define MALI_C55_REG_TEST_GEN_CH0_PATTERN_TYPE		0x18edc
+
+#define MALI_C55_REG_CROP_EN				0x1c028
+#define MALI_C55_CROP_ENABLE				BIT(0)
+#define MALI_C55_REG_CROP_X_START			0x1c02c
+#define MALI_C55_REG_CROP_Y_START			0x1c030
+#define MALI_C55_REG_CROP_X_SIZE			0x1c034
+#define MALI_C55_REG_CROP_Y_SIZE			0x1c038
+#define MALI_C55_REG_SCALER_TIMEOUT_EN			0x1c040
+#define MALI_C55_SCALER_TIMEOUT_EN			BIT(4)
+#define MALI_C55_SCALER_TIMEOUT(t)			((t) << 16)
+#define MALI_C55_REG_SCALER_IN_WIDTH			0x1c044
+#define MALI_C55_REG_SCALER_IN_HEIGHT			0x1c048
+#define MALI_C55_REG_SCALER_OUT_WIDTH			0x1c04c
+#define MALI_C55_REG_SCALER_OUT_HEIGHT			0x1c050
+#define MALI_C55_REG_SCALER_HFILT_TINC			0x1c054
+#define MALI_C55_REG_SCALER_HFILT_COEF			0x1c058
+#define MALI_C55_REG_SCALER_VFILT_TINC			0x1c05c
+#define MALI_C55_REG_SCALER_VFILT_COEF			0x1c060
+
+#define MALI_C55_REG_GAMMA_RGB_ENABLE			0x1c064
+#define MALI_C55_GAMMA_ENABLE_MASK			BIT(0)
+#define MALI_C55_REG_GAMMA_GAINS_1			0x1c068
+#define MALI_C55_GAMMA_GAIN_R_MASK			GENMASK(11, 0)
+#define MALI_C55_GAMMA_GAIN_G_MASK			GENMASK(27, 16)
+#define MALI_C55_REG_GAMMA_GAINS_2			0x1c06c
+#define MALI_C55_GAMMA_GAIN_B_MASK			GENMASK(11, 0)
+#define MALI_C55_REG_GAMMA_OFFSETS_1			0x1c070
+#define MALI_C55_GAMMA_OFFSET_R_MASK			GENMASK(11, 0)
+#define MALI_C55_GAMMA_OFFSET_G_MASK			GENMASK(27, 16)
+#define MALI_C55_REG_GAMMA_OFFSETS_2			0x1c074
+#define MALI_C55_GAMMA_OFFSET_B_MASK			GENMASK(11, 0)
+
+/*
+ * A re-definition of an above register. These will usually be written on a per
+ * capture device basis and handled with mali_c55_cap_dev_write(), but on
+ * startup is written by core.c
+ */
+#define MALI_C55_REG_FR_GAMMA_RGB_ENABLE		0x1c064
+#define MALI_C55_REG_DS_GAMMA_RGB_ENABLE		0x1c1d8
+
+#define MALI_C55_REG_FR_SCALER_HFILT			0x34a8
+#define MALI_C55_REG_FR_SCALER_VFILT			0x44a8
+#define MALI_C55_REG_DS_SCALER_HFILT			0x14a8
+#define MALI_C55_REG_DS_SCALER_VFILT			0x24a8
+
+#endif /* _MALI_C55_REGISTERS_H */
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
new file mode 100644
index 000000000000..d4ca13fcb5e8
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-resizer.c
@@ -0,0 +1,1142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - Image signal processor
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#include <linux/math.h>
+#include <linux/minmax.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-subdev.h>
+
+#include "mali-c55-common.h"
+#include "mali-c55-registers.h"
+
+/* Scaling factor in Q4.20 format. */
+#define MALI_C55_RSZ_SCALER_FACTOR	(1U << 20)
+
+#define MALI_C55_RSZ_COEFS_BANKS	8
+#define MALI_C55_RSZ_COEFS_ENTRIES	64
+
+static inline struct mali_c55_resizer *
+sd_to_mali_c55_rsz(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct mali_c55_resizer, sd);
+}
+
+static const unsigned int
+mali_c55_rsz_filter_coeffs_h[MALI_C55_RSZ_COEFS_BANKS]
+			    [MALI_C55_RSZ_COEFS_ENTRIES] = {
+	{	/* Bank 0 */
+		0x24fc0000, 0x0000fc24, 0x27fc0000, 0x0000fc21,
+		0x28fc0000, 0x0000fd1f, 0x2cfb0000, 0x0000fd1c,
+		0x2efb0000, 0x0000fd1a, 0x30fb0000, 0x0000fe17,
+		0x32fb0000, 0x0000fe15, 0x35fb0000, 0x0000fe12,
+		0x35fc0000, 0x0000ff10, 0x37fc0000, 0x0000ff0e,
+		0x39fc0000, 0x0000ff0c, 0x3afd0000, 0x0000ff0a,
+		0x3afe0000, 0x00000008, 0x3cfe0000, 0x00000006,
+		0x3dff0000, 0x00000004, 0x3d000000, 0x00000003,
+		0x3c020000, 0x00000002, 0x3d030000, 0x00000000,
+		0x3d040000, 0x000000ff, 0x3c060000, 0x000000fe,
+		0x3a080000, 0x000000fe, 0x3a0aff00, 0x000000fd,
+		0x390cff00, 0x000000fc, 0x370eff00, 0x000000fc,
+		0x3510ff00, 0x000000fc, 0x3512fe00, 0x000000fb,
+		0x3215fe00, 0x000000fb, 0x3017fe00, 0x000000fb,
+		0x2e1afd00, 0x000000fb, 0x2c1cfd00, 0x000000fb,
+		0x281ffd00, 0x000000fc, 0x2721fc00, 0x000000fc,
+	},
+	{	/* Bank 1 */
+		0x25fb0000, 0x0000fb25, 0x27fb0000, 0x0000fb23,
+		0x29fb0000, 0x0000fb21, 0x2afc0000, 0x0000fb1f,
+		0x2cfc0000, 0x0000fb1d, 0x2efc0000, 0x0000fb1b,
+		0x2ffd0000, 0x0000fb19, 0x2ffe0000, 0x0000fc17,
+		0x31fe0000, 0x0000fc15, 0x32ff0000, 0x0000fc13,
+		0x3400ff00, 0x0000fc11, 0x3301ff00, 0x0000fd10,
+		0x3402ff00, 0x0000fd0e, 0x3503ff00, 0x0000fd0c,
+		0x3505ff00, 0x0000fd0a, 0x3506fe00, 0x0000fe09,
+		0x3607fe00, 0x0000fe07, 0x3509fe00, 0x0000fe06,
+		0x350afd00, 0x0000ff05, 0x350cfd00, 0x0000ff03,
+		0x340efd00, 0x0000ff02, 0x3310fd00, 0x0000ff01,
+		0x3411fc00, 0x0000ff00, 0x3213fc00, 0x000000ff,
+		0x3115fc00, 0x000000fe, 0x2f17fc00, 0x000000fe,
+		0x2f19fb00, 0x000000fd, 0x2e1bfb00, 0x000000fc,
+		0x2c1dfb00, 0x000000fc, 0x2a1ffb00, 0x000000fc,
+		0x2921fb00, 0x000000fb, 0x2723fb00, 0x000000fb,
+	},
+	{	/* Bank 2 */
+		0x1f010000, 0x0000011f, 0x21010000, 0x0000001e,
+		0x21020000, 0x0000001d, 0x22020000, 0x0000001c,
+		0x23030000, 0x0000ff1b, 0x2404ff00, 0x0000ff1a,
+		0x2504ff00, 0x0000ff19, 0x2505ff00, 0x0000ff18,
+		0x2606ff00, 0x0000fe17, 0x2607ff00, 0x0000fe16,
+		0x2708ff00, 0x0000fe14, 0x2709ff00, 0x0000fe13,
+		0x270aff00, 0x0000fe12, 0x280bfe00, 0x0000fe11,
+		0x280cfe00, 0x0000fe10, 0x280dfe00, 0x0000fe0f,
+		0x280efe00, 0x0000fe0e, 0x280ffe00, 0x0000fe0d,
+		0x2810fe00, 0x0000fe0c, 0x2811fe00, 0x0000fe0b,
+		0x2712fe00, 0x0000ff0a, 0x2713fe00, 0x0000ff09,
+		0x2714fe00, 0x0000ff08, 0x2616fe00, 0x0000ff07,
+		0x2617fe00, 0x0000ff06, 0x2518ff00, 0x0000ff05,
+		0x2519ff00, 0x0000ff04, 0x241aff00, 0x0000ff04,
+		0x231bff00, 0x00000003, 0x221c0000, 0x00000002,
+		0x211d0000, 0x00000002, 0x211e0000, 0x00000001,
+	},
+	{	/* Bank 3 */
+		0x1b06ff00, 0x00ff061b, 0x1b07ff00, 0x00ff061a,
+		0x1c07ff00, 0x00ff051a, 0x1c08ff00, 0x00ff0519,
+		0x1c09ff00, 0x00ff0419, 0x1d09ff00, 0x00ff0418,
+		0x1e0aff00, 0x00ff0317, 0x1e0aff00, 0x00ff0317,
+		0x1e0bff00, 0x00ff0316, 0x1f0cff00, 0x00ff0215,
+		0x1e0cff00, 0x00000215, 0x1e0dff00, 0x00000214,
+		0x1e0e0000, 0x00000113, 0x1e0e0000, 0x00000113,
+		0x1e0f0000, 0x00000112, 0x1f100000, 0x00000011,
+		0x20100000, 0x00000010, 0x1f110000, 0x00000010,
+		0x1e120100, 0x0000000f, 0x1e130100, 0x0000000e,
+		0x1e130100, 0x0000000e, 0x1e140200, 0x0000ff0d,
+		0x1e150200, 0x0000ff0c, 0x1f1502ff, 0x0000ff0c,
+		0x1e1603ff, 0x0000ff0b, 0x1e1703ff, 0x0000ff0a,
+		0x1e1703ff, 0x0000ff0a, 0x1d1804ff, 0x0000ff09,
+		0x1c1904ff, 0x0000ff09, 0x1c1905ff, 0x0000ff08,
+		0x1c1a05ff, 0x0000ff07, 0x1b1a06ff, 0x0000ff07,
+	},
+	{	/* Bank 4 */
+		0x17090000, 0x00000917, 0x18090000, 0x00000916,
+		0x170a0100, 0x00000816, 0x170a0100, 0x00000816,
+		0x180b0100, 0x00000715, 0x180b0100, 0x00000715,
+		0x170c0100, 0x00000715, 0x190c0100, 0x00000614,
+		0x180d0100, 0x00000614, 0x190d0200, 0x00000513,
+		0x180e0200, 0x00000513, 0x180e0200, 0x00000513,
+		0x1a0e0200, 0x00000412, 0x190f0200, 0x00000412,
+		0x190f0300, 0x00000411, 0x18100300, 0x00000411,
+		0x1a100300, 0x00000310, 0x18110400, 0x00000310,
+		0x19110400, 0x0000030f, 0x19120400, 0x0000020f,
+		0x1a120400, 0x0000020e, 0x18130500, 0x0000020e,
+		0x18130500, 0x0000020e, 0x19130500, 0x0000020d,
+		0x18140600, 0x0000010d, 0x19140600, 0x0000010c,
+		0x17150700, 0x0000010c, 0x18150700, 0x0000010b,
+		0x18150700, 0x0000010b, 0x17160800, 0x0000010a,
+		0x17160800, 0x0000010a, 0x18160900, 0x00000009,
+	},
+	{	/* Bank 5 */
+		0x120b0300, 0x00030b12, 0x120c0300, 0x00030b11,
+		0x110c0400, 0x00030b11, 0x110c0400, 0x00030b11,
+		0x130c0400, 0x00020a11, 0x120d0400, 0x00020a11,
+		0x110d0500, 0x00020a11, 0x110d0500, 0x00020a11,
+		0x130d0500, 0x00010911, 0x130e0500, 0x00010910,
+		0x120e0600, 0x00010910, 0x120e0600, 0x00010910,
+		0x130e0600, 0x00010810, 0x120f0600, 0x00010810,
+		0x120f0700, 0x00000810, 0x130f0700, 0x0000080f,
+		0x140f0700, 0x0000070f, 0x130f0800, 0x0000070f,
+		0x12100800, 0x0000070f, 0x12100801, 0x0000060f,
+		0x13100801, 0x0000060e, 0x12100901, 0x0000060e,
+		0x12100901, 0x0000060e, 0x13100901, 0x0000050e,
+		0x13110901, 0x0000050d, 0x11110a02, 0x0000050d,
+		0x11110a02, 0x0000050d, 0x12110a02, 0x0000040d,
+		0x13110a02, 0x0000040c, 0x11110b03, 0x0000040c,
+		0x11110b03, 0x0000040c, 0x12110b03, 0x0000030c,
+	},
+	{	/* Bank 6 */
+		0x0b0a0805, 0x00080a0c, 0x0b0a0805, 0x00080a0c,
+		0x0c0a0805, 0x00080a0b, 0x0c0a0805, 0x00080a0b,
+		0x0d0a0805, 0x00070a0b, 0x0d0a0805, 0x00070a0b,
+		0x0d0a0805, 0x00070a0b, 0x0c0a0806, 0x00070a0b,
+		0x0b0b0806, 0x00070a0b, 0x0c0b0806, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0c0b0906, 0x0006090b,
+		0x0c0b0906, 0x0006090b, 0x0c0b0906, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0c0b0907, 0x0006080b,
+		0x0b0b0a07, 0x0006080b, 0x0c0b0a07, 0x0006080a,
+		0x0d0b0a07, 0x0005080a, 0x0d0b0a07, 0x0005080a,
+		0x0d0b0a07, 0x0005080a, 0x0c0b0a08, 0x0005080a,
+		0x0c0b0a08, 0x0005080a, 0x0c0b0a08, 0x0005080a,
+	},
+	{	/* Bank 7 */
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+		0x0909090a, 0x00090909, 0x0909090a, 0x00090909,
+	}
+};
+
+static const unsigned int
+mali_c55_rsz_filter_coeffs_v[MALI_C55_RSZ_COEFS_BANKS]
+			    [MALI_C55_RSZ_COEFS_ENTRIES] = {
+	{	/* Bank 0 */
+		0x2424fc00, 0x000000fc, 0x2721fc00, 0x000000fc,
+		0x281ffd00, 0x000000fc, 0x2c1cfd00, 0x000000fb,
+		0x2e1afd00, 0x000000fb, 0x3017fe00, 0x000000fb,
+		0x3215fe00, 0x000000fb, 0x3512fe00, 0x000000fb,
+		0x3510ff00, 0x000000fc, 0x370eff00, 0x000000fc,
+		0x390cff00, 0x000000fc, 0x3a0aff00, 0x000000fd,
+		0x3a080000, 0x000000fe, 0x3c060000, 0x000000fe,
+		0x3d040000, 0x000000ff, 0x3d030000, 0x00000000,
+		0x3c020000, 0x00000002, 0x3d000000, 0x00000003,
+		0x3dff0000, 0x00000004, 0x3cfe0000, 0x00000006,
+		0x3afe0000, 0x00000008, 0x3afd0000, 0x0000ff0a,
+		0x39fc0000, 0x0000ff0c, 0x37fc0000, 0x0000ff0e,
+		0x35fc0000, 0x0000ff10, 0x35fb0000, 0x0000fe12,
+		0x32fb0000, 0x0000fe15, 0x30fb0000, 0x0000fe17,
+		0x2efb0000, 0x0000fd1a, 0x2cfb0000, 0x0000fd1c,
+		0x28fc0000, 0x0000fd1f, 0x27fc0000, 0x0000fc21,
+	},
+	{	/* Bank 1 */
+		0x2525fb00, 0x000000fb, 0x2723fb00, 0x000000fb,
+		0x2921fb00, 0x000000fb, 0x2a1ffb00, 0x000000fc,
+		0x2c1dfb00, 0x000000fc, 0x2e1bfb00, 0x000000fc,
+		0x2f19fb00, 0x000000fd, 0x2f17fc00, 0x000000fe,
+		0x3115fc00, 0x000000fe, 0x3213fc00, 0x000000ff,
+		0x3411fc00, 0x0000ff00, 0x3310fd00, 0x0000ff01,
+		0x340efd00, 0x0000ff02, 0x350cfd00, 0x0000ff03,
+		0x350afd00, 0x0000ff05, 0x3509fe00, 0x0000fe06,
+		0x3607fe00, 0x0000fe07, 0x3506fe00, 0x0000fe09,
+		0x3505ff00, 0x0000fd0a, 0x3503ff00, 0x0000fd0c,
+		0x3402ff00, 0x0000fd0e, 0x3301ff00, 0x0000fd10,
+		0x3400ff00, 0x0000fc11, 0x32ff0000, 0x0000fc13,
+		0x31fe0000, 0x0000fc15, 0x2ffe0000, 0x0000fc17,
+		0x2ffd0000, 0x0000fb19, 0x2efc0000, 0x0000fb1b,
+		0x2cfc0000, 0x0000fb1d, 0x2afc0000, 0x0000fb1f,
+		0x29fb0000, 0x0000fb21, 0x27fb0000, 0x0000fb23,
+	},
+	{	/* Bank 2 */
+		0x1f1f0100, 0x00000001, 0x211e0000, 0x00000001,
+		0x211d0000, 0x00000002, 0x221c0000, 0x00000002,
+		0x231bff00, 0x00000003, 0x241aff00, 0x0000ff04,
+		0x2519ff00, 0x0000ff04, 0x2518ff00, 0x0000ff05,
+		0x2617fe00, 0x0000ff06, 0x2616fe00, 0x0000ff07,
+		0x2714fe00, 0x0000ff08, 0x2713fe00, 0x0000ff09,
+		0x2712fe00, 0x0000ff0a, 0x2811fe00, 0x0000fe0b,
+		0x2810fe00, 0x0000fe0c, 0x280ffe00, 0x0000fe0d,
+		0x280efe00, 0x0000fe0e, 0x280dfe00, 0x0000fe0f,
+		0x280cfe00, 0x0000fe10, 0x280bfe00, 0x0000fe11,
+		0x270aff00, 0x0000fe12, 0x2709ff00, 0x0000fe13,
+		0x2708ff00, 0x0000fe14, 0x2607ff00, 0x0000fe16,
+		0x2606ff00, 0x0000fe17, 0x2505ff00, 0x0000ff18,
+		0x2504ff00, 0x0000ff19, 0x2404ff00, 0x0000ff1a,
+		0x23030000, 0x0000ff1b, 0x22020000, 0x0000001c,
+		0x21020000, 0x0000001d, 0x21010000, 0x0000001e,
+	},
+	{	/* Bank 3 */
+		0x1b1b06ff, 0x0000ff06, 0x1b1a06ff, 0x0000ff07,
+		0x1c1a05ff, 0x0000ff07, 0x1c1905ff, 0x0000ff08,
+		0x1c1904ff, 0x0000ff09, 0x1d1804ff, 0x0000ff09,
+		0x1e1703ff, 0x0000ff0a, 0x1e1703ff, 0x0000ff0a,
+		0x1e1603ff, 0x0000ff0b, 0x1f1502ff, 0x0000ff0c,
+		0x1e150200, 0x0000ff0c, 0x1e140200, 0x0000ff0d,
+		0x1e130100, 0x0000000e, 0x1e130100, 0x0000000e,
+		0x1e120100, 0x0000000f, 0x1f110000, 0x00000010,
+		0x20100000, 0x00000010, 0x1f100000, 0x00000011,
+		0x1e0f0000, 0x00000112, 0x1e0e0000, 0x00000113,
+		0x1e0e0000, 0x00000113, 0x1e0dff00, 0x00000214,
+		0x1e0cff00, 0x00000215, 0x1f0cff00, 0x00ff0215,
+		0x1e0bff00, 0x00ff0316, 0x1e0aff00, 0x00ff0317,
+		0x1e0aff00, 0x00ff0317, 0x1d09ff00, 0x00ff0418,
+		0x1c09ff00, 0x00ff0419, 0x1c08ff00, 0x00ff0519,
+		0x1c07ff00, 0x00ff051a, 0x1b07ff00, 0x00ff061a,
+	},
+	{	/* Bank 4 */
+		0x17170900, 0x00000009, 0x18160900, 0x00000009,
+		0x17160800, 0x0000010a, 0x17160800, 0x0000010a,
+		0x18150700, 0x0000010b, 0x18150700, 0x0000010b,
+		0x17150700, 0x0000010c, 0x19140600, 0x0000010c,
+		0x18140600, 0x0000010d, 0x19130500, 0x0000020d,
+		0x18130500, 0x0000020e, 0x18130500, 0x0000020e,
+		0x1a120400, 0x0000020e, 0x19120400, 0x0000020f,
+		0x19110400, 0x0000030f, 0x18110400, 0x00000310,
+		0x1a100300, 0x00000310, 0x18100300, 0x00000411,
+		0x190f0300, 0x00000411, 0x190f0200, 0x00000412,
+		0x1a0e0200, 0x00000412, 0x180e0200, 0x00000513,
+		0x180e0200, 0x00000513, 0x190d0200, 0x00000513,
+		0x180d0100, 0x00000614, 0x190c0100, 0x00000614,
+		0x170c0100, 0x00000715, 0x180b0100, 0x00000715,
+		0x180b0100, 0x00000715, 0x170a0100, 0x00000816,
+		0x170a0100, 0x00000816, 0x18090000, 0x00000916,
+	},
+	{	/* Bank 5 */
+		0x12120b03, 0x0000030b, 0x12110b03, 0x0000030c,
+		0x11110b03, 0x0000040c, 0x11110b03, 0x0000040c,
+		0x13110a02, 0x0000040c, 0x12110a02, 0x0000040d,
+		0x11110a02, 0x0000050d, 0x11110a02, 0x0000050d,
+		0x13110901, 0x0000050d, 0x13100901, 0x0000050e,
+		0x12100901, 0x0000060e, 0x12100901, 0x0000060e,
+		0x13100801, 0x0000060e, 0x12100801, 0x0000060f,
+		0x12100800, 0x0000070f, 0x130f0800, 0x0000070f,
+		0x140f0700, 0x0000070f, 0x130f0700, 0x0000080f,
+		0x120f0700, 0x00000810, 0x120f0600, 0x00010810,
+		0x130e0600, 0x00010810, 0x120e0600, 0x00010910,
+		0x120e0600, 0x00010910, 0x130e0500, 0x00010910,
+		0x130d0500, 0x00010911, 0x110d0500, 0x00020a11,
+		0x110d0500, 0x00020a11, 0x120d0400, 0x00020a11,
+		0x130c0400, 0x00020a11, 0x110c0400, 0x00030b11,
+		0x110c0400, 0x00030b11, 0x120c0300, 0x00030b11,
+	},
+	{	/* Bank 6 */
+		0x0b0c0a08, 0x0005080a, 0x0b0c0a08, 0x0005080a,
+		0x0c0b0a08, 0x0005080a, 0x0c0b0a08, 0x0005080a,
+		0x0d0b0a07, 0x0005080a, 0x0d0b0a07, 0x0005080a,
+		0x0d0b0a07, 0x0005080a, 0x0c0b0a07, 0x0006080a,
+		0x0b0b0a07, 0x0006080b, 0x0c0b0907, 0x0006080b,
+		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0b0b0907, 0x0006090b,
+		0x0b0b0907, 0x0006090b, 0x0c0b0906, 0x0006090b,
+		0x0c0b0906, 0x0006090b, 0x0c0b0906, 0x0006090b,
+		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0b0b0906, 0x0007090b,
+		0x0b0b0906, 0x0007090b, 0x0c0b0806, 0x0007090b,
+		0x0b0b0806, 0x00070a0b, 0x0c0a0806, 0x00070a0b,
+		0x0d0a0805, 0x00070a0b, 0x0d0a0805, 0x00070a0b,
+		0x0d0a0805, 0x00070a0b, 0x0c0a0805, 0x00080a0b,
+		0x0c0a0805, 0x00080a0b, 0x0c0a0805, 0x00080a0b,
+	},
+	{	/* Bank 7 */
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+		0x09090909, 0x000a0909, 0x09090909, 0x000a0909,
+	}
+};
+
+static const unsigned int mali_c55_rsz_coef_banks_range_start[] = {
+	770, 600, 460, 354, 273, 210, 162, 125
+};
+
+/*
+ * Select the right filter coefficients bank based on the scaler input and the
+ * scaler output sizes ratio, set by the v4l2 crop and scale selection
+ * rectangles respectively.
+ */
+static unsigned int mali_c55_rsz_calculate_bank(struct mali_c55 *mali_c55,
+						unsigned int rsz_in,
+						unsigned int rsz_out)
+{
+	unsigned int rsz_ratio = (rsz_out * 1000U) / rsz_in;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c55_rsz_coef_banks_range_start); i++)
+		if (rsz_ratio >= mali_c55_rsz_coef_banks_range_start[i])
+			break;
+
+	return i;
+}
+
+static const u32 rsz_non_bypass_src_fmts[] = {
+	MEDIA_BUS_FMT_RGB121212_1X36,
+	MEDIA_BUS_FMT_YUV10_1X30
+};
+
+static void mali_c55_resizer_program_coefficients(struct mali_c55_resizer *rsz)
+{
+	struct mali_c55 *mali_c55 = rsz->mali_c55;
+	unsigned int haddr = rsz->id == MALI_C55_RSZ_FR ?
+			     MALI_C55_REG_FR_SCALER_HFILT :
+			     MALI_C55_REG_DS_SCALER_HFILT;
+	unsigned int vaddr = rsz->id == MALI_C55_RSZ_FR ?
+			     MALI_C55_REG_FR_SCALER_VFILT :
+			     MALI_C55_REG_DS_SCALER_VFILT;
+
+	for (unsigned int i = 0; i < MALI_C55_RSZ_COEFS_BANKS; i++) {
+		for (unsigned int j = 0; j < MALI_C55_RSZ_COEFS_ENTRIES; j++) {
+			mali_c55_write(mali_c55, haddr,
+				       mali_c55_rsz_filter_coeffs_h[i][j]);
+			mali_c55_write(mali_c55, vaddr,
+				       mali_c55_rsz_filter_coeffs_v[i][j]);
+
+			haddr += sizeof(u32);
+			vaddr += sizeof(u32);
+		}
+	}
+}
+
+static int mali_c55_rsz_program_crop(struct mali_c55_resizer *rsz,
+				     const struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *fmt;
+	const struct v4l2_rect *crop;
+
+	/* Verify if crop should be enabled. */
+	fmt = v4l2_subdev_state_get_format(state, MALI_C55_RSZ_SINK_PAD, 0);
+	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RSZ_SINK_PAD, 0);
+
+	if (fmt->width == crop->width && fmt->height == crop->height)
+		return MALI_C55_BYPASS_CROP;
+
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_CROP_X_START,
+			       crop->left);
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_CROP_Y_START,
+			       crop->top);
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_CROP_X_SIZE,
+			       crop->width);
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_CROP_Y_SIZE,
+			       crop->height);
+
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_CROP_EN,
+			       MALI_C55_CROP_ENABLE);
+
+	return 0;
+}
+
+static int mali_c55_rsz_program_resizer(struct mali_c55_resizer *rsz,
+					struct v4l2_subdev_state *state)
+{
+	struct mali_c55 *mali_c55 = rsz->mali_c55;
+	const struct v4l2_rect *crop, *scale;
+	unsigned int h_bank, v_bank;
+	u64 h_scale, v_scale;
+
+	/* Verify if scaling should be enabled. */
+	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RSZ_SINK_PAD, 0);
+	scale = v4l2_subdev_state_get_compose(state, MALI_C55_RSZ_SINK_PAD, 0);
+
+	if (crop->width == scale->width && crop->height == scale->height)
+		return MALI_C55_BYPASS_SCALER;
+
+	/* Program the scaler coefficients if the scaler is in use. */
+	mali_c55_resizer_program_coefficients(rsz);
+
+	/* Program the V/H scaling factor in Q4.20 format. */
+	h_scale = crop->width * MALI_C55_RSZ_SCALER_FACTOR;
+	v_scale = crop->height * MALI_C55_RSZ_SCALER_FACTOR;
+
+	do_div(h_scale, scale->width);
+	do_div(v_scale, scale->height);
+
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_SCALER_IN_WIDTH,
+			       crop->width);
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_SCALER_IN_HEIGHT,
+			       crop->height);
+
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_SCALER_OUT_WIDTH,
+			       scale->width);
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_SCALER_OUT_HEIGHT,
+			       scale->height);
+
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_SCALER_HFILT_TINC,
+			       h_scale);
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_SCALER_VFILT_TINC,
+			       v_scale);
+
+	/* Select the scaler coefficients bank to use. */
+	h_bank = mali_c55_rsz_calculate_bank(mali_c55, crop->width,
+					     scale->width);
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_SCALER_HFILT_COEF,
+			       h_bank);
+
+	v_bank = mali_c55_rsz_calculate_bank(mali_c55, crop->height,
+					     scale->height);
+	mali_c55_cap_dev_write(rsz->cap_dev, MALI_C55_REG_SCALER_VFILT_COEF,
+			       v_bank);
+
+	return 0;
+}
+
+static void mali_c55_rsz_program(struct mali_c55_resizer *rsz,
+				 struct v4l2_subdev_state *state)
+{
+	struct mali_c55 *mali_c55 = rsz->mali_c55;
+	u32 bypass = 0;
+
+	/* Verify if cropping and scaling should be enabled. */
+	bypass |= mali_c55_rsz_program_crop(rsz, state);
+	bypass |= mali_c55_rsz_program_resizer(rsz, state);
+
+	mali_c55_ctx_update_bits(mali_c55, rsz->id == MALI_C55_RSZ_FR ?
+				 MALI_C55_REG_FR_BYPASS : MALI_C55_REG_DS_BYPASS,
+				 MALI_C55_BYPASS_CROP | MALI_C55_BYPASS_SCALER,
+				 bypass);
+}
+
+/*
+ * Inspect the routing table to know which of the two (mutually exclusive)
+ * routes is enabled and return the sink pad id of the active route.
+ */
+static unsigned int mali_c55_rsz_get_active_sink(struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_krouting *routing = &state->routing;
+	struct v4l2_subdev_route *route;
+
+	/* A single route is enabled at a time. */
+	for_each_active_route(routing, route)
+		return route->sink_pad;
+
+	return MALI_C55_RSZ_SINK_PAD;
+}
+
+/*
+ * When operating in bypass mode, the ISP takes input in a 20-bit format, but
+ * can only output 16-bit RAW bayer data (with the 4 least significant bits from
+ * the input being lost). Return the 16-bit version of the 20-bit input formats.
+ */
+static u32 mali_c55_rsz_shift_mbus_code(u32 mbus_code)
+{
+	const struct mali_c55_isp_format_info *fmt =
+		mali_c55_isp_get_mbus_config_by_code(mbus_code);
+
+	if (!fmt)
+		return -EINVAL;
+
+	return fmt->shifted_code;
+}
+
+static int __mali_c55_rsz_set_routing(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      const struct v4l2_subdev_krouting *routing)
+{
+	struct mali_c55_resizer *rsz = sd_to_mali_c55_rsz(sd);
+	unsigned int active_sink = UINT_MAX;
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_subdev_route *route;
+	unsigned int active_routes = 0;
+	struct v4l2_mbus_framefmt *fmt;
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing, 0);
+	if (ret)
+		return ret;
+
+	/* Only a single route can be enabled at a time. */
+	for_each_active_route(routing, route) {
+		if (++active_routes > 1) {
+			dev_dbg(rsz->mali_c55->dev,
+				"Only one route can be active");
+			return -EINVAL;
+		}
+
+		active_sink = route->sink_pad;
+	}
+	if (active_sink == UINT_MAX) {
+		dev_dbg(rsz->mali_c55->dev, "One route has to be active");
+		return -EINVAL;
+	}
+
+	ret = v4l2_subdev_set_routing(sd, state, routing);
+	if (ret) {
+		dev_dbg(rsz->mali_c55->dev, "Failed to set routing\n");
+		return ret;
+	}
+
+	fmt = v4l2_subdev_state_get_format(state, active_sink, 0);
+	fmt->width = MALI_C55_DEFAULT_WIDTH;
+	fmt->height = MALI_C55_DEFAULT_HEIGHT;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(false,
+							  fmt->colorspace,
+							  fmt->ycbcr_enc);
+	fmt->field = V4L2_FIELD_NONE;
+
+	if (active_sink == MALI_C55_RSZ_SINK_PAD) {
+		struct v4l2_rect *crop, *compose;
+
+		fmt->code = MEDIA_BUS_FMT_RGB121212_1X36;
+
+		crop = v4l2_subdev_state_get_crop(state, active_sink, 0);
+		compose = v4l2_subdev_state_get_compose(state, active_sink, 0);
+
+		crop->left = 0;
+		crop->top = 0;
+		crop->width = MALI_C55_DEFAULT_WIDTH;
+		crop->height = MALI_C55_DEFAULT_HEIGHT;
+
+		*compose = *crop;
+	} else {
+		fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
+	}
+
+	/* Propagate the format to the source pad */
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C55_RSZ_SOURCE_PAD,
+					       0);
+	*src_fmt = *fmt;
+
+	/* In the event this is the bypass pad the mbus code needs correcting */
+	if (active_sink == MALI_C55_RSZ_SINK_BYPASS_PAD)
+		src_fmt->code = mali_c55_rsz_shift_mbus_code(src_fmt->code);
+
+	return 0;
+}
+
+static int mali_c55_rsz_enum_mbus_code(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct mali_c55_isp_format_info *fmt;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	u32 sink_pad;
+
+	switch (code->pad) {
+	case MALI_C55_RSZ_SINK_PAD:
+		if (code->index)
+			return -EINVAL;
+
+		code->code = MEDIA_BUS_FMT_RGB121212_1X36;
+
+		return 0;
+	case MALI_C55_RSZ_SOURCE_PAD:
+		sink_pad = mali_c55_rsz_get_active_sink(state);
+		sink_fmt = v4l2_subdev_state_get_format(state, sink_pad, 0);
+
+		/*
+		 * If the active route is from the Bypass sink pad, then the
+		 * source pad is a simple passthrough of the sink format,
+		 * downshifted to 16-bits.
+		 */
+
+		if (sink_pad == MALI_C55_RSZ_SINK_BYPASS_PAD) {
+			if (code->index)
+				return -EINVAL;
+
+			code->code = mali_c55_rsz_shift_mbus_code(sink_fmt->code);
+			if (!code->code)
+				return -EINVAL;
+
+			return 0;
+		}
+
+		/*
+		 * If the active route is from the non-bypass sink then we can
+		 * select either RGB or conversion to YUV.
+		 */
+
+		if (code->index >= ARRAY_SIZE(rsz_non_bypass_src_fmts))
+			return -EINVAL;
+
+		code->code = rsz_non_bypass_src_fmts[code->index];
+
+		return 0;
+	case MALI_C55_RSZ_SINK_BYPASS_PAD:
+		fmt = mali_c55_isp_get_mbus_config_by_index(code->index);
+		if (fmt) {
+			code->code = fmt->code;
+			return 0;
+		}
+
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int mali_c55_rsz_enum_frame_size(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct mali_c55_isp_format_info *fmt;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	struct v4l2_rect *compose;
+	u32 sink_pad;
+
+	switch (fse->pad) {
+	case MALI_C55_RSZ_SINK_PAD:
+		if (fse->index || fse->code != MEDIA_BUS_FMT_RGB121212_1X36)
+			return -EINVAL;
+
+		fse->max_width = MALI_C55_MAX_WIDTH;
+		fse->max_height = MALI_C55_MAX_HEIGHT;
+		fse->min_width = MALI_C55_MIN_WIDTH;
+		fse->min_height = MALI_C55_MIN_HEIGHT;
+
+		return 0;
+	case MALI_C55_RSZ_SOURCE_PAD:
+		sink_pad = mali_c55_rsz_get_active_sink(state);
+		sink_fmt = v4l2_subdev_state_get_format(state, sink_pad, 0);
+
+		if (sink_pad == MALI_C55_RSZ_SINK_BYPASS_PAD) {
+			if (fse->index)
+				return -EINVAL;
+
+			fmt = mali_c55_isp_get_mbus_config_by_shifted_code(fse->code);
+			if (!fmt)
+				return -EINVAL;
+
+			fse->min_width = sink_fmt->width;
+			fse->max_width = sink_fmt->width;
+			fse->min_height = sink_fmt->height;
+			fse->max_height = sink_fmt->height;
+
+			return 0;
+		}
+
+		if ((fse->code != MEDIA_BUS_FMT_RGB121212_1X36 &&
+		    fse->code != MEDIA_BUS_FMT_YUV10_1X30) || fse->index > 1)
+			return -EINVAL;
+
+		compose = v4l2_subdev_state_get_compose(state,
+							MALI_C55_RSZ_SINK_PAD,
+							0);
+
+		fse->min_width = compose->width;
+		fse->max_width = compose->width;
+		fse->min_height = compose->height;
+		fse->max_height = compose->height;
+
+		return 0;
+	case MALI_C55_RSZ_SINK_BYPASS_PAD:
+		fmt = mali_c55_isp_get_mbus_config_by_code(fse->code);
+		if (fse->index || !fmt)
+			return -EINVAL;
+
+		fse->max_width = MALI_C55_MAX_WIDTH;
+		fse->max_height = MALI_C55_MAX_HEIGHT;
+		fse->min_width = MALI_C55_MIN_WIDTH;
+		fse->min_height = MALI_C55_MIN_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int mali_c55_rsz_set_sink_fmt(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+	struct v4l2_mbus_framefmt *sink_fmt;
+	unsigned int active_sink;
+	struct v4l2_rect *rect;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, format->pad, 0);
+
+	/*
+	 * Clamp to min/max and then reset crop and compose rectangles to the
+	 * newly applied size.
+	 */
+	sink_fmt->width = clamp_t(unsigned int, fmt->width,
+				  MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);
+	sink_fmt->height = clamp_t(unsigned int, fmt->height,
+				   MALI_C55_MIN_HEIGHT, MALI_C55_MAX_HEIGHT);
+
+	/*
+	 * Make sure the media bus code for the bypass pad is one of the
+	 * supported ISP input media bus codes. Default it to SRGGB otherwise.
+	 */
+	if (format->pad == MALI_C55_RSZ_SINK_BYPASS_PAD)
+		sink_fmt->code = mali_c55_isp_get_mbus_config_by_code(fmt->code) ?
+				 fmt->code : MEDIA_BUS_FMT_SRGGB20_1X20;
+
+	*fmt = *sink_fmt;
+
+	if (format->pad == MALI_C55_RSZ_SINK_PAD) {
+		rect = v4l2_subdev_state_get_crop(state, format->pad);
+		rect->left = 0;
+		rect->top = 0;
+		rect->width = fmt->width;
+		rect->height = fmt->height;
+
+		rect = v4l2_subdev_state_get_compose(state, format->pad);
+		rect->left = 0;
+		rect->top = 0;
+		rect->width = fmt->width;
+		rect->height = fmt->height;
+	}
+
+	/* If format->pad is routed to the source pad, propagate the format. */
+	active_sink = mali_c55_rsz_get_active_sink(state);
+	if (active_sink == format->pad) {
+		/* If the bypass route is used, downshift the code to 16bpp. */
+		if (active_sink == MALI_C55_RSZ_SINK_BYPASS_PAD)
+			fmt->code = mali_c55_rsz_shift_mbus_code(fmt->code);
+
+		*v4l2_subdev_state_get_format(state,
+					      MALI_C55_RSZ_SOURCE_PAD, 0) = *fmt;
+	}
+
+	return 0;
+}
+
+static int mali_c55_rsz_set_source_fmt(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	unsigned int active_sink;
+
+	active_sink = mali_c55_rsz_get_active_sink(state);
+	sink_fmt = v4l2_subdev_state_get_format(state, active_sink, 0);
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C55_RSZ_SOURCE_PAD);
+
+	if (active_sink == MALI_C55_RSZ_SINK_PAD) {
+		/*
+		 * Regular processing pipe: RGB121212 can be color-space
+		 * converted to YUV101010.
+		 */
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(rsz_non_bypass_src_fmts); i++) {
+			if (fmt->code == rsz_non_bypass_src_fmts[i])
+				break;
+		}
+
+		src_fmt->code = i == ARRAY_SIZE(rsz_non_bypass_src_fmts) ?
+				MEDIA_BUS_FMT_RGB121212_1X36 : fmt->code;
+	} else {
+		/*
+		 * Bypass pipe: the source format is the same as the bypass
+		 * sink pad downshifted to 16bpp.
+		 */
+		fmt->code = mali_c55_rsz_shift_mbus_code(sink_fmt->code);
+	}
+
+	*fmt = *src_fmt;
+
+	return 0;
+}
+
+static int mali_c55_rsz_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	/*
+	 * On sink pads fmt is either fixed for the 'regular' processing
+	 * pad or a RAW format or 20-bit wide RGB/YUV format for the FR bypass
+	 * pad.
+	 *
+	 * On source pad sizes are the result of crop+compose on the sink
+	 * pad sizes, while the format depends on the active route.
+	 */
+
+	if (format->pad == MALI_C55_RSZ_SINK_PAD ||
+	    format->pad == MALI_C55_RSZ_SINK_BYPASS_PAD)
+		return mali_c55_rsz_set_sink_fmt(sd, state, format);
+
+	return mali_c55_rsz_set_source_fmt(sd, state, format);
+}
+
+static int mali_c55_rsz_get_selection(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_selection *sel)
+{
+	if (sel->pad != MALI_C55_RSZ_SINK_PAD)
+		return -EINVAL;
+
+	if (sel->target != V4L2_SEL_TGT_CROP &&
+	    sel->target != V4L2_SEL_TGT_COMPOSE)
+		return -EINVAL;
+
+	sel->r = sel->target == V4L2_SEL_TGT_CROP
+	       ? *v4l2_subdev_state_get_crop(state, MALI_C55_RSZ_SINK_PAD)
+	       : *v4l2_subdev_state_get_compose(state, MALI_C55_RSZ_SINK_PAD);
+
+	return 0;
+}
+
+static int mali_c55_rsz_set_crop(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct mali_c55_resizer *rsz = sd_to_mali_c55_rsz(sd);
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *crop, *compose;
+
+	sink_fmt = v4l2_subdev_state_get_format(state, MALI_C55_RSZ_SINK_PAD);
+	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RSZ_SINK_PAD);
+	compose = v4l2_subdev_state_get_compose(state, MALI_C55_RSZ_SINK_PAD);
+
+	if (v4l2_subdev_is_streaming(sd)) {
+		/*
+		 * At runtime the compose rectangle and output size cannot be
+		 * changed so we need to clamp the crop rectangle such that the
+		 * compose rectangle can fit within it.
+		 */
+		crop->left = clamp_t(unsigned int, sel->r.left, 0,
+				     sink_fmt->width - compose->width);
+		crop->top = clamp_t(unsigned int, sel->r.top, 0,
+				     sink_fmt->height - compose->height);
+		crop->width = clamp_t(unsigned int, sel->r.width, compose->width,
+				      sink_fmt->width - crop->left);
+		crop->height = clamp_t(unsigned int, sel->r.height, compose->height,
+				       sink_fmt->height - crop->top);
+
+		mali_c55_rsz_program(rsz, state);
+	} else {
+		/*
+		 * If we're not streaming we can utilise the ISP's full range
+		 * and simply need to propagate the selected rectangle to the
+		 * compose target and source pad format.
+		 */
+		crop->left = clamp_t(unsigned int, sel->r.left, 0,
+				     sink_fmt->width);
+		crop->top = clamp_t(unsigned int, sel->r.top, 0,
+				    sink_fmt->height);
+		crop->width = clamp_t(unsigned int, sel->r.width,
+				      MALI_C55_MIN_WIDTH,
+				      sink_fmt->width - crop->left);
+		crop->height = clamp_t(unsigned int, sel->r.height,
+				       MALI_C55_MIN_HEIGHT,
+				       sink_fmt->height - crop->top);
+
+		*compose = *crop;
+
+		src_fmt = v4l2_subdev_state_get_format(state,
+						       MALI_C55_RSZ_SOURCE_PAD);
+		src_fmt->width = compose->width;
+		src_fmt->height = compose->height;
+	}
+
+	sel->r = *crop;
+	return 0;
+}
+
+static int mali_c55_rsz_set_compose(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_selection *sel)
+{
+	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_rect *compose, *crop;
+
+	/*
+	 * We cannot change the compose rectangle during streaming, as that
+	 * would require a change in the output buffer size.
+	 */
+	if (v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	compose = v4l2_subdev_state_get_compose(state, MALI_C55_RSZ_SINK_PAD);
+	crop = v4l2_subdev_state_get_crop(state, MALI_C55_RSZ_SINK_PAD);
+
+	compose->left = 0;
+	compose->top = 0;
+	compose->width = clamp_t(unsigned int, sel->r.width, crop->width / 8,
+				 crop->width);
+	compose->height = clamp_t(unsigned int, sel->r.height, crop->height / 8,
+				  crop->height);
+
+	sel->r = *compose;
+
+	/*
+	 * We need to be sure to propagate the compose rectangle size to the
+	 * source pad format.
+	 */
+	src_fmt = v4l2_subdev_state_get_format(state, MALI_C55_RSZ_SOURCE_PAD);
+	src_fmt->width = compose->width;
+	src_fmt->height = compose->height;
+
+	return 0;
+}
+
+static int mali_c55_rsz_set_selection(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_selection *sel)
+{
+	if (sel->pad != MALI_C55_RSZ_SINK_PAD)
+		return -EINVAL;
+
+	if (sel->target == V4L2_SEL_TGT_CROP)
+		return mali_c55_rsz_set_crop(sd, state, sel);
+
+	if (sel->target == V4L2_SEL_TGT_COMPOSE)
+		return mali_c55_rsz_set_compose(sd, state, sel);
+
+	return -EINVAL;
+}
+
+static int mali_c55_rsz_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return __mali_c55_rsz_set_routing(sd, state, routing);
+}
+
+static int mali_c55_rsz_enable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state, u32 pad,
+				       u64 streams_mask)
+{
+	struct mali_c55_resizer *rsz = sd_to_mali_c55_rsz(sd);
+	struct mali_c55 *mali_c55 = rsz->mali_c55;
+	unsigned int sink_pad;
+
+	sink_pad = mali_c55_rsz_get_active_sink(state);
+	if (sink_pad == MALI_C55_RSZ_SINK_BYPASS_PAD) {
+		/* Bypass FR pipe processing if the bypass route is active. */
+		mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
+					 MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK,
+					 MALI_C55_ISP_RAW_BYPASS_RAW_FR_BYPASS);
+		return 0;
+	}
+
+	/* Disable bypass and use regular processing. */
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
+				 MALI_C55_ISP_RAW_BYPASS_FR_BYPASS_MASK, 0);
+	mali_c55_rsz_program(rsz, state);
+
+	return 0;
+}
+
+static int mali_c55_rsz_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state, u32 pad,
+					u64 streams_mask)
+{
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mali_c55_resizer_pad_ops = {
+	.enum_mbus_code		= mali_c55_rsz_enum_mbus_code,
+	.enum_frame_size	= mali_c55_rsz_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= mali_c55_rsz_set_fmt,
+	.get_selection		= mali_c55_rsz_get_selection,
+	.set_selection		= mali_c55_rsz_set_selection,
+	.set_routing		= mali_c55_rsz_set_routing,
+	.enable_streams		= mali_c55_rsz_enable_streams,
+	.disable_streams	= mali_c55_rsz_disable_streams,
+};
+
+static const struct v4l2_subdev_ops mali_c55_resizer_ops = {
+	.pad	= &mali_c55_resizer_pad_ops,
+};
+
+static int mali_c55_rsz_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct mali_c55_resizer *rsz = sd_to_mali_c55_rsz(sd);
+	struct v4l2_subdev_route routes[2] = {
+		{
+			.sink_pad = MALI_C55_RSZ_SINK_PAD,
+			.source_pad = MALI_C55_RSZ_SOURCE_PAD,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		}, {
+			.sink_pad = MALI_C55_RSZ_SINK_BYPASS_PAD,
+			.source_pad = MALI_C55_RSZ_SOURCE_PAD,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = rsz->num_routes,
+		.routes = routes,
+	};
+
+	return __mali_c55_rsz_set_routing(sd, state, &routing);
+}
+
+static const struct v4l2_subdev_internal_ops mali_c55_resizer_internal_ops = {
+	.init_state = mali_c55_rsz_init_state,
+};
+
+static int mali_c55_register_resizer(struct mali_c55 *mali_c55,
+				     unsigned int index)
+{
+	struct mali_c55_resizer *rsz = &mali_c55->resizers[index];
+	struct v4l2_subdev *sd = &rsz->sd;
+	unsigned int num_pads;
+	int ret;
+
+	rsz->id = index;
+	v4l2_subdev_init(sd, &mali_c55_resizer_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_SCALER;
+	sd->internal_ops = &mali_c55_resizer_internal_ops;
+
+	rsz->pads[MALI_C55_RSZ_SINK_PAD].flags = MEDIA_PAD_FL_SINK;
+	rsz->pads[MALI_C55_RSZ_SOURCE_PAD].flags = MEDIA_PAD_FL_SOURCE;
+
+	if (rsz->id == MALI_C55_RSZ_FR) {
+		num_pads = MALI_C55_RSZ_NUM_PADS;
+		rsz->num_routes = 2;
+
+		rsz->pads[MALI_C55_RSZ_SINK_BYPASS_PAD].flags =
+			MEDIA_PAD_FL_SINK;
+
+		snprintf(sd->name, sizeof(sd->name), "%s resizer fr",
+			 MALI_C55_DRIVER_NAME);
+
+	} else {
+		num_pads = MALI_C55_RSZ_NUM_PADS - 1;
+		rsz->num_routes = 1;
+
+		snprintf(sd->name, sizeof(sd->name), "%s resizer ds",
+			 MALI_C55_DRIVER_NAME);
+	}
+
+	ret = media_entity_pads_init(&sd->entity, num_pads, rsz->pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_media_cleanup;
+
+	ret = v4l2_device_register_subdev(&mali_c55->v4l2_dev, sd);
+	if (ret)
+		goto err_subdev_cleanup;
+
+	rsz->cap_dev = &mali_c55->cap_devs[index];
+	rsz->mali_c55 = mali_c55;
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_media_cleanup:
+	media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static void mali_c55_unregister_resizer(struct mali_c55_resizer *rsz)
+{
+	if (!rsz->mali_c55)
+		return;
+
+	v4l2_device_unregister_subdev(&rsz->sd);
+	v4l2_subdev_cleanup(&rsz->sd);
+	media_entity_cleanup(&rsz->sd.entity);
+}
+
+int mali_c55_register_resizers(struct mali_c55 *mali_c55)
+{
+	int ret;
+
+	ret = mali_c55_register_resizer(mali_c55, MALI_C55_RSZ_FR);
+	if (ret)
+		return ret;
+
+	ret = mali_c55_register_resizer(mali_c55, MALI_C55_RSZ_DS);
+	if (ret)
+		goto err_unregister_fr;
+
+	return 0;
+
+err_unregister_fr:
+	mali_c55_unregister_resizer(&mali_c55->resizers[MALI_C55_RSZ_FR]);
+
+	return ret;
+}
+
+void mali_c55_unregister_resizers(struct mali_c55 *mali_c55)
+{
+	for (unsigned int i = 0; i < MALI_C55_NUM_RSZS; i++)
+		mali_c55_unregister_resizer(&mali_c55->resizers[i]);
+}
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
new file mode 100644
index 000000000000..0eb940a8b33f
--- /dev/null
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-tpg.c
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM Mali-C55 ISP Driver - Test pattern generator
+ *
+ * Copyright (C) 2024 Ideas on Board Oy
+ */
+
+#include <linux/minmax.h>
+#include <linux/pm_runtime.h>
+#include <linux/string.h>
+
+#include <media/media-entity.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-subdev.h>
+
+#include "mali-c55-common.h"
+#include "mali-c55-registers.h"
+
+#define MALI_C55_TPG_SRC_PAD			0
+#define MALI_C55_TPG_FIXED_HBLANK		0x20
+#define MALI_C55_TPG_DEFAULT_MIN_VBLANK		66
+#define MALI_C55_TPG_DEFAULT_DEF_VBLANK		626
+#define MALI_C55_TPG_MAX_VBLANK			0xffff
+#define MALI_C55_TPG_PIXEL_RATE			100000000
+
+static const char * const mali_c55_tpg_test_pattern_menu[] = {
+	"Flat field",
+	"Horizontal gradient",
+	"Vertical gradient",
+	"Vertical bars",
+	"Arbitrary rectangle",
+	"White frame on black field"
+};
+
+static const u32 mali_c55_tpg_mbus_codes[] = {
+	MEDIA_BUS_FMT_SRGGB20_1X20,
+	MEDIA_BUS_FMT_RGB202020_1X60,
+};
+
+static void mali_c55_tpg_update_vblank(struct mali_c55_tpg *tpg,
+				       struct v4l2_mbus_framefmt *format)
+{
+	unsigned int def_vblank;
+	unsigned int min_vblank;
+	unsigned int hts;
+	int tgt_fps;
+
+	hts = format->width + MALI_C55_TPG_FIXED_HBLANK;
+
+	/*
+	 * The ISP has minimum vertical blanking requirements that must be
+	 * adhered to by the TPG. The minimum is a function of the Iridix blocks
+	 * clocking requirements and the width of the image and horizontal
+	 * blanking, but if we assume the worst case iVariance and sVariance
+	 * values then it boils down to the below (plus one to the numerator to
+	 * ensure the answer is rounded up).
+	 */
+	min_vblank = 15 + (120501 / hts);
+
+	/*
+	 * We need to set a sensible default vblank for whatever format height
+	 * we happen to be given from set_fmt(). This function just targets
+	 * an even multiple of 15fps. If we can't get 15fps, let's target 5fps.
+	 * If we can't get 5fps we'll take whatever the minimum vblank gives us.
+	 */
+	tgt_fps = MALI_C55_TPG_PIXEL_RATE / hts / (format->height + min_vblank);
+
+	if (tgt_fps < 5)
+		def_vblank = min_vblank;
+	else
+		def_vblank = (MALI_C55_TPG_PIXEL_RATE / hts
+			   / max(rounddown(tgt_fps, 15), 5)) - format->height;
+
+	def_vblank = ALIGN_DOWN(def_vblank, 2);
+
+	__v4l2_ctrl_modify_range(tpg->ctrls.vblank, min_vblank,
+				 MALI_C55_TPG_MAX_VBLANK, 1, def_vblank);
+	__v4l2_ctrl_s_ctrl(tpg->ctrls.vblank, def_vblank);
+}
+
+static int mali_c55_tpg_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct mali_c55_tpg *tpg = container_of(ctrl->handler,
+						struct mali_c55_tpg,
+						ctrls.handler);
+	struct mali_c55 *mali_c55 = container_of(tpg, struct mali_c55, tpg);
+	int ret = 0;
+
+	if (!pm_runtime_get_if_in_use(mali_c55->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		mali_c55_ctx_write(mali_c55,
+				   MALI_C55_REG_TEST_GEN_CH0_PATTERN_TYPE,
+				   ctrl->val);
+		break;
+	case V4L2_CID_VBLANK:
+		mali_c55_update_bits(mali_c55, MALI_C55_REG_BLANKING,
+				     MALI_C55_REG_VBLANK_MASK,
+				     MALI_C55_VBLANK(ctrl->val));
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put_autosuspend(mali_c55->dev);
+	pm_runtime_mark_last_busy(mali_c55->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops mali_c55_tpg_ctrl_ops = {
+	.s_ctrl = &mali_c55_tpg_s_ctrl,
+};
+
+static void mali_c55_tpg_configure(struct mali_c55_tpg *tpg,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	u32 test_pattern_format;
+
+	/*
+	 * hblank needs setting, but is a read-only control and thus won't be
+	 * called during __v4l2_ctrl_handler_setup(). Do it here instead.
+	 */
+	mali_c55_update_bits(tpg->mali_c55, MALI_C55_REG_BLANKING,
+			     MALI_C55_REG_HBLANK_MASK,
+			     MALI_C55_TPG_FIXED_HBLANK);
+	mali_c55_update_bits(tpg->mali_c55, MALI_C55_REG_GEN_VIDEO,
+			     MALI_C55_REG_GEN_VIDEO_MULTI_MASK,
+			     MALI_C55_REG_GEN_VIDEO_MULTI_MASK);
+
+	fmt = v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD);
+
+	test_pattern_format = fmt->code == MEDIA_BUS_FMT_RGB202020_1X60 ?
+			      0x01 : 0x0;
+
+	mali_c55_ctx_update_bits(tpg->mali_c55, MALI_C55_REG_TPG_CH0,
+				 MALI_C55_TEST_PATTERN_RGB_MASK,
+				 MALI_C55_TEST_PATTERN_RGB(test_pattern_format));
+}
+
+static int mali_c55_tpg_enum_mbus_code(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state,
+				       struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index >= ARRAY_SIZE(mali_c55_tpg_mbus_codes))
+		return -EINVAL;
+
+	code->code = mali_c55_tpg_mbus_codes[code->index];
+
+	return 0;
+}
+
+static int mali_c55_tpg_enum_frame_size(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					struct v4l2_subdev_frame_size_enum *fse)
+{
+	unsigned int i;
+
+	if (fse->index > 0)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c55_tpg_mbus_codes); i++) {
+		if (fse->code == mali_c55_tpg_mbus_codes[i])
+			break;
+	}
+
+	if (i == ARRAY_SIZE(mali_c55_tpg_mbus_codes))
+		return -EINVAL;
+
+	fse->min_width = MALI_C55_MIN_WIDTH;
+	fse->max_width = MALI_C55_MAX_WIDTH;
+	fse->min_height = MALI_C55_MIN_HEIGHT;
+	fse->max_height = MALI_C55_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int mali_c55_tpg_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct mali_c55_tpg *tpg = container_of(sd, struct mali_c55_tpg, sd);
+	struct v4l2_mbus_framefmt *fmt;
+	unsigned int i;
+
+	fmt = v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD);
+	fmt->code = format->format.code;
+
+	for (i = 0; i < ARRAY_SIZE(mali_c55_tpg_mbus_codes); i++) {
+		if (fmt->code == mali_c55_tpg_mbus_codes[i])
+			break;
+	}
+
+	if (i == ARRAY_SIZE(mali_c55_tpg_mbus_codes))
+		fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
+
+	/*
+	 * The TPG says that the test frame timing generation logic expects a
+	 * minimum framesize of 4x4 pixels, but given the rest of the ISP can't
+	 * handle anything smaller than 128x128 it seems pointless to allow a
+	 * smaller frame.
+	 */
+	fmt->width = clamp(fmt->width, MALI_C55_MIN_WIDTH, MALI_C55_MAX_WIDTH);
+	fmt->height = clamp(fmt->height, MALI_C55_MIN_HEIGHT,
+			    MALI_C55_MAX_HEIGHT);
+
+	format->format = *fmt;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	mali_c55_tpg_update_vblank(tpg, fmt);
+
+	return 0;
+}
+
+static int mali_c55_tpg_enable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state, u32 pad,
+				       u64 streams_mask)
+{
+	struct mali_c55_tpg *tpg = container_of(sd, struct mali_c55_tpg, sd);
+	struct mali_c55 *mali_c55 = container_of(tpg, struct mali_c55, tpg);
+
+	/*
+	 * We only have a source pad and a single stream, and v4l2-core already
+	 * validated both so we don't need to do that. One might reasonably
+	 * expect the framesize to be set here given it's configurable in
+	 * .set_fmt(), but it's done in the ISP subdevice's .enable_streams()
+	 * instead, as the same register is also used to indicate the size of
+	 * the data coming from the sensor.
+	 */
+	mali_c55_tpg_configure(tpg, state);
+	__v4l2_ctrl_handler_setup(sd->ctrl_handler);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_TPG_CH0,
+				 MALI_C55_TEST_PATTERN_ON_OFF,
+				 MALI_C55_TEST_PATTERN_ON_OFF);
+	mali_c55_update_bits(mali_c55, MALI_C55_REG_GEN_VIDEO,
+			     MALI_C55_REG_GEN_VIDEO_ON_MASK,
+			     MALI_C55_REG_GEN_VIDEO_ON_MASK);
+
+	return 0;
+}
+
+static int mali_c55_tpg_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state, u32 pad,
+					u64 streams_mask)
+{
+	struct mali_c55_tpg *tpg = container_of(sd, struct mali_c55_tpg, sd);
+	struct mali_c55 *mali_c55 = container_of(tpg, struct mali_c55, tpg);
+
+	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_TPG_CH0,
+				 MALI_C55_TEST_PATTERN_ON_OFF, 0x00);
+	mali_c55_update_bits(mali_c55, MALI_C55_REG_GEN_VIDEO,
+			     MALI_C55_REG_GEN_VIDEO_ON_MASK, 0x00);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops mali_c55_tpg_pad_ops = {
+	.enum_mbus_code		= mali_c55_tpg_enum_mbus_code,
+	.enum_frame_size	= mali_c55_tpg_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= mali_c55_tpg_set_fmt,
+	.enable_streams		= mali_c55_tpg_enable_streams,
+	.disable_streams	= mali_c55_tpg_disable_streams,
+};
+
+static const struct v4l2_subdev_core_ops mali_c55_isp_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops mali_c55_tpg_ops = {
+	.core	= &mali_c55_isp_core_ops,
+	.pad	= &mali_c55_tpg_pad_ops,
+};
+
+static int mali_c55_tpg_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt =
+		v4l2_subdev_state_get_format(state, MALI_C55_TPG_SRC_PAD);
+
+	fmt->width = MALI_C55_DEFAULT_WIDTH;
+	fmt->height = MALI_C55_DEFAULT_HEIGHT;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->code = MEDIA_BUS_FMT_SRGGB20_1X20;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(false,
+							  fmt->colorspace,
+							  fmt->ycbcr_enc);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops mali_c55_tpg_internal_ops = {
+	.init_state = mali_c55_tpg_init_state,
+};
+
+static int mali_c55_tpg_init_controls(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_tpg_ctrls *ctrls = &mali_c55->tpg.ctrls;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(&ctrls->handler, 4);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_new_std_menu_items(&ctrls->handler,
+		&mali_c55_tpg_ctrl_ops, V4L2_CID_TEST_PATTERN,
+		ARRAY_SIZE(mali_c55_tpg_test_pattern_menu) - 1,
+		0, 3, mali_c55_tpg_test_pattern_menu);
+
+	/*
+	 * We fix hblank at the minimum allowed value and control framerate
+	 * solely through the vblank control.
+	 */
+	hblank = v4l2_ctrl_new_std(&ctrls->handler, &mali_c55_tpg_ctrl_ops,
+				   V4L2_CID_HBLANK, MALI_C55_TPG_FIXED_HBLANK,
+				   MALI_C55_TPG_FIXED_HBLANK, 1,
+				   MALI_C55_TPG_FIXED_HBLANK);
+	if (hblank)
+		hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ctrls->vblank = v4l2_ctrl_new_std(&ctrls->handler,
+					  &mali_c55_tpg_ctrl_ops,
+					  V4L2_CID_VBLANK,
+					  MALI_C55_TPG_DEFAULT_MIN_VBLANK,
+					  MALI_C55_TPG_MAX_VBLANK, 1,
+					  MALI_C55_TPG_DEFAULT_DEF_VBLANK);
+
+	pixel_rate = v4l2_ctrl_new_std(&ctrls->handler, &mali_c55_tpg_ctrl_ops,
+				       V4L2_CID_PIXEL_RATE,
+				       MALI_C55_TPG_PIXEL_RATE,
+				       MALI_C55_TPG_PIXEL_RATE, 1,
+				       MALI_C55_TPG_PIXEL_RATE);
+	if (pixel_rate)
+		pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	if (ctrls->handler.error) {
+		dev_err(mali_c55->dev, "Error during v4l2 controls init\n");
+		v4l2_ctrl_handler_free(&ctrls->handler);
+		return ctrls->handler.error;
+	}
+
+	mali_c55->tpg.sd.ctrl_handler = &ctrls->handler;
+	mali_c55->tpg.sd.state_lock = ctrls->handler.lock;
+
+	return 0;
+}
+
+int mali_c55_register_tpg(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_tpg *tpg = &mali_c55->tpg;
+	struct v4l2_subdev *sd = &tpg->sd;
+	struct media_pad *pad = &tpg->pad;
+	int ret;
+
+	v4l2_subdev_init(sd, &mali_c55_tpg_ops);
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sd->internal_ops = &mali_c55_tpg_internal_ops;
+	strscpy(sd->name, MALI_C55_DRIVER_NAME " tpg", sizeof(sd->name));
+
+	pad->flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, 1, pad);
+	if (ret) {
+		dev_err(mali_c55->dev,
+			"Failed to initialize media entity pads\n");
+		return ret;
+	}
+
+	ret = mali_c55_tpg_init_controls(mali_c55);
+	if (ret) {
+		dev_err(mali_c55->dev,
+			"Error initialising controls\n");
+		goto err_cleanup_media_entity;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_free_ctrl_handler;
+
+	ret = v4l2_device_register_subdev(&mali_c55->v4l2_dev, sd);
+	if (ret) {
+		dev_err(mali_c55->dev, "Failed to register tpg subdev\n");
+		goto err_cleanup_subdev;
+	}
+
+	/*
+	 * By default the colour settings lead to a very dim image that is
+	 * nearly indistinguishable from black on some monitor settings. Ramp
+	 * them up a bit so the image is brighter.
+	 */
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TPG_R_BACKGROUND,
+			   MALI_C55_TPG_BACKGROUND_MAX);
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TPG_G_BACKGROUND,
+			   MALI_C55_TPG_BACKGROUND_MAX);
+	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TPG_B_BACKGROUND,
+			   MALI_C55_TPG_BACKGROUND_MAX);
+
+	tpg->mali_c55 = mali_c55;
+
+	return 0;
+
+err_cleanup_subdev:
+	v4l2_subdev_cleanup(sd);
+err_free_ctrl_handler:
+	v4l2_ctrl_handler_free(&tpg->ctrls.handler);
+err_cleanup_media_entity:
+	media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+void mali_c55_unregister_tpg(struct mali_c55 *mali_c55)
+{
+	struct mali_c55_tpg *tpg = &mali_c55->tpg;
+
+	if (!tpg->mali_c55)
+		return;
+
+	v4l2_device_unregister_subdev(&tpg->sd);
+	v4l2_ctrl_handler_free(&tpg->ctrls.handler);
+	v4l2_subdev_cleanup(&tpg->sd);
+	media_entity_cleanup(&tpg->sd.entity);
+}
-- 
2.34.1


