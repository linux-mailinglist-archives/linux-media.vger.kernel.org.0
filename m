Return-Path: <linux-media+bounces-44434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDADBD98DA
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 15:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E3641927A13
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BF4131619D;
	Tue, 14 Oct 2025 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QD59k0xx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263FF314B82;
	Tue, 14 Oct 2025 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446967; cv=none; b=hdw6Sk9kgH+gEBFIMg/2cWhAXLnlsSHsuYOmDaVoZ5GRMyE2EM6GsjhaYL8zVe2REGReBK7NIpYjZchf0uR/zPaRwYsiHlMZrOfbFXO6qJHdJwsIkSg/A7PD+P05jkN8o2u7MWbUhWKwwBdvKDyba1TsuqA0udMMFRCazHpb5aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446967; c=relaxed/simple;
	bh=kg7jF/g8mf1TOHkSmwqvBnJWrqB9/61uIJ1LyTZh5NM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pS6YU6VBeKZvwxol0cyaP//XwH8QS2hT7xutW4DGfcelrYCD3Whm4aivESTAbo37zg7iW59QJMWFMpY7HWzaP12FT4G6e7d/t4rIdvKMUYFgqR19Qn91tuT5sRMpwwusvDseADuuzMsldwOfsuZYzR/6l096y5JPVhnuPlZrIEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QD59k0xx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F038EC113D0;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760446967;
	bh=kg7jF/g8mf1TOHkSmwqvBnJWrqB9/61uIJ1LyTZh5NM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QD59k0xxS1BfKzqU7DrEZmmXCwIMby9vjtbZu3YGvjCW3ORSkdiT2ILK6z58Bg7Eq
	 5t6/4XkPi6CApllRqGBx3WEl5gAwjmSScqHc+P67bLbt8uNdUuAw2+QimX39bFAEGU
	 hzrBgZD4+aWWaxRzZO2O252Zyw0KRRIBaWm6B/JfP0QWogwzlDNVLfjp82JSTDcMjQ
	 ML68GVpeva5mZU3m3gkjxdQqro8a1yh7EkE7OvmkHgG2FVbBQb1oXxiBAcN6c7oUyc
	 v7bx3oOJc+VQhD2v846XxI4ho22C0BXL3l9AsXJIYp/ElLus4GKjepAJ0Y7gPQsIVM
	 C6Ez7Z9+fR1UA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E475FCCD195;
	Tue, 14 Oct 2025 13:02:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 14 Oct 2025 15:02:04 +0200
Subject: [PATCH v12 18/18] arm64: dts: rockchip: add overlay for radxa
 camera 8m
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v12-18-c6dbece6bb98@collabora.com>
References: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v12-0-c6dbece6bb98@collabora.com>
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
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760446963; l=3860;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=s8ffrmhVqarbGXNmyNRzp/PbAgcLyEWIBK3xolazp2A=;
 b=fvfo9TJNZHxhbS4B5qJgnlYi59MIORohISYnTHbyYsDFCfdJU9cWmnaLvd2Cv0BqSzR7kUZyr
 ggyw6q/zBhcAUVfLTPPPB33SrjoXSQ2r6psno90Zq9tNIC5CFvf8ejy
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add a device tree overlay for the Radxa Camera 8M featuring the Sony
IMX219 image sensor. The sensor is connected to the RK3568 VICAP MIPI
CSI-2 port, since as at the time of writing this there is no mainline
support for the RK3568 ISP.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  5 ++
 .../dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso   | 90 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)

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
index 000000000000..4db177b1c701
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3a-radxa-cam8m.dtso
@@ -0,0 +1,90 @@
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
+	clk_cam: clock-cam {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "clk_cam";
+		#clock-cells = <0>;
+	};
+
+	vcc_camera: regulator-vcc-camera {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&camera_power_en>;
+		regulator-always-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vcc_camera";
+		vin-supply = <&vcc_cam>;
+	};
+};
+
+&i2c5 {
+	#address-cells = <1>;
+	clock-frequency = <100000>;
+	#size-cells = <0>;
+	status = "okay";
+
+	imx219: camera-sensor@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		clocks = <&clk_cam>;
+		clock-names = "xclk";
+		VANA-supply = <&vcc_camera>;
+		VDIG-supply = <&vcc_camera>;
+		VDDL-supply = <&vcc_camera>;
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
+		camera_power_en: camera-power-en-pinctrl {
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



