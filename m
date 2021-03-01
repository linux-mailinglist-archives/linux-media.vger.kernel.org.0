Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCC3328249
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 16:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237044AbhCAPTt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 10:19:49 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60498 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237043AbhCAPTi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 10:19:38 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:39a1:f0e7:a696:18c8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8622D1F44E76;
        Mon,  1 Mar 2021 15:18:10 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     p.zabel@pengutronix.de, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com, ezequiel@collabora.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, benjamin.gaignard@collabora.com
Subject: [PATCH v3 5/5] arm64: dts: imx8mq: Use reset driver for VPU hardware block
Date:   Mon,  1 Mar 2021 16:17:54 +0100
Message-Id: <20210301151754.104749-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
References: <20210301151754.104749-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a vpu reset hardware block node.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 31 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index a841a023e8e0..d9d9efc8592d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/imx8mq-clock.h>
 #include <dt-bindings/power/imx8mq-power.h>
 #include <dt-bindings/reset/imx8mq-reset.h>
+#include <dt-bindings/reset/imx8mq-vpu-reset.h>
 #include <dt-bindings/gpio/gpio.h>
 #include "dt-bindings/input/input.h"
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -1267,19 +1268,36 @@ usb3_phy1: usb-phy@382f0040 {
 			status = "disabled";
 		};
 
+		vpu_reset: vpu-reset@38320000 {
+			compatible = "fsl,imx8mq-vpu-reset", "syscon";
+			reg = <0x38320000 0x10000>;
+			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
+				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
+					  <&clk IMX8MQ_CLK_VPU_G2>,
+					  <&clk IMX8MQ_CLK_VPU_BUS>,
+					  <&clk IMX8MQ_VPU_PLL_BYPASS>;
+			assigned-clock-parents = <&clk IMX8MQ_VPU_PLL_OUT>,
+						 <&clk IMX8MQ_VPU_PLL_OUT>,
+						 <&clk IMX8MQ_SYS1_PLL_800M>,
+						 <&clk IMX8MQ_VPU_PLL>;
+			assigned-clock-rates = <600000000>, <300000000>,
+					       <800000000>, <0>;
+			#reset-cells = <1>;
+		};
+
 		vpu: video-codec@38300000 {
 			compatible = "nxp,imx8mq-vpu";
 			reg = <0x38300000 0x10000>,
-			      <0x38310000 0x10000>,
-			      <0x38320000 0x10000>;
-			reg-names = "g1", "g2", "ctrl";
+			      <0x38310000 0x10000>;
+			reg-names = "g1", "g2";
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "g1", "g2";
 			clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
-				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
-				 <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
-			clock-names = "g1", "g2", "bus";
+				 <&clk IMX8MQ_CLK_VPU_G2_ROOT>;
+			clock-names = "g1", "g2";
 			assigned-clocks = <&clk IMX8MQ_CLK_VPU_G1>,
 					  <&clk IMX8MQ_CLK_VPU_G2>,
 					  <&clk IMX8MQ_CLK_VPU_BUS>,
@@ -1290,6 +1308,7 @@ vpu: video-codec@38300000 {
 						 <&clk IMX8MQ_VPU_PLL>;
 			assigned-clock-rates = <600000000>, <600000000>,
 					       <800000000>, <0>;
+			resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G1>;
 			power-domains = <&pgc_vpu>;
 		};
 
-- 
2.25.1

