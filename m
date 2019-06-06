Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F653711E
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 12:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbfFFKBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 06:01:13 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:52849 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726972AbfFFKBN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 06:01:13 -0400
X-UUID: 8d9a37b8172f4df18f59827753b41562-20190606
X-UUID: 8d9a37b8172f4df18f59827753b41562-20190606
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw01.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 1514416606; Thu, 06 Jun 2019 18:00:40 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 6 Jun 2019 18:00:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 6 Jun 2019 18:00:39 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <holmes.chiou@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>
Subject: [RFC PATCH V3 1/4] media: platform: mtk-isp: Add Mediatek sensor interface driver
Date:   Thu, 6 Jun 2019 18:00:30 +0800
Message-ID: <1559815233-24796-2-git-send-email-louis.kuo@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
References: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds Mediat:ek's sensor interface driver. Sensor interface
driver
is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
It support a widely adopted, simple, high-speed protocol primarily
intended
for point-to-point image and video transmission between cameras and host
devices.

The mtk-isp directory will contain drivers for multiple IP blocks found in
Mediatek ISP system. It will include ISP Pass 1 driver, sensor interface
driver, DIP driver and face detection driver.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 drivers/media/platform/Makefile                    |    2 +
 drivers/media/platform/mtk-isp/Makefile            |    3 +
 drivers/media/platform/mtk-isp/isp_50/Makefile     |    5 +
 .../media/platform/mtk-isp/isp_50/seninf/Makefile  |    6 +
 .../platform/mtk-isp/isp_50/seninf/mtk_seninf.c    | 1330 ++++++++++++++++++++
 .../mtk-isp/isp_50/seninf/mtk_seninf_def.h         |  155 +++
 .../mtk-isp/isp_50/seninf/mtk_seninf_reg.h         |  965 ++++++++++++++
 7 files changed, 2466 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
 create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h

diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 7cbbd92..b0f4543 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -73,6 +73,8 @@ obj-$(CONFIG_VIDEO_ROCKCHIP_RGA)	+= rockchip/rga/
 
 obj-y	+= omap/
 
+obj-y	+= mtk-isp/
+
 obj-$(CONFIG_VIDEO_AM437X_VPFE)		+= am437x/
 
 obj-$(CONFIG_VIDEO_XILINX)		+= xilinx/
diff --git a/drivers/media/platform/mtk-isp/Makefile b/drivers/media/platform/mtk-isp/Makefile
new file mode 100644
index 0000000..c17fb3f
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += isp_50/
diff --git a/drivers/media/platform/mtk-isp/isp_50/Makefile b/drivers/media/platform/mtk-isp/isp_50/Makefile
new file mode 100644
index 0000000..8b4a792
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifeq ($(CONFIG_MTK_SENINF),y)
+obj-y += seninf/
+endif
diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile b/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
new file mode 100644
index 0000000..bf193fe
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+MODULE		= mtk_seninf
+LIB_FILES	= mtk_seninf
+
+obj-$(CONFIG_MTK_SENINF) += mtk_seninf.o
diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
new file mode 100644
index 0000000..e791110
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
@@ -0,0 +1,1330 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/pm_runtime.h>
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/of_graph.h>
+#include <linux/of_irq.h>
+#ifdef CONFIG_COMPAT
+#include <linux/compat.h>
+#endif
+#include <linux/videodev2.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-async.h>
+#include "mtk_seninf_reg.h"
+#include "mtk_seninf_def.h"
+
+#define SUBDEV_SENSOR_MAIN_NAME		"sensor_main"
+#define SUBDEV_SENSOR_SUB_NAME		"sensor_sub"
+#define MTK_CAM_SENINF_PAD_MAIN_SINK		0
+#define MTK_CAM_SENINF_PAD_SUB_SINK		1
+#define MIPI_SENSOR_TYPE MIPI_OPHY_NCSI2
+
+static inline void mt_reg_sync_writel(unsigned int v, void *a)
+{
+	__raw_writel((v), (void __force __iomem *)((a)));
+}
+
+static inline unsigned int seninf_read_reg
+	(void *reg_base, unsigned int reg_name)
+{
+	return (unsigned int)ioread32(reg_base + reg_name);
+}
+
+static inline void seninf_write_reg
+	(void *reg_base, unsigned int reg_name,
+	unsigned int value)
+{
+	mt_reg_sync_writel(value, reg_base + reg_name);
+}
+
+static inline void write_master
+	(void *reg_base, unsigned int reg_name,
+	unsigned int value, unsigned int mask)
+{
+	mt_reg_sync_writel((ioread32(reg_base + reg_name) & ~(mask)) |
+		value, reg_base + reg_name);
+}
+
+static inline int is_4d1c(unsigned int port)
+{
+	return (port < CFG_CSI_PORT_0A);
+}
+
+static inline int is_cdphy_combo(unsigned int port)
+{
+	return (port == CFG_CSI_PORT_0A ||
+		port == CFG_CSI_PORT_0B ||
+		port == CFG_CSI_PORT_0);
+}
+
+static struct seninf_csi_info SENINF_CSI_INFO[CFG_CSI_PORT_MAX_NUM] = {
+	{CFG_CSI_PORT_0,  SENINF_1},
+	{CFG_CSI_PORT_1,  SENINF_3},
+	{CFG_CSI_PORT_2,  SENINF_5},
+	{CFG_CSI_PORT_0A, SENINF_1},
+	{CFG_CSI_PORT_0B, SENINF_2},
+};
+
+struct _seninf {
+	struct v4l2_subdev subdev;
+	struct v4l2_async_notifier notifier;
+	struct device *dev;
+	struct v4l2_fwnode_endpoint ep[NUM_PORTS];
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct media_pad pads[NUM_PADS];
+	struct clk *cam_clk, *top_mux_clk;
+	unsigned int port;
+	struct v4l2_subdev_format fmt;
+	unsigned int mux_select;
+	void __iomem *base_reg;
+	void __iomem *rx_reg;
+	unsigned char *csi2_rx[CFG_CSI_PORT_MAX_NUM];
+};
+
+static int set_top_mux_ctrl(struct _seninf *priv,
+			    unsigned int mux_idx,
+			    unsigned int seninf_src)
+{
+	void *pseninf = priv->base_reg;
+
+	seninf_write_reg(pseninf, SENINF_TOP_MUX_CTRL,
+			 ((seninf_read_reg(pseninf, SENINF_TOP_MUX_CTRL) &
+			 (~(0xF << (mux_idx * 4)))) | ((seninf_src & 0xF)
+			 << (mux_idx * 4))));
+
+	return 0;
+}
+
+static void set_mux_ctrl
+	(struct _seninf *priv, unsigned int mux,
+	unsigned int input_data_type)
+{
+	void *pseninf = priv->base_reg + 0x1000 * mux;
+	unsigned int temp;
+	unsigned int pix_sel_ext;
+	unsigned int pix_sel;
+	unsigned int hs_pol = 0;
+	unsigned int vs_pol = 0;
+	unsigned int pixel_mode = ONE_PIXEL_MODE;
+	unsigned int src_type_sel = MIPI_SENSOR;
+
+	write_master(pseninf, SENINF1_MUX_CTRL,
+		     (src_type_sel << 12), 0x0000F000);
+	temp = (src_type_sel == TEST_MODEL) ? 0 : 1;
+	write_master(pseninf, SENINF1_MUX_CTRL_EXT,
+		     (temp << 0), 0x00000003);
+
+	switch (pixel_mode) {
+	case 1: /* 2 Pixel */
+		pix_sel_ext = 0;
+		pix_sel = 1 << 8;
+		break;
+	case 2: /* 4 Pixel */
+		pix_sel_ext = 1 << 4;
+		pix_sel = 0;
+		break;
+	default: /* 1 Pixel */
+		pix_sel_ext = 0;
+		pix_sel = 0;
+		break;
+	}
+
+	write_master(pseninf, SENINF1_MUX_CTRL_EXT, pix_sel_ext, 0x00000010);
+	write_master(pseninf, SENINF1_MUX_CTRL, pix_sel, 0x00000100);
+
+	if (input_data_type != JPEG_FMT)
+		write_master(pseninf, SENINF1_MUX_CTRL,
+			     (2 << 28), 0x30000000);
+	else
+		write_master(pseninf, SENINF1_MUX_CTRL, 0, 0x30000000);
+
+	if (src_type_sel == CSI2 || src_type_sel >= MIPI_SENSOR) {
+		/* Need to use Default for New design */
+		if (input_data_type != JPEG_FMT)
+			write_master(pseninf, SENINF1_MUX_CTRL,
+				     ((0x1B << 22) | (0x1F << 16)),
+				     0x0FFF0000);
+		else
+			write_master(pseninf, SENINF1_MUX_CTRL,
+				     ((0x18 << 22) | (0x1E << 16)),
+				     0x0FFF0000);
+	}
+
+	write_master(pseninf, SENINF1_MUX_CTRL,
+		     ((hs_pol << 10) | (vs_pol << 9)), 0x00000600);
+
+	temp = seninf_read_reg(pseninf, SENINF1_MUX_CTRL);
+	seninf_write_reg(pseninf, SENINF1_MUX_CTRL, temp | 0x3);
+	seninf_write_reg(pseninf, SENINF1_MUX_CTRL, temp & 0xFFFFFFFC);
+}
+
+static void enable_mux(struct _seninf *priv, unsigned int mux)
+{
+	void *pseninf = priv->base_reg + 0x1000 * mux;
+
+	write_master(pseninf, SENINF1_MUX_CTRL, (1 << 31), 0x80000000);
+}
+
+static struct seninf_csi_info *get_csi_info(struct _seninf *priv,
+					    unsigned int mipi_port)
+{
+	int i;
+
+	for (i = 0; i < CFG_CSI_PORT_MAX_NUM; i++) {
+		if (SENINF_CSI_INFO[i].port == mipi_port)
+			return &SENINF_CSI_INFO[i];
+	}
+
+	return NULL;
+}
+
+static void set_dphy
+	(struct _seninf *priv,
+	struct seninf_csi_mipi *pcsi_mipi)
+{
+	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
+	void *pmipi_rx_base = priv->csi2_rx[CFG_CSI_PORT_0];
+	void *pmipi_rx = priv->csi2_rx[csi_info->port];
+	void *pmipi_rx_conf = priv->base_reg + 0x1000 * csi_info->seninf;
+
+	/* Set analog phy mode to DPHY */
+	if (is_cdphy_combo(csi_info->port))
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A, 0, 0x00000001);
+	/* 4D1C: MIPIRX_ANALOG_A_BASE = 0x00001A42 */
+	if (is_4d1c(csi_info->port))
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
+			     (1 << 6) | (1 << 9) | (1 << 11) | (1 << 12),
+			     0x00001B60);
+	else /* MIPIRX_ANALOG_BASE = 0x102 */
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
+			     (1 << 8), 0x00001B60);
+
+	if (is_cdphy_combo(csi_info->port))
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B, 0, 0x00000001);
+
+	/* Only 4d1c need set CSIB: MIPIRX_ANALOG_B_BASE = 0x00001242 */
+	if (is_4d1c(csi_info->port))
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
+			     (1 << 6) | (1 << 9) | (1 << 12), 0x00001B60);
+	else /* MIPIRX_ANALOG_BASE = 0x102 */
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
+			     (1 << 8) | (1 << 9), 0x00001B40);
+
+	/* Byte clock invert */
+	write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
+		     (1 << 0) | (1 << 1) | (1 << 2), 0x00000007);
+	if (is_4d1c(csi_info->port))
+		write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
+			     (1 << 0) | (1 << 1) | (1 << 2),
+			     0x00000007);
+
+	/* Start ANA EQ tuning */
+	if (is_cdphy_combo(csi_info->port)) {
+		write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
+			     (1 << 4) | (1 << 6), 0x000000F0);
+		write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
+			     (1 << 20) | (1 << 22), 0x00F00000);
+		write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
+			     (1 << 20) | (1 << 22), 0x00F00000);
+
+		if (is_4d1c(csi_info->port)) { /* 4d1c */
+			write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
+				     (1 << 4) | (1 << 6), 0x000000F0);
+			write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
+				     (1 << 20) | (1 << 22),
+				     0x00F00000);
+			write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
+				     (1 << 20) | (1 << 22),
+				     0x00F00000);
+		}
+	} else {
+		write_master(pmipi_rx, MIPI_RX_ANA18_CSI1A,
+			     (1 << 4) | (1 << 6) | (1 << 20) |
+			     (1 << 22), 0x00F000F0);
+		write_master(pmipi_rx, MIPI_RX_ANA1C_CSI1A,
+			     (1 << 4) | (1 << 6), 0x000000F0);
+
+		if (is_4d1c(csi_info->port)) { /* 4d1c */
+			write_master(pmipi_rx,
+				     MIPI_RX_ANA18_CSI1B, (1 << 4) |
+				     (1 << 6) | (1 << 20) |
+				     (1 << 22), 0x00F000F0);
+			write_master(pmipi_rx,
+				     MIPI_RX_ANA1C_CSI1B, (1 << 4) |
+				     (1 << 6), 0x000000F0);
+		}
+	}
+
+	/* End ANA EQ tuning */
+	seninf_write_reg(pmipi_rx_base, MIPI_RX_ANA40_CSI0A, 0x90);
+	write_master(pmipi_rx, MIPI_RX_ANA24_CSI0A,
+		     (0x40 << 24), 0xFF000000);
+	if (is_4d1c(csi_info->port))
+		write_master(pmipi_rx, MIPI_RX_ANA24_CSI0B,
+			     (0x40 << 24), 0xFF000000);
+	write_master(pmipi_rx, MIPI_RX_WRAPPER80_CSI0A, 0, 0x00030000);
+	if (is_4d1c(csi_info->port))
+		write_master(pmipi_rx, MIPI_RX_WRAPPER80_CSI0B, 0, 0x00030000);
+	/* ANA power on */
+	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
+		     (1 << 3), 0x00000008);
+	if (is_4d1c(csi_info->port))
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
+			     (1 << 3), 0x00000008);
+	usleep_range(20, 40);
+	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
+		     (1 << 3), 0x00000008);
+	if (is_4d1c(csi_info->port))
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
+			     (1 << 2), 0x00000004);
+	udelay(1);
+	/* 4d1c: MIPIRX_CONFIG_CSI_BASE = 0xC9000000; */
+	if (is_4d1c(csi_info->port)) {
+		write_master(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
+			     (1 << 24) | (2 << 26) | (3 << 30), 0xFF000000);
+	} else { /* 2d1c: MIPIRX_CONFIG_CSI_BASE = 0xE4000000; */
+		write_master(pmipi_rx_conf, MIPI_RX_CON24_CSI0,
+			     (1 << 26) | (2 << 28) | (3 << 30), 0xFF000000);
+	}
+	pr_debug("pcsi_mipi->CSI2_IP %d, MIPI_RX_CON24_CSI0 0x%x\n",
+		 csi_info->port,
+		 seninf_read_reg(pmipi_rx_conf, MIPI_RX_CON24_CSI0));
+	usleep_range(20, 40);
+	/* D-PHY SW Delay Line calibration */
+}
+
+static void set_cphy
+	(struct _seninf *priv,
+	struct seninf_csi_mipi *pcsi_mipi)
+{ /* Cphy setting for CSI0 */
+	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
+	void *pmipi_rx = priv->csi2_rx[csi_info->port];
+	int status;
+	int i;
+
+	/* Byte clock invert */
+	write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0A,
+		     (1 << 0) | (1 << 2), 0x00000005);
+	write_master(pmipi_rx, MIPI_RX_ANAA8_CSI0B,
+		     (1 << 0) | (1 << 2), 0x00000005);
+	/* EQ Power to Enhance Speed */
+	write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
+		     (1 << 6) | (1 << 22), 0x00C000C0);
+	write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
+		     (1 << 6) | (1 << 22), 0x00C000C0);
+	write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
+		     (1 << 6) | (1 << 22), 0x00C000C0);
+	write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
+		     (1 << 6) | (1 << 22), 0x00C000C0);
+	write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
+		     (1 << 6) | (1 << 22), 0x00C000C0);
+	write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
+		     (1 << 6) | (1 << 22), 0x00C000C0);
+
+	/* CDR register setting */
+
+	*((int *)(priv->csi2_rx[csi_info->port] + 0x30)) = 0x06040404;
+	*((int *)(priv->csi2_rx[csi_info->port] + 0x3c)) = 0x06040404;
+	*((int *)(priv->csi2_rx[csi_info->port] + 0x34)) = 0x1;
+	*((int *)(priv->csi2_rx[csi_info->port] + 0x28)) = 0x1;
+
+	*((int *)(priv->csi2_rx[csi_info->port] + 0x1030)) =
+		0x06040404;
+	*((int *)(priv->csi2_rx[csi_info->port] + 0x103c)) =
+		0x06040404;
+	*((int *)(priv->csi2_rx[csi_info->port] + 0x1034)) = 0x1;
+	*((int *)(priv->csi2_rx[csi_info->port] + 0x1028)) = 0x1;
+
+	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
+		     (1 << 0), 0x00001B61);
+	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
+		     (1 << 0), 0x00001B61);
+	/* Power on DPHY */
+	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
+		     (1 << 3), 0x00000008);
+	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
+		     (1 << 3), 0x00000008);
+	usleep_range(20, 40);
+	/* Enable LPF */
+	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
+		     (1 << 2), 0x00000004);
+	write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
+		     (1 << 2), 0x00000004);
+	udelay(1);
+	/* Offset calibration */
+	write_master(pmipi_rx, MIPI_RX_ANA18_CSI0A,
+		     (1 << 0) | (1 << 16), 0x00010001);
+	write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0A,
+		     (1 << 0) | (1 << 16), 0x00010001);
+	write_master(pmipi_rx, MIPI_RX_ANA20_CSI0A,
+		     (1 << 0) | (1 << 16), 0x00010001);
+	write_master(pmipi_rx, MIPI_RX_ANA18_CSI0B,
+		     (1 << 0) | (1 << 16), 0x00010001);
+	write_master(pmipi_rx, MIPI_RX_ANA1C_CSI0B,
+		     (1 << 0) | (1 << 16), 0x00010001);
+	write_master(pmipi_rx, MIPI_RX_ANA20_CSI0B,
+		     (1 << 0) | (1 << 16), 0x00010001);
+	udelay(1);
+
+	i = 0;
+	while (1) {
+		status = seninf_read_reg(pmipi_rx,
+					 MIPI_RX_ANA48_CSI0A);
+		if ((status & 0x3f) == 0x3f)
+			break;
+		i++;
+		if (i > 100) {
+			pr_debug("CSIA offset calibration timeout\n");
+			break;
+		}
+		usleep_range(20, 40);
+	}
+
+	i = 0;
+	while (1) {
+		status = seninf_read_reg(pmipi_rx,
+					 MIPI_RX_ANA48_CSI0B);
+		if ((status & 0x3f) == 0x3f)
+			break;
+		i++;
+		if (i > 100) {
+			pr_debug("CSIB offset calibration timeout\n");
+			break;
+		}
+		usleep_range(20, 40);
+	}
+}
+
+static void set_csi_mipi
+	(struct _seninf *priv,
+	struct seninf_csi_mipi *pcsi_mipi)
+{
+	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
+	void *seninf_base = priv->base_reg;
+	void *pseninf = priv->base_reg + 0x1000 * csi_info->seninf;
+	void *pmipi_rx = priv->csi2_rx[csi_info->port];
+	unsigned int cal_sel;
+	unsigned int mipi_enable = 1;
+	unsigned int data_header_order = 1;
+	unsigned int pad_sel = PAD_10BIT;
+	unsigned int csi_type = (MIPI_SENSOR_TYPE == MIPI_CPHY)
+		? CSI2_2_5G_CPHY : CSI2_2_5G;
+
+	pr_debug("IS_4D1C %d csi_type %d port %d\n",
+		 is_4d1c(csi_info->port), csi_type, csi_info->port);
+
+	switch (csi_info->port) {
+	case CFG_CSI_PORT_1:
+		cal_sel = 1;
+		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI1,
+			     ((2 << 8) | (mipi_enable << 31)), 0x80000701);
+		break;
+	case CFG_CSI_PORT_2:
+		cal_sel = 2;
+		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI2,
+			     ((2 << 8) | (mipi_enable << 31)), 0x80000701);
+		break;
+	case CFG_CSI_PORT_0:
+		cal_sel = 0;
+		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
+			     ((2 << 8) |
+			     (mipi_enable << 31)), 0x80000701);
+		break;
+	case CFG_CSI_PORT_0A:
+	case CFG_CSI_PORT_0B:
+		cal_sel = 0;
+		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
+			     ((1 << 8) | (1 << 12) |
+			     (mipi_enable << 31)), 0x80003701);
+		break;
+	default:
+		pr_err("unsupported CSI configuration\n");
+		cal_sel = 0;
+		write_master(seninf_base, SENINF_TOP_PHY_SENINF_CTL_CSI0,
+			     ((2 << 8) |
+			     (mipi_enable << 31)), 0x80000701);
+		break;
+	}
+
+	/* First Enable Sensor interface and select pad (0x1a04_0200) */
+	write_master(pseninf, SENINF1_CTRL,
+		     mipi_enable << 0, 0x00000001);
+	write_master(pseninf, SENINF1_CTRL,
+		     pad_sel << 28, 0x70000000);
+
+	if (csi_type == CSI2_1_5G || csi_type == CSI2_2_5G) {
+		write_master(pseninf, SENINF1_CTRL, 0, 0x0000F000);
+		write_master(pseninf, SENINF1_CTRL_EXT,
+			     (mipi_enable << 6), 0x00000060);
+	}
+	if (!mipi_enable) {
+		seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
+				 seninf_read_reg(pseninf, SENINF1_CSI2_CTL) &
+				 0xFFFFFFE0);
+		/* Disable mipi BG */
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A, 0, 0x0000000C);
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B, 0, 0x0000000C);
+		return;
+	}
+
+	if (csi_type != CSI2_2_5G_CPHY)
+		set_dphy(priv, pcsi_mipi);
+	else
+		set_cphy(priv, pcsi_mipi);
+
+	/* DPCM Enable */
+	seninf_write_reg(pseninf, SENINF1_CSI2_DPCM,
+			 1 << ((pcsi_mipi->dpcm == 0x2a)
+			 ? 15 : ((pcsi_mipi->dpcm & 0xF) + 7)));
+
+	pr_debug("CSI2-%d cnt:%d LaneNum:%d CSI2_EN:%d HeadOrder:%d dpcm:%d\n",
+		 cal_sel, SENINF_SETTLE_DELAY,
+		 (int)(pcsi_mipi->data_lane_num + 1), (int)mipi_enable,
+		 (int)data_header_order, (int)pcsi_mipi->dpcm);
+
+	/* Settle delay */
+	write_master(pseninf, SENINF1_CSI2_LNRD_TIMING,
+		     (SENINF_SETTLE_DELAY << 8), 0x0000FF00);
+	/* CSI2 control */
+	if (csi_type != CSI2_2_5G_CPHY) { /* DPhy */
+		seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
+				 (seninf_read_reg(pseninf, SENINF1_CSI2_CTL) |
+				 (data_header_order << 16) |
+				 (mipi_enable << 4) |
+				 (((1 << (pcsi_mipi->data_lane_num + 1)) - 1)
+				 )));
+		write_master(pseninf, SENINF1_CSI2_RESYNC_MERGE_CTL,
+			     (3 << 0), 0x00000C07);
+		write_master(pseninf, SENINF1_CSI2_MODE, 0, 0x000007FF);
+		write_master(pseninf, SENINF1_CSI2_DPHY_SYNC,
+			     (0xff00 << 0) | (0x001d << 16), 0xFFFFFFFF);
+		seninf_write_reg(pseninf, SENINF1_CSI2_SPARE0,
+				 seninf_read_reg(pseninf, SENINF1_CSI2_SPARE0)
+				 & 0xFFFFFFFE);
+	} else {
+		/* CPhy */
+		unsigned int temp;
+
+		write_master(pseninf, SENINF1_CSI2_LNRD_TIMING, 0, 0x000000FF);
+		seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
+				 (seninf_read_reg(pseninf, SENINF1_CSI2_CTL) |
+				 data_header_order << 16));
+		temp = (pcsi_mipi->data_lane_num == SENSOR_MIPI_1_LANE) ? 1 :
+			(pcsi_mipi->data_lane_num == SENSOR_MIPI_2_LANE) ? 2 :
+			(pcsi_mipi->data_lane_num == SENSOR_MIPI_3_LANE) ?
+			4 : 5;
+		write_master(pseninf, SENINF1_CSI2_MODE,
+			     (temp << 8), 0x00000700);
+		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_1_LANE;
+		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
+			     (temp << 0), 0x00000001);
+		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_2_LANE;
+		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
+			     (temp << 2), 0x00000004);
+		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_3_LANE;
+		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
+			     (temp << 4), 0x00000010);
+		temp = pcsi_mipi->data_lane_num >= SENSOR_MIPI_4_LANE;
+		write_master(pseninf, SENINF1_CSI2_CTRL_TRIO_CON,
+			     (temp << 6), 0x00000040);
+		write_master(pseninf, SENINF1_CSI2_MODE,
+			     (0x2 << 0), 0x000000FF);
+		write_master(pseninf, SENINF1_CSI2_RESYNC_MERGE_CTL,
+			     (3 << 0) | (1 << 11), 0x00000C07);
+		write_master(pseninf, SENINF1_SYNC_RESYNC_CTL,
+			     (1 << 0), 0x00000007);
+		write_master(pseninf, SENINF1_POST_DETECT_CTL,
+			     (1 << 1), 0x00000002);
+
+		seninf_write_reg(pseninf, SENINF1_CSI2_SPARE0,
+				 seninf_read_reg(pseninf, SENINF1_CSI2_SPARE0)
+				 | 0x1);
+	}
+
+	write_master(pseninf, SENINF1_CSI2_CTL, (1 << 25), 0x0A000080);
+	write_master(pseninf, SENINF1_CSI2_HS_TRAIL,
+		     (SENINF_HS_TRAIL_PARAMETER << 0), 0x000000FF);
+
+	/* Set debug port to output packet number */
+	seninf_write_reg(pseninf, SENINF1_CSI2_DGB_SEL, 0x8000001A);
+	/* Enable CSI2 IRQ mask */
+	/* Turn on all interrupt */
+	seninf_write_reg(pseninf, SENINF1_CSI2_INT_EN, 0xFFFFFFFF);
+	/* Write clear CSI2 IRQ */
+	seninf_write_reg(pseninf, SENINF1_CSI2_INT_STATUS, 0xFFFFFFFF);
+	/* Enable CSI2 Extend IRQ mask */
+	/* Turn on all interrupt */
+	seninf_write_reg(pseninf, SENINF1_CSI2_INT_EN_EXT, 0x0000001f);
+
+	write_master(pseninf, SENINF1_CTRL, (1 << 7), 0x00000080);
+	udelay(1);
+	write_master(pseninf, SENINF1_CTRL, 0, 0x00000080);
+}
+
+static void power_off(struct _seninf *priv, void *pcsi)
+{
+	struct seninf_csi_mipi *pcsi_mipi = (struct seninf_csi_mipi *)pcsi;
+	struct seninf_csi_info *csi_info = pcsi_mipi->csi_info;
+	void *pmipi_rx = priv->csi2_rx[csi_info->port];
+	void *pseninf = priv->base_reg + 0x1000 * csi_info->seninf;
+
+	/* Disable CSI2(2.5G) first */
+	seninf_write_reg(pseninf, SENINF1_CSI2_CTL,
+			 seninf_read_reg(pseninf, SENINF1_CSI2_CTL)
+			 & 0xFFFFFFE0);
+	/* Disable mipi BG */
+	switch (csi_info->port) {
+	case CFG_CSI_PORT_0A:
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
+			     0, 0x0000000C);
+		break;
+	case CFG_CSI_PORT_0B:
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
+			     0, 0x0000000C);
+		break;
+	default:
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0A,
+			     0, 0x0000000C);
+		write_master(pmipi_rx, MIPI_RX_ANA00_CSI0B,
+			     0, 0x0000000C);
+		break;
+	}
+}
+
+static int seninf_subscribe_event(struct v4l2_subdev *sd,
+				  struct v4l2_fh *fh,
+				  struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static int map_fmt
+	(struct _seninf *priv,
+	struct seninf_csi_mipi *pcsi_mipi)
+{
+	int fmtidx;
+
+	switch (priv->fmt.format.code) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		fmtidx = 0;
+		pcsi_mipi->dpcm = 0;
+		break;
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+		fmtidx = 1;
+		pcsi_mipi->dpcm = 0;
+		break;
+	case MEDIA_BUS_FMT_SGRBG10_DPCM8_1X8:
+	case MEDIA_BUS_FMT_SRGGB10_DPCM8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_DPCM8_1X8:
+	case MEDIA_BUS_FMT_SGBRG10_DPCM8_1X8:
+		fmtidx = 0;
+		/* dpcm mode 0x2a, */
+		pcsi_mipi->dpcm = 0x2a;
+		break;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		fmtidx = 2;
+		pcsi_mipi->dpcm = 0;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
+		fmtidx = 3;
+		pcsi_mipi->dpcm = 0;
+		break;
+	case MEDIA_BUS_FMT_JPEG_1X8:
+	case MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8:
+		fmtidx = 7;
+		pcsi_mipi->dpcm = 0;
+		break;
+	default:
+		fmtidx = 0;
+		pcsi_mipi->dpcm = 0;
+		WARN(1, "CSI2: pixel format %08x unsupported!\n",
+		     priv->fmt.format.code);
+		break;
+	}
+	return fmtidx;
+}
+
+static void init_fmt(struct _seninf *priv)
+{
+	priv->fmt.format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+	priv->fmt.format.width = DEFAULT_WIDTH;
+	priv->fmt.format.height = DEFAULT_HEIGHT;
+	priv->fmt.format.field = V4L2_FIELD_NONE;
+	priv->fmt.format.colorspace = V4L2_COLORSPACE_SRGB;
+	priv->fmt.format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	priv->fmt.format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	priv->fmt.format.quantization = V4L2_QUANTIZATION_DEFAULT;
+}
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+	.width = DEFAULT_WIDTH,
+	.height = DEFAULT_HEIGHT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+	.quantization = V4L2_QUANTIZATION_DEFAULT,
+};
+
+static int seninf_init_cfg
+				(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_mbus_framefmt *mf;
+	unsigned int i;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		mf = v4l2_subdev_get_try_format(sd, cfg, i);
+		*mf = fmt_default;
+	}
+
+	return 0;
+}
+
+static int seninf_set_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
+	} else {
+		priv->fmt.format.code = fmt->format.code;
+		priv->fmt.format.width = fmt->format.width;
+		priv->fmt.format.height = fmt->format.height;
+	}
+
+	pr_debug("set format 0x%x\n", priv->fmt.format.code);
+
+	return 0;
+}
+
+static int seninf_get_fmt(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_pad_config *cfg,
+			  struct v4l2_subdev_format *fmt)
+{
+	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
+	} else {
+		fmt->format.code = priv->fmt.format.code;
+		fmt->format.width = priv->fmt.format.width;
+		fmt->format.height = priv->fmt.format.height;
+		fmt->format.field = priv->fmt.format.field;
+		fmt->format.colorspace = priv->fmt.format.colorspace;
+		fmt->format.xfer_func = priv->fmt.format.xfer_func;
+		fmt->format.ycbcr_enc = priv->fmt.format.ycbcr_enc;
+		fmt->format.quantization = priv->fmt.format.quantization;
+	}
+	pr_debug("get format 0x%x\n", priv->fmt.format.code);
+	return 0;
+}
+
+static int seninf_s_stream(struct v4l2_subdev *sd, int on)
+{
+	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
+	struct seninf_csi_mipi csi_mipi;
+	struct seninf_csi_info *csi_info;
+	unsigned int mux_select;
+	unsigned int input_data_type;
+	unsigned int port;
+	unsigned int seninf_src;
+	unsigned char sensor_mipi_lane_num =
+		priv->ep[priv->port].bus.mipi_csi2.num_data_lanes;
+	void *pseninf = priv->base_reg;
+
+	mux_select = priv->mux_select;
+	port = priv->port;
+	csi_info = get_csi_info(priv, port);
+	seninf_src = csi_info->seninf;
+
+	pr_debug("seninf csi_info->seninf(%d) port(%d)\n",
+		 csi_info->seninf, csi_info->port);
+
+	/* Configure Mipi */
+	csi_mipi.data_lane_num = sensor_mipi_lane_num - 1;
+	csi_mipi.csi_info = csi_info;
+	input_data_type = (unsigned int)map_fmt(priv, &csi_mipi);
+
+	if (on) {
+		/* Configure timestamp */
+		write_master(pseninf, SENINF1_CTRL, (1 << 0), 0x00000001);
+		write_master(pseninf, SENINF1_CTRL_EXT, (1 << 6), 0x00000040);
+		seninf_write_reg(pseninf, SENINF_TG1_TM_STP,
+				 SENINF_TIMESTAMP_STEP);
+
+		set_csi_mipi(priv, &csi_mipi);
+
+		enable_mux(priv, mux_select);
+		set_mux_ctrl(priv, mux_select, input_data_type);
+
+		set_top_mux_ctrl(priv, mux_select, seninf_src);
+		seninf_write_reg(pseninf, SENINF_TOP_CAM_MUX_CTRL, 0x0);
+	} else {
+		power_off(priv, &csi_mipi);
+	}
+
+	return 0;
+};
+
+static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops = {
+	.init_cfg = seninf_init_cfg,
+	.set_fmt = seninf_set_fmt,
+	.get_fmt = seninf_get_fmt,
+};
+
+static const struct v4l2_subdev_video_ops seninf_subdev_video_ops = {
+	.s_stream = seninf_s_stream,
+};
+
+static struct v4l2_subdev_core_ops seninf_subdev_core_ops = {
+	.subscribe_event	= seninf_subscribe_event,
+	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
+};
+
+static struct v4l2_subdev_ops seninf_subdev_ops = {
+	.core	= &seninf_subdev_core_ops,
+	.video	= &seninf_subdev_video_ops,
+	.pad	= &seninf_subdev_pad_ops,
+};
+
+static int seninf_link_setup(struct media_entity *entity,
+			     const struct media_pad *local,
+			     const struct media_pad *remote, u32 flags)
+{
+	struct v4l2_subdev *sd;
+	struct _seninf *priv;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+	priv = v4l2_get_subdevdata(sd);
+	pr_debug("mtk_seninf: remote %d-%d, local %d-%d\n",
+		 remote->entity->graph_obj.id, remote->index,
+		 local->entity->graph_obj.id, local->index);
+	pr_debug("local->flags %d flags %d\n", local->flags, flags);
+
+	if ((local->flags & MEDIA_PAD_FL_SOURCE) &&
+	    (flags & MEDIA_LNK_FL_ENABLED)) {
+		pr_info("set cam mux %d\n", local->index);
+/* Select cam mux, cam mux from pads 4~11,  pads 0~3 are used for sensor */
+		priv->mux_select = local->index - 4;
+	}
+
+	if ((local->flags & MEDIA_PAD_FL_SINK) &&
+	    (flags & MEDIA_LNK_FL_ENABLED)) {
+		pr_info("set port\n", local->index);
+		/* Select port */
+		priv->port = local->index;
+		if (priv->port > NUM_PORTS) {
+			pr_err("port index is over number of ports\n");
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
+static const struct media_entity_operations seninf_media_ops = {
+	.link_setup = seninf_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int mtk_seninf_notifier_bound(struct v4l2_async_notifier *notifier,
+				     struct v4l2_subdev *sd,
+				     struct v4l2_async_subdev *asd)
+{
+	struct _seninf *priv = container_of(notifier, struct _seninf, notifier);
+	struct device_node *node;
+	unsigned int pad, ret;
+	unsigned int is_sensor;
+	struct device_node *endpoint;
+
+	node = to_of_node(sd->fwnode);
+	dev_info(priv->dev, "%s bounded\n", sd->entity.name);
+
+	is_sensor = 0;
+	if (!strcmp(node->name, SUBDEV_SENSOR_MAIN_NAME)) {
+		pad = MTK_CAM_SENINF_PAD_MAIN_SINK;
+		is_sensor = 1;
+	}
+
+	if (!strcmp(node->name, SUBDEV_SENSOR_SUB_NAME)) {
+		pad = MTK_CAM_SENINF_PAD_SUB_SINK;
+		is_sensor = 1;
+	}
+
+	if (is_sensor == 1) {
+		for_each_endpoint_of_node(node, endpoint) {
+			ret = v4l2_fwnode_endpoint_parse
+				(of_fwnode_handle(endpoint),
+				&priv->ep[pad]);
+			of_node_put(endpoint);
+			dev_info(priv->dev, "ep %d, bus.mipi_csi2.num_data_lanes %d\n",
+				 pad,
+				 priv->ep[pad].bus.mipi_csi2.num_data_lanes);
+		}
+
+		ret = media_create_pad_link(&sd->entity, 0,
+					    &priv->subdev.entity, pad, 0);
+		dev_info
+			(priv->dev, "%s bounded with pad:%d\n",
+			sd->entity.name, pad);
+		if (ret) {
+			dev_err(priv->dev,
+				"failed to create link for %s\n",
+				sd->entity.name);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void mtk_seninf_notifier_unbind(struct v4l2_async_notifier *notifier,
+				       struct v4l2_subdev *sd,
+				       struct v4l2_async_subdev *asd)
+{
+	struct _seninf *priv = container_of(notifier, struct _seninf, notifier);
+
+	dev_info(priv->dev, "%s is unbounded\n", sd->entity.name);
+}
+
+static const struct v4l2_async_notifier_operations mtk_seninf_async_ops = {
+	.bound = mtk_seninf_notifier_bound,
+	.unbind = mtk_seninf_notifier_unbind,
+};
+
+static int mtk_seninf_fwnode_parse(struct device *dev,
+				   struct v4l2_fwnode_endpoint *vep,
+				   struct v4l2_async_subdev *asd)
+{
+	return 0;
+}
+
+static int seninf_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
+	int ret;
+
+	ret = pm_runtime_get_sync(priv->dev);
+	if (ret < 0) {
+		dev_err(priv->dev, "Failed to pm_runtime_get_sync: %d\n", ret);
+		return ret;
+	}
+
+	clk_prepare_enable(priv->cam_clk);
+	clk_prepare_enable(priv->top_mux_clk);
+
+	return ret;
+}
+
+static int seninf_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct _seninf *priv = container_of(sd, struct _seninf, subdev);
+
+	clk_disable_unprepare(priv->top_mux_clk);
+	clk_disable_unprepare(priv->cam_clk);
+	pm_runtime_put(priv->dev);
+
+	return 0;
+}
+
+#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
+static const struct v4l2_subdev_internal_ops seninf_internal_ops = {
+	.open = seninf_open,
+	.close = seninf_close,
+};
+#endif
+
+static irqreturn_t seninf_irq(int irq, void *device_id)
+{
+	return IRQ_HANDLED;
+}
+
+static int seninf_enable_test_pattern(struct _seninf *priv, u32 pattern)
+{
+	void *pseninf = priv->base_reg;
+
+	switch (pattern) {
+	case TEST_DISABLED:
+		break;
+	case TEST_GEN_PATTERN:
+		seninf_write_reg(pseninf, SENINF_TOP_CTRL, 0x00000C00);
+		seninf_write_reg(pseninf, SENINF1_CTRL, 0x00001001);
+		seninf_write_reg(pseninf, SENINF1_MUX_CTRL, 0x96DF1080);
+	    seninf_write_reg(pseninf, SENINF1_MUX_INTEN, 0x8000007F);
+		seninf_write_reg(pseninf, SENINF1_MUX_SPARE, 0x00000000);
+		seninf_write_reg(pseninf, SENINF1_MUX_CTRL_EXT, 0x000E2000);
+		seninf_write_reg(pseninf, SENINF1_MUX_CTRL_EXT, 0x00000000);
+		seninf_write_reg(pseninf, SENINF_TG1_TM_CTL, 0x000404C1);
+		seninf_write_reg
+			(pseninf, SENINF_TG1_TM_SIZE,
+			(priv->fmt.format.height + 0x100) << 16
+			| priv->fmt.format.width + 0x100);
+		seninf_write_reg(pseninf, SENINF_TG1_TM_CLK, 0x00000000);
+		seninf_write_reg(pseninf, SENINF_TG1_TM_STP, 0x1);
+		seninf_write_reg
+			(pseninf, SENINF1_CTRL_EXT, seninf_read_reg(pseninf,
+			SENINF1_CTRL_EXT) | 0x02);/* TESTMDL EN*/
+		break;
+	case TEST_DUMP_DEBUG_INFO:
+		/* Sensor Interface Control */
+		pr_info("SENINF_CSI2_CTL SENINF1:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n",
+			seninf_read_reg(pseninf, SENINF1_CSI2_CTL),
+			seninf_read_reg(pseninf, SENINF2_CSI2_CTL),
+			seninf_read_reg(pseninf, SENINF3_CSI2_CTL),
+			seninf_read_reg(pseninf, SENINF5_CSI2_CTL));
+		/* Read width/height */
+		/* Read interrupt status */
+		pr_info("SENINF1_IRQ:0x%x, 2:0x%x, 3:0x%x, 5:0x%x\n",
+			seninf_read_reg(pseninf, SENINF1_CSI2_INT_STATUS),
+			seninf_read_reg(pseninf, SENINF2_CSI2_INT_STATUS),
+			seninf_read_reg(pseninf, SENINF3_CSI2_INT_STATUS),
+			seninf_read_reg(pseninf, SENINF5_CSI2_INT_STATUS));
+		/* Mux1 */
+		pr_info("SENINF1_MUX_CTRL:0x%x, INTSTA:0x%x, DEBUG_2(0x%x)\n",
+			seninf_read_reg(pseninf, SENINF1_MUX_CTRL),
+			seninf_read_reg(pseninf, SENINF1_MUX_INTSTA),
+			seninf_read_reg(pseninf, SENINF1_MUX_DEBUG_2));
+		if (seninf_read_reg(pseninf, SENINF1_MUX_INTSTA) & 0x1) {
+			seninf_write_reg(pseninf, SENINF1_MUX_INTSTA,
+					 0xffffffff);
+			udelay(SENINF_DRV_DEBUG_DELAY);
+			pr_info("overrun CTRL:%x INTSTA:%x DEBUG_2:%x\n",
+				seninf_read_reg(pseninf, SENINF1_MUX_CTRL),
+				seninf_read_reg(pseninf, SENINF1_MUX_INTSTA),
+				seninf_read_reg(pseninf, SENINF1_MUX_DEBUG_2));
+		}
+		break;
+	default:
+		dev_warn(priv->dev, "%s Unhandled testcase:%d\n",
+			 __func__, pattern);
+		break;
+	}
+
+	return 0;
+}
+
+static int seninf_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct _seninf *priv = container_of(ctrl->handler,
+					     struct _seninf, ctrl_handler);
+	int ret;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		ret = seninf_enable_test_pattern(priv, ctrl->val);
+		break;
+	default:
+		ret = 0;
+		dev_warn(priv->dev, "%s Unhandled id:0x%x, val:0x%x\n",
+			 __func__, ctrl->id, ctrl->val);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops seninf_ctrl_ops = {
+	.s_ctrl = seninf_set_ctrl,
+};
+
+static const char * const seninf_test_pattern_menu[] = {
+	"Disabled",
+	"generate_test_pattern",
+	"dump_debug_info",
+};
+
+static int seninf_initialize_controls(struct _seninf *priv)
+{
+	struct v4l2_ctrl_handler *handler;
+	struct v4l2_ctrl *test_pattern;
+	int ret;
+
+	handler = &priv->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(handler, 2);
+	if (ret)
+		return ret;
+	test_pattern =
+	v4l2_ctrl_new_std_menu_items(handler, &seninf_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(seninf_test_pattern_menu) - 1,
+				     0, 0, seninf_test_pattern_menu);
+
+	if (handler->error) {
+		ret = handler->error;
+		dev_err(priv->dev,
+			"Failed to init controls(%d)\n", ret);
+		goto err_free_handler;
+	}
+
+	priv->subdev.ctrl_handler = handler;
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(handler);
+
+	return ret;
+}
+
+static int seninf_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct _seninf *priv;
+	struct v4l2_subdev *sd;
+	struct device *dev = &pdev->dev;
+	struct media_pad *pads;
+	unsigned int irq_info[3];
+	unsigned int irq;
+	int i;
+	int ret;
+
+	dev_dbg(dev, "seninf probe +\n");
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct _seninf), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	memset(priv, 0, sizeof(struct _seninf));
+	priv->dev = &pdev->dev;
+	sd = &priv->subdev;
+	pads = priv->pads;
+	/* Get IRQ ID and request IRQ */
+	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+
+	if (!irq) {
+		pr_debug("No IRQ found!!\n");
+		return 0;
+	}
+	/* Get IRQ Flag from device node */
+	if (of_property_read_u32_array(pdev->dev.of_node,
+				       "interrupts", irq_info,
+				       ARRAY_SIZE(irq_info))) {
+		dev_err(dev, "get irq flags from DTS fail!!\n");
+		return -ENODEV;
+	}
+	ret = request_irq(irq, seninf_irq,
+			  irq_info[2], "SENINF", NULL);
+	if (ret) {
+		dev_err(dev, "request_irq fail\n");
+		return ret;
+	}
+	pr_debug("Seninf devnode:%s, irq=%d\n",
+		 pdev->dev.of_node->name, irq);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "base_reg");
+	priv->base_reg = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->base_reg))
+		return PTR_ERR(priv->base_reg);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rx_reg");
+	priv->rx_reg = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->rx_reg))
+		return PTR_ERR(priv->rx_reg);
+
+	priv->csi2_rx[CFG_CSI_PORT_0]  = priv->rx_reg;
+	priv->csi2_rx[CFG_CSI_PORT_0A] = priv->rx_reg;
+	priv->csi2_rx[CFG_CSI_PORT_0B] = priv->rx_reg + 0x1000;
+	priv->csi2_rx[CFG_CSI_PORT_1]  = priv->rx_reg + 0x2000;
+	priv->csi2_rx[CFG_CSI_PORT_2]  = priv->rx_reg + 0x4000;
+
+	priv->cam_clk = devm_clk_get(dev, "CLK_CAM_SENINF");
+	if (IS_ERR(priv->cam_clk)) {
+		dev_err(dev, "Failed to get cam_clk\n");
+		return -EINVAL;
+	}
+
+	priv->top_mux_clk = devm_clk_get(dev, "CLK_TOP_MUX_SENINF");
+	if (IS_ERR(priv->top_mux_clk)) {
+		dev_err(dev, "Failed to get top_mux_clk\n");
+		return -EINVAL;
+	}
+
+	v4l2_subdev_init(sd, &seninf_subdev_ops);
+
+	init_fmt(priv);
+	ret = seninf_initialize_controls(priv);
+	if (ret) {
+		dev_err(dev, "Failed to initialize controls\n");
+		return ret;
+	}
+#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
+	sd->internal_ops = &seninf_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
+#endif
+	priv->subdev.dev = &pdev->dev;
+	snprintf(sd->name, V4L2_SUBDEV_NAME_SIZE, "%s.mipi-csi",
+		 dev_name(&pdev->dev));
+	v4l2_set_subdevdata(sd, priv);
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &seninf_media_ops;
+	for (i = 0; i < 4; i++)
+		pads[i].flags = MEDIA_PAD_FL_SINK;
+	for (i = 4; i < NUM_PADS; i++)
+		pads[i].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, NUM_PADS, pads);
+	if (ret < 0)
+		goto err_free_handler;
+#endif
+	ret = v4l2_async_notifier_parse_fwnode_endpoints
+		(dev, &priv->notifier, sizeof(struct v4l2_async_subdev),
+		 mtk_seninf_fwnode_parse);
+	if (ret < 0)
+		goto err_clean_entity;
+
+	if (!priv->notifier.num_subdevs) {
+		ret = -ENODEV;	/* no endpoint */
+		goto err_clean_entity;
+	}
+
+	priv->subdev.subdev_notifier = &priv->notifier;
+	priv->notifier.ops = &mtk_seninf_async_ops;
+	ret = v4l2_async_subdev_notifier_register(sd, &priv->notifier);
+	if (ret < 0) {
+		dev_err(dev, "v4l2 async notifier register failed\n");
+		goto err_clean_notififer;
+	}
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret < 0) {
+		dev_err(dev, "v4l2 async register subdev failed\n");
+		goto err_clean_notififer;
+	}
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_idle(dev);
+	dev_info(dev, "seninf probe -\n");
+	return 0;
+
+err_clean_notififer:
+	v4l2_async_notifier_cleanup(&priv->notifier);
+err_clean_entity:
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	media_entity_cleanup(&sd->entity);
+#endif
+err_free_handler:
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
+
+	return ret;
+}
+
+static int seninf_pm_suspend(struct device *dev)
+{
+	pr_debug("seninf_runtime_suspend\n");
+
+	return 0;
+}
+
+static int seninf_pm_resume(struct device *dev)
+{
+	pr_debug("seninf_runtime_resume\n");
+
+	return 0;
+}
+
+static const struct dev_pm_ops runtime_pm_ops = {
+	SET_RUNTIME_PM_OPS(seninf_pm_suspend,
+			   seninf_pm_resume,
+			   NULL)
+};
+
+static int seninf_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *subdev = platform_get_drvdata(pdev);
+	struct _seninf *priv = container_of(subdev, struct _seninf, subdev);
+	struct v4l2_subdev *sd = &priv->subdev;
+
+#if defined(CONFIG_MEDIA_CONTROLLER)
+	media_entity_cleanup(&sd->entity);
+#endif
+	v4l2_ctrl_handler_free(&priv->ctrl_handler);
+	v4l2_async_unregister_subdev(&priv->subdev);
+	pm_runtime_disable(priv->dev);
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id mtk_seninf_of_match[] = {
+	{.compatible = "mediatek,mt8183-seninf"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);
+#endif
+
+static int seninf_suspend(struct platform_device *pdev, pm_message_t mesg)
+{
+	return 0;
+}
+
+static int seninf_resume(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver seninf_pdrv = {
+	.probe	= seninf_probe,
+	.remove	= seninf_remove,
+	.suspend = seninf_suspend,
+	.resume = seninf_resume,
+	.driver	= {
+		.name	= "seninf",
+		.owner  = THIS_MODULE,
+#ifdef CONFIG_OF
+		.of_match_table = mtk_seninf_of_match,
+#endif
+		.pm  = &runtime_pm_ops,
+	},
+};
+
+static int __init mtk_seninf_init(void)
+{
+	int ret;
+
+	pr_debug("seninf Init\n");
+	ret = platform_driver_register(&seninf_pdrv);
+	if (ret) {
+		pr_err("Failed to register platform driver\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit mtk_seninf_exit(void)
+{
+	pr_debug("seninf Exit\n");
+	platform_driver_unregister(&seninf_pdrv);
+}
+
+late_initcall(mtk_seninf_init);
+module_exit(mtk_seninf_exit);
+
+MODULE_DESCRIPTION("MTK seninf driver");
+MODULE_AUTHOR("Louis Kuo <louis.kuo@mediatek.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("MTK:mtk_seninf");
diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
new file mode 100644
index 0000000..8d00b88
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SENINF_DRV_DEF_H__
+#define __SENINF_DRV_DEF_H__
+
+#if defined(SENINF_CLK_208M)
+#define SENINF_TIMESTAMP_STEP		0x67
+#define SENINF_SETTLE_DELAY		0x15
+#define SENINF_HS_TRAIL_PARAMETER	0x8
+#elif defined(SENINF_CLK_312M)
+#define SENINF_TIMESTAMP_STEP		0x9b
+#define SENINF_SETTLE_DELAY		0x20
+#define SENINF_HS_TRAIL_PARAMETER	0xa
+#else
+#define SENINF_TIMESTAMP_STEP		0x67
+#define SENINF_SETTLE_DELAY		0x15
+#define SENINF_HS_TRAIL_PARAMETER	0x8
+#endif
+
+#define SENINF_DRV_DEBUG_DELAY		1000
+
+#define SENSOR_CLOCK_POLARITY_HIGH	0
+#define SENSOR_CLOCK_POLARITY_LOW	1
+#define NUM_PADS			12
+#define NUM_PORTS			2
+#define DEFAULT_WIDTH			1600
+#define DEFAULT_HEIGHT			1200
+
+enum {
+	MIPI_OPHY_NCSI2 = 0,
+	MIPI_OPHY_CSI2  = 1,
+	MIPI_CPHY       = 2,
+};
+
+enum {
+	TEST_DISABLED = 0X0,
+	TEST_GEN_PATTERN,
+	TEST_DUMP_DEBUG_INFO,
+};
+
+enum {
+	CFG_CSI_PORT_0 = 0x0,	/* 4D1C */
+	CFG_CSI_PORT_1,		/* 4D1C */
+	CFG_CSI_PORT_2,		/* 4D1C */
+	CFG_CSI_PORT_0A,	/* 2D1C */
+	CFG_CSI_PORT_0B,	/* 2D1C */
+	CFG_CSI_PORT_MAX_NUM,
+	CFG_CSI_PORT_NONE	/*for non-MIPI sensor */
+};
+
+enum {
+	ONE_PIXEL_MODE  = 0x0,
+	TWO_PIXEL_MODE  = 0x1,
+	FOUR_PIXEL_MODE = 0x2,
+};
+
+#define SENINF_CAM_MUX_MIN      SENINF_MUX1
+#define SENINF_CAM_MUX_MAX      SENINF_MUX3
+#define SENINF_CAMSV_MUX_MIN    SENINF_MUX3
+#define SENINF_CAMSV_MUX_MAX    SENINF_MUX_NUM
+
+#define SENINF_PIXEL_MODE_CAM   TWO_PIXEL_MODE
+#define SENINF_PIXEL_MODE_CAMSV FOUR_PIXEL_MODE
+
+#define SENINF_TIMESTAMP_CLK    1000
+
+enum {
+	SENSOR_MIPI_1_LANE = 0,
+	SENSOR_MIPI_2_LANE,
+	SENSOR_MIPI_3_LANE,
+	SENSOR_MIPI_4_LANE
+};
+
+enum {
+	SENINF_MUX1 = 0x0,
+	SENINF_MUX2 = 0x1,
+	SENINF_MUX3 = 0x2,
+	SENINF_MUX4 = 0x3,
+	SENINF_MUX5 = 0x4,
+	SENINF_MUX6 = 0x5,
+	SENINF_MUX_NUM,
+	SENINF_MUX_ERROR = -1,
+};
+
+enum {
+	SENINF_1 = 0x0,
+	SENINF_2 = 0x1,
+	SENINF_3 = 0x2,
+	SENINF_4 = 0x3,
+	SENINF_5 = 0x4,
+	SENINF_NUM,
+};
+
+enum {
+	PAD_10BIT       = 0x0,
+	PAD_8BIT_7_0    = 0x3,
+	PAD_8BIT_9_2    = 0x4,
+};
+
+enum { /* 0:CSI2(2.5G), 3: parallel, 8:NCSI2(1.5G) */
+	CSI2            = 0x0, /* 2.5G support */
+	TEST_MODEL      = 0x1,
+	CCIR656         = 0x2,
+	PARALLEL_SENSOR = 0x3,
+	SERIAL_SENSOR   = 0x4,
+	HD_TV           = 0x5,
+	EXT_CSI2_OUT1   = 0x6,
+	EXT_CSI2_OUT2   = 0x7,
+	MIPI_SENSOR     = 0x8,/* 1.5G support */
+	VIRTUAL_CHANNEL_1  = 0x9,
+	VIRTUAL_CHANNEL_2  = 0xA,
+	VIRTUAL_CHANNEL_3  = 0xB,
+	VIRTUAL_CHANNEL_4  = 0xC,
+	VIRTUAL_CHANNEL_5  = 0xD,
+	VIRTUAL_CHANNEL_6  = 0xE,
+};
+
+enum { /* 0:CSI2(2.5G), 1:NCSI2(1.5G) */
+	CSI2_1_5G           = 0x0, /* 1.5G support */
+	CSI2_2_5G           = 0x1, /* 2.5G support*/
+	CSI2_2_5G_CPHY      = 0x2, /* 2.5G support*/
+};
+
+enum {
+	RAW_8BIT_FMT        = 0x0,
+	RAW_10BIT_FMT       = 0x1,
+	RAW_12BIT_FMT       = 0x2,
+	YUV422_FMT          = 0x3,
+	RAW_14BIT_FMT       = 0x4,
+	RGB565_MIPI_FMT     = 0x5,
+	RGB888_MIPI_FMT     = 0x6,
+	JPEG_FMT            = 0x7
+};
+
+enum {
+	CMD_SENINF_GET_SENINF_ADDR,
+	CMD_SENINF_DEBUG_TASK,
+	CMD_SENINF_DEBUG_TASK_CAMSV,
+	CMD_SENINF_DEBUG_PIXEL_METER,
+	CMD_SENINF_MAX
+};
+
+/* MIPI sensor pad usage */
+struct seninf_csi_info {
+	unsigned int port;
+	unsigned int         seninf;
+};
+
+struct seninf_csi_mipi {
+	struct seninf_csi_info  *csi_info;
+	unsigned int     data_lane_num;
+	unsigned int     dpcm;
+};
+
+#endif /*__SENINF_DRV_DEF_H__ */
diff --git a/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
new file mode 100644
index 0000000..349dc9c
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
@@ -0,0 +1,965 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _SENINF_REG_H_
+#define _SENINF_REG_H_
+
+/* 0x11C80000..0x11C850AC */
+#define MIPI_RX_ANA00_CSI0A           0x0000
+#define MIPI_RX_ANA04_CSI0A           0x0004
+#define MIPI_RX_ANA08_CSI0A           0x0008
+#define MIPI_RX_ANA0C_CSI0A           0x000C
+#define MIPI_RX_ANA10_CSI0A           0x0010
+#define MIPI_RX_ANA14_CSI0A           0x0014
+#define MIPI_RX_ANA18_CSI0A           0x0018
+#define MIPI_RX_ANA1C_CSI0A           0x001C
+#define MIPI_RX_ANA20_CSI0A           0x0020
+#define MIPI_RX_ANA24_CSI0A           0x0024
+#define MIPI_RX_ANA28_CSI0A           0x0028
+#define MIPI_RX_ANA2C_CSI0A           0x002C
+#define rsv_0030                      0x0030
+#define MIPI_RX_ANA34_CSI0A           0x0034
+#define MIPI_RX_ANA38_CSI0A           0x0038
+#define rsv_003C                      0x003C
+#define MIPI_RX_ANA40_CSI0A           0x0040
+#define rsv_0044                      0x0044
+#define MIPI_RX_ANA48_CSI0A           0x0048
+#define rsv_004C_13                   0x004C
+#define MIPI_RX_WRAPPER80_CSI0A       0x0080
+#define MIPI_RX_WRAPPER84_CSI0A       0x0084
+#define MIPI_RX_WRAPPER88_CSI0A       0x0088
+#define MIPI_RX_WRAPPER8C_CSI0A       0x008C
+#define MIPI_RX_WRAPPER90_CSI0A       0x0090
+#define MIPI_RX_WRAPPER94_CSI0A       0x0094
+#define MIPI_RX_WRAPPER98_CSI0A       0x0098
+#define MIPI_RX_WRAPPER9C_CSI0A       0x009C
+#define rsv_00A0                      0x00A0
+#define MIPI_RX_ANAA4_CSI0A           0x00A4
+#define MIPI_RX_ANAA8_CSI0A           0x00A8
+#define rsv_00AC_981                  0x00AC
+#define MIPI_RX_ANA00_CSI0B           0x1000
+#define MIPI_RX_ANA04_CSI0B           0x1004
+#define MIPI_RX_ANA08_CSI0B           0x1008
+#define MIPI_RX_ANA0C_CSI0B           0x100C
+#define MIPI_RX_ANA10_CSI0B           0x1010
+#define MIPI_RX_ANA14_CSI0B           0x1014
+#define MIPI_RX_ANA18_CSI0B           0x1018
+#define MIPI_RX_ANA1C_CSI0B           0x101C
+#define MIPI_RX_ANA20_CSI0B           0x1020
+#define MIPI_RX_ANA24_CSI0B           0x1024
+#define MIPI_RX_ANA28_CSI0B           0x1028
+#define MIPI_RX_ANA2C_CSI0B           0x102C
+#define rsv_1030                      0x1030
+#define MIPI_RX_ANA34_CSI0B           0x1034
+#define MIPI_RX_ANA38_CSI0B           0x1038
+#define rsv_103C_3                    0x103C
+#define MIPI_RX_ANA48_CSI0B           0x1048
+#define rsv_104C_13                   0x104C
+#define MIPI_RX_WRAPPER80_CSI0B       0x1080
+#define MIPI_RX_WRAPPER84_CSI0B       0x1084
+#define MIPI_RX_WRAPPER88_CSI0B       0x1088
+#define MIPI_RX_WRAPPER8C_CSI0B       0x108C
+#define MIPI_RX_WRAPPER90_CSI0B       0x1090
+#define MIPI_RX_WRAPPER94_CSI0B       0x1094
+#define MIPI_RX_WRAPPER98_CSI0B       0x1098
+#define MIPI_RX_WRAPPER9C_CSI0B       0x109C
+#define rsv_10A0                      0x10A0
+#define MIPI_RX_ANAA4_CSI0B           0x10A4
+#define MIPI_RX_ANAA8_CSI0B           0x10A8
+#define rsv_10AC_981                  0x10AC
+#define MIPI_RX_ANA00_CSI1A           0x2000
+#define MIPI_RX_ANA04_CSI1A           0x2004
+#define MIPI_RX_ANA08_CSI1A           0x2008
+#define MIPI_RX_ANA0C_CSI1A           0x200C
+#define MIPI_RX_ANA10_CSI1A           0x2010
+#define rsv_2014                      0x2014
+#define MIPI_RX_ANA18_CSI1A           0x2018
+#define MIPI_RX_ANA1C_CSI1A           0x201C
+#define rsv_2020                      0x2020
+#define MIPI_RX_ANA24_CSI1A           0x2024
+#define rsv_2028_8                    0x2028
+#define MIPI_RX_ANA48_CSI1A           0x2048
+#define rsv_204C_13                   0x204C
+#define MIPI_RX_WRAPPER80_CSI1A       0x2080
+#define MIPI_RX_WRAPPER84_CSI1A       0x2084
+#define MIPI_RX_WRAPPER88_CSI1A       0x2088
+#define MIPI_RX_WRAPPER8C_CSI1A       0x208C
+#define MIPI_RX_WRAPPER90_CSI1A       0x2090
+#define MIPI_RX_WRAPPER94_CSI1A       0x2094
+#define MIPI_RX_WRAPPER98_CSI1A       0x2098
+#define MIPI_RX_WRAPPER9C_CSI1A       0x209C
+#define rsv_20A0                      0x20A0
+#define MIPI_RX_ANAA4_CSI1A           0x20A4
+#define MIPI_RX_ANAA8_CSI1A           0x20A8
+#define rsv_20AC_981                  0x20AC
+#define MIPI_RX_ANA00_CSI1B           0x3000
+#define MIPI_RX_ANA04_CSI1B           0x3004
+#define MIPI_RX_ANA08_CSI1B           0x3008
+#define MIPI_RX_ANA0C_CSI1B           0x300C
+#define MIPI_RX_ANA10_CSI1B           0x3010
+#define rsv_3014                      0x3014
+#define MIPI_RX_ANA18_CSI1B           0x3018
+#define MIPI_RX_ANA1C_CSI1B           0x301C
+#define rsv_3020                      0x3020
+#define MIPI_RX_ANA24_CSI1B           0x3024
+#define rsv_3028_8                    0x3028
+#define MIPI_RX_ANA48_CSI1B           0x3048
+#define rsv_304C_13                   0x304C
+#define MIPI_RX_WRAPPER80_CSI1B       0x3080
+#define MIPI_RX_WRAPPER84_CSI1B       0x3084
+#define MIPI_RX_WRAPPER88_CSI1B       0x3088
+#define MIPI_RX_WRAPPER8C_CSI1B       0x308C
+#define MIPI_RX_WRAPPER90_CSI1B       0x3090
+#define MIPI_RX_WRAPPER94_CSI1B       0x3094
+#define MIPI_RX_WRAPPER98_CSI1B       0x3098
+#define MIPI_RX_WRAPPER9C_CSI1B       0x309C
+#define rsv_30A0                      0x30A0
+#define MIPI_RX_ANAA4_CSI1B           0x30A4
+#define MIPI_RX_ANAA8_CSI1B           0x30A8
+#define rsv_30AC_981                  0x30AC
+#define MIPI_RX_ANA00_CSI2A           0x4000
+#define MIPI_RX_ANA04_CSI2A           0x4004
+#define MIPI_RX_ANA08_CSI2A           0x4008
+#define MIPI_RX_ANA0C_CSI2A           0x400C
+#define MIPI_RX_ANA10_CSI2A           0x4010
+#define rsv_4014                      0x4014
+#define MIPI_RX_ANA18_CSI2A           0x4018
+#define MIPI_RX_ANA1C_CSI2A           0x401C
+#define rsv_4020                      0x4020
+#define MIPI_RX_ANA24_CSI2A           0x4024
+#define rsv_4028_8                    0x4028
+#define MIPI_RX_ANA48_CSI2A           0x4048
+#define rsv_404C_13                   0x404C
+#define MIPI_RX_WRAPPER80_CSI2A       0x4080
+#define MIPI_RX_WRAPPER84_CSI2A       0x4084
+#define MIPI_RX_WRAPPER88_CSI2A       0x4088
+#define MIPI_RX_WRAPPER8C_CSI2A       0x408C
+#define MIPI_RX_WRAPPER90_CSI2A       0x4090
+#define MIPI_RX_WRAPPER94_CSI2A       0x4094
+#define MIPI_RX_WRAPPER98_CSI2A       0x4098
+#define MIPI_RX_WRAPPER9C_CSI2A       0x409C
+#define rsv_40A0                      0x40A0
+#define MIPI_RX_ANAA4_CSI2A           0x40A4
+#define MIPI_RX_ANAA8_CSI2A           0x40A8
+#define rsv_40AC_981                  0x40AC
+#define MIPI_RX_ANA00_CSI2B           0x5000
+#define MIPI_RX_ANA04_CSI2B           0x5004
+#define MIPI_RX_ANA08_CSI2B           0x5008
+#define MIPI_RX_ANA0C_CSI2B           0x500C
+#define MIPI_RX_ANA10_CSI2B           0x5010
+#define rsv_5014                      0x5014
+#define MIPI_RX_ANA18_CSI2B           0x5018
+#define MIPI_RX_ANA1C_CSI2B           0x501C
+#define rsv_5020                      0x5020
+#define MIPI_RX_ANA24_CSI2B           0x5024
+#define rsv_5028_8                    0x5028
+#define MIPI_RX_ANA48_CSI2B           0x5048
+#define rsv_504C_13                   0x504C
+#define MIPI_RX_WRAPPER80_CSI2B       0x5080
+#define MIPI_RX_WRAPPER84_CSI2B       0x5084
+#define MIPI_RX_WRAPPER88_CSI2B       0x5088
+#define MIPI_RX_WRAPPER8C_CSI2B       0x508C
+#define MIPI_RX_WRAPPER90_CSI2B       0x5090
+#define MIPI_RX_WRAPPER94_CSI2B       0x5094
+#define MIPI_RX_WRAPPER98_CSI2B       0x5098
+#define MIPI_RX_WRAPPER9C_CSI2B       0x509C
+#define rsv_50A0                      0x50A0
+#define MIPI_RX_ANAA4_CSI2B           0x50A4
+#define MIPI_RX_ANAA8_CSI2B           0x50A8
+#define rsv_50AC_20                   0x50AC
+
+/* 0x1A040000..0x1A047D40 */
+#define SENINF_TOP_CTRL                        0x0000
+#define SENINF_TOP_CMODEL_PAR                  0x0004
+#define SENINF_TOP_MUX_CTRL                    0x0008
+#define rsv_000C                               0x000C
+#define SENINF_TOP_CAM_MUX_CTRL                0x0010
+#define SENINF_TOP_N3D_A_CTL                   0x0014
+#define SENINF_TOP_N3D_B_CTL                   0x0018
+#define SENINF_TOP_PHY_SENINF_CTL_CSI0         0x001C
+#define SENINF_TOP_PHY_SENINF_CTL_CSI1         0x0020
+#define SENINF_TOP_PHY_SENINF_CTL_CSI2         0x0024
+#define rsv_0028_54                            0x0028
+#define SENINF_N3D_A_CTL                       0x0100
+#define SENINF_N3D_A_POS                       0x0104
+#define SENINF_N3D_A_TRIG                      0x0108
+#define SENINF_N3D_A_INT                       0x010C
+#define SENINF_N3D_A_CNT0                      0x0110
+#define SENINF_N3D_A_CNT1                      0x0114
+#define SENINF_N3D_A_DBG                       0x0118
+#define SENINF_N3D_A_DIFF_THR                  0x011C
+#define SENINF_N3D_A_DIFF_CNT                  0x0120
+#define SENINF_N3D_A_DBG_1                     0x0124
+#define SENINF_N3D_A_VALID_TG_CNT              0x0128
+#define SENINF_N3D_A_SYNC_A_PERIOD             0x012C
+#define SENINF_N3D_A_SYNC_B_PERIOD             0x0130
+#define SENINF_N3D_A_SYNC_A_PULSE_LEN          0x0134
+#define SENINF_N3D_A_SYNC_B_PULSE_LEN          0x0138
+#define SENINF_N3D_A_SUB_CNT                   0x013C
+#define SENINF_N3D_A_VSYNC_CNT                 0x0140
+#define rsv_0144_47                            0x0144
+#define SENINF1_CTRL                           0x0200
+#define SENINF1_CTRL_EXT                       0x0204
+#define SENINF1_ASYNC_CTRL                     0x0208
+#define rsv_020C_253                           0x020C
+#define SENINF_TG1_PH_CNT                      0x0600
+#define SENINF_TG1_SEN_CK                      0x0604
+#define SENINF_TG1_TM_CTL                      0x0608
+#define SENINF_TG1_TM_SIZE                     0x060C
+#define SENINF_TG1_TM_CLK                      0x0610
+#define SENINF_TG1_TM_STP                      0x0614
+#define rsv_0618_131                           0x0618
+#define MIPI_RX_CON24_CSI0                     0x0824
+#define MIPI_RX_CON28_CSI0                     0x0828
+#define rsv_082C_2                             0x082C
+#define MIPI_RX_CON34_CSI0                     0x0834
+#define MIPI_RX_CON38_CSI0                     0x0838
+#define MIPI_RX_CON3C_CSI0                     0x083C
+#define rsv_0840_15                            0x0840
+#define MIPI_RX_CON7C_CSI0                     0x087C
+#define MIPI_RX_CON80_CSI0                     0x0880
+#define MIPI_RX_CON84_CSI0                     0x0884
+#define MIPI_RX_CON88_CSI0                     0x0888
+#define MIPI_RX_CON8C_CSI0                     0x088C
+#define MIPI_RX_CON90_CSI0                     0x0890
+#define MIPI_RX_CON94_CSI0                     0x0894
+#define MIPI_RX_CON98_CSI0                     0x0898
+#define rsv_089C                               0x089C
+#define MIPI_RX_CONA0_CSI0                     0x08A0
+#define rsv_08A4_3                             0x08A4
+#define MIPI_RX_CONB0_CSI0                     0x08B0
+#define MIPI_RX_CONB4_CSI0                     0x08B4
+#define MIPI_RX_CONB8_CSI0                     0x08B8
+#define MIPI_RX_CONBC_CSI0                     0x08BC
+#define MIPI_RX_CONC0_CSI0                     0x08C0
+#define MIPI_RX_CONC4_CSI0                     0x08C4
+#define MIPI_RX_CONC8_CSI0                     0x08C8
+#define MIPI_RX_CONCC_CSI0                     0x08CC
+#define MIPI_RX_COND0_CSI0                     0x08D0
+#define rsv_08D4_75                            0x08D4
+#define SENINF1_CSI2_CTL                       0x0A00
+#define SENINF1_CSI2_LNRC_TIMING               0x0A04
+#define SENINF1_CSI2_LNRD_TIMING               0x0A08
+#define SENINF1_CSI2_DPCM                      0x0A0C
+#define SENINF1_CSI2_INT_EN                    0x0A10
+#define SENINF1_CSI2_INT_STATUS                0x0A14
+#define SENINF1_CSI2_DGB_SEL                   0x0A18
+#define SENINF1_CSI2_DBG_PORT                  0x0A1C
+#define SENINF1_CSI2_SPARE0                    0x0A20
+#define SENINF1_CSI2_SPARE1                    0x0A24
+#define SENINF1_CSI2_LNRC_FSM                  0x0A28
+#define SENINF1_CSI2_LNRD_FSM                  0x0A2C
+#define SENINF1_CSI2_FRAME_LINE_NUM            0x0A30
+#define SENINF1_CSI2_GENERIC_SHORT             0x0A34
+#define SENINF1_CSI2_HSRX_DBG                  0x0A38
+#define SENINF1_CSI2_DI                        0x0A3C
+#define SENINF1_CSI2_HS_TRAIL                  0x0A40
+#define SENINF1_CSI2_DI_CTRL                   0x0A44
+#define rsv_0A48                               0x0A48
+#define SENINF1_CSI2_DETECT_CON1               0x0A4C
+#define SENINF1_CSI2_DETECT_CON2               0x0A50
+#define SENINF1_CSI2_DETECT_CON3               0x0A54
+#define SENINF1_CSI2_RLR0_CON0                 0x0A58
+#define SENINF1_CSI2_RLR1_CON0                 0x0A5C
+#define SENINF1_CSI2_RLR2_CON0                 0x0A60
+#define SENINF1_CSI2_RLR_CON0                  0x0A64
+#define SENINF1_CSI2_MUX_CON                   0x0A68
+#define SENINF1_CSI2_DETECT_DBG0               0x0A6C
+#define SENINF1_CSI2_DETECT_DBG1               0x0A70
+#define SENINF1_CSI2_RESYNC_MERGE_CTL          0x0A74
+#define SENINF1_CSI2_CTRL_TRIO_MUX             0x0A78
+#define SENINF1_CSI2_CTRL_TRIO_CON             0x0A7C
+#define SENINF1_FIX_ADDR_CPHY0_DBG             0x0A80
+#define SENINF1_FIX_ADDR_CPHY1_DBG             0x0A84
+#define SENINF1_FIX_ADDR_CPHY2_DBG             0x0A88
+#define SENINF1_FIX_ADDR_DBG                   0x0A8C
+#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG0   0x0A90
+#define SENINF1_WIRE_STATE_DECODE_CPHY0_DBG1   0x0A94
+#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG0   0x0A98
+#define SENINF1_WIRE_STATE_DECODE_CPHY1_DBG1   0x0A9C
+#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG0   0x0AA0
+#define SENINF1_WIRE_STATE_DECODE_CPHY2_DBG1   0x0AA4
+#define SENINF1_SYNC_RESYNC_CTL                0x0AA8
+#define SENINF1_POST_DETECT_CTL                0x0AAC
+#define SENINF1_WIRE_STATE_DECODE_CONFIG       0x0AB0
+#define SENINF1_CSI2_CPHY_LNRD_FSM             0x0AB4
+#define SENINF1_FIX_ADDR_CPHY0_DBG0            0x0AB8
+#define SENINF1_FIX_ADDR_CPHY0_DBG1            0x0ABC
+#define SENINF1_FIX_ADDR_CPHY0_DBG2            0x0AC0
+#define SENINF1_FIX_ADDR_CPHY1_DBG0            0x0AC4
+#define SENINF1_FIX_ADDR_CPHY1_DBG1            0x0AC8
+#define SENINF1_FIX_ADDR_CPHY1_DBG2            0x0ACC
+#define SENINF1_FIX_ADDR_CPHY2_DBG0            0x0AD0
+#define SENINF1_FIX_ADDR_CPHY2_DBG1            0x0AD4
+#define SENINF1_FIX_ADDR_CPHY2_DBG2            0x0AD8
+#define SENINF1_FIX_ADDR_DBG0                  0x0ADC
+#define SENINF1_FIX_ADDR_DBG1                  0x0AE0
+#define SENINF1_FIX_ADDR_DBG2                  0x0AE4
+#define SENINF1_CSI2_MODE                      0x0AE8
+#define rsv_0AEC                               0x0AEC
+#define SENINF1_CSI2_DI_EXT                    0x0AF0
+#define SENINF1_CSI2_DI_CTRL_EXT               0x0AF4
+#define SENINF1_CSI2_CPHY_LOOPBACK             0x0AF8
+#define rsv_0AFC                               0x0AFC
+#define SENINF1_CSI2_PROGSEQ_0                 0x0B00
+#define SENINF1_CSI2_PROGSEQ_1                 0x0B04
+#define rsv_0B08_2                             0x0B08
+#define SENINF1_CSI2_INT_EN_EXT                0x0B10
+#define SENINF1_CSI2_INT_STATUS_EXT            0x0B14
+#define SENINF1_CSI2_CPHY_FIX_POINT_RST        0x0B18
+#define SENINF1_CSI2_RLR3_CON0                 0x0B1C
+#define SENINF1_CSI2_DPHY_SYNC                 0x0B20
+#define SENINF1_CSI2_DESKEW_SYNC               0x0B24
+#define SENINF1_CSI2_DETECT_DBG2               0x0B28
+#define rsv_0B2C                               0x0B2C
+#define SENINF1_FIX_ADDR_CPHY3_DBG0            0x0B30
+#define SENINF1_FIX_ADDR_CPHY3_DBG1            0x0B34
+#define SENINF1_FIX_ADDR_CPHY3_DBG2            0x0B38
+#define SENINF1_CSI2_DI_EXT_2                  0x0B3C
+#define SENINF1_CSI2_DI_CTRL_EXT_2             0x0B40
+#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG0   0x0B44
+#define SENINF1_WIRE_STATE_DECODE_CPHY3_DBG1   0x0B48
+#define rsv_0B4C_109                           0x0B4C
+#define SENINF1_MUX_CTRL                       0x0D00
+#define SENINF1_MUX_INTEN                      0x0D04
+#define SENINF1_MUX_INTSTA                     0x0D08
+#define SENINF1_MUX_SIZE                       0x0D0C
+#define SENINF1_MUX_DEBUG_1                    0x0D10
+#define SENINF1_MUX_DEBUG_2                    0x0D14
+#define SENINF1_MUX_DEBUG_3                    0x0D18
+#define SENINF1_MUX_DEBUG_4                    0x0D1C
+#define SENINF1_MUX_DEBUG_5                    0x0D20
+#define SENINF1_MUX_DEBUG_6                    0x0D24
+#define SENINF1_MUX_DEBUG_7                    0x0D28
+#define SENINF1_MUX_SPARE                      0x0D2C
+#define SENINF1_MUX_DATA                       0x0D30
+#define SENINF1_MUX_DATA_CNT                   0x0D34
+#define SENINF1_MUX_CROP                       0x0D38
+#define SENINF1_MUX_CTRL_EXT                   0x0D3C
+#define rsv_0D40_240                           0x0D40
+#define SENINF_N3D_B_CTL                       0x1100
+#define SENINF_N3D_B_POS                       0x1104
+#define SENINF_N3D_B_TRIG                      0x1108
+#define SENINF_N3D_B_INT                       0x110C
+#define SENINF_N3D_B_CNT0                      0x1110
+#define SENINF_N3D_B_CNT1                      0x1114
+#define SENINF_N3D_B_DBG                       0x1118
+#define SENINF_N3D_B_DIFF_THR                  0x111C
+#define SENINF_N3D_B_DIFF_CNT                  0x1120
+#define SENINF_N3D_B_DBG_1                     0x1124
+#define SENINF_N3D_B_VALID_TG_CNT              0x1128
+#define SENINF_N3D_B_SYNC_A_PERIOD             0x112C
+#define SENINF_N3D_B_SYNC_B_PERIOD             0x1130
+#define SENINF_N3D_B_SYNC_A_PULSE_LEN          0x1134
+#define SENINF_N3D_B_SYNC_B_PULSE_LEN          0x1138
+#define SENINF_N3D_B_SUB_CNT                   0x113C
+#define SENINF_N3D_B_VSYNC_CNT                 0x1140
+#define rsv_1144_47                            0x1144
+#define SENINF2_CTRL                           0x1200
+#define SENINF2_CTRL_EXT                       0x1204
+#define SENINF2_ASYNC_CTRL                     0x1208
+#define rsv_120C_253                           0x120C
+#define SENINF_TG2_PH_CNT                      0x1600
+#define SENINF_TG2_SEN_CK                      0x1604
+#define SENINF_TG2_TM_CTL                      0x1608
+#define SENINF_TG2_TM_SIZE                     0x160C
+#define SENINF_TG2_TM_CLK                      0x1610
+#define SENINF_TG2_TM_STP                      0x1614
+#define rsv_1618_131                           0x1618
+#define MIPI_RX_CON24_CSI1                     0x1824
+#define MIPI_RX_CON28_CSI1                     0x1828
+#define rsv_182C_2                             0x182C
+#define MIPI_RX_CON34_CSI1                     0x1834
+#define MIPI_RX_CON38_CSI1                     0x1838
+#define MIPI_RX_CON3C_CSI1                     0x183C
+#define rsv_1840_15                            0x1840
+#define MIPI_RX_CON7C_CSI1                     0x187C
+#define MIPI_RX_CON80_CSI1                     0x1880
+#define MIPI_RX_CON84_CSI1                     0x1884
+#define MIPI_RX_CON88_CSI1                     0x1888
+#define MIPI_RX_CON8C_CSI1                     0x188C
+#define MIPI_RX_CON90_CSI1                     0x1890
+#define MIPI_RX_CON94_CSI1                     0x1894
+#define MIPI_RX_CON98_CSI1                     0x1898
+#define rsv_189C                               0x189C
+#define MIPI_RX_CONA0_CSI1                     0x18A0
+#define rsv_18A4_3                             0x18A4
+#define MIPI_RX_CONB0_CSI1                     0x18B0
+#define MIPI_RX_CONB4_CSI1                     0x18B4
+#define MIPI_RX_CONB8_CSI1                     0x18B8
+#define MIPI_RX_CONBC_CSI1                     0x18BC
+#define MIPI_RX_CONC0_CSI1                     0x18C0
+#define MIPI_RX_CONC4_CSI1                     0x18C4
+#define MIPI_RX_CONC8_CSI1                     0x18C8
+#define MIPI_RX_CONCC_CSI1                     0x18CC
+#define MIPI_RX_COND0_CSI1                     0x18D0
+#define rsv_18D4_75                            0x18D4
+#define SENINF2_CSI2_CTL                       0x1A00
+#define SENINF2_CSI2_LNRC_TIMING               0x1A04
+#define SENINF2_CSI2_LNRD_TIMING               0x1A08
+#define SENINF2_CSI2_DPCM                      0x1A0C
+#define SENINF2_CSI2_INT_EN                    0x1A10
+#define SENINF2_CSI2_INT_STATUS                0x1A14
+#define SENINF2_CSI2_DGB_SEL                   0x1A18
+#define SENINF2_CSI2_DBG_PORT                  0x1A1C
+#define SENINF2_CSI2_SPARE0                    0x1A20
+#define SENINF2_CSI2_SPARE1                    0x1A24
+#define SENINF2_CSI2_LNRC_FSM                  0x1A28
+#define SENINF2_CSI2_LNRD_FSM                  0x1A2C
+#define SENINF2_CSI2_FRAME_LINE_NUM            0x1A30
+#define SENINF2_CSI2_GENERIC_SHORT             0x1A34
+#define SENINF2_CSI2_HSRX_DBG                  0x1A38
+#define SENINF2_CSI2_DI                        0x1A3C
+#define SENINF2_CSI2_HS_TRAIL                  0x1A40
+#define SENINF2_CSI2_DI_CTRL                   0x1A44
+#define rsv_1A48                               0x1A48
+#define SENINF2_CSI2_DETECT_CON1               0x1A4C
+#define SENINF2_CSI2_DETECT_CON2               0x1A50
+#define SENINF2_CSI2_DETECT_CON3               0x1A54
+#define SENINF2_CSI2_RLR0_CON0                 0x1A58
+#define SENINF2_CSI2_RLR1_CON0                 0x1A5C
+#define SENINF2_CSI2_RLR2_CON0                 0x1A60
+#define SENINF2_CSI2_RLR_CON0                  0x1A64
+#define SENINF2_CSI2_MUX_CON                   0x1A68
+#define SENINF2_CSI2_DETECT_DBG0               0x1A6C
+#define SENINF2_CSI2_DETECT_DBG1               0x1A70
+#define SENINF2_CSI2_RESYNC_MERGE_CTL          0x1A74
+#define SENINF2_CSI2_CTRL_TRIO_MUX             0x1A78
+#define SENINF2_CSI2_CTRL_TRIO_CON             0x1A7C
+#define SENINF2_FIX_ADDR_CPHY0_DBG             0x1A80
+#define SENINF2_FIX_ADDR_CPHY1_DBG             0x1A84
+#define SENINF2_FIX_ADDR_CPHY2_DBG             0x1A88
+#define SENINF2_FIX_ADDR_DBG                   0x1A8C
+#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG0   0x1A90
+#define SENINF2_WIRE_STATE_DECODE_CPHY0_DBG1   0x1A94
+#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG0   0x1A98
+#define SENINF2_WIRE_STATE_DECODE_CPHY1_DBG1   0x1A9C
+#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG0   0x1AA0
+#define SENINF2_WIRE_STATE_DECODE_CPHY2_DBG1   0x1AA4
+#define SENINF2_SYNC_RESYNC_CTL                0x1AA8
+#define SENINF2_POST_DETECT_CTL                0x1AAC
+#define SENINF2_WIRE_STATE_DECODE_CONFIG       0x1AB0
+#define SENINF2_CSI2_CPHY_LNRD_FSM             0x1AB4
+#define SENINF2_FIX_ADDR_CPHY0_DBG0            0x1AB8
+#define SENINF2_FIX_ADDR_CPHY0_DBG1            0x1ABC
+#define SENINF2_FIX_ADDR_CPHY0_DBG2            0x1AC0
+#define SENINF2_FIX_ADDR_CPHY1_DBG0            0x1AC4
+#define SENINF2_FIX_ADDR_CPHY1_DBG1            0x1AC8
+#define SENINF2_FIX_ADDR_CPHY1_DBG2            0x1ACC
+#define SENINF2_FIX_ADDR_CPHY2_DBG0            0x1AD0
+#define SENINF2_FIX_ADDR_CPHY2_DBG1            0x1AD4
+#define SENINF2_FIX_ADDR_CPHY2_DBG2            0x1AD8
+#define SENINF2_FIX_ADDR_DBG0                  0x1ADC
+#define SENINF2_FIX_ADDR_DBG1                  0x1AE0
+#define SENINF2_FIX_ADDR_DBG2                  0x1AE4
+#define SENINF2_CSI2_MODE                      0x1AE8
+#define rsv_1AEC                               0x1AEC
+#define SENINF2_CSI2_DI_EXT                    0x1AF0
+#define SENINF2_CSI2_DI_CTRL_EXT               0x1AF4
+#define SENINF2_CSI2_CPHY_LOOPBACK             0x1AF8
+#define rsv_1AFC                               0x1AFC
+#define SENINF2_CSI2_PROGSEQ_0                 0x1B00
+#define SENINF2_CSI2_PROGSEQ_1                 0x1B04
+#define rsv_1B08_2                             0x1B08
+#define SENINF2_CSI2_INT_EN_EXT                0x1B10
+#define SENINF2_CSI2_INT_STATUS_EXT            0x1B14
+#define SENINF2_CSI2_CPHY_FIX_POINT_RST        0x1B18
+#define SENINF2_CSI2_RLR3_CON0                 0x1B1C
+#define SENINF2_CSI2_DPHY_SYNC                 0x1B20
+#define SENINF2_CSI2_DESKEW_SYNC               0x1B24
+#define SENINF2_CSI2_DETECT_DBG2               0x1B28
+#define rsv_1B2C                               0x1B2C
+#define SENINF2_FIX_ADDR_CPHY3_DBG0            0x1B30
+#define SENINF2_FIX_ADDR_CPHY3_DBG1            0x1B34
+#define SENINF2_FIX_ADDR_CPHY3_DBG2            0x1B38
+#define SENINF2_CSI2_DI_EXT_2                  0x1B3C
+#define SENINF2_CSI2_DI_CTRL_EXT_2             0x1B40
+#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG0   0x1B44
+#define SENINF2_WIRE_STATE_DECODE_CPHY3_DBG1   0x1B48
+#define rsv_1B4C_109                           0x1B4C
+#define SENINF2_MUX_CTRL                       0x1D00
+#define SENINF2_MUX_INTEN                      0x1D04
+#define SENINF2_MUX_INTSTA                     0x1D08
+#define SENINF2_MUX_SIZE                       0x1D0C
+#define SENINF2_MUX_DEBUG_1                    0x1D10
+#define SENINF2_MUX_DEBUG_2                    0x1D14
+#define SENINF2_MUX_DEBUG_3                    0x1D18
+#define SENINF2_MUX_DEBUG_4                    0x1D1C
+#define SENINF2_MUX_DEBUG_5                    0x1D20
+#define SENINF2_MUX_DEBUG_6                    0x1D24
+#define SENINF2_MUX_DEBUG_7                    0x1D28
+#define SENINF2_MUX_SPARE                      0x1D2C
+#define SENINF2_MUX_DATA                       0x1D30
+#define SENINF2_MUX_DATA_CNT                   0x1D34
+#define SENINF2_MUX_CROP                       0x1D38
+#define SENINF2_MUX_CTRL_EXT                   0x1D3C
+#define rsv_1D40_304                           0x1D40
+#define SENINF3_CTRL                           0x2200
+#define SENINF3_CTRL_EXT                       0x2204
+#define SENINF3_ASYNC_CTRL                     0x2208
+#define rsv_220C_253                           0x220C
+#define SENINF_TG3_PH_CNT                      0x2600
+#define SENINF_TG3_SEN_CK                      0x2604
+#define SENINF_TG3_TM_CTL                      0x2608
+#define SENINF_TG3_TM_SIZE                     0x260C
+#define SENINF_TG3_TM_CLK                      0x2610
+#define SENINF_TG3_TM_STP                      0x2614
+#define rsv_2618_131                           0x2618
+#define MIPI_RX_CON24_CSI2                     0x2824
+#define MIPI_RX_CON28_CSI2                     0x2828
+#define rsv_282C_2                             0x282C
+#define MIPI_RX_CON34_CSI2                     0x2834
+#define MIPI_RX_CON38_CSI2                     0x2838
+#define MIPI_RX_CON3C_CSI2                     0x283C
+#define rsv_2840_15                            0x2840
+#define MIPI_RX_CON7C_CSI2                     0x287C
+#define MIPI_RX_CON80_CSI2                     0x2880
+#define MIPI_RX_CON84_CSI2                     0x2884
+#define MIPI_RX_CON88_CSI2                     0x2888
+#define MIPI_RX_CON8C_CSI2                     0x288C
+#define MIPI_RX_CON90_CSI2                     0x2890
+#define MIPI_RX_CON94_CSI2                     0x2894
+#define MIPI_RX_CON98_CSI2                     0x2898
+#define rsv_289C                               0x289C
+#define MIPI_RX_CONA0_CSI2                     0x28A0
+#define rsv_28A4_3                             0x28A4
+#define MIPI_RX_CONB0_CSI2                     0x28B0
+#define MIPI_RX_CONB4_CSI2                     0x28B4
+#define MIPI_RX_CONB8_CSI2                     0x28B8
+#define MIPI_RX_CONBC_CSI2                     0x28BC
+#define MIPI_RX_CONC0_CSI2                     0x28C0
+#define MIPI_RX_CONC4_CSI2                     0x28C4
+#define MIPI_RX_CONC8_CSI2                     0x28C8
+#define MIPI_RX_CONCC_CSI2                     0x28CC
+#define MIPI_RX_COND0_CSI2                     0x28D0
+#define rsv_28D4_75                            0x28D4
+#define SENINF3_CSI2_CTL                       0x2A00
+#define SENINF3_CSI2_LNRC_TIMING               0x2A04
+#define SENINF3_CSI2_LNRD_TIMING               0x2A08
+#define SENINF3_CSI2_DPCM                      0x2A0C
+#define SENINF3_CSI2_INT_EN                    0x2A10
+#define SENINF3_CSI2_INT_STATUS                0x2A14
+#define SENINF3_CSI2_DGB_SEL                   0x2A18
+#define SENINF3_CSI2_DBG_PORT                  0x2A1C
+#define SENINF3_CSI2_SPARE0                    0x2A20
+#define SENINF3_CSI2_SPARE1                    0x2A24
+#define SENINF3_CSI2_LNRC_FSM                  0x2A28
+#define SENINF3_CSI2_LNRD_FSM                  0x2A2C
+#define SENINF3_CSI2_FRAME_LINE_NUM            0x2A30
+#define SENINF3_CSI2_GENERIC_SHORT             0x2A34
+#define SENINF3_CSI2_HSRX_DBG                  0x2A38
+#define SENINF3_CSI2_DI                        0x2A3C
+#define SENINF3_CSI2_HS_TRAIL                  0x2A40
+#define SENINF3_CSI2_DI_CTRL                   0x2A44
+#define rsv_2A48                               0x2A48
+#define SENINF3_CSI2_DETECT_CON1               0x2A4C
+#define SENINF3_CSI2_DETECT_CON2               0x2A50
+#define SENINF3_CSI2_DETECT_CON3               0x2A54
+#define SENINF3_CSI2_RLR0_CON0                 0x2A58
+#define SENINF3_CSI2_RLR1_CON0                 0x2A5C
+#define SENINF3_CSI2_RLR2_CON0                 0x2A60
+#define SENINF3_CSI2_RLR_CON0                  0x2A64
+#define SENINF3_CSI2_MUX_CON                   0x2A68
+#define SENINF3_CSI2_DETECT_DBG0               0x2A6C
+#define SENINF3_CSI2_DETECT_DBG1               0x2A70
+#define SENINF3_CSI2_RESYNC_MERGE_CTL          0x2A74
+#define SENINF3_CSI2_CTRL_TRIO_MUX             0x2A78
+#define SENINF3_CSI2_CTRL_TRIO_CON             0x2A7C
+#define SENINF3_FIX_ADDR_CPHY0_DBG             0x2A80
+#define SENINF3_FIX_ADDR_CPHY1_DBG             0x2A84
+#define SENINF3_FIX_ADDR_CPHY2_DBG             0x2A88
+#define SENINF3_FIX_ADDR_DBG                   0x2A8C
+#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG0   0x2A90
+#define SENINF3_WIRE_STATE_DECODE_CPHY0_DBG1   0x2A94
+#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG0   0x2A98
+#define SENINF3_WIRE_STATE_DECODE_CPHY1_DBG1   0x2A9C
+#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG0   0x2AA0
+#define SENINF3_WIRE_STATE_DECODE_CPHY2_DBG1   0x2AA4
+#define SENINF3_SYNC_RESYNC_CTL                0x2AA8
+#define SENINF3_POST_DETECT_CTL                0x2AAC
+#define SENINF3_WIRE_STATE_DECODE_CONFIG       0x2AB0
+#define SENINF3_CSI2_CPHY_LNRD_FSM             0x2AB4
+#define SENINF3_FIX_ADDR_CPHY0_DBG0            0x2AB8
+#define SENINF3_FIX_ADDR_CPHY0_DBG1            0x2ABC
+#define SENINF3_FIX_ADDR_CPHY0_DBG2            0x2AC0
+#define SENINF3_FIX_ADDR_CPHY1_DBG0            0x2AC4
+#define SENINF3_FIX_ADDR_CPHY1_DBG1            0x2AC8
+#define SENINF3_FIX_ADDR_CPHY1_DBG2            0x2ACC
+#define SENINF3_FIX_ADDR_CPHY2_DBG0            0x2AD0
+#define SENINF3_FIX_ADDR_CPHY2_DBG1            0x2AD4
+#define SENINF3_FIX_ADDR_CPHY2_DBG2            0x2AD8
+#define SENINF3_FIX_ADDR_DBG0                  0x2ADC
+#define SENINF3_FIX_ADDR_DBG1                  0x2AE0
+#define SENINF3_FIX_ADDR_DBG2                  0x2AE4
+#define SENINF3_CSI2_MODE                      0x2AE8
+#define rsv_2AEC                               0x2AEC
+#define SENINF3_CSI2_DI_EXT                    0x2AF0
+#define SENINF3_CSI2_DI_CTRL_EXT               0x2AF4
+#define SENINF3_CSI2_CPHY_LOOPBACK             0x2AF8
+#define rsv_2AFC                               0x2AFC
+#define SENINF3_CSI2_PROGSEQ_0                 0x2B00
+#define SENINF3_CSI2_PROGSEQ_1                 0x2B04
+#define rsv_2B08_2                             0x2B08
+#define SENINF3_CSI2_INT_EN_EXT                0x2B10
+#define SENINF3_CSI2_INT_STATUS_EXT            0x2B14
+#define SENINF3_CSI2_CPHY_FIX_POINT_RST        0x2B18
+#define SENINF3_CSI2_RLR3_CON0                 0x2B1C
+#define SENINF3_CSI2_DPHY_SYNC                 0x2B20
+#define SENINF3_CSI2_DESKEW_SYNC               0x2B24
+#define SENINF3_CSI2_DETECT_DBG2               0x2B28
+#define rsv_2B2C                               0x2B2C
+#define SENINF3_FIX_ADDR_CPHY3_DBG0            0x2B30
+#define SENINF3_FIX_ADDR_CPHY3_DBG1            0x2B34
+#define SENINF3_FIX_ADDR_CPHY3_DBG2            0x2B38
+#define SENINF3_CSI2_DI_EXT_2                  0x2B3C
+#define SENINF3_CSI2_DI_CTRL_EXT_2             0x2B40
+#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG0   0x2B44
+#define SENINF3_WIRE_STATE_DECODE_CPHY3_DBG1   0x2B48
+#define rsv_2B4C_109                           0x2B4C
+#define SENINF3_MUX_CTRL                       0x2D00
+#define SENINF3_MUX_INTEN                      0x2D04
+#define SENINF3_MUX_INTSTA                     0x2D08
+#define SENINF3_MUX_SIZE                       0x2D0C
+#define SENINF3_MUX_DEBUG_1                    0x2D10
+#define SENINF3_MUX_DEBUG_2                    0x2D14
+#define SENINF3_MUX_DEBUG_3                    0x2D18
+#define SENINF3_MUX_DEBUG_4                    0x2D1C
+#define SENINF3_MUX_DEBUG_5                    0x2D20
+#define SENINF3_MUX_DEBUG_6                    0x2D24
+#define SENINF3_MUX_DEBUG_7                    0x2D28
+#define SENINF3_MUX_SPARE                      0x2D2C
+#define SENINF3_MUX_DATA                       0x2D30
+#define SENINF3_MUX_DATA_CNT                   0x2D34
+#define SENINF3_MUX_CROP                       0x2D38
+#define SENINF3_MUX_CTRL_EXT                   0x2D3C
+#define rsv_2D40_304                           0x2D40
+#define SENINF4_CTRL                           0x3200
+#define SENINF4_CTRL_EXT                       0x3204
+#define SENINF4_ASYNC_CTRL                     0x3208
+#define rsv_320C_253                           0x320C
+#define SENINF_TG4_PH_CNT                      0x3600
+#define SENINF_TG4_SEN_CK                      0x3604
+#define SENINF_TG4_TM_CTL                      0x3608
+#define SENINF_TG4_TM_SIZE                     0x360C
+#define SENINF_TG4_TM_CLK                      0x3610
+#define SENINF_TG4_TM_STP                      0x3614
+#define rsv_3618_131                           0x3618
+#define MIPI_RX_CON24_CSI3                     0x3824
+#define MIPI_RX_CON28_CSI3                     0x3828
+#define rsv_382C_2                             0x382C
+#define MIPI_RX_CON34_CSI3                     0x3834
+#define MIPI_RX_CON38_CSI3                     0x3838
+#define MIPI_RX_CON3C_CSI3                     0x383C
+#define rsv_3840_15                            0x3840
+#define MIPI_RX_CON7C_CSI3                     0x387C
+#define MIPI_RX_CON80_CSI3                     0x3880
+#define MIPI_RX_CON84_CSI3                     0x3884
+#define MIPI_RX_CON88_CSI3                     0x3888
+#define MIPI_RX_CON8C_CSI3                     0x388C
+#define MIPI_RX_CON90_CSI3                     0x3890
+#define MIPI_RX_CON94_CSI3                     0x3894
+#define MIPI_RX_CON98_CSI3                     0x3898
+#define rsv_389C                               0x389C
+#define MIPI_RX_CONA0_CSI3                     0x38A0
+#define rsv_38A4_3                             0x38A4
+#define MIPI_RX_CONB0_CSI3                     0x38B0
+#define MIPI_RX_CONB4_CSI3                     0x38B4
+#define MIPI_RX_CONB8_CSI3                     0x38B8
+#define MIPI_RX_CONBC_CSI3                     0x38BC
+#define MIPI_RX_CONC0_CSI3                     0x38C0
+#define MIPI_RX_CONC4_CSI3                     0x38C4
+#define MIPI_RX_CONC8_CSI3                     0x38C8
+#define MIPI_RX_CONCC_CSI3                     0x38CC
+#define MIPI_RX_COND0_CSI3                     0x38D0
+#define rsv_38D4_75                            0x38D4
+#define SENINF4_CSI2_CTL                       0x3A00
+#define SENINF4_CSI2_LNRC_TIMING               0x3A04
+#define SENINF4_CSI2_LNRD_TIMING               0x3A08
+#define SENINF4_CSI2_DPCM                      0x3A0C
+#define SENINF4_CSI2_INT_EN                    0x3A10
+#define SENINF4_CSI2_INT_STATUS                0x3A14
+#define SENINF4_CSI2_DGB_SEL                   0x3A18
+#define SENINF4_CSI2_DBG_PORT                  0x3A1C
+#define SENINF4_CSI2_SPARE0                    0x3A20
+#define SENINF4_CSI2_SPARE1                    0x3A24
+#define SENINF4_CSI2_LNRC_FSM                  0x3A28
+#define SENINF4_CSI2_LNRD_FSM                  0x3A2C
+#define SENINF4_CSI2_FRAME_LINE_NUM            0x3A30
+#define SENINF4_CSI2_GENERIC_SHORT             0x3A34
+#define SENINF4_CSI2_HSRX_DBG                  0x3A38
+#define SENINF4_CSI2_DI                        0x3A3C
+#define SENINF4_CSI2_HS_TRAIL                  0x3A40
+#define SENINF4_CSI2_DI_CTRL                   0x3A44
+#define rsv_3A48                               0x3A48
+#define SENINF4_CSI2_DETECT_CON1               0x3A4C
+#define SENINF4_CSI2_DETECT_CON2               0x3A50
+#define SENINF4_CSI2_DETECT_CON3               0x3A54
+#define SENINF4_CSI2_RLR0_CON0                 0x3A58
+#define SENINF4_CSI2_RLR1_CON0                 0x3A5C
+#define SENINF4_CSI2_RLR2_CON0                 0x3A60
+#define SENINF4_CSI2_RLR_CON0                  0x3A64
+#define SENINF4_CSI2_MUX_CON                   0x3A68
+#define SENINF4_CSI2_DETECT_DBG0               0x3A6C
+#define SENINF4_CSI2_DETECT_DBG1               0x3A70
+#define SENINF4_CSI2_RESYNC_MERGE_CTL          0x3A74
+#define SENINF4_CSI2_CTRL_TRIO_MUX             0x3A78
+#define SENINF4_CSI2_CTRL_TRIO_CON             0x3A7C
+#define SENINF4_FIX_ADDR_CPHY0_DBG             0x3A80
+#define SENINF4_FIX_ADDR_CPHY1_DBG             0x3A84
+#define SENINF4_FIX_ADDR_CPHY2_DBG             0x3A88
+#define SENINF4_FIX_ADDR_DBG                   0x3A8C
+#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG0   0x3A90
+#define SENINF4_WIRE_STATE_DECODE_CPHY0_DBG1   0x3A94
+#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG0   0x3A98
+#define SENINF4_WIRE_STATE_DECODE_CPHY1_DBG1   0x3A9C
+#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG0   0x3AA0
+#define SENINF4_WIRE_STATE_DECODE_CPHY2_DBG1   0x3AA4
+#define SENINF4_SYNC_RESYNC_CTL                0x3AA8
+#define SENINF4_POST_DETECT_CTL                0x3AAC
+#define SENINF4_WIRE_STATE_DECODE_CONFIG       0x3AB0
+#define SENINF4_CSI2_CPHY_LNRD_FSM             0x3AB4
+#define SENINF4_FIX_ADDR_CPHY0_DBG0            0x3AB8
+#define SENINF4_FIX_ADDR_CPHY0_DBG1            0x3ABC
+#define SENINF4_FIX_ADDR_CPHY0_DBG2            0x3AC0
+#define SENINF4_FIX_ADDR_CPHY1_DBG0            0x3AC4
+#define SENINF4_FIX_ADDR_CPHY1_DBG1            0x3AC8
+#define SENINF4_FIX_ADDR_CPHY1_DBG2            0x3ACC
+#define SENINF4_FIX_ADDR_CPHY2_DBG0            0x3AD0
+#define SENINF4_FIX_ADDR_CPHY2_DBG1            0x3AD4
+#define SENINF4_FIX_ADDR_CPHY2_DBG2            0x3AD8
+#define SENINF4_FIX_ADDR_DBG0                  0x3ADC
+#define SENINF4_FIX_ADDR_DBG1                  0x3AE0
+#define SENINF4_FIX_ADDR_DBG2                  0x3AE4
+#define SENINF4_CSI2_MODE                      0x3AE8
+#define rsv_3AEC                               0x3AEC
+#define SENINF4_CSI2_DI_EXT                    0x3AF0
+#define SENINF4_CSI2_DI_CTRL_EXT               0x3AF4
+#define SENINF4_CSI2_CPHY_LOOPBACK             0x3AF8
+#define rsv_3AFC                               0x3AFC
+#define SENINF4_CSI2_PROGSEQ_0                 0x3B00
+#define SENINF4_CSI2_PROGSEQ_1                 0x3B04
+#define rsv_3B08_2                             0x3B08
+#define SENINF4_CSI2_INT_EN_EXT                0x3B10
+#define SENINF4_CSI2_INT_STATUS_EXT            0x3B14
+#define SENINF4_CSI2_CPHY_FIX_POINT_RST        0x3B18
+#define SENINF4_CSI2_RLR3_CON0                 0x3B1C
+#define SENINF4_CSI2_DPHY_SYNC                 0x3B20
+#define SENINF4_CSI2_DESKEW_SYNC               0x3B24
+#define SENINF4_CSI2_DETECT_DBG2               0x3B28
+#define rsv_3B2C                               0x3B2C
+#define SENINF4_FIX_ADDR_CPHY3_DBG0            0x3B30
+#define SENINF4_FIX_ADDR_CPHY3_DBG1            0x3B34
+#define SENINF4_FIX_ADDR_CPHY3_DBG2            0x3B38
+#define SENINF4_CSI2_DI_EXT_2                  0x3B3C
+#define SENINF4_CSI2_DI_CTRL_EXT_2             0x3B40
+#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG0   0x3B44
+#define SENINF4_WIRE_STATE_DECODE_CPHY3_DBG1   0x3B48
+#define rsv_3B4C_109                           0x3B4C
+#define SENINF4_MUX_CTRL                       0x3D00
+#define SENINF4_MUX_INTEN                      0x3D04
+#define SENINF4_MUX_INTSTA                     0x3D08
+#define SENINF4_MUX_SIZE                       0x3D0C
+#define SENINF4_MUX_DEBUG_1                    0x3D10
+#define SENINF4_MUX_DEBUG_2                    0x3D14
+#define SENINF4_MUX_DEBUG_3                    0x3D18
+#define SENINF4_MUX_DEBUG_4                    0x3D1C
+#define SENINF4_MUX_DEBUG_5                    0x3D20
+#define SENINF4_MUX_DEBUG_6                    0x3D24
+#define SENINF4_MUX_DEBUG_7                    0x3D28
+#define SENINF4_MUX_SPARE                      0x3D2C
+#define SENINF4_MUX_DATA                       0x3D30
+#define SENINF4_MUX_DATA_CNT                   0x3D34
+#define SENINF4_MUX_CROP                       0x3D38
+#define SENINF4_MUX_CTRL_EXT                   0x3D3C
+#define rsv_3D40_304                           0x3D40
+#define SENINF5_CTRL                           0x4200
+#define SENINF5_CTRL_EXT                       0x4204
+#define SENINF5_ASYNC_CTRL                     0x4208
+#define rsv_420C_253                           0x420C
+#define SENINF_TG5_PH_CNT                      0x4600
+#define SENINF_TG5_SEN_CK                      0x4604
+#define SENINF_TG5_TM_CTL                      0x4608
+#define SENINF_TG5_TM_SIZE                     0x460C
+#define SENINF_TG5_TM_CLK                      0x4610
+#define SENINF_TG5_TM_STP                      0x4614
+#define rsv_4618_131                           0x4618
+#define MIPI_RX_CON24_CSI4                     0x4824
+#define MIPI_RX_CON28_CSI4                     0x4828
+#define rsv_482C_2                             0x482C
+#define MIPI_RX_CON34_CSI4                     0x4834
+#define MIPI_RX_CON38_CSI4                     0x4838
+#define MIPI_RX_CON3C_CSI4                     0x483C
+#define rsv_4840_15                            0x4840
+#define MIPI_RX_CON7C_CSI4                     0x487C
+#define MIPI_RX_CON80_CSI4                     0x4880
+#define MIPI_RX_CON84_CSI4                     0x4884
+#define MIPI_RX_CON88_CSI4                     0x4888
+#define MIPI_RX_CON8C_CSI4                     0x488C
+#define MIPI_RX_CON90_CSI4                     0x4890
+#define MIPI_RX_CON94_CSI4                     0x4894
+#define MIPI_RX_CON98_CSI4                     0x4898
+#define rsv_489C                               0x489C
+#define MIPI_RX_CONA0_CSI4                     0x48A0
+#define rsv_48A4_3                             0x48A4
+#define MIPI_RX_CONB0_CSI4                     0x48B0
+#define MIPI_RX_CONB4_CSI4                     0x48B4
+#define MIPI_RX_CONB8_CSI4                     0x48B8
+#define MIPI_RX_CONBC_CSI4                     0x48BC
+#define MIPI_RX_CONC0_CSI4                     0x48C0
+#define MIPI_RX_CONC4_CSI4                     0x48C4
+#define MIPI_RX_CONC8_CSI4                     0x48C8
+#define MIPI_RX_CONCC_CSI4                     0x48CC
+#define MIPI_RX_COND0_CSI4                     0x48D0
+#define rsv_48D4_75                            0x48D4
+#define SENINF5_CSI2_CTL                       0x4A00
+#define SENINF5_CSI2_LNRC_TIMING               0x4A04
+#define SENINF5_CSI2_LNRD_TIMING               0x4A08
+#define SENINF5_CSI2_DPCM                      0x4A0C
+#define SENINF5_CSI2_INT_EN                    0x4A10
+#define SENINF5_CSI2_INT_STATUS                0x4A14
+#define SENINF5_CSI2_DGB_SEL                   0x4A18
+#define SENINF5_CSI2_DBG_PORT                  0x4A1C
+#define SENINF5_CSI2_SPARE0                    0x4A20
+#define SENINF5_CSI2_SPARE1                    0x4A24
+#define SENINF5_CSI2_LNRC_FSM                  0x4A28
+#define SENINF5_CSI2_LNRD_FSM                  0x4A2C
+#define SENINF5_CSI2_FRAME_LINE_NUM            0x4A30
+#define SENINF5_CSI2_GENERIC_SHORT             0x4A34
+#define SENINF5_CSI2_HSRX_DBG                  0x4A38
+#define SENINF5_CSI2_DI                        0x4A3C
+#define SENINF5_CSI2_HS_TRAIL                  0x4A40
+#define SENINF5_CSI2_DI_CTRL                   0x4A44
+#define rsv_4A48                               0x4A48
+#define SENINF5_CSI2_DETECT_CON1               0x4A4C
+#define SENINF5_CSI2_DETECT_CON2               0x4A50
+#define SENINF5_CSI2_DETECT_CON3               0x4A54
+#define SENINF5_CSI2_RLR0_CON0                 0x4A58
+#define SENINF5_CSI2_RLR1_CON0                 0x4A5C
+#define SENINF5_CSI2_RLR2_CON0                 0x4A60
+#define SENINF5_CSI2_RLR_CON0                  0x4A64
+#define SENINF5_CSI2_MUX_CON                   0x4A68
+#define SENINF5_CSI2_DETECT_DBG0               0x4A6C
+#define SENINF5_CSI2_DETECT_DBG1               0x4A70
+#define SENINF5_CSI2_RESYNC_MERGE_CTL          0x4A74
+#define SENINF5_CSI2_CTRL_TRIO_MUX             0x4A78
+#define SENINF5_CSI2_CTRL_TRIO_CON             0x4A7C
+#define SENINF5_FIX_ADDR_CPHY0_DBG             0x4A80
+#define SENINF5_FIX_ADDR_CPHY1_DBG             0x4A84
+#define SENINF5_FIX_ADDR_CPHY2_DBG             0x4A88
+#define SENINF5_FIX_ADDR_DBG                   0x4A8C
+#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG0   0x4A90
+#define SENINF5_WIRE_STATE_DECODE_CPHY0_DBG1   0x4A94
+#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG0   0x4A98
+#define SENINF5_WIRE_STATE_DECODE_CPHY1_DBG1   0x4A9C
+#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG0   0x4AA0
+#define SENINF5_WIRE_STATE_DECODE_CPHY2_DBG1   0x4AA4
+#define SENINF5_SYNC_RESYNC_CTL                0x4AA8
+#define SENINF5_POST_DETECT_CTL                0x4AAC
+#define SENINF5_WIRE_STATE_DECODE_CONFIG       0x4AB0
+#define SENINF5_CSI2_CPHY_LNRD_FSM             0x4AB4
+#define SENINF5_FIX_ADDR_CPHY0_DBG0            0x4AB8
+#define SENINF5_FIX_ADDR_CPHY0_DBG1            0x4ABC
+#define SENINF5_FIX_ADDR_CPHY0_DBG2            0x4AC0
+#define SENINF5_FIX_ADDR_CPHY1_DBG0            0x4AC4
+#define SENINF5_FIX_ADDR_CPHY1_DBG1            0x4AC8
+#define SENINF5_FIX_ADDR_CPHY1_DBG2            0x4ACC
+#define SENINF5_FIX_ADDR_CPHY2_DBG0            0x4AD0
+#define SENINF5_FIX_ADDR_CPHY2_DBG1            0x4AD4
+#define SENINF5_FIX_ADDR_CPHY2_DBG2            0x4AD8
+#define SENINF5_FIX_ADDR_DBG0                  0x4ADC
+#define SENINF5_FIX_ADDR_DBG1                  0x4AE0
+#define SENINF5_FIX_ADDR_DBG2                  0x4AE4
+#define SENINF5_CSI2_MODE                      0x4AE8
+#define rsv_4AEC                               0x4AEC
+#define SENINF5_CSI2_DI_EXT                    0x4AF0
+#define SENINF5_CSI2_DI_CTRL_EXT               0x4AF4
+#define SENINF5_CSI2_CPHY_LOOPBACK             0x4AF8
+#define rsv_4AFC                               0x4AFC
+#define SENINF5_CSI2_PROGSEQ_0                 0x4B00
+#define SENINF5_CSI2_PROGSEQ_1                 0x4B04
+#define rsv_4B08_2                             0x4B08
+#define SENINF5_CSI2_INT_EN_EXT                0x4B10
+#define SENINF5_CSI2_INT_STATUS_EXT            0x4B14
+#define SENINF5_CSI2_CPHY_FIX_POINT_RST        0x4B18
+#define SENINF5_CSI2_RLR3_CON0                 0x4B1C
+#define SENINF5_CSI2_DPHY_SYNC                 0x4B20
+#define SENINF5_CSI2_DESKEW_SYNC               0x4B24
+#define SENINF5_CSI2_DETECT_DBG2               0x4B28
+#define rsv_4B2C                               0x4B2C
+#define SENINF5_FIX_ADDR_CPHY3_DBG0            0x4B30
+#define SENINF5_FIX_ADDR_CPHY3_DBG1            0x4B34
+#define SENINF5_FIX_ADDR_CPHY3_DBG2            0x4B38
+#define SENINF5_CSI2_DI_EXT_2                  0x4B3C
+#define SENINF5_CSI2_DI_CTRL_EXT_2             0x4B40
+#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG0   0x4B44
+#define SENINF5_WIRE_STATE_DECODE_CPHY3_DBG1   0x4B48
+#define rsv_4B4C_109                           0x4B4C
+#define SENINF5_MUX_CTRL                       0x4D00
+#define SENINF5_MUX_INTEN                      0x4D04
+#define SENINF5_MUX_INTSTA                     0x4D08
+#define SENINF5_MUX_SIZE                       0x4D0C
+#define SENINF5_MUX_DEBUG_1                    0x4D10
+#define SENINF5_MUX_DEBUG_2                    0x4D14
+#define SENINF5_MUX_DEBUG_3                    0x4D18
+#define SENINF5_MUX_DEBUG_4                    0x4D1C
+#define SENINF5_MUX_DEBUG_5                    0x4D20
+#define SENINF5_MUX_DEBUG_6                    0x4D24
+#define SENINF5_MUX_DEBUG_7                    0x4D28
+#define SENINF5_MUX_SPARE                      0x4D2C
+#define SENINF5_MUX_DATA                       0x4D30
+#define SENINF5_MUX_DATA_CNT                   0x4D34
+#define SENINF5_MUX_CROP                       0x4D38
+#define SENINF5_MUX_CTRL_EXT                   0x4D3C
+#define rsv_4D40_1008                          0x4D40
+#define SENINF6_MUX_CTRL                       0x5D00
+#define SENINF6_MUX_INTEN                      0x5D04
+#define SENINF6_MUX_INTSTA                     0x5D08
+#define SENINF6_MUX_SIZE                       0x5D0C
+#define SENINF6_MUX_DEBUG_1                    0x5D10
+#define SENINF6_MUX_DEBUG_2                    0x5D14
+#define SENINF6_MUX_DEBUG_3                    0x5D18
+#define SENINF6_MUX_DEBUG_4                    0x5D1C
+#define SENINF6_MUX_DEBUG_5                    0x5D20
+#define SENINF6_MUX_DEBUG_6                    0x5D24
+#define SENINF6_MUX_DEBUG_7                    0x5D28
+#define SENINF6_MUX_SPARE                      0x5D2C
+#define SENINF6_MUX_DATA                       0x5D30
+#define SENINF6_MUX_DATA_CNT                   0x5D34
+#define SENINF6_MUX_CROP                       0x5D38
+#define SENINF6_MUX_CTRL_EXT                   0x5D3C
+#define rsv_5D40_1008                          0x5D40
+#define SENINF7_MUX_CTRL                       0x6D00
+#define SENINF7_MUX_INTEN                      0x6D04
+#define SENINF7_MUX_INTSTA                     0x6D08
+#define SENINF7_MUX_SIZE                       0x6D0C
+#define SENINF7_MUX_DEBUG_1                    0x6D10
+#define SENINF7_MUX_DEBUG_2                    0x6D14
+#define SENINF7_MUX_DEBUG_3                    0x6D18
+#define SENINF7_MUX_DEBUG_4                    0x6D1C
+#define SENINF7_MUX_DEBUG_5                    0x6D20
+#define SENINF7_MUX_DEBUG_6                    0x6D24
+#define SENINF7_MUX_DEBUG_7                    0x6D28
+#define SENINF7_MUX_SPARE                      0x6D2C
+#define SENINF7_MUX_DATA                       0x6D30
+#define SENINF7_MUX_DATA_CNT                   0x6D34
+#define SENINF7_MUX_CROP                       0x6D38
+#define SENINF7_MUX_CTRL_EXT                   0x6D3C
+#define rsv_6D40_1008                          0x6D40
+#define SENINF8_MUX_CTRL                       0x7D00
+#define SENINF8_MUX_INTEN                      0x7D04
+#define SENINF8_MUX_INTSTA                     0x7D08
+#define SENINF8_MUX_SIZE                       0x7D0C
+#define SENINF8_MUX_DEBUG_1                    0x7D10
+#define SENINF8_MUX_DEBUG_2                    0x7D14
+#define SENINF8_MUX_DEBUG_3                    0x7D18
+#define SENINF8_MUX_DEBUG_4                    0x7D1C
+#define SENINF8_MUX_DEBUG_5                    0x7D20
+#define SENINF8_MUX_DEBUG_6                    0x7D24
+#define SENINF8_MUX_DEBUG_7                    0x7D28
+#define SENINF8_MUX_SPARE                      0x7D2C
+#define SENINF8_MUX_DATA                       0x7D30
+#define SENINF8_MUX_DATA_CNT                   0x7D34
+#define SENINF8_MUX_CROP                       0x7D38
+#define SENINF8_MUX_CTRL_EXT                   0x7D3C
+#define rsv_7D40_20                            0x7D40
+
+#endif /* _SENINF_REG_H_ */
-- 
1.9.1

