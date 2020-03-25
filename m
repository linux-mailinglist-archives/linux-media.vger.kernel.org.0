Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5B491932DA
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 22:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgCYVfg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 17:35:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39946 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgCYVfg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 17:35:36 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 0E687293EA8
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 7/7] dt-bindings: rockchip-vpu: Convert bindings to json-schema
Date:   Wed, 25 Mar 2020 18:34:38 -0300
Message-Id: <20200325213439.16509-8-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325213439.16509-1-ezequiel@collabora.com>
References: <20200325213439.16509-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert Rockchip VPU (Hantro IP block) codec driver documentation to
json-schema.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../bindings/media/rockchip-vpu.txt           | 43 ----------
 .../bindings/media/rockchip-vpu.yaml          | 82 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 83 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.txt b/Documentation/devicetree/bindings/media/rockchip-vpu.txt
deleted file mode 100644
index 339252d9c515..000000000000
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
index 000000000000..a0c45e05cf03
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/rockchip-vpu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Hantro G1 VPU codecs implemented on Rockchip SoCs
+
+maintainers:
+  - Ezequiel Garcia <ezequiel@collabora.com>
+
+description:
+  Hantro G1 video encode and decode accelerators present on Rockchip SoCs.
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
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: vepu
+      - const: vdpu
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+
+examples:
+  - |
+        #include <dt-bindings/clock/rk3288-cru.h>
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+        vpu: video-codec@ff9a0000 {
+                compatible = "rockchip,rk3288-vpu";
+                reg = <0x0 0xff9a0000 0x0 0x800>;
+                interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "vepu", "vdpu";
+                clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
+                clock-names = "aclk", "hclk";
+                power-domains = <&power RK3288_PD_VIDEO>;
+                iommus = <&vpu_mmu>;
+        };
+
+        vpu: video-codec@ff350000 {
+                compatible = "rockchip,rk3328-vpu";
+                reg = <0x0 0xff350000 0x0 0x800>;
+                interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "vdpu";
+                clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+                clock-names = "aclk", "hclk";
+                power-domains = <&power RK3328_PD_VPU>;
+                iommus = <&vpu_mmu>;
+        };
diff --git a/MAINTAINERS b/MAINTAINERS
index d66ac41ef587..2b8b3e7f3df3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14320,7 +14320,7 @@ L:	linux-rockchip@lists.infradead.org
 S:	Maintained
 F:	drivers/staging/media/hantro/
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
-F:	Documentation/devicetree/bindings/media/rockchip-vpu.txt
+F:	Documentation/devicetree/bindings/media/rockchip-vpu.yaml
 
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
-- 
2.26.0.rc2

