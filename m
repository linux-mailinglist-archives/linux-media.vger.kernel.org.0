Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038731C358B
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 11:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgEDJ02 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 05:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728335AbgEDJ01 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 05:26:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD90C061A0F
        for <linux-media@vger.kernel.org>; Mon,  4 May 2020 02:26:27 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1847011FC;
        Mon,  4 May 2020 11:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1588584385;
        bh=dkYtlCRVNSZRWandxSnugeev2fN87AO1Q4xcgIhzCU4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DONeIDYYONJzOHBivnfUhA5J83w0CW/SWpo+XlNo7pJhIj4jTzM0SXNCEUkSMo9Xe
         gzcK0B2VdJcfQy5WG+I/Kwa0EKJ7slNGrEjuPGkjClMFfqS4dX/a5bJ+Ngq0awY/J7
         4AcsDdf8o+zDso5Y7HbAJ5S60jQxmQsmM9luE1DQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Naushir Patuck <naush@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 03/34] dt-bindings: media: Document BCM283x CSI2/CCP2 receiver
Date:   Mon,  4 May 2020 12:25:40 +0300
Message-Id: <20200504092611.9798-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
References: <20200504092611.9798-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Document the DT bindings for the CSI2/CCP2 receiver peripheral (known as
Unicam) on BCM283x SoCs.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/brcm,bcm2835-unicam.yaml   | 155 ++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml

diff --git a/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
new file mode 100644
index 000000000000..6ffc900e8ae8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 Raspberry Pi (Trading) Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/brcm,bcm2835-unicam.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM283x Camera Interface (Unicam)
+
+maintainers:
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+  - Raspberry Pi kernel list <kernel-list@raspberrypi.com>
+
+description:
+  The Unicam block on BCM283x SoCs is the receiver for either CSI-2 or CCP2
+  data from image sensors or similar devices.
+
+  The main platform using this SoC is the Raspberry Pi family of boards. On the
+  Pi the VideoCore firmware can also control this hardware block, and driving
+  it from two different processors will cause issues. To avoid this, the
+  firmware checks the device tree configuration during boot. If it finds device
+  tree nodes whose name starts with "csi" then it will stop the firmware
+  accessing the block, and it can then safely be used via the device tree
+  binding.
+
+properties:
+  compatible:
+    const: brcm,bcm2835-unicam
+
+  reg:
+    items:
+      - description: Main registers block
+      - description: Clock registers block
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: lp
+      - const: core
+
+  power-domains:
+    maxItems: 1
+
+  brcm,num-data-lanes:
+    description:
+      The number of data lanes supported by this Unicam instance. It may be
+      larger than the number of data lanes routed on the board, as described by
+      the data-lanes property of the endpoint.
+    allOf:
+      - $ref: "/schemas/types.yaml#/definitions/uint32"
+      - enum: [1, 2, 4]
+
+  port:
+    type: object
+    description:
+      Input port node, as described in video-interfaces.txt.
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          clock-lanes:
+            items:
+              - const: 0
+
+          data-lanes:
+            description:
+              Lane reordering is not supported, items shall be in order,
+              starting at 1.
+            allOf:
+              - $ref: "/schemas/types.yaml#/definitions/uint32-array"
+              - maxItems: 1
+                items:
+                  minItems: 1
+                  maxItems: 4
+                  items:
+                    - const: 1
+                    - const: 2
+                    - const: 3
+                    - const: 4
+
+          lane-polarities:
+            description:
+              Lane inversion is not supported. If the property is specified, it
+              shall contain all 0's.
+            allOf:
+              - $ref: "/schemas/types.yaml#/definitions/uint32-array"
+              - maxItems: 1
+                items:
+                  minItems: 2
+                  maxItems: 5
+                  items:
+                    - const: 0
+                    - const: 0
+                    - const: 0
+                    - const: 0
+                    - const: 0
+
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - remote-endpoint
+
+        additionalProperties: false
+
+    required:
+      - endpoint
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - brcm,num-data-lanes
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/bcm2835.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/raspberrypi-power.h>
+
+    csi@7e801000 {
+        compatible = "brcm,bcm2835-unicam";
+        reg = <0x7e801000 0x800>,
+              <0x7e802004 0x4>;
+        interrupts = <2 7>;
+        clocks = <&clocks BCM2835_CLOCK_CAM1>;
+        clock-names = "lp";
+        power-domains = <&power RPI_POWER_DOMAIN_UNICAM1>;
+        brcm,num-data-lanes = <4>;
+
+        port {
+            csi1_ep: endpoint {
+                remote-endpoint = <&imx219_0>;
+                data-lanes = <1 2>;
+            };
+        };
+    };
+...
-- 
Regards,

Laurent Pinchart

