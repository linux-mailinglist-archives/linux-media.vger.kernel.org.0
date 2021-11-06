Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7FA446EC5
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 16:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbhKFP5b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 11:57:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbhKFP5a (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Nov 2021 11:57:30 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3465C061570;
        Sat,  6 Nov 2021 08:54:48 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id c3so720600iob.6;
        Sat, 06 Nov 2021 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xlbEuMkmcRjubQYNuPiav4PNtAAXrSUF3zgeRzk/Gy8=;
        b=fc/kMKxMM3Jrkdr0S9iYURs3Tod1RIp02N5vNEyqxSYh1RneaoEEV3P2SJe/HKSJil
         KJipsjIC6PtO4FO0JJ9qBfXbDBnJG7r+jglc1EYuvgGdh2F3+0j4jEkCgToaPpBevTZs
         Ng0VcRNuP1ST181ufAze3evtCJMfMhM5Ol3pNKpLxdqHbopyr1IZxSq9I5EqLOxap3K2
         Xe+X984B7V6mw2vJydW7ld6oHPWa9olRk6GMAa4MHNxzvCZ1M8Tdgrbe3cvRPWEZtWCC
         0PgDjJlBFrgOSRKFan6cTehdQqQF7zIfDlXFI2woRjNdN+9lsdLUPXCIQmrixiy9ic1E
         9HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xlbEuMkmcRjubQYNuPiav4PNtAAXrSUF3zgeRzk/Gy8=;
        b=LUE5K7afnboaxKizFjcrdiGeCyC2UZsxLnfcTknrR3uqpJs6eDAGEXppL+rwZ3KbYE
         RpQNmY5zd2dgeZDYMVn3sWSn/AP6hEof5xeR51y+4cMAJPGkkZx3LH5i7Q1JNIT4Ellq
         lUaA0ZTLU77Hki6NxbY/qru6HRBwwXZUxs4uL/Spv3y7LB1qULO1FABCHgTZLil6KTW3
         GNnz8huaw/xeHZ8FpNJeu3aYkWvwNO95YRaTxVebAatvecJfX0xJdYGqVUJvTWLgYPcv
         LD/fDbyJehHLevXSNWsk1Z69ODENh3cWVVour8fbVmO9riwG2XVy4jH0hKCFJFWlw1EO
         wtTA==
X-Gm-Message-State: AOAM531dE0JGo/e3pm1HLE9iIVydktmRlvkDCByWgEQTo4Vu7iiQ0due
        yRs8986AKVigNb1aaS6YYSo=
X-Google-Smtp-Source: ABdhPJyeMLhlNCeFZ4dvYT/Yc2Ab+v62itqCY4n1vu2RjVpDay9V89bezkrsCwBb4h4GKVdp8B5uVQ==
X-Received: by 2002:a05:6602:3419:: with SMTP id n25mr3796778ioz.57.1636214087972;
        Sat, 06 Nov 2021 08:54:47 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:64ba:1c0f:6d36:c11d])
        by smtp.gmail.com with ESMTPSA id d2sm5718313ilg.77.2021.11.06.08.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 08:54:47 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        jagan@amarulasolutions.com, Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/5] arm64: dts: imx8mm: Add CSI nodes
Date:   Sat,  6 Nov 2021 10:54:24 -0500
Message-Id: <20211106155427.753197-2-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211106155427.753197-1-aford173@gmail.com>
References: <20211106155427.753197-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a csi bridge and csis interface that tie together
to allow csi2 capture.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-By: Tim Harvey <tharvey@gateworks.com>
Tested-By: Tim Harvey <tharvey@gateworks.com>
---
V2:  No change

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 51 +++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index c2f3f118f82e..1f69c14d953f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1068,6 +1068,22 @@ aips4: bus@32c00000 {
 			#size-cells = <1>;
 			ranges = <0x32c00000 0x32c00000 0x400000>;
 
+			csi: csi@32e20000 {
+				compatible = "fsl,imx8mm-csi", "fsl,imx7-csi";
+				reg = <0x32e20000 0x1000>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MM_CLK_CSI1_ROOT>;
+				clock-names = "mclk";
+				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_CSI_BRIDGE>;
+				status = "disabled";
+
+				port {
+					csi_in: endpoint {
+						remote-endpoint = <&imx8mm_mipi_csi_out>;
+					};
+				};
+			};
+
 			disp_blk_ctrl: blk-ctrl@32e28000 {
 				compatible = "fsl,imx8mm-disp-blk-ctrl", "syscon";
 				reg = <0x32e28000 0x100>;
@@ -1095,6 +1111,41 @@ disp_blk_ctrl: blk-ctrl@32e28000 {
 				#power-domain-cells = <1>;
 			};
 
+			mipi_csi: mipi-csi@32e30000 {
+				compatible = "fsl,imx8mm-mipi-csi2";
+				reg = <0x32e30000 0x1000>;
+				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&clk IMX8MM_CLK_CSI1_CORE>,
+						  <&clk IMX8MM_CLK_CSI1_PHY_REF>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_1000M>,
+							  <&clk IMX8MM_SYS_PLL2_1000M>;
+				clock-frequency = <333000000>;
+				clocks = <&clk IMX8MM_CLK_DISP_APB_ROOT>,
+					 <&clk IMX8MM_CLK_CSI1_ROOT>,
+					 <&clk IMX8MM_CLK_CSI1_PHY_REF>,
+					 <&clk IMX8MM_CLK_DISP_AXI_ROOT>;
+				clock-names = "pclk", "wrap", "phy", "axi";
+				power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_CSI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						imx8mm_mipi_csi_out: endpoint {
+							remote-endpoint = <&csi_in>;
+						};
+					};
+				};
+			};
+
 			usbotg1: usb@32e40000 {
 				compatible = "fsl,imx8mm-usb", "fsl,imx7d-usb";
 				reg = <0x32e40000 0x200>;
-- 
2.32.0

