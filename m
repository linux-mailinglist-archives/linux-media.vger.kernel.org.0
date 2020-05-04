Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7561C358E
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbgEDJ0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:30 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728335AbgEDJ03 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 05:26:29 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B68D304;
        Mon,  4 May 2020 11:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584387;
        bh=RKPAmP7XWHNpx3GJUpasLkGICwp8lvQ7BhqDmWnWedw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rreg+TFq33wtlSn4DpZBUxKz8//9qkaGSfpwSf/Cz8ZkbeWqMNMqMi9MA5UGuKm16
         6GyTHry4F0jqCFC3DwuC1FLCfeINCcUt8v7bUxSxFkGUnfE+hT9jiuINbfIU/CpOp0
         BV6UWo9Mfmqhgq3sqa6FpNUR26g6+oc1Mi0NmGBM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 05/34] ARM: dts: bcm2711: Add Unicam DT nodes
Date:   Mon,  4 May 2020 12:25:42 +0300
Message-Id: <20200504092611.9798-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Unicam IP cores are CSI-2/CCP2 receivers. They are part of VC4, but
can be controlled directly from the operating system without going
through the VPU firmware. Exposes them as DT nodes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/bcm2711.dtsi | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index a91cf68e3c4c..0a4d75a64e7c 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -2,6 +2,7 @@
 #include "bcm283x.dtsi"
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/raspberrypi-power.h>
 #include <dt-bindings/soc/bcm2835-pm.h>
 
 / {
@@ -244,6 +245,48 @@ pwm1: pwm@7e20c800 {
 		hvs@7e400000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		csi0: csi@7e800000 {
+			compatible = "brcm,bcm2835-unicam";
+			reg = <0x7e800000 0x800>,
+			      <0x7e802000 0x4>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clocks BCM2835_CLOCK_CAM0>;
+			clock-names = "lp";
+			power-domains = <&power RPI_POWER_DOMAIN_UNICAM0>;
+			brcm,num-data-lanes = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+			clocks = <&clocks BCM2835_CLOCK_CAM1>;
+			clock-names = "lp";
+			power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
+			brcm,num-data-lanes = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+
+			port {
+				endpoint {
+					data-lanes = <1 2 3 4>;
+				};
+			};
+		};
 	};
 
 	/*
-- 
Regards,

Laurent Pinchart

