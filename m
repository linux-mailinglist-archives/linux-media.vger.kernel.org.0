Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65893D208B
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 11:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbhGVIbn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 04:31:43 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:50555 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbhGVIbg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 04:31:36 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 24F0D200012;
        Thu, 22 Jul 2021 09:12:09 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] arm64: dts: renesas: Add GMSL cameras .dtsi
Date:   Thu, 22 Jul 2021 11:12:38 +0200
Message-Id: <20210722091239.26451-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722091239.26451-1-jacopo+renesas@jmondi.org>
References: <20210722091239.26451-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Describe the FAKRA connector available on Eagle and Condor boards that
allow to connect GMSL camera modules such as IMI RDACM20 and RDACM21.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi | 332 ++++++++++++++++++
 1 file changed, 332 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi

diff --git a/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi b/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
new file mode 100644
index 000000000000..d45f072f8cdf
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
@@ -0,0 +1,332 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2017 Ideas on Board <kieran.bingham@ideasonboard.com>
+ * Copyright (C) 2021 Jacopo Mondi <jacopo+renesas@jmondi.org>
+ *
+ * Device Tree Source (overlay) that describes GMSL camera connected to
+ * Fakra connectors for the Eagle V3M and Condor V3H (and compatible) boards.
+ *
+ * The following cameras are currently supported: RDACM20 and RDACM21.
+ *
+ * The board .dts file that include this has to select which cameras are in use
+ * by specifying the camera model with:
+ *
+ * #define GMSL_CAMERA_RDACM20
+ * or
+ * #define GMSL_CAMERA_RDACM21
+ *
+ * And which cameras are connected to the board by defining:
+ * for GMSL channel 0:
+ *	   #define GMSL_CAMERA_0
+ *	   #define GMSL_CAMERA_1
+ *	   #define GMSL_CAMERA_2
+ *	   #define GMSL_CAMERA_3
+ *
+ * for GMSL channel 1:
+ *	   #define GMSL_CAMERA_4
+ *	   #define GMSL_CAMERA_5
+ *	   #define GMSL_CAMERA_6
+ *	   #define GMSL_CAMERA_7
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* Validate the board file settings. */
+#if !defined(GMSL_CAMERA_RDACM20) && !defined(GMSL_CAMERA_RDACM21)
+#error "Camera model should be defined by the board file"
+#endif
+
+#if defined(GMSL_CAMERA_RDACM20) && defined(GMSL_CAMERA_RDACM21)
+#error "A single camera model should be selected"
+#endif
+
+#if !defined(GMSL_CAMERA_0) && !defined(GMSL_CAMERA_1) && \
+    !defined(GMSL_CAMERA_2) && !defined(GMSL_CAMERA_3) && \
+    !defined(GMSL_CAMERA_4) && !defined(GMSL_CAMERA_5) && \
+    !defined(GMSL_CAMERA_6) && !defined(GMSL_CAMERA_7)
+#error "At least one camera should be selected"
+#endif
+
+/* Deduce from the enabled cameras which GMSL channels are active. */
+#if defined(GMSL_CAMERA_0) || defined(GMSL_CAMERA_1) || \
+    defined(GMSL_CAMERA_2) || defined(GMSL_CAMERA_3)
+#define GMSL_0
+#endif
+
+#if defined(GMSL_CAMERA_4) || defined(GMSL_CAMERA_5) || \
+    defined(GMSL_CAMERA_6) || defined(GMSL_CAMERA_7)
+#define GMSL_1
+#endif
+
+/* Deduce the camera model compatible string. */
+#if defined(GMSL_CAMERA_RDACM20)
+#define GMSL_CAMERA_MODEL "imi,rdacm20"
+#elif defined(GMSL_CAMERA_RDACM21)
+#define GMSL_CAMERA_MODEL "imi,rdacm21"
+#endif
+
+#ifdef GMSL_0
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
+&gmsl0 {
+	status = "okay";
+
+#if defined(GMSL_CAMERA_RDACM21)
+	maxim,reverse-channel-microvolt = <100000>;
+#endif
+
+	ports {
+#ifdef GMSL_CAMERA_0
+		port@0 {
+			max9286_in0: endpoint {
+				remote-endpoint = <&fakra_con0>;
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_1
+		port@1 {
+			max9286_in1: endpoint{
+				remote-endpoint = <&fakra_con1>;
+			};
+
+		};
+#endif
+
+#ifdef GMSL_CAMERA_2
+		port@2 {
+			max9286_in2: endpoint {
+				remote-endpoint = <&fakra_con2>;
+			};
+
+		};
+#endif
+
+#ifdef GMSL_CAMERA_3
+		port@3 {
+			max9286_in3: endpoint {
+				remote-endpoint = <&fakra_con3>;
+			};
+
+		};
+#endif
+	};
+
+	i2c-mux {
+#ifdef GMSL_CAMERA_0
+		i2c@0 {
+			status = "okay";
+
+			camera@51 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x51>, <0x61>;
+
+				port {
+					fakra_con0: endpoint {
+						remote-endpoint = <&max9286_in0>;
+					};
+				};
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_1
+		i2c@1 {
+			status = "okay";
+
+			camera@52 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x52>, <0x62>;
+
+				port {
+					fakra_con1: endpoint {
+						remote-endpoint = <&max9286_in1>;
+					};
+				};
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_2
+		i2c@2 {
+			status = "okay";
+
+			camera@53 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x53>, <0x63>;
+
+				port {
+					fakra_con2: endpoint {
+						remote-endpoint = <&max9286_in2>;
+					};
+				};
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_3
+		i2c@3 {
+			status = "okay";
+
+			camera@54 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x54>, <0x64>;
+
+				port {
+					fakra_con3: endpoint {
+						remote-endpoint = <&max9286_in3>;
+					};
+				};
+			};
+		};
+#endif
+	};
+};
+#endif /* ifdef GMSL_0 */
+
+#ifdef GMSL_1
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
+&gmsl1 {
+	status = "okay";
+
+#if defined(GMSL_CAMERA_RDACM21)
+	maxim,reverse-channel-microvolt = <100000>;
+#endif
+
+	ports {
+#ifdef GMSL_CAMERA_4
+		port@0 {
+			max9286_in4: endpoint {
+				remote-endpoint = <&fakra_con4>;
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_5
+		port@1 {
+			max9286_in5: endpoint{
+				remote-endpoint = <&fakra_con5>;
+			};
+
+		};
+#endif
+
+#ifdef GMSL_CAMERA_6
+		port@2 {
+			max9286_in6: endpoint {
+				remote-endpoint = <&fakra_con6>;
+			};
+
+		};
+#endif
+
+#ifdef GMSL_CAMERA_7
+		port@3 {
+			max9286_in7: endpoint {
+				remote-endpoint = <&fakra_con7>;
+			};
+
+		};
+#endif
+	};
+
+	i2c-mux {
+#ifdef GMSL_CAMERA_4
+		i2c@0 {
+			status = "okay";
+
+			camera@55 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x55>, <0x65>;
+
+				port {
+					fakra_con4: endpoint {
+						remote-endpoint = <&max9286_in4>;
+					};
+				};
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_5
+		i2c@1 {
+			status = "okay";
+
+			camera@56 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x56>, <0x66>;
+
+				port {
+					fakra_con5: endpoint {
+						remote-endpoint = <&max9286_in5>;
+					};
+				};
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_6
+		i2c@2 {
+			status = "okay";
+
+			camera@57 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x57>, <0x67>;
+
+				port {
+					fakra_con6: endpoint {
+						remote-endpoint = <&max9286_in6>;
+					};
+				};
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_7
+		i2c@3 {
+			status = "okay";
+
+			camera@58 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x58>, <0x68>;
+
+				port {
+					fakra_con7: endpoint {
+						remote-endpoint = <&max9286_in7>;
+					};
+				};
+			};
+		};
+#endif
+	};
+};
+#endif /* ifdef GMSL_1 */
-- 
2.32.0

