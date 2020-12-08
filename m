Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97572D2F5E
	for <lists+linux-media@lfdr.de>; Tue,  8 Dec 2020 17:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730169AbgLHQWo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Dec 2020 11:22:44 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:42802 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730157AbgLHQWo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Dec 2020 11:22:44 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 31E833ADB5D;
        Tue,  8 Dec 2020 16:16:21 +0000 (UTC)
X-Originating-IP: 90.76.70.27
Received: from pc-2.home (lfbn-tou-1-1249-27.w90-76.abo.wanadoo.fr [90.76.70.27])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 90A1DFF817;
        Tue,  8 Dec 2020 16:15:17 +0000 (UTC)
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v4 1/3] media: dt-bindings: media: Document Rockchip VIP bindings
Date:   Tue,  8 Dec 2020 17:15:07 +0100
Message-Id: <20201208161509.655862-2-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201208161509.655862-1-maxime.chevallier@bootlin.com>
References: <20201208161509.655862-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a documentation for the Rockchip Camera Interface controller
binding.

This controller can be found on platforms such as the PX30 or the
RK3288, the PX30 being the only platform supported so far.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v3: Renmed the controller to "vip"

v4: fixed the binding to get a compiling example

 .../bindings/media/rockchip-vip.yaml          | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-vip.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip-vip.yaml b/Documentation/devicetree/bindings/media/rockchip-vip.yaml
new file mode 100644
index 000000000000..268dbc7662bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip-vip.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip-vip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip VIP Camera Interface
+
+maintainers:
+  - Maxime Chevallier <maxime.chevallier@bootlin.com>
+
+description: |-
+  Camera Interface for Rockcip platforms
+
+properties:
+  compatible:
+    const: rockchip,px30-vip
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
+
+  # See ./video-interfaces.txt for details
+  port:
+    type: object
+    additionalProperties: false
+    description: A connection to a sensor or decoder
+
+    properties:
+        remote-endpoint: true
+
+        required:
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/px30-cru.h>
+    #include <dt-bindings/power/px30-power.h>
+
+    vip: vip@ff490000 {
+    	compatible = "rockchip,px30-vip";
+    	reg = <0x0 0xff490000 0x0 0x200>;
+    	interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+    	clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>, <&cru SCLK_CIF_OUT>;
+    	clock-names = "aclk", "hclk", "pclkin";
+    	resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+    	reset-names = "axi", "ahb", "pclkin";
+    	power-domains = <&power PX30_PD_VI>;
+        port {
+            vip_in: endpoint {
+                remote-endpoint = <&tw9900_out>;
+            };
+        };
+    };
+...
-- 
2.25.4

