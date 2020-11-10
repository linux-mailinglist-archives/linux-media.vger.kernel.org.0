Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF142ADD25
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 18:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbgKJRkz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 12:40:55 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:49245 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730504AbgKJRkz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 12:40:55 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2C7CEFF807;
        Tue, 10 Nov 2020 17:40:50 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, nsaenzjulienne@suse.de,
        mchehab+huawei@kernel.org
Subject: [PATCH v4 4/5] ARM: dts: bcm2711: Add Unicam DT nodes
Date:   Tue, 10 Nov 2020 18:40:35 +0100
Message-Id: <20201110174036.220883-5-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201110174036.220883-1-jacopo@jmondi.org>
References: <20201110174036.220883-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The Unicam IP cores are CSI-2/CCP2 receivers. They are part of VC4, but
can be controlled directly from the operating system without going
through the VPU firmware. Exposes them as DT nodes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 arch/arm/boot/dts/bcm2711.dtsi | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 4847dd305317a..68ac76e7c772d 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -2,6 +2,7 @@
 #include "bcm283x.dtsi"
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/raspberrypi-power.h>
 #include <dt-bindings/soc/bcm2835-pm.h>
 
 / {
@@ -293,6 +294,46 @@ hvs: hvs@7e400000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		csi0: csi@7e800000 {
+			compatible = "brcm,bcm2835-unicam";
+			reg = <0x7e800000 0x800>,
+			      <0x7e802000 0x4>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clocks BCM2835_CLOCK_CAM0>,
+				 <&firmware_clocks 4>;
+			clock-names = "lp", "vpu";
+			power-domains = <&power RPI_POWER_DOMAIN_UNICAM0>;
+			brcm,num-data-lanes = <2>;
+			#clock-cells = <1>;
+			status = "disabled";
+
+			port {
+				endpoint {
+					data-lanes = <1 2>;
+				};
+			};
+		};
+
+		csi1: csi@7e801000 {
+			compatible = "brcm,bcm2835-unicam";
+			reg = <0x7e801000 0x800>,
+			      <0x7e802004 0x4>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clocks BCM2835_CLOCK_CAM1>,
+				 <&firmware_clocks 4>;
+			clock-names = "lp", "vpu";
+			power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
+			brcm,num-data-lanes = <4>;
+			#clock-cells = <1>;
+			status = "disabled";
+
+			port {
+				endpoint {
+					data-lanes = <1 2 3 4>;
+				};
+			};
+		};
+
 		pixelvalve3: pixelvalve@7ec12000 {
 			compatible = "brcm,bcm2711-pixelvalve3";
 			reg = <0x7ec12000 0x100>;
-- 
2.29.1

