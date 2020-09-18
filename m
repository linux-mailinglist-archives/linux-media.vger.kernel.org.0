Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69432700FF
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 17:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgIRP30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 11:29:26 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:43988 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgIRP30 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 11:29:26 -0400
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 665143AF7DB;
        Fri, 18 Sep 2020 14:25:44 +0000 (UTC)
Received: from pc-2.home (lfbn-tou-1-1532-46.w90-89.abo.wanadoo.fr [90.89.95.46])
        (Authenticated sender: maxime.chevallier@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C88D9240012;
        Fri, 18 Sep 2020 14:25:19 +0000 (UTC)
From:   Maxime Chevallier <maxime.chevallier@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Maxime Chevallier <maxime.chevallier@bootlin.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 2/3] media: dt-bindings: media: i2c: Add bindings for TW9900
Date:   Fri, 18 Sep 2020 16:24:21 +0200
Message-Id: <20200918142422.1086555-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200918142422.1086555-1-maxime.chevallier@bootlin.com>
References: <20200918142422.1086555-1-maxime.chevallier@bootlin.com>
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
 .../devicetree/bindings/media/i2c/tw9900.yaml | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/tw9900.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/tw9900.yaml b/Documentation/devicetree/bindings/media/i2c/tw9900.yaml
new file mode 100644
index 000000000000..fdc2c35875aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/tw9900.yaml
@@ -0,0 +1,59 @@
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
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            tw9900: tw9900@44 {
+                    compatible = "techwell,tw9900";
+                    reg = <0x44>;
+
+                    vdd-supply = <&tw9900_supply>;
+                    reset-gpio = <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
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

