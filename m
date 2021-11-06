Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41114446FD9
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 19:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbhKFSlQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 14:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhKFSlL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Nov 2021 14:41:11 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A04AC061208;
        Sat,  6 Nov 2021 11:38:30 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id i9so12840559ilu.8;
        Sat, 06 Nov 2021 11:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvL0Zqkz85LYHufmiL48sAs3q5REU5bqby89EtGa5w4=;
        b=dQkQ7I0h/Op484A/fxCcDEaFKI1EYy9YvNnHRQz7m5jY+d+nd6+HEMfWftsfGCRii2
         z+7JloOkv4G0TGEJMYeEDlf8/J+PzE059GS637NG1vDRvDAW/BiT4b/KJ39n20Yzw9xP
         ZZNARKwYM7LuxY2cXiHX5MNPph8SUhDbxUajDkBn73ZuK/qnTsL6omXF5eTQfCkJCPdX
         pLixK7CmOdpDGeW7ol2PVnV9Inaj+5mW3MAmh/vvslAzoUCfWX0tTKCwoaTmp/RBg29C
         OLtfjubdU5eCqBcFNXfx07fPWFrPLGogJzp6euxbkwOiYYdk3x+QnvEjEiB8j3pHcDG6
         rxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvL0Zqkz85LYHufmiL48sAs3q5REU5bqby89EtGa5w4=;
        b=K3NpnL2hPRch9yP9PsOf0dgfrWOI1WoWEWwtJZTUTQJYzNfxx7b2NFOLQNBiNSU1iR
         TkSYY7ntXnA6HheWoA8rT7RgMcsLi7IccOyoxyem4YzvH4DSYEzbm1zAfK916g3EUbhF
         cihUi7sJP23Gd7qEnk23fUolz+4QhDucIEnfXM5BnPtyrnNrdT2hfAdJjXbbOPFSbQPZ
         jOEhncRON23gP/LWde0ldDgFELi4VqJNbCxeSoNzdc7NReUrIwcZ4iR/Fco2D4xUg4zP
         B7gC4y8XUqXmxXdz+UYDEQsQL0RHPD65AnvRqrrAfcWidKJ25D33ZFz01eYXQ/l+Ya7X
         9YRw==
X-Gm-Message-State: AOAM530AAHUd0kaykkRlwKOZrEQPW9Qw6IGLtOdBxnsvHtvpfXwCmTMm
        ID1lhmQBU1HaTaGT7fNs9/8ZDY7KaZNoFw==
X-Google-Smtp-Source: ABdhPJzpnoPITzTG+mm95hC+TJyxENY8UqxQSr3DwH9LA8qNFBvVkGOuSJvfXac+Sgygj/rZMcJEEw==
X-Received: by 2002:a92:d908:: with SMTP id s8mr25362965iln.168.1636223909120;
        Sat, 06 Nov 2021 11:38:29 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id o10sm7174077ilu.49.2021.11.06.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 11:38:28 -0700 (PDT)
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
        linux-rockchip@lists.infradead.org (open list:HANTRO VPU CODEC DRIVER),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list),
        linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [RFC 2/5] arm64: dts: imx8mm:  Enable VPU-G1 and VPU-G2
Date:   Sat,  6 Nov 2021 13:37:58 -0500
Message-Id: <20211106183802.893285-3-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211106183802.893285-1-aford173@gmail.com>
References: <20211106183802.893285-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable two hardware Hantro decoders called G1 and G2.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 41 +++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 1f69c14d953f..725c3113831e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1248,6 +1248,47 @@ gpu_2d: gpu@38008000 {
 			power-domains = <&pgc_gpu>;
 		};
 
+		vpu_g1: video-codec@38300000 {
+			compatible = "nxp,imx8mm-vpu";
+			reg = <0x38300000 0x10000>;
+			reg-names = "g1";
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g1";
+			clocks = <&clk IMX8MM_CLK_VPU_G1_ROOT>,
+				 <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+			clock-names = "g1", "bus";
+			assigned-clocks = <&clk IMX8MM_CLK_VPU_G1>,
+					  <&clk IMX8MM_CLK_VPU_BUS>,
+					  <&clk IMX8MM_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
+						 <&clk IMX8MM_SYS_PLL1_800M>,
+						 <&clk IMX8MM_VPU_PLL>;
+			assigned-clock-rates = <600000000>,
+					       <800000000>,
+					       <0>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G1>;
+		};
+
+		vpu_g2: video-codec@38310000 {
+			compatible = "nxp,imx8mm-vpu-g2";
+			reg = <0x38310000 0x10000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g2";
+			clocks = <&clk IMX8MM_CLK_VPU_G2_ROOT>,
+				 <&clk IMX8MM_CLK_VPU_DEC_ROOT>;
+			clock-names = "g2",  "bus";
+			assigned-clocks = <&clk IMX8MM_CLK_VPU_G2>,
+					 <&clk IMX8MM_CLK_VPU_BUS>,
+					 <&clk IMX8MM_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MM_VPU_PLL_OUT>,
+						<&clk IMX8MM_SYS_PLL1_800M>,
+						<&clk IMX8MM_VPU_PLL>;
+			assigned-clock-rates = <600000000>,
+					       <800000000>,
+					       <0>;
+			power-domains = <&vpu_blk_ctrl IMX8MM_VPUBLK_PD_G2>;
+		};
+
 		vpu_blk_ctrl: blk-ctrl@38330000 {
 			compatible = "fsl,imx8mm-vpu-blk-ctrl", "syscon";
 			reg = <0x38330000 0x100>;
-- 
2.32.0

