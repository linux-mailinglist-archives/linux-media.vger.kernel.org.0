Return-Path: <linux-media+bounces-45518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D9C065A2
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC2394F91F8
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 12:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBA332143D;
	Fri, 24 Oct 2025 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzVtNQfd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87131B823;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761310297; cv=none; b=RaKnAQdor/korkfUPrj3vCXA3OGnRbqJCF6DDfvckxHzQ8f6UfTFOCFzJHuBYWXdADu/V18Xt2d5nvO038z53JH2zLW0BgC4QHPsC8/IYJ/9K3SiFiO8WZBfi8v1hup+zVHbDHCyzowK9G4tW0lrMcaU3/+sfWReoEFMHFwcA+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761310297; c=relaxed/simple;
	bh=D9NOQFttLM44MLx09Zex9E0ZU1bSnzyvmGIvjIHg3PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1TFVKx/AEjDFGX7hwT5FxI+0Fd11UhkonJo0zK8VKtOnZN9mX6fQEB9qPx9xSEc9NuNaYYST2hwU6OBrKna0BAE1HqApAVZ2n3D1gtZ4KY/Qm7X3ktZ9EVUbMElmWMBnRj2TxzBOkjhsCtTEAFcVA0+UfsWIKaC2sZYTK6Q6ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzVtNQfd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C46DC116D0;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761310297;
	bh=D9NOQFttLM44MLx09Zex9E0ZU1bSnzyvmGIvjIHg3PU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NzVtNQfdU4U5WsCNPN5cRDnQX5SqAvT6oe3v9i2qF0cTmJaW18BphDvxD3nKBYlHW
	 61qNxslkIIMyKV8YveixWl4zP4fAe+t93KZFBlgQJQm7clBdtWnWP2OurrmZJru36y
	 yBiKKCG5PXZ6hwK8/Ho6Ph++wdkaLuvEFVzFozfrOsz/B9PGFlMh2kyIa9w5WQiWi3
	 1+M4+7C6E+5p+hb3DKoD4zl7TyuIKED4d1hz85ZKruBEgN7yhK/lonDPQ97DsLIoUc
	 AckVBMk6zhI0adAD40I+aNAvvD9WClXrRLBfI9+pB+cPmUV5YDdo4rLugZpnbSwiMj
	 FXn7UU/oZHK9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302DFCCF9E0;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 24 Oct 2025 14:51:47 +0200
Subject: [PATCH v14 18/18] arm64: dts: rockchip: add radxa camera 8m on
 rock 3a csi port
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v14-18-b38b6da0fc80@collabora.com>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, Chen-Yu Tsai <wens@csie.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761310293; l=4423;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=8+gsoG6dBtp0EaQEhGBr2hG0N8BoIt7Rya8dykcaVJk=;
 b=QkRDoMhQXlaFfrn9H71B3EP+aJ/ZFPGMPArrb0cZaFufBhfhco4GYIEBu49GXqLJFY4wL0S/t
 PDmNnpkWsOTAw30EHsw4FTe/oYnr3pBtVS8aiMB9hBhAcr/1fSkeQwf
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add a device tree overlay for the Radxa Camera 8M (featuring the
Sony IMX219 image sensor) to be connected to the Radxa ROCK 3A CSI
port.

The image sensor is connected to the RK3568 VICAP MIPI CSI-2
port, since as at the time of writing this there is no mainline
support for the RK3568 ISP.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   5 +
 .../dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso   | 103 +++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index ad684e3831bc..d6b969a0dab9 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -146,6 +146,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts433.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-radxa-e25.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-roc-pc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a-radxa-cam8m.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3b.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
@@ -243,6 +244,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-v2-screen.dtb
 rk3399-rockpro64-v2-screen-dtbs := rk3399-rockpro64-v2.dtb \
 	rk3399-rockpro64-screen.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-rock-3a-radxa-8m-cam.dtb
+rk3568-rock-3a-radxa-8m-cam-dtbs := rk3568-rock-3a.dtb \
+	rk3568-rock-3a-radxa-cam8m.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
 rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
 	rk3568-wolfvision-pf5-display-vz.dtbo \
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso
new file mode 100644
index 000000000000..3aa1ffdc22d8
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree overlay for the Radxa Camera 8M attached to the CSI port of
+ * the Radxa ROCK 3A.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+
+&{/} {
+	clk_camera: clock-camera {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "clk_camera";
+		#clock-cells = <0>;
+	};
+
+	vana_camera: regulator-vana-camera {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-name = "vana_camera";
+		vin-supply = <&vcc_cam>;
+	};
+
+	vddl_camera: regulator-vddl-camera {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-name = "vddl_camera";
+		vin-supply = <&vcc_cam>;
+	};
+
+	vdig_camera: regulator-vdig-camera {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-name = "vdig_camera";
+		vin-supply = <&vcc_cam>;
+	};
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx219: camera-sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&clk_camera>;
+		clock-names = "xclk";
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_reset>;
+		reset-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		VANA-supply = <&vana_camera>;
+		VDDL-supply = <&vddl_camera>;
+		VDIG-supply = <&vdig_camera>;
+
+		port {
+			imx219_output: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <456000000>;
+				remote-endpoint = <&csi_input>;
+			};
+		};
+	};
+};
+
+&pinctrl {
+	cam {
+		camera_reset: camera-reset-pinctrl {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&csi {
+	status = "okay";
+};
+
+&csi_dphy {
+	status = "okay";
+};
+
+&csi_in {
+	csi_input: endpoint {
+		data-lanes = <1 2>;
+		link-frequencies = /bits/ 64 <456000000>;
+		remote-endpoint = <&imx219_output>;
+	};
+};
+
+&vicap {
+	status = "okay";
+};
+
+&vicap_mmu {
+	status = "okay";
+};

-- 
2.39.5



