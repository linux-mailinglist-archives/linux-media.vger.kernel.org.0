Return-Path: <linux-media+bounces-36852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243AAF9753
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 17:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1D545A4D20
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1C22D6417;
	Fri,  4 Jul 2025 15:53:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BB0221729;
	Fri,  4 Jul 2025 15:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644404; cv=none; b=tqdOrJLZiqvQFZDhXUPVfVbuV1L1mVTsZWhjLQrle6M8Mz60Irg+zjAg9rYdGi+WY2Fths7UALXS3jBK15P4oNwkZQ1ZKmv7Hr1UVP9XQhfeLoSNzzndQIuHjKloBe/9ez3Exft1hE6snF7JiO+B46eUXWrf3z4W/DmEPYPNIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644404; c=relaxed/simple;
	bh=Ac2dVxUn5PnUUyJh9iw8W5B9z4asDbD9T/zEkCzrtp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tRYJFgObsD5VaV6V+QpKIaBBSlUK4cy/DgxhHyEOsjpeqK0/ON5owYyWQ5y5acZyXF/9OQW9bKtCAuUYD4u/dyugrOsdgwit+cUV6j42o++jE0rlTrIijs5dsA+9E2gVPniycB3evFDVKPJyk58xvo0jdLx10p8Ui8G7n5DREJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B066D1F00036;
	Fri,  4 Jul 2025 15:53:20 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3925BACA6CB; Fri,  4 Jul 2025 15:53:20 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 15CC7ACA65E;
	Fri,  4 Jul 2025 15:46:50 +0000 (UTC)
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
Subject: [PATCH v8 9/9] ARM: dts: sun8i-a83t: Add BananaPi M3 OV8865 camera overlay
Date: Fri,  4 Jul 2025 17:46:26 +0200
Message-ID: <20250704154628.3468793-10-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154628.3468793-1-paulk@sys-base.io>
References: <20250704154628.3468793-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Add an overlay supporting the OV8865 from the BananaPi Camera v3
peripheral board. The board has two sensors (OV5640 and OV8865)
which cannot be supported in parallel as they share the same reset
pin and the kernel currently has no support for this case.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../sun8i-a83t-bananapi-m3-camera-ov8865.dtso | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index de13da013732..6bfa51266445 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -220,6 +220,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a83t-allwinner-h8homlet-v2.dtb \
 	sun8i-a83t-bananapi-m3.dtb \
 	sun8i-a83t-bananapi-m3-camera-ov5640.dtbo \
+	sun8i-a83t-bananapi-m3-camera-ov8865.dtbo \
 	sun8i-a83t-cubietruck-plus.dtb \
 	sun8i-a83t-tbs-a711.dtb \
 	sun8i-h2-plus-bananapi-m2-zero.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso
new file mode 100644
index 000000000000..50f965741f4a
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov8865.dtso
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0 OR X11
+/*
+ * Copyright 2022 Bootlin
+ * Author: Kévin L'hôpital <kevin.lhopital@bootlin.com>
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
+	ov8865_avdd: ov8865-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	ov8865_dovdd: ov8865-dovdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-dovdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	ov8865_dvdd: ov8865-dvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-dvdd";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&reg_dldo4>;
+	};
+};
+
+&csi {
+	status = "okay";
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
+	ov8865: camera@36 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&csi_mclk_pin>;
+
+		compatible = "ovti,ov8865";
+		reg = <0x36>;
+
+		clocks = <&ccu CLK_CSI_MCLK>;
+		assigned-clocks = <&ccu CLK_CSI_MCLK>;
+		assigned-clock-parents = <&osc24M>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&ov8865_avdd>;
+		dovdd-supply = <&ov8865_dovdd>;
+		dvdd-supply = <&ov8865_dvdd>;
+
+		powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
+		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+
+		port {
+			ov8865_out_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi2_in_ov8865>;
+				link-frequencies = /bits/ 64 <360000000>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&mipi_csi2 {
+	status = "okay";
+};
+
+&mipi_csi2_in {
+	mipi_csi2_in_ov8865: endpoint {
+		remote-endpoint = <&ov8865_out_mipi_csi2>;
+		data-lanes = <1 2 3 4>;
+	};
+};
+
+&reg_dldo4 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+};
-- 
2.49.0


