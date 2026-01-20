Return-Path: <linux-media+bounces-51118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHZWB4qMcGkEYQAAu9opvQ
	(envelope-from <linux-media+bounces-51118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:21:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88E536C7
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 09:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CB89166B766
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 12:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1C7428465;
	Tue, 20 Jan 2026 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvCR06Jq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B4F42315A;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911752; cv=none; b=j2ATzXnu5TnjkjgO4p/uAXoXzKoSUM1KaMR+KSRcsSoGqxPAKOX9vJSrKOliC22H2F9fhXoRhfjpyZkmpz6KMNCTK0IRnV3//61geui2TAOKSY/gpjorHTCELCzpBAvjXQYDblD0hGtj+w0Bz6srUpr0RQv0L7rc/+wCfIMqRuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911752; c=relaxed/simple;
	bh=grzsM0NyvwlM1dtwmdE6IbFAgV2l9i/UVkMdQy2SfQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=maTo2BW+5WN9qir3C8h0J0QmhRqpMwR5buhKzsPcfgUQMT0mcTiubhQmp61dOrCk0etkPc8xq7oVmWWgFPPsSTLZEXaPTTdoLqhp7ZvanMlV6tKyW+atu+6mb252YfWFDPsGxDjPI/CilsKJA5MVL6BA3JGNRnLhsOFdUogucz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvCR06Jq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A37B5C2BCB0;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911751;
	bh=grzsM0NyvwlM1dtwmdE6IbFAgV2l9i/UVkMdQy2SfQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mvCR06JqG7x5jQ5+unBRfhR7AM7VOLuQeMNkc7fvm8YVtzkdz3xafTKG9L7gsAErj
	 c1jYYkQSyeYKoPIa2BDcDiBU4gPe3ES9uCxScDPJGqSkJBN2C7uCDjYAXcQ0m5VtzT
	 1i2tzh2UjUT1S6MPzoy97zxvXGXN2boJOoTUMxemLUzFLV5vjGNvlzDa+iZHh5tP3M
	 okbgj5ZbILPc0RQnoSaOk8/KBkYYocmKIOndZ6z9Giy9Za49fftTnsCO4QdJdO0QSr
	 w9JYfYWQSIjO9N1+9t3CrMONO62g39LAu7GjFv+QApY0wHGglthEmw3W3FfSucd2/O
	 U2Qs154jKME0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90EAFD2ECE9;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 20 Jan 2026 13:22:28 +0100
Subject: [PATCH v8 2/3] media: synopsys: add driver for the designware mipi
 csi-2 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v8-2-bd1cf5cb9588@collabora.com>
References: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768911749; l=22249;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=5lkoTgjwEJ1CqpLbjkI9WNG/JACfxfDcBdgf93wdlnY=;
 b=Uf8UIYyrvdo+YjJLH0rmPayG7jZP6w6mYHJXbDbjXkcTb79OrbfMp8tSUMn87eyA89xDNOxsf
 eUEWQy4W5J9AhRQZpRhH81bKzexOwL1ZZbGrpV6BWqCho0wK7n7Uhoo
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51118-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,intel.com:email,linaro.org:email,samsung.com:email,wolfvision.net:email]
X-Rspamd-Queue-Id: 8C88E536C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 MAINTAINERS                                      |   1 +
 drivers/media/platform/synopsys/Kconfig          |  18 +
 drivers/media/platform/synopsys/Makefile         |   2 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 726 +++++++++++++++++++++++
 4 files changed, 747 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d1589feaf95..62ccdc72384d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25369,6 +25369,7 @@ M:	Michael Riesch <michael.riesch@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+F:	drivers/media/platform/synopsys/dw-mipi-csi2rx.c
 
 SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER
 M:	Jaehoon Chung <jh80.chung@samsung.com>
diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
index 4fd521f78425..e798ec00b189 100644
--- a/drivers/media/platform/synopsys/Kconfig
+++ b/drivers/media/platform/synopsys/Kconfig
@@ -1,3 +1,21 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 source "drivers/media/platform/synopsys/hdmirx/Kconfig"
+
+config VIDEO_DW_MIPI_CSI2RX
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
+	  will be called dw-mipi-csi2rx.
diff --git a/drivers/media/platform/synopsys/Makefile b/drivers/media/platform/synopsys/Makefile
index 3b12c574dd67..e0232ee23304 100644
--- a/drivers/media/platform/synopsys/Makefile
+++ b/drivers/media/platform/synopsys/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += hdmirx/
+
+obj-$(CONFIG_VIDEO_DW_MIPI_CSI2RX) += dw-mipi-csi2rx.o
diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
new file mode 100644
index 000000000000..29119a1a8d38
--- /dev/null
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -0,0 +1,726 @@
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
+#define DW_MIPI_CSI2RX_N_LANES		0x04
+#define DW_MIPI_CSI2RX_RESETN		0x10
+#define DW_MIPI_CSI2RX_PHY_STATE	0x14
+#define DW_MIPI_CSI2RX_ERR1		0x20
+#define DW_MIPI_CSI2RX_ERR2		0x24
+#define DW_MIPI_CSI2RX_MSK1		0x28
+#define DW_MIPI_CSI2RX_MSK2		0x2c
+#define DW_MIPI_CSI2RX_CONTROL		0x40
+
+#define SW_CPHY_EN(x)		((x) << 0)
+#define SW_DSI_EN(x)		((x) << 4)
+#define SW_DATATYPE_FS(x)	((x) << 8)
+#define SW_DATATYPE_FE(x)	((x) << 14)
+#define SW_DATATYPE_LS(x)	((x) << 20)
+#define SW_DATATYPE_LE(x)	((x) << 26)
+
+#define DW_MIPI_CSI2RX_CLKS_MAX	1
+
+enum {
+	DW_MIPI_CSI2RX_PAD_SINK,
+	DW_MIPI_CSI2RX_PAD_SRC,
+	DW_MIPI_CSI2RX_PAD_MAX,
+};
+
+struct dw_mipi_csi2rx_format {
+	u32 code;
+	u8 depth;
+	u8 csi_dt;
+};
+
+struct dw_mipi_csi2rx_device {
+	struct device *dev;
+
+	void __iomem *base_addr;
+	struct clk_bulk_data *clks;
+	unsigned int clks_num;
+	struct phy *phy;
+	struct reset_control *reset;
+
+	const struct dw_mipi_csi2rx_format *formats;
+	unsigned int formats_num;
+
+	struct media_pad pads[DW_MIPI_CSI2RX_PAD_MAX];
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
+static const struct dw_mipi_csi2rx_format formats[] = {
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
+static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct dw_mipi_csi2rx_device, sd);
+}
+
+static inline void dw_mipi_csi2rx_write(struct dw_mipi_csi2rx_device *csi2,
+					unsigned int addr, u32 val)
+{
+	writel(val, csi2->base_addr + addr);
+}
+
+static inline u32 dw_mipi_csi2rx_read(struct dw_mipi_csi2rx_device *csi2,
+				      unsigned int addr)
+{
+	return readl(csi2->base_addr + addr);
+}
+
+static const struct dw_mipi_csi2rx_format *
+dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
+{
+	WARN_ON(csi2->formats_num == 0);
+
+	for (unsigned int i = 0; i < csi2->formats_num; i++) {
+		const struct dw_mipi_csi2rx_format *format = &csi2->formats[i];
+
+		if (format->code == mbus_code)
+			return format;
+	}
+
+	return NULL;
+}
+
+static int dw_mipi_csi2rx_start(struct dw_mipi_csi2rx_device *csi2)
+{
+	struct media_pad *source_pad;
+	union phy_configure_opts opts;
+	u32 lanes = csi2->lanes_num;
+	u32 control = 0;
+	s64 link_freq;
+	int ret;
+
+	if (lanes < 1 || lanes > 4)
+		return -EINVAL;
+
+	source_pad = media_pad_remote_pad_unique(
+		&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
+	if (IS_ERR(source_pad))
+		return PTR_ERR(source_pad);
+
+	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
+	link_freq = v4l2_get_link_freq(source_pad, 0, 0);
+	if (link_freq < 0)
+		return link_freq;
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
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_N_LANES, lanes - 1);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_CONTROL, control);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 1);
+
+	return phy_power_on(csi2->phy);
+}
+
+static void dw_mipi_csi2rx_stop(struct dw_mipi_csi2rx_device *csi2)
+{
+	phy_power_off(csi2->phy);
+
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_RESETN, 0);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK1, ~0);
+	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_MSK2, ~0);
+}
+
+static const struct media_entity_operations dw_mipi_csi2rx_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int
+dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state,
+			      struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
+
+	switch (code->pad) {
+	case DW_MIPI_CSI2RX_PAD_SRC:
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(
+			sd_state, DW_MIPI_CSI2RX_PAD_SINK);
+		code->code = sink_fmt->code;
+
+		return 0;
+	case DW_MIPI_CSI2RX_PAD_SINK:
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
+static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_format *format)
+{
+	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
+	const struct dw_mipi_csi2rx_format *fmt;
+	struct v4l2_mbus_framefmt *sink, *src;
+
+	/* the format on the source pad always matches the sink pad */
+	if (format->pad == DW_MIPI_CSI2RX_PAD_SRC)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!sink)
+		return -EINVAL;
+
+	fmt = dw_mipi_csi2rx_find_format(csi2, format->format.code);
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
+static int dw_mipi_csi2rx_set_routing(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      enum v4l2_subdev_format_whence which,
+				      struct v4l2_subdev_krouting *routing)
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
+static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
+					 struct v4l2_subdev_state *state,
+					 u32 pad, u64 streams_mask)
+{
+	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi2->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
+					       DW_MIPI_CSI2RX_PAD_SRC,
+					       &streams_mask);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err;
+
+	ret = dw_mipi_csi2rx_start(csi2);
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
+	dw_mipi_csi2rx_stop(csi2);
+err_pm_runtime_put:
+	pm_runtime_put(dev);
+err:
+	return ret;
+}
+
+static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  u32 pad, u64 streams_mask)
+{
+	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi2->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[DW_MIPI_CSI2RX_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, DW_MIPI_CSI2RX_PAD_SINK,
+					       DW_MIPI_CSI2RX_PAD_SRC,
+					       &streams_mask);
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+
+	dw_mipi_csi2rx_stop(csi2);
+
+	pm_runtime_put(dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
+	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = dw_mipi_csi2rx_set_fmt,
+	.set_routing = dw_mipi_csi2rx_set_routing,
+	.enable_streams = dw_mipi_csi2rx_enable_streams,
+	.disable_streams = dw_mipi_csi2rx_disable_streams,
+};
+
+static const struct v4l2_subdev_ops dw_mipi_csi2rx_ops = {
+	.pad = &dw_mipi_csi2rx_pad_ops,
+};
+
+static int dw_mipi_csi2rx_init_state(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = DW_MIPI_CSI2RX_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = DW_MIPI_CSI2RX_PAD_SRC,
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
+static const struct v4l2_subdev_internal_ops dw_mipi_csi2rx_internal_ops = {
+	.init_state = dw_mipi_csi2rx_init_state,
+};
+
+static int dw_mipi_csi2rx_notifier_bound(struct v4l2_async_notifier *notifier,
+					 struct v4l2_subdev *sd,
+					 struct v4l2_async_connection *asd)
+{
+	struct dw_mipi_csi2rx_device *csi2 =
+		container_of(notifier, struct dw_mipi_csi2rx_device, notifier);
+	struct media_pad *sink_pad = &csi2->pads[DW_MIPI_CSI2RX_PAD_SINK];
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
+static const struct v4l2_async_notifier_operations dw_mipi_csi2rx_notifier_ops = {
+	.bound = dw_mipi_csi2rx_notifier_bound,
+};
+
+static int dw_mipi_csi2rx_register_notifier(struct dw_mipi_csi2rx_device *csi2)
+{
+	struct v4l2_async_connection *asd;
+	struct v4l2_async_notifier *ntf = &csi2->notifier;
+	struct v4l2_fwnode_endpoint vep;
+	struct v4l2_subdev *sd = &csi2->sd;
+	struct device *dev = csi2->dev;
+	int ret;
+
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	if (!ep)
+		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
+
+	vep.bus_type = V4L2_MBUS_UNKNOWN;
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
+
+	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep.bus_type != V4L2_MBUS_CSI2_CPHY)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid bus type of endpoint\n");
+
+	csi2->bus_type = vep.bus_type;
+	csi2->lanes_num = vep.bus.mipi_csi2.num_data_lanes;
+
+	v4l2_async_subdev_nf_init(ntf, sd);
+	ntf->ops = &dw_mipi_csi2rx_notifier_ops;
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
+	return 0;
+
+err_nf_cleanup:
+	v4l2_async_nf_cleanup(ntf);
+
+	return ret;
+}
+
+static int dw_mipi_csi2rx_register(struct dw_mipi_csi2rx_device *csi2)
+{
+	struct media_pad *pads = csi2->pads;
+	struct v4l2_subdev *sd = &csi2->sd;
+	int ret;
+
+	ret = dw_mipi_csi2rx_register_notifier(csi2);
+	if (ret)
+		goto err;
+
+	v4l2_subdev_init(sd, &dw_mipi_csi2rx_ops);
+	sd->dev = csi2->dev;
+	sd->entity.ops = &dw_mipi_csi2rx_media_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	sd->internal_ops = &dw_mipi_csi2rx_internal_ops;
+	snprintf(sd->name, sizeof(sd->name), "dw-mipi-csi2rx %s",
+		 dev_name(csi2->dev));
+
+	pads[DW_MIPI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					      MEDIA_PAD_FL_MUST_CONNECT;
+	pads[DW_MIPI_CSI2RX_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, DW_MIPI_CSI2RX_PAD_MAX, pads);
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
+static void dw_mipi_csi2rx_unregister(struct dw_mipi_csi2rx_device *csi2)
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
+static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
+	{
+		.compatible = "rockchip,rk3568-mipi-csi2",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, dw_mipi_csi2rx_of_match);
+
+static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dw_mipi_csi2rx_device *csi2;
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
+	if (ret != DW_MIPI_CSI2RX_CLKS_MAX)
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
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable pm runtime\n");
+
+	ret = phy_init(csi2->phy);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to initialize MIPI CSI-2 PHY\n");
+
+	ret = dw_mipi_csi2rx_register(csi2);
+	if (ret)
+		goto err_phy_exit;
+
+	return 0;
+
+err_phy_exit:
+	phy_exit(csi2->phy);
+
+	return ret;
+}
+
+static void dw_mipi_csi2rx_remove(struct platform_device *pdev)
+{
+	struct dw_mipi_csi2rx_device *csi2 = platform_get_drvdata(pdev);
+
+	dw_mipi_csi2rx_unregister(csi2);
+	phy_exit(csi2->phy);
+}
+
+static int dw_mipi_csi2rx_runtime_suspend(struct device *dev)
+{
+	struct dw_mipi_csi2rx_device *csi2 = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(csi2->clks_num, csi2->clks);
+
+	return 0;
+}
+
+static int dw_mipi_csi2rx_runtime_resume(struct device *dev)
+{
+	struct dw_mipi_csi2rx_device *csi2 = dev_get_drvdata(dev);
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
+static DEFINE_RUNTIME_DEV_PM_OPS(dw_mipi_csi2rx_pm_ops,
+				 dw_mipi_csi2rx_runtime_suspend,
+				 dw_mipi_csi2rx_runtime_resume, NULL);
+
+static struct platform_driver dw_mipi_csi2rx_drv = {
+	.driver = {
+		.name = "dw-mipi-csi2rx",
+		.of_match_table = dw_mipi_csi2rx_of_match,
+		.pm = pm_ptr(&dw_mipi_csi2rx_pm_ops),
+	},
+	.probe = dw_mipi_csi2rx_probe,
+	.remove = dw_mipi_csi2rx_remove,
+};
+module_platform_driver(dw_mipi_csi2rx_drv);
+
+MODULE_DESCRIPTION("Synopsys DesignWare MIPI CSI-2 Receiver platform driver");
+MODULE_LICENSE("GPL");

-- 
2.39.5



