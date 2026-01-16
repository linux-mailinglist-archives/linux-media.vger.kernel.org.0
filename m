Return-Path: <linux-media+bounces-50897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 704A3D31896
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 14:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF3A330A8753
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 13:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879532571DA;
	Fri, 16 Jan 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqmE+nGF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89CC23EA86;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568678; cv=none; b=PKCzVuawfUbEg24ZjFuhMB344B86YTx1A1+Rxe4wtak0MdzfPhXwuTgSIufhnW5Cyzs++0Y/kbVS6dOtiP9+GtSHYHTvA5H8gtyNPhm/l0GFwiTzgNE3WRur8xBZ18tohtFJW9gw4+yrggNDtQwaAuxzcn8KqwZHGTKoY69SSfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568678; c=relaxed/simple;
	bh=RPrmW10fth5q3rXeUYdOgOOdcEIHoW850j+/V2PTNFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m7rx6rKuS4lZJC7dPVWT9kvLNHohJn3BZOjVXntyf/LTVC7pZFhMJXDm33q5Yz3AwYFXTganWgrDDUWf4wG6GQFfKQR6Pdsq6ULxbqGVKW0XfskaVy1PrrsBTZBYMBk55hbE2mtaGyhyCvrGsE50wopAUswjOOQEE1HNdpmK6Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqmE+nGF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A12CC2BC87;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568678;
	bh=RPrmW10fth5q3rXeUYdOgOOdcEIHoW850j+/V2PTNFw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CqmE+nGF6LPd2glY04MAyZXUOJfaoF4vCpOj9N8tIAQBs8piohTbrn04EE6hTyz73
	 MNVd3nepG72LZ2kOQ8K0iUweA2EpvDYOI9sLRSMVQl4w20bHVxUhaBHMibSPYzqR4W
	 EtgHblGV8dQono3vWzHU+p903ZGEYtwFOkWUkS+QYHdgI6Wwtry6Qg5TgNnz1xhUro
	 gPBuSoDTz+7sUf54GJ7NZF+mbY3NeuhDZZawcgAUFg0Jwx5rFziLbhK+bVfKUjN10Y
	 sEhxzLDJBp1kgsPdsEPG1NYf+MO/vzmfKD6/XlIp12yg+ShRwyPGyM3BSZkBISCsT0
	 7MwM73RCWGJKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC13D489A4;
	Fri, 16 Jan 2026 13:04:38 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 16 Jan 2026 14:02:47 +0100
Subject: [PATCH v5 2/3] media: synopsys: add driver for the designware mipi
 csi-2 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v5-2-45aa117f190a@collabora.com>
References: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v5-0-45aa117f190a@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768568677; l=22970;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=tfgQjisA13ykNsKc95bi8wucu4k/KPcgUrDsgS7AwHg=;
 b=gs43xQq1ON8x98Mza/f/Q8W67AkFT2Ou+iMlOUW/pmFYlTj5vo+8dq6Mgvd14mo4KVlYm8lqA
 fWGCRZzhQRdCbtPC0OvOXDRporSzF1jbhFYQyZVX4Eh3CYEZS9X7nNa
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
one input port and one output port. It receives the data with the
help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.

Add a V4L2 subdevice driver for this unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 MAINTAINERS                                        |   1 +
 drivers/media/platform/synopsys/Kconfig            |   1 +
 drivers/media/platform/synopsys/Makefile           |   1 +
 .../media/platform/synopsys/dw-mipi-csi2/Kconfig   |  17 +
 .../media/platform/synopsys/dw-mipi-csi2/Makefile  |   2 +
 .../platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c  | 735 +++++++++++++++++++++
 6 files changed, 757 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 965132e0933a..42a739417a10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25369,6 +25369,7 @@ M:	Michael Riesch <michael.riesch@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+F:	drivers/media/platform/synopsys/dw-mipi-csi2/
 
 SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
 M:	Jaehoon Chung <jh80.chung@samsung.com>
diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
index 4fd521f78425..7dbe5cbdd2cf 100644
--- a/drivers/media/platform/synopsys/Kconfig
+++ b/drivers/media/platform/synopsys/Kconfig
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+source "drivers/media/platform/synopsys/dw-mipi-csi2/Kconfig"
 source "drivers/media/platform/synopsys/hdmirx/Kconfig"
diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
index 3b12c574dd67..30951176b029 100644
--- a/drivers/media/platform/synopsys/Makefile
+++ b/drivers/media/platform/synopsys/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-y += dw-mipi-csi2/
 obj-y += hdmirx/
diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2/Kconfig b/drivers/media/platform/synopsys/dw-mipi-csi2/Kconfig
new file mode 100644
index 000000000000..d5d56a1fc491
--- /dev/null
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2/Kconfig
@@ -0,0 +1,17 @@
+config VIDEO_DW_MIPI_CSI2
+	tristate "Synopsys DesignWare MIPI CSI-2 Receiver"
+	depends on VIDEO_DEV
+	depends on V4L_PLATFORM_DRIVERS
+	depends on PM && COMMON_CLK
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  The Synopsys DesignWare MIPI CSI-2 Receiver is a CSI-2 bridge with
+	  one input port and one output port. It receives the data with the
+	  help of an external MIPI PHY (C-PHY or D-PHY) and passes it to e.g.,
+	  the Rockchip Video Capture (VICAP) block on recent Rockchip SoCs.
+	  This is a driver for this unit.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called dw-mipi-csi2.
diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2/Makefile b/drivers/media/platform/synopsys/dw-mipi-csi2/Makefile
new file mode 100644
index 000000000000..e49a125c531e
--- /dev/null
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_VIDEO_DW_MIPI_CSI2) += dw-mipi-csi2.o
diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c b/drivers/media/platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c
new file mode 100644
index 000000000000..a7bd76afe2ee
--- /dev/null
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2/dw-mipi-csi2.c
@@ -0,0 +1,735 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synopsys DesignWare MIPI CSI-2 Receiver Driver
+ *
+ * Copyright (C) 2019 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ * Copyright (C) 2026 Collabora, Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+#define DW_MIPI_CSI2_N_LANES	0x04
+#define DW_MIPI_CSI2_RESETN	0x10
+#define DW_MIPI_CSI2_PHY_STATE	0x14
+#define DW_MIPI_CSI2_ERR1	0x20
+#define DW_MIPI_CSI2_ERR2	0x24
+#define DW_MIPI_CSI2_MSK1	0x28
+#define DW_MIPI_CSI2_MSK2	0x2c
+#define DW_MIPI_CSI2_CONTROL	0x40
+
+#define SW_CPHY_EN(x)		((x) << 0)
+#define SW_DSI_EN(x)		((x) << 4)
+#define SW_DATATYPE_FS(x)	((x) << 8)
+#define SW_DATATYPE_FE(x)	((x) << 14)
+#define SW_DATATYPE_LS(x)	((x) << 20)
+#define SW_DATATYPE_LE(x)	((x) << 26)
+
+#define DW_MIPI_CSI2_CLKS_MAX	1
+
+enum {
+	DW_MIPI_CSI2_PAD_SINK,
+	DW_MIPI_CSI2_PAD_SRC,
+	DW_MIPI_CSI2_PAD_MAX,
+};
+
+struct dw_mipi_csi2_format {
+	u32 code;
+	u8 depth;
+	u8 csi_dt;
+};
+
+struct dw_mipi_csi2_device {
+	struct device *dev;
+
+	void __iomem *base_addr;
+	struct clk_bulk_data *clks;
+	unsigned int clks_num;
+	struct phy *phy;
+	struct reset_control *reset;
+
+	const struct dw_mipi_csi2_format *formats;
+	unsigned int formats_num;
+
+	struct media_pad pads[DW_MIPI_CSI2_PAD_MAX];
+	struct v4l2_async_notifier notifier;
+	struct v4l2_subdev sd;
+
+	enum v4l2_mbus_type bus_type;
+	u32 lanes_num;
+};
+
+static const struct v4l2_mbus_framefmt default_format = {
+	.width = 3840,
+	.height = 2160,
+	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_RAW,
+	.ycbcr_enc = V4L2_YCBCR_ENC_601,
+	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
+	.xfer_func = V4L2_XFER_FUNC_NONE,
+};
+
+static const struct dw_mipi_csi2_format formats[] = {
+	/* YUV formats */
+	{
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.depth = 24,
+		.csi_dt = MIPI_CSI2_DT_RGB888,
+	},
+	{
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.depth = 24,
+		.csi_dt = MIPI_CSI2_DT_RGB888,
+	},
+	/* Bayer formats */
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+};
+
+static inline struct dw_mipi_csi2_device *to_csi2(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct dw_mipi_csi2_device, sd);
+}
+
+static inline __maybe_unused void
+dw_mipi_csi2_write(struct dw_mipi_csi2_device *csi2, unsigned int addr, u32 val)
+{
+	writel(val, csi2->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+dw_mipi_csi2_read(struct dw_mipi_csi2_device *csi2, unsigned int addr)
+{
+	return readl(csi2->base_addr + addr);
+}
+
+static const struct dw_mipi_csi2_format *
+dw_mipi_csi2_find_format(struct dw_mipi_csi2_device *csi2, u32 mbus_code)
+{
+	WARN_ON(csi2->formats_num == 0);
+
+	for (unsigned int i = 0; i < csi2->formats_num; i++) {
+		const struct dw_mipi_csi2_format *format = &csi2->formats[i];
+
+		if (format->code == mbus_code)
+			return format;
+	}
+
+	return NULL;
+}
+
+static int dw_mipi_csi2_start(struct dw_mipi_csi2_device *csi2)
+{
+	struct media_pad *source_pad;
+	union phy_configure_opts opts;
+	s64 link_freq;
+	u32 control = 0;
+	u32 lanes = csi2->lanes_num;
+	int ret;
+
+	if (lanes < 1 || lanes > 4)
+		return -EINVAL;
+
+	source_pad =
+		media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2_PAD_SINK]);
+	if (IS_ERR(source_pad))
+		return PTR_ERR(source_pad);
+
+	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
+	link_freq = v4l2_get_link_freq(source_pad, 0, 0);
+	if (link_freq <= 0)
+		return link_freq ?: -EINVAL;
+
+	switch (csi2->bus_type) {
+	case V4L2_MBUS_CSI2_DPHY:
+		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
+
+		ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2,
+								 lanes, cfg);
+		if (ret)
+			return ret;
+
+		ret = phy_set_mode(csi2->phy, PHY_MODE_MIPI_DPHY);
+		if (ret)
+			return ret;
+
+		ret = phy_configure(csi2->phy, &opts);
+		if (ret)
+			return ret;
+
+		control |= SW_CPHY_EN(0);
+		break;
+
+	case V4L2_MBUS_CSI2_CPHY:
+		/* TODO: implement CPHY configuration */
+		return -EOPNOTSUPP;
+	default:
+		return -EINVAL;
+	}
+
+	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
+		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
+
+	dw_mipi_csi2_write(csi2, DW_MIPI_CSI2_N_LANES, lanes - 1);
+	dw_mipi_csi2_write(csi2, DW_MIPI_CSI2_CONTROL, control);
+	dw_mipi_csi2_write(csi2, DW_MIPI_CSI2_RESETN, 1);
+
+	return phy_power_on(csi2->phy);
+}
+
+static void dw_mipi_csi2_stop(struct dw_mipi_csi2_device *csi2)
+{
+	phy_power_off(csi2->phy);
+
+	dw_mipi_csi2_write(csi2, DW_MIPI_CSI2_RESETN, 0);
+	dw_mipi_csi2_write(csi2, DW_MIPI_CSI2_MSK1, ~0);
+	dw_mipi_csi2_write(csi2, DW_MIPI_CSI2_MSK2, ~0);
+}
+
+static const struct media_entity_operations dw_mipi_csi2_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int dw_mipi_csi2_enum_mbus_code(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *sd_state,
+				       struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct dw_mipi_csi2_device *csi2 = to_csi2(sd);
+
+	switch (code->pad) {
+	case DW_MIPI_CSI2_PAD_SRC:
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(sd_state,
+							DW_MIPI_CSI2_PAD_SINK);
+		code->code = sink_fmt->code;
+
+		return 0;
+	case DW_MIPI_CSI2_PAD_SINK:
+		if (code->index > csi2->formats_num)
+			return -EINVAL;
+
+		code->code = csi2->formats[code->index].code;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int dw_mipi_csi2_set_fmt(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_format *format)
+{
+	struct dw_mipi_csi2_device *csi2 = to_csi2(sd);
+	const struct dw_mipi_csi2_format *fmt;
+	struct v4l2_mbus_framefmt *sink, *src;
+
+	/* the format on the source pad always matches the sink pad */
+	if (format->pad == DW_MIPI_CSI2_PAD_SRC)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!sink)
+		return -EINVAL;
+
+	fmt = dw_mipi_csi2_find_format(csi2, format->format.code);
+	if (!fmt)
+		format->format = default_format;
+
+	*sink = format->format;
+
+	/* propagate the format to the source pad */
+	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!src)
+		return -EINVAL;
+
+	*src = *sink;
+
+	return 0;
+}
+
+static int dw_mipi_csi2_set_routing(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    enum v4l2_subdev_format_whence which,
+				    struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+						&default_format);
+}
+
+static int dw_mipi_csi2_enable_streams(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *state, u32 pad,
+				       u64 streams_mask)
+{
+	struct dw_mipi_csi2_device *csi2 = to_csi2(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi2->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[DW_MIPI_CSI2_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2_PAD_SINK,
+					       DW_MIPI_CSI2_PAD_SRC,
+					       &streams_mask);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err;
+
+	ret = dw_mipi_csi2_start(csi2);
+	if (ret) {
+		dev_err(dev, "failed to enable CSI hardware\n");
+		goto err_pm_runtime_put;
+	}
+
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		goto err_csi_stop;
+
+	return 0;
+
+err_csi_stop:
+	dw_mipi_csi2_stop(csi2);
+err_pm_runtime_put:
+	pm_runtime_put(dev);
+err:
+	return ret;
+}
+
+static int dw_mipi_csi2_disable_streams(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					u32 pad, u64 streams_mask)
+{
+	struct dw_mipi_csi2_device *csi2 = to_csi2(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi2->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[DW_MIPI_CSI2_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2_PAD_SINK,
+					       DW_MIPI_CSI2_PAD_SRC,
+					       &streams_mask);
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+
+	dw_mipi_csi2_stop(csi2);
+
+	pm_runtime_put(dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops dw_mipi_csi2_pad_ops = {
+	.enum_mbus_code = dw_mipi_csi2_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = dw_mipi_csi2_set_fmt,
+	.set_routing = dw_mipi_csi2_set_routing,
+	.enable_streams = dw_mipi_csi2_enable_streams,
+	.disable_streams = dw_mipi_csi2_disable_streams,
+};
+
+static const struct v4l2_subdev_ops dw_mipi_csi2_ops = {
+	.pad = &dw_mipi_csi2_pad_ops,
+};
+
+static int dw_mipi_csi2_init_state(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = DW_MIPI_CSI2_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = DW_MIPI_CSI2_PAD_SRC,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+						&default_format);
+}
+
+static const struct v4l2_subdev_internal_ops dw_mipi_csi2_internal_ops = {
+	.init_state = dw_mipi_csi2_init_state,
+};
+
+static int dw_mipi_csi2_notifier_bound(struct v4l2_async_notifier *notifier,
+				       struct v4l2_subdev *sd,
+				       struct v4l2_async_connection *asd)
+{
+	struct dw_mipi_csi2_device *csi2 =
+		container_of(notifier, struct dw_mipi_csi2_device, notifier);
+	struct media_pad *sink_pad = &csi2->pads[DW_MIPI_CSI2_PAD_SINK];
+	int ret;
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, sink_pad,
+					      MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(csi2->dev, "failed to link source pad of %s\n",
+			sd->name);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations dw_mipi_csi2_notifier_ops = {
+	.bound = dw_mipi_csi2_notifier_bound,
+};
+
+static int dw_mipi_csi2_register_notifier(struct dw_mipi_csi2_device *csi2)
+{
+	struct v4l2_async_connection *asd;
+	struct v4l2_async_notifier *ntf = &csi2->notifier;
+	struct v4l2_fwnode_endpoint vep;
+	struct v4l2_subdev *sd = &csi2->sd;
+	struct device *dev = csi2->dev;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	if (!ep)
+		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
+
+	vep.bus_type = V4L2_MBUS_UNKNOWN;
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to parse endpoint\n");
+		goto out;
+	}
+
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "invalid bus type of endpoint\n");
+		goto out;
+	}
+
+	csi2->bus_type = vep.bus_type;
+	csi2->lanes_num = vep.bus.mipi_csi2.num_data_lanes;
+
+	v4l2_async_subdev_nf_init(ntf, sd);
+	ntf->ops = &dw_mipi_csi2_notifier_ops;
+
+	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto err_nf_cleanup;
+	}
+
+	ret = v4l2_async_nf_register(ntf);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
+		goto err_nf_cleanup;
+	}
+
+	goto out;
+
+err_nf_cleanup:
+	v4l2_async_nf_cleanup(ntf);
+out:
+	fwnode_handle_put(ep);
+	return ret;
+}
+
+static int dw_mipi_csi2_register(struct dw_mipi_csi2_device *csi2)
+{
+	struct media_pad *pads = csi2->pads;
+	struct v4l2_subdev *sd = &csi2->sd;
+	int ret;
+
+	ret = dw_mipi_csi2_register_notifier(csi2);
+	if (ret)
+		goto err;
+
+	v4l2_subdev_init(sd, &dw_mipi_csi2_ops);
+	sd->dev = csi2->dev;
+	sd->entity.ops = &dw_mipi_csi2_media_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	sd->internal_ops = &dw_mipi_csi2_internal_ops;
+	sd->owner = THIS_MODULE;
+	snprintf(sd->name, sizeof(sd->name), "dw-mipi-csi2 %s",
+		 dev_name(csi2->dev));
+
+	pads[DW_MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					    MEDIA_PAD_FL_MUST_CONNECT;
+	pads[DW_MIPI_CSI2_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, DW_MIPI_CSI2_PAD_MAX, pads);
+	if (ret)
+		goto err_notifier_unregister;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret) {
+		dev_err(sd->dev, "failed to register CSI-2 subdev\n");
+		goto err_subdev_cleanup;
+	}
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+err_notifier_unregister:
+	v4l2_async_nf_unregister(&csi2->notifier);
+	v4l2_async_nf_cleanup(&csi2->notifier);
+err:
+	return ret;
+}
+
+static void dw_mipi_csi2_unregister(struct dw_mipi_csi2_device *csi2)
+{
+	struct v4l2_subdev *sd = &csi2->sd;
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_async_nf_unregister(&csi2->notifier);
+	v4l2_async_nf_cleanup(&csi2->notifier);
+}
+
+static const struct of_device_id dw_mipi_csi2_of_match[] = {
+	{
+		.compatible = "rockchip,rk3568-mipi-csi2",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, dw_mipi_csi2_of_match);
+
+static int dw_mipi_csi2_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dw_mipi_csi2_device *csi2;
+	int ret;
+
+	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
+	if (!csi2)
+		return -ENOMEM;
+	csi2->dev = dev;
+	dev_set_drvdata(dev, csi2);
+
+	csi2->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csi2->base_addr))
+		return PTR_ERR(csi2->base_addr);
+
+	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
+	if (ret != DW_MIPI_CSI2_CLKS_MAX)
+		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
+	csi2->clks_num = ret;
+
+	csi2->phy = devm_phy_get(dev, NULL);
+	if (IS_ERR(csi2->phy))
+		return dev_err_probe(dev, PTR_ERR(csi2->phy),
+				     "failed to get MIPI CSI-2 PHY\n");
+
+	csi2->reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(csi2->reset))
+		return dev_err_probe(dev, PTR_ERR(csi2->reset),
+				     "failed to get reset\n");
+
+	csi2->formats = formats;
+	csi2->formats_num = ARRAY_SIZE(formats);
+
+	pm_runtime_enable(dev);
+
+	ret = phy_init(csi2->phy);
+	if (ret) {
+		ret = dev_err_probe(dev, ret,
+				    "failed to initialize MIPI CSI-2 PHY\n");
+		goto err_pm_runtime_disable;
+	}
+
+	ret = dw_mipi_csi2_register(csi2);
+	if (ret)
+		goto err_phy_exit;
+
+	return 0;
+
+err_phy_exit:
+	phy_exit(csi2->phy);
+err_pm_runtime_disable:
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static void dw_mipi_csi2_remove(struct platform_device *pdev)
+{
+	struct dw_mipi_csi2_device *csi2 = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	dw_mipi_csi2_unregister(csi2);
+	phy_exit(csi2->phy);
+	pm_runtime_disable(dev);
+}
+
+static int dw_mipi_csi2_runtime_suspend(struct device *dev)
+{
+	struct dw_mipi_csi2_device *csi2 = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(csi2->clks_num, csi2->clks);
+
+	return 0;
+}
+
+static int dw_mipi_csi2_runtime_resume(struct device *dev)
+{
+	struct dw_mipi_csi2_device *csi2 = dev_get_drvdata(dev);
+	int ret;
+
+	reset_control_assert(csi2->reset);
+	udelay(5);
+	reset_control_deassert(csi2->reset);
+
+	ret = clk_bulk_prepare_enable(csi2->clks_num, csi2->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(dw_mipi_csi2_pm_ops,
+				 dw_mipi_csi2_runtime_suspend,
+				 dw_mipi_csi2_runtime_resume, NULL);
+
+static struct platform_driver dw_mipi_csi2_drv = {
+	.driver = {
+		.name = "dw-mipi-csi2",
+		.of_match_table = dw_mipi_csi2_of_match,
+		.pm = &dw_mipi_csi2_pm_ops,
+	},
+	.probe = dw_mipi_csi2_probe,
+	.remove = dw_mipi_csi2_remove,
+};
+module_platform_driver(dw_mipi_csi2_drv);
+
+MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
+MODULE_LICENSE("GPL");

-- 
2.39.5



