Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2CA728F6A9
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 18:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389553AbgJOQ1x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 12:27:53 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:40973 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389869AbgJOQ1t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 12:27:49 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B447BFF80B;
        Thu, 15 Oct 2020 16:27:43 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 6/7] [DNI] arm64: dts: renesas: salvator-x: Add MAX9286 expansion board
Date:   Thu, 15 Oct 2020 20:27:09 +0200
Message-Id: <20201015182710.54795-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
References: <20201015182710.54795-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Add a .dtsi fragment to describe the MAX9286-based expansion board for
the Renesas Salvator-X board.

The MAX9286 expansion board has eight RDACM20 cameras connected to it.
They can be individually controlled by enabling or disabling the macro
defines.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v2:
 - Use SPDX headers
 - Remove link from ADV748x TXA (HDMI)
 - Use 0x31-0x38, and 0x41-0x48 for the 8 cameras. 0x30 and 0x40 are the
   base addresses for the OV10635 and MAX9271 (0x50 for the MCU)
 - Provide RDACM20 MCU I2C address reservations. (0x51-0x58)

v3:
 - Fix gmsl-serializer@ i2c node addressing

v6:
 - Make i2c-mux child node and update to be conformant to new bindings.

v7:
 - Separate register arguments
---
 .../boot/dts/renesas/salvator-x-max9286.dtsi  | 394 ++++++++++++++++++
 1 file changed, 394 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi

diff --git a/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
new file mode 100644
index 000000000000..6f4798859542
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Device Tree Source for the Salvator-X MAX9286 expansion board
+ *
+ * Copyright (C) 2017 Ideas on Board <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/*
+ * MAX9286 A
+ */
+#define MAXIM_CAMERA0 "imi,rdacm20"
+#define MAXIM_CAMERA1 "imi,rdacm20"
+#define MAXIM_CAMERA2 "imi,rdacm20"
+#define MAXIM_CAMERA3 "imi,rdacm20"
+
+/*
+ * MAX9286 B
+ */
+#define MAXIM_CAMERA4 "imi,rdacm20"
+#define MAXIM_CAMERA5 "imi,rdacm20"
+#define MAXIM_CAMERA6 "imi,rdacm20"
+#define MAXIM_CAMERA7 "imi,rdacm20"
+
+/ {
+/*
+ * Powered MCU IMI cameras need delay between power-on and R-Car access
+ * to avoid I2C bus conflicts since the R-Car I2C does not support I2C
+ * multi-master. The I2C bus conflict would result in R-Car I2C IP stall.
+ */
+#define IMI_MCU_V0_DELAY	8000000	/* delay for powered MCU firmware v0 */
+#define IMI_MCU_V1_DELAY	3000000	/* delay for powered MCU firmware v1 */
+#define IMI_MCU_NO_DELAY	0	/* delay for unpowered MCU  */
+#define IMI_MCU_DELAY		IMI_MCU_V0_DELAY
+
+	poc_12v: regulator-vcc-poc-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "Camera PoC 12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		startup-delay-us = <(250000 + IMI_MCU_DELAY)>;
+
+		gpio = <&gpio6 30 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&vin0 {
+	status = "okay";
+};
+
+&vin1 {
+	status = "okay";
+};
+
+&vin2 {
+	status = "okay";
+};
+
+&vin3 {
+	status = "okay";
+};
+
+&vin4 {
+	status = "okay";
+};
+
+&vin5 {
+	status = "okay";
+};
+
+&vin6 {
+	status = "okay";
+};
+
+&vin7 {
+	status = "okay";
+};
+
+/* Disconnect the csi40 endpoint from the ADV748x TXA (HDMI) */
+&adv7482_txa {
+	/delete-property/ remote-endpoint;
+	status = "disabled";
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max9286_out0>;
+			};
+		};
+	};
+};
+
+&csi41 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi41_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max9286_out1>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	gmsl-deserializer@4c {
+		compatible = "maxim,max9286";
+		reg = <0x4c>;
+		poc-supply = <&poc_12v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				max9286_in0: endpoint {
+#ifdef MAXIM_CAMERA0
+					remote-endpoint = <&rdacm20_out0>;
+#endif
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				max9286_in1: endpoint {
+#ifdef MAXIM_CAMERA1
+					remote-endpoint = <&rdacm20_out1>;
+#endif
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				max9286_in2: endpoint {
+#ifdef MAXIM_CAMERA2
+					remote-endpoint = <&rdacm20_out2>;
+#endif
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				max9286_in3: endpoint {
+#ifdef MAXIM_CAMERA3
+					remote-endpoint = <&rdacm20_out3>;
+#endif
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+				max9286_out0: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+
+		i2c-mux {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+#ifdef MAXIM_CAMERA0
+				camera@31 {
+					compatible = MAXIM_CAMERA0;
+					reg = <0x31>, <0x41>, <0x51>;
+
+					port {
+						rdacm20_out0: endpoint {
+							remote-endpoint = <&max9286_in0>;
+						};
+					};
+
+				};
+#endif
+			};
+
+			i2c@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+#ifdef MAXIM_CAMERA1
+				camera@32 {
+					compatible = MAXIM_CAMERA1;
+					reg = <0x32>, <0x42>, <0x52>;
+					port {
+						rdacm20_out1: endpoint {
+							remote-endpoint = <&max9286_in1>;
+						};
+					};
+				};
+#endif
+			};
+
+			i2c@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
+
+#ifdef MAXIM_CAMERA2
+				camera@33 {
+					compatible = MAXIM_CAMERA2;
+					reg = <0x33>, <0x43>, <0x53>;
+					port {
+						rdacm20_out2: endpoint {
+							remote-endpoint = <&max9286_in2>;
+						};
+					};
+				};
+#endif
+			};
+
+			i2c@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+
+#ifdef MAXIM_CAMERA3
+				camera@34 {
+					compatible = MAXIM_CAMERA3;
+					reg = <0x34>, <0x44>, <0x54>;
+					port {
+						rdacm20_out3: endpoint {
+							remote-endpoint = <&max9286_in3>;
+						};
+					};
+				};
+#endif
+			};
+		};
+	};
+
+	gmsl-deserializer@6c {
+		compatible = "maxim,max9286";
+		reg = <0x6c>;
+		poc-supply = <&poc_12v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				max9286_in4: endpoint {
+#ifdef MAXIM_CAMERA4
+					remote-endpoint = <&rdacm20_out4>;
+#endif
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				max9286_in5: endpoint {
+#ifdef MAXIM_CAMERA5
+					remote-endpoint = <&rdacm20_out5>;
+#endif
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				max9286_in6: endpoint {
+#ifdef MAXIM_CAMERA6
+					remote-endpoint = <&rdacm20_out6>;
+#endif
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				max9286_in7: endpoint {
+#ifdef MAXIM_CAMERA7
+					remote-endpoint = <&rdacm20_out7>;
+#endif
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+				max9286_out1: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi41_in>;
+				};
+			};
+		};
+
+		i2c-mux {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+#ifdef MAXIM_CAMERA4
+				camera@35 {
+					compatible = MAXIM_CAMERA4;
+					reg = <0x35>, <0x45>, <0x55>;
+					port {
+						rdacm20_out4: endpoint {
+							remote-endpoint = <&max9286_in4>;
+						};
+					};
+				};
+#endif
+			};
+
+			i2c@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+#ifdef MAXIM_CAMERA5
+				camera@36 {
+					compatible = MAXIM_CAMERA5;
+					reg = <0x36>, <0x46>, <0x56>;
+					port {
+						rdacm20_out5: endpoint {
+							remote-endpoint = <&max9286_in5>;
+						};
+					};
+				};
+#endif
+			};
+
+			i2c@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
+
+#ifdef MAXIM_CAMERA6
+				camera@37 {
+					compatible = MAXIM_CAMERA6;
+					reg = <0x37>, <0x47>, <0x57>;
+					port {
+						rdacm20_out6: endpoint {
+							remote-endpoint = <&max9286_in6>;
+						};
+					};
+				};
+#endif
+			};
+
+			i2c@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+
+#ifdef MAXIM_CAMERA7
+				camera@38 {
+					compatible = MAXIM_CAMERA7;
+					reg = <0x38>, <0x48>, <0x58>;
+					port {
+						rdacm20_out7: endpoint {
+							remote-endpoint = <&max9286_in7>;
+						};
+					};
+				};
+#endif
+			};
+		};
+	};
+};
--
2.28.0

