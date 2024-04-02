Return-Path: <linux-media+bounces-8336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED03894839
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 02:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4AA1F21AC0
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 00:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8089AD2F0;
	Tue,  2 Apr 2024 00:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E7WdOvxD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C25D2E6;
	Tue,  2 Apr 2024 00:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712016294; cv=none; b=oqk0PlyrpDkesENBtKdD3g1IGTIf4WXWhN65XVcOAFn7ekLPFp2D5wfcHeNpUoiJwxGRtDabj28hQRAdcIo5umrNFsgqqRVcHOnCf/RRHumCxSXYqjD3BGxEN4VjiIAvHGeVL9c7Z15XGFHwBGOmaBNgKubFuMtfl1GKBlbdXVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712016294; c=relaxed/simple;
	bh=JZ4AsAS6QEH6p78N1Ia+NHkaUGclH/Q+FhYPQorjdas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYhezF5pGOuGXht2tmjGDAu4FIDs+psExg6UupGowLpclg0yf5ccW9RGLKDoXYzQSEmlSAgiAHacegv1j4cvvz0BCvhI+09/38Jqe6pKax1wGCjfjHGDwXzNnx7LWe091R13iA5+AG6LjdBsZ66GYaM1fdtBoExxL2UjjznLuAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E7WdOvxD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8ACB4CE3;
	Tue,  2 Apr 2024 02:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712016253;
	bh=JZ4AsAS6QEH6p78N1Ia+NHkaUGclH/Q+FhYPQorjdas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E7WdOvxDZhF2Q8acJEtKJMCBlrvwKIMXwmBLSKSdpMwCOpoDfIOt5swvifYni2LDj
	 sFubJrX5TSVA2seH8IBDTh6Vb24gIL3yUiUniHG4huXxQXrGoDI3Z3EhsexWoccSzr
	 I17b2fUjCdojZCLteMiatd+pW6yMJ7Xx2yvI9GP0=
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
Subject: [PATCH v9 10/10] [DNI] arm64: dts: broadcom: Add overlay for Raspberry Pi 4B IMX219 camera
Date: Tue,  2 Apr 2024 03:04:17 +0300
Message-ID: <20240402000424.4650-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com>
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
Changes since v6:

- Add combined DTB to dtbs
---
 arch/arm64/boot/dts/broadcom/Makefile         |  4 ++
 .../dts/broadcom/bcm2711-rpi-4-b-imx219.dtso  | 65 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-imx219.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 8b4591ddd27c..59bf2891241b 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -12,6 +12,10 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
 			      bcm2837-rpi-zero-2-w.dtb
 
+bcm2711-rpi-4-b-imx219-dtbs := bcm2711-rpi-4-b.dtb bcm2711-rpi-4-b-imx219.dtbo
+
+dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-4-b-imx219.dtb
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


