Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E1A2B5654
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 02:40:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgKQBjx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 20:39:53 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39504 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKQBjw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 20:39:52 -0500
Received: by mail-ot1-f65.google.com with SMTP id z16so17963706otq.6;
        Mon, 16 Nov 2020 17:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YiArAjqUh/zvmo3Z+qGzgu/13lPQKgeSJLEXcUJZhqU=;
        b=jUj6WnHQXL0bRI20Vov3HIBzFNmGLz6YwZh0xUYaJoX0LC/C+bevoGFxN5qSlAXg+p
         WIb9OS5dxxGDcYSVBxzW7GV07sukn4SeNq1QqYBXHUfRR3kIp/X9xgSP0wXGx06mnuK2
         kr1NOyaypGsmkZsBge6z/PdWcgHhB1KdRzamV2jdUhhrUwvDnP/jH0yWzPE9Y111+2Mu
         lGPDtDoG0Hn6toH7JsmaOfaySpM0tR7KcbKDnFi0PfUdSJci7bXqRyJsXgwNYItOV4iU
         nZPf7FTa1k7KENdWg3OHsW5dalgWjpwzkilF8YfRZSZqsHil/dzZY3b4VNvI7fFh6uJf
         C+cQ==
X-Gm-Message-State: AOAM5322Yw/Jx7MkW64NHSzfJNeFxk5Xja0AOxQDP8CTqL5nLHsz/Bs9
        zDcFMfzX117ztPx0tr4L4Q==
X-Google-Smtp-Source: ABdhPJwnfTvby5qfUqFklfwTKwYVB7zTblmmWR9wvL3LURxLt3CiukkBnBtid+6bEedn8y0Fe8jJxA==
X-Received: by 2002:a9d:bf4:: with SMTP id 107mr1506972oth.320.1605577189127;
        Mon, 16 Nov 2020 17:39:49 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id y11sm1606527oog.34.2020.11.16.17.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 17:39:48 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] dt-bindings: media: Use OF graph schema
Date:   Mon, 16 Nov 2020 19:39:47 -0600
Message-Id: <20201117013947.2479625-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we have a graph schema, rework the media related schemas to
use it. Mostly this is adding a reference to graph.yaml and dropping
duplicate parts from schemas.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This can go via the media tree. Ideally anything else subsequently added 
will be fixed up too.

 .../media/allwinner,sun4i-a10-csi.yaml        |  1 +
 .../media/allwinner,sun6i-a31-csi.yaml        |  1 +
 .../bindings/media/i2c/adv7180.yaml           | 31 ++------
 .../bindings/media/i2c/adv7604.yaml           | 32 ++------
 .../bindings/media/i2c/aptina,mt9v111.yaml    |  2 +-
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  | 25 +-----
 .../devicetree/bindings/media/i2c/imx219.yaml |  4 +
 .../bindings/media/i2c/maxim,max9286.yaml     | 76 ++++---------------
 .../devicetree/bindings/media/i2c/ov5647.yaml |  5 +-
 .../devicetree/bindings/media/i2c/ov8856.yaml |  5 +-
 .../bindings/media/i2c/ovti,ov772x.yaml       |  1 +
 .../bindings/media/i2c/sony,imx214.yaml       |  1 +
 .../bindings/media/i2c/sony,imx274.yaml       |  3 +-
 .../bindings/media/marvell,mmp2-ccic.yaml     |  1 +
 .../bindings/media/renesas,ceu.yaml           |  1 +
 .../bindings/media/renesas,csi2.yaml          | 36 ++-------
 .../bindings/media/renesas,vin.yaml           |  7 +-
 .../bindings/media/st,stm32-dcmi.yaml         |  7 +-
 .../devicetree/bindings/media/ti,cal.yaml     | 15 +---
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml  | 21 +----
 20 files changed, 61 insertions(+), 214 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index 09318830db47..0205f7dd7fdb 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -70,6 +70,7 @@ properties:
   # See ./video-interfaces.txt for details
   port:
     type: object
+    $ref: /schemas/graph.yaml#/properties/port
     additionalProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
index 1fd9b5532a21..48d8f73ce7ab 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
@@ -43,6 +43,7 @@ properties:
   # See ./video-interfaces.txt for details
   port:
     type: object
+    $ref: /schemas/graph.yaml#/properties/port
 
     properties:
       endpoint:
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
index d8c54f9d9506..7f28954a4508 100644
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
 
@@ -80,24 +72,19 @@ allOf:
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
               description: Output port
 
           patternProperties:
             "^port@[0-2]$":
-              type: object
               description: Input port
 
           required:
             - port@3
 
-          additionalProperties: false
+          unevaluatedProperties: false
 
       required:
         - ports
@@ -110,24 +97,20 @@ allOf:
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
               description: Output port
 
           patternProperties:
             "^port@[0-5]$":
-              type: object
               description: Input port
 
           required:
             - port@6
 
-          additionalProperties: false
+          unevaluatedProperties: false
 
       required:
         - ports
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604.yaml b/Documentation/devicetree/bindings/media/i2c/adv7604.yaml
index 407baddfaa1d..693f31daf5aa 100644
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
 
@@ -86,25 +82,17 @@ allOf:
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
               description: Input port
             port@1:
-              type: object
               description: Output port
 
           required:
             - port@1
 
-          additionalProperties: false
-
-      required:
-        - ports
+          unevaluatedProperties: false
 
   - if:
       properties:
@@ -114,27 +102,19 @@ allOf:
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
               description: Output port
 
           patternProperties:
             "^port@[0-1]$":
-              type: object
               description: Input port
 
           required:
             - port@2
 
-          additionalProperties: false
-
-      required:
-        - ports
+          unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
index ff9546e95d05..17ec4ab1dbd0 100644
--- a/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9v111.yaml
@@ -41,7 +41,7 @@ properties:
     maxItems: 1
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description: |
       Output video port. See ../video-interfaces.txt.
 
diff --git a/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
index 3dc06c628e64..e0ea3acca89a 100644
--- a/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
@@ -86,33 +86,12 @@ properties:
     maxItems: 3
 
   port:
-    type: object
-    additionalProperties: false
-    description: -|
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
       Connection to the remote GMSL endpoint are modelled using the OF graph
       bindings in accordance with the video interface bindings defined in
       Documentation/devicetree/bindings/media/video-interfaces.txt.
 
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
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index dfc4d29a4f04..bba42e015c98 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -47,6 +47,8 @@ properties:
   # See ../video-interfaces.txt for more details
   port:
     type: object
+    $ref: /schemas/graph.yaml#/properties/port
+
     properties:
       endpoint:
         type: object
@@ -74,6 +76,8 @@ properties:
         required:
           - link-frequencies
 
+    additionalProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 9ea827092fdd..2e89a5458afe 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -53,56 +53,25 @@ properties:
 
   ports:
     type: object
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
+      port@0:
+        description: GMSL Input 0
 
-      port@[0-3]:
-        type: object
-        properties:
-          reg:
-            enum: [ 0, 1, 2, 3 ]
+      port@1:
+        description: GMSL Input 1
 
-          endpoint:
-            type: object
+      port@2:
+        description: GMSL Input 2
 
-            properties:
-              remote-endpoint:
-                description: |
-                 phandle to the remote GMSL source endpoint subnode in the
-                 remote node port.
-
-            required:
-              - remote-endpoint
-
-        required:
-          - reg
-          - endpoint
-
-        additionalProperties: false
+      port@3:
+        description: GMSL Input 3
 
       port@4:
         type: object
+        description: CSI-2 Output
+
         properties:
           reg:
             const: 4
@@ -130,6 +99,8 @@ properties:
     required:
       - port@4
 
+    unevaluatedProperties: false
+
   i2c-mux:
     type: object
     description: |
@@ -184,25 +155,8 @@ properties:
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
index 280c62afae13..cd5291602a70 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
@@ -32,10 +32,7 @@ properties:
 
   port:
     type: object
-    description: |-
-      Should contain one endpoint sub-node used to model connection to the
-      video receiver according to the specification defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+    $ref: /schemas/graph.yaml#/properties/port
 
     properties:
       endpoint:
diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
index cde85553fd01..2611eb69b3b2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -58,11 +58,8 @@ properties:
 
   port:
     type: object
+    $ref: /schemas/graph.yaml#/properties/port
     additionalProperties: false
-    description:
-      A node containing an output port node with an endpoint definition
-      as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
 
     properties:
       endpoint:
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index 6866c2cdac50..eedc560837d2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -38,6 +38,7 @@ properties:
 
   port:
     type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description: |
       Video output port. See ../video-interfaces.txt.
 
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index 1a3590dd0e98..0599df605a4f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -55,6 +55,7 @@ properties:
 
   port:
     type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description: |
       Video output port. See ../video-interfaces.txt.
 
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
index 49bff738aca5..4832f55654cc 100644
--- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
+++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
@@ -25,6 +25,7 @@ properties:
 
   port:
     type: object
+    $ref: /schemas/graph.yaml#/properties/port
     additionalProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
index c7e1e4fe67e6..2d493d503d07 100644
--- a/Documentation/devicetree/bindings/media/renesas,ceu.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
@@ -35,6 +35,7 @@ properties:
 
   port:
     type: object
+    $ref: /schemas/graph.yaml#/properties/port
     additionalProperties: false
 
     properties:
diff --git a/Documentation/devicetree/bindings/media/renesas,csi2.yaml b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
index 533c2f181db7..e34dfbef25a2 100644
--- a/Documentation/devicetree/bindings/media/renesas,csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,csi2.yaml
@@ -47,10 +47,7 @@ properties:
 
   ports:
     type: object
-    description:
-      A node containing input and output port nodes with endpoint definitions
-      as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
@@ -84,38 +81,15 @@ properties:
         additionalProperties: false
 
       port@1:
-        type: object
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
+    required:
+      - port@0
+      - port@1
 
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
+    unevaluatedProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index ad2fe660364b..25a70dc89a4c 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -70,6 +70,7 @@ properties:
   #The per-board settings for Gen2 and RZ/G1 platforms:
   port:
     type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description:
       A node containing a parallel input with a single endpoint definitions as
       documented in
@@ -124,9 +125,7 @@ properties:
 
   ports:
     type: object
-    description:
-      A node containing input nodes with endpoint definitions as documented in
-      Documentation/devicetree/bindings/media/video-interfaces.txt
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
@@ -272,6 +271,8 @@ properties:
 
         additionalProperties: false
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 3fe778cb5cc3..66bdef5e1273 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -37,12 +37,9 @@ properties:
     maxItems: 1
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description:
-      DCMI supports a single port node with parallel bus. It should contain
-      one 'port' child node with child 'endpoint' node. Please refer to the
-      bindings defined in
-      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      DCMI supports a single port node with parallel bus.
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
index 5e066629287d..dc2c6be4fa4d 100644
--- a/Documentation/devicetree/bindings/media/ti,cal.yaml
+++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
@@ -70,23 +70,18 @@ properties:
   # See ./video-interfaces.txt for details
   ports:
     type: object
-    additionalProperties: false
+    $ref: /schemas/graph.yaml#/properties/ports
+    unevaluatedProperties: false
 
     properties:
-      "#address-cells":
-        const: 1
-
-      "#size-cells":
-        const: 0
-
       port@0:
         type: object
+        description: CSI2 Port #0
         additionalProperties: false
 
         properties:
           reg:
             const: 0
-            description: CSI2 Port #0
 
         patternProperties:
           endpoint:
@@ -108,12 +103,12 @@ properties:
 
       port@1:
         type: object
+        description: CSI2 Port #1
         additionalProperties: false
 
         properties:
           reg:
             const: 1
-            description: CSI2 Port #1
 
         patternProperties:
           endpoint:
@@ -134,8 +129,6 @@ properties:
           - reg
 
     required:
-      - "#address-cells"
-      - "#size-cells"
       - port@0
 
 required:
diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
index 2961a5b6872f..0868718c3691 100644
--- a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
+++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.yaml
@@ -98,6 +98,7 @@ properties:
 
   ports:
     type: object
+    $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
       port@0:
@@ -141,29 +142,11 @@ properties:
         additionalProperties: false
 
       port@1:
-        type: object
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
+    unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.25.1

