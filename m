Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3EAF98D84
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 10:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732304AbfHVIVk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 04:21:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732287AbfHVIVh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 04:21:37 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC79D2378A;
        Thu, 22 Aug 2019 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566462096;
        bh=C0kicoq9tih86PmzdpH4j+5B+jEevIsiDRDL1K42ByQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MWiXa59k9Km9/iGmB4MdHY3WOFIuSmaZ9QVtEiitK7GGb6355ynGAd6IF+Xa4M/f5
         iX4R6R4qHKoi2mGRTmj3Sz1iaOEpap1b+qOYkaP+GtSi2bIbm/h8eAoU1MVmVFRSg3
         2W4vpm5fJfVRYZtFIVIF/uTuzQKY5FyzvhX6Bjfo=
From:   Maxime Ripard <mripard@kernel.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v8 4/5] ARM: dts: sun7i: Add CSI0 controller
Date:   Thu, 22 Aug 2019 10:21:15 +0200
Message-Id: <9ba687cb63e4cd07867575f24f1312641971cba5.1566462064.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.85d78dd1a3b44fe4cde1b65a9b1eb3b95daea7cc.1566462064.git-series.maxime.ripard@bootlin.com>
References: <cover.85d78dd1a3b44fe4cde1b65a9b1eb3b95daea7cc.1566462064.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

The CSI controller embedded in the A20 can be supported by our new driver.
Let's add it to our DT.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 9ad8e445b240..713c20be8c7a 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -376,6 +376,17 @@
 			num-cs = <1>;
 		};
 
+		csi0: csi@1c09000 {
+			compatible = "allwinner,sun7i-a20-csi0";
+			reg = <0x01c09000 0x1000>;
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
+				 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
+			clock-names = "bus", "mod", "isp", "ram";
+			resets = <&ccu RST_CSI0>;
+			status = "disabled";
+		};
+
 		emac: ethernet@1c0b000 {
 			compatible = "allwinner,sun4i-a10-emac";
 			reg = <0x01c0b000 0x1000>;
@@ -775,6 +786,20 @@
 			};
 
 			/omit-if-no-ref/
+			csi0_8bits_pins: csi-8bits-pins {
+				pins = "PE0", "PE2", "PE3", "PE4", "PE5",
+				       "PE6", "PE7", "PE8", "PE9", "PE10",
+				       "PE11";
+				function = "csi0";
+			};
+
+			/omit-if-no-ref/
+			csi0_clk_pin: csi-clk-pin {
+				pins = "PE1";
+				function = "csi0";
+			};
+
+			/omit-if-no-ref/
 			emac_pa_pins: emac-pa-pins {
 				pins = "PA0", "PA1", "PA2",
 				       "PA3", "PA4", "PA5", "PA6",
-- 
git-series 0.9.1
