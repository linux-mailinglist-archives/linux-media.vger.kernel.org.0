Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC142C7068
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 19:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730198AbgK1R6h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 12:58:37 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:38082 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732191AbgK1R4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 12:56:04 -0500
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id C9BA03AFE4D;
        Sat, 28 Nov 2020 14:29:42 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 132404000A;
        Sat, 28 Nov 2020 14:29:20 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: [PATCH v2 14/19] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
Date:   Sat, 28 Nov 2020 15:28:34 +0100
Message-Id: <20201128142839.517949-15-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MIPI CSI-2 is supported on the V3s with an A31-based MIPI CSI-2 bridge
controller. The controller uses a separate D-PHY, which is the same
that is otherwise used for MIPI DSI, but used in Rx mode.

On the V3s, the CSI0 controller is dedicated to MIPI CSI-2 as it does
not have access to any parallel interface pins.

Add all the necessary nodes (CSI0, MIPI CSI-2 bridge and D-PHY) to
support the MIPI CSI-2 interface.

Note that a fwnode graph link is created between CSI0 and MIPI CSI-2
even when no sensor is connected. This will result in a probe failure
for the controller as long as no sensor is connected but this is fine
since no other interface is available.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 7926c8b2ac5e..641da6c7bca0 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -530,6 +530,31 @@ spi0: spi@1c68000 {
 			#size-cells = <0>;
 		};
 
+		csi0: camera@1cb0000 {
+			compatible = "allwinner,sun8i-v3s-csi";
+			reg = <0x01cb0000 0x1000>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI1_SCLK>,
+				 <&ccu CLK_DRAM_CSI>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_CSI>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					csi0_in_mipi_csi2: endpoint {
+						remote-endpoint = <&mipi_csi2_out_csi0>;
+					};
+				};
+			};
+		};
+
 		csi1: camera@1cb4000 {
 			compatible = "allwinner,sun8i-v3s-csi";
 			reg = <0x01cb4000 0x3000>;
@@ -561,5 +586,48 @@ gic: interrupt-controller@1c81000 {
 			#interrupt-cells = <3>;
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
+
+		mipi_csi2: csi@1cb1000 {
+			compatible = "allwinner,sun8i-v3s-mipi-csi2",
+				     "allwinner,sun6i-a31-mipi-csi2";
+			reg = <0x01cb1000 0x1000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI1_SCLK>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_CSI>;
+			status = "disabled";
+
+			phys = <&dphy>;
+			phy-names = "dphy";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mipi_csi2_in: port@0 {
+					reg = <0>;
+				};
+
+				mipi_csi2_out: port@1 {
+					reg = <1>;
+
+					mipi_csi2_out_csi0: endpoint {
+						remote-endpoint = <&csi0_in_mipi_csi2>;
+					};
+				};
+			};
+		};
+
+		dphy: d-phy@1cb2000 {
+			compatible = "allwinner,sun6i-a31-mipi-dphy";
+			reg = <0x01cb2000 0x1000>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_MIPI_CSI>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_CSI>;
+			status = "disabled";
+			#phy-cells = <0>;
+		};
 	};
 };
-- 
2.29.2

