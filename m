Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26192F97B6
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 03:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731220AbhARCMC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 21:12:02 -0500
Received: from foss.arm.com ([217.140.110.172]:48632 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731152AbhARCLW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 21:11:22 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22D2C147A;
        Sun, 17 Jan 2021 18:10:11 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17A133F719;
        Sun, 17 Jan 2021 18:10:07 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH v3 18/21] dt-bindings: allwinner: Add H616 compatible strings
Date:   Mon, 18 Jan 2021 02:08:45 +0000
Message-Id: <20210118020848.11721-19-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210118020848.11721-1-andre.przywara@arm.com>
References: <20210118020848.11721-1-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add simple "allwinner,sun50i-h616-xxx" compatible names to existing
bindings, and pair them with an existing fallback compatible string,
as the devices are compatible.
This covers I2C, infrared, RTC and SPI.

Use enums to group all compatible devices together.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C
---
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     | 21 +++++++------------
 .../media/allwinner,sun4i-a10-ir.yaml         | 16 ++++++--------
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |  3 +++
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |  1 +
 4 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 5b5ae402f97a..eb72dd571def 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -18,21 +18,14 @@ properties:
           - const: allwinner,sun4i-a10-i2c
       - const: allwinner,sun6i-a31-i2c
       - items:
-          - const: allwinner,sun8i-a23-i2c
+          - enum:
+              - allwinner,sun8i-a23-i2c
+              - allwinner,sun8i-a83t-i2c
+              - allwinner,sun50i-a64-i2c
+              - allwinner,sun50i-a100-i2c
+              - allwinner,sun50i-h6-i2c
+              - allwinner,sun50i-h616-i2c
           - const: allwinner,sun6i-a31-i2c
-      - items:
-          - const: allwinner,sun8i-a83t-i2c
-          - const: allwinner,sun6i-a31-i2c
-      - items:
-          - const: allwinner,sun50i-a64-i2c
-          - const: allwinner,sun6i-a31-i2c
-      - items:
-          - const: allwinner,sun50i-a100-i2c
-          - const: allwinner,sun6i-a31-i2c
-      - items:
-          - const: allwinner,sun50i-h6-i2c
-          - const: allwinner,sun6i-a31-i2c
-
       - const: marvell,mv64xxx-i2c
       - const: marvell,mv78230-i2c
       - const: marvell,mv78230-a0-i2c
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 5fa19d4aeaf3..6d8395d6bca0 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -20,16 +20,12 @@ properties:
       - const: allwinner,sun5i-a13-ir
       - const: allwinner,sun6i-a31-ir
       - items:
-          - const: allwinner,sun8i-a83t-ir
-          - const: allwinner,sun6i-a31-ir
-      - items:
-          - const: allwinner,sun8i-r40-ir
-          - const: allwinner,sun6i-a31-ir
-      - items:
-          - const: allwinner,sun50i-a64-ir
-          - const: allwinner,sun6i-a31-ir
-      - items:
-          - const: allwinner,sun50i-h6-ir
+          - enum:
+              - allwinner,sun8i-a83t-ir
+              - allwinner,sun8i-r40-ir
+              - allwinner,sun50i-a64-ir
+              - allwinner,sun50i-h6-ir
+              - allwinner,sun50i-h616-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index 37c2a601c3fa..97928efd2bc9 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -26,6 +26,9 @@ properties:
           - const: allwinner,sun50i-a64-rtc
           - const: allwinner,sun8i-h3-rtc
       - const: allwinner,sun50i-h6-rtc
+      - items:
+          - const: allwinner,sun50i-h616-rtc
+          - const: allwinner,sun50i-h6-rtc
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index 7866a655d81c..908248260afa 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - allwinner,sun8i-r40-spi
               - allwinner,sun50i-h6-spi
+              - allwinner,sun50i-h616-spi
           - const: allwinner,sun8i-h3-spi
 
   reg:
-- 
2.17.5

