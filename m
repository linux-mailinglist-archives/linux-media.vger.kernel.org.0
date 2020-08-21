Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCB024D7D5
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 17:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgHUPBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 11:01:19 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:55557 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgHUPAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 11:00:40 -0400
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPA id D620E10000F;
        Fri, 21 Aug 2020 15:00:33 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mripard@kernel.org, wens@csie.org, yong.deng@magewell.com,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH 5/7] media: sunxi: sun6i-csi: Add support of MIPI CSI-2 for A83T
Date:   Fri, 21 Aug 2020 16:59:33 +0200
Message-Id: <20200821145935.20346-6-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch add the support only for the Allwinner A83T MIPI CSI2

Currently, the driver is not supported the other Allwinner V3's MIPI CSI2

It has been tested with the ov8865 image sensor.

Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
---
 .../media/platform/sunxi/sun6i-csi/Makefile   |   2 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  82 ++++--
 .../sunxi/sun6i-csi/sun8i_a83t_dphy.c         |  20 ++
 .../sunxi/sun6i-csi/sun8i_a83t_dphy.h         |  16 ++
 .../sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h     |  15 ++
 .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c    | 249 ++++++++++++++++++
 .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h    |  16 ++
 .../sun6i-csi/sun8i_a83t_mipi_csi2_reg.h      |  42 +++
 8 files changed, 425 insertions(+), 17 deletions(-)
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2_reg.h

diff --git a/drivers/media/platform/sunxi/sun6i-csi/Makefile b/drivers/media/platform/sunxi/sun6i-csi/Makefile
index e7e315347804..0f3849790463 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/Makefile
+++ b/drivers/media/platform/sunxi/sun6i-csi/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-sun6i-csi-y += sun6i_video.o sun6i_csi.o
+sun6i-csi-y += sun6i_video.o sun6i_csi.o sun8i_a83t_mipi_csi2.o sun8i_a83t_dphy.o
 
 obj-$(CONFIG_VIDEO_SUN6I_CSI) += sun6i-csi.o
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 680fa31f380a..37aec0b57a46 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -26,6 +26,7 @@
 
 #include "sun6i_csi.h"
 #include "sun6i_csi_reg.h"
+#include "sun8i_a83t_mipi_csi2.h"
 
 #define MODULE_NAME	"sun6i-csi"
 
@@ -40,6 +41,18 @@ bool sun6i_csi_is_format_supported(struct sun6i_csi *csi,
 {
 	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
 
+	if (csi->v4l2_ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
+		if (!sdev->clk_mipi) {
+			dev_err(sdev->dev, "Use MIPI-CSI2 device with no MIPI clock\n");
+			return false;
+		}
+		if (!sdev->clk_misc) {
+			dev_err(sdev->dev, "Use MIPI-CSI2 device with no misc clock\n");
+			return false;
+		}
+		return true;
+	}
+
 	/*
 	 * Some video receivers have the ability to be compatible with
 	 * 8bit and 16bit bus width.
@@ -160,10 +173,14 @@ int sun6i_csi_set_power(struct sun6i_csi *csi, bool enable)
 		regmap_update_bits(regmap, CSI_EN_REG, CSI_EN_CSI_EN, 0);
 
 		clk_disable_unprepare(sdev->clk_ram);
+
 		if (of_device_is_compatible(dev->of_node,
 					    "allwinner,sun50i-a64-csi"))
 			clk_rate_exclusive_put(sdev->clk_mod);
 		clk_disable_unprepare(sdev->clk_mod);
+		if (csi->v4l2_ep.bus_type == V4L2_MBUS_CSI2_DPHY)
+			sun6i_mipi_csi_clk_disable(csi);
+
 		reset_control_assert(sdev->rstc_bus);
 		return 0;
 	}
@@ -189,10 +206,18 @@ int sun6i_csi_set_power(struct sun6i_csi *csi, bool enable)
 		goto clk_ram_disable;
 	}
 
+	if (csi->v4l2_ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
+		ret = sun6i_mipi_csi_clk_enable(csi);
+		if (ret)
+			goto reset_control_assert;
+	}
+
 	regmap_update_bits(regmap, CSI_EN_REG, CSI_EN_CSI_EN, CSI_EN_CSI_EN);
 
 	return 0;
 
+reset_control_assert:
+	reset_control_assert(sdev->rstc_bus);
 clk_ram_disable:
 	clk_disable_unprepare(sdev->clk_ram);
 clk_mod_disable:
@@ -421,27 +446,33 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
 		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
 			cfg |= CSI_IF_CFG_CLK_POL_FALLING_EDGE;
 		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		cfg |= CSI_IF_CFG_MIPI_IF_MIPI;
+		sun6i_mipi_csi_setup_bus(csi);
+		break;
 	default:
 		dev_warn(sdev->dev, "Unsupported bus type: %d\n",
 			 endpoint->bus_type);
 		break;
 	}
 
-	switch (bus_width) {
-	case 8:
-		cfg |= CSI_IF_CFG_IF_DATA_WIDTH_8BIT;
-		break;
-	case 10:
-		cfg |= CSI_IF_CFG_IF_DATA_WIDTH_10BIT;
-		break;
-	case 12:
-		cfg |= CSI_IF_CFG_IF_DATA_WIDTH_12BIT;
-		break;
-	case 16: /* No need to configure DATA_WIDTH for 16bit */
-		break;
-	default:
-		dev_warn(sdev->dev, "Unsupported bus width: %u\n", bus_width);
-		break;
+	if (endpoint->bus_type != V4L2_MBUS_CSI2_DPHY) {
+		switch (bus_width) {
+		case 8:
+			cfg |= CSI_IF_CFG_IF_DATA_WIDTH_8BIT;
+			break;
+		case 10:
+			cfg |= CSI_IF_CFG_IF_DATA_WIDTH_10BIT;
+			break;
+		case 12:
+			cfg |= CSI_IF_CFG_IF_DATA_WIDTH_12BIT;
+			break;
+		case 16: /* No need to configure DATA_WIDTH for 16bit */
+			break;
+		default:
+			dev_warn(sdev->dev, "Unsupported bus width: %u\n", bus_width);
+			break;
+		}
 	}
 
 	regmap_write(sdev->regmap, CSI_IF_CFG_REG, cfg);
@@ -593,6 +624,9 @@ void sun6i_csi_set_stream(struct sun6i_csi *csi, bool enable)
 	struct regmap *regmap = sdev->regmap;
 
 	if (!enable) {
+		if (csi->v4l2_ep.bus_type == V4L2_MBUS_CSI2_DPHY)
+			sun6i_mipi_csi_set_stream(csi, 0);
+
 		regmap_update_bits(regmap, CSI_CAP_REG, CSI_CAP_CH0_VCAP_ON, 0);
 		regmap_write(regmap, CSI_CH_INT_EN_REG, 0);
 		return;
@@ -609,6 +643,9 @@ void sun6i_csi_set_stream(struct sun6i_csi *csi, bool enable)
 
 	regmap_update_bits(regmap, CSI_CAP_REG, CSI_CAP_CH0_VCAP_ON,
 			   CSI_CAP_CH0_VCAP_ON);
+
+	if (csi->v4l2_ep.bus_type == V4L2_MBUS_CSI2_DPHY)
+		sun6i_mipi_csi_set_stream(csi, 1);
 }
 
 /* -----------------------------------------------------------------------------
@@ -692,6 +729,7 @@ static int sun6i_csi_fwnode_parse(struct device *dev,
 	}
 
 	switch (vep->bus_type) {
+	case V4L2_MBUS_CSI2_DPHY:
 	case V4L2_MBUS_PARALLEL:
 	case V4L2_MBUS_BT656:
 		csi->v4l2_ep = *vep;
@@ -812,7 +850,7 @@ static const struct regmap_config sun6i_csi_regmap_config = {
 	.reg_bits       = 32,
 	.reg_stride     = 4,
 	.val_bits       = 32,
-	.max_register	= 0x9c,
+	.max_register	= 0x2000,
 };
 
 static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
@@ -847,6 +885,18 @@ static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
 		return PTR_ERR(sdev->clk_ram);
 	}
 
+	sdev->clk_mipi = devm_clk_get(&pdev->dev, "mipi");
+	if (IS_ERR(sdev->clk_mipi)) {
+		sdev->clk_mipi = NULL;
+		dev_warn(&pdev->dev, "Unable to acquire mipi clock. No mipi support\n");
+	}
+
+	sdev->clk_misc = devm_clk_get(&pdev->dev, "misc");
+	if (IS_ERR(sdev->clk_misc)) {
+		sdev->clk_misc = NULL;
+		dev_warn(&pdev->dev, "Unable to acquire misc clock. No mipi support\n");
+	}
+
 	sdev->rstc_bus = devm_reset_control_get_shared(&pdev->dev, NULL);
 	if (IS_ERR(sdev->rstc_bus)) {
 		dev_err(&pdev->dev, "Cannot get reset controller\n");
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c
new file mode 100644
index 000000000000..3f5e4395aaa5
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * sun6i_dphy.c
+ * Copyright Kévin L'hôpital (C) 2020
+ */
+
+#include "sun8i_a83t_dphy.h"
+#include "sun8i_a83t_dphy_reg.h"
+
+void sun6i_dphy_first_init(struct sun6i_csi_dev *sdev)
+{
+	regmap_write(sdev->regmap, DPHY_CTRL_REG, 0xb8df698e);
+}
+
+void sun6i_dphy_second_init(struct sun6i_csi_dev *sdev)
+{
+	regmap_write(sdev->regmap, DPHY_CTRL_REG, 0x80008000);
+	regmap_write(sdev->regmap, DPHY_ANA0_REG, 0xa0200000);
+}
+
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.h b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.h
new file mode 100644
index 000000000000..f776ed098cb3
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * sun6i_dphy.h
+ * Copyright Kévin L'hôpital (C) 2020
+ */
+
+#ifndef __SUN8I_A83T_DPHY_H__
+#define __SUN8I_A83T_DPHY_H__
+
+#include <linux/regmap.h>
+#include "sun6i_csi.h"
+
+void sun6i_dphy_first_init(struct sun6i_csi_dev *sdev);
+void sun6i_dphy_second_init(struct sun6i_csi_dev *sdev);
+
+#endif /* __SUN8I_A83T_DPHY_H__ */
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h
new file mode 100644
index 000000000000..c88824e4ec2e
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Allwinner A83t DPHY register description
+ * Copyright Kévin L'hôpital (C) 2020
+ */
+
+#ifndef __SUN8I_A83T_DPHY_REG_H__
+#define __SUN8I_A83T_DPHY_REG_H__
+
+
+#define DPHY_OFFSET			0x1000
+#define DPHY_CTRL_REG			(DPHY_OFFSET + 0x010)
+#define DPHY_ANA0_REG			(DPHY_OFFSET + 0x030)
+
+#endif /* __SUN8I_A83T_DPHY_REG_H__ */
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c
new file mode 100644
index 000000000000..3f117e8d447f
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner A83t MIPI Camera Sensor Interface driver
+ * Copyright Kévin L'hôpital (C) 2020
+ */
+
+#include <linux/clk.h>
+#include "sun8i_a83t_mipi_csi2.h"
+#include "sun8i_a83t_mipi_csi2_reg.h"
+#include "sun8i_a83t_dphy.h"
+#include <linux/delay.h>
+
+#define IS_FLAG(x, y) (((x) & (y)) == y)
+
+enum mipi_csi2_pkt_fmt {
+	MIPI_FS           = 0X00,
+	MIPI_FE           = 0X01,
+	MIPI_LS           = 0X02,
+	MIPI_LE           = 0X03,
+	MIPI_SDAT0          = 0X08,
+	MIPI_SDAT1          = 0X09,
+	MIPI_SDAT2          = 0X0A,
+	MIPI_SDAT3          = 0X0B,
+	MIPI_SDAT4          = 0X0C,
+	MIPI_SDAT5          = 0X0D,
+	MIPI_SDAT6          = 0X0E,
+	MIPI_SDAT7          = 0X0F,
+	MIPI_BLK            = 0X11,
+	MIPI_EMBD         = 0X12,
+	MIPI_YUV420       = 0X18,
+	MIPI_YUV420_10    = 0X19,
+	MIPI_YUV420_CSP   = 0X1C,
+	MIPI_YUV420_CSP_10 =  0X1D,
+	MIPI_YUV422       = 0X1E,
+	MIPI_YUV422_10    = 0X1F,
+	MIPI_RGB565       = 0X22,
+	MIPI_RGB888       = 0X24,
+	MIPI_RAW8         = 0X2A,
+	MIPI_RAW10          = 0X2B,
+	MIPI_RAW12          = 0X2C,
+	MIPI_USR_DAT0     = 0X30,
+	MIPI_USR_DAT1     = 0X31,
+	MIPI_USR_DAT2     = 0X32,
+	MIPI_USR_DAT3     = 0X33,
+	MIPI_USR_DAT4     = 0X34,
+	MIPI_USR_DAT5     = 0X35,
+	MIPI_USR_DAT6     = 0X36,
+	MIPI_USR_DAT7     = 0X37,
+};
+
+static inline struct sun6i_csi_dev *sun6i_csi_to_dev(struct sun6i_csi *csi)
+{
+	return container_of(csi, struct sun6i_csi_dev, csi);
+}
+
+static enum mipi_csi2_pkt_fmt get_pkt_fmt(u16 bus_pix_code)
+{
+	switch (bus_pix_code) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		return MIPI_RGB565;
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		return MIPI_YUV422;
+	case MEDIA_BUS_FMT_UYVY10_2X10:
+		return MIPI_YUV422_10;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		return MIPI_RGB888;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		return MIPI_RAW8;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		return MIPI_RAW10;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		return MIPI_RAW12;
+	default:
+		return MIPI_RAW8;
+	}
+}
+
+
+void sun6i_mipi_csi_set_stream(struct sun6i_csi *csi, bool enable)
+{
+	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
+
+	if (enable)
+		regmap_write_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+				  MIPI_CSI2_CFG_REG_SYNC_EN,
+				  MIPI_CSI2_CFG_REG_SYNC_EN);
+	else
+		regmap_write_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+				  MIPI_CSI2_CFG_REG_SYNC_EN, 0);
+
+}
+
+void sun6i_mipi_csi_init(struct sun6i_csi_dev *sdev)
+{
+	regmap_write(sdev->regmap, MIPI_CSI2_CTRL_REG, 0xb8c39bec);
+	regmap_write(sdev->regmap, MIPI_CSI2_RX_PKT_NUM_REG, 0xb8d257f8);
+	sun6i_dphy_first_init(sdev);
+	regmap_write(sdev->regmap, MIPI_CSI2_RSVD1_REG,
+		     HW_LOCK_REGISTER_VALUE_1);
+	regmap_write(sdev->regmap, MIPI_CSI2_RSVD2_REG,
+		     HW_LOCK_REGISTER_VALUE_2);
+	regmap_write(sdev->regmap, MIPI_CSI2_RX_PKT_NUM_REG, 0);
+	regmap_write(sdev->regmap, MIPI_CSI2_VCDT0_REG, 0);
+	regmap_write(sdev->regmap, MIPI_CSI2_CFG_REG, 0xb8c64f24);
+	sun6i_dphy_second_init(sdev);
+	regmap_write(sdev->regmap, MIPI_CSI2_CTRL_REG, 0x80000000);
+	regmap_write(sdev->regmap, MIPI_CSI2_CFG_REG, 0x12200000);
+}
+
+void sun6i_mipi_csi_setup_bus(struct sun6i_csi *csi)
+{
+	struct v4l2_fwnode_endpoint *endpoint = &csi->v4l2_ep;
+	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
+	int lane_num = endpoint->bus.mipi_csi2.num_data_lanes;
+	int flags = endpoint->bus.mipi_csi2.flags;
+	int total_rx_ch = 0;
+	int vc[4];
+	int ch;
+
+	sun6i_mipi_csi_init(sdev);
+
+	if (IS_FLAG(flags, V4L2_MBUS_CSI2_CHANNEL_0)) {
+		vc[total_rx_ch] = 0;
+		total_rx_ch++;
+	}
+
+	if (IS_FLAG(flags, V4L2_MBUS_CSI2_CHANNEL_1)) {
+		vc[total_rx_ch] = 1;
+		total_rx_ch++;
+	}
+
+	if (IS_FLAG(flags, V4L2_MBUS_CSI2_CHANNEL_2)) {
+		vc[total_rx_ch] = 2;
+		total_rx_ch++;
+	}
+
+	if (IS_FLAG(flags, V4L2_MBUS_CSI2_CHANNEL_3)) {
+		vc[total_rx_ch] = 3;
+		total_rx_ch++;
+	}
+
+	if (!total_rx_ch) {
+		dev_dbg(sdev->dev,
+			 "No receive channel assigned, using channel 0.\n");
+		vc[total_rx_ch] = 0;
+		total_rx_ch++;
+	}
+	/* Set lane. */
+	regmap_write_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			  MIPI_CSI2_CFG_REG_N_LANE_MASK, (lane_num - 1) <<
+			  MIPI_CSI2_CFG_REG_N_LANE_SHIFT);
+	/* Set total channels. */
+	regmap_write_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			  MIPI_CSI2_CFG_REG_N_CHANNEL_MASK, (total_rx_ch - 1) <<
+			  MIPI_CSI2_CFG_REG_N_CHANNEL_SHIFT);
+
+	for (ch = 0; ch < total_rx_ch; ch++) {
+		switch (ch) {
+		case 0:
+			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+					  MIPI_CSI2_VCDT0_REG_CH0_DT_MASK,
+					  get_pkt_fmt(csi->config.code));
+			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+					  MIPI_CSI2_VCDT0_REG_CH0_VC_MASK,
+					  vc[ch] << MIPI_CSI2_VCDT0_REG_CH0_VC_SHIFT);
+			break;
+		case 1:
+			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+					  MIPI_CSI2_VCDT0_REG_CH1_DT_MASK,
+					  get_pkt_fmt(csi->config.code)
+					  <<
+					  MIPI_CSI2_VCDT0_REG_CH1_DT_SHIFT);
+			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+					  MIPI_CSI2_VCDT0_REG_CH1_VC_MASK,
+					  vc[ch] << MIPI_CSI2_VCDT0_REG_CH1_VC_SHIFT);
+			break;
+		case 2:
+			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+					  MIPI_CSI2_VCDT0_REG_CH2_DT_MASK,
+					  get_pkt_fmt(csi->config.code)
+					  <<
+					  MIPI_CSI2_VCDT0_REG_CH2_DT_SHIFT);
+			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+					  MIPI_CSI2_VCDT0_REG_CH2_VC_MASK,
+					  vc[ch] << MIPI_CSI2_VCDT0_REG_CH2_VC_SHIFT);
+			break;
+		case 3:
+			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+					  MIPI_CSI2_VCDT0_REG_CH3_DT_MASK,
+					  get_pkt_fmt(csi->config.code)
+					  <<
+					  MIPI_CSI2_VCDT0_REG_CH3_DT_SHIFT);
+			regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+					  MIPI_CSI2_VCDT0_REG_CH3_VC_MASK,
+					  vc[ch] << MIPI_CSI2_VCDT0_REG_CH3_VC_SHIFT);
+			break;
+		default:
+			regmap_write(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+				     MIPI_CSI2_VCDT0_REG_DEFAULT);
+			break;
+		}
+	}
+	mdelay(10);
+
+}
+
+int sun6i_mipi_csi_clk_enable(struct sun6i_csi *csi)
+{
+	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
+	int ret;
+
+	ret = clk_prepare_enable(sdev->clk_mipi);
+	if (ret) {
+		dev_err(sdev->dev, "Enable clk_mipi clk err %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(sdev->clk_misc);
+	if (ret) {
+		dev_err(sdev->dev, "Enable clk_misc clk err %d\n", ret);
+		goto clk_mipi_disable;
+	}
+
+	return 0;
+
+clk_mipi_disable:
+	clk_disable_unprepare(sdev->clk_mipi);
+	return ret;
+}
+
+void sun6i_mipi_csi_clk_disable(struct sun6i_csi *csi)
+{
+	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
+
+	clk_disable_unprepare(sdev->clk_misc);
+	clk_disable_unprepare(sdev->clk_mipi);
+}
+
+
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h
new file mode 100644
index 000000000000..a94c69ccee39
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright Kévin L'hôpital (C) 2020
+ */
+
+#ifndef __SUN8I_A83T_MIPI_CSI2_H__
+#define __SUN8I_A83T_MIPI_CSI2_H__
+#include <linux/regmap.h>
+#include "sun6i_csi.h"
+
+void sun6i_mipi_csi_set_stream(struct sun6i_csi *csi, bool enable);
+void sun6i_mipi_csi_setup_bus(struct sun6i_csi *csi);
+int sun6i_mipi_csi_clk_enable(struct sun6i_csi *csi);
+void sun6i_mipi_csi_clk_disable(struct sun6i_csi *csi);
+
+#endif /* __SUN8I_A83T_MIPI_CSI2_H__ */
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2_reg.h b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2_reg.h
new file mode 100644
index 000000000000..4d6fde3e50ef
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2_reg.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Allwinner A83t MIPI CSI register description
+ * Copyright Kévin L'hôpital (C) 2020
+ */
+
+#ifndef __SUN8I_A83T_MIPI_CSI2_REG_H__
+#define __SUN8I_A83T_MIPI_CSI2_REG_H__
+
+
+#define MIPI_CSI2_OFFSET			0x1000
+#define MIPI_CSI2_CTRL_REG			(MIPI_CSI2_OFFSET + 0x004)
+#define MIPI_CSI2_RX_PKT_NUM_REG		(MIPI_CSI2_OFFSET + 0x008)
+#define MIPI_CSI2_RSVD1_REG			(MIPI_CSI2_OFFSET + 0x018)
+#define HW_LOCK_REGISTER_VALUE_1		0xb8c8a30c
+#define MIPI_CSI2_RSVD2_REG			(MIPI_CSI2_OFFSET + 0x01c)
+#define HW_LOCK_REGISTER_VALUE_2		0xb8df8ad7
+#define MIPI_CSI2_CFG_REG			(MIPI_CSI2_OFFSET + 0x100)
+#define MIPI_CSI2_CFG_REG_SYNC_EN		BIT(31)
+#define MIPI_CSI2_CFG_REG_N_LANE_SHIFT		4
+#define MIPI_CSI2_CFG_REG_N_LANE_MASK		0x30
+#define MIPI_CSI2_CFG_REG_N_CHANNEL_SHIFT	16
+#define MIPI_CSI2_CFG_REG_N_CHANNEL_MASK	0x30000
+#define MIPI_CSI2_VCDT0_REG			(MIPI_CSI2_OFFSET + 0x104)
+#define MIPI_CSI2_VCDT0_REG_CH0_DT_MASK		0x3f
+#define MIPI_CSI2_VCDT0_REG_CH0_VC_SHIFT	6
+#define MIPI_CSI2_VCDT0_REG_CH0_VC_MASK		0xc0
+#define MIPI_CSI2_VCDT0_REG_CH1_DT_SHIFT	8
+#define MIPI_CSI2_VCDT0_REG_CH1_DT_MASK		0x3f00
+#define MIPI_CSI2_VCDT0_REG_CH1_VC_SHIFT	14
+#define MIPI_CSI2_VCDT0_REG_CH1_VC_MASK		0xc000
+#define MIPI_CSI2_VCDT0_REG_CH2_DT_SHIFT	16
+#define MIPI_CSI2_VCDT0_REG_CH2_DT_MASK		0x3f0000
+#define MIPI_CSI2_VCDT0_REG_CH2_VC_SHIFT	22
+#define MIPI_CSI2_VCDT0_REG_CH2_VC_MASK		0xc00000
+#define MIPI_CSI2_VCDT0_REG_CH3_DT_SHIFT	24
+#define MIPI_CSI2_VCDT0_REG_CH3_DT_MASK		0x3f000000
+#define MIPI_CSI2_VCDT0_REG_CH3_VC_SHIFT	30
+#define MIPI_CSI2_VCDT0_REG_CH3_VC_MASK		0xc0000000
+#define MIPI_CSI2_VCDT0_REG_DEFAULT		0xc0804000
+
+#endif /* __SUN8I_A83T_MIPI_CSI2_REG_H__ */
-- 
2.17.1

