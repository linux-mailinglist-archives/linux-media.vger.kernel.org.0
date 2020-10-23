Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1591729768B
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 20:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754442AbgJWSMB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 14:12:01 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:52038 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754363AbgJWSLX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 14:11:23 -0400
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id AFCB43A1F96;
        Fri, 23 Oct 2020 17:46:56 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7F7921BF210;
        Fri, 23 Oct 2020 17:46:30 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yong Deng <yong.deng@magewell.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kevin.lhopital@hotmail.com
Subject: [PATCH 10/14] ARM: dts: sun8i: v3s: Add MIPI D-PHY and MIPI CSI-2 interface nodes
Date:   Fri, 23 Oct 2020 19:45:42 +0200
Message-Id: <20201023174546.504028-11-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
References: <20201023174546.504028-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

MIPI CSI-2 is supported on the V3s with an A31 controller, which seems
to be used on all Allwinner chips supporting it, except for the A83T.
The controller is connected to CSI0 through fwnode endpoints.
The mipi_csi2_in port node is provided to connect MIPI CSI-2 sensors.

The D-PHY part is the same that already drives DSI, but used in Rx mode.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 07722bc5df11..6e10c10ab283 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -534,6 +534,13 @@ csi0: camera@1cb0000 {
 			clock-names = "bus", "mod", "ram";
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
+
+			csi0_in: port {
+				csi0_in_mipi_csi2: endpoint {
+					bus-type = <4>; /* CSI2_DPHY */
+					remote-endpoint = <&mipi_csi2_out_csi0>;
+				};
+			};
 		};
 
 		csi1: camera@1cb4000 {
@@ -558,5 +565,48 @@ gic: interrupt-controller@1c81000 {
 			#interrupt-cells = <3>;
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
+
+		mipi_csi2: mipi-csi2@1cb1000 {
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
2.28.0

