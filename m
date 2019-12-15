Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8CD11F94E
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfLOQ75 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 11:59:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:55262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726637AbfLOQ7d (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 11:59:33 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1ED7246AB;
        Sun, 15 Dec 2019 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576429172;
        bh=m5GPdarvxrtjsXfbUyU7e3PQz2NgpIQ560CvjxxvtEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FBfdymPna5qbjaty8485LW2z9uHzMwnu9A50cgCugkkgPnwnqZTuZLMAYFFazwb/I
         6/9hHMyxaSzhVCW39FqIabcI7XDijrgIRkhsX4LeJbTTpbPg5besqa6/Z3usQkY3dt
         dmFnfm2RRY+ciO+eprRDIY71e2cqzuzS1e3gI9MM=
Received: by wens.tw (Postfix, from userid 1000)
        id 97FC35FF78; Mon, 16 Dec 2019 00:59:26 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 14/14] [DO NOT MERGE] ARM: dts: sun8i-r40: bananapi-m2-ultra: Enable OV5640 camera
Date:   Mon, 16 Dec 2019 00:59:24 +0800
Message-Id: <20191215165924.28314-15-wens@kernel.org>
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

Bananapi offers a small OV5640 based camera module, attached via an FPC
connector.

Add the related regulator constraints, and hook everything up.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index 42d62d1ba1dc..86183d40c7af 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -113,6 +113,24 @@ &ahci {
 	status = "okay";
 };
 
+&csi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&csi0_8bits_pins>;
+	status = "okay";
+
+	port {
+		/* Parallel bus endpoint */
+		csi0_from_ov5640: endpoint {
+			remote-endpoint = <&ov5640_to_csi0>;
+			bus-width = <8>;
+			hsync-active = <1>; /* Active high */
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
@@ -164,6 +182,37 @@ axp22x: pmic@34 {
 
 #include "axp22x.dtsi"
 
+&i2c4 {
+	status = "okay";
+
+	ov5640: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&csi0_mclk_pin>;
+		clocks = <&ccu CLK_CSI0_MCLK>;
+		clock-names = "xclk";
+
+		reset-gpios = <&pio 8 7 GPIO_ACTIVE_LOW>; /* PI7 */
+		powerdown-gpios = <&pio 8 6 GPIO_ACTIVE_HIGH>; /* PI6 */
+		AVDD-supply = <&reg_aldo1>;
+		DOVDD-supply = <&reg_eldo1>;
+		DVDD-supply = <&reg_eldo2>;
+
+		port {
+			ov5640_to_csi0: endpoint {
+				remote-endpoint = <&csi0_from_ov5640>;
+				bus-width = <8>;
+				data-shift = <2>;
+				hsync-active = <1>; /* Active high */
+				vsync-active = <1>; /* Active high */
+				data-active = <1>;  /* Active high */
+				pclk-sample = <1>;  /* Rising */
+			};
+		};
+	};
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdc1>;
 	bus-width = <4>;
@@ -209,6 +258,12 @@ &pio {
 	vcc-pg-supply = <&reg_dldo1>;
 };
 
+&reg_aldo1 {
+	regulator-name = "csi-avdd";
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+};
+
 &reg_aldo2 {
 	regulator-min-microvolt = <2500000>;
 	regulator-max-microvolt = <2500000>;
@@ -289,6 +344,18 @@ &reg_dldo4 {
 	regulator-name = "vdd2v5-sata";
 };
 
+&reg_eldo1 {
+	regulator-name = "csi-iovcc";
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+};
+
+&reg_eldo2 {
+	regulator-name = "csi-dvdd";
+	regulator-min-microvolt = <1500000>;
+	regulator-max-microvolt = <1500000>;
+};
+
 &reg_eldo3 {
 	regulator-min-microvolt = <1200000>;
 	regulator-max-microvolt = <1200000>;
-- 
2.24.0

