Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC39251DFA
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 19:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgHYRPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 13:15:01 -0400
Received: from mailoutvs3.siol.net ([185.57.226.194]:34355 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726770AbgHYROQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 13:14:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id B548E524B4B;
        Tue, 25 Aug 2020 19:14:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id BS2R_IF3ccAG; Tue, 25 Aug 2020 19:14:11 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 6E50A524B0B;
        Tue, 25 Aug 2020 19:14:11 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 31092524B4B;
        Tue, 25 Aug 2020 19:14:09 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 2/3] ARM: dts: sun8i: r40: Add IR nodes
Date:   Tue, 25 Aug 2020 19:13:57 +0200
Message-Id: <20200825171358.1286902-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825171358.1286902-1-jernej.skrabec@siol.net>
References: <20200825171358.1286902-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner R40 has two IR cores, add nodes for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r=
40.dtsi
index d481fe7989b8..dff9a3dc1fba 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -513,6 +513,16 @@ i2c4_pins: i2c4-pins {
 				function =3D "i2c4";
 			};
=20
+			ir0_pins: ir0-pins {
+				pins =3D "PB4";
+				function =3D "ir0";
+			};
+
+			ir1_pins: ir1-pins {
+				pins =3D "PB23";
+				function =3D "ir1";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins =3D "PF0", "PF1", "PF2",
 				       "PF3", "PF4", "PF5";
@@ -591,6 +601,32 @@ wdt: watchdog@1c20c90 {
 			clocks =3D <&osc24M>;
 		};
=20
+		ir0: ir@1c21800 {
+			compatible =3D "allwinner,sun8i-r40-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg =3D <0x01c21800 0x400>;
+			pinctrl-0 =3D <&ir0_pins>;
+			pinctrl-names =3D "default";
+			clocks =3D <&ccu CLK_BUS_IR0>, <&ccu CLK_IR0>;
+			clock-names =3D "apb", "ir";
+			interrupts =3D <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			resets =3D <&ccu RST_BUS_IR0>;
+			status =3D "disabled";
+		};
+
+		ir1: ir@1c21c00 {
+			compatible =3D "allwinner,sun8i-r40-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg =3D <0x01c21c00 0x400>;
+			pinctrl-0 =3D <&ir1_pins>;
+			pinctrl-names =3D "default";
+			clocks =3D <&ccu CLK_BUS_IR1>, <&ccu CLK_IR1>;
+			clock-names =3D "apb", "ir";
+			interrupts =3D <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			resets =3D <&ccu RST_BUS_IR1>;
+			status =3D "disabled";
+		};
+
 		ths: thermal-sensor@1c24c00 {
 			compatible =3D "allwinner,sun8i-r40-ths";
 			reg =3D <0x01c24c00 0x100>;
--=20
2.28.0

