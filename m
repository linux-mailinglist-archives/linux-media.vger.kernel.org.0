Return-Path: <linux-media+bounces-8333-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCAA894833
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99407281218
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB968F70;
	Tue,  2 Apr 2024 00:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MVgZTqHN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC35D8BF1;
	Tue,  2 Apr 2024 00:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016290; cv=none; b=nR7i2lalV8N3UH8O4t6BFiTpM5Ki4G22iRUcpvosd4dqvCZpt/U9WeKD8VutR/XLLRCC/7ngs5hddbqGDD8KXpJCT6YUy6IIL6DBkjAu8DtupPT1kzIYoNaCTqzvyG+qfuiI8dkEBvWjuxo9x+3zJ/TtwX3p9dyZjvq7BQ2SEn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016290; c=relaxed/simple;
	bh=ndys2svSg9cK6eMDpWAf6Ot6tAYHyHGSNq5sgUYubWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tDWsRsPoKY8WHVNuiQZc8OrOq3eJZWm4VnljMnpWxWZA4TKKsXSlXae5L7NDa0xzO7HhZIZ0xhlBHmnXsrooMdPaWAIzNJ8Wnj+WxXAP9bEENbUo2ac1AvQJGuEaKT9M4Q/IVojusAKlg95wX7RsxwuGbwaZqSIxjcK/5zFUTPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MVgZTqHN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A6EB75A;
	Tue,  2 Apr 2024 02:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016248;
	bh=ndys2svSg9cK6eMDpWAf6Ot6tAYHyHGSNq5sgUYubWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MVgZTqHNnbe02AjrFSLFQSXBkLPmhGUkep97AJEWI52OSG/iaA+CI0Vl5iwK4sUNp
	 MncoT1YZd365FpalUoGN3i2OHmfFGG63eTBjSyMpv0MmQZZa+adZO/073eQ8BBmmO8
	 Wc17Ris8JA/P0SGnsp5EV/Ujq9/WCxEaz8636t5U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
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
Subject: [PATCH v9 07/10] ARM: dts: bcm2711-rpi: Add pinctrl-based multiplexing for I2C0
Date: Tue,  2 Apr 2024 03:04:14 +0300
Message-ID: <20240402000424.4650-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König <uwe@kleine-koenig.org>

BCM2711-based Raspberry Pi boards (4B, CM4 and 400) multiplex the I2C0
controller over two sets of pins, GPIO0+1 and GPIO44+45. The former is
exposed on the 40-pin header, while the latter is used for the CSI and
DSI connectors.

Add a pinctrl-based I2C bus multiplexer to bcm2711-rpi.dtsi to model
this multiplexing. The two child buses are named i2c0_0 and i2c0_1.

Note that if you modified the dts before to add devices to the i2c bus
appearing on pins gpio0 + gpio1 (either directly in the dts or using an
overlay), you have to put these into the i2c0_0 node introduced here
now.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes since v7:

- Rename i2c0mux to i2c-mux0

Changes since v6:

- Don't disable i2c0mux by default

Changes since v3:

- Split addition of the RTC to a separate patch
- Move the mux to bcm2711-rpi.dtsi
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 29 +++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 86188eabeb24..6bf4241fe3b7 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -17,6 +17,30 @@ aliases {
 		pcie0 = &pcie0;
 		blconfig = &blconfig;
 	};
+
+	i2c0mux: i2c-mux0 {
+		compatible = "i2c-mux-pinctrl";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c-parent = <&i2c0>;
+
+		pinctrl-names = "i2c0", "i2c0-vc";
+		pinctrl-0 = <&i2c0_gpio0>;
+		pinctrl-1 = <&i2c0_gpio44>;
+
+		i2c0_0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c0_1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
 };
 
 &firmware {
@@ -49,6 +73,11 @@ &hvs {
 	clocks = <&firmware_clocks 4>;
 };
 
+&i2c0 {
+	/delete-property/ pinctrl-names;
+	/delete-property/ pinctrl-0;
+};
+
 &rmem {
 	/*
 	 * RPi4's co-processor will copy the board's bootloader configuration
-- 
Regards,

Laurent Pinchart


