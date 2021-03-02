Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A426532A874
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349914AbhCBRhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:37:31 -0500
Received: from aposti.net ([89.234.176.197]:39826 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1575646AbhCBPYR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Mar 2021 10:24:17 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] dt-bindings: media: Document RDA5807 FM radio bindings
Date:   Tue,  2 Mar 2021 14:42:35 +0000
Message-Id: <20210302144236.72824-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add documentation for the devicetree bindings of the RDA5807 FM radio
I2C chip from Unisoc.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/media/i2c/rda,rda5807.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/rda,rda5807.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/rda,rda5807.yaml b/Documentation/devicetree/bindings/media/i2c/rda,rda5807.yaml
new file mode 100644
index 000000000000..f50e54a722eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/rda,rda5807.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/rda,rda5807.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc Communications RDA5807 FM radio receiver
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  compatible:
+    enum:
+      - rda,rda5807
+
+  reg:
+    description: I2C address.
+    maxItems: 1
+
+  power-supply: true
+
+  rda,lnan:
+    description: Use LNAN input port.
+    type: boolean
+
+  rda,lnap:
+    description: Use LNAP input port.
+    type: boolean
+
+  rda,analog-out:
+    description: Enable analog audio output.
+    type: boolean
+
+  rda,i2s-out:
+    description: Enable I2S digital audio output.
+    type: boolean
+
+  rda,lna-microamp:
+    description: LNA working current, in micro-amperes.
+    default: 2500
+    enum: [1800, 2100, 2500, 3000]
+
+required:
+  - compatible
+  - reg
+  - power-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      radio@11 {
+        compatible = "rda,rda5807";
+        reg = <0x11>;
+
+        power-supply = <&ldo6>;
+
+        rda,lnan;
+        rda,lnap;
+        rda,analog-out;
+      };
+    };
-- 
2.30.1

