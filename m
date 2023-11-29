Return-Path: <linux-media+bounces-1340-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581147FD2CB
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 10:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A690B20D36
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 09:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C431415EA3;
	Wed, 29 Nov 2023 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="duQqJegx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D85E1FEE;
	Wed, 29 Nov 2023 01:31:58 -0800 (PST)
Received: from pyrite.hamster-moth.ts.net (h175-177-049-135.catv02.itscom.jp [175.177.49.135])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B58862B6;
	Wed, 29 Nov 2023 10:31:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701250281;
	bh=mJ4UNX0sJTsJlj1KPGeUn8FdbosXEmT20xBZ0fX5pX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=duQqJegxA5ltyL5+sJyfwSIfVzIqTNLz+OKkqLm9ide36PPT8xVHacN4dMCVOf2In
	 pTYGKFYC+aIxpbS4kuZurW4SKH4AWpxl9giTw8JquWA5GQKJEdmSApWwFvRKccfiRr
	 qmivmYMYL33yKhAbxbQaHM+q8Spy/5CFpJkklQF0=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com,
	tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Philippe Schenker <philippe.schenker@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCH 2/2] arm64: dts: imx8mp: Add overlays for ISP instances
Date: Wed, 29 Nov 2023 18:31:13 +0900
Message-Id: <20231129093113.255161-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231129093113.255161-1-paul.elder@ideasonboard.com>
References: <20231129093113.255161-1-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Add two overlay to enable each ISP instance. The ISP is wired directly
to the CSIS for now, bypassing the ISI completely.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  2 ++
 .../arm64/boot/dts/freescale/imx8mp-isp1.dtso | 36 +++++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-isp2.dtso | 36 +++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-isp1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-isp2.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 300049037eb0..f97dfac11189 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -113,6 +113,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-isp1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-isp2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-isp1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-isp1.dtso
new file mode 100644
index 000000000000..cf394ed224ab
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-isp1.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022 Ideas on Board Oy
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/media/video-interfaces.h>
+
+&isi_0 {
+	status = "disabled";
+
+	ports {
+		port@0 {
+			/delete-node/ endpoint;
+		};
+	};
+};
+
+&isp_0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			isp0_in: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				remote-endpoint = <&mipi_csi_0_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0_out {
+	remote-endpoint = <&isp0_in>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-isp2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-isp2.dtso
new file mode 100644
index 000000000000..14e2e7b2617f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-isp2.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022 Ideas on Board Oy
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/media/video-interfaces.h>
+
+&isi_0 {
+	status = "disabled";
+
+	ports {
+		port@1 {
+			/delete-node/ endpoint;
+		};
+	};
+};
+
+&isp_1 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			isp1_in: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				remote-endpoint = <&mipi_csi_1_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_1_out {
+	remote-endpoint = <&isp1_in>;
+};
-- 
2.39.2


