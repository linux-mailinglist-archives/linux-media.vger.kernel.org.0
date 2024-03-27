Return-Path: <linux-media+bounces-7900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7894E88D31B
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 01:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 189611F6148F
	for <lists+linux-media@lfdr.de>; Wed, 27 Mar 2024 00:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5DE1E48A;
	Wed, 27 Mar 2024 00:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m2pA0xQ4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D3F7FF;
	Wed, 27 Mar 2024 00:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711497945; cv=none; b=Cd9OTTDYjbkIjRLzylQz0u+dYyf2gXjsfXJ9F2HRHbLXjdcruQc1/gyTztdZ/mdyl103k6/xyUhR9mpODMf9+NlrIurMbP7Zc3U73+FzlZZlMGc0jaCxhLeTZlo/PVL80apTwQFWwgOodg3oiWl6pn2hsGc32F8hMrryki9Nc9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711497945; c=relaxed/simple;
	bh=JZ4AsAS6QEH6p78N1Ia+NHkaUGclH/Q+FhYPQorjdas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bI2JwDIhNyso5igreLekFitVBhU+ER1IZFv9WC3Ha13JWWCgaxcdTBUkew1aEDUH5xxqQ9YJRaocAM1PgPQe1hK4BkQafPY17CXi73jJNrO6cdMvT+McB4Cx3PN1a+7NNR2lVLHs4UqVVNi5QTJ3F14k/s8o3UTM9iF3a9j10w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m2pA0xQ4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79F9C1890;
	Wed, 27 Mar 2024 01:05:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711497905;
	bh=JZ4AsAS6QEH6p78N1Ia+NHkaUGclH/Q+FhYPQorjdas=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m2pA0xQ4EOzgqJ9oAUKA1BcZpDzB/qlgAZBaR9ZwFCfn5FSDqgk4OTr5BO7BXI+Jb
	 A32y8FU+mADiIP4xKeUQdUoQ5a/fEEnKCvenCeTRFUvKidDitAGv+wXKvTkbL4F6Vc
	 o5Oas4O8gVK9SFf+fzcWEVx5ql1QXOU0g51mkGkU=
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
Subject: [PATCH v8 10/10] [DNI] arm64: dts: broadcom: Add overlay for Raspberry Pi 4B IMX219 camera
Date: Wed, 27 Mar 2024 02:05:08 +0200
Message-ID: <20240327000510.2541-11-laurent.pinchart@ideasonboard.com>
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


