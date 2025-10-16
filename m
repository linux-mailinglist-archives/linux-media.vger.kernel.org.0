Return-Path: <linux-media+bounces-44661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0767BBE16AE
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 06:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5CF3635110C
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF82218ADD;
	Thu, 16 Oct 2025 04:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="Kw9jn1AN"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1800.securemx.jp [210.130.202.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE2DDD2;
	Thu, 16 Oct 2025 04:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760588311; cv=none; b=V4p46U1O6zf6zOE797d9mCEyoCOJkw7TH7xJY4cB13vSRLToiHiNPXEGPOpgg4A1F2Hc35mUDKYPGUYeWWpzjyP6lqlY+CxuooOSp9Kwae6C9QKE5okY8UgyjOgIrc0Nv1Atl8WwrC5kMTmzrh3maWzItMTIIzcqhGn077rejyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760588311; c=relaxed/simple;
	bh=1f6Rfdofsh1LgifScb9IY9V9Rr7wxRJ0nM+HT5gK7P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0Tg8c24AFnediZgG/A2nQ5euX9kiz7ZzkeIVIADRq/9Zv9ZeQBQdPmSGjqe4jaGOspJqzaQ9AAZwySis09u7YSGkwgPx+junAwzvrTe7hE8VfOMJs0IyQj7arvUhL3CmBxda4TmZQ7+N6O7aZYtdgRYC1OkiqF1W0L54y6TrrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=Kw9jn1AN; arc=none smtp.client-ip=210.130.202.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1800) id 59G2UmKv4023609; Thu, 16 Oct 2025 11:30:48 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:Date:
	Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760581818;x=1761791418;bh=1f6Rfdofsh1LgifScb9IY9V9Rr7wxRJ0nM+HT5gK7P0=;b=Kw9
	jn1ANnfwRDp53/0xZZXK+JZh3O3dt38wF/VZudl9aGlarqW2SOIEjNn4xoSkBUW/ROzsDGXJrR4BN
	dMX+7vyf3kFwTrbeuyh+FAAv+MGpUn88U+6tz42bZpm/Xs4TP1/mzM2p9Cn2BdMm7wbUGBxvwd13l
	XNCym2wDYJW404CjfHqlvjG1gOERNLnWPhPRW5XtBxBwf1/nQMbLwI1GgbBs3jSxVeFQFdPzjpHG3
	Utskl/WSHqqxpxk1lxux7IY4IVWdNfh/iUkehlz+YeOPkKhe0MIj08DJyHz+5NvCJLg/P9VFF7mh+
	+bIo/IIdJzVilyVfGYIdpqrIgf+fQXQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 59G2UHVH3796030; Thu, 16 Oct 2025 11:30:17 +0900
X-Iguazu-Qid: 2yAbDoX6m4uSGDnEQv
X-Iguazu-QSIG: v=2; s=0; t=1760581817; q=2yAbDoX6m4uSGDnEQv; m=ruE/OhKbPsM9hyTTepsKBK/C9WhiqWkwM80G/Qjns1k=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cnBkd269pz1xnc; Thu, 16 Oct 2025 11:30:17 +0900 (JST)
X-SA-MID: 53072905
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 16 Oct 2025 11:24:41 +0900
Subject: [PATCH v13 4/7] media: platform: visconti: Add Toshiba Visconti
 CSI-2 Receiver driver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TSB-HOP2: ON
Message-Id: <20251016-visconti-viif-v13-4-ceca656b9194@toshiba.co.jp>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
In-Reply-To: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Add support to MIPI CSI-2 Receiver on Toshiba Visconti ARM SoCs.
This driver is used with Visconti Video Input Interface driver.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v12:
- Separate CSI2RX driver and made it independent driver
- viif_csi2rx subdevice driver (in v11 patch) was removed.
- dictionary order at Kconfig and Makefile

Changelog v13:
- wrap one line at 80 characters
- change banner comment style
- update comment style; spacing at the start and end, capitalize first letter
- add support for clock and reset framework
- add debugfs to pass debug and status information
- add entries to MAINTAINERS file
- Kconfig: add a blank line just after License Identifier.
- update references to header files
- remove redundant inline qualifier
- shorten function/variable names: visconti_csi2rx -> viscsi2
- simplify dphy_write and dphy read operations
- remove osc_freq_target from struct csi2rx_dphy_hs_info, which is always the same value.
- add comment about MASK register's behavior (reversed polarity)
- use v4l2_get_link_freq() instead of get_pixelclock()
- set driver name according to module name: visconti_csi2rx_dev -> visconti-csi2rx
- check error before setting priv->irq in probe()
- check error at fmt_for_mbus_code()
- add callback for ioctl(VIDIOC_ENUM_FRAMESIZES)
- improve viscsi2_parse_dt() by assuming bus_type is CSI2_DPHY
- use dev_err_ratelimited() for irq handler
- bugfix on fmt_for_mbus_code(): in case unsupported mbus_code is given
- add goto based error handling sequence to viscsi2_parse_dt()
- specify default value of colorspace, ycbcr_enc, quantization and xfer_func of sink/src_fmt
- specify sensor at enable_streams() using previously set ID, instead of checking remote pad every time
- remove U suffix on numeric value
- use unsigned int variable for loop index
- remove redundant casting
- use GENMASK instead of literal
- remove unused constants
- remove unused visconti_csi2rx_video_ops
---
 MAINTAINERS                                        |   1 +
 drivers/media/platform/Kconfig                     |   1 +
 drivers/media/platform/Makefile                    |   1 +
 drivers/media/platform/toshiba/Kconfig             |   6 +
 drivers/media/platform/toshiba/Makefile            |   3 +
 drivers/media/platform/toshiba/visconti/Kconfig    |  17 +
 drivers/media/platform/toshiba/visconti/Makefile   |   8 +
 .../media/platform/toshiba/visconti/csi2rx_drv.c   | 954 +++++++++++++++++++++
 8 files changed, 991 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c17c7ddba5af..ce973791b367 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25986,6 +25986,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
 F:	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
+F:	drivers/media/platform/toshiba/visconti/
 
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 9287faafdce5..d5265aa16c88 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -87,6 +87,7 @@ source "drivers/media/platform/st/Kconfig"
 source "drivers/media/platform/sunxi/Kconfig"
 source "drivers/media/platform/synopsys/Kconfig"
 source "drivers/media/platform/ti/Kconfig"
+source "drivers/media/platform/toshiba/Kconfig"
 source "drivers/media/platform/verisilicon/Kconfig"
 source "drivers/media/platform/via/Kconfig"
 source "drivers/media/platform/xilinx/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 6fd7db0541c7..09e67ecb9559 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -30,6 +30,7 @@ obj-y += st/
 obj-y += sunxi/
 obj-y += synopsys/
 obj-y += ti/
+obj-y += toshiba/
 obj-y += verisilicon/
 obj-y += via/
 obj-y += xilinx/
diff --git a/drivers/media/platform/toshiba/Kconfig b/drivers/media/platform/toshiba/Kconfig
new file mode 100644
index 000000000000..f02983f4fc97
--- /dev/null
+++ b/drivers/media/platform/toshiba/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+comment "Toshiba media platform drivers"
+
+source "drivers/media/platform/toshiba/visconti/Kconfig"
+
diff --git a/drivers/media/platform/toshiba/Makefile b/drivers/media/platform/toshiba/Makefile
new file mode 100644
index 000000000000..dd89a9a35704
--- /dev/null
+++ b/drivers/media/platform/toshiba/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-y += visconti/
diff --git a/drivers/media/platform/toshiba/visconti/Kconfig b/drivers/media/platform/toshiba/visconti/Kconfig
new file mode 100644
index 000000000000..aa0b63f9f008
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_VISCONTI_CSI2RX
+	tristate "Visconti MIPI CSI-2 Receiver driver"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_VISCONTI || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	help
+	  Support for Toshiba Visconti MIPI CSI-2 receiver,
+	  which is used with Visconti Camera Interface driver.
+
+	  This driver yields 1 subdevice node for a hardware instance.
+	  To compile this driver as a module, choose M here: the
+	  module will be called visconti-csi2rx.
diff --git a/drivers/media/platform/toshiba/visconti/Makefile b/drivers/media/platform/toshiba/visconti/Makefile
new file mode 100644
index 000000000000..62a029376134
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the Visconti video input device driver
+#
+
+visconti-csi2rx-objs = csi2rx_drv.o
+
+obj-$(CONFIG_VIDEO_VISCONTI_CSI2RX) += visconti-csi2rx.o
diff --git a/drivers/media/platform/toshiba/visconti/csi2rx_drv.c b/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
new file mode 100644
index 000000000000..53d112432a86
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
@@ -0,0 +1,954 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2025 TOSHIBA CORPORATION
+ * (C) Copyright 2025 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+#include <linux/seq_file.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+/* CSI2HOST register space */
+#define REG_CSI2RX_NLANES	 0x4
+#define REG_CSI2RX_RESETN	 0x8
+#define REG_CSI2RX_INT_ST_MAIN	 0xc
+#define REG_CSI2RX_DATA_IDS_1	 0x10
+#define REG_CSI2RX_DATA_IDS_2	 0x14
+#define REG_CSI2RX_PHY_SHUTDOWNZ 0x40
+#define REG_CSI2RX_PHY_RSTZ	 0x44
+
+/* Access to dphy external registers */
+#define REG_CSI2RX_PHY_TESTCTRL0 0x50
+#define BIT_TESTCTRL0_CLK_0	 0
+#define BIT_TESTCTRL0_CLK_1	 BIT(1)
+
+#define REG_CSI2RX_PHY_TESTCTRL1 0x54
+#define BIT_TESTCTRL1_ADDR	 BIT(16)
+#define MASK_TESTCTRL1_DOUT	 GENMASK(15, 8)
+
+#define REG_CSI2RX_INT_ST_PHY_FATAL  0xe0
+#define REG_CSI2RX_INT_MSK_PHY_FATAL 0xe4
+#define MASK_PHY_FATAL_ALL	     0x0000000f
+
+#define REG_CSI2RX_INT_ST_PKT_FATAL  0xf0
+#define REG_CSI2RX_INT_MSK_PKT_FATAL 0xf4
+#define MASK_PKT_FATAL_ALL	     0x0001000f
+
+#define REG_CSI2RX_INT_ST_FRAME_FATAL  0x100
+#define REG_CSI2RX_INT_MSK_FRAME_FATAL 0x104
+#define MASK_FRAME_FATAL_ALL	       0x000f0f0f
+
+#define REG_CSI2RX_INT_ST_PHY  0x110
+#define REG_CSI2RX_INT_MSK_PHY 0x114
+#define MASK_PHY_ERROR_ALL     0x000f000f
+
+#define REG_CSI2RX_INT_ST_PKT  0x120
+#define REG_CSI2RX_INT_MSK_PKT 0x124
+#define MASK_PKT_ERROR_ALL     0x000f000f
+
+#define REG_CSI2RX_INT_ST_LINE	0x130
+#define REG_CSI2RX_INT_MSK_LINE 0x134
+#define MASK_LINE_ERROR_ALL	0x00ff00ff
+
+/* DPHY register space */
+enum dphy_testcode {
+	DIG_TESTCODE_EXT = 0,
+	DIG_SYS_0 = 0x001,
+	DIG_SYS_1 = 0x002,
+	DIG_SYS_7 = 0x008,
+	DIG_RX_STARTUP_OVR_2 = 0x0e2,
+	DIG_RX_STARTUP_OVR_3 = 0x0e3,
+	DIG_RX_STARTUP_OVR_4 = 0x0e4,
+	DIG_RX_STARTUP_OVR_5 = 0x0e5,
+	DIG_CB_2 = 0x1ac,
+	DIG_TERM_CAL_0 = 0x220,
+	DIG_TERM_CAL_1 = 0x221,
+	DIG_TERM_CAL_2 = 0x222,
+	DIG_CLKLANE_LANE_6 = 0x307,
+	DIG_CLKLANE_OFFSET_CAL_0 = 0x39d,
+	DIG_LANE0_OFFSET_CAL_0 = 0x59f,
+	DIG_LANE0_DDL_0 = 0x5e0,
+	DIG_LANE1_OFFSET_CAL_0 = 0x79f,
+	DIG_LANE1_DDL_0 = 0x7e0,
+	DIG_LANE2_OFFSET_CAL_0 = 0x99f,
+	DIG_LANE2_DDL_0 = 0x9e0,
+	DIG_LANE3_OFFSET_CAL_0 = 0xb9f,
+	DIG_LANE3_DDL_0 = 0xbe0,
+};
+
+#define SYS_0_HSFREQRANGE_OVR  BIT(5)
+#define SYS_7_RESERVED	       FIELD_PREP(0x1f, 0x0c)
+#define SYS_7_DESKEW_POL       BIT(5)
+#define STARTUP_OVR_4_CNTVAL   FIELD_PREP(0x70, 0x01)
+#define STARTUP_OVR_4_DDL_EN   BIT(0)
+#define STARTUP_OVR_5_BYPASS   BIT(0)
+#define CB_2_LPRX_BIAS	       BIT(6)
+#define CB_2_RESERVED	       FIELD_PREP(0x3f, 0x0b)
+#define CLKLANE_RXHS_PULL_LONG BIT(7)
+
+/* bit mask for calibration result registers */
+#define MASK_TERM_CAL_ERR  0
+#define MASK_TERM_CAL_DONE BIT(7)
+#define MASK_CLK_CAL_ERR   BIT(4)
+#define MASK_CLK_CAL_DONE  BIT(0)
+#define MASK_CAL_ERR	   BIT(2)
+#define MASK_CAL_DONE	   BIT(1)
+#define MASK_DDL_ERR	   BIT(1)
+#define MASK_DDL_DONE	   BIT(2)
+
+#define VISCSI2_ERROR_MONITORS_NUM 8
+
+/**
+ * struct viscsi2_line_err_target
+ *
+ * Virtual Channel and Data Type pair for CSI2RX line error monitor
+ *
+ * When 0 is set to dt, line error detection is disabled.
+ *
+ * @vc: Virtual Channel to monitor; Range 0..3
+ * @dt: Data Type to monitor; Range 0, 0x10..0x3f
+ */
+struct viscsi2_line_err_target {
+	u32 vc[VISCSI2_ERROR_MONITORS_NUM];
+	u32 dt[VISCSI2_ERROR_MONITORS_NUM];
+};
+
+#define CSI2RX_MIN_DATA_RATE 80
+#define CSI2RX_MAX_DATA_RATE 1500
+
+#define VISCSI2_PAD_SINK 0
+#define VISCSI2_PAD_SRC	 1
+#define VISCSI2_PAD_NUM	 2
+
+#define VISCSI2_DEF_WIDTH  1920
+#define VISCSI2_DEF_HEIGHT 1080
+#define VISCSI2_MIN_WIDTH  640
+#define VISCSI2_MAX_WIDTH  3840
+#define VISCSI2_MIN_HEIGHT 480
+#define VISCSI2_MAX_HEIGHT 2160
+
+struct viscsi2 {
+	struct device *dev;
+	void __iomem *base;
+
+	struct v4l2_subdev subdev;
+	struct media_pad pads[VISCSI2_PAD_NUM];
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev *remote;
+	unsigned int remote_pad;
+
+	unsigned int lanes;
+
+	unsigned int irq;
+	struct clk *clk_apb;
+	struct clk *clk_cfg;
+	struct reset_control *rst;
+
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debugfs_dir;
+	u32 debug_phy_fatal;
+	u32 debug_pkt_fatal;
+	u32 debug_frame_fatal;
+	u32 debug_phy;
+	u32 debug_pkt;
+	u32 debug_line;
+#endif
+	bool running;
+};
+
+static inline struct viscsi2 *notifier_to_csi2(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct viscsi2, notifier);
+}
+
+static inline struct viscsi2 *sd_to_csi2(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct viscsi2, subdev);
+}
+
+static inline void viscsi2_write(struct viscsi2 *priv, u32 regid, u32 val)
+{
+	writel(val, priv->base + regid);
+}
+
+static inline u32 viscsi2_read(struct viscsi2 *priv, u32 regid)
+{
+	return readl(priv->base + regid);
+}
+
+static void viscsi2_set_dphy_param(struct viscsi2 *priv, u32 val)
+{
+	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL1, val);
+	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, BIT_TESTCTRL0_CLK_1);
+	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, BIT_TESTCTRL0_CLK_0);
+}
+
+static void viscsi2_set_dphy_addr(struct viscsi2 *priv, u32 test_mode)
+{
+	/* Select testcode Ex space with top 4bits of test_mode */
+	viscsi2_set_dphy_param(priv, BIT_TESTCTRL1_ADDR | DIG_TESTCODE_EXT);
+	viscsi2_set_dphy_param(priv, FIELD_GET(0xf00, test_mode));
+	viscsi2_set_dphy_param(priv,
+			       BIT_TESTCTRL1_ADDR | FIELD_GET(0xff, test_mode));
+}
+
+static void dphy_write(struct viscsi2 *priv, u32 test_mode, u8 test_in)
+{
+	viscsi2_set_dphy_addr(priv, test_mode);
+	viscsi2_set_dphy_param(priv, test_in);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static u8 dphy_read(struct viscsi2 *priv, u32 test_mode)
+{
+	u32 read_data;
+
+	viscsi2_set_dphy_addr(priv, test_mode);
+	read_data = viscsi2_read(priv, REG_CSI2RX_PHY_TESTCTRL1);
+	return FIELD_GET(MASK_TESTCTRL1_DOUT, read_data);
+}
+
+static int viscsi2_read_calibration_status(struct viscsi2 *priv, u32 test_mode,
+					   u32 mask_err, u32 mask_done)
+{
+	u32 read_data = (u32)dphy_read(priv, test_mode);
+
+	if (!(read_data & mask_done))
+		return -EAGAIN;
+
+	if (read_data & mask_err)
+		return -EIO;
+
+	return 0;
+}
+
+struct viscsi2_calibration_status_def {
+	const char *name;
+	u32 test_mode;
+	u32 mask_err;
+	u32 mask_done;
+};
+
+static const struct viscsi2_calibration_status_def viscsi2_caldef[] = {
+	{ "term_cal_with_rext", DIG_TERM_CAL_1, MASK_TERM_CAL_ERR,
+	  MASK_TERM_CAL_DONE },
+	{ "clock_lane_offset_cal", DIG_CLKLANE_OFFSET_CAL_0, MASK_CLK_CAL_ERR,
+	  MASK_CLK_CAL_DONE },
+	{ "data_lane0_offset_cal", DIG_LANE0_OFFSET_CAL_0, MASK_CAL_ERR,
+	  MASK_CAL_DONE },
+	{ "data_lane1_offset_cal", DIG_LANE1_OFFSET_CAL_0, MASK_CAL_ERR,
+	  MASK_CAL_DONE },
+	{ "data_lane2_offset_cal", DIG_LANE2_OFFSET_CAL_0, MASK_CAL_ERR,
+	  MASK_CAL_DONE },
+	{ "data_lane3_offset_cal", DIG_LANE3_OFFSET_CAL_0, MASK_CAL_ERR,
+	  MASK_CAL_DONE },
+	{ "data_lane0_ddl_tuning_cal", DIG_LANE0_DDL_0, MASK_DDL_ERR,
+	  MASK_DDL_DONE },
+	{ "data_lane1_ddl_tuning_cal", DIG_LANE1_DDL_0, MASK_DDL_ERR,
+	  MASK_DDL_DONE },
+	{ "data_lane2_ddl_tuning_cal", DIG_LANE2_DDL_0, MASK_DDL_ERR,
+	  MASK_DDL_DONE },
+	{ "data_lane3_ddl_tuning_cal", DIG_LANE3_DDL_0, MASK_DDL_ERR,
+	  MASK_DDL_DONE },
+};
+
+static int viscsi2_debug_calibration_status_show(struct seq_file *m, void *p)
+{
+	struct viscsi2 *priv = m->private;
+	unsigned int i;
+
+	if (!priv->running)
+		return 0;
+
+	for (i = 0; i < ARRAY_SIZE(viscsi2_caldef); i++) {
+		const struct viscsi2_calibration_status_def *cd =
+			&viscsi2_caldef[i];
+
+		seq_printf(m, "%s: %d\n", cd->name,
+			   viscsi2_read_calibration_status(priv, cd->test_mode,
+							   cd->mask_err,
+							   cd->mask_done));
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(viscsi2_debug_calibration_status);
+
+static int viscsi2_debug_err_status_show(struct seq_file *m, void *p)
+{
+	struct viscsi2 *priv = m->private;
+
+	seq_printf(m, "err_phy_fatal: 0x%08x\n", priv->debug_phy_fatal);
+	seq_printf(m, "err_pkt_fatal: 0x%08x\n", priv->debug_pkt_fatal);
+	seq_printf(m, "err_frame_fatal: 0x%08x\n", priv->debug_frame_fatal);
+	seq_printf(m, "err_phy: 0x%08x\n", priv->debug_phy);
+	seq_printf(m, "err_pkt: 0x%08x\n", priv->debug_pkt);
+	seq_printf(m, "err_line: 0x%08x\n", priv->debug_line);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(viscsi2_debug_err_status);
+
+static void viscsi2_debug_init(struct viscsi2 *csi2)
+{
+	csi2->debugfs_dir = debugfs_create_dir(dev_name(csi2->dev), NULL);
+	if (IS_ERR(csi2->debugfs_dir))
+		return;
+	debugfs_create_file("calibration_status", 0444, csi2->debugfs_dir, csi2,
+			    &viscsi2_debug_calibration_status_fops);
+	debugfs_create_file("err_status", 0444, csi2->debugfs_dir, csi2,
+			    &viscsi2_debug_err_status_fops);
+}
+
+static void viscsi2_debug_cleanup(struct viscsi2 *csi2)
+{
+	debugfs_remove_recursive(csi2->debugfs_dir);
+}
+#endif
+
+#define OSC_FREQ_TARGET 0x1cc
+
+struct viscsi2_dphy_hs_info {
+	u32 rate;
+	u32 hsfreqrange;
+};
+
+static const struct viscsi2_dphy_hs_info dphy_hs_info[] = {
+	{ 80, 0x0 },   { 85, 0x10 },   { 95, 0x20 },   { 105, 0x30 },
+	{ 115, 0x1 },  { 125, 0x11 },  { 135, 0x21 },  { 145, 0x31 },
+	{ 155, 0x2 },  { 165, 0x12 },  { 175, 0x22 },  { 185, 0x32 },
+	{ 198, 0x3 },  { 213, 0x13 },  { 228, 0x23 },  { 243, 0x33 },
+	{ 263, 0x4 },  { 288, 0x14 },  { 313, 0x25 },  { 338, 0x35 },
+	{ 375, 0x5 },  { 425, 0x16 },  { 475, 0x26 },  { 525, 0x37 },
+	{ 575, 0x7 },  { 625, 0x18 },  { 675, 0x28 },  { 725, 0x39 },
+	{ 775, 0x9 },  { 825, 0x19 },  { 875, 0x29 },  { 925, 0x3a },
+	{ 975, 0xa },  { 1025, 0x1a }, { 1075, 0x2a }, { 1125, 0x3b },
+	{ 1175, 0xb }, { 1225, 0x1b }, { 1275, 0x2b }, { 1325, 0x3c },
+	{ 1375, 0xc }, { 1425, 0x1c }, { 1475, 0x2c }
+};
+
+static void get_dphy_hs_transfer_info(u32 dphy_rate, u32 *hsfreqrange)
+{
+	unsigned int i;
+
+	for (i = 1; i < ARRAY_SIZE(dphy_hs_info); i++) {
+		if (dphy_rate < dphy_hs_info[i].rate) {
+			*hsfreqrange = dphy_hs_info[i - 1].hsfreqrange;
+			return;
+		}
+	}
+
+	/* Not found; return the largest entry */
+	*hsfreqrange = dphy_hs_info[ARRAY_SIZE(dphy_hs_info) - 1].hsfreqrange;
+}
+
+static void viscsi2_set_dphy_rate(struct viscsi2 *priv, u32 dphy_rate)
+{
+	u32 hsfreqrange;
+
+	get_dphy_hs_transfer_info(dphy_rate, &hsfreqrange);
+
+	dphy_write(priv, DIG_SYS_1, hsfreqrange);
+	dphy_write(priv, DIG_SYS_0, SYS_0_HSFREQRANGE_OVR);
+	dphy_write(priv, DIG_RX_STARTUP_OVR_5, STARTUP_OVR_5_BYPASS);
+	dphy_write(priv, DIG_RX_STARTUP_OVR_4, STARTUP_OVR_4_CNTVAL);
+	dphy_write(priv, DIG_CB_2, CB_2_LPRX_BIAS | CB_2_RESERVED);
+	dphy_write(priv, DIG_SYS_7, SYS_7_DESKEW_POL | SYS_7_RESERVED);
+	dphy_write(priv, DIG_CLKLANE_LANE_6, CLKLANE_RXHS_PULL_LONG);
+	dphy_write(priv, DIG_RX_STARTUP_OVR_2,
+		   FIELD_GET(0xff, OSC_FREQ_TARGET));
+	dphy_write(priv, DIG_RX_STARTUP_OVR_3,
+		   FIELD_GET(0xf00, OSC_FREQ_TARGET));
+	dphy_write(priv, DIG_RX_STARTUP_OVR_4,
+		   STARTUP_OVR_4_CNTVAL | STARTUP_OVR_4_DDL_EN);
+}
+
+static int viscsi2_initialize(struct viscsi2 *priv, u32 num_lane, u32 dphy_rate,
+			      const struct viscsi2_line_err_target *err_target)
+{
+	u32 val;
+
+	if (dphy_rate < CSI2RX_MIN_DATA_RATE ||
+	    dphy_rate > CSI2RX_MAX_DATA_RATE) {
+		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)",
+			dphy_rate);
+		return -ERANGE;
+	}
+
+	/* 1st phase of initialization */
+	viscsi2_write(priv, REG_CSI2RX_RESETN, 1);
+	viscsi2_write(priv, REG_CSI2RX_PHY_RSTZ, 0);
+	viscsi2_write(priv, REG_CSI2RX_PHY_SHUTDOWNZ, 0);
+	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, 1);
+	ndelay(15);
+	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, 0);
+
+	/* Configure D-PHY frequency range */
+	viscsi2_set_dphy_rate(priv, dphy_rate);
+
+	/* 2nd phase of initialization */
+	viscsi2_write(priv, REG_CSI2RX_NLANES, num_lane - 1);
+	ndelay(5);
+
+	/* Release D-PHY from Reset */
+	viscsi2_write(priv, REG_CSI2RX_PHY_SHUTDOWNZ, 1);
+	ndelay(5);
+	viscsi2_write(priv, REG_CSI2RX_PHY_RSTZ, 1);
+
+	/* Configuration of line error target */
+	val = (err_target->vc[3] << 30) | (err_target->dt[3] << 24) |
+	      (err_target->vc[2] << 22) | (err_target->dt[2] << 16) |
+	      (err_target->vc[1] << 14) | (err_target->dt[1] << 8) |
+	      (err_target->vc[0] << 6) | (err_target->dt[0]);
+	viscsi2_write(priv, REG_CSI2RX_DATA_IDS_1, val);
+	val = (err_target->vc[7] << 30) | (err_target->dt[7] << 24) |
+	      (err_target->vc[6] << 22) | (err_target->dt[6] << 16) |
+	      (err_target->vc[5] << 14) | (err_target->dt[5] << 8) |
+	      (err_target->vc[4] << 6) | (err_target->dt[4]);
+	viscsi2_write(priv, REG_CSI2RX_DATA_IDS_2, val);
+
+	/* Configuration of mask */
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PHY_FATAL, MASK_PHY_FATAL_ALL);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PKT_FATAL, MASK_PKT_FATAL_ALL);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_FRAME_FATAL,
+		      MASK_FRAME_FATAL_ALL);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PHY, MASK_PHY_ERROR_ALL);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PKT, MASK_PKT_ERROR_ALL);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_LINE, MASK_LINE_ERROR_ALL);
+
+	return 0;
+}
+
+struct viscsi2_format {
+	u32 code;
+	unsigned int bpp;
+};
+
+static const struct viscsi2_format viscsi2_formats[] = {
+	{ .code = MEDIA_BUS_FMT_RGB888_1X24, .bpp = 24 },
+	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_UYVY10_1X20, .bpp = 20 },
+	{ .code = MEDIA_BUS_FMT_RGB565_1X16, .bpp = 16 },
+	{ .code = MEDIA_BUS_FMT_SBGGR8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8 },
+	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10 },
+	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12 },
+	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .bpp = 14 },
+	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .bpp = 14 },
+};
+
+static const struct viscsi2_format *fmt_for_mbus_code(unsigned int mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; ARRAY_SIZE(viscsi2_formats); i++) {
+		if (viscsi2_formats[i].code == mbus_code)
+			return &viscsi2_formats[i];
+	}
+	return NULL;
+}
+
+static const struct viscsi2_line_err_target err_target_vc0_alldt = {
+	/* Select VC=0 */
+	/* Select all supported DataTypes */
+	.dt = {
+		MIPI_CSI2_DT_RGB565,
+		MIPI_CSI2_DT_YUV422_8B,
+		MIPI_CSI2_DT_YUV422_10B,
+		MIPI_CSI2_DT_RGB888,
+		MIPI_CSI2_DT_RAW8,
+		MIPI_CSI2_DT_RAW10,
+		MIPI_CSI2_DT_RAW12,
+		MIPI_CSI2_DT_RAW14,
+	}
+};
+
+static int viscsi2_start(struct viscsi2 *priv, struct v4l2_subdev_state *state)
+{
+	const struct v4l2_mbus_framefmt *sink_fmt;
+	const struct viscsi2_format *cur_fmt;
+	struct media_pad *src_pad;
+	int cur_bpp, dphy_rate;
+	s64 link_freq;
+	int ret = 0;
+
+	/* Get bpp for current format */
+	sink_fmt = v4l2_subdev_state_get_format(state, VISCSI2_PAD_SINK);
+	cur_fmt = fmt_for_mbus_code(sink_fmt->code);
+	if (!cur_fmt)
+		return -EINVAL;
+	cur_bpp = cur_fmt->bpp;
+
+	/* Get DPHY rate [unit: Mbps]; note that the signal is DDR */
+	src_pad = &priv->remote->entity.pads[priv->remote_pad];
+	link_freq = v4l2_get_link_freq(src_pad, cur_bpp, 2 * priv->lanes);
+	if (link_freq < 0)
+		return link_freq;
+	dphy_rate = div_s64(link_freq, 500000);
+
+	clk_prepare_enable(priv->clk_apb);
+	clk_prepare_enable(priv->clk_cfg);
+	ndelay(15);
+	reset_control_deassert(priv->rst);
+
+	ret = viscsi2_initialize(priv, priv->lanes, dphy_rate,
+				 &err_target_vc0_alldt);
+
+	if (ret) {
+		reset_control_assert(priv->rst);
+		clk_disable_unprepare(priv->clk_cfg);
+		clk_disable_unprepare(priv->clk_apb);
+		return ret;
+	}
+
+	priv->running = true;
+	return 0;
+}
+
+static void viscsi2_stop(struct viscsi2 *priv)
+{
+	priv->running = false;
+
+	/* Disable interrupt by clearing bits of MSK registers */
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PHY_FATAL, 0);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PKT_FATAL, 0);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_FRAME_FATAL, 0);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PHY, 0);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_PKT, 0);
+	viscsi2_write(priv, REG_CSI2RX_INT_MSK_LINE, 0);
+	/* Make sure registers cleared */
+	viscsi2_read(priv, REG_CSI2RX_INT_MSK_PHY_FATAL);
+	viscsi2_read(priv, REG_CSI2RX_INT_MSK_PKT_FATAL);
+	viscsi2_read(priv, REG_CSI2RX_INT_MSK_FRAME_FATAL);
+	viscsi2_read(priv, REG_CSI2RX_INT_MSK_PHY);
+	viscsi2_read(priv, REG_CSI2RX_INT_MSK_PKT);
+	viscsi2_read(priv, REG_CSI2RX_INT_MSK_LINE);
+	/* Wait for current handlers finish */
+	synchronize_irq(priv->irq);
+
+	/* Shutdown hardware */
+	viscsi2_write(priv, REG_CSI2RX_PHY_SHUTDOWNZ, 0);
+	viscsi2_write(priv, REG_CSI2RX_PHY_RSTZ, 0);
+	viscsi2_write(priv, REG_CSI2RX_PHY_TESTCTRL0, 1);
+	viscsi2_write(priv, REG_CSI2RX_RESETN, 0);
+
+	reset_control_assert(priv->rst);
+	clk_disable_unprepare(priv->clk_cfg);
+	clk_disable_unprepare(priv->clk_apb);
+}
+
+static int viscsi2_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct viscsi2 *priv = sd_to_csi2(sd);
+	int ret;
+
+	/* Enabling: turn on CSI2RX -> turn on sensor */
+	ret = viscsi2_start(priv, state);
+	if (ret)
+		return ret;
+
+	/* Currently CSI2RX supports only stream0 in source pad */
+	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
+					 BIT(0));
+	if (ret) {
+		viscsi2_stop(priv);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int viscsi2_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct viscsi2 *priv = sd_to_csi2(sd);
+
+	/* Disabling: turn off sensor -> turn off CSI2RX */
+	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT(0));
+	viscsi2_stop(priv);
+
+	return 0;
+}
+
+static int viscsi2_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == VISCSI2_PAD_SRC) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		/* SRC pad supports exactly the same format as SINK pad */
+		if (code->index)
+			return -EINVAL;
+		sink_fmt = v4l2_subdev_state_get_format(sd_state,
+							VISCSI2_PAD_SINK);
+		code->code = sink_fmt->code;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(viscsi2_formats))
+		return -EINVAL;
+	code->code = viscsi2_formats[code->index].code;
+
+	return 0;
+}
+
+static int viscsi2_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index > 0)
+		return -EINVAL;
+
+	if (!fmt_for_mbus_code(fse->code))
+		return -EINVAL;
+
+	fse->min_width = VISCSI2_MIN_WIDTH;
+	fse->max_width = VISCSI2_MAX_WIDTH;
+	fse->min_height = VISCSI2_MIN_HEIGHT;
+	fse->max_height = VISCSI2_MAX_HEIGHT;
+
+	return 0;
+}
+
+static int viscsi2_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, VISCSI2_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, VISCSI2_PAD_SRC);
+
+	sink_fmt->width = VISCSI2_DEF_WIDTH;
+	sink_fmt->height = VISCSI2_DEF_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = viscsi2_formats[0].code;
+	sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+
+	*src_fmt = *sink_fmt;
+
+	return 0;
+}
+
+static int viscsi2_set_pad_format(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	/* SRC PAD has the same format as SINK PAD */
+	if (fmt->pad == VISCSI2_PAD_SRC)
+		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
+
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, VISCSI2_PAD_SINK);
+
+	*sink_fmt = fmt->format;
+	sink_fmt->width = clamp_t(u32, fmt->format.width, VISCSI2_MIN_WIDTH,
+				  VISCSI2_MAX_WIDTH);
+	sink_fmt->height = clamp_t(u32, fmt->format.height, VISCSI2_MIN_HEIGHT,
+				   VISCSI2_MAX_HEIGHT);
+	if (!fmt_for_mbus_code(sink_fmt->code))
+		sink_fmt->code = viscsi2_formats[0].code;
+	fmt->format = *sink_fmt;
+
+	/* Source pad should have the same format */
+	src_fmt = v4l2_subdev_state_get_format(sd_state, VISCSI2_PAD_SRC);
+	*src_fmt = *sink_fmt;
+
+	return 0;
+}
+
+static const struct media_entity_operations viscsi2_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_pad_ops viscsi2_pad_ops = {
+	.enum_mbus_code = viscsi2_enum_mbus_code,
+	.enum_frame_size = viscsi2_enum_frame_size,
+	.disable_streams = viscsi2_disable_streams,
+	.enable_streams = viscsi2_enable_streams,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = viscsi2_set_pad_format,
+};
+
+static const struct v4l2_subdev_ops viscsi2_subdev_ops = {
+	.pad = &viscsi2_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops viscsi2_internal_ops = {
+	.init_state = viscsi2_init_state,
+};
+
+static int viscsi2_notify_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *subdev,
+				struct v4l2_async_connection *asc)
+{
+	struct viscsi2 *priv = notifier_to_csi2(notifier);
+	int pad;
+
+	pad = media_entity_get_fwnode_pad(&subdev->entity, asc->match.fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (pad < 0) {
+		dev_err(priv->dev, "Failed to find pad for %s\n", subdev->name);
+		return pad;
+	}
+
+	priv->remote = subdev;
+	priv->remote_pad = pad;
+
+	return media_create_pad_link(
+		&subdev->entity, pad, &priv->subdev.entity, 0,
+		MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE);
+}
+
+static void viscsi2_notify_unbind(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *subdev,
+				  struct v4l2_async_connection *asc)
+{
+	struct viscsi2 *priv = notifier_to_csi2(notifier);
+
+	priv->remote = NULL;
+}
+
+static const struct v4l2_async_notifier_operations viscsi2_notify_ops = {
+	.bound = viscsi2_notify_bound,
+	.unbind = viscsi2_notify_unbind,
+};
+
+static int viscsi2_parse_dt(struct viscsi2 *priv)
+{
+	struct v4l2_async_connection *asc;
+	struct fwnode_handle *fwnode;
+	struct fwnode_handle *ep;
+	struct v4l2_fwnode_endpoint v4l2_ep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(priv->dev), 0, 0, 0);
+	if (!ep) {
+		dev_err(priv->dev, "Not connected to subdevice\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
+	if (ret) {
+		dev_err(priv->dev, "Could not parse v4l2 endpoint\n");
+		goto error_fwnode_handle_put;
+	}
+
+	priv->lanes = v4l2_ep.bus.mipi_csi2.num_data_lanes;
+	if (priv->lanes != 1 && priv->lanes != 2 && priv->lanes != 4) {
+		dev_err(priv->dev,
+			"Unsupported number of data-lanes for D-PHY: %u\n",
+			priv->lanes);
+		goto error_fwnode_handle_put;
+	}
+
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	fwnode_handle_put(ep);
+
+	v4l2_async_subdev_nf_init(&priv->notifier, &priv->subdev);
+	priv->notifier.ops = &viscsi2_notify_ops;
+
+	asc = v4l2_async_nf_add_fwnode(&priv->notifier, fwnode,
+				       struct v4l2_async_connection);
+	fwnode_handle_put(fwnode);
+	if (IS_ERR(asc))
+		return PTR_ERR(asc);
+
+	ret = v4l2_async_nf_register(&priv->notifier);
+	if (ret)
+		v4l2_async_nf_cleanup(&priv->notifier);
+
+	return ret;
+
+error_fwnode_handle_put:
+	fwnode_handle_put(ep);
+	return -EINVAL;
+}
+
+static irqreturn_t viscsi2_irq(int irq, void *dev_id)
+{
+	struct viscsi2 *priv = dev_id;
+	u32 event;
+
+	event = viscsi2_read(priv, REG_CSI2RX_INT_ST_MAIN);
+	dev_err_ratelimited(priv->dev, "CSI2RX error 0x%x.\n", event);
+
+#ifdef CONFIG_DEBUG_FS
+	priv->debug_phy_fatal |=
+		viscsi2_read(priv, REG_CSI2RX_INT_ST_PHY_FATAL);
+	priv->debug_pkt_fatal |=
+		viscsi2_read(priv, REG_CSI2RX_INT_ST_PKT_FATAL);
+	priv->debug_frame_fatal |=
+		viscsi2_read(priv, REG_CSI2RX_INT_ST_FRAME_FATAL);
+	priv->debug_phy |= viscsi2_read(priv, REG_CSI2RX_INT_ST_PHY);
+	priv->debug_pkt |= viscsi2_read(priv, REG_CSI2RX_INT_ST_PKT);
+	priv->debug_line |= viscsi2_read(priv, REG_CSI2RX_INT_ST_LINE);
+#endif
+
+	return IRQ_HANDLED;
+}
+
+static const struct of_device_id viscsi2_of_table[] = {
+	{
+		.compatible = "toshiba,visconti5-csi2",
+	},
+	{ /* Sentinel */ }
+};
+
+static int viscsi2_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct viscsi2 *priv;
+	int irq, ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->running = false;
+
+	priv->dev = dev;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+	ret = devm_request_irq(dev, irq, viscsi2_irq, 0, KBUILD_MODNAME, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "irq request failed");
+
+	priv->irq = irq;
+
+	priv->clk_cfg = devm_clk_get(dev, "cfg");
+	if (IS_ERR(priv->clk_cfg))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_cfg),
+				     "cannot get clock cfg");
+	priv->clk_apb = devm_clk_get(dev, "apb");
+	if (IS_ERR(priv->clk_apb))
+		return dev_err_probe(dev, PTR_ERR(priv->clk_apb),
+				     "cannot get clock apb");
+	priv->rst = devm_reset_control_get_exclusive_by_index(dev, 0);
+	if (IS_ERR(priv->rst))
+		return dev_err_probe(dev, PTR_ERR(priv->rst),
+				     "cannot get reset");
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = viscsi2_parse_dt(priv);
+	if (ret)
+		return ret;
+
+	priv->subdev.dev = &pdev->dev;
+	v4l2_subdev_init(&priv->subdev, &viscsi2_subdev_ops);
+	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
+	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s",
+		 KBUILD_MODNAME, dev_name(&pdev->dev));
+
+	priv->subdev.internal_ops = &viscsi2_internal_ops;
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	priv->subdev.entity.ops = &viscsi2_entity_ops;
+
+	priv->pads[VISCSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	priv->pads[VISCSI2_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&priv->subdev.entity,
+				     ARRAY_SIZE(priv->pads), priv->pads);
+	if (ret)
+		goto err_cleanup_async;
+
+	ret = v4l2_subdev_init_finalize(&priv->subdev);
+	if (ret)
+		goto err_cleanup_media_entity;
+
+	ret = v4l2_async_register_subdev(&priv->subdev);
+	if (ret < 0)
+		goto err_cleanup_subdev_state;
+
+#ifdef CONFIG_DEBUG_FS
+	viscsi2_debug_init(priv);
+#endif
+
+	return 0;
+
+err_cleanup_subdev_state:
+	v4l2_subdev_cleanup(&priv->subdev);
+
+err_cleanup_media_entity:
+	media_entity_cleanup(&priv->subdev.entity);
+
+err_cleanup_async:
+	v4l2_async_nf_unregister(&priv->notifier);
+	v4l2_async_nf_cleanup(&priv->notifier);
+
+	return ret;
+}
+
+static void viscsi2_remove(struct platform_device *pdev)
+{
+	struct viscsi2 *priv = platform_get_drvdata(pdev);
+
+#ifdef CONFIG_DEBUG_FS
+	viscsi2_debug_cleanup(priv);
+#endif
+
+	v4l2_async_nf_unregister(&priv->notifier);
+	v4l2_async_nf_cleanup(&priv->notifier);
+	v4l2_async_unregister_subdev(&priv->subdev);
+
+	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
+}
+
+static struct platform_driver viscsi2_driver = {
+	.probe = viscsi2_probe,
+	.remove = viscsi2_remove,
+	.driver = {
+		.name = "visconti-csi2rx",
+		.of_match_table = viscsi2_of_table,
+	},
+};
+
+module_platform_driver(viscsi2_driver);
+
+MODULE_AUTHOR("Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>");
+MODULE_DESCRIPTION("Toshiba Visconti CSI-2 receiver driver");
+MODULE_LICENSE("Dual BSD/GPL");

-- 
2.34.1



