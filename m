Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8BA313939F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 15:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728753AbgAMOYQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 09:24:16 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:54077 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgAMOYQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 09:24:16 -0500
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MOz8O-1j0oI70tdE-00PLLy; Mon, 13 Jan 2020 15:24:07 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id A830964F01C;
        Mon, 13 Jan 2020 14:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vzUCvqcV14CS; Mon, 13 Jan 2020 15:24:06 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 3F6DB64B6A6;
        Mon, 13 Jan 2020 15:24:06 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.10.2.141) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1320.4; Mon, 13 Jan 2020 15:24:06 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 71DFA804E9; Mon, 13 Jan 2020 15:15:56 +0100 (CET)
Date:   Mon, 13 Jan 2020 15:15:56 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH 8/8] arm64: dts: renesas: salvator: add a connection from
 adv748x codec (HDMI input) to the R-Car SoC
Message-ID: <20200113141556.GI3606@pflmari>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1578924232.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.10.2.141]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A29536F936F657D64
X-Provags-ID: V03:K1:+hCkZs0BPCyfiB2bMm4kgwOFfr0Pn/LcYtMDEgrdwAIG/OzDd23
 oOCm/6P+XlgO6YQTH5qzua0FJxYe32JWgf7X5TOJ93twnB8cVlr3Sl6FvFAajJD3f8C/wgI
 5udXBeqL9AIR0LftaokR37i8UGuK76PXOnuBYqQm7VFxkiMYx8v+lvZYOeCj6sB4u4uiH5v
 53GMSZ3XU7Fbntc7OAiAw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vh3IC8hl0gg=:nplkzAnaXlqyOnSk1nGUAt
 FP68QTFH4TbG4+VpZPD4hvmTKsqjfIbt3u/g9MFCd/h+BhB0PH3BmEPZzi5zSnmiv3pYKVcIi
 ouWhFZcBxDXnVZlR4vfd5AMttLVhuMEwB7/SboCpq6DrItO7kcJgb597UmW4UUL7LzbY0QoBC
 o9TWFCZIaQIeQhXZd8U3z5bwtNoMwA1+PKFevxbcq6B8fAEKqxVueSDAhKPNcEEvEhi2S9Rl3
 0JJrneXWKKl3M/vsFHNkxwQfa4yZiJqctXSrBLMNXRot0bHYd0niomLbbsWdD0gilqDROPS3G
 mRriZz4g6iHshqZSR/8u9fFbEIPdY0hlV2OE1Urt+5KG8O+yn8cmQJniaY51S7aQ0cPRV+L6F
 xWU/CC5prHD3dvBZNsS88y1kAmtHy8xk2lngl0gWf4Qjv01fxnaQFi5LGDOzun7aoW9Ev6B6x
 UjWeH8LCpMmfvBfObQ/9//dfOp6WrW+s4X+15xQxGWfsEu41yeOWKuSlAlKpvnLO4yVL+WOvN
 E7PvdMlrMP2EYFM7FNzAA20wgC/mic0up2UXCRNvQFxBofImuC/Xu3mc/BWF98tFeD6/qV96n
 LlndOn4JBJKKsyvwoZRzYK8ThI75XrgIqUZLDa3c6V3Z/kDCj+1PyKhKZo7qKYEkXIeMDmrgf
 NaTViF/cmINafcVdu+2uc09W2dnKFu0Dbb0i5aUXjaFiTHVViNXxoah5KE6WniLE8eQGE1SM5
 ir+vHWdTFunm0UlZXEGWqC7IUlyLzyRfCKDav6nqwg1dvUIGAeG3RXJRz+rbzCW2jB9aJY8nJ
 JIt0MqUbnss6KKckFyTRk8RPI8hCA+Dp9pTE59zG05sHoAG9k4YfoSP2bQgrxdK5zyaScQsyO
 In+EQGnbcVID7Lncr563g8Sbdoflkr3CScfAfp3D4=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Not sure if all variants of the Salvator board have the HDMI decoder
chip (the ADV7482) connected to the SSI4 on R-Car SoC, as it is on
Salvator-X ES1, so the the ADV7482 endpoint and connection definitions
are placed in the board file.

I do assume though that all Salvator variants have the CLK_C clock line
hard-wired to the ADV7482 HDMI decoder, and remove it from the list of
clocks provided by the R-Car sound system.

The I2C wiring is also likely to persist across the variants (similar
to ak4613, connected to the same interface), so that is in the common
file.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
---
 .../dts/renesas/r8a7795-es1-salvator-x.dts    | 24 ++++++++++++-
 .../boot/dts/renesas/salvator-common.dtsi     | 35 ++++++++++++++++---
 2 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
index c72968623e94..10f74f7a0efe 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1-salvator-x.dts
@@ -136,9 +136,29 @@
 				playback = <&ssi3>;
 			};
 		};
+		rsnd_port3: port@3 {
+			reg = <3>;
+			rsnd_endpoint3: endpoint {
+				remote-endpoint = <&adv7482_i2s>;
+
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-format = "left_j";
+				mclk-fs = <256>;
+				bitclock-master = <&adv7482_i2s>;
+				frame-master = <&adv7482_i2s>;
+				system-clock-direction-out;
+
+				capture = <&ssi4>;
+			};
+		};
 	};
 };
 
+&adv7482_i2s {
+	remote-endpoint = <&rsnd_endpoint3>;
+};
+
 &sata {
 	status = "okay";
 };
@@ -146,9 +166,11 @@
 &sound_card {
 	dais = <&rsnd_port0	/* ak4613 */
 		&rsnd_port1	/* HDMI0  */
-		&rsnd_port2>;	/* HDMI1  */
+		&rsnd_port2	/* HDMI1  */
+		&rsnd_port3>;	/* adv7482 hdmi-in  */
 };
 
+
 &usb2_phy2 {
 	pinctrl-0 = <&usb2_pins>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 21e01056e759..e887805b16fc 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -322,6 +322,10 @@
 	clock-frequency = <22579200>;
 };
 
+&audio_clk_c {
+	clock-frequency = <12288000>;
+};
+
 &avb {
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
@@ -471,12 +475,14 @@
 
 		#address-cells = <1>;
 		#size-cells = <0>;
+		#sound-dai-cells = <0>;
 
 		interrupt-parent = <&gpio6>;
 		interrupt-names = "intrq1", "intrq2";
 		interrupts = <30 IRQ_TYPE_LEVEL_LOW>,
 			     <31 IRQ_TYPE_LEVEL_LOW>;
-
+		clocks = <&rcar_sound 3>, <&audio_clk_c>;
+		clock-names = "clk-hdmi-video", "clk-hdmi-i2s-mclk";
 		port@7 {
 			reg = <7>;
 
@@ -512,6 +518,14 @@
 				remote-endpoint = <&csi20_in>;
 			};
 		};
+
+		port@c {
+			reg = <12>;
+
+			adv7482_i2s: endpoint {
+				/* remote-endpoint defined in the board file */
+			};
+		};
 	};
 
 	csa_vdd: adc@7c {
@@ -686,7 +700,8 @@
 	};
 
 	sound_pins: sound {
-		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
+		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a",
+			 "ssi4_data";
 		function = "ssi";
 	};
 
@@ -735,8 +750,8 @@
 	pinctrl-0 = <&sound_pins &sound_clk_pins>;
 	pinctrl-names = "default";
 
-	/* Single DAI */
-	#sound-dai-cells = <0>;
+	/* multi DAI */
+	#sound-dai-cells = <1>;
 
 	/* audio_clkout0/1/2/3 */
 	#clock-cells = <1>;
@@ -760,8 +775,18 @@
 		 <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
 		 <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
 		 <&audio_clk_a>, <&cs2000>,
-		 <&audio_clk_c>,
 		 <&cpg CPG_CORE CPG_AUDIO_CLK_I>;
+	clock-names = "ssi-all",
+		      "ssi.9", "ssi.8", "ssi.7", "ssi.6",
+		      "ssi.5", "ssi.4", "ssi.3", "ssi.2",
+		      "ssi.1", "ssi.0",
+		      "src.9", "src.8", "src.7", "src.6",
+		      "src.5", "src.4", "src.3", "src.2",
+		      "src.1", "src.0",
+		      "mix.1", "mix.0",
+		      "ctu.1", "ctu.0",
+		      "dvc.0", "dvc.1",
+		      "clk_a", "clk_b", "clk_i";
 
 	ports {
 		#address-cells = <1>;
-- 
2.24.1.508.g91d2dafee0
