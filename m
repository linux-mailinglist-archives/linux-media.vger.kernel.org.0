Return-Path: <linux-media+bounces-6268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97586EB3A
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDFFC1C23E82
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2121558212;
	Fri,  1 Mar 2024 21:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GwAhfO31"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B52F5677D;
	Fri,  1 Mar 2024 21:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709328773; cv=none; b=lKYg1r6VcL8ZyHOpCtdJ6pO95VFqK0YaYTkN1Kgpvttgao4iEtA5Kg8rc6X07U5BsEZdiYq+9rmqZ5XxOb/fSQS48AyGhM51h8vnXiFZhwToTHvD+Vnj1YcEOidY8nmRbfgcEMkfzG6U48offVSuRIK6Gvn5gcYadAUKf/x5ROo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709328773; c=relaxed/simple;
	bh=OpAYbey42DqePJwgy0KOXMVv/HRM2FtVZG869QeQDUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+qfawVvj0XqFMN/R2zw1gsFUiDyQ4Wj5CKViCe8VbbyWVI9wrb6DtfI6X7xYCgrQ3aT5VX/M+urOJ8C8iTZjdccrMa/7r8jGjY4Y+qEOVlYdC96nBdEga/Qd5I5AafiOCaG3NcKsa7yOO6Iig6HgbCDx1dEkx9hsEMQXp+psCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GwAhfO31; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFB1E335C;
	Fri,  1 Mar 2024 22:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709328751;
	bh=OpAYbey42DqePJwgy0KOXMVv/HRM2FtVZG869QeQDUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GwAhfO31tc7IJ87lLrRk2qdHaFP69hDDMTB6xRcYe6trwWDrS5wxIH5yJCiOzKrFg
	 3OG0Vf76Jy9c10i89QHaohZnJwpzjOcp3cysU3qOf4X48Hc2DNyF8bSfbKbbHpJkUZ
	 LTuRX1itg2UuDxU+SfufMAqqhWtOPe3jGEl+f3Ak=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
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
Subject: [PATCH v6 11/15] ARM: dts: bcm2835: Add Unicam CSI nodes
Date: Fri,  1 Mar 2024 23:32:26 +0200
Message-ID: <20240301213231.10340-12-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
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
index 7e752a66bf8d..f2aad209187f 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -30,6 +30,20 @@ vchiq: mailbox@7e00b840 {
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


