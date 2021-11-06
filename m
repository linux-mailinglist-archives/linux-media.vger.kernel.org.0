Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B28446FE2
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 19:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhKFSlW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 14:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234823AbhKFSlU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Nov 2021 14:41:20 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F36C061746;
        Sat,  6 Nov 2021 11:38:39 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id k22so1140166iol.13;
        Sat, 06 Nov 2021 11:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=udKl62y2x/Oh2cW97C2eKZ5L1gu+lpGXEnEESf3ayO4=;
        b=fF8BuidW/FPcrJ2yf9wm3QJp4AL8b8rBt6CifE+v2//RxyWSJ0hVD/OyKAhAsI5g/z
         hNJAwWjZen9DblNTkvtAI4ExLnad4GRPXUULPZzZHurrnwyg+MPopwjt0IhcnDhrLcYh
         +Nr14SsC38b+nmVhUfrkeJi5pCMxSJhnhSXgOTYBaCGJ/hWFuVdcmKFApFelUfu7fhbS
         osvVDZ2rbFtFgQUcnuso2Ba/OcqSDAw3vt5ahC66vP5km3HC0vuMbSaC9M6oRB5M6qMe
         Q6ZvkqvIVDBS69JJIxBC54fXdis+xwlSM5FzxFZ/Rn+dptLc3ax9jjvGgliZ3tSN1Ytv
         BZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=udKl62y2x/Oh2cW97C2eKZ5L1gu+lpGXEnEESf3ayO4=;
        b=IyxEw0Nk4HSlDcA4umBNcEpwYjOJXszJb3AuHUswOb474QXKOcQkzks0oktrsYBn/F
         jjmxig6sSxwGEAzNccSW4nTn3WLd3kdg/HyCERacMgLpNsQpZWTbjvCpWx3g8ggxSPbC
         9IS4jTX2NmkbnGHv6CDRF6990wQuoukgAmGSN5cDqcbWMsTQmvue38T4BBzimw3D2GnE
         kucQSPXM7CfBs96x+c2k+8AFMBgL+9DK/qZqz7UQ1AX8fX+CSkekloHvck2xSRgA4DRX
         rQWTNAVyh2dpTZaiLz6qFS/M29NRHmd9KnVt+CQN6cj5pIiYS2E5qpYWeSvdUovwn2gG
         Wmiw==
X-Gm-Message-State: AOAM533B0hvkyBwb2jgPGL0dPP2q0pUsCocOM9cvQqPiHC82QXJD3qun
        j3/9TGaJhlgOxHJq903RNLd0CRpB917cKQ==
X-Google-Smtp-Source: ABdhPJzi/tEgr5ILGu/G4uh+io+CaFv2TdlL4qlt4DJ0TsFdO3pDfvEw1qfgLCdAoScQ2u7hufdjBA==
X-Received: by 2002:a05:6602:2cce:: with SMTP id j14mr5024039iow.23.1636223918087;
        Sat, 06 Nov 2021 11:38:38 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id o10sm7174077ilu.49.2021.11.06.11.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:38:36 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        marek.vasut@gmail.com, jagan@amarulasolutions.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        linux-rockchip@lists.infradead.org (open list:HANTRO VPU CODEC DRIVER),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list),
        linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [RFC 5/5] arm64: dts: imx8mm:  Enable Hantro H1 Encoder
Date:   Sat,  6 Nov 2021 13:38:01 -0500
Message-Id: <20211106183802.893285-6-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211106183802.893285-1-aford173@gmail.com>
References: <20211106183802.893285-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8M Mini has a Hantro H1 video encoder which appears
as a media device.

Media device information
------------------------
driver          hantro-vpu
model           hantro-vpu
serial
bus info        platform: hantro-vpu
hw revision     0x0
driver version  5.15.0

Device topology
- entity 1: nxp,imx8mm-vpu-h1-enc-source (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video3
	pad0: Source
		-> "nxp,imx8mm-vpu-h1-enc-proc":0 [ENABLED,IMMUTABLE]

- entity 3: nxp,imx8mm-vpu-h1-enc-proc (2 pads, 2 links)
            type Node subtype Unknown flags 0
	pad0: Sink
		<- "nxp,imx8mm-vpu-h1-enc-source":0 [ENABLED,IMMUTABLE]
	pad1: Source
		-> "nxp,imx8mm-vpu-h1-enc-sink":0 [ENABLED,IMMUTABLE]

- entity 6: nxp,imx8mm-vpu-h1-enc-sink (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video3
	pad0: Sink
		<- "nxp,imx8mm-vpu-h1-enc-proc":1 [ENABLED,IMMUTABLE]

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 725c3113831e..b4c204cbced8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1289,6 +1289,26 @@ vpu_g2: video-codec@38310000 {
 			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
 		};
 
+		vpu_h1: video-codec@38320000 {
+			compatible = "nxp,imx8mm-vpu-h1";
+			reg = <0x38320000 0x10000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "h1";
+			clocks = <&clk IMX8MM_CLK_VPU_H1_ROOT>,
+				 <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+			clock-names = "h1",  "bus";
+			assigned-clocks = <&clk IMX8MM_CLK_VPU_H1>,
+					 <&clk IMX8MM_CLK_VPU_BUS>,
+					 <&clk IMX8MM_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
+						<&clk IMX8MM_SYS_PLL1_800M>,
+						<&clk IMX8MM_VPU_PLL>;
+			assigned-clock-rates = <600000000>,
+					       <800000000>,
+					       <0>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_H1>;
+		};
+
 		vpu_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mm-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
-- 
2.32.0

