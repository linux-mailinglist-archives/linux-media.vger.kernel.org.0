Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7BC32D79BB
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 16:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404540AbgLKPpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 10:45:51 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53085 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392931AbgLKPp1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 10:45:27 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9C55A20017;
        Fri, 11 Dec 2020 15:44:42 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH NOT FOR MERGE v4 3/3] ARM: dts: sun8i: a83t: bananapi-m3: Enable MIPI CSI-2 with OV8865
Date:   Fri, 11 Dec 2020 16:44:28 +0100
Message-Id: <20201211154428.153762-4-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211154428.153762-1-paul.kocialkowski@bootlin.com>
References: <20201211154428.153762-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kévin L'hôpital <kevin.lhopital@bootlin.com>

The Bananapi M3 supports a camera module which includes an OV8865 sensor
connected via the parallel CSI interface and an OV8865 sensor connected
via MIPI CSI-2.

The I2C2 bus is shared by the two sensors as well as the (active-low)
reset signal, but each sensor has it own shutdown line.

Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 102 +++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
index 431f70234d36..b437eaeb91e9 100644
--- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
@@ -85,6 +85,30 @@ green {
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
+	reg_ov8865_dvdd: ov8865-dvdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ov8865-dvdd";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&reg_eldo1>;
+	};
+
 	reg_usb1_vbus: reg-usb1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb1-vbus";
@@ -115,6 +139,23 @@ &cpu100 {
 	cpu-supply = <&reg_dcdc3>;
 };
 
+&csi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csi_in_mipi_csi2: endpoint {
+				remote-endpoint = <&mipi_csi2_out_csi>;
+			}
+		};
+	};
+};
+
 &de {
 	status = "okay";
 };
@@ -147,6 +188,36 @@ hdmi_out_con: endpoint {
 	};
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
+		assigned-clocks = <&ccu CLK_CSI_MCLK>;
+		assigned-clock-rates = <24000000>;
+		avdd-supply = <&reg_ov8865_avdd>;
+		dovdd-supply = <&reg_ov8865_dovdd>;
+		dvdd-supply = <&reg_ov8865_dvdd>;
+		powerdown-gpios = <&pio 4 17 GPIO_ACTIVE_LOW>; /* PE17 */
+		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+
+		port {
+			ov8865_out_mipi_csi2: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <360000000>;
+
+				remote-endpoint = <&mipi_csi2_in_ov8865>;
+			};
+		};
+	};
+};
+
 &mdio {
 	rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -154,6 +225,24 @@ rgmii_phy: ethernet-phy@1 {
 	};
 };
 
+&mipi_csi2 {
+	status = "okay";
+};
+
+&mipi_csi2_in {
+	mipi_csi2_in_ov8865: endpoint {
+		data-lanes = <1 2 3 4>;
+
+		remote-endpoint = <&ov8865_out_mipi_csi2>;
+	};
+};
+
+&mipi_csi2_out {
+	mipi_csi2_out_csi: endpoint {
+		remote-endpoint = <&csi_in_mipi_csi2>;
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -327,11 +416,24 @@ &reg_dldo3 {
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
2.29.2

