Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8253C7AABE7
	for <lists+linux-media@lfdr.de>; Fri, 22 Sep 2023 10:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjIVIGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Sep 2023 04:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbjIVIGn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Sep 2023 04:06:43 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA8BCE3;
        Fri, 22 Sep 2023 01:05:53 -0700 (PDT)
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 22 Sep 2023
 16:05:49 +0800
From:   zelong dong <zelong.dong@amlogic.com>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
        <kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH] arm64: dts: amlogic: Fix IR Controller register area for Meson-GX/AXG/G12 series SoCs
Date:   Fri, 22 Sep 2023 16:05:46 +0800
Message-ID: <20230922080546.26442-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
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

Amloic Meson-6 SoC only has one IR Controller, since then, there are 2 IR
Controllers in every SoCs, one is Legacy IR Controller (same as Meson-6's one),
the new one is Multi-Format IR Controller (abbreviated "MF-IR",
which supports more than one IR Protocol). MF-IR was updated several times,
so different SoCs could be got different register sizes.

There are all IR Controller register areas from upstream's SoCs:
                              Legacy IR             MF-IR
Meson-6                  | <0xc8100480 0x20> |       NULL        |
Meson-8/8B/8M2           | <0xc8100480 0x20> | <0xc8100580 0x30> |
Meson-GXBB               | <0xc8100480 0x20> | <0xc8100580 0x44> |
Meson-GXM/GXL  	         | <0xc8100480 0x20> | <0xc8100580 0x54> |
Meson-AXG/G12A/G12B/SM1  | <0xff808000 0x20> | <0xff808040 0x58> |

About Meson-IR driver, MF-IR was supported from Meson-8, which was distinguished
by compatible string (of_device_is_compatible(node, "amlogic,meson6-ir")),
and only one register (macro 'IR_DEC_REG2') was added because controller worked
in raw decoder mode, later registers are unused, so we recommend that register
size should be 0x24 if MF-IR is in use.

There are 2 ways to fix.

MF-IR is in use:
  Meson-8/8B/8M2/GXBB/GXM/GXL: <0xc8100580 0x24>
  Meson-AXG/G12A/G12B/SM1:     <0xff808040 0x24>

Legacy IR is in use:
  Meson-8/8B/8M2/GXBB/GXM/GXL: <0xc8100480 0x20>
  Meson-AXG/G12A/G12B/SM1:     <0xff808000 0x20>

Fixes: 2bfe8412c5388a ("arm64: dts: meson-g12a: Add IR nodes")
Fixes: 7bd46a79aad549 ("ARM64: dts: meson-axg: enable IR controller")
Fixes: c58d77855f0069 ("ARM64: dts: meson-gxbb: Add Infrared Remote Controller decoder")
Link: https://lore.kernel.org/all/20160820095424.636-5-martin.blumenstingl@googlemail.com/
Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 768d0ed78dbe..dd8c58e74322 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1705,9 +1705,9 @@ pwm_AO_ab: pwm@7000 {
 				status = "disabled";
 			};
 
-			ir: ir@8000 {
+			ir: ir@8040 {
 				compatible = "amlogic,meson-gxbb-ir";
-				reg = <0x0 0x8000 0x0 0x20>;
+				reg = <0x0 0x8040 0x0 0x24>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ff68b911b729..e12cea5fa889 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2084,9 +2084,9 @@ pwm_AO_ab: pwm@7000 {
 				status = "disabled";
 			};
 
-			ir: ir@8000 {
+			ir: ir@8040 {
 				compatible = "amlogic,meson-gxbb-ir";
-				reg = <0x0 0x8000 0x0 0x20>;
+				reg = <0x0 0x8040 0x0 0x24>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 2673f0dbafe7..0c04e34a0923 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -506,7 +506,7 @@ pwm_AO_ab: pwm@550 {
 
 			ir: ir@580 {
 				compatible = "amlogic,meson-gx-ir", "amlogic,meson-gxbb-ir";
-				reg = <0x0 0x00580 0x0 0x40>;
+				reg = <0x0 0x00580 0x0 0x24>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
-- 
2.35.1

