Return-Path: <linux-media+bounces-6272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207FA86EB42
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 22:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CC431C23EB5
	for <lists+linux-media@lfdr.de>; Fri,  1 Mar 2024 21:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E2D59B62;
	Fri,  1 Mar 2024 21:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KUMIFPZv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE33258AA7;
	Fri,  1 Mar 2024 21:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709328779; cv=none; b=CZyB8VRsc7anhr5bJlOqstob3CgeR94Ob5OhlQBRd2PgGGO/969Q1+KhRMaGQQ9MCVpF15rnsRur66d2SkbSMs9NIsyHex9P64M8kgyLXwozhZP1jTXKFQvGZRoLtnQJxw8VEdkysbXMBsnJ/IJl0aWI3RgUJt8HJy47a3fg8Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709328779; c=relaxed/simple;
	bh=lEaMum6Hi4dQa17PbaGnwtoHBfI1CE4Ao30uOMkaZ/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ue7/RvqcI/QIkW6LMNMkn2qVHACnW+vsGwGKjjwnM4H6NffK5EBxERkNc1l2lw96ZOm6Z4G0wxZi2H/I1D2UQ2cYL0wO2VFBE0qq6yvs0uVJkalPQhI9NFH1HvL/RvqB3tJb77JQXZL/CUGGD6zn/G89JECvT7wYuL1qq7gb27Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KUMIFPZv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BFE7E3305;
	Fri,  1 Mar 2024 22:32:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709328757;
	bh=lEaMum6Hi4dQa17PbaGnwtoHBfI1CE4Ao30uOMkaZ/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KUMIFPZvtpOxaGwpe4pCOHyqTN5+w63NMwYoJ1IAP2D/zm9TL0+eUXNEWyIIGHmiE
	 QN7sETAYf5kdi9BYNPkaIik8mgNZA20Sxsa+nwAGi+zV8MUfGpl5zOqel/SqQy2ihi
	 k/OdkLVFbo+cNc1KwtfE2HvUK05ac1oY8yW6XhXw=
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
Subject: [PATCH v6 15/15] [DNI] arm64: dts: broadcom: Add overlay for Raspberry Pi 4B IMX219 camera
Date: Fri,  1 Mar 2024 23:32:30 +0200
Message-ID: <20240301213231.10340-16-laurent.pinchart@ideasonboard.com>
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


