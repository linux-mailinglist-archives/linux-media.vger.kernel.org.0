Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2132CCAEC
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 01:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgLCAN6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 19:13:58 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:37679 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCAN6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 19:13:58 -0500
Received: by mail-il1-f195.google.com with SMTP id k8so300848ilr.4;
        Wed, 02 Dec 2020 16:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4cra8Ks5i9MixQjMmJh8R6Bb/+JjKyu5/XDdwun+kzs=;
        b=uIKSWHiricPlwtzE/YH283zlTKWcA+omhPZu/hzOStY6AixSMizST5Z7AWX72GdQea
         o6rhXk3ccA5GyKu+FIrRZpM4lgK0vy7Zo9bbDIsgnmQuSrRbAKepeCj4wiVgCvuXLnlF
         DU7BGy0rEwZk949Ul5g216AxjbiKEFPU4YWSrCpRgmLPE57c7LdX2lQL7XupH/O5GsCX
         XiHbo233gijmpo3jwXJvuylMdNEz4eDOi2s66P/ioY4I66iEqggd/s0nlThTgX9jFfzf
         J9sxCTg8Lh7Zk6lEjEHh+qmeSx5pJYjyLkmIy5KPvf7Z5d9SPtbLq0BijOnrzxeHjX2m
         7FGg==
X-Gm-Message-State: AOAM533T8v2Ig5iNZDc9fPYvt4WKPKIYjS9Kw4mrh3AWjGz33VH40+ll
        +dMNGu/5h0BMjFr0SHq02Q==
X-Google-Smtp-Source: ABdhPJy/B6ri+TOuTWvGA2fIE3XqET6w0GSwrL5qkyOZ1PxShmZL4pxBwHeP0TfKTuW/0XkFQeBccw==
X-Received: by 2002:a05:6e02:80b:: with SMTP id u11mr649944ilm.43.1606954390639;
        Wed, 02 Dec 2020 16:13:10 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id n7sm174830ioa.34.2020.12.02.16.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 16:13:09 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: media: Use graph and video-interfaces schemas
Date:   Wed,  2 Dec 2020 17:13:02 -0700
Message-Id: <20201203001302.3407476-3-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203001302.3407476-1-robh@kernel.org>
References: <20201203001302.3407476-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we have graph and video-interfaces schemas, rework the media
related schemas to use them.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Update based on graph schema changes and addition of video-interfaces
   schemas

 .../media/allwinner,sun4i-a10-csi.yaml        |  11 +-
 .../media/allwinner,sun6i-a31-csi.yaml        |  12 +-
 .../bindings/media/i2c/adv7180.yaml           |  35 ++----
 .../bindings/media/i2c/adv7604.yaml           |  37 ++----
 .../bindings/media/i2c/aptina,mt9v111.yaml    |   4 +-
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  |  30 +----
 .../devicetree/bindings/media/i2c/imx219.yaml |  21 ++--
 .../bindings/media/i2c/maxim,max9286.yaml     | 101 ++++------------
 .../devicetree/bindings/media/i2c/ov5647.yaml |  20 +---
 .../devicetree/bindings/media/i2c/ov8856.yaml |  21 +---
 .../bindings/media/i2c/ovti,ov2680.yaml       |   6 +-
 .../bindings/media/i2c/ovti,ov772x.yaml       |   9 +-
 .../bindings/media/i2c/sony,imx214.yaml       |  25 ++--
 .../bindings/media/i2c/sony,imx274.yaml       |   3 +-
 .../bindings/media/marvell,mmp2-ccic.yaml     |  15 +--
 .../bindings/media/nxp,imx7-csi.yaml          |   5 +-
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    |  32 +----
 .../bindings/media/renesas,ceu.yaml           |  17 +--
 .../bindings/media/renesas,csi2.yaml          |  54 ++-------
 .../bindings/media/renesas,vin.yaml           | 113 +++---------------
 .../bindings/media/rockchip-isp1.yaml         |  40 +------
 .../bindings/media/st,stm32-dcmi.yaml         |  18 +--
 .../devicetree/bindings/media/ti,cal.yaml     |  55 ++-------
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml  |  39 +-----
 24 files changed, 151 insertions(+), 572 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index 09318830db47..6ced94064215 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -67,14 +67,14 @@ properties:
   interconnect-names:
     const: dma-mem

-  # See ./video-interfaces.txt for details
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false

     properties:
       endpoint:
-        type: object
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false

         properties:
           bus-width:
@@ -83,7 +83,6 @@ properties:
           data-active: true
           hsync-active: true
           pclk-sample: true
-          remote-endpoint: true
           vsync-active: true

         required:
@@ -91,12 +90,8 @@ properties:
           - data-active
           - hsync-active
           - pclk-sample
-          - remote-endpoint
           - vsync-active

-    required:
-      - endpoint
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
index 1fd9b5532a21..8b568072a069 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
@@ -40,17 +40,15 @@ properties:
   resets:
     maxItems: 1

-  # See ./video-interfaces.txt for details
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/port-base

     properties:
       endpoint:
-        type: object
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false

         properties:
-          remote-endpoint: true
-
           bus-width:
             enum: [ 8, 10, 12, 16 ]

@@ -60,10 +58,6 @@ properties:

         required:
           - bus-width
-          - remote-endpoint
-
-    required:
-      - endpoint

     additionalProperties: false

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index d8c54f9d9506..b729de679eb8 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -36,17 +36,9 @@ properties:
     maxItems: 1

   port:
-    type: object
-    description:
-      A node containing a single endpoint as doucmented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
-
-  ports:
-    type: object
-    description:
-      A node containing input and output port nodes with endpoint definitions
-      as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
+    $ref: /schemas/graph.yaml#/properties/port
+
+  ports: true

 additionalProperties: false

@@ -80,25 +72,20 @@ allOf:
     then:
       properties:
         ports:
+          $ref: /schemas/graph.yaml#/properties/ports
           properties:
-            '#address-cells':
-              const: 1
-            '#size-cells':
-              const: 0
             port@3:
-              type: object
+              $ref: /schemas/graph.yaml#/properties/port
               description: Output port

           patternProperties:
             "^port@[0-2]$":
-              type: object
+              $ref: /schemas/graph.yaml#/properties/port
               description: Input port

           required:
             - port@3

-          additionalProperties: false
-
       required:
         - ports

@@ -110,25 +97,21 @@ allOf:
     then:
       properties:
         ports:
+          $ref: /schemas/graph.yaml#/properties/ports
           properties:
-            '#address-cells':
-              const: 1
-            '#size-cells':
-              const: 0
             port@6:
               type: object
+              $ref: /schemas/graph.yaml#/properties/port
               description: Output port

           patternProperties:
             "^port@[0-5]$":
-              type: object
+              $ref: /schemas/graph.yaml#/properties/port
               description: Input port

           required:
             - port@6

-          additionalProperties: false
-
       required:
         - ports

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
index 407baddfaa1d..df634b0c1f8c 100644
--- a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
@@ -64,16 +64,12 @@ properties:
     description:
       Select which input is selected after reset.

-  ports:
-    type: object
-    description:
-      A node containing input and output port nodes with endpoint definitions
-      as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
+  ports: true

 required:
   - compatible
   - reg
+  - ports

 additionalProperties: false

@@ -86,26 +82,19 @@ allOf:
     then:
       properties:
         ports:
+          $ref: /schemas/graph.yaml#/properties/ports
           properties:
-            '#address-cells':
-              const: 1
-            '#size-cells':
-              const: 0
             port@0:
-              type: object
+              $ref: /schemas/graph.yaml#/properties/port
               description: Input port
+
             port@1:
-              type: object
+              $ref: /schemas/graph.yaml#/properties/port
               description: Output port

           required:
             - port@1

-          additionalProperties: false
-
-      required:
-        - ports
-
   - if:
       properties:
         compatible:
@@ -114,28 +103,20 @@ allOf:
     then:
       properties:
         ports:
+          $ref: /schemas/graph.yaml#/properties/ports
           properties:
-            '#address-cells':
-              const: 1
-            '#size-cells':
-              const: 0
             port@2:
-              type: object
+              $ref: /schemas/graph.yaml#/properties/port
               description: Output port

           patternProperties:
             "^port@[0-1]$":
-              type: object
+              $ref: /schemas/graph.yaml#/properties/port
               description: Input port

           required:
             - port@2

-          additionalProperties: false
-
-      required:
-        - ports
-
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
index ff9546e95d05..e53b8d65f381 100644
--- a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
@@ -41,9 +41,9 @@ properties:
     maxItems: 1

   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description: |
-      Output video port. See ../video-interfaces.txt.
+      Output video port.

 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
index 3dc06c628e64..e57575c44930 100644
--- a/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
@@ -86,33 +86,9 @@ properties:
     maxItems: 3

   port:
-    type: object
-    additionalProperties: false
-    description: -|
-      Connection to the remote GMSL endpoint are modelled using the OF graph
-      bindings in accordance with the video interface bindings defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-      The device node contains a single "port" child node with a single
-      "endpoint" sub-device.
-
-    properties:
-      endpoint:
-        type: object
-        additionalProperties: false
-
-        properties:
-          remote-endpoint:
-            description: -|
-              phandle to the remote GMSL endpoint sub-node in the remote node
-              port.
-            maxItems: 1
-
-        required:
-          - remote-endpoint
-
-    required:
-      - endpoint
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Connection to the remote GMSL endpoint.

 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index dfc4d29a4f04..012c0565d8ae 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -44,12 +44,15 @@ properties:
       Reference to the GPIO connected to the xclr pin, if any.
       Must be released (set high) after all supplies are applied.

-  # See ../video-interfaces.txt for more details
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
     properties:
       endpoint:
-        type: object
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
         properties:
           data-lanes:
             description: |-
@@ -60,16 +63,8 @@ properties:
               - const: 1
               - const: 2

-          clock-noncontinuous:
-            type: boolean
-            description: |-
-              MIPI CSI-2 clock is non-continuous if this property is present,
-              otherwise it's continuous.
-
-          link-frequencies:
-            $ref: /schemas/types.yaml#/definitions/uint64-array
-            description:
-              Allowed data bus frequencies.
+          clock-noncontinuous: true
+          link-frequencies: true

         required:
           - link-frequencies
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 9ea827092fdd..3a52dc81eabd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -52,81 +52,41 @@ properties:
     const: 2

   ports:
-    type: object
-    description: |
-      The connections to the MAX9286 GMSL and its endpoint nodes are modelled
-      using the OF graph bindings in accordance with the video interface
-      bindings defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-      The following table lists the port number corresponding to each device
-      port.
-
-        Port            Description
-        ----------------------------------------
-        Port 0          GMSL Input 0
-        Port 1          GMSL Input 1
-        Port 2          GMSL Input 2
-        Port 3          GMSL Input 3
-        Port 4          CSI-2 Output
+    $ref: /schemas/graph.yaml#/properties/ports

     properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
-      port@[0-3]:
-        type: object
-        properties:
-          reg:
-            enum: [ 0, 1, 2, 3 ]
-
-          endpoint:
-            type: object
-
-            properties:
-              remote-endpoint:
-                description: |
-                 phandle to the remote GMSL source endpoint subnode in the
-                 remote node port.
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input 0

-            required:
-              - remote-endpoint
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input 1

-        required:
-          - reg
-          - endpoint
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input 2

-        additionalProperties: false
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: GMSL Input 3

       port@4:
-        type: object
-        properties:
-          reg:
-            const: 4
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI-2 Output

+        properties:
           endpoint:
-            type: object
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false

             properties:
-              remote-endpoint:
-                description: phandle to the remote CSI-2 sink endpoint.
-
-              data-lanes:
-                description: array of physical CSI-2 data lane indexes.
+              data-lanes: true

             required:
-              - remote-endpoint
               - data-lanes

-        required:
-          - reg
-          - endpoint
-
-        additionalProperties: false
-
     required:
       - port@4

@@ -184,25 +144,8 @@ properties:
                   requirements of the currently connected remote device.

               port:
-                type: object
-
-                properties:
-                  endpoint:
-                    type: object
-
-                    properties:
-                      remote-endpoint:
-                        description: phandle to the MAX9286 sink endpoint.
-
-                    required:
-                      - remote-endpoint
-
-                    additionalProperties: false
-
-                required:
-                  - endpoint
-
-                additionalProperties: false
+                $ref: /schemas/graph.yaml#/properties/port
+                description: Connection to the MAX9286 sink.

             required:
               - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
index 280c62afae13..3b1ea9da437a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
@@ -31,27 +31,15 @@ properties:
     maxItems: 1

   port:
-    type: object
-    description: |-
-      Should contain one endpoint sub-node used to model connection to the
-      video receiver according to the specification defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/$defs/port-base

     properties:
       endpoint:
-        type: object
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false

         properties:
-          remote-endpoint:
-            description: |-
-              phandle to the video receiver input port.
-
-          clock-noncontinuous:
-            type: boolean
-            description: |-
-              Set to true to allow MIPI CSI-2 non-continuous clock operations.
-
-        additionalProperties: false
+          clock-noncontinuous: true

     additionalProperties: false

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
index cde85553fd01..c29b057ae922 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -57,16 +57,13 @@ properties:
       active low.

   port:
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false
-    description:
-      A node containing an output port node with an endpoint definition
-      as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt

     properties:
       endpoint:
-        type: object
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false

         properties:
           data-lanes:
@@ -79,18 +76,13 @@ properties:
               - const: 4

           link-frequencies:
-            $ref: /schemas/types.yaml#/definitions/uint64-array
-            description:
-              Allowed data bus frequencies. 360000000, 180000000 Hz or both
-              are supported by the driver.
-
+            maxItems: 2
+            items:
+              enum: [ 360000000, 180000000 ]

         required:
           - link-frequencies

-    required:
-      - endpoint
-
 required:
   - compatible
   - reg
@@ -139,4 +131,3 @@ examples:
         };
     };
 ...
-
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
index 43bf749807e1..cf456f8d9ddc 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -50,11 +50,9 @@ properties:
       Definition of the regulator used as digital power supply.

   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description:
-      A node containing an output port node with an endpoint definition
-      as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
+      A node containing an output port node.

 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index 6866c2cdac50..44529425ce3a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -37,13 +37,14 @@ properties:
     maxItems: 1

   port:
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/port-base
     description: |
-      Video output port. See ../video-interfaces.txt.
+      Video output port.

     properties:
       endpoint:
-        type: object
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false

         properties:
           bus-type:
@@ -91,8 +92,6 @@ properties:
         required:
           - bus-type

-        unevaluatedProperties: false
-
     additionalProperties: false

 required:
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index 1a3590dd0e98..1b69b6342978 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -15,6 +15,9 @@ description: |
   interface. Image data is sent through MIPI CSI-2, through 2 or 4 lanes at a
   maximum throughput of 1.2Gbps/lane.

+allOf:
+  - $ref: ../video-interface-devices.yaml#
+
 properties:
   compatible:
     const: sony,imx214
@@ -47,25 +50,21 @@ properties:
     description: Chip digital core regulator (1.12V).
     maxItems: 1

-  flash-leds:
-    description: See ../video-interfaces.txt
-
-  lens-focus:
-    description: See ../video-interfaces.txt
+  flash-leds: true
+  lens-focus: true

   port:
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/port-base
     description: |
-      Video output port. See ../video-interfaces.txt.
+      Video output port.

     properties:
       endpoint:
-        type: object
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false

         properties:
           data-lanes:
-            $ref: /schemas/types.yaml#/definitions/uint32-array
-            description: See ../video-interfaces.txt
             anyOf:
               - items:
                   - const: 1
@@ -76,16 +75,12 @@ properties:
                   - const: 3
                   - const: 4

-          link-frequencies:
-            $ref: /schemas/types.yaml#/definitions/uint64-array
-            description: See ../video-interfaces.txt
+          link-frequencies: true

         required:
           - data-lanes
           - link-frequencies

-        unevaluatedProperties: false
-
     additionalProperties: false

 required:
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
index f697e1a20beb..90828020e42a 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
@@ -44,8 +44,7 @@ properties:
     maxItems: 1

   port:
-    type: object
-    description: Output video port. See ../video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/port

 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
index 49bff738aca5..9e85c70d1a1f 100644
--- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
+++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
@@ -24,29 +24,20 @@ properties:
     maxItems: 1

   port:
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false

     properties:
       endpoint:
-        type: object
-        additionalProperties: false
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false

-        # Properties described in
-        # Documentation/devicetree/bindings/media/video-interfaces.txt
         properties:
-          remote-endpoint: true
           hsync-active: true
           vsync-active: true
           pclk-sample: true
           bus-type: true

-        required:
-          - remote-endpoint
-
-    required:
-      - endpoint
-
   clocks:
     minItems: 1
     maxItems: 3
diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
index 4e81a47e60ac..d91575b8ebb9 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
@@ -33,10 +33,7 @@ properties:
       - const: mclk

   port:
-    type: object
-    description:
-      A node containing input port nodes with endpoint definitions as documented
-      in Documentation/devicetree/bindings/media/video-interfaces.txt
+    $ref: /schemas/graph.yaml#/properties/port

 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
index 0668332959e7..be47a7b62ca9 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
@@ -58,35 +58,22 @@ properties:
       Differential receiver (HS-RX) settle time

   ports:
-    type: object
-    description:
-      A node containing input and output port nodes with endpoint definitions
-      as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
+    $ref: /schemas/graph.yaml#/properties/ports

     properties:
-      '#address-cells':
-        const: 1
-
-      '#size-cells':
-        const: 0
-
       port@0:
-        type: object
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           Input port node, single endpoint describing the CSI-2 transmitter.

         properties:
-          reg:
-            const: 0
-
           endpoint:
-            type: object
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false

             properties:
               data-lanes:
-                $ref: /schemas/types.yaml#/definitions/uint32-array
-                description: See ../video-interfaces.txt
                 oneOf:
                   - items:
                       - const: 1
@@ -94,18 +81,11 @@ properties:
                       - const: 1
                       - const: 2

-              remote-endpoint: true
-
             required:
               - data-lanes
-              - remote-endpoint
-
-            additionalProperties: false
-
-        additionalProperties: false

       port@1:
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
         description:
           Output port node

diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
index c7e1e4fe67e6..50e0740af15a 100644
--- a/Documentation/devicetree/bindings/media/renesas,ceu.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
@@ -34,18 +34,15 @@ properties:
     maxItems: 1

   port:
-    type: object
-    additionalProperties: false
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false

     properties:
       endpoint:
-        type: object
-        additionalProperties: false
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false

-         # Properties described in
-         # Documentation/devicetree/bindings/media/video-interfaces.txt
         properties:
-          remote-endpoint: true
           hsync-active: true
           vsync-active: true
           field-even-active: false
@@ -53,12 +50,6 @@ properties:
             enum: [8, 16]
             default: 8

-        required:
-          - remote-endpoint
-
-    required:
-      - endpoint
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
index 533c2f181db7..20396f1be999 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -46,24 +46,19 @@ properties:
     maxItems: 1

   ports:
-    type: object
-    description:
-      A node containing input and output port nodes with endpoint definitions
-      as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
+    $ref: /schemas/graph.yaml#/properties/ports

     properties:
       port@0:
-        type: object
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description:
           Input port node, single endpoint describing the CSI-2 transmitter.

         properties:
-          reg:
-            const: 0
-
           endpoint:
-            type: object
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false

             properties:
               clock-lanes:
@@ -72,50 +67,19 @@ properties:
               data-lanes:
                 maxItems: 1

-              remote-endpoint: true
-
             required:
               - clock-lanes
               - data-lanes
-              - remote-endpoint
-
-            additionalProperties: false
-
-        additionalProperties: false

       port@1:
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
         description:
           Output port node, multiple endpoints describing all the R-Car VIN
           modules connected the CSI-2 receiver.

-        properties:
-          '#address-cells':
-            const: 1
-
-          '#size-cells':
-            const: 0
-
-          reg:
-            const: 1
-
-        patternProperties:
-          "^endpoint@[0-9a-f]$":
-            type: object
-
-            properties:
-              reg:
-                maxItems: 1
-
-              remote-endpoint: true
-
-            required:
-              - reg
-              - remote-endpoint
-
-            additionalProperties: false
-
-        additionalProperties: false
+    required:
+      - port@0
+      - port@1

 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index ad2fe660364b..fe7c4cbfe4ba 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -69,15 +69,15 @@ properties:

   #The per-board settings for Gen2 and RZ/G1 platforms:
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
     description:
-      A node containing a parallel input with a single endpoint definitions as
-      documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
+      A node containing a parallel input

     properties:
       endpoint:
-        type: object
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false

         properties:
           hsync-active:
@@ -106,15 +106,6 @@ properties:

           data-active: true

-          remote-endpoint: true
-
-        required:
-          - remote-endpoint
-
-        additionalProperties: false
-
-    additionalProperties: false
-
   #The per-board settings for Gen3 and RZ/G2 platforms:
   renesas,id:
     description: VIN channel number
@@ -123,23 +114,18 @@ properties:
     maximum: 15

   ports:
-    type: object
-    description:
-      A node containing input nodes with endpoint definitions as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
+    $ref: /schemas/graph.yaml#/properties/ports

     properties:
       port@0:
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
         description:
           Input port node, single endpoint describing a parallel input source.

         properties:
-          reg:
-            const: 0
-
           endpoint:
-            type: object
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false

             properties:
               hsync-active:
@@ -168,98 +154,29 @@ properties:

               data-active: true

-              remote-endpoint: true
-
-            required:
-              - remote-endpoint
-
-            additionalProperties: false
-
-        required:
-          - endpoint
-
-        additionalProperties: false
-
       port@1:
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
         description:
           Input port node, multiple endpoints describing all the R-Car CSI-2
           modules connected the VIN.

         properties:
-          '#address-cells':
-            const: 1
-
-          '#size-cells':
-            const: 0
-
-          reg:
-            const: 1
-
           endpoint@0:
-            type: object
+            $ref: /schemas/graph.yaml#/properties/endpoint
             description: Endpoint connected to CSI20.

-            properties:
-              reg:
-                const: 0
-
-              remote-endpoint: true
-
-            required:
-              - reg
-              - remote-endpoint
-
-            additionalProperties: false
-
           endpoint@1:
-            type: object
+            $ref: /schemas/graph.yaml#/properties/endpoint
             description: Endpoint connected to CSI21.

-            properties:
-              reg:
-                const: 1
-
-              remote-endpoint: true
-
-            required:
-              - reg
-              - remote-endpoint
-
-            additionalProperties: false
-
           endpoint@2:
-            type: object
+            $ref: /schemas/graph.yaml#/properties/endpoint
             description: Endpoint connected to CSI40.

-            properties:
-              reg:
-                const: 2
-
-              remote-endpoint: true
-
-            required:
-              - reg
-              - remote-endpoint
-
-            additionalProperties: false
-
           endpoint@3:
-            type: object
+            $ref: /schemas/graph.yaml#/properties/endpoint
             description: Endpoint connected to CSI41.

-            properties:
-              reg:
-                const: 3
-
-              remote-endpoint: true
-
-            required:
-              - reg
-              - remote-endpoint
-
-            additionalProperties: false
-
         anyOf:
           - required:
               - endpoint@0
@@ -270,8 +187,6 @@ properties:
           - required:
               - endpoint@3

-        additionalProperties: false
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 2004c054ed1a..a6b1eff879ed 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -56,56 +56,26 @@ properties:
   power-domains:
     maxItems: 1

-  # See ./video-interfaces.txt for details
   ports:
-    type: object
-    additionalProperties: false
+    $ref: /schemas/graph.yaml#/properties/ports

     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: connection point for sensors at MIPI-DPHY RX0
-        additionalProperties: false

         properties:
-          "#address-cells":
-            const: 1
-
-          "#size-cells":
-            const: 0
-
-          reg:
-            const: 0
-
-        patternProperties:
           endpoint:
-            type: object
-            additionalProperties: false
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false

             properties:
-              reg:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4

-              remote-endpoint: true
-
-        required:
-          - reg
-          - "#address-cells"
-          - "#size-cells"
-
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0

 required:
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index c18574bb3e81..41e1d0cd80e5 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -37,16 +37,15 @@ properties:
     maxItems: 1

   port:
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
     description:
-      DCMI supports a single port node with parallel bus. It should contain
-      one 'port' child node with child 'endpoint' node. Please refer to the
-      bindings defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      DCMI supports a single port node with parallel bus.

     properties:
       endpoint:
-        type: object
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false

         properties:
           bus-type:
@@ -57,8 +56,6 @@ properties:
             enum: [8, 10, 12, 14]
             default: 8

-          remote-endpoint: true
-
         allOf:
           - if:
               properties:
@@ -73,14 +70,9 @@ properties:
                   enum: [8]

         required:
-          - remote-endpoint
           - bus-type
           - pclk-sample

-        unevaluatedProperties: false
-
-    additionalProperties: false
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
index 5e066629287d..65177cd69514 100644
--- a/Documentation/devicetree/bindings/media/ti,cal.yaml
+++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
@@ -15,10 +15,7 @@ description: |-
   processing capability to connect CSI2 image-sensor modules to the
   DRA72x device.

-  CAL supports 2 camera port nodes on MIPI bus. Each CSI2 camera port nodes
-  should contain a 'port' child node with child 'endpoint' node. Please
-  refer to the bindings defined in
-  Documentation/devicetree/bindings/media/video-interfaces.txt.
+  CAL supports 2 camera port nodes on MIPI bus.

 properties:
   compatible:
@@ -67,31 +64,19 @@ properties:
       Documentation/devicetree/bindings/power/power_domain.txt
     maxItems: 1

-  # See ./video-interfaces.txt for details
   ports:
-    type: object
-    additionalProperties: false
+    $ref: /schemas/graph.yaml#/properties/ports

     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
-        type: object
-        additionalProperties: false
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI2 Port #0

         properties:
-          reg:
-            const: 0
-            description: CSI2 Port #0
-
-        patternProperties:
           endpoint:
-            type: object
-            additionalProperties: false
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false

             properties:
               clock-lanes:
@@ -101,24 +86,15 @@ properties:
                 minItems: 1
                 maxItems: 4

-              remote-endpoint: true
-
-        required:
-          - reg
-
       port@1:
-        type: object
-        additionalProperties: false
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI2 Port #1

         properties:
-          reg:
-            const: 1
-            description: CSI2 Port #1
-
-        patternProperties:
           endpoint:
-            type: object
-            additionalProperties: false
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false

             properties:
               clock-lanes:
@@ -128,14 +104,7 @@ properties:
                 minItems: 1
                 maxItems: 4

-              remote-endpoint: true
-
-        required:
-          - reg
-
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0

 required:
diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
index 2961a5b6872f..7d77823dbb7a 100644
--- a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
@@ -97,24 +97,21 @@ properties:
     maxItems: 1

   ports:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/ports

     properties:
       port@0:
-        type: object
+        $ref: /schemas/graph.yaml#/$defs/port-base
         description: |
           Input / sink port node, single endpoint describing the
           CSI-2 transmitter.

         properties:
-          reg:
-            const: 0
-
           endpoint:
-            type: object
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false

             properties:
-
               data-lanes:
                 description: |
                   This is required only in the sink port 0 endpoint which
@@ -130,41 +127,17 @@ properties:
                   - const: 3
                   - const: 4

-              remote-endpoint: true
-
             required:
               - data-lanes
-              - remote-endpoint
-
-            additionalProperties: false

-        additionalProperties: false
+        unevaluatedProperties: false

       port@1:
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
         description: |
           Output / source port node, endpoint describing modules
           connected the CSI-2 receiver.

-        properties:
-
-          reg:
-            const: 1
-
-          endpoint:
-            type: object
-
-            properties:
-
-              remote-endpoint: true
-
-            required:
-              - remote-endpoint
-
-            additionalProperties: false
-
-        additionalProperties: false
-
 required:
   - compatible
   - reg
--
2.25.1
