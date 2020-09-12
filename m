Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E220267AE9
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 16:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgILObr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 10:31:47 -0400
Received: from gw.c-home.cz ([89.24.150.100]:33037 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbgILObc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 10:31:32 -0400
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 08CEUtN2007223;
        Sat, 12 Sep 2020 16:31:01 +0200 (CEST)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/6] ARM: dts: sun8i: v3s: Add node for system control
Date:   Sat, 12 Sep 2020 16:30:49 +0200
Message-Id: <20200912143052.30952-4-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200912143052.30952-1-m.cerveny@computer.org>
References: <20200912143052.30952-1-m.cerveny@computer.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner V3s has system control and SRAM C1 region similar to H3.

Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index e5312869c0d2..3f18866fb37b 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -138,6 +138,29 @@
 			};
 		};
 
+		syscon: system-control@1c00000 {
+			compatible = "allwinner,sun8i-v3s-system-control",
+				     "allwinner,sun8i-h3-system-control";
+			reg = <0x01c00000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			sram_c: sram@1d00000 {
+				compatible = "mmio-sram";
+				reg = <0x01d00000 0x80000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x01d00000 0x80000>;
+
+				ve_sram: sram-section@0 {
+					compatible = "allwinner,sun8i-v3s-sram-c1",
+						     "allwinner,sun4i-a10-sram-c1";
+					reg = <0x000000 0x80000>;
+				};
+			};
+		};
+
 		tcon0: lcd-controller@1c0c000 {
 			compatible = "allwinner,sun8i-v3s-tcon";
 			reg = <0x01c0c000 0x1000>;
-- 
2.17.1

