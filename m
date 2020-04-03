Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44A0419D6E2
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 14:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgDCMn0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 08:43:26 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40244 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbgDCMnZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 08:43:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id s8so6218715wrt.7;
        Fri, 03 Apr 2020 05:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HKSaFU1ljMFGNxPUS/qIK5WBodsEvdWVlhlU/sdRISo=;
        b=Mz2mmnd8WwmABTgVe9q8mKJnoErjpgv8IbeGXxlmSqY0iG6TIrwohnd2JhYb8G37Yh
         mcK2rZQkNWMfOY0hbyAERWzwhq5qHvqRPfMaSNL+q+NeJlL4xC5xJKvpIiT1+ZQbEEYv
         UgZbbZF8KIGy3vcHR/toO0BZ8cTCVe6rQZayplH6C9PKuaQzlIrPmjXOAAE4wDduOfJq
         4SfEmO7ZeEvXsUkNABCFfb2wW8vSthEB2hq4+DZeCHlLUDaHCeRJfI8QK1UpcSob1Cx1
         LhiMdXmmXIKrPbHJGw7q+DsfNyTK2oe6gR5D4Temxgwh6IIgh8XW55/7vFR8YdC6rLD3
         5B7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HKSaFU1ljMFGNxPUS/qIK5WBodsEvdWVlhlU/sdRISo=;
        b=qiFVSraATwjRNtIfi8FiLXGcn78DCJ8kAMBW2DREYOcjclfzougaipfpUfrfiFJX6+
         8k7junnNcTlzxEjmSFup+H/cT8ojsikhuiRgNhgXC6DLwN0sabffIkdzgQm2o0Q3nSot
         g3BgtMl7OS3rl/GagOJsO6Z7vDAMcBlbYke0JGksrLWsn8TzPe3VPPt3KzeKosghanDb
         Fve+BRnw55WIMSMCoQ87FNvwMfWnUkr+1lFYzEWQjG1Z8qwMo5oeKmbXC3cJMzt7gvGv
         2RCG+EGNOcJCZtzZJf52dIgP2Af82E8g2bpoJg2n3vgOHOGV9NdfDtgbsGZfnck2cuW6
         a9UA==
X-Gm-Message-State: AGi0PuZt4XsfewKALOP8OnQhz50AwnaJVP25klugXJrvBmAy/fe6maRm
        0T3hXngXZGB+NmMz1JFnps0=
X-Google-Smtp-Source: APiQypLA6bS2lGCmQmJDp4DJ7Dplpig1wUUk3XE/h5DvHOMnuRPKQ/v+JzBXiURE6qmjxUW6ZblJvw==
X-Received: by 2002:adf:a347:: with SMTP id d7mr2015540wrb.21.1585917803643;
        Fri, 03 Apr 2020 05:43:23 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id p10sm11735307wrm.6.2020.04.03.05.43.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2020 05:43:23 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     ezequiel@collabora.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: media: convert rockchip vpu bindings to yaml
Date:   Fri,  3 Apr 2020 14:43:16 +0200
Message-Id: <20200403124316.5445-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Current dts files for Rockchip with 'vpu' nodes
are manually verified. In order to automate this process
rockchip-vpu.txt has to be converted to yaml.

Changed:
  Add missing reg property

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/media/rockchip-vpu.txt     | 43 -------------
 .../devicetree/bindings/media/rockchip-vpu.yaml    | 75 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 76 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.txt b/Documentation/devicetree/bindings/media/rockchip-vpu.txt
deleted file mode 100644
index 339252d9c..000000000
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-device-tree bindings for rockchip VPU codec
-
-Rockchip (Video Processing Unit) present in various Rockchip platforms,
-such as RK3288, RK3328 and RK3399.
-
-Required properties:
-- compatible: value should be one of the following
-		"rockchip,rk3288-vpu";
-		"rockchip,rk3328-vpu";
-		"rockchip,rk3399-vpu";
-- interrupts: encoding and decoding interrupt specifiers
-- interrupt-names: should be
-		"vepu", "vdpu" on RK3288 and RK3399,
-		"vdpu" on RK3328.
-- clocks: phandle to VPU aclk, hclk clocks
-- clock-names: should be "aclk" and "hclk"
-- power-domains: phandle to power domain node
-- iommus: phandle to a iommu node
-
-Example:
-SoC-specific DT entry:
-	vpu: video-codec@ff9a0000 {
-		compatible = "rockchip,rk3288-vpu";
-		reg = <0x0 0xff9a0000 0x0 0x800>;
-		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "vepu", "vdpu";
-		clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
-		clock-names = "aclk", "hclk";
-		power-domains = <&power RK3288_PD_VIDEO>;
-		iommus = <&vpu_mmu>;
-	};
-
-	vpu: video-codec@ff350000 {
-		compatible = "rockchip,rk3328-vpu";
-		reg = <0x0 0xff350000 0x0 0x800>;
-		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "vdpu";
-		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
-		clock-names = "aclk", "hclk";
-		power-domains = <&power RK3328_PD_VPU>;
-		iommus = <&vpu_mmu>;
-	};
diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
new file mode 100644
index 000000000..c64c33923
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip video processing unit (VPU) codec
+
+maintainers:
+  - Ezequiel Garcia <ezequiel@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3288-vpu
+      - rockchip,rk3328-vpu
+      - rockchip,rk3399-vpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  interrupt-names:
+    oneOf:
+      - const: vdpu
+      - items:
+        - const: vepu
+        - const: vdpu
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - iommus
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3288-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3288-power.h>
+    vpu: video-codec@ff9a0000 {
+      compatible = "rockchip,rk3288-vpu";
+      reg = <0x0 0xff9a0000 0x0 0x800>;
+      interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "vepu", "vdpu";
+      clocks = <&cru ACLK_VCODEC>,
+               <&cru HCLK_VCODEC>;
+      clock-names = "aclk", "hclk";
+      iommus = <&vpu_mmu>;
+      power-domains = <&power RK3288_PD_VIDEO>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a480cec62..ce80b22cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14374,7 +14374,7 @@ M:	Ezequiel Garcia <ezequiel@collabora.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/media/hantro/
-F:	Documentation/devicetree/bindings/media/rockchip-vpu.txt
+F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
 
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
-- 
2.11.0

