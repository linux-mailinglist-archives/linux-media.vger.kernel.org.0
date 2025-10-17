Return-Path: <linux-media+bounces-44905-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFBFBE8F79
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 15:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A44E19A0979
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 13:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03B2369966;
	Fri, 17 Oct 2025 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/a9hMIV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C2D2F6922
	for <linux-media@vger.kernel.org>; Fri, 17 Oct 2025 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760708335; cv=none; b=HoqPUcf8pmkRfGXk+54ecxyQReTb97wnWFufGq7rNsqr1Jtic6gpiIlcpEsqRHrg3lwxNfg5RbqByz89bgigLjRra0CP1PfBZVeUzCOuwibW06WrrXfXM2VXMRjMYn1KkhduNfiPNLp3+dpmXlee/e0fKDUBLTqdtS4Yv+juvrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760708335; c=relaxed/simple;
	bh=8rEk6o9xZqyQ3Zl3e0fsJFfr7cUj3MIT7OoBARTO6L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eHJrahp0tHjmoQOgIEMTFyqpFSigqf+ZqQqIuuwC0EKkBip2XhoXO30IaVjeX2REuAvDG/zRGQ2hY8Oqu14MuNWwiQvrZFUvqftpceke7Htuv1Q7rwMVE04wYoytKVkrYe2UkI7EYSDs6D7Bq8KtqTjU57nKAfnsahNg9/swqaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/a9hMIV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967ABC4CEFE;
	Fri, 17 Oct 2025 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760708334;
	bh=8rEk6o9xZqyQ3Zl3e0fsJFfr7cUj3MIT7OoBARTO6L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t/a9hMIVDBK6VPML2p7IVqotwFcC1YSRf4aM2ZCAIs4HJYDH3tI4kh0/jKSE8l5Xt
	 NT4S2+x6uMY/5OcDWuz/uxXO1EVqnzXjz5V6ugroT3XrX0/e8XmKC6Pdtonv/E2WUr
	 FX6uq+6nGfAO/vYzQFiTvn/WdJhty85JNZZankPXQEuqo36M5Fhf46TCCP5Hm9fxY7
	 oFKKfUZHEGAC5efOxWuxqfUlaM+Rk39tAqBaX79h8XJ2LK8kLAQpdwQAM01kWqGu6s
	 aava3l97s3rFcbILBC32dIknogglovmgF9E3RJrf4GpjwzjmaSUtTE1UkXbvfVBWF2
	 JZdEMJGWyuC/A==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 14/14] DO NOT MERGE: omap3-beagle-xm.dts: add Leopard Imaging li5m03 support
Date: Fri, 17 Oct 2025 15:26:51 +0200
Message-ID: <b6dfd177850148da553dcd08286fd9a3787376ef.1760707611.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1760707611.git.hverkuil+cisco@kernel.org>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the Leopard Imaging li5m03 camera for the Beagle xM board.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../dts/ti/omap/omap3-beagle-xm-li5m03.dtsi   | 64 +++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts |  2 +
 2 files changed, 66 insertions(+)
 create mode 100644 arch/arm/boot/dts/ti/omap/omap3-beagle-xm-li5m03.dtsi

diff --git a/arch/arm/boot/dts/ti/omap/omap3-beagle-xm-li5m03.dtsi b/arch/arm/boot/dts/ti/omap/omap3-beagle-xm-li5m03.dtsi
new file mode 100644
index 000000000000..96d637534af0
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/omap3-beagle-xm-li5m03.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device Tree Source for the Beagleboard-xM LI-5M03 add-on camera board
+ *
+ * Copyright (C) 2014 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+&i2c2 {
+	clock-frequency = <100000>;
+
+	mt9p031@48 {
+		compatible = "aptina,mt9p031";
+		reg = <0x48>;
+
+		clocks = <&isp 0>;
+		reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
+
+		vaa-supply = <&hsusb2_power>;
+		vdd-supply = <&vaux3>;
+		vdd_io-supply = <&vaux4>;
+
+		port {
+			mt9p031_out: endpoint {
+				input-clock-frequency = <21000000>;
+				pixel-clock-frequency = <48000000>;
+				remote-endpoint = <&ccdc_ep>;
+			};
+		};
+	};
+};
+
+&isp {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			ccdc_ep: endpoint {
+				remote-endpoint = <&mt9p031_out>;
+				bus-width = <12>;
+				hsync-active = <1>;
+				vsync-active = <1>;
+				pclk-sample = <0>;
+			};
+		};
+	};
+};
+
+&vaux3 {
+	regulator-name = "cam_core";
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
+
+&vaux4 {
+	regulator-name = "cam_io";
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+};
diff --git a/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts b/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts
index 08ee0f8ea68f..29c1864e36a0 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts
@@ -417,3 +417,5 @@ venc_out: endpoint {
 		};
 	};
 };
+
+#include "omap3-beagle-xm-li5m03.dtsi"
-- 
2.51.0


