Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6F83D2088
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 11:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbhGVIbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 04:31:41 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:50555 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhGVIbc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 04:31:32 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id AFB71200013;
        Thu, 22 Jul 2021 09:12:05 +0000 (UTC)
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
Subject: [PATCH v6 5/8] arm64: dts: renesas: condor: Enable MAX9286
Date:   Thu, 22 Jul 2021 11:12:36 +0200
Message-Id: <20210722091239.26451-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722091239.26451-1-jacopo+renesas@jmondi.org>
References: <20210722091239.26451-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable the MAX9286 GMSL deserializers on Condor-V3H board.

Connected cameras should be defined in a device-tree overlay or included
after these definitions.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../boot/dts/renesas/r8a77980-condor.dts      | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 04d47c0c9bb9..cb79c8738b78 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -6,6 +6,8 @@
  * Copyright (C) 2018 Cogent Embedded, Inc.
  */
 
+#include <dt-bindings/gpio/gpio.h>
+
 /dts-v1/;
 #include "r8a77980.dtsi"
 
@@ -107,6 +109,34 @@ channel0 {
 	};
 };
 
+&csi40 {
+	status = "okay";
+
+	ports {
+		port@0 {
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
+		port@0 {
+			csi41_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max9286_out1>;
+			};
+		};
+	};
+};
+
 &du {
 	clocks = <&cpg CPG_MOD 724>,
 		 <&x1_clk>;
@@ -196,6 +226,164 @@ adv7511_out: endpoint {
 	};
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	gmsl0: gmsl-deserializer@48 {
+		compatible = "maxim,max9286";
+		reg = <0x48>;
+
+		maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&io_expander0 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+
+			port@2 {
+				reg = <2>;
+			};
+
+			port@3 {
+				reg = <3>;
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
+				status = "disabled";
+			};
+
+			i2c@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				status = "disabled";
+			};
+
+			i2c@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
+
+				status = "disabled";
+			};
+
+			i2c@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+
+				status = "disabled";
+			};
+		};
+	};
+
+	gmsl1: gmsl-deserializer@4a {
+		compatible = "maxim,max9286";
+		reg = <0x4a>;
+
+		maxim,gpio-poc = <0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&io_expander1 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+			};
+
+			port@1 {
+				reg = <1>;
+			};
+
+			port@2 {
+				reg = <2>;
+			};
+
+			port@3 {
+				reg = <3>;
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
+				status = "disabled";
+			};
+
+			i2c@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				status = "disabled";
+			};
+
+			i2c@2 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <2>;
+
+				status = "disabled";
+			};
+
+			i2c@3 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <3>;
+
+				status = "disabled";
+			};
+		};
+	};
+};
+
 &lvds0 {
 	status = "okay";
 
@@ -252,6 +440,11 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
 	mmc_pins: mmc {
 		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
 		function = "mmc";
-- 
2.32.0

