Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 619426E3F37
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 07:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjDQF43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 01:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjDQF41 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 01:56:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FF93ABC;
        Sun, 16 Apr 2023 22:56:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B458D75B;
        Mon, 17 Apr 2023 07:56:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681710979;
        bh=A0pqSyLLX9jis/SN/QQTfzVvsiwYC/53Gfr6G0hnR74=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ExCqVTSYLThQ7EV7b8wxMnZGfvVKyEMbUpbTvQhTSVpFqcmaGyf2PrB4+u6wKex/q
         ZYTszGbOt7Vwc0WLyI2n14UPR4KbLveJHtBYrCZQc70cNajnAqk+q/Fuxu5sCF+pgq
         b9cf8e0sBm3hUz+C2YLIHwu8q04EDIY80sEODH1M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Subject: [PATCH v1 2/2] arm64: dts: imx8mp: Add ISI DT node
Date:   Mon, 17 Apr 2023 08:56:27 +0300
Message-Id: <20230417055627.16482-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
References: <20230417055627.16482-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a DT node for the i.MX8MP ISI instance, and model to connection to
two CSI-2 receivers (CSIS).

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 2a374a4c14a2..cc7a938b6f73 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1239,6 +1239,38 @@ ldb_lvds_ch1: endpoint {
 				};
 			};
 
+			isi_0: isi@32e00000 {
+				compatible = "fsl,imx8mp-isi";
+				reg = <0x32e00000 0x4000>;
+				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MP_CLK_MEDIA_AXI_ROOT>,
+					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
+				clock-names = "axi", "apb";
+				fsl,blk-ctrl = <&media_blk_ctrl>;
+				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in_0: endpoint {
+							remote-endpoint = <&mipi_csi_0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						isi_in_1: endpoint {
+							remote-endpoint = <&mipi_csi_1_out>;
+						};
+					};
+				};
+			};
+
 			mipi_csi_0: csi@32e40000 {
 				compatible = "fsl,imx8mp-mipi-csi2", "fsl,imx8mm-mipi-csi2";
 				reg = <0x32e40000 0x10000>;
@@ -1265,6 +1297,9 @@ port@0 {
 
 					port@1 {
 						reg = <1>;
+						mipi_csi_0_out: endpoint {
+							remote-endpoint = <&isi_in_0>;
+						};
 					};
 				};
 			};
@@ -1295,6 +1330,9 @@ port@0 {
 
 					port@1 {
 						reg = <1>;
+						mipi_csi_1_out: endpoint {
+							remote-endpoint = <&isi_in_1>;
+						};
 					};
 				};
 			};
-- 
Regards,

Laurent Pinchart

