Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 741D211AB1D
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 13:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729270AbfLKMpJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 07:45:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46608 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbfLKMpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 07:45:08 -0500
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0F82A20;
        Wed, 11 Dec 2019 13:45:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576068305;
        bh=6vY3GdFlHvqlqJj0Z2zNFHtaFMLYODXUxbx4zzBjr0Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h6SvNl1lH7C/QJ1ca+xu/Pbgdk1zSadJ0bx6kkRNv6VEz/NejuCW0WRlOpSfpF1a7
         jKteVpvZcEuHaL3QFC7qNdFGIZgX7iu5B/gF7GOzJu/LJFCPQkSCiRMv9YY0tFF31n
         XguphdM5Ag8KEtD+cgjBiSfvd8aooF5sMMbCBOLI=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, sakari.ailus@iki.fi,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 1/2] dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
Date:   Wed, 11 Dec 2019 12:44:58 +0000
Message-Id: <20191211124459.20508-2-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The MAX9286 deserializes video data received on up to 4 Gigabit
Multimedia Serial Links (GMSL) and outputs them on a CSI-2 port using up
to 4 data lanes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 289 ++++++++++++++++++
 1 file changed, 289 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
new file mode 100644
index 000000000000..d37ea2c432f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -0,0 +1,289 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2019 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/maxim,max9286.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated Quad GMSL Deserializer
+
+maintainers:
+  - Jacopo Mondi <jacopo+renesas@jmondi.org>
+  - Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+  - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+
+description: -|
+  The MAX9286 deserializer receives video data on up to 4 Gigabit Multimedia
+  Serial Links (GMSL) and outputs them on a CSI-2 D-PHY port using up to 4 data
+  lanes.
+
+  In addition to video data, the GMSL links carry a bidirectional control
+  channel that encapsulates I2C messages. The MAX9286 forwards all I2C traffic
+  not addressed to itself to the other side of the links, where a GMSL
+  serializer will output it on a local I2C bus. In the other direction all I2C
+  traffic received over GMSL by the MAX9286 is output on the local I2C bus.
+
+properties:
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  compatible:
+    const: maxim,max9286
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  poc-supply:
+    description: Regulator providing Power over Coax to the cameras
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO connected to the \#PWDN pin with inverted polarity
+    maxItems: 1
+
+  ports:
+    type: object
+    description: -|
+      The connections to the MAX9286 GMSL and its endpoint nodes are modelled
+      using the OF graph bindings in accordance with the video interface
+      bindings defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+      The following table lists the port number corresponding to each device
+      port.
+
+        Port            Description
+        ----------------------------------------
+        Port 0          GMSL Input 0
+        Port 1          GMSL Input 1
+        Port 2          GMSL Input 2
+        Port 3          GMSL Input 3
+        Port 4          CSI-2 Output
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@[0-3]:
+        type: object
+        properties:
+          reg:
+            enum: [ 0, 1, 2, 3 ]
+
+          endpoint:
+            type: object
+
+            properties:
+              remote-endpoint:
+                description: -|
+                 phandle to the remote GMSL source endpoint subnode in the
+                 remote node port.
+                maxItems: 1
+
+            required:
+              - remote-endpoint
+
+        required:
+          - reg
+          - endpoint
+
+        additionalProperties: false
+
+      port@4:
+        type: object
+        properties:
+          reg:
+            const: 4
+
+          endpoint:
+            type: object
+
+            properties:
+              remote-endpoint:
+                description: phandle to the remote CSI-2 sink endpoint.
+                maxItems: 1
+
+              data-lanes:
+                description: array of physical CSI-2 data lane indexes.
+
+            required:
+              - remote-endpoint
+              - data-lanes
+
+        required:
+          - reg
+          - endpoint
+
+        additionalProperties: false
+
+    required:
+      - port@4
+
+  i2c-mux:
+    type: object
+    description: -|
+      Each GMSL link is modelled as a child bus of an i2c bus
+      multiplexer/switch, in accordance with bindings described in
+      Documentation/devicetree/bindings/i2c/i2c-mux.txt. The serializer
+      device on the remote end of the GMSL link shall be modelled as a child
+      node of the corresponding I2C bus.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+  additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - ports
+  - i2c-mux
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c@e66d8000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      reg = <0 0xe66d8000 0 0x40>;
+
+      gmsl-deserializer@2c {
+        compatible = "maxim,max9286";
+        reg = <0x2c>;
+        poc-supply = <&camera_poc_12v>;
+        enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            max9286_in0: endpoint {
+              remote-endpoint = <&rdacm20_out0>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            max9286_in1: endpoint {
+              remote-endpoint = <&rdacm20_out1>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+
+            max9286_in2: endpoint {
+              remote-endpoint = <&rdacm20_out2>;
+            };
+          };
+
+          port@3 {
+            reg = <3>;
+
+            max9286_in3: endpoint {
+              remote-endpoint = <&rdacm20_out3>;
+            };
+          };
+
+          port@4 {
+            reg = <4>;
+
+            max9286_out: endpoint {
+              data-lanes = <1 2 3 4>;
+              remote-endpoint = <&csi40_in>;
+            };
+          };
+        };
+
+        i2c-mux {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          i2c@0 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            reg = <0>;
+
+            camera@51 {
+              reg = <0x51>;
+
+              port {
+                rdacm20_out0: endpoint {
+                  remote-endpoint = <&max9286_in0>;
+                };
+              };
+
+            };
+          };
+
+          i2c@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+
+            camera@52 {
+              reg = <0x52>;
+
+              port {
+                rdacm20_out1: endpoint {
+                  remote-endpoint = <&max9286_in1>;
+                };
+              };
+            };
+          };
+
+          i2c@2 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <2>;
+
+            camera@53 {
+              reg = <0x53>;
+
+              port {
+                rdacm20_out2: endpoint {
+                  remote-endpoint = <&max9286_in2>;
+                };
+              };
+            };
+          };
+
+          i2c@3 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <3>;
+
+            camera@54 {
+              reg = <0x54>;
+
+              port {
+                rdacm20_out3: endpoint {
+                  remote-endpoint = <&max9286_in3>;
+                };
+              };
+            };
+          };
+        };
+      };
+    };
-- 
2.20.1

