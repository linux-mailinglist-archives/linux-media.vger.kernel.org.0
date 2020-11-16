Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8622B4449
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 14:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgKPNCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 08:02:10 -0500
Received: from gw.c-home.cz ([89.24.150.100]:33786 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728594AbgKPNCJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 08:02:09 -0500
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Mon, 16 Nov 2020 08:02:08 EST
Received: from ubuntu2004.c-home.cz (unifi.c-home.cz [192.168.1.227])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 0AGCuMlb021922;
        Mon, 16 Nov 2020 13:56:46 +0100 (CET)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 6/6] ARM: dts: sun8i: v3s: Add video engine node
Date:   Mon, 16 Nov 2020 13:56:17 +0100
Message-Id: <20201116125617.7597-7-m.cerveny@computer.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116125617.7597-1-m.cerveny@computer.org>
References: <20201116125617.7597-1-m.cerveny@computer.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 70193512c222..e8f304125e2d 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -211,6 +211,16 @@ tcon0_out: port@1 {
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
2.25.1

