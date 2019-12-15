Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADFC411F956
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfLOQ7c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 11:59:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:55134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbfLOQ7c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 11:59:32 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C57424679;
        Sun, 15 Dec 2019 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576429171;
        bh=h33d693tSXLso9w3yXgPuTbnms8ia3M5JIWMSCbNBnE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iRsFDfp5dTCdd8hdfb7DRsrAhuVj+MbDM6yDZ4TkQLjmR183GI2NhsimxlOkuld0l
         lH0YUZBtbTWtQ5bFj6cEr5Is0L7icYgGC3qZiFbLKecUsQht57C6WsG6Dm1djuqBA1
         ry+oYgAq/HPx0ms2JPnZEBar9La4Kb4P63emA+ig=
Received: by wens.tw (Postfix, from userid 1000)
        id 84BFD5FF75; Mon, 16 Dec 2019 00:59:26 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 12/14] [DO NOT MERGE] ARM: dts: sun4i: cubieboard: Enable OV7670 camera on CSI1
Date:   Mon, 16 Dec 2019 00:59:22 +0800
Message-Id: <20191215165924.28314-13-wens@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215165924.28314-1-wens@kernel.org>
References: <20191215165924.28314-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The Cubieboard has CSI1 pins exposed on one of its GPIO headers.
Combined with I2C1 on the same header, a connected OV7670 based
camera module can be used. Power is provided via the 5V rail on
the same header. The module has onboard LDOs for the sensor's
various power rails.

Add a device node for the sensor, enable CSI1 and I2C1, and hook
everything up.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun4i-a10-cubieboard.dts | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
index 6ca02e824acc..29bfec8fad5b 100644
--- a/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
+++ b/arch/arm/boot/dts/sun4i-a10-cubieboard.dts
@@ -101,6 +101,25 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&csi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&csi1_8bits_pg_pins>;
+	status = "okay";
+
+	port {
+		/* Parallel bus endpoint */
+		csi_from_ov7670: endpoint {
+			remote-endpoint = <&ov7670_to_csi>;
+			bus-width = <8>;
+			/* driver is broken */
+			hsync-active = <0>; /* Active high */
+			vsync-active = <1>; /* Active high */
+			data-active = <1>;  /* Active high */
+			pclk-sample = <1>;  /* Rising */
+		};
+	};
+};
+
 &de {
 	status = "okay";
 };
@@ -143,6 +162,29 @@ axp209: pmic@34 {
 
 &i2c1 {
 	status = "okay";
+
+	ov7670: camera@21 {
+		compatible = "ovti,ov7670";
+		reg = <0x21>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&csi1_clk_pg_pin>;
+		clocks = <&ccu CLK_CSI1>;
+		clock-names = "xclk";
+
+		reset-gpios = <&pio 7 14 GPIO_ACTIVE_LOW>; /* PH14 */
+		powerdown-gpios = <&pio 7 15 GPIO_ACTIVE_HIGH>; /* PH15 */
+
+		port {
+			ov7670_to_csi: endpoint {
+				remote-endpoint = <&csi_from_ov7670>;
+				bus-width = <8>;
+				hsync-active = <1>; /* Active high */
+				vsync-active = <1>; /* Active high */
+				data-active = <1>;  /* Active high */
+				pclk-sample = <1>;  /* Rising */
+			};
+		};
+	};
 };
 
 &ir0 {
-- 
2.24.0

