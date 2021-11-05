Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E9A446455
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 14:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbhKENpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 09:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbhKENpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 09:45:34 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF358C061714;
        Fri,  5 Nov 2021 06:42:54 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id i79so10408626ioa.13;
        Fri, 05 Nov 2021 06:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ifcLTX2qc/APSfweGVmairfZtv2yLEXVOJe6R7tXqVw=;
        b=BunBD/agWpqx5V+LH0jIhcNYq3Vy5d6til/mcvoP3LZNmtNBz+RZJsBDUh/cNswxoS
         Wwoqy+MIQr0JohAumatCt5vybwfw3ESi8KtNvTLN59pMkBmhJV1mKOgbfIsG0tra0pTV
         ROoN1OsSP4dZjejG7Ss2qWQvaw4SAmXD5+axzM0sJ0aSJd+zJLKmF5O8eDQTTr3lo/8g
         zTrZkkWgkDds3Ua3YeKR/sILhRsBowWze8zMwS1Dppg7N6WLr+cumlcJVgfRAEdNuttF
         cWdulf0eAeoH9Octyo0OmhYGtUnzIgY3IpWCP9jFfyDbOe2LbwUaCjbcwlSkjpyvhkc6
         2j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ifcLTX2qc/APSfweGVmairfZtv2yLEXVOJe6R7tXqVw=;
        b=kfr0ImQux3fjYAt1MkQTdj2gmLtBZa8ULmPMmPPhZVe7hiFUyzWtFDv2AVOXOIbUqt
         K5DhoA1+/482e/8cgVuy/2CH/2Zq68Y2NJCmSU9enP++YZRXYwuxGVObGGn/+kC5DUbr
         LijlHyd7BuaQyzywge3FcwS6xmDNbeFrpcyCLxDB1OAv9MjYfjrLhzAyc2Hi7gk/6jLS
         qK0tgfC38VLwArICsOILZ+gZe6tRwNKI1f2VbDTymxj73a92H92GLWDNJW54uMkZNGxl
         iGMhUQRtjvu1AOq9HqHjEkAjcuGdMlNPY38PveL+VYWFbwPGOuVNNnCaw/c9bXMb788N
         hOeA==
X-Gm-Message-State: AOAM533iuOm61R5CIPcCAE+xlyxcAdYR8VV+T8ddsyuLrY6jSCjtXN3C
        dXoPM9ozPQLIKK9GpgN+YYI=
X-Google-Smtp-Source: ABdhPJzuN92BDBHAMq2ySGrKTMJBOBXkbBpQBXwDYvvlYfPASpgIUMxjvpDnRfxXy8joby7l+5CICw==
X-Received: by 2002:a5d:9492:: with SMTP id v18mr40717531ioj.158.1636119774299;
        Fri, 05 Nov 2021 06:42:54 -0700 (PDT)
Received: from aford-OptiPlex-7050.logicpd.com ([174.46.170.158])
        by smtp.gmail.com with ESMTPSA id j15sm4537909ile.65.2021.11.05.06.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:42:53 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     tharvey@gateworks.com, frieder.schrempf@kontron.de,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        aford@beaconembedded.com, cstevens@beaconembedded.com,
        Adam Ford <aford173@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: imx8mm: Add CSI nodes
Date:   Fri,  5 Nov 2021 08:42:25 -0500
Message-Id: <20211105134228.731331-2-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105134228.731331-1-aford173@gmail.com>
References: <20211105134228.731331-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a csi bridge and csis interface that tie together
to allow csi2 capture.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
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

