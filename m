Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E136D6A7B9D
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 08:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjCBHFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 02:05:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjCBHFs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 02:05:48 -0500
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B8B42BD2;
        Wed,  1 Mar 2023 23:05:00 -0800 (PST)
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 2 Mar 2023
 14:34:53 +0800
From:   zelong dong <zelong.dong@amlogic.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
Date:   Thu, 2 Mar 2023 14:34:02 +0800
Message-ID: <20230302063402.42708-4-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230302063402.42708-1-zelong.dong@amlogic.com>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.11.69]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Zelong Dong <zelong.dong@amlogic.com>

Add the IR controller device of Meson-S4 SoC family, and enable
hardware IR decoder.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts   |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi        | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 8ffbcb2b1ac5..4d3a81b3b762 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -28,3 +28,9 @@ memory@0 {
 &uart_B {
 	status = "okay";
 };
+
+&ir {
+	status = "disabled";
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index ad50cba42d19..309352a83eda 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -106,6 +106,14 @@ gpio: bank@4000 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&periphs_pinctrl 0 0 82>;
 				};
+
+				remote_pins: remote_pin {
+					mux {
+						groups = "remote_in";
+						function = "remote_in";
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {
@@ -133,6 +141,14 @@ reset: reset-controller@2000 {
 				reg = <0x0 0x2000 0x0 0x98>;
 				#reset-cells = <1>;
 			};
+
+			ir: ir@84000 {
+				compatible = "amlogic,meson-s4-ir";
+				reg = <0x0 0x84040 0x0 0x54>;
+				interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+				amlogic,ir-support-hw-decode;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.35.1

