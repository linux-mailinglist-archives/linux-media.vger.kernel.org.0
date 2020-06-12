Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02171F7A03
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 16:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgFLOrW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 10:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgFLOrV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 10:47:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3642BC03E96F;
        Fri, 12 Jun 2020 07:47:21 -0700 (PDT)
Received: from Q.local (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8AF82C2;
        Fri, 12 Jun 2020 16:47:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591973239;
        bh=zG5q8wP2mfuUfE3Cb1aWpp0x99T6/VB9E5oBYr5LdzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UyWTZEqhGniRoN8Z5E7jg60igEqq9qoJHaKOvOJm0rtGhskCI5wvILfdU/60aXgc0
         uEOTI/48Z/wyyRK9SviAnH3HD4fLS4OdCfOTt/0urCS8gR4Fz6Xucwax76otKzD/Z0
         w3SUwf86O0i6DzQPRZRDS3AOUAuP9k17t5LrXrSk=
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
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v10 1/4] dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
Date:   Fri, 12 Jun 2020 15:47:10 +0100
Message-Id: <20200612144713.502006-2-kieran.bingham+renesas@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The MAX9286 deserializes video data received on up to 4 Gigabit
Multimedia Serial Links (GMSL) and outputs them on a CSI-2 port using up
to 4 data lanes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Rob Herring <robh@kernel.org>

---

v7:
 - Collect Rob's RB tag
 - Remove redundant maxItems from remote-endpoints
 - Fix SPDX licence tag

v10:
[Jacopo]
 - Fix dt-validation
 - Fix dt-binding examples with 2 reg entries

[Kieran]
 - Correctly match the hex camera node reg
 - Add (required) GPIO controller support

 .../bindings/media/i2c/maxim,max9286.yaml     | 366 ++++++++++++++++++
 1 file changed, 366 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
new file mode 100644
index 000000000000..c632a10a753a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -0,0 +1,366 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+description: |
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
+  gpio-controller: true
+
+  '#gpio-cells':
+      const: 2
+
+  ports:
+    type: object
+    description: |
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
+                description: |
+                 phandle to the remote GMSL source endpoint subnode in the
+                 remote node port.
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
+    description: |
+      Each GMSL link is modelled as a child bus of an i2c bus
+      multiplexer/switch, in accordance with bindings described in
+      Documentation/devicetree/bindings/i2c/i2c-mux.txt.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^i2c@[0-3]$":
+        type: object
+        description: |
+          Child node of the i2c bus multiplexer which represents a GMSL link.
+          Each serializer device on the GMSL link remote end is represented with
+          an i2c-mux child node. The MAX9286 chip supports up to 4 GMSL
+          channels.
+
+        properties:
+          '#address-cells':
+            const: 1
+
+          '#size-cells':
+            const: 0
+
+          reg:
+            description: The index of the GMSL channel.
+            maxItems: 1
+
+        patternProperties:
+          "^camera@[a-f0-9]+$":
+            type: object
+            description: |
+              The remote camera device, composed by a GMSL serializer and a
+              connected video source.
+
+            properties:
+              compatible:
+                description: The remote device compatible string.
+
+              reg:
+                minItems: 2
+                maxItems: 3
+                description: |
+                  The I2C addresses to be assigned to the remote devices through
+                  address reprogramming. The number of entries depends on the
+                  requirements of the currently connected remote device.
+
+              port:
+                type: object
+
+                properties:
+                  endpoint:
+                    type: object
+
+                    properties:
+                      remote-endpoint:
+                        description: phandle to the MAX9286 sink endpoint.
+
+                    required:
+                      - remote-endpoint
+
+                    additionalProperties: false
+
+                required:
+                  - endpoint
+
+                additionalProperties: false
+
+            required:
+              - compatible
+              - reg
+              - port
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - ports
+  - i2c-mux
+  - gpio-controller
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
+        gpio-controller;
+        #gpio-cells = <2>;
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
+            reg = <0>;
+
+            camera@51 {
+              compatible = "imi,rdacm20";
+              reg = <0x51>, <0x61>;
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
+              compatible = "imi,rdacm20";
+              reg = <0x52>, <0x62>;
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
+              compatible = "imi,rdacm20";
+              reg = <0x53>, <0x63>;
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
+              compatible = "imi,rdacm20";
+              reg = <0x54>, <0x64>;
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
2.25.1

