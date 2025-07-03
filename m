Return-Path: <linux-media+bounces-36705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7208AF800E
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61F5B546880
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 18:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9942F2C7A;
	Thu,  3 Jul 2025 18:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9uvwg7H"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F428A1EE;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751567593; cv=none; b=XTvC75xS2g/ZJdV2khTMT6rSVzMlrnLucZi0aYcEksqI09gvGcyJi4l0b0Us0u/O2jifXWtS4RGDqTx0T+Up33HGX5BAK5m6ySCktjiVxaPf34rVDStoUNBFhwYddFXYPnFDhWpy8xgdofxyU/I3Q/kyiVpuyfHWtun2lG8Md/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751567593; c=relaxed/simple;
	bh=twKLCDvgvJ4N3es1zViUdUytVpc1yuuskuyBdmZ+9lY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GR049/tMCV8+9qE0wbT/+SX+1PmTfjBCLYtV0JBGjapNXYCecgXm1FQldyDdQOWk8k7k0yAzTkXC8KqDaDfx5eCfABgZ5/EHIx+gQHyVeTZsKI26mCqjR6Hkr/wb9HWH5X1eTYFowt67f2e6mB+er/Xn1+n4tLfeLt7f9HaifcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9uvwg7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5E7FC4AF0B;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751567592;
	bh=twKLCDvgvJ4N3es1zViUdUytVpc1yuuskuyBdmZ+9lY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R9uvwg7H/tZrWUiU2XNSphV19N7RZhq3VTIpr7RkePXVvXiuqfSjEbdEzy1u3/L8b
	 BFLr0DNU/yhCT7/1IUGjYrZD/H05T7tEsS0jatIK1XXfmfDWAUPuGGBDy8c23cOExj
	 99fYWcPpD/ie3wppt3cOBlDSeYIDsq3Hr+XpZ2pZ6oILdUhX5+oqPnhX2yZNxn9iKM
	 cDxSZ9sAdczy71F/0yRRIpGi10PELYcwYHEwGh61oXrPqdUz1J0KtPNjV7NBnE43JE
	 TwJk1hGaFpCJt7EdrJ0AVHb6dA0HIynhRAO3yFkVg9dZmdIUzqjuQ8/ajijWxBMs1n
	 aLjKhv9aeVDcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1BBC83F05;
	Thu,  3 Jul 2025 18:33:12 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Thu, 03 Jul 2025 14:33:09 -0400
Subject: [PATCH v2 4/4] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx8qxp_pcam-v2-4-188be85f06f1@nxp.com>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
In-Reply-To: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751567591; l=3715;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=xrlatQtLaiuinBwAmL4cEzL3pNe437Uvr/YWmYMVyX4=;
 b=OrYhgbxp0mxYiuvD4zwpejFQ9E/eldojxDR2ZfCT44z4t7F/rAzD6h8/JvNn4OeWKbkLfnHiQ
 jMyCzGG8e6aCOEQMci3BgiDtLjGFLAEhTs1FhhzET3OdH5wncSPru8A
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
it because it can work at two mode: MIPI and parallel mode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- move ov5640 part to overlay file
- rename to imx8qxp-mek-ov5640-parallel.dtso
- remove data-lanes
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../dts/freescale/imx8qxp-mek-ov5640-parallel.dtso | 82 ++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 02ef35578dbc7e05b35b781dbfca0f0bc124ead1..25787fc7143f36301f8b334d4b0d84d543e1f320 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -330,6 +330,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
+imx8qxp-mek-ov5640-parallel-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-parallel.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-parallel.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-parallel.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-parallel.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..e184a5beb5c835e6801495ae2adc3b14cfcde2e5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-parallel.dtso
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/pads-imx8qxp.h>
+
+&cm40_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640_pi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "xclk";
+		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <24000000>;
+		AVDD-supply = <&reg_2v8>;
+		DOVDD-supply = <&reg_1v8>;
+		DVDD-supply = <&reg_1v5>;
+		pinctrl-0 = <&pinctrl_parallel_csi>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_pi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				pclk-sample = <1>;
+				remote-endpoint = <&parallel_csi_in>;
+				vsync-active = <0>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_parallel_csi: parallelcsigrp {
+		fsl,pins = <
+			IMX8QXP_CSI_D00_CI_PI_D02		0xc0000041
+			IMX8QXP_CSI_D01_CI_PI_D03		0xc0000041
+			IMX8QXP_CSI_D02_CI_PI_D04		0xc0000041
+			IMX8QXP_CSI_D03_CI_PI_D05		0xc0000041
+			IMX8QXP_CSI_D04_CI_PI_D06		0xc0000041
+			IMX8QXP_CSI_D05_CI_PI_D07		0xc0000041
+			IMX8QXP_CSI_D06_CI_PI_D08		0xc0000041
+			IMX8QXP_CSI_D07_CI_PI_D09		0xc0000041
+
+			IMX8QXP_CSI_MCLK_CI_PI_MCLK		0xc0000041
+			IMX8QXP_CSI_PCLK_CI_PI_PCLK		0xc0000041
+			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC		0xc0000041
+			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC		0xc0000041
+			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02		0xc0000041
+			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03	0xc0000041
+		>;
+	};
+};
+
+&isi {
+	status = "okay";
+};
+
+&parallel_csi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			parallel_csi_in: endpoint {
+				remote-endpoint = <&ov5640_pi_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1



