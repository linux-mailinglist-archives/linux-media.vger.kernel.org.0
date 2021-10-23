Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A39438545
	for <lists+linux-media@lfdr.de>; Sat, 23 Oct 2021 22:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhJWUiC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Oct 2021 16:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhJWUiA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Oct 2021 16:38:00 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94F4C061714;
        Sat, 23 Oct 2021 13:35:40 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id h196so10131634iof.2;
        Sat, 23 Oct 2021 13:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ppg9ja7hrHSf7CKfWs4u1hP6s6Z/KSngdpkpwehFL0I=;
        b=Ref1K5KtSGGLL3OOVftfzPzVMoOA9uomKIPpuN12ZKwMqUWBH2VTtGq1PCyJ4CPjv8
         ZwGm5ZG8xuw858d066B6dlK9jalgpWqBcN8d8jBcHGTw7a8Vbp+3NdbuVqFrrpuEWgq9
         ZePw6ILqXPFZHvVxPqwhdwVnnODPrplTTILSeO09/hVE/t7lQiSES64yvmkcOfzxrqtw
         CQ/t/CStxGcdntm8ymRmE89Q6QU7bwZuWw6R9pEHg7vW1G+xYfK2NrW8IA0MHcXypJou
         ZrgdbvD30IwyZkiHUXOkhT1nQKkT/2abFteUPzgm5ViX0eTMFlM4j7IL/9kD6gg8XTOP
         aroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ppg9ja7hrHSf7CKfWs4u1hP6s6Z/KSngdpkpwehFL0I=;
        b=5fRZ2B5FmQsnqiulOMJ6fagAJLj/m92NmhA2uK2MzvwFSG0VhvLIXmU/55HOTd5rIZ
         mN7tuRxbmO2ZsjHT1+U9yKbTgAjEFFlJR1GogvKszHU+5bxwTbXDV04So08KGel9xpH9
         p4rHGRwjfmtv7sYfDhzLTqnngCG2nNOMudMT777OuyNP1Qq670UT2NciSMjb2wUT4UEv
         FvMSGr2TEpa0GMKeEbRsspnsiO5954Mf6twaP08IwEbXiWQDKRhLuGbSj8I9Ml7Edwb9
         8xH0UhpafrCBmCZOd+RPg53KaXHg10A8kUO6MxnUtRrTATtKyWfI9IPNL+f4j7jaLNAF
         P18A==
X-Gm-Message-State: AOAM531g1JOjfppgoQC3zdyU5VfSi91IKxz4NTTX9rYp6IESVfd6xpO4
        Wyf0N1SCLB/tvgzizi3AlIY=
X-Google-Smtp-Source: ABdhPJyW8UR+vij9AkeWzvmB6TdgMUeqcv4kEYYT1oS1vYYrwdBezm+1RlhSUosF2bN+hGdw1RWOoA==
X-Received: by 2002:a05:6602:483:: with SMTP id y3mr4902695iov.210.1635021340095;
        Sat, 23 Oct 2021 13:35:40 -0700 (PDT)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:1534:f270:7127:bc0a])
        by smtp.gmail.com with ESMTPSA id i5sm6128678ilj.49.2021.10.23.13.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:35:39 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        cstevens@beaconembedded.com, aford@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC V2 1/5] arm64: dts: imx8mm: Add CSI nodes
Date:   Sat, 23 Oct 2021 15:34:52 -0500
Message-Id: <20211023203457.1217821-2-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211023203457.1217821-1-aford173@gmail.com>
References: <20211023203457.1217821-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a csi bridge and csis interface that tie together
to allow csi2 capture.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 55 +++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index c2f3f118f82e..920f9041ef50 100644
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
@@ -1095,6 +1111,45 @@ disp_blk_ctrl: blk-ctrl@32e28000 {
 				#power-domain-cells = <1>;
 			};
 
+			mipi_csi2: mipi-csi@32e30000 {
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
+
+						imx8mm_mipi_csi_in: endpoint {
+						};
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
+
 			usbotg1: usb@32e40000 {
 				compatible = "fsl,imx8mm-usb", "fsl,imx7d-usb";
 				reg = <0x32e40000 0x200>;
-- 
2.25.1

