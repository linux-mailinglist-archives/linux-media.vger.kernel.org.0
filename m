Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A71214A7758
	for <lists+linux-media@lfdr.de>; Wed,  2 Feb 2022 18:58:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346578AbiBBR5w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 12:57:52 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58274 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346499AbiBBR52 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 12:57:28 -0500
Received: from tatooine.ideasonboard.com (unknown [IPv6:2a01:e0a:169:7140:7139:eada:2ff6:73dd])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67BE21850;
        Wed,  2 Feb 2022 18:56:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643824613;
        bh=3lrGwNeqv8zUuSa8vZIr+ceF4CcaJqG9pp3tPlC2K/U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uYmuQ1hKzba11PQY9WPV1yOlDA1V8kdNg78UVgBUYTh0jmVHOar6yEiN5vaYTdhgH
         +Fq7Zhq4rxGmIwZfYxF9BJRnEyXNXoR+x8E1R/lT6CY/hCOWJO2NX4i53QQGtOAyxb
         7C/eTAmD0C1Rox0LvpmXdAR4rb1fepNfkpDtHNPo=
From:   Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
To:     jeanmichel.hautbois@ideasonboard.com
Cc:     dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
        kernel-list@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        lukasz@jany.st, mchehab@kernel.org, naush@raspberrypi.com,
        robh@kernel.org, tomi.valkeinen@ideasonboard.com
Subject: [RFC PATCH v3 11/11] media: bcm283x: Include the imx219 node
Date:   Wed,  2 Feb 2022 18:56:39 +0100
Message-Id: <20220202175639.149681-12-jeanmichel.hautbois@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220202175639.149681-1-jeanmichel.hautbois@ideasonboard.com>
References: <20220202175639.149681-1-jeanmichel.hautbois@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

WARNING:
This patch is only used to demonstrate how the imx219 node is included
in the bcm2711-rpi-4-b device tree, and is not intended to be merged.

Configure the csi1 endpoint, add the imx219 node and connect it through
the i2c mux.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
---
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts     |   1 +
 arch/arm/boot/dts/bcm283x-rpi-imx219.dtsi | 102 ++++++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-imx219.dtsi

diff --git a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
index 4432412044de..f7625b70fe57 100644
--- a/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/bcm2711-rpi-4-b.dts
@@ -4,6 +4,7 @@
 #include "bcm2711-rpi.dtsi"
 #include "bcm283x-rpi-usb-peripheral.dtsi"
 #include "bcm283x-rpi-wifi-bt.dtsi"
+#include "bcm283x-rpi-imx219.dtsi"
 
 / {
 	compatible = "raspberrypi,4-model-b", "brcm,bcm2711";
diff --git a/arch/arm/boot/dts/bcm283x-rpi-imx219.dtsi b/arch/arm/boot/dts/bcm283x-rpi-imx219.dtsi
new file mode 100644
index 000000000000..f2c6a85fd731
--- /dev/null
+++ b/arch/arm/boot/dts/bcm283x-rpi-imx219.dtsi
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/clock/bcm2835.h>
+
+/ {
+	compatible = "brcm,bcm2835";
+
+	imx219_vdig: fixedregulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx219_vdig";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	imx219_vddl: fixedregulator@2 {
+		compatible = "regulator-fixed";
+		regulator-name = "imx219_vddl";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
+	imx219_clk: imx219_clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "24MHz-clock";
+	};
+
+	cam1_reg: cam1_reg {
+		compatible = "regulator-fixed";
+		regulator-name = "imx219_vana";
+		enable-active-high;
+		status = "okay";
+		gpio = <&expgpio 5 GPIO_ACTIVE_HIGH>;
+	};
+
+	i2c0mux {
+		compatible = "i2c-mux-pinctrl";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c-parent = <&i2c0>;
+
+		pinctrl-names = "i2c0", "i2c_csi_dsi";
+		pinctrl-0 = <&i2c0_gpio0>;
+		pinctrl-1 = <&i2c0_gpio44>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			imx219: sensor@10 {
+				compatible = "sony,imx219";
+				reg = <0x10>;
+				status = "okay";
+
+				clocks = <&imx219_clk>;
+				clock-names = "xclk";
+
+				VANA-supply = <&cam1_reg>;   /* 2.8v */
+				VDIG-supply = <&imx219_vdig>;   /* 1.8v */
+				VDDL-supply = <&imx219_vddl>;   /* 1.2v */
+
+				rotation = <0>;
+				orientation = <0>;
+
+				port {
+					imx219_0: endpoint {
+						remote-endpoint = <&csi1_ep>;
+						clock-lanes = <0>;
+						data-lanes = <1 2>;
+						clock-noncontinuous;
+						link-frequencies = /bits/ 64 <456000000>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&csi1 {
+	status="okay";
+	num-data-lanes = <2>;
+	port {
+		csi1_ep: endpoint {
+			remote-endpoint = <&imx219_0>;
+			data-lanes = <1 2>;
+			clock-lanes = <0>;
+		};
+	};
+};
+
+&i2c0 {
+	/delete-property/ pinctrl-names;
+	/delete-property/ pinctrl-0;
+};
+
-- 
2.32.0

