Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99CB44E8D1
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 15:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235267AbhKLOb5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 09:31:57 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:55306 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235168AbhKLOb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 09:31:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1636727345; x=1668263345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nXqhUGuG2yrgEQ8edstsL2bdF6hTrq7gH6tdS8TOszI=;
  b=fSrJIdlOPvdzKDPcopwqm4YPDvQM0vTLv0jo/rdmzBD1WVBQ1++1wi//
   g0Ndw17p1NpH1Djh4ZWiiZ56/N0UqJtv84898BZDy/V/SF22dp/3LHRKv
   SJp7F+Xv5uW9uKHjiFdumPZWMQXw/krAjDV2nVdpHyEFVkpdkyJGoHR5G
   YaTH13NmATz0n/y+XtR8Hlb2/WxN7sm0lLhghEkR/+CO07wJs/xPsTIhh
   JCPHjBMBX7grCu1OON+Z6bzOmYF4K3bsrNBl4AHZ2Sj+JmO03QerD5+Xp
   +ke7IaWU07ZgNexbg/Zga+cp2rBHtAopIxIeUtgIbgh+ufc2DSNJ9fDiU
   w==;
IronPort-SDR: xwMLfu6u58/Sccl53fYMMuwT08FWkQeEWlcnHLmn2EJROlBjEqxyTfgs0X7rWyECWdKWQAy2I4
 PWWm5WnQQMMgC240DtxR2FWPBnegY0SbbHUAdFgyD/OnG0586dsJ/jFMFvgdkBNizLC4QAwFz+
 gIi71ma4fbWqSP3AUDPTwSwlAlzStLeOW56LxSNCycyETfXc+BK+X3iWBToVCALXkkxxcf+Lwx
 RJUFgkGIB1Vn1z0v5+v+LobWSFdrHBclRDuyeZmrr3UnHv6uXSe10dEE6x//dNX1rzznltlza1
 JB+vajA6U3RFn0SChL2STHFc
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; 
   d="scan'208";a="136388065"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Nov 2021 07:29:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 12 Nov 2021 07:29:04 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 12 Nov 2021 07:28:51 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jacopo@jmondi.org>,
        <laurent.pinchart@ideasonboard.com>, <sakari.ailus@iki.fi>,
        <nicolas.ferre@microchip.com>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2 15/25] ARM: dts: at91: sama7g5: add nodes for video capture
Date:   Fri, 12 Nov 2021 16:24:59 +0200
Message-ID: <20211112142509.2230884-16-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112142509.2230884-1-eugen.hristev@microchip.com>
References: <20211112142509.2230884-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add node for the XISC (eXtended Image Sensor Controller) and CSI2DC
(csi2 demux controller).
These nodes represent the top level of the video capture hardware pipeline
and are directly connected in hardware.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 arch/arm/boot/dts/sama7g5.dtsi | 49 ++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/sama7g5.dtsi b/arch/arm/boot/dts/sama7g5.dtsi
index 7039311bf678..a2323f55de0c 100644
--- a/arch/arm/boot/dts/sama7g5.dtsi
+++ b/arch/arm/boot/dts/sama7g5.dtsi
@@ -236,6 +236,55 @@ sdmmc2: mmc@e120c000 {
 			status = "disabled";
 		};
 
+		csi2dc: csi2dc@e1404000 {
+			compatible = "microchip,sama7g5-csi2dc";
+			reg = <0xe1404000 0x500>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 34>, <&xisc>;
+			clock-names = "pclk", "scck";
+			assigned-clocks = <&xisc>;
+			assigned-clock-rates = <266000000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					csi2dc_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					csi2dc_out: endpoint {
+						bus-width = <12>;
+						hsync-active = <1>;
+						vsync-active = <1>;
+						remote-endpoint = <&xisc_in>;
+					};
+				};
+			};
+		};
+
+		xisc: xisc@e1408000 {
+			compatible = "microchip,sama7g5-isc";
+			reg = <0xe1408000 0x2000>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 56>;
+			clock-names = "hclock";
+			#clock-cells = <0>;
+			clock-output-names = "isc-mck";
+
+			port {
+				xisc_in: endpoint {
+					bus-type = <5>; /* Parallel */
+					bus-width = <12>;
+					hsync-active = <1>;
+					vsync-active = <1>;
+					remote-endpoint = <&csi2dc_out>;
+				};
+			};
+		};
+
 		pwm: pwm@e1604000 {
 			compatible = "microchip,sama7g5-pwm", "atmel,sama5d2-pwm";
 			reg = <0xe1604000 0x4000>;
-- 
2.25.1

