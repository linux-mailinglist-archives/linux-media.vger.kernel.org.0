Return-Path: <linux-media+bounces-7706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3861887F6B
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 23:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10C581C2105A
	for <lists+linux-media@lfdr.de>; Sun, 24 Mar 2024 22:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978CE44361;
	Sun, 24 Mar 2024 22:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FFKbStno"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956EA1CF92;
	Sun, 24 Mar 2024 22:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711318178; cv=none; b=l4dMW2lY63jSUCUDR39u3Yopp169KDfsg4xtGq9v1tRrp7UUQFl8vpPbOKVGIwmc7lrXbCV4xYc9jdc+Hg3wW1EGc2yu7QoITGiGdgyFXDQ9fjxYR1CjY+g57ieFK7ZLpP7+sronIDGRSuhQ0yQJBMyVssreITCruAjgGBydEW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711318178; c=relaxed/simple;
	bh=lEaMum6Hi4dQa17PbaGnwtoHBfI1CE4Ao30uOMkaZ/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewoLYJ+Gs5NvIUUZw67pw9sDH9oIsyL+OOjyLehIJCZ4stwH89JC4026BmYhsHkO2eI2vXH8vRaUWwxMwJFG8LP5c7WvaLZrYsX1KTtY4d/Gl0yhaw32K/k+nMJ856f00onJ/ErpIBTsRDUM1qDwSjW+ec/uZrNlv/q1U8FBqxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FFKbStno; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3DF461FB7;
	Sun, 24 Mar 2024 23:09:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711318143;
	bh=lEaMum6Hi4dQa17PbaGnwtoHBfI1CE4Ao30uOMkaZ/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FFKbStnoNciTn9kQZ1IkKf70V71IlE+v5VZyU66toDyRAeky3jauDGIHC7wySiLFn
	 LNk849GL8fcP3Ci2JUcNsKXp4BzfJOs/SA4AvGc75N9zMBL9JznTrG3kfbCO0iDVAx
	 L/CtXw3N3/nZVL28hc2RWsvVGyhV2QZ7P/9QXlTo=
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
Subject: [PATCH v7 15/15] [DNI] arm64: dts: broadcom: Add overlay for Raspberry Pi 4B IMX219 camera
Date: Mon, 25 Mar 2024 00:08:51 +0200
Message-ID: <20240324220854.15010-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For testing only at this point.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm64/boot/dts/broadcom/Makefile         |  2 +
 .../dts/broadcom/bcm2711-rpi-4-b-imx219.dtso  | 65 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-imx219.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 8b4591ddd27c..a64cfef8bd9a 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -12,6 +12,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
 			      bcm2837-rpi-zero-2-w.dtb
 
+bcm2711-rpi-4-b-imx219-dtbs := bcm2711-rpi-4-b.dtb bcm2711-rpi-4-b-imx219.dtbo
+
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
 subdir-y	+= stingray
diff --git a/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-imx219.dtso b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-imx219.dtso
new file mode 100644
index 000000000000..33c3219ca4c3
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-imx219.dtso
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Definitions for IMX219 camera module on VC I2C bus
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	cam1_clk: cam1_clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+};
+
+&csi1 {
+	status = "okay";
+
+	port {
+		csi_ep: endpoint {
+			remote-endpoint = <&cam_endpoint>;
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			clock-noncontinuous;
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c0_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	camera@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+
+		clocks = <&cam1_clk>;
+		clock-names = "xclk";
+
+		VANA-supply = <&cam1_reg>;	/* 2.8v */
+		VDIG-supply = <&cam1_reg>;	/* 1.8v */
+		VDDL-supply = <&cam1_reg>;	/* 1.2v */
+
+		rotation = <180>;
+		orientation = <2>;
+
+		port {
+			cam_endpoint: endpoint {
+				remote-endpoint = <&csi_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				clock-noncontinuous;
+				link-frequencies = /bits/ 64 <456000000>;
+			};
+		};
+	};
+};
+
+&i2c0mux {
+	status = "okay";
+};
-- 
Regards,

Laurent Pinchart


