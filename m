Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBBC2E0D07
	for <lists+linux-media@lfdr.de>; Tue, 22 Dec 2020 17:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727497AbgLVQFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Dec 2020 11:05:01 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:44359 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727360AbgLVQFB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Dec 2020 11:05:01 -0500
X-Originating-IP: 90.55.97.122
Received: from pc-2.home (apoitiers-259-1-26-122.w90-55.abo.wanadoo.fr [90.55.97.122])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0EA991C0014;
        Tue, 22 Dec 2020 16:04:17 +0000 (UTC)
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v3 2/3] media: dt-bindings: media: i2c: Add bindings for TW9900
Date:   Tue, 22 Dec 2020 17:04:06 +0100
Message-Id: <20201222160407.501586-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201222160407.501586-1-maxime.chevallier@bootlin.com>
References: <20201222160407.501586-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Techwell TW9900 is a video decoder supporting multiple input
standards, such as PAL, NTSC and SECAM, and outputs a BT.656 video
signal.

It's designed to be low-power, posesses some features such as a
programmable comb-filter, and automatic input standard detection.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2->V3 : Fix the example not compiling due to a typo in the reset-gpios
node.

 .../devicetree/bindings/media/i2c/tw9900.yaml | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/tw9900.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/tw9900.yaml b/Documentation/devicetree/bindings/media/i2c/tw9900.yaml
new file mode 100644
index 000000000000..91eff26668fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/tw9900.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/tw9900.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Techwell TW9900 NTSC/PAL/SECAM video decoder
+
+maintainers:
+  - Maxime Chevallier <maxime.chevallier@bootlin.com>
+
+description:
+  The tw9900 is a multi-standard video decoder, supporting NTSC, PAL and SECAM
+  standards with auto-detection features.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - techwell,tw9900
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply
+
+  port:
+    type: object
+    description:
+      A node containing a single endpoint as doucmented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            tw9900: tw9900@44 {
+                    compatible = "techwell,tw9900";
+                    reg = <0x44>;
+
+                    vdd-supply = <&tw9900_supply>;
+                    reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+                    port {
+                            tw9900_out: endpoint {
+                                    remote-endpoint = <&vip_in>;
+                            };
+                    };
+            };
+    };
-- 
2.25.4

