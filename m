Return-Path: <linux-media+bounces-36860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E98D1AF977A
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 18:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88CDB3B6FE1
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F44F327A41;
	Fri,  4 Jul 2025 15:59:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A2230E857;
	Fri,  4 Jul 2025 15:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644762; cv=none; b=BeDaIzhvge9krRON1mOnwKsbhHlKAc1zRp2MYQL1l2UjjwU2SXw6YVA7gSN94i3t8Q5sQajEFgkNNFxx5EK9eoRjyReV6dgbwGLVnMWChx/GkVxkwf9QfVGMEM2x5XCmqokwLxBlQlPQdAD6mHP29gjVnxzS3FxJJ0bnw1CPK1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644762; c=relaxed/simple;
	bh=We8FZlBDtvXYSptcWE/Xb8miHHoFn0yAQv5dy+DzD2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stXwFMwNhH5xg+AlVftwx2xASTNXbPlzaH6V1BwQhL86/GIv3ZYExd4F+QGvC7TLBvLsC4TKvLJS2Fz+iRuXIuyZwERm9BpJ5fqNnoJY9CV+Rn/w0vgliTIC7ZYigWXj+XsioDHsyyf9vGzGKmMSiD3T+Xu+HxCciASOykpQaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9C8DD1F0006E;
	Fri,  4 Jul 2025 15:59:01 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 65CC3ACA65D; Fri,  4 Jul 2025 15:52:37 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id AD114ACA65D;
	Fri,  4 Jul 2025 15:46:45 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v8 8/9] ARM: dts: sun8i-a83t: Add BananaPi M3 OV5640 camera overlay
Date: Fri,  4 Jul 2025 17:46:25 +0200
Message-ID: <20250704154628.3468793-9-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154628.3468793-1-paulk@sys-base.io>
References: <20250704154628.3468793-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Add an overlay supporting the OV5640 from the BananaPi Camera v3
peripheral board. The board has two sensors (OV5640 and OV8865)
which cannot be supported in parallel as they share the same reset
pin and the kernel currently has no support for this case.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../sun8i-a83t-bananapi-m3-camera-ov5640.dtso | 117 ++++++++++++++++++
 2 files changed, 118 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 7318ce6d7fa3..de13da013732 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -219,6 +219,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a33-vstar.dtb \
 	sun8i-a83t-allwinner-h8homlet-v2.dtb \
 	sun8i-a83t-bananapi-m3.dtb \
+	sun8i-a83t-bananapi-m3-camera-ov5640.dtbo \
 	sun8i-a83t-cubietruck-plus.dtb \
 	sun8i-a83t-tbs-a711.dtb \
 	sun8i-h2-plus-bananapi-m2-zero.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
new file mode 100644
index 000000000000..469faf8cd2c4
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Copyright 2022 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/sun8i-a83t-ccu.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	compatible = "sinovoip,bpi-m3";
+
+	/*
+	 * These regulators actually have DLDO4 tied to their EN pin, which is
+	 * described as input supply here for lack of a better representation.
+	 * Their actual supply is PS, which is always-on.
+	 */
+
+	ov5640_avdd: ov5640-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov5640-avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	ov5640_dovdd: ov5640-dovdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov5640-dovdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	ov5640_dvdd: ov5640-dvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov5640-dvdd";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&reg_dldo4>;
+	};
+};
+
+&csi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&csi_8bit_parallel_pins>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi_in_ov5640: endpoint {
+				remote-endpoint = <&ov5640_out_csi>;
+				bus-width = <8>;
+				data-shift = <2>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+				pclk-sample = <1>;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pe_pins>;
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640: camera@3c {
+		pinctrl-names = "default";
+		pinctrl-0 = <&csi_mclk_pin>;
+
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+
+		clocks = <&ccu CLK_CSI_MCLK>;
+		clock-names = "xclk";
+		assigned-clocks = <&ccu CLK_CSI_MCLK>;
+		assigned-clock-parents = <&osc24M>;
+		assigned-clock-rates = <24000000>;
+
+		AVDD-supply = <&ov5640_avdd>;
+		DOVDD-supply = <&ov5640_dovdd>;
+		DVDD-supply = <&ov5640_dvdd>;
+
+		powerdown-gpios = <&pio 3 15 GPIO_ACTIVE_HIGH>; /* PD15 */
+		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+
+		rotation = <180>;
+
+		port {
+			ov5640_out_csi: endpoint {
+				remote-endpoint = <&csi_in_ov5640>;
+				bus-width = <8>;
+				data-shift = <2>;
+				hsync-active = <1>; 
+				vsync-active = <1>;
+				pclk-sample = <1>;
+			};
+		};
+	};
+};
+
+&reg_dldo4 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+};
-- 
2.49.0


