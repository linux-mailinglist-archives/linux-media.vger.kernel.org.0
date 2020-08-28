Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66691255B08
	for <lists+linux-media@lfdr.de>; Fri, 28 Aug 2020 15:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729528AbgH1NRD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Aug 2020 09:17:03 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58435 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729468AbgH1NLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Aug 2020 09:11:49 -0400
X-Originating-IP: 90.89.180.255
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPA id 43DE9C001A;
        Fri, 28 Aug 2020 13:11:46 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mripard@kernel.org, wens@csie.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH v2 3/3] [NOT FOR MERGE] ARM: dts: sun8i: a83t: bananapi-m3: Enable OV8865 camera
Date:   Fri, 28 Aug 2020 15:11:34 +0200
Message-Id: <20200828131134.12113-4-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828131134.12113-1-kevin.lhopital@bootlin.com>
References: <20200828131134.12113-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Bananapi M3 supports a camera module which includes an
OV8865 sensor connected via the parallel CSI interface and
an OV8865 sensor connected via MIPI CSI-2.

The I2C2 bus is shared by the two sensors as well as active-low
reset signal but each sensor has it own shutdown line.

The I2c address for the OV8865 is 0x36.

The bus type is hardcoded to 4 due to the lack of available
define usable in the device-tree.

Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
---
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 89 ++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
index 9d34eabba121..b5cba707fb9e 100644
--- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
@@ -85,6 +85,38 @@
 		};
 	};
 
+	reg_ov8865_avdd: ov8865-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	reg_ov8865_dovdd: ov8865-dovdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-dovdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	reg_ov8865_afvdd: ov8865-afvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-afvdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&reg_dldo4>;
+	};
+
+	reg_ov8865_vdd2: ov8865-vdd2 {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-vdd2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&reg_eldo1>;
+	};
+
 	reg_usb1_vbus: reg-usb1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb1-vbus";
@@ -115,10 +147,54 @@
 	cpu-supply = <&reg_dcdc3>;
 };
 
+&csi {
+	status = "okay";
+};
+
+&csi_in {
+	mipi_csi2_from_ov8865: endpoint {
+		remote-endpoint = <&ov8865_to_mipi_csi2>;
+		clock-lanes = <0>;
+		data-lanes = <1 2 3 4>;
+		bus-type = <4>;
+	};
+};
+
 &de {
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pe_pins>;
+	status = "okay";
+
+	ov8865: camera@36 {
+		compatible = "ovti,ov8865";
+		reg = <0x36>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&csi_mclk_pin>;
+		clocks = <&ccu CLK_CSI_MCLK>;
+		clock-names ="xclk";
+		avdd-supply = <&reg_ov8865_avdd>;
+		dovdd-supply = <&reg_ov8865_dovdd>;
+		vdd2-supply = <&reg_ov8865_vdd2>;
+		afvdd-supply = <&reg_ov8865_afvdd>;
+		powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
+		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+		rotation = <180>;
+
+		port {
+			ov8865_to_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi2_from_ov8865>;
+				data-lanes = <1 2 3 4>;
+				clock-lanes = <0>;
+				bus-type = <4>; /* V4L2_FWNODE_BUS_TYPE_CSI2_DPHY */
+			};
+		};
+	};
+};
+
 &ehci0 {
 	/* Terminus Tech FE 1.1s 4-port USB 2.0 hub here */
 	status = "okay";
@@ -327,11 +403,24 @@
 	regulator-name = "vcc-pd";
 };
 
+&reg_dldo4 {
+	regulator-always-on;
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-name = "avdd-csi";
+};
+
 &reg_drivevbus {
 	regulator-name = "usb0-vbus";
 	status = "okay";
 };
 
+&reg_eldo1 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "dvdd-csi-r";
+};
+
 &reg_fldo1 {
 	regulator-min-microvolt = <1080000>;
 	regulator-max-microvolt = <1320000>;
-- 
2.17.1

