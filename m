Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11E11F7A05
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 16:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgFLOrY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 10:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbgFLOrX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 10:47:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7530DC03E96F;
        Fri, 12 Jun 2020 07:47:23 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D121B1A;
        Fri, 12 Jun 2020 16:47:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591973242;
        bh=zsgqf8RLDeGBCTHNd5KBZWdXP+BQTaHck9Vt+IcKzeY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ai1NCP3W7T8o7ReurqbVkkYV9xjTfh/ma4ckUHh+KedCs84Q46vG7EWKDfNhiiH4j
         7KmLWZMSW5dccOotqNtSqBjZNbqnA+QsMoEehtTUPV+u5QZ55MN8lkjPKyFousevT1
         yBu6/oXbotwwnaG8Mm8kGznyMObuUlSSRGXr+ALY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        sakari.ailus@iki.fi
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 3/4] dt-bindings: media: i2c: Add bindings for IMI RDACM2x
Date:   Fri, 12 Jun 2020 15:47:12 +0100
Message-Id: <20200612144713.502006-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200612144713.502006-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200612144713.502006-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

The IMI RDACM20 and IMI RDACM21 are Gigabit Multimedia Serial Link
(GMSL) camera capable of transmitting video and I2C control messages on
a coax cable physical link for automotive applications.

Document their device tree bindings.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
v2:
 - Provide imi vendor prefix
 - Fix minor spelling

v3:
 - update binding descriptions

v4:
 - No change

v5:
 - Specify optional third reg address for the MCU

v7:
 [Jacopo]
 - Rename to imi,rdacm2x-gmsl.yaml
 - Exand bindings to describe RDACM21

v9:
  [Jacopo]
  - Rework 'compatible' property as suggested by Rob
  - Re-order vendor prefixes ('g' comes before 'i' ... )
  - Add Rob's tag

 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  | 159 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 2 files changed, 161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
new file mode 100644
index 000000000000..fe524490e6a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
@@ -0,0 +1,159 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+# Copyright (C) 2019 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imi,rdacm2x-gmsl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:  IMI D&D RDACM20 and RDACM21 Automotive Camera Platforms
+
+maintainers:
+  - Jacopo Mondi <jacopo+renesas@jmondi.org>
+  - Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+  - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+
+description: -|
+  The IMI D&D RDACM20 and RDACM21 are GMSL-compatible camera designed for
+  automotive applications.
+
+  The RDACM20 camera module encloses a Maxim Integrated MAX9271 GMSL serializer,
+  coupled with an OV10635 image sensor and an embedded MCU. Both the MCU and
+  the image sensor are connected to the serializer local I2C bus and are
+  accessible by the host SoC by direct addressing.
+
+  The RDACM21 camera module encloses the same serializer, coupled with an
+  OV10640 image sensor and an OV490 ISP. Only the OV490 ISP is interfaced to
+  the serializer local I2C bus while the image sensor is not accessible from
+  the host SoC.
+
+  They both connect to a remote GMSL endpoint through a coaxial cable.
+
+                                                   IMI RDACM20
+  +---------------+                        +--------------------------------+
+  |      GMSL     |   <- Video Stream      |       <- Video--------\        |
+  |               |< === GMSL Link ====== >|MAX9271<- I2C bus-> <-->OV10635 |
+  | de-serializer |   <- I2C messages ->   |                   \<-->MCU     |
+  +---------------+                        +--------------------------------+
+
+                                                   IMI RDACM21
+  +---------------+                        +--------------------------------+
+  |      GMSL     |   <- Video Stream      |       <- Video--------\        |
+  |               |< === GMSL Link ====== >|MAX9271<- I2C bus-> <-->OV490   |
+  |               |   <- I2C messages ->   |                          |     |
+  | de-serializer |                        |          OV10640 <-------|     |
+  +---------------+                        +--------------------------------+
+
+  Both camera modules serialize video data generated by the embedded camera
+  sensor on the GMSL serial channel to a remote GMSL de-serializer. They also
+  receive and transmit I2C messages encapsulated and transmitted on the GMSL
+  bidirectional control channel.
+
+  All I2C traffic received on the GMSL link not directed to the serializer is
+  propagated on the local I2C bus to the remote device there connected. All the
+  I2C traffic generated on the local I2C bus not directed to the serializer is
+  propagated to the remote de-serializer encapsulated in the GMSL control
+  channel.
+
+  The RDACM20 and RDACM21 DT node should be a direct child of the GMSL
+  deserializer's I2C bus corresponding to the GMSL link that the camera is
+  attached to.
+
+properties:
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  compatible:
+    enum:
+      - imi,rdacm20
+      - imi,rdacm21
+
+  reg:
+    description: -|
+      I2C device addresses, the first to be assigned to the serializer, the
+      following ones to be assigned to the remote devices.
+
+      For RDACM20 the second entry of the property is assigned to the
+      OV10635 image sensor and the optional third one to the embedded MCU.
+
+      For RDACM21 the second entry is assigned to the OV490 ISP and the optional
+      third one ignored.
+
+    minItems: 2
+    maxItems: 3
+
+  port:
+    type: object
+    additionalProperties: false
+    description: -|
+      Connection to the remote GMSL endpoint are modelled using the OF graph
+      bindings in accordance with the video interface bindings defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+      The device node contains a single "port" child node with a single
+      "endpoint" sub-device.
+
+    properties:
+      endpoint:
+        type: object
+        additionalProperties: false
+
+        properties:
+          remote-endpoint:
+            description: -|
+              phandle to the remote GMSL endpoint sub-node in the remote node
+              port.
+            maxItems: 1
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
+  - port
+
+examples:
+  - |
+    i2c@e66d8000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      reg = <0 0xe66d8000 0 0x40>;
+
+      camera@31 {
+        compatible = "imi,rdacm20";
+        reg = <0x31>, <0x41>, <0x51>;
+
+        port {
+          rdacm20_out0: endpoint {
+            remote-endpoint = <&max9286_in0>;
+          };
+        };
+      };
+    };
+
+  - |
+    i2c@e66d8000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      reg = <0 0xe66d8000 0 0x40>;
+
+      camera@31 {
+        compatible = "imi,rdacm21";
+        reg = <0x31>, <0x41>;
+
+        port {
+          rdacm21_out0: endpoint {
+            remote-endpoint = <&max9286_in0>;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..f0f09a4c23ad 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -455,6 +455,8 @@ patternProperties:
     description: ILI Technology Corporation (ILITEK)
   "^img,.*":
     description: Imagination Technologies Ltd.
+  "^imi,.*":
+    description: Integrated Micro-Electronics Inc.
   "^incircuit,.*":
     description: In-Circuit GmbH
   "^inet-tek,.*":
-- 
2.25.1

