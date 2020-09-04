Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E2F25E285
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 22:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgIDUSE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 16:18:04 -0400
Received: from gw.c-home.cz ([89.24.150.100]:41821 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbgIDUSE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 16:18:04 -0400
X-Greylist: delayed 967 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Sep 2020 16:18:04 EDT
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 084K1EdE002405;
        Fri, 4 Sep 2020 22:01:30 +0200 (CEST)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     devicetree@vger.kernel.org
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 6/6] ARM: dts: sun8i: v3s: Add video engine node
Date:   Fri,  4 Sep 2020 22:01:12 +0200
Message-Id: <20200904200112.5563-7-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904200112.5563-1-m.cerveny@computer.org>
References: <20200904200112.5563-1-m.cerveny@computer.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner V3S SoC has a video engine.
Add a node for it.

Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 3f18866fb..3fb01dc1a 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -195,6 +195,16 @@
 			};
 		};
 
+		video-codec@1c0e000 {
+			compatible = "allwinner,sun8i-v3s-video-engine";
+			reg = <0x01c0e000 0x1000>;
+			clocks = <&ccu CLK_BUS_VE>, <&ccu CLK_VE>,
+				 <&ccu CLK_DRAM_VE>;
+			clock-names = "ahb", "mod", "ram";
+			resets = <&ccu RST_BUS_VE>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			allwinner,sram = <&ve_sram 1>;
+		};
 
 		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun7i-a20-mmc";
-- 
2.17.1

