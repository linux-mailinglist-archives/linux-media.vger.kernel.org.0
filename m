Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3B4024D7E8
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 17:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgHUPCq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Aug 2020 11:02:46 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:49089 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgHUPAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Aug 2020 11:00:39 -0400
Received: from lhopital-XPS-13-9360.home (lfbn-tou-1-1372-bdcst.w90-89.abo.wanadoo.fr [90.89.180.255])
        (Authenticated sender: kevin.lhopital@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPA id D42EF100011;
        Fri, 21 Aug 2020 15:00:35 +0000 (UTC)
From:   =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mripard@kernel.org, wens@csie.org, yong.deng@magewell.com,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        paul.kocialkowski@bootlin.com, thomas.petazzoni@bootlin.com,
        =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= 
        <kevin.lhopital@bootlin.com>
Subject: [PATCH 6/7] ARM: dts: sun8i: a83t: Add support for the MIPI CSI-2 in CSI node
Date:   Fri, 21 Aug 2020 16:59:34 +0200
Message-Id: <20200821145935.20346-7-kevin.lhopital@bootlin.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
References: <20200821145935.20346-1-kevin.lhopital@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add in the CSI device node the MIPI CSI2 clocks, interrupt and
increase the memory size in order to add the support of the
MIPI CSI-2 for A83T

Signed-off-by: Kévin L'hôpital <kevin.lhopital@bootlin.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 53c38deb8a08..5e6421eb8e28 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -1025,12 +1025,15 @@
 
 		csi: camera@1cb0000 {
 			compatible = "allwinner,sun8i-a83t-csi";
-			reg = <0x01cb0000 0x1000>;
-			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <0x01cb0000 0x2000>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CSI>,
 				 <&ccu CLK_CSI_SCLK>,
-				 <&ccu CLK_DRAM_CSI>;
-			clock-names = "bus", "mod", "ram";
+				 <&ccu CLK_DRAM_CSI>,
+				 <&ccu CLK_MIPI_CSI>,
+				 <&ccu CLK_CSI_MISC>;
+			clock-names = "bus", "mod", "ram", "mipi", "misc";
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
 
-- 
2.17.1

