Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E84A1E7DCE
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 15:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgE2NEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 09:04:22 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:50721 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgE2NEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 09:04:21 -0400
X-Originating-IP: 86.250.147.67
Received: from pc-10.home (lfbn-tou-1-695-67.w86-250.abo.wanadoo.fr [86.250.147.67])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 15FE1C0002;
        Fri, 29 May 2020 13:04:17 +0000 (UTC)
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 1/3] media: dt-bindings: media: Document Rockchip CIF bindings
Date:   Fri, 29 May 2020 15:04:03 +0200
Message-Id: <20200529130405.929429-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200529130405.929429-1-maxime.chevallier@bootlin.com>
References: <20200529130405.929429-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a documentation for the Rockchip Camera Interface controller
binding.

This controller can be found on platforms such as the PX30 or the
RK3288, the PX30 being the only platform supported so far.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---

Changes since V1

 - Updated the clock and reset names
 - Added missing includes in the example, so that the make dt_binding_check passes

 .../bindings/media/rockchip-cif.yaml          | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-cif.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip-cif.yaml b/Documentation/devicetree/bindings/media/rockchip-cif.yaml
new file mode 100644
index 000000000000..f11a30ca9d42
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-cif.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip-cif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Camera Interface (CIF)
+
+maintainers:
+  - Maxime Chevallier <maxime.chevallier@bootlin.com>
+
+description: |-
+  Camera Interface for Rockcip platforms
+
+properties:
+  compatible:
+    const: rockchip,px30-cif
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: ACLK
+      - description: HCLK
+      - description: PCLK IN
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclkf
+      - const: pclkin
+
+  resets:
+    items:
+      - description: AXI
+      - description: AHB
+      - description: PCLK IN
+
+  reset-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: pclkin
+
+  power-domains:
+    maxItems: 1
+    description: phandle to the associated power domain
+
+  # See ./video-interfaces.txt for details
+  port:
+    type: object
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          remote-endpoint: true
+
+        required:
+          - remote-endpoint
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/power/px30-power.h>
+
+    cif: cif@ff490000 {
+    	compatible = "rockchip,px30-cif";
+    	reg = <0x0 0xff490000 0x0 0x200>;
+    	interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+    	clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>, <&cru SCLK_CIF_OUT>;
+    	clock-names = "aclk_cif", "hclk_cif", "pclk_cif", "cif_out";
+    	resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+    	reset-names = "rst_cif_a", "rst_cif_h", "rst_cif_pclkin";
+    	power-domains = <&power PX30_PD_VI>;
+            port {
+                    cif_in: endpoint {
+                            remote-endpoint = <&tw9900_out>;
+                    };
+            };
+    };
+...
-- 
2.25.4

