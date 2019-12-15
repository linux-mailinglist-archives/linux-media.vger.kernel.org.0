Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8E811F946
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 17:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfLOQ7d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 11:59:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:55256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbfLOQ7c (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 11:59:32 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A99924684;
        Sun, 15 Dec 2019 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576429171;
        bh=XJDBfT1MU52M3nXB0FIH5aEUDPdxo5W3utk1GX6ZvZA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2bwAHaRcZ6+BOhTn9UUxARreLZGOTNh7g0sSK1CBJt1a5N1twqKmQOEoEIYdOdmIX
         T+ehJNtBF6OEyeU/hozCAzX5MCYP0K91k0sruHYnMrPOKLJ1qD8OPkVQVUEWtiw9Zt
         yvQfaHHpwLOPsEJBmzK2iKO4LjvLNqrJ1zr2lX7c=
Received: by wens.tw (Postfix, from userid 1000)
        id 732195FF1A; Mon, 16 Dec 2019 00:59:26 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 09/14] ARM: dts: sun8i: r40: Add I2C pinmux options
Date:   Mon, 16 Dec 2019 00:59:19 +0800
Message-Id: <20191215165924.28314-10-wens@kernel.org>
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

The R40 has five I2C controllers. Currently only I2C0 has its pinmux
option defined.

Add the options for the remaining four, and set them as the default,
since each controller has only one possible pinmux configuration.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 421dfbbfd7ee..82ea0b5b0710 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -373,6 +373,26 @@ i2c0_pins: i2c0-pins {
 				function = "i2c0";
 			};
 
+			i2c1_pins: i2c1-pins {
+				pins = "PB18", "PB19";
+				function = "i2c1";
+			};
+
+			i2c2_pins: i2c2-pins {
+				pins = "PB20", "PB21";
+				function = "i2c2";
+			};
+
+			i2c3_pins: i2c3-pins {
+				pins = "PI0", "PI1";
+				function = "i2c3";
+			};
+
+			i2c4_pins: i2c4-pins {
+				pins = "PI2", "PI3";
+				function = "i2c4";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2",
 				       "PF3", "PF4", "PF5";
@@ -528,6 +548,8 @@ i2c1: i2c@1c2b000 {
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C1>;
 			resets = <&ccu RST_BUS_I2C1>;
+			pinctrl-0 = <&i2c1_pins>;
+			pinctrl-names = "default";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -539,6 +561,8 @@ i2c2: i2c@1c2b400 {
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C2>;
 			resets = <&ccu RST_BUS_I2C2>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -550,6 +574,8 @@ i2c3: i2c@1c2b800 {
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C3>;
 			resets = <&ccu RST_BUS_I2C3>;
+			pinctrl-0 = <&i2c3_pins>;
+			pinctrl-names = "default";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -561,6 +587,8 @@ i2c4: i2c@1c2c000 {
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_I2C4>;
 			resets = <&ccu RST_BUS_I2C4>;
+			pinctrl-0 = <&i2c4_pins>;
+			pinctrl-names = "default";
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.24.0

