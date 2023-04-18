Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6465E6E6821
	for <lists+linux-media@lfdr.de>; Tue, 18 Apr 2023 17:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbjDRPbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Apr 2023 11:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjDRPbK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Apr 2023 11:31:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29292A257;
        Tue, 18 Apr 2023 08:30:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC3641180;
        Tue, 18 Apr 2023 17:30:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681831851;
        bh=gvSbhqiEe33I5YwWlNwSsmu6NgVK2S4eku3qjCfjL5Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kPlc785hlex0ttAbBWt/HzttyFBU48vYcMQ5uviw78ccVPWlSFJZ8bmgcNlYig787
         PgtgNN/rXDxPzFK9UC5WkV0lGA3oD8HgTyDBD0oAW1hVU1/TOISuRttgVrjDf6VbsY
         lzpwDabCXv5cQauc+7Uv/ULygXJufMAB7e1s8yV8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH v2 1/2] arm64: dts: imx8mp: Add CSIS DT nodes
Date:   Tue, 18 Apr 2023 18:31:03 +0300
Message-Id: <20230418153104.21337-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230418153104.21337-1-laurent.pinchart@ideasonboard.com>
References: <20230418153104.21337-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DT nodes for the two CSI-2 receivers of the i.MX8MP.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 2dd60e3252f3..2a374a4c14a2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1239,6 +1239,66 @@ ldb_lvds_ch1: endpoint {
 				};
 			};
 
+			mipi_csi_0: csi@32e40000 {
+				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
+				reg = <0x32e40000 0x10000>;
+				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <500000000>;
+				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_CAM1_PIX_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>;
+				clock-names = "pclk", "wrap", "phy", "axi";
+				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM1_PIX>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
+				assigned-clock-rates = <500000000>;
+				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
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
+					};
+				};
+			};
+
+			mipi_csi_1: csi@32e50000 {
+				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
+				reg = <0x32e50000 0x10000>;
+				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+				clock-frequency = <266000000>;
+				clocks = <&clk IMX8MP_CLK_MEDIA_APB_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_CAM2_PIX_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_MIPI_PHY1_REF_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>;
+				clock-names = "pclk", "wrap", "phy", "axi";
+				assigned-clocks = <&clk IMX8MP_CLK_MEDIA_CAM2_PIX>;
+				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
+				assigned-clock-rates = <266000000>;
+				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
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
+					};
+				};
+			};
+
 			pcie_phy: pcie-phy@32f00000 {
 				compatible = "fsl,imx8mp-pcie-phy";
 				reg = <0x32f00000 0x10000>;
-- 
Regards,

Laurent Pinchart

