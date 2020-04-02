Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3440519CCE7
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 00:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388008AbgDBWd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 18:33:27 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50940 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729549AbgDBWd1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 18:33:27 -0400
Received: by mail-wm1-f66.google.com with SMTP id t128so5207866wma.0;
        Thu, 02 Apr 2020 15:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OmDjT9copZDYM4pmPAbt/TsexMujcYzhtWf1bez84nA=;
        b=mIuef1iE5HqYFwoNjZRieAmjV7htv0wNmJV5Nta79Yast/o20W8VW9esTccDprQhUQ
         KD6JJtaxj1gK8iAA9S7/cyP0umJ5H3LDjtk2Oc2JvVQ7drV1Pk1CzoQ5IU90fdu6sos0
         gQ4MuCkSaD7LFJcJ/t8V/oxEs8dC7zpifdYO6OsCU1MlCMShn6Hr8sDvcrOnmIdAEkTG
         oCNNYzCrEYeHpQfyHK98EbApZ2PJhN7a3flWeJnwC+8hH+4p6DgKkMSiKXwz7wXVbL5C
         OCywYSxs5/mw10ZGlFA2EWsn8JYUWoNz3n0XPeitUXL+7kxD35TNLiXnLxfnERx9hXpE
         UGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OmDjT9copZDYM4pmPAbt/TsexMujcYzhtWf1bez84nA=;
        b=KDcazE0+fn6POBTX/c5JS4DfsnQiAxoKTwbxWbbevtBNnoUiBGvQDMPqZyGG6yD4yj
         wnuXJS9nCFUdQWRqwKiRzmQm8X5t8aPUvZMMfB9xEe0UbznjGBw+Nzw/9X2NDjeiSrio
         c8GYvOwHQqeTZkPA9hsdyfSlRYdheiFNfR9WZGVERKiIbs7TUNFCqvf2fVc/4bmn5MJO
         9EzpAvRQfYuph/AGy6Wr1CSFJdnUaL39aRaoh7HgpmSaS3M5R7808rj6KSAoPeSJufsw
         iPtrhmIKg7YIhkzGC6b0I6QDD0ep5k8oTZ894jlM3O2fthmYwi+Q9Jz/Bmp26rc5jnuY
         dMXg==
X-Gm-Message-State: AGi0Pub5eioq7FA1yghUjqnRC+1mOtRXjnBi9pWs1ClFVZiz8MMbVh3T
        x490z8LqN3oLMAivIMW+Gul9/33w
X-Google-Smtp-Source: APiQypI6KSN4jgb1ptryf1N/48uD/v7HmEuB61QFUUzsXobb6C4PD97FmDdsZpsVoXI7Qu9xSfwqwQ==
X-Received: by 2002:a05:600c:218d:: with SMTP id e13mr5504068wme.148.1585866804335;
        Thu, 02 Apr 2020 15:33:24 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id g186sm9267729wmg.36.2020.04.02.15.33.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Apr 2020 15:33:23 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     jacob-chen@iotwrt.com
Cc:     ezequiel@collabora.com, mchehab@kernel.org, robh+dt@kernel.org,
        heiko@sntech.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: media: convert rockchip rga bindings to yaml
Date:   Fri,  3 Apr 2020 00:33:14 +0200
Message-Id: <20200402223315.12260-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current dts files for Rockchip with 'rga' nodes
are manually verified. In order to automate this process
rockchip-rga.txt has to be converted to yaml.

Changed:
  Add missing reg property

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/media/rockchip-rga.txt     | 34 ----------
 .../devicetree/bindings/media/rockchip-rga.yaml    | 78 ++++++++++++++++++++++
 2 files changed, 78 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/rockchip-rga.txt
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-rga.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.txt b/Documentation/devicetree/bindings/media/rockchip-rga.txt
deleted file mode 100644
index c53a8e513..000000000
--- a/Documentation/devicetree/bindings/media/rockchip-rga.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-device-tree bindings for rockchip 2D raster graphic acceleration controller (RGA)
-
-RGA is a standalone 2D raster graphic acceleration unit. It accelerates 2D
-graphics operations, such as point/line drawing, image scaling, rotation,
-BitBLT, alpha blending and image blur/sharpness.
-
-Required properties:
-- compatible: value should be one of the following
-  "rockchip,rk3228-rga", "rockchip,rk3288-rga": for Rockchip RK3228
-  "rockchip,rk3288-rga": for Rockchip RK3288
-  "rockchip,rk3399-rga": for Rockchip RK3399
-
-- interrupts: RGA interrupt specifier.
-
-- clocks: phandle to RGA sclk/hclk/aclk clocks
-
-- clock-names: should be "aclk", "hclk" and "sclk"
-
-- resets: Must contain an entry for each entry in reset-names.
-  See ../reset/reset.txt for details.
-- reset-names: should be "core", "axi" and "ahb"
-
-Example:
-SoC-specific DT entry:
-	rga: rga@ff680000 {
-		compatible = "rockchip,rk3399-rga";
-		reg = <0xff680000 0x10000>;
-		interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
-		clock-names = "aclk", "hclk", "sclk";
-
-		resets = <&cru SRST_RGA_CORE>, <&cru SRST_A_RGA>, <&cru SRST_H_RGA>;
-		reset-names = "core, "axi", "ahb";
-	};
diff --git a/Documentation/devicetree/bindings/media/rockchip-rga.yaml b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
new file mode 100644
index 000000000..3b110b574
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-rga.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip-rga.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip 2D raster graphic acceleration controller (RGA)
+
+description:
+  RGA is a standalone 2D raster graphic acceleration unit. It accelerates 2D
+  graphics operations, such as point/line drawing, image scaling, rotation,
+  BitBLT, alpha blending and image blur/sharpness.
+
+maintainers:
+  - Jacob Chen <jacob-chen@iotwrt.com>
+  - Ezequiel Garcia <ezequiel@collabora.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: rockchip,rk3288-rga
+      - const: rockchip,rk3399-rga
+      - items:
+          - const: rockchip,rk3228-rga
+          - const: rockchip,rk3288-rga
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: sclk
+
+  resets:
+    maxItems: 3
+
+  reset-names:
+    items:
+      - const: core
+      - const: axi
+      - const: ahb
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    rga: rga@ff680000 {
+      compatible = "rockchip,rk3399-rga";
+      reg = <0xff680000 0x10000>;
+      interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&cru ACLK_RGA>,
+               <&cru HCLK_RGA>,
+               <&cru SCLK_RGA_CORE>;
+      clock-names = "aclk", "hclk", "sclk";
+      resets = <&cru SRST_RGA_CORE>,
+               <&cru SRST_A_RGA>,
+               <&cru SRST_H_RGA>;
+      reset-names = "core", "axi", "ahb";
+    };
-- 
2.11.0

