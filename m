Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C50255B20
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 15:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbgH1NTk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 09:19:40 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:45529 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbgH1NR4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 09:17:56 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPA id C0FC9FF80F;
        Fri, 28 Aug 2020 13:17:48 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mripard@kernel.org,
        wens@csie.org, yong.deng@magewell.com, mchehab+samsung@kernel.org,
        p.zabel@pengutronix.de, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH v2 3/4] media: sunxi: sun6i-csi: Add support of MIPI CSI-2 for A83T
Date:   Fri, 28 Aug 2020 15:17:35 +0200
Message-Id: <20200828131737.12483-4-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
References: <20200828131737.12483-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch add the support only for the Allwinner A83T MIPI CSI-2.
Currently, the driver does not support the  V3s MIPI CSI-2 controller.
On the A83T, the CSI controller is the same as the other V3s Soc, but
the MIPI CSI2 controller is not.

It was tested with the ov8865 image sensor.

Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
---
 .../media/platform/sunxi/sun6i-csi/Makefile   |   2 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  84 +++++--
 .../sunxi/sun6i-csi/sun8i_a83t_dphy.c         |  39 ++++
 .../sunxi/sun6i-csi/sun8i_a83t_dphy.h         |  16 ++
 .../sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h     |  39 ++++
 .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c    | 217 ++++++++++++++++++
 .../sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.h    |  16 ++
 .../sun6i-csi/sun8i_a83t_mipi_csi2_reg.h      | 179 +++++++++++++++
 8 files changed, 575 insertions(+), 17 deletions(-)
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
index 680fa31f380a..cf346e536959 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -26,6 +26,7 @@
 
 #include "sun6i_csi.h"
 #include "sun6i_csi_reg.h"
+#include "sun8i_a83t_mipi_csi2.h"
 
 #define MODULE_NAME	"sun6i-csi"
 
@@ -160,10 +161,14 @@ int sun6i_csi_set_power(struct sun6i_csi *csi, bool enable)
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
@@ -189,10 +194,18 @@ int sun6i_csi_set_power(struct sun6i_csi *csi, bool enable)
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
@@ -421,27 +434,34 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
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
+	/* Bus width only applies to parallel bus. */
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
@@ -593,6 +613,9 @@ void sun6i_csi_set_stream(struct sun6i_csi *csi, bool enable)
 	struct regmap *regmap = sdev->regmap;
 
 	if (!enable) {
+		if (csi->v4l2_ep.bus_type == V4L2_MBUS_CSI2_DPHY)
+			sun6i_mipi_csi_set_stream(csi, 0);
+
 		regmap_update_bits(regmap, CSI_CAP_REG, CSI_CAP_CH0_VCAP_ON, 0);
 		regmap_write(regmap, CSI_CH_INT_EN_REG, 0);
 		return;
@@ -609,6 +632,9 @@ void sun6i_csi_set_stream(struct sun6i_csi *csi, bool enable)
 
 	regmap_update_bits(regmap, CSI_CAP_REG, CSI_CAP_CH0_VCAP_ON,
 			   CSI_CAP_CH0_VCAP_ON);
+
+	if (csi->v4l2_ep.bus_type == V4L2_MBUS_CSI2_DPHY)
+		sun6i_mipi_csi_set_stream(csi, 1);
 }
 
 /* -----------------------------------------------------------------------------
@@ -685,6 +711,7 @@ static int sun6i_csi_fwnode_parse(struct device *dev,
 				  struct v4l2_async_subdev *asd)
 {
 	struct sun6i_csi *csi = dev_get_drvdata(dev);
+	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
 
 	if (vep->base.port || vep->base.id) {
 		dev_warn(dev, "Only support a single port with one endpoint\n");
@@ -692,6 +719,17 @@ static int sun6i_csi_fwnode_parse(struct device *dev,
 	}
 
 	switch (vep->bus_type) {
+	case V4L2_MBUS_CSI2_DPHY:
+		if (!sdev->clk_mipi) {
+			dev_err(sdev->dev, "Use MIPI-CSI2 device with no MIPI clock\n");
+			return -ENOTCONN;
+		}
+		if (!sdev->clk_misc) {
+			dev_err(sdev->dev, "Use MIPI-CSI2 device with no misc clock\n");
+			return -ENOTCONN;
+		}
+		csi->v4l2_ep = *vep;
+		return 0;
 	case V4L2_MBUS_PARALLEL:
 	case V4L2_MBUS_BT656:
 		csi->v4l2_ep = *vep;
@@ -812,12 +850,13 @@ static const struct regmap_config sun6i_csi_regmap_config = {
 	.reg_bits       = 32,
 	.reg_stride     = 4,
 	.val_bits       = 32,
-	.max_register	= 0x9c,
+	.max_register	= 0x2000,
 };
 
 static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
 				      struct platform_device *pdev)
 {
+	struct device *dev = sdev->dev;
 	struct resource *res;
 	void __iomem *io_base;
 	int ret;
@@ -847,6 +886,19 @@ static int sun6i_csi_resource_request(struct sun6i_csi_dev *sdev,
 		return PTR_ERR(sdev->clk_ram);
 	}
 
+	if (of_device_is_compatible(dev->of_node, "allwinner,sun8i-a83t-csi")) {
+		sdev->clk_mipi = devm_clk_get(&pdev->dev, "mipi");
+		if (IS_ERR(sdev->clk_mipi)) {
+			sdev->clk_mipi = NULL;
+			dev_warn(&pdev->dev, "Unable to acquire mipi clock. No mipi support\n");
+		}
+
+		sdev->clk_misc = devm_clk_get(&pdev->dev, "misc");
+		if (IS_ERR(sdev->clk_misc)) {
+			sdev->clk_misc = NULL;
+			dev_warn(&pdev->dev, "Unable to acquire misc clock. No mipi support\n");
+		}
+	}
 	sdev->rstc_bus = devm_reset_control_get_shared(&pdev->dev, NULL);
 	if (IS_ERR(sdev->rstc_bus)) {
 		dev_err(&pdev->dev, "Cannot get reset controller\n");
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c
new file mode 100644
index 000000000000..bb9599c3bde9
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * sun6i_dphy.c
+ * Copyright Kévin L'hôpital (C) 2020
+ */
+
+#include "sun8i_a83t_dphy.h"
+#include "sun8i_a83t_dphy_reg.h"
+
+/* First initialization to turn on the dphy for the MIPI CSI2 controller
+ * initialization.
+ */
+
+void sun6i_dphy_first_init(struct sun6i_csi_dev *sdev)
+{
+	regmap_update_bits(sdev->regmap, DPHY_CTRL_REG, DPHY_CTRL_REG_DBG,
+			   DPHY_CTRL_REG_DBG);
+	regmap_update_bits(sdev->regmap, DPHY_CTRL_REG, DPHY_CTRL_REG_SHUT, 0);
+	regmap_update_bits(sdev->regmap, DPHY_CTRL_REG, DPHY_CTRL_REG_RSTN,
+			   DPHY_CTRL_REG_RSTN);
+}
+
+/* Second initialization to turn off the dphy and do its initialization. */
+void sun6i_dphy_second_init(struct sun6i_csi_dev *sdev)
+{
+	regmap_update_bits(sdev->regmap, DPHY_CTRL_REG, DPHY_CTRL_REG_DBG, 0);
+	regmap_update_bits(sdev->regmap, DPHY_CTRL_REG, DPHY_CTRL_REG_SHUT,
+			   DPHY_CTRL_REG_SHUT);
+	regmap_update_bits(sdev->regmap, DPHY_CTRL_REG, DPHY_CTRL_REG_RSTN,
+			   DPHY_CTRL_REG_RSTN);
+	regmap_update_bits(sdev->regmap, DPHY_ANA0_REG, DPHY_ANA0_REG_SNK_MASK,
+			   DPHY_ANA0_REG_SNK(0x02));
+	regmap_update_bits(sdev->regmap, DPHY_ANA0_REG, DPHY_ANA0_REG_RINT_MASK,
+			   DPHY_ANA0_REG_RINT(0x02));
+	regmap_update_bits(sdev->regmap, DPHY_ANA0_REG, DPHY_ANA0_REG_REXT, 0);
+	regmap_update_bits(sdev->regmap, DPHY_ANA0_REG, DPHY_ANA0_REG_ENREXT,
+			   DPHY_ANA0_REG_ENREXT);
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
index 000000000000..815692b112d2
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_dphy_reg.h
@@ -0,0 +1,39 @@
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
+
+#define DPHY_CTRL_REG			(DPHY_OFFSET + 0x010)
+#define DPHY_CTRL_REG_RSTN		BIT(31)
+#define DPHY_CTRL_REG_SHUT              BIT(15)
+#define DPHY_CTRL_REG_DBG               BIT(8)
+
+#define DPHY_STATUS_REG			(DPHY_OFFSET + 0x014)
+#define DPHY_STATUS_REG_CLK_STOP	BIT(10)
+#define DPHY_STATUS_REG_CLK_UPLS        BIT(9)
+#define DPHY_STATUS_REG_HSCLK           BIT(8)
+#define DPHY_STATUS_REG_D3_STOP         BIT(7)
+#define DPHY_STATUS_REG_D2_STOP         BIT(6)
+#define DPHY_STATUS_REG_D1_STOP         BIT(5)
+#define DPHY_STATUS_REG_D0_STOP         BIT(4)
+#define DPHY_STATUS_REG_D3_UPLS         BIT(3)
+#define DPHY_STATUS_REG_D2_UPLS         BIT(2)
+#define DPHY_STATUS_REG_D1_UPLS         BIT(1)
+#define DPHY_STATUS_REG_D0_UPLS         BIT(0)
+
+#define DPHY_ANA0_REG			(DPHY_OFFSET + 0x030)
+#define DPHY_ANA0_REG_ENREXT		BIT(31)
+#define DPHY_ANA0_REG_REXT              BIT(30)
+#define DPHY_ANA0_REG_RINT_MASK         GENMASK(29, 28)
+#define DPHY_ANA0_REG_RINT(v)           ((v) << 28)
+#define DPHY_ANA0_REG_SNK_MASK          GENMASK(22, 20)
+#define DPHY_ANA0_REG_SNK(v)            ((v) << 20)
+
+#endif /* __SUN8I_A83T_DPHY_REG_H__ */
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c
new file mode 100644
index 000000000000..2933238cbc95
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner A83t MIPI Camera Sensor Interface 2 driver
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
+void sun6i_mipi_csi_set_stream(struct sun6i_csi *csi, bool enable)
+{
+	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
+
+	if (enable)
+		regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+				   MIPI_CSI2_CFG_REG_SYNC_EN,
+				   MIPI_CSI2_CFG_REG_SYNC_EN);
+	else
+		regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+				   MIPI_CSI2_CFG_REG_SYNC_EN, 0);
+}
+
+void sun6i_mipi_csi_init(struct sun6i_csi_dev *sdev)
+{
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CTRL_REG,
+			   MIPI_CSI2_CTRL_REG_RSTN, MIPI_CSI2_CTRL_REG_RSTN);
+	regmap_write(sdev->regmap, MIPI_CSI2_RX_PKT_NUM_REG, 0xb8d257f8);
+	sun6i_dphy_first_init(sdev);
+	regmap_write(sdev->regmap, MIPI_CSI2_RSVD1_REG,
+		     HW_LOCK_REGISTER_VALUE_1);
+	regmap_write(sdev->regmap, MIPI_CSI2_RSVD2_REG,
+		     HW_LOCK_REGISTER_VALUE_2);
+	regmap_write(sdev->regmap, MIPI_CSI2_RX_PKT_NUM_REG, 0);
+	regmap_write(sdev->regmap, MIPI_CSI2_VCDT0_REG, 0);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_SYNC_DLY_CYCLE_MASK,
+			   MIPI_CSI2_CFG_REG_SYNC_DLY_CYCLE(0x11));
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_N_BYTE, 0);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_YC_SWAB, 0);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_NONE_UNPKT_RX_MODE,
+			   MIPI_CSI2_CFG_REG_NONE_UNPKT_RX_MODE);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_UNPKT_EN,
+			   MIPI_CSI2_CFG_REG_UNPKT_EN);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_BYPASS_ECC_EN,
+			   MIPI_CSI2_CFG_REG_BYPASS_ECC_EN);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_SYNC_EN,
+			   MIPI_CSI2_CFG_REG_SYNC_EN);
+	sun6i_dphy_second_init(sdev);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CTRL_REG,
+			   MIPI_CSI2_CTRL_REG_RSTN, MIPI_CSI2_CTRL_REG_RSTN);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_SYNC_DLY_CYCLE_MASK,
+			   MIPI_CSI2_CFG_REG_SYNC_DLY_CYCLE(0x08));
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_NONE_UNPKT_RX_MODE, 0);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_BYPASS_ECC_EN, 0);
+	regmap_update_bits(sdev->regmap, MIPI_CSI2_CFG_REG,
+			   MIPI_CSI2_CFG_REG_SYNC_EN, 0);
+}
+
+void sun6i_mipi_csi_setup_bus(struct sun6i_csi *csi)
+{
+	struct v4l2_fwnode_endpoint *endpoint = &csi->v4l2_ep;
+	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
+	int lane_num = endpoint->bus.mipi_csi2.num_data_lanes;
+	int flags = endpoint->bus.mipi_csi2.flags;
+	int total_rx_ch = 0;
+	int vc;
+
+	sun6i_mipi_csi_init(sdev);
+
+	if (IS_FLAG(flags, V4L2_MBUS_CSI2_CHANNEL_0)) {
+		vc = 0;
+		total_rx_ch++;
+	}
+
+	if (!total_rx_ch) {
+		dev_dbg(sdev->dev,
+			 "No receive channel assigned, using channel 0.\n");
+		vc = 0;
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
+	regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+			  MIPI_CSI2_VCDT0_REG_CH0_DT_MASK,
+			  get_pkt_fmt(csi->config.code));
+	regmap_write_bits(sdev->regmap, MIPI_CSI2_VCDT0_REG,
+			  MIPI_CSI2_VCDT0_REG_CH0_VC_MASK,
+			  vc << MIPI_CSI2_VCDT0_REG_CH0_VC_SHIFT);
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
index 000000000000..43cc46ea1aec
--- /dev/null
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun8i_a83t_mipi_csi2_reg.h
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Allwinner A83t MIPI CSI-2 register description
+ * Copyright Kévin L'hôpital (C) 2020
+ */
+
+#ifndef __SUN8I_A83T_MIPI_CSI2_REG_H__
+#define __SUN8I_A83T_MIPI_CSI2_REG_H__
+
+
+#define MIPI_CSI2_OFFSET				0x1000
+
+#define MIPI_CSI2_VERSION_REG				(MIPI_CSI2_OFFSET + 0x000)
+#define MIPI_CSI2_CTRL_REG				(MIPI_CSI2_OFFSET + 0x004)
+#define MIPI_CSI2_CTRL_REG_RSTN				BIT(31)
+
+#define MIPI_CSI2_RX_PKT_NUM_REG			(MIPI_CSI2_OFFSET + 0x008)
+#define MIPI_CSI2_RSVD0_REG				(MIPI_CSI2_OFFSET + 0x00c)
+
+#define MIPI_CSI2_RSVD1_REG				(MIPI_CSI2_OFFSET + 0x018)
+/* Value found in the BSP and need to be present but it is not describe in the
+ * datasheet.
+ */
+#define HW_LOCK_REGISTER_VALUE_1			0xb8c8a30c
+#define MIPI_CSI2_RSVD2_REG				(MIPI_CSI2_OFFSET + 0x01c)
+/* Value found in the BSP and need to be present but it is not describe in the
+ * datasheet.
+ */
+#define HW_LOCK_REGISTER_VALUE_2			0xb8df8ad7
+
+#define MIPI_CSI2_INT_STA0_REG				(MIPI_CSI2_OFFSET + 0x020)
+#define MIPI_CSI2_INT_STA0_REG_ECC_ERR_DBL              BIT(28)
+#define MIPI_CSI2_INT_STA0_REG_LINE_CKSM_ERR_VC3        BIT(27)
+#define MIPI_CSI2_INT_STA0_REG_LINE_CKSM_ERR_VC2        BIT(26)
+#define MIPI_CSI2_INT_STA0_REG_LINE_CKSM_ERR_VC1        BIT(25)
+#define MIPI_CSI2_INT_STA0_REG_LINE_CKSM_ERR_VC0        BIT(24)
+#define MIPI_CSI2_INT_STA0_REG_LINE_SEQ_ERR_DT3         BIT(23)
+#define MIPI_CSI2_INT_STA0_REG_LINE_SEQ_ERR_DT2         BIT(22)
+#define MIPI_CSI2_INT_STA0_REG_LINE_SEQ_ERR_DT1         BIT(21)
+#define MIPI_CSI2_INT_STA0_REG_LINE_SEQ_ERR_DT0         BIT(20)
+#define MIPI_CSI2_INT_STA0_REG_LS_LE_ERR_DT3            BIT(19)
+#define MIPI_CSI2_INT_STA0_REG_LS_LE_ERR_DT2            BIT(18)
+#define MIPI_CSI2_INT_STA0_REG_LS_LE_ERR_DT1            BIT(17)
+#define MIPI_CSI2_INT_STA0_REG_LS_LE_ERR_DT0            BIT(16)
+#define MIPI_CSI2_INT_STA0_REG_CRC_ERR_VC3              BIT(15)
+#define MIPI_CSI2_INT_STA0_REG_CRC_ERR_VC2              BIT(14)
+#define MIPI_CSI2_INT_STA0_REG_CRC_ERR_VC1              BIT(13)
+#define MIPI_CSI2_INT_STA0_REG_CRC_ERR_VC0              BIT(12)
+#define MIPI_CSI2_INT_STA0_REG_FRM_SEQ_ERR_VC3          BIT(11)
+#define MIPI_CSI2_INT_STA0_REG_FRM_SEQ_ERR_VC2          BIT(10)
+#define MIPI_CSI2_INT_STA0_REG_FRM_SEQ_ERR_VC1          BIT(9)
+#define MIPI_CSI2_INT_STA0_REG_FRM_SEQ_ERR_VC0          BIT(8)
+#define MIPI_CSI2_INT_STA0_REG_FS_FE_ERR_VC3            BIT(7)
+#define MIPI_CSI2_INT_STA0_REG_FS_FE_ERR_VC2            BIT(6)
+#define MIPI_CSI2_INT_STA0_REG_FS_FE_ERR_VC1            BIT(5)
+#define MIPI_CSI2_INT_STA0_REG_FS_FE_ERR_VC0            BIT(4)
+#define MIPI_CSI2_INT_STA0_REG_SOT_SYNC_ERR_3           BIT(3)
+#define MIPI_CSI2_INT_STA0_REG_SOT_SYNC_ERR_2           BIT(2)
+#define MIPI_CSI2_INT_STA0_REG_SOT_SYNC_ERR_1           BIT(1)
+#define MIPI_CSI2_INT_STA0_REG_SOT_SYNC_ERR_0		BIT(0)
+
+#define MIPI_CSI2_INT_STA1_REG				(MIPI_CSI2_OFFSET + 0x024)
+#define MIPI_CSI2_INT_STA1_REG_LINE_SEQ_ERR_DT7         BIT(23)
+#define MIPI_CSI2_INT_STA1_REG_LINE_SEQ_ERR_DT6         BIT(22)
+#define MIPI_CSI2_INT_STA1_REG_LINE_SEQ_ERR_DT5         BIT(21)
+#define MIPI_CSI2_INT_STA1_REG_LINE_SEQ_ERR_DT4         BIT(20)
+#define MIPI_CSI2_INT_STA1_REG_LS_LE_ERR_DT7            BIT(19)
+#define MIPI_CSI2_INT_STA1_REG_LS_LE_ERR_DT6            BIT(18)
+#define MIPI_CSI2_INT_STA1_REG_LS_LE_ERR_DT5            BIT(17)
+#define MIPI_CSI2_INT_STA1_REG_LS_LE_ERR_DT4            BIT(16)
+#define MIPI_CSI2_INT_STA1_REG_DT_ERR_VC3               BIT(15)
+#define MIPI_CSI2_INT_STA1_REG_DT_ERR_VC2               BIT(14)
+#define MIPI_CSI2_INT_STA1_REG_DT_ERR_VC1               BIT(13)
+#define MIPI_CSI2_INT_STA1_REG_DT_ERR_VC0               BIT(12)
+#define MIPI_CSI2_INT_STA1_REG_ECC_ERR1_VC3             BIT(11)
+#define MIPI_CSI2_INT_STA1_REG_ECC_ERR1_VC2             BIT(10)
+#define MIPI_CSI2_INT_STA1_REG_ECC_ERR1_VC1             BIT(9)
+#define MIPI_CSI2_INT_STA1_REG_ECC_ERR1_VC0             BIT(8)
+#define MIPI_CSI2_INT_STA1_REG_SOT_ERR_3                BIT(7)
+#define MIPI_CSI2_INT_STA1_REG_SOT_ERR_2                BIT(6)
+#define MIPI_CSI2_INT_STA1_REG_SOT_ERR_1                BIT(5)
+#define MIPI_CSI2_INT_STA1_REG_SOT_ERR_0                BIT(4)
+#define MIPI_CSI2_INT_STA1_REG_ESC_ENTRY_ERR_3          BIT(3)
+#define MIPI_CSI2_INT_STA1_REG_ESC_ENTRY_ERR_2          BIT(2)
+#define MIPI_CSI2_INT_STA1_REG_ESC_ENTRY_ERR_1          BIT(1)
+#define MIPI_CSI2_INT_STA1_REG_ESC_ENTRY_ERR_0		BIT(0)
+
+#define MIPI_CSI2_INT_MSK0_REG				(MIPI_CSI2_OFFSET + 0x028)
+#define MIPI_CSI2_INT_MSK0_REG_ECC_ERR_DBL_MSK          BIT(28)
+#define MIPI_CSI2_INT_MSK0_REG_CKSM_ERR_VC3_MSK         BIT(27)
+#define MIPI_CSI2_INT_MSK0_REG_CKSM_ERR_VC2_MSK         BIT(26)
+#define MIPI_CSI2_INT_MSK0_REG_CKSM_ERR_VC1_MSK         BIT(25)
+#define MIPI_CSI2_INT_MSK0_REG_CKSM_ERR_VC0_MSK         BIT(24)
+#define MIPI_CSI2_INT_MSK0_REG_LINE_SEQ_ERR_DT3_MSK     BIT(23)
+#define MIPI_CSI2_INT_MSK0_REG_LINE_SEQ_ERR_DT2_MSK     BIT(22)
+#define MIPI_CSI2_INT_MSK0_REG_LINE_SEQ_ERR_DT1_MSK     BIT(21)
+#define MIPI_CSI2_INT_MSK0_REG_LINE_SEQ_ERR_DT0_MSK     BIT(20)
+#define MIPI_CSI2_INT_MSK0_REG_LS_LE_ERR_DT3_MSK        BIT(19)
+#define MIPI_CSI2_INT_MSK0_REG_LS_LE_ERR_DT2_MSK        BIT(18)
+#define MIPI_CSI2_INT_MSK0_REG_LS_LE_ERR_DT1_MSK        BIT(17)
+#define MIPI_CSI2_INT_MSK0_REG_LS_LE_ERR_DT0_MSK        BIT(16)
+#define MIPI_CSI2_INT_MSK0_REG_CRC_ERR_VC3_MSK          BIT(15)
+#define MIPI_CSI2_INT_MSK0_REG_CRC_ERR_VC2_MSK          BIT(14)
+#define MIPI_CSI2_INT_MSK0_REG_CRC_ERR_VC1_MSK          BIT(13)
+#define MIPI_CSI2_INT_MSK0_REG_CRC_ERR_VC0_MSK          BIT(12)
+#define MIPI_CSI2_INT_MSK0_REG_FRM_SEQ_ERR_VC3_MSK      BIT(11)
+#define MIPI_CSI2_INT_MSK0_REG_FRM_SEQ_ERR_VC2_MSK      BIT(10)
+#define MIPI_CSI2_INT_MSK0_REG_FRM_SEQ_ERR_VC1_MSK      BIT(9)
+#define MIPI_CSI2_INT_MSK0_REG_FRM_SEQ_ERR_VC0_MSK      BIT(8)
+#define MIPI_CSI2_INT_MSK0_REG_FS_FE_ERR_VC3_MSK        BIT(7)
+#define MIPI_CSI2_INT_MSK0_REG_FS_FE_ERR_VC2_MSK        BIT(6)
+#define MIPI_CSI2_INT_MSK0_REG_FS_FE_ERR_VC1_MSK        BIT(5)
+#define MIPI_CSI2_INT_MSK0_REG_FS_FE_ERR_VC0_MSK        BIT(4)
+#define MIPI_CSI2_INT_MSK0_REG_SOT_SYNC_ERR_3_MSK       BIT(3)
+#define MIPI_CSI2_INT_MSK0_REG_SOT_SYNC_ERR_2_MSK       BIT(2)
+#define MIPI_CSI2_INT_MSK0_REG_SOT_SYNC_ERR_1_MSK       BIT(1)
+#define MIPI_CSI2_INT_MSK0_REG_SOT_SYNC_ERR_0_MSK	BIT(0)
+
+#define MIPI_CSI2_INT_MSK1_REG				(MIPI_CSI2_OFFSET + 0x02c)
+#define MIPI_CSI2_INT_MSK1_REG_DT_ERR_VC3_MSK           BIT(15)
+#define MIPI_CSI2_INT_MSK1_REG_DT_ERR_VC2_MSK           BIT(14)
+#define MIPI_CSI2_INT_MSK1_REG_DT_ERR_VC1_MSK           BIT(13)
+#define MIPI_CSI2_INT_MSK1_REG_DT_ERR_VC0_MSK           BIT(12)
+#define MIPI_CSI2_INT_MSK1_REG_ECC_ERR1_VC3_MSK         BIT(11)
+#define MIPI_CSI2_INT_MSK1_REG_ECC_ERR1_VC2_MSK         BIT(10)
+#define MIPI_CSI2_INT_MSK1_REG_ECC_ERR1_VC1_MSK         BIT(9)
+#define MIPI_CSI2_INT_MSK1_REG_ECC_ERR1_VC0_MSK         BIT(8)
+#define MIPI_CSI2_INT_MSK1_REG_SOT_ERR_3_MSK            BIT(7)
+#define MIPI_CSI2_INT_MSK1_REG_SOT_ERR_2_MSK            BIT(6)
+#define MIPI_CSI2_INT_MSK1_REG_SOT_ERR_1_MSK            BIT(5)
+#define MIPI_CSI2_INT_MSK1_REG_SOT_ERR_0_MSK            BIT(4)
+#define MIPI_CSI2_INT_MSK1_REG_ESC_ENTRY_ERR_3_MSK      BIT(3)
+#define MIPI_CSI2_INT_MSK1_REG_ESC_ENTRY_ERR_2_MSK      BIT(2)
+#define MIPI_CSI2_INT_MSK1_REG_ESC_ENTRY_ERR_1_MSK      BIT(1)
+#define MIPI_CSI2_INT_MSK1_REG_ESC_ENTRY_ERR_0_MSK	BIT(0)
+
+#define MIPI_CSI2_CFG_REG				(MIPI_CSI2_OFFSET + 0x100)
+#define MIPI_CSI2_CFG_REG_SYNC_EN                       BIT(31)
+#define MIPI_CSI2_CFG_REG_BYPASS_ECC_EN                 BIT(29)
+#define MIPI_CSI2_CFG_REG_UNPKT_EN                      BIT(28)
+#define MIPI_CSI2_CFG_REG_NONE_UNPKT_RX_MODE            BIT(27)
+#define MIPI_CSI2_CFG_REG_YC_SWAB                       BIT(26)
+#define MIPI_CSI2_CFG_REG_N_BYTE                        BIT(24)
+#define MIPI_CSI2_CFG_REG_SYNC_DLY_CYCLE(v)             ((v) << 18)
+#define MIPI_CSI2_CFG_REG_SYNC_DLY_CYCLE_MASK           GENMASK(22, 18)
+#define MIPI_CSI2_CFG_REG_N_CHANNEL_MASK                GENMASK(17, 16)
+#define MIPI_CSI2_CFG_REG_N_CHANNEL_SHIFT               16
+#define MIPI_CSI2_CFG_REG_N_LANE_MASK                   GENMASK(5, 4)
+#define MIPI_CSI2_CFG_REG_N_LANE_SHIFT			4
+
+#define MIPI_CSI2_VCDT0_REG				(MIPI_CSI2_OFFSET + 0x104)
+#define MIPI_CSI2_VCDT0_REG_DEFAULT                     0xc0804000
+#define MIPI_CSI2_VCDT0_REG_CH3_VC_MASK                 GENMASK(31, 30)
+#define MIPI_CSI2_VCDT0_REG_CH3_VC_SHIFT                30
+#define MIPI_CSI2_VCDT0_REG_CH3_DT_MASK                 GENMASK(29, 24)
+#define MIPI_CSI2_VCDT0_REG_CH3_DT_SHIFT                24
+#define MIPI_CSI2_VCDT0_REG_CH2_VC_MASK                 GENMASK(23, 22)
+#define MIPI_CSI2_VCDT0_REG_CH2_VC_SHIFT                22
+#define MIPI_CSI2_VCDT0_REG_CH2_DT_MASK                 GENMASK(21, 16)
+#define MIPI_CSI2_VCDT0_REG_CH2_DT_SHIFT                16
+#define MIPI_CSI2_VCDT0_REG_CH1_VC_MASK                 GENMASK(15, 14)
+#define MIPI_CSI2_VCDT0_REG_CH1_VC_SHIFT                14
+#define MIPI_CSI2_VCDT0_REG_CH1_DT_MASK                 GENMASK(13, 8)
+#define MIPI_CSI2_VCDT0_REG_CH1_DT_SHIFT                8
+#define MIPI_CSI2_VCDT0_REG_CH0_VC_MASK                 GENMASK(7, 6)
+#define MIPI_CSI2_VCDT0_REG_CH0_VC_SHIFT                6
+#define MIPI_CSI2_VCDT0_REG_CH0_DT_MASK			GENMASK(5, 0)
+
+#define MIPI_CSI2_VCDT1_REG				(MIPI_CSI2_OFFSET + 0x108)
+#define MIPI_CSI2_VCDT1_REG_CH7_VC_MASK                 GENMASK(31, 30)
+#define MIPI_CSI2_VCDT1_REG_CH7_DT_MASK                 GENMASK(29, 24)
+#define MIPI_CSI2_VCDT1_REG_CH6_VC_MASK                 GENMASK(23, 22)
+#define MIPI_CSI2_VCDT1_REG_CH6_DT_MASK                 GENMASK(21, 16)
+#define MIPI_CSI2_VCDT1_REG_CH5_VC_MASK                 GENMASK(15, 14)
+#define MIPI_CSI2_VCDT1_REG_CH5_DT_MASK                 GENMASK(13, 8)
+#define MIPI_CSI2_VCDT1_REG_CH4_VC_MASK                 GENMASK(7, 6)
+#define MIPI_CSI2_VCDT1_REG_CH4_DT_MASK			GENMASK(5, 0)
+
+#endif /* __SUN8I_A83T_MIPI_CSI2_REG_H__ */
-- 
2.17.1

