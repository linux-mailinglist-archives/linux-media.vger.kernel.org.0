Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF269350FD8
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 09:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233500AbhDAHI2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 03:08:28 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:48421 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbhDAHIL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 03:08:11 -0400
Received: from localhost.localdomain (55.134.22.93.rev.sfr.net [93.22.134.55])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 12A1F100007;
        Thu,  1 Apr 2021 07:08:08 +0000 (UTC)
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
Subject: [PATCH v5 2/3] media: dt-bindings: media: i2c: Add bindings for TW9900
Date:   Thu,  1 Apr 2021 09:08:01 +0200
Message-Id: <20210401070802.1685823-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210401070802.1685823-1-maxime.chevallier@bootlin.com>
References: <20210401070802.1685823-1-maxime.chevallier@bootlin.com>
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

V3->V4 : Add the missing reset-gpios node to the binding

V4->V5 : Renamed the file to match the compatible string, and referenced
the graph.yaml schema

 .../bindings/media/i2c/techwell,tw9900.yaml   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml b/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
new file mode 100644
index 000000000000..b5047c26f0cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/techwell,tw9900.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/techwell,tw9900.yaml#
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
+  reset-gpios:
+    description: GPIO descriptor for the RESET input pin
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Video port for the decoder output.
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

