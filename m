Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECA619E0EE
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 00:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgDCWOO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 18:14:14 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:32780 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728636AbgDCWON (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 18:14:13 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 56085298658
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v8 3/5] media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
Date:   Fri,  3 Apr 2020 19:13:43 -0300
Message-Id: <20200403221345.16702-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200403221345.16702-1-ezequiel@collabora.com>
References: <20200403221345.16702-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Document the Rockchip RK3399 Video Decoder bindings.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v8:
* None.
---
 .../bindings/media/rockchip,vdec.yaml         | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
new file mode 100644
index 000000000000..0c68cdad9a31
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Video Decoder (VDec) Device Tree Bindings
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |-
+  The Rockchip rk3399 has a stateless Video Decoder that can decodes H.264,
+  HEVC an VP9 streams.
+
+properties:
+  compatible:
+    const: rockchip,rk3399-vdec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The Video Decoder AXI interface clock
+      - description: The Video Decoder AHB interface clock
+      - description: The Video Decoded CABAC clock
+      - description: The Video Decoder core clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: cabac
+      - const: core
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
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/power/rk3399-power.h>
+
+    vdec: video-codec@ff660000 {
+        compatible = "rockchip,rk3399-vdec";
+        reg = <0x0 0xff660000 0x0 0x400>;
+        interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_VDU>, <&cru HCLK_VDU>,
+                 <&cru SCLK_VDU_CA>, <&cru SCLK_VDU_CORE>;
+        clock-names = "axi", "ahb", "cabac", "core";
+        power-domains = <&power RK3399_PD_VDU>;
+        iommus = <&vdec_mmu>;
+    };
+
+...
-- 
2.26.0.rc2

