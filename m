Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 499F611F953
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfLOQ7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 11:59:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:55142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbfLOQ7c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 11:59:32 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BAFA24676;
        Sun, 15 Dec 2019 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576429171;
        bh=EZHv3FHkZdfny3NSAdab5tp7Y0RDcEfbHiuBOD3ZxQo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xwiYOsuzNAWmNvP5nIpflWhBotg3GwseugwEVquZTU9FO2v2x4qdUzaotd9+R8Ibn
         lEkoZUXeAgGIVD6zoRRX2wwffcooRSlf5d0MTvnW7qG5mCQfXs1Yeojuh4eGsbOayX
         SA6PinGY+41TiMJXEbnQkX01H4aGDHi35+chg2j0=
Received: by wens.tw (Postfix, from userid 1000)
        id 6B3535FD8D; Mon, 16 Dec 2019 00:59:26 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 08/14] ARM: dts: sun7i: Add CSI1 controller and pinmux options
Date:   Mon, 16 Dec 2019 00:59:18 +0800
Message-Id: <20191215165924.28314-9-wens@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215165924.28314-1-wens@kernel.org>
References: <20191215165924.28314-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The CSI controller driver now supports the second CSI controller, CSI1.

Add a device node for it. Pinmuxing options for the MCLK output, the
standard 8-bit interface, and a secondary 24-bit interface are included.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 8aebefd6accf..92b5be97085d 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -729,6 +729,17 @@ ohci1: usb@1c1c400 {
 			status = "disabled";
 		};
 
+		csi1: csi@1c1d000 {
+			compatible = "allwinner,sun7i-a20-csi1",
+				     "allwinner,sun4i-a10-csi1";
+			reg = <0x01c1d000 0x1000>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_AHB_CSI1>, <&ccu CLK_DRAM_CSI1>;
+			clock-names = "bus", "ram";
+			resets = <&ccu RST_CSI1>;
+			status = "disabled";
+		};
+
 		spi3: spi@1c1f000 {
 			compatible = "allwinner,sun4i-a10-spi";
 			reg = <0x01c1f000 0x1000>;
@@ -802,6 +813,31 @@ csi0_clk_pin: csi-clk-pin {
 				function = "csi0";
 			};
 
+			/omit-if-no-ref/
+			csi1_8bits_pg_pins: csi1-8bits-pg-pins {
+				pins = "PG0", "PG2", "PG3", "PG4", "PG5",
+				       "PG6", "PG7", "PG8", "PG9", "PG10",
+				       "PG11";
+				function = "csi1";
+			};
+
+			/omit-if-no-ref/
+			csi1_24bits_ph_pins: csi1-24bits-ph-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH8", "PH9",
+				       "PH10", "PH11", "PH12", "PH13", "PH14",
+				       "PH15", "PH16", "PH17", "PH18", "PH19",
+				       "PH20", "PH21", "PH22", "PH23", "PH24",
+				       "PH25", "PH26", "PH27";
+				function = "csi1";
+			};
+
+			/omit-if-no-ref/
+			csi1_clk_pg_pin: csi1-clk-pg-pin {
+				pins = "PG1";
+				function = "csi1";
+			};
+
 			/omit-if-no-ref/
 			emac_pa_pins: emac-pa-pins {
 				pins = "PA0", "PA1", "PA2",
-- 
2.24.0

