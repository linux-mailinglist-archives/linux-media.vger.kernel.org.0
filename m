Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBC5B6DD767
	for <lists+linux-media@lfdr.de>; Tue, 11 Apr 2023 12:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjDKKEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Apr 2023 06:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjDKKEZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Apr 2023 06:04:25 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ADE5E26B8;
        Tue, 11 Apr 2023 03:04:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; 
   d="scan'208";a="155587973"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 19:04:23 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C39FE400F2DA;
        Tue, 11 Apr 2023 19:04:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 7/8] arm64: dts: renesas: rzg2l-smarc: Link DSI with ADV7535
Date:   Tue, 11 Apr 2023 11:03:45 +0100
Message-Id: <20230411100346.299768-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411100346.299768-1-biju.das.jz@bp.renesas.com>
References: <20230411100346.299768-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable DSI and ADV7535 and link DSI with ADV7535 on RZ/G2L SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Linked DSI with ADV7535.
 * Added CEC clock and clock names
 * Added hotplug detection interrupt.
 * Removed pinctrl properties as it is defined in common.
 * Removed Rb tag from Geert as there are too many changes.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 79 ++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index e180a955b6ac..2a158a954b2f 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -16,12 +16,91 @@ aliases {
 		serial1 = &scif2;
 		i2c3 = &i2c3;
 	};
+
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
 };
 
 &cpu_dai {
 	sound-dai = <&ssi0>;
 };
 
+&dsi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dsi0_in: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dsi0_out: endpoint {
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7535_in>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>;
+
+		interrupt-parent = <&pinctrl>;
+		interrupts = <RZG2L_GPIO(2, 1) IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		a2vdd-supply = <&reg_1p8v>;
+		v3p3-supply = <&reg_3p3v>;
+		v1p2-supply = <&reg_1p8v>;
+
+		adi,dsi-lanes = <4>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
-- 
2.25.1

