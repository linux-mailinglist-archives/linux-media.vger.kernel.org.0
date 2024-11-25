Return-Path: <linux-media+bounces-21973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7099D843A
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3AD428AF7D
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801251990D3;
	Mon, 25 Nov 2024 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="hOoI40JO"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1122.securemx.jp [210.130.202.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E127F195985;
	Mon, 25 Nov 2024 11:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732533560; cv=none; b=UsG1wcR7KEnu8mwKKS76HLIiVDeH8zcoymVKUxAKFsILlPOdfy7StzBW9kyTPNgEcpfm2/Um64IOyLiQb+uw7wrzmsY133UQ3+WhsAJ9tpaTfs0Q4VN96m4W+1vSA/usfWBQBFcINOWvsONlZ/kzK0t+Of+7jpGXqzJ/8uVPHQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732533560; c=relaxed/simple;
	bh=uZL+oCJiQQb+B0av6XL1UsHZSXfCpI5C0+fq7+c/Cd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ssk008OcVt9ZYkZkWjMFpogNS/DFAYvpqRCSpCwP001R9A46kLHTV8YVgmHv7Gva/tyL72lxUvyWn/nkVCO7uufyKaTYutk9el48u0pWFDbyl/aKnregFqg7QLsTCeKntw/8vtjxnWy+KhXEnN8vyxfsGhvRlYKQ67toRO+1D+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=hOoI40JO; arc=none smtp.client-ip=210.130.202.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1122) id 4AP9Rp9A262724; Mon, 25 Nov 2024 18:27:51 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1732526839;x=1733736439;bh=uZL+oCJiQQb+B0av6XL1UsHZSXfCpI5C0+fq7+c/Cd4=;b=hOo
	I40JOjmNHvy1ck871ImK9+MJr43G0d17imXZY9FraHtYGpTsrNd+EwZ9kTl4UQ4OA+hnx4n7yAbBm
	OpACrxaSDdFPJVeL6DnvmoYQkZD2UWaC5QXHe3f6RrTJsqug1FT/1cilkKiadV8geu+FQTJioBeCr
	vA5/6UczKjTvHI42ye4uosy7mPHQWyo7Pin/TlO2yWFURuir5Oh/EvQCaIliiK4dyNrAI2g1xVpHU
	MbBQ8UG8VMJr+e4NnetO12Wo+AHh1b7wqDzcRWzYPQ5iP1UCNeeagoeqMNywwlrPjgyBAJdn99CkP
	ikWBiab0u+E5yOc9rVuzLssaGr2ElCQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 4AP9RHpW099343; Mon, 25 Nov 2024 18:27:18 +0900
X-Iguazu-Qid: 2rWgFNitjKYKO6hMyT
X-Iguazu-QSIG: v=2; s=0; t=1732526837; q=2rWgFNitjKYKO6hMyT; m=TZXSZwOc5QcMMvGbsQzManldV9UpbFjv5/MHVnIvXaU=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1123) id 4AP9RE95108739
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:15 +0900
X-SA-MID: 32872675
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 4/8] media: platform: visconti: Add Toshiba Visconti CSI-2 Receiver driver
Date: Mon, 25 Nov 2024 18:21:42 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-5-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to MIPI CSI-2 Receiver on Toshiba Visconti ARM SoCs.
This driver is used with Visconti Video Input Interface driver.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v12:
- Separate CSI2RX driver and made it independent driver
- viif_csi2rx subdevice driver (in v11 patch) was removed.
- dictionary order at Kconfig and Makefile

 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/toshiba/Kconfig        |   6 +
 drivers/media/platform/toshiba/Makefile       |   2 +
 .../media/platform/toshiba/visconti/Kconfig   |  16 +
 .../media/platform/toshiba/visconti/Makefile  |   8 +
 .../platform/toshiba/visconti/csi2rx_drv.c    | 791 ++++++++++++++++++
 7 files changed, 825 insertions(+)
 create mode 100644 drivers/media/platform/toshiba/Kconfig
 create mode 100644 drivers/media/platform/toshiba/Makefile
 create mode 100644 drivers/media/platform/toshiba/visconti/Kconfig
 create mode 100644 drivers/media/platform/toshiba/visconti/Makefile
 create mode 100644 drivers/media/platform/toshiba/visconti/csi2rx_drv.c

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 85d2627776b6..761b15b07b90 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -86,6 +86,7 @@ source "drivers/media/platform/samsung/Kconfig"
 source "drivers/media/platform/st/Kconfig"
 source "drivers/media/platform/sunxi/Kconfig"
 source "drivers/media/platform/ti/Kconfig"
+source "drivers/media/platform/toshiba/Kconfig"
 source "drivers/media/platform/verisilicon/Kconfig"
 source "drivers/media/platform/via/Kconfig"
 source "drivers/media/platform/xilinx/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index ace4e34483dd..917145fe5171 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -29,6 +29,7 @@ obj-y += samsung/
 obj-y += st/
 obj-y += sunxi/
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
index 000000000000..2bce85ef3b48
--- /dev/null
+++ b/drivers/media/platform/toshiba/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += visconti/
diff --git a/drivers/media/platform/toshiba/visconti/Kconfig b/drivers/media/platform/toshiba/visconti/Kconfig
new file mode 100644
index 000000000000..e5c92d598f8b
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
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
index 000000000000..94567963872a
--- /dev/null
+++ b/drivers/media/platform/toshiba/visconti/csi2rx_drv.c
@@ -0,0 +1,791 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/* Toshiba Visconti Video Capture Support
+ *
+ * (C) Copyright 2024 TOSHIBA CORPORATION
+ * (C) Copyright 2024 Toshiba Electronic Devices & Storage Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
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
+/* access to dphy external registers */
+#define REG_CSI2RX_PHY_TESTCTRL0 0x50
+#define BIT_TESTCTRL0_CLK_0	 0
+#define BIT_TESTCTRL0_CLK_1	 BIT(1)
+
+#define REG_CSI2RX_PHY_TESTCTRL1 0x54
+#define BIT_TESTCTRL1_ADDR	 BIT(16)
+#define MASK_TESTCTRL1_DIN	 0xff
+#define MASK_TESTCTRL1_DOUT	 0xff00
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
+	DIG_SYS_3 = 0x004,
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
+#define SYS_3_NO_REXT	       BIT(4)
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
+#define VISCONTI_CSI2RX_ERROR_MONITORS_NUM 8
+
+/**
+ * struct visconti_csi2rx_line_err_target
+ *
+ * Virtual Channel and Data Type pair for CSI2RX line error monitor
+ *
+ * When 0 is set to dt, line error detection is disabled.
+ *
+ * @vc: Virtual Channel to monitor; Range 0..3
+ * @dt: Data Type to monitor; Range 0, 0x10..0x3f
+ */
+struct visconti_csi2rx_line_err_target {
+	u32 vc[VISCONTI_CSI2RX_ERROR_MONITORS_NUM];
+	u32 dt[VISCONTI_CSI2RX_ERROR_MONITORS_NUM];
+};
+
+#define CSI2RX_MIN_DATA_RATE 80U
+#define CSI2RX_MAX_DATA_RATE 1500U
+
+#define VISCONTI_CSI2RX_PAD_SINK 0
+#define VISCONTI_CSI2RX_PAD_SRC	 1
+#define VISCONTI_CSI2RX_PAD_NUM	 2
+
+#define VISCONTI_CSI2RX_DEF_WIDTH  1920
+#define VISCONTI_CSI2RX_DEF_HEIGHT 1080
+#define VISCONTI_CSI2RX_MIN_WIDTH  640
+#define VISCONTI_CSI2RX_MAX_WIDTH  3840
+#define VISCONTI_CSI2RX_MIN_HEIGHT 480
+#define VISCONTI_CSI2RX_MAX_HEIGHT 2160
+
+struct visconti_csi2rx {
+	struct device *dev;
+	void __iomem *base;
+
+	struct v4l2_subdev subdev;
+	struct media_pad pads[VISCONTI_CSI2RX_PAD_NUM];
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev *remote;
+	unsigned int remote_pad;
+
+	unsigned int lanes;
+
+	unsigned int irq;
+};
+
+static inline struct visconti_csi2rx *notifier_to_csi2(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct visconti_csi2rx, notifier);
+}
+
+static inline struct visconti_csi2rx *sd_to_csi2(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct visconti_csi2rx, subdev);
+}
+
+static inline void visconti_csi2rx_write(struct visconti_csi2rx *priv, u32 regid, u32 val)
+{
+	writel(val, priv->base + regid);
+}
+
+static inline u32 visconti_csi2rx_read(struct visconti_csi2rx *priv, u32 regid)
+{
+	return readl(priv->base + regid);
+}
+
+static inline void tick_testclk(struct visconti_csi2rx *priv)
+{
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_TESTCTRL0, BIT_TESTCTRL0_CLK_1);
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_TESTCTRL0, BIT_TESTCTRL0_CLK_0);
+}
+
+static inline void set_dphy_addr(struct visconti_csi2rx *priv, u32 test_mode)
+{
+	/* select testcode Ex space with top 4bits of test_mode */
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_TESTCTRL1,
+			      BIT_TESTCTRL1_ADDR | DIG_TESTCODE_EXT);
+	tick_testclk(priv);
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_TESTCTRL1, FIELD_GET(0xf00, test_mode));
+	tick_testclk(priv);
+
+	/* set bottom 8bit of test_mode */
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_TESTCTRL1,
+			      BIT_TESTCTRL1_ADDR | FIELD_GET(0xff, test_mode));
+	tick_testclk(priv);
+}
+
+static void write_dphy_param(struct visconti_csi2rx *priv, u32 test_mode, u8 test_in)
+{
+	set_dphy_addr(priv, test_mode);
+
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_TESTCTRL1, (u32)test_in);
+	tick_testclk(priv);
+}
+
+struct csi2rx_dphy_hs_info {
+	u32 rate;
+	u32 hsfreqrange;
+	u32 osc_freq_target;
+};
+
+static const struct csi2rx_dphy_hs_info dphy_hs_info[] = {
+	{ 80, 0x0, 0x1cc },   { 85, 0x10, 0x1cc },   { 95, 0x20, 0x1cc },   { 105, 0x30, 0x1cc },
+	{ 115, 0x1, 0x1cc },  { 125, 0x11, 0x1cc },  { 135, 0x21, 0x1cc },  { 145, 0x31, 0x1cc },
+	{ 155, 0x2, 0x1cc },  { 165, 0x12, 0x1cc },  { 175, 0x22, 0x1cc },  { 185, 0x32, 0x1cc },
+	{ 198, 0x3, 0x1cc },  { 213, 0x13, 0x1cc },  { 228, 0x23, 0x1cc },  { 243, 0x33, 0x1cc },
+	{ 263, 0x4, 0x1cc },  { 288, 0x14, 0x1cc },  { 313, 0x25, 0x1cc },  { 338, 0x35, 0x1cc },
+	{ 375, 0x5, 0x1cc },  { 425, 0x16, 0x1cc },  { 475, 0x26, 0x1cc },  { 525, 0x37, 0x1cc },
+	{ 575, 0x7, 0x1cc },  { 625, 0x18, 0x1cc },  { 675, 0x28, 0x1cc },  { 725, 0x39, 0x1cc },
+	{ 775, 0x9, 0x1cc },  { 825, 0x19, 0x1cc },  { 875, 0x29, 0x1cc },  { 925, 0x3a, 0x1cc },
+	{ 975, 0xa, 0x1cc },  { 1025, 0x1a, 0x1cc }, { 1075, 0x2a, 0x1cc }, { 1125, 0x3b, 0x1cc },
+	{ 1175, 0xb, 0x1cc }, { 1225, 0x1b, 0x1cc }, { 1275, 0x2b, 0x1cc }, { 1325, 0x3c, 0x1cc },
+	{ 1375, 0xc, 0x1cc }, { 1425, 0x1c, 0x1cc }, { 1475, 0x2c, 0x1cc }
+};
+
+static void get_dphy_hs_transfer_info(u32 dphy_rate, u32 *hsfreqrange, u32 *osc_freq_target)
+{
+	unsigned int i;
+
+	for (i = 1; i < ARRAY_SIZE(dphy_hs_info); i++) {
+		if (dphy_rate < dphy_hs_info[i].rate) {
+			*hsfreqrange = dphy_hs_info[i - 1].hsfreqrange;
+			*osc_freq_target = dphy_hs_info[i - 1].osc_freq_target;
+			return;
+		}
+	}
+
+	/* not found; return the largest entry */
+	*hsfreqrange = dphy_hs_info[ARRAY_SIZE(dphy_hs_info) - 1].hsfreqrange;
+	*osc_freq_target = dphy_hs_info[ARRAY_SIZE(dphy_hs_info) - 1].osc_freq_target;
+}
+
+static void visconti_csi2rx_set_dphy_rate(struct visconti_csi2rx *priv, u32 dphy_rate)
+{
+	u32 hsfreqrange, osc_freq_target;
+
+	get_dphy_hs_transfer_info(dphy_rate, &hsfreqrange, &osc_freq_target);
+
+	write_dphy_param(priv, DIG_SYS_1, (u8)hsfreqrange);
+	write_dphy_param(priv, DIG_SYS_0, SYS_0_HSFREQRANGE_OVR);
+	write_dphy_param(priv, DIG_RX_STARTUP_OVR_5, STARTUP_OVR_5_BYPASS);
+	write_dphy_param(priv, DIG_RX_STARTUP_OVR_4, STARTUP_OVR_4_CNTVAL);
+	write_dphy_param(priv, DIG_CB_2, CB_2_LPRX_BIAS | CB_2_RESERVED);
+	write_dphy_param(priv, DIG_SYS_7, SYS_7_DESKEW_POL | SYS_7_RESERVED);
+	write_dphy_param(priv, DIG_CLKLANE_LANE_6, CLKLANE_RXHS_PULL_LONG);
+	write_dphy_param(priv, DIG_RX_STARTUP_OVR_2, FIELD_GET(0xff, osc_freq_target));
+	write_dphy_param(priv, DIG_RX_STARTUP_OVR_3, FIELD_GET(0xf00, osc_freq_target));
+	write_dphy_param(priv, DIG_RX_STARTUP_OVR_4, STARTUP_OVR_4_CNTVAL | STARTUP_OVR_4_DDL_EN);
+}
+
+static int visconti_csi2rx_initialize(struct visconti_csi2rx *priv, u32 num_lane, u32 dphy_rate,
+				      const struct visconti_csi2rx_line_err_target *err_target)
+{
+	u32 val;
+
+	if (dphy_rate < CSI2RX_MIN_DATA_RATE || dphy_rate > CSI2RX_MAX_DATA_RATE) {
+		dev_err(priv->dev, "Unsupported PHY speed (%u Mbps)", dphy_rate);
+		return -ERANGE;
+	}
+
+	/* 1st phase of initialization */
+	visconti_csi2rx_write(priv, REG_CSI2RX_RESETN, 1);
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_RSTZ, 0);
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_SHUTDOWNZ, 0);
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_TESTCTRL0, 1);
+	ndelay(15U);
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_TESTCTRL0, 0);
+
+	/* Configure D-PHY frequency range */
+	visconti_csi2rx_set_dphy_rate(priv, dphy_rate);
+
+	/* 2nd phase of initialization */
+	visconti_csi2rx_write(priv, REG_CSI2RX_NLANES, (num_lane - 1U));
+	ndelay(5U);
+
+	/* Release D-PHY from Reset */
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_SHUTDOWNZ, 1);
+	ndelay(5U);
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_RSTZ, 1);
+
+	/* configuration of line error target */
+	val = (err_target->vc[3] << 30U) | (err_target->dt[3] << 24U) | (err_target->vc[2] << 22U) |
+	      (err_target->dt[2] << 16U) | (err_target->vc[1] << 14U) | (err_target->dt[1] << 8U) |
+	      (err_target->vc[0] << 6U) | (err_target->dt[0]);
+	visconti_csi2rx_write(priv, REG_CSI2RX_DATA_IDS_1, val);
+	val = (err_target->vc[7] << 30U) | (err_target->dt[7] << 24U) | (err_target->vc[6] << 22U) |
+	      (err_target->dt[6] << 16U) | (err_target->vc[5] << 14U) | (err_target->dt[5] << 8U) |
+	      (err_target->vc[4] << 6U) | (err_target->dt[4]);
+	visconti_csi2rx_write(priv, REG_CSI2RX_DATA_IDS_2, val);
+
+	/* configuration of mask */
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_PHY_FATAL, MASK_PHY_FATAL_ALL);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_PKT_FATAL, MASK_PKT_FATAL_ALL);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_FRAME_FATAL, MASK_FRAME_FATAL_ALL);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_PHY, MASK_PHY_ERROR_ALL);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_PKT, MASK_PKT_ERROR_ALL);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_LINE, MASK_LINE_ERROR_ALL);
+
+	return 0;
+}
+
+struct visconti_csi2rx_format {
+	u32 code;
+	unsigned int bpp;
+};
+
+static const struct visconti_csi2rx_format visconti_csi2rx_formats[] = {
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
+static const struct visconti_csi2rx_format *fmt_for_mbus_code(unsigned int mbus_code)
+{
+	int i;
+
+	for (i = 0; ARRAY_SIZE(visconti_csi2rx_formats); i++)
+		if (visconti_csi2rx_formats[i].code == mbus_code)
+			return &visconti_csi2rx_formats[i];
+}
+
+static unsigned int bpp_for_mbus_code(unsigned int mbus_code)
+{
+	const struct visconti_csi2rx_format *fmt = fmt_for_mbus_code(mbus_code);
+
+	return fmt ? fmt->bpp : 0;
+}
+
+static int64_t get_pixelclock(struct v4l2_subdev *sd)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(sd->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl)
+		return -EINVAL;
+
+	return v4l2_ctrl_g_ctrl_int64(ctrl);
+}
+
+static const struct visconti_csi2rx_line_err_target err_target_vc0_alldt = {
+	/* select VC=0 */
+	/* select all supported DataTypes */
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
+static int visconti_csi2rx_start(struct visconti_csi2rx *priv, struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+	int cur_bpp, dphy_rate;
+	s64 pixelclock;
+
+	/* get bpp for current format */
+	sink_fmt = v4l2_subdev_state_get_format(state, VISCONTI_CSI2RX_PAD_SINK);
+	cur_bpp = bpp_for_mbus_code(sink_fmt->code);
+
+	/* get pixel clock */
+	pixelclock = get_pixelclock(priv->remote);
+	if (pixelclock < 0)
+		return -EINVAL;
+
+	dphy_rate = div64_u64((u64)pixelclock * (u32)cur_bpp, priv->lanes * 1000000);
+
+	ndelay(15U);
+
+	return visconti_csi2rx_initialize(priv, priv->lanes, dphy_rate, &err_target_vc0_alldt);
+}
+
+static void visconti_csi2rx_stop(struct visconti_csi2rx *priv)
+{
+	/* disable interrupt -> make sure registers cleared -> wait for current handlers finish */
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_PHY_FATAL, 0);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_PKT_FATAL, 0);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_FRAME_FATAL, 0);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_PHY, 0);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_PKT, 0);
+	visconti_csi2rx_write(priv, REG_CSI2RX_INT_MSK_LINE, 0);
+	visconti_csi2rx_read(priv, REG_CSI2RX_INT_MSK_PHY_FATAL);
+	visconti_csi2rx_read(priv, REG_CSI2RX_INT_MSK_PKT_FATAL);
+	visconti_csi2rx_read(priv, REG_CSI2RX_INT_MSK_FRAME_FATAL);
+	visconti_csi2rx_read(priv, REG_CSI2RX_INT_MSK_PHY);
+	visconti_csi2rx_read(priv, REG_CSI2RX_INT_MSK_PKT);
+	visconti_csi2rx_read(priv, REG_CSI2RX_INT_MSK_LINE);
+	synchronize_irq(priv->irq);
+
+	/* shutdown hardware */
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_SHUTDOWNZ, 0);
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_RSTZ, 0);
+	visconti_csi2rx_write(priv, REG_CSI2RX_PHY_TESTCTRL0, 1);
+	visconti_csi2rx_write(priv, REG_CSI2RX_RESETN, 0);
+}
+
+static int visconti_csi2rx_enable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+					  u32 pad, u64 streams_mask)
+{
+	struct visconti_csi2rx *priv = sd_to_csi2(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+	int ret;
+
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[VISCONTI_CSI2RX_PAD_SINK]);
+	if (!remote_pad)
+		return -ENODEV;
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	/* enabling: turn on CSI2RX -> turn on sensor */
+	ret = visconti_csi2rx_start(priv, state);
+	if (ret)
+		return ret;
+
+	/* currently CSI2RX supports only stream0 in source pad */
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, BIT(0));
+	if (ret) {
+		visconti_csi2rx_stop(priv);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int visconti_csi2rx_disable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct visconti_csi2rx *priv = sd_to_csi2(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *remote_pad;
+
+	remote_pad = media_pad_remote_pad_first(&sd->entity.pads[VISCONTI_CSI2RX_PAD_SINK]);
+	if (!remote_pad)
+		return -ENODEV;
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	/* disabling: turn off sensor -> turn off CSI2RX */
+	v4l2_subdev_disable_streams(remote_sd, remote_pad->index, BIT(0));
+	visconti_csi2rx_stop(priv);
+
+	return 0;
+}
+
+static int visconti_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == VISCONTI_CSI2RX_PAD_SRC) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		/* SRC pad supports exactly the same format as SINK pad */
+		if (code->index)
+			return -EINVAL;
+		sink_fmt = v4l2_subdev_state_get_format(sd_state, VISCONTI_CSI2RX_PAD_SINK);
+		code->code = sink_fmt->code;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(visconti_csi2rx_formats))
+		return -EINVAL;
+	code->code = visconti_csi2rx_formats[code->index].code;
+
+	return 0;
+}
+
+static int visconti_csi2rx_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, VISCONTI_CSI2RX_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, VISCONTI_CSI2RX_PAD_SRC);
+
+	sink_fmt->width = VISCONTI_CSI2RX_DEF_WIDTH;
+	sink_fmt->height = VISCONTI_CSI2RX_DEF_HEIGHT;
+	sink_fmt->field = V4L2_FIELD_NONE;
+	sink_fmt->code = visconti_csi2rx_formats[0].code;
+
+	*src_fmt = *sink_fmt;
+
+	return 0;
+}
+
+static int visconti_csi2rx_set_pad_format(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *sd_state,
+					  struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+
+	/* SRC PAD has the same format as SINK PAD */
+	if (fmt->pad == 1)
+		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
+
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, VISCONTI_CSI2RX_PAD_SINK);
+
+	*sink_fmt = fmt->format;
+	sink_fmt->width = clamp_t(u32, fmt->format.width, VISCONTI_CSI2RX_MIN_WIDTH,
+				  VISCONTI_CSI2RX_MAX_WIDTH);
+	sink_fmt->height = clamp_t(u32, fmt->format.height, VISCONTI_CSI2RX_MIN_HEIGHT,
+				   VISCONTI_CSI2RX_MAX_HEIGHT);
+	if (!fmt_for_mbus_code(sink_fmt->code))
+		sink_fmt->code = visconti_csi2rx_formats[0].code;
+	fmt->format = *sink_fmt;
+
+	/* source pad should have the same format */
+	src_fmt = v4l2_subdev_state_get_format(sd_state, VISCONTI_CSI2RX_PAD_SRC);
+	*src_fmt = *sink_fmt;
+
+	return 0;
+}
+
+static const struct media_entity_operations visconti_csi2rx_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_video_ops visconti_csi2rx_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops visconti_csi2rx_pad_ops = {
+	.enum_mbus_code = visconti_csi2rx_enum_mbus_code,
+	.disable_streams = visconti_csi2rx_disable_streams,
+	.enable_streams = visconti_csi2rx_enable_streams,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = visconti_csi2rx_set_pad_format,
+};
+
+static const struct v4l2_subdev_ops visconti_csi2rx_subdev_ops = {
+	.video = &visconti_csi2rx_video_ops,
+	.pad = &visconti_csi2rx_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops visconti_csi2rx_internal_ops = {
+	.init_state = visconti_csi2rx_init_state,
+};
+
+static int visconti_csi2rx_notify_bound(struct v4l2_async_notifier *notifier,
+					struct v4l2_subdev *subdev,
+					struct v4l2_async_connection *asc)
+{
+	struct visconti_csi2rx *priv = notifier_to_csi2(notifier);
+	int pad;
+
+	pad = media_entity_get_fwnode_pad(&subdev->entity, asc->match.fwnode, MEDIA_PAD_FL_SOURCE);
+	if (pad < 0) {
+		dev_err(priv->dev, "Failed to find pad for %s\n", subdev->name);
+		return pad;
+	}
+
+	priv->remote = subdev;
+	priv->remote_pad = pad;
+
+	return media_create_pad_link(&subdev->entity, pad, &priv->subdev.entity, 0,
+				     MEDIA_LNK_FL_ENABLED);
+}
+
+static void visconti_csi2rx_notify_unbind(struct v4l2_async_notifier *notifier,
+					  struct v4l2_subdev *subdev,
+					  struct v4l2_async_connection *asc)
+{
+	struct visconti_csi2rx *priv = notifier_to_csi2(notifier);
+
+	priv->remote = NULL;
+}
+
+static const struct v4l2_async_notifier_operations visconti_csi2rx_notify_ops = {
+	.bound = visconti_csi2rx_notify_bound,
+	.unbind = visconti_csi2rx_notify_unbind,
+};
+
+static int visconti_csi2rx_parse_v4l2(struct visconti_csi2rx *priv,
+				      struct v4l2_fwnode_endpoint *vep)
+{
+	/* Only port 0 endpoint 0 is valid. */
+	if (vep->base.port || vep->base.id)
+		return -ENOTCONN;
+
+	priv->lanes = vep->bus.mipi_csi2.num_data_lanes;
+
+	/* got trouble */
+	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(priv->dev, "Specified bus type is not supported\n");
+		return -EINVAL;
+	}
+
+	if (priv->lanes != 1 && priv->lanes != 2 && priv->lanes != 4) {
+		dev_err(priv->dev, "Unsupported number of data-lanes for D-PHY: %u\n", priv->lanes);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int visconti_csi2rx_parse_dt(struct visconti_csi2rx *priv)
+{
+	struct v4l2_async_connection *asc;
+	struct fwnode_handle *fwnode;
+	struct fwnode_handle *ep;
+	struct v4l2_fwnode_endpoint v4l2_ep = {
+		.bus_type = V4L2_MBUS_UNKNOWN,
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
+		fwnode_handle_put(ep);
+		return -EINVAL;
+	}
+
+	ret = visconti_csi2rx_parse_v4l2(priv, &v4l2_ep);
+	if (ret) {
+		fwnode_handle_put(ep);
+		return ret;
+	}
+
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	fwnode_handle_put(ep);
+
+	v4l2_async_subdev_nf_init(&priv->notifier, &priv->subdev);
+	priv->notifier.ops = &visconti_csi2rx_notify_ops;
+
+	asc = v4l2_async_nf_add_fwnode(&priv->notifier, fwnode, struct v4l2_async_connection);
+	fwnode_handle_put(fwnode);
+	if (IS_ERR(asc))
+		return PTR_ERR(asc);
+
+	ret = v4l2_async_nf_register(&priv->notifier);
+	if (ret)
+		v4l2_async_nf_cleanup(&priv->notifier);
+
+	return ret;
+}
+
+static irqreturn_t visconti_csi2rx_irq(int irq, void *dev_id)
+{
+	struct visconti_csi2rx *priv = dev_id;
+	u32 event;
+
+	event = visconti_csi2rx_read(priv, REG_CSI2RX_INT_ST_MAIN);
+	dev_err(priv->dev, "CSI2RX error 0x%x.\n", event);
+
+	return IRQ_HANDLED;
+}
+
+static const struct of_device_id visconti_csi2rx_of_table[] = {
+	{
+		.compatible = "toshiba,visconti5-csi2rx",
+	},
+	{},
+};
+
+static int visconti_csi2rx_probe(struct platform_device *pdev)
+{
+	struct visconti_csi2rx *priv;
+	int irq, ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base)) {
+		dev_err(priv->dev, "Failed to get registers\n");
+		return PTR_ERR(priv->base);
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+	ret = devm_request_irq(&pdev->dev, irq, visconti_csi2rx_irq, 0, KBUILD_MODNAME, priv);
+	priv->irq = irq;
+	if (ret) {
+		dev_err(priv->dev, "request irq failed: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = visconti_csi2rx_parse_dt(priv); /*this function does v4l2_async_nf_register */
+	if (ret)
+		return ret;
+
+	priv->subdev.owner = THIS_MODULE;
+	priv->subdev.dev = &pdev->dev;
+	v4l2_subdev_init(&priv->subdev, &visconti_csi2rx_subdev_ops);
+	v4l2_set_subdevdata(&priv->subdev, &pdev->dev);
+	snprintf(priv->subdev.name, sizeof(priv->subdev.name), "%s %s", KBUILD_MODNAME,
+		 dev_name(&pdev->dev));
+
+	priv->subdev.internal_ops = &visconti_csi2rx_internal_ops;
+	priv->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
+	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	priv->subdev.entity.ops = &visconti_csi2rx_entity_ops;
+
+	priv->pads[VISCONTI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	priv->pads[VISCONTI_CSI2RX_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&priv->subdev.entity, VISCONTI_CSI2RX_PAD_NUM, priv->pads);
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
+static void visconti_csi2rx_remove(struct platform_device *pdev)
+{
+	struct visconti_csi2rx *priv = platform_get_drvdata(pdev);
+
+	v4l2_async_nf_unregister(&priv->notifier);
+	v4l2_async_nf_cleanup(&priv->notifier);
+	v4l2_async_unregister_subdev(&priv->subdev);
+
+	v4l2_subdev_cleanup(&priv->subdev);
+	media_entity_cleanup(&priv->subdev.entity);
+}
+
+static struct platform_driver visconti_csi2rx_driver = {
+	.probe = visconti_csi2rx_probe,
+	.remove = visconti_csi2rx_remove,
+	.driver = {
+		.name = "visconti_csi2rx_dev",
+		.of_match_table = visconti_csi2rx_of_table,
+	},
+};
+
+module_platform_driver(visconti_csi2rx_driver);
+
+MODULE_AUTHOR("Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>");
+MODULE_DESCRIPTION("Toshiba Visconti CSI-2 receiver driver");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1



