Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B197845DE56
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 17:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356443AbhKYQM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 11:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356395AbhKYQKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 11:10:55 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03818C0619E2;
        Thu, 25 Nov 2021 07:56:57 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:2581:f820:804e:edb9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5E6B11F464B7;
        Thu, 25 Nov 2021 15:56:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637855815; bh=WqSalgiIBPgG1EC3Dnqh7PKghzbepDs0AA3GgIyxUxw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hgc654dIc/doptW6M+E79rDcC86pEWBA/xIxWiu7YxW7ArqhMOm4+/LPL/qwNsSDs
         Mw+gCAf+vEU2bbEURbDqDeTyQl84GkuFuAWR5Vplfy7knkNo/ddlWX8QQEO2X3aSFI
         9MICWpketUq6LoM3HXmwKlY3pCQ8My5FMySjlOoSMTquQ4z7MwTUsjoZZ3JUUDOIJr
         jDtxVF6uK5CEl5JxEDm9jXfPtkDwzkBKV2ffd9HJKXrcxMtF2Ex1g5UYb+8oASiOkq
         oPfsqStQefGbZtpWD/MB1BOCJCBcmpmG+XSb69EFFMhOlSzQXlUpxlsQHzAPTnkHfO
         l4/dbGkVT1dhw==
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, ezequiel@vanguardiasur.com.ar,
        p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-staging@lists.linux.dev, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 4/4] arm64: dts: imx8mq: Add node to G2 hardware
Date:   Thu, 25 Nov 2021 16:56:50 +0100
Message-Id: <20211125155650.630977-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125155650.630977-1-benjamin.gaignard@collabora.com>
References: <20211125155650.630977-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Split the VPU node in two: one for G1 and one for G2 since they are
different hardware blocks.
Add syscon for the hardware control block.
Remove the reg-names property that is useless.
Each VPU node only needs one interrupt.
Change G2 assigned clock to match the specification.
In both nodes all the clocks need to be assigned to make
sure that the control block will be correctly clocked even if
only one device node is enabled.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Please note that the only purpose of this commit is to allow to test
G2 hardware block for IMX8MQ until a proper solution isuing power domain
can be found. Do not merge it.
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 43 ++++++++++++++++++-----
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 972766b67a15..89d46b1e6aae 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1432,15 +1432,16 @@ usb3_phy1: usb-phy@382f0040 {
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
@@ -1453,9 +1454,33 @@ vpu: video-codec@38300000 {
 						 <&clk IMX8MQ_VPU_PLL_OUT>,
 						 <&clk IMX8MQ_SYS1_PLL_800M>,
 						 <&clk IMX8MQ_VPU_PLL>;
-			assigned-clock-rates = <600000000>, <600000000>,
+			assigned-clock-rates = <600000000>, <300000000>,
+					       <800000000>, <0>;
+			power-domains = <&pgc_vpu>;
+			nxp,imx8m-vpu-ctrl = <&vpu_ctrl>;
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
+			nxp,imx8m-vpu-ctrl = <&vpu_ctrl>;
 		};
 
 		pcie0: pcie@33800000 {
-- 
2.30.2

