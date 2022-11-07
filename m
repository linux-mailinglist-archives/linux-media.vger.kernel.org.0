Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A57161E80F
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 01:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbiKGA4S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Nov 2022 19:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbiKGA4R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Nov 2022 19:56:17 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 32ADFA449;
        Sun,  6 Nov 2022 16:56:16 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2165E1FB;
        Sun,  6 Nov 2022 16:56:22 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 124003F703;
        Sun,  6 Nov 2022 16:56:13 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 06/10] ARM: dts: suniv: f1c100s: add CIR DT node
Date:   Mon,  7 Nov 2022 00:54:29 +0000
Message-Id: <20221107005433.11079-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221107005433.11079-1-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CIR (infrared receiver) controller in the Allwinner F1C100s series
of SoCs is compatible to the ones used in other Allwinner SoCs.

Add the DT node describing the resources of the controller.
There are multiple possible pinmuxes, but none as them seem to be an
obvious choice, so refrain from adding any pincontroller subnodes for
now.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 4f45168cea42..c04cd175f743 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -269,6 +269,17 @@ pwm: pwm@1c21000 {
 			status = "disabled";
 		};
 
+		ir: ir@1c22c00 {
+			compatible = "allwinner,suniv-f1c100s-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x01c22c00 0x400>;
+			clocks = <&ccu CLK_BUS_IR>, <&ccu CLK_IR>;
+			clock-names = "apb", "ir";
+			resets = <&ccu RST_BUS_IR>;
+			interrupts = <6>;
+			status = "disabled";
+		};
+
 		uart0: serial@1c25000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c25000 0x400>;
-- 
2.35.5

