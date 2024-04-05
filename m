Return-Path: <linux-media+bounces-8781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDE289A503
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 21:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 228C61F21F18
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 19:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E831173343;
	Fri,  5 Apr 2024 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K1XUTqig"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCD8172BC4;
	Fri,  5 Apr 2024 19:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712345648; cv=none; b=ZR84Woao0GPF+e7xaiNB+Vzjf0qzGlRRya1sm1Z+l0X8RInHg5SqVEVyZgJoo+0za8LYOCSPKaAEleW3puukUQobvvmfWqZ0LvhwOaGvAHiH7uZmXNb65uHIwSS8lxAKE0UIlhIGMZyF0is/JTU8p3YS6ZiaVrphs6tE/7XmmBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712345648; c=relaxed/simple;
	bh=Xy6PMb0DzidrhaAriE7z1I98IIIOfbHE55qePyomcZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EsUqR74fZcEPhqxzjAxeG/1M6hw71DVx6yKsOwC9irD/EZ7DdIs6yUzvmJs0DCS/T+k+LZJHK2C+tblpbSZiMkOyyRauRaOydd2oNMcM2ox5SBmzANeCUsPaLZrcFuJ27Z1CfreYoFw6DDYgcC7mOiZzL279xHTeSKhqoT0Yf14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K1XUTqig; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB680FD6;
	Fri,  5 Apr 2024 21:33:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712345603;
	bh=Xy6PMb0DzidrhaAriE7z1I98IIIOfbHE55qePyomcZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K1XUTqigSidH5U1SuY/JZAS5U3H6kemflBAY8UpOtoBwCqzfYdvvDiR/pY2s/ocYF
	 1EaG5WPoPUZo7WhAhaKlFZqIfPLOVDz5oWHczDhJrhSN28d3qBLYFZSEJ9yzzVuJEi
	 pKYir38jm4K42UTe5WrhqNSD0AWYd6SxaWViG73M=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v10 5/5] ARM: dts: bcm2835: Add Unicam CSI nodes
Date: Fri,  5 Apr 2024 22:33:43 +0300
Message-ID: <20240405193344.15297-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240405193344.15297-1-laurent.pinchart@ideasonboard.com>
References: <20240405193344.15297-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

Add both MIPI CSI-2 nodes in the bcm283x tree and take care of the
Raspberry Pi / BCM2711 specific in the related files.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi     |  8 +++++++
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi | 14 ++++++++++++
 arch/arm/boot/dts/broadcom/bcm283x.dtsi     | 24 +++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 22c7f1561344..1d8f9f80f935 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -1114,6 +1114,14 @@ &rmem {
 	#address-cells = <2>;
 };
 
+&csi0 {
+	interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&csi1 {
+	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &cma {
 	/*
 	 * arm64 reserves the CMA by default somewhere in ZONE_DMA32,
diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index f0acc9390f31..9972782429b1 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -25,6 +25,20 @@ vchiq: mailbox@7e00b840 {
 	};
 };
 
+&csi0 {
+	clocks = <&clocks BCM2835_CLOCK_CAM0>,
+		 <&firmware_clocks 4>;
+	clock-names = "lp", "vpu";
+	power-domains = <&power RPI_POWER_DOMAIN_UNICAM0>;
+};
+
+&csi1 {
+	clocks = <&clocks BCM2835_CLOCK_CAM1>,
+		 <&firmware_clocks 4>;
+	clock-names = "lp", "vpu";
+	power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
+};
+
 &gpio {
 	gpioout: gpioout {
 		brcm,pins = <6>;
diff --git a/arch/arm/boot/dts/broadcom/bcm283x.dtsi b/arch/arm/boot/dts/broadcom/bcm283x.dtsi
index 2ca8a2505a4d..69b0919f1324 100644
--- a/arch/arm/boot/dts/broadcom/bcm283x.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm283x.dtsi
@@ -454,6 +454,30 @@ dsi1: dsi@7e700000 {
 			status = "disabled";
 		};
 
+		csi0: csi@7e800000 {
+			compatible = "brcm,bcm2835-unicam";
+			reg = <0x7e800000 0x800>,
+			      <0x7e802000 0x4>;
+			reg-names = "unicam", "cmi";
+			interrupts = <2 6>;
+			brcm,num-data-lanes = <2>;
+			status = "disabled";
+			port {
+			};
+		};
+
+		csi1: csi@7e801000 {
+			compatible = "brcm,bcm2835-unicam";
+			reg = <0x7e801000 0x800>,
+			      <0x7e802004 0x4>;
+			reg-names = "unicam", "cmi";
+			interrupts = <2 7>;
+			brcm,num-data-lanes = <4>;
+			status = "disabled";
+			port {
+			};
+		};
+
 		i2c1: i2c@7e804000 {
 			compatible = "brcm,bcm2835-i2c";
 			reg = <0x7e804000 0x1000>;
-- 
Regards,

Laurent Pinchart


