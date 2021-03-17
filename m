Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7FE33F70C
	for <lists+linux-media@lfdr.de>; Wed, 17 Mar 2021 18:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbhCQRdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Mar 2021 13:33:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58874 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhCQRdC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Mar 2021 13:33:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: benjamin.gaignard)
        with ESMTPSA id 650751F45471
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, hverkuil-cisco@xs4all.nl,
        emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 13/13] arm64: dts: imx8mq: Add node to G2 hardware
Date:   Wed, 17 Mar 2021 18:32:02 +0100
Message-Id: <20210317173202.107519-14-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317173202.107519-1-benjamin.gaignard@collabora.com>
References: <20210317173202.107519-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Split VPU node in two: one for G1 and one for G2 since they are
different hardware blocks.
Add syscon for hardware control block.
Remove reg-names property that is useless.
Each VPU node only need one interrupt.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 5:
 - use syscon instead of VPU reset
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 43 ++++++++++++++++++-----
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 17c449e12c2e..b537d153ebbd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1329,15 +1329,16 @@ usb3_phy1: usb-phy@382f0040 {
 			status = "disabled";
 		};
 
-		vpu: video-codec@38300000 {
+		vpu_ctrl: syscon@38320000 {
+			compatible = "nxp,imx8mq-vpu-ctrl", "syscon";
+			reg = <0x38320000 0x10000>;
+		};
+
+		vpu_g1: video-codec@38300000 {
 			compatible = "nxp,imx8mq-vpu";
-			reg = <0x38300000 0x10000>,
-			      <0x38310000 0x10000>,
-			      <0x38320000 0x10000>;
-			reg-names = "g1", "g2", "ctrl";
-			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "g1", "g2";
+			reg = <0x38300000 0x10000>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g1";
 			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
 				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
@@ -1350,9 +1351,33 @@ vpu: video-codec@38300000 {
 						 <&clk IMX8MQ_VPU_PLL_OUT>,
 						 <&clk IMX8MQ_SYS1_PLL_800M>,
 						 <&clk IMX8MQ_VPU_PLL>;
-			assigned-clock-rates = <600000000>, <600000000>,
+			assigned-clock-rates = <600000000>, <300000000>,
+					       <800000000>, <0>;
+			power-domains = <&pgc_vpu>;
+			nxp,imx8mq-vpu-ctrl = <&vpu_ctrl>;
+		};
+
+		vpu_g2: video-codec@38310000 {
+			compatible = "nxp,imx8mq-vpu-g2";
+			reg = <0x38310000 0x10000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g2";
+			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
+				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+			clock-names = "g1", "g2",  "bus";
+			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
+					  <&clk IMX8MQ_CLK_VPU_G2>,
+					  <&clk IMX8MQ_CLK_VPU_BUS>,
+					  <&clk IMX8MQ_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
+						 <&clk IMX8MQ_VPU_PLL_OUT>,
+						 <&clk IMX8MQ_SYS1_PLL_800M>,
+						 <&clk IMX8MQ_VPU_PLL>;
+			assigned-clock-rates = <600000000>, <300000000>,
 					       <800000000>, <0>;
 			power-domains = <&pgc_vpu>;
+			nxp,imx8mq-vpu-ctrl = <&vpu_ctrl>;
 		};
 
 		pcie0: pcie@33800000 {
-- 
2.25.1

