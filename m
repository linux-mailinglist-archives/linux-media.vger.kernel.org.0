Return-Path: <linux-media+bounces-7896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A25288D313
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 01:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8FE0321232
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 00:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCC31CFBC;
	Wed, 27 Mar 2024 00:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SdaTXCEa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD2029A8;
	Wed, 27 Mar 2024 00:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711497939; cv=none; b=ILcU08I6caLoBqJ4bvgRwCnHzZKfDdgpiyW/Ek33RivpYgbu8b2xzyyQH47CgdOwglKPd2Wythht/W2GMN/IADOnHPERwVRU13heoZxgVswz4S8qwnHUMVtHyBzeIqhcVC/2CO7PjMwJfUoTUK71hE6LlYVtILIcfNjsYtOdAC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711497939; c=relaxed/simple;
	bh=mtnOGIDcBG5OGj3awvJlSrQuL3PVIusLG2rt8IMyvuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udsrQ/dFbnHq1hyMPZCH1f/pEVMxSm2O/pa87lvAiwydWLiHJSvmg8CMZLQwmaFHlLTX7+NpKyfgMw+2laH190KkJjhz8pEZJuqx8TOzjS2QtwbE4e3Mu2ccFYB5lSbuPc685eX9w2cjPxJ+AndSwUmWp0Ripx0ZwsRhRTVok+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SdaTXCEa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 523013372;
	Wed, 27 Mar 2024 01:04:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711497898;
	bh=mtnOGIDcBG5OGj3awvJlSrQuL3PVIusLG2rt8IMyvuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SdaTXCEa/IgkzL3XDShEN0CZ7nzC5zKlHxQ2tfYNKL74SOnPhrwGYb+1nxE7DbUPg
	 lFPGWJ6z++38YWB5m7GVhLuOpR8tg9N6VdClYacoJqaew1LLnMm0l+Q/nWvjzeaVr8
	 lFkxBSRu063WolUXCz/NcI1/HaU6xlE7gGD3lGmQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
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
Subject: [PATCH v8 06/10] ARM: dts: bcm2835: Add Unicam CSI nodes
Date: Wed, 27 Mar 2024 02:05:04 +0200
Message-ID: <20240327000510.2541-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240327000510.2541-1-laurent.pinchart@ideasonboard.com>
References: <20240327000510.2541-1-laurent.pinchart@ideasonboard.com>
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
index 6e6dc109f0c2..e9bf41b9f5c1 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -26,6 +26,20 @@ vchiq: mailbox@7e00b840 {
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


