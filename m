Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3F2614C66
	for <lists+linux-media@lfdr.de>; Tue,  1 Nov 2022 15:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiKAORX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Nov 2022 10:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbiKAORV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Nov 2022 10:17:21 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 442A61B1F3;
        Tue,  1 Nov 2022 07:17:19 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 588F711FB;
        Tue,  1 Nov 2022 07:17:25 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81A193F703;
        Tue,  1 Nov 2022 07:17:17 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 7/9] ARM: dts: suniv: f1c100s: add CIR DT node
Date:   Tue,  1 Nov 2022 14:16:56 +0000
Message-Id: <20221101141658.3631342-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101141658.3631342-1-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
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
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 2901c586971b4..d29b48f23b89a 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -251,6 +251,17 @@ pwm: pwm@1c21000 {
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
2.25.1

