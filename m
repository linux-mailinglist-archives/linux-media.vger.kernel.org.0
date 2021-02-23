Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3B43232CB
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 22:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234569AbhBWVE6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 16:04:58 -0500
Received: from mail-oo1-f43.google.com ([209.85.161.43]:45847 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbhBWVDF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 16:03:05 -0500
Received: by mail-oo1-f43.google.com with SMTP id s23so4217828oot.12;
        Tue, 23 Feb 2021 13:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y8sBehCCNa+kbXPwMBE0R5HDgBSq8nEDv9KIRArwz1s=;
        b=QBEK4XEHsQkbhZL14h1zkHTkEdRJh3y/U/BBKRBo4g5n1I6Ud95j1Aiogb/+BdsoKd
         y1JKSK100J0RgeA37SXsF8jMHBz8C946NrJ5WlkvE/nCTvbonIj665YEp2wQnYR9+FAD
         H8hvbrkDiGBsfngO/MlQ0INF+34e+ATPzyFywMQZq25uZ+KqSU5dQqRnVQxjNQIhvuiu
         0n6NnWAleB5YsVd7zrD76Tesj+NVPV5j/EZWsphtUaLuC8Y4g4q7NgYM6sgsIzzZKXCt
         S4e1oFmBtDNP+sSiYtd+qdl4mbR+jh+G6VpG2uhF0srUmUVpqnQdXBQQ05zDXFOED4Fb
         KeBQ==
X-Gm-Message-State: AOAM532A0hzCiYxDTSSD54740m+fqR3zJ2IfusVKEOWIXwXBu2Ds/9by
        TYqeIoe36dCIU6LQWCrPhg==
X-Google-Smtp-Source: ABdhPJyjMAT3lFx7Kt85Yh2ULfoiwnGWka6Q+1Mj60tLWZGKoQKaiWvTU9MV6obqvyr+uUNCqdOv/A==
X-Received: by 2002:a4a:d018:: with SMTP id h24mr19830268oor.49.1614114141985;
        Tue, 23 Feb 2021 13:02:21 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id 7sm4531362oth.38.2021.02.23.13.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 13:01:49 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] dt-bindings: media: Use graph and video-interfaces schemas, round 2
Date:   Tue, 23 Feb 2021 15:01:27 -0600
Message-Id: <20210223210127.55455-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A couple of media schemas got applied without using or incorrectly
using the video-interfaces.yaml and graph.yaml schemas. Fix them up
before we have more copy-n-paste errors.

Fixes: 41b3e23376e9 ("media: dt-bindings: media: Add bindings for imx334")
Fixes: d899e5f1db7a ("media: dt-bindings: media: imx258: add bindings for IMX258 sensor")
Fixes: 918b866edfec ("media: dt-bindings: Remove old ov5647.yaml file, update ovti,ov5647.yaml")
Fixes: 22f2b47517a6 ("media: dt-bindings: media: i2c: Add OV8865 bindings documentation")
Fixes: 29a202fa7acc ("media: dt-bindings: media: i2c: Add OV5648 bindings documentation")
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack and I'll send to Linus for rc1.

 .../devicetree/bindings/media/i2c/imx258.yaml    | 14 +++++++-------
 .../bindings/media/i2c/ovti,ov5647.yaml          |  5 ++---
 .../bindings/media/i2c/ovti,ov5648.yaml          | 16 +++++-----------
 .../bindings/media/i2c/ovti,ov8865.yaml          | 16 +++++-----------
 .../bindings/media/i2c/sony,imx334.yaml          | 11 +++++------
 5 files changed, 24 insertions(+), 38 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx258.yaml b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
index eaf77866ed9b..515317eff41a 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx258.yaml
@@ -49,10 +49,14 @@ properties:
 
   # See ../video-interfaces.txt for more details
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
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
             oneOf:
@@ -65,11 +69,7 @@ properties:
                   - const: 1
                   - const: 2
 
-          link-frequencies:
-            allOf:
-              - $ref: /schemas/types.yaml#/definitions/uint64-array
-            description:
-              Allowed data bus frequencies.
+          link-frequencies: true
 
         required:
           - data-lanes
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
index 1ab22e75d3c6..3e5d82df90a2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
@@ -31,7 +31,8 @@ properties:
     maxItems: 1
 
   port:
-    $ref: /schemas/graph.yaml#/$defs/port-base
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
 
     properties:
       endpoint:
@@ -41,8 +42,6 @@ properties:
         properties:
           clock-noncontinuous: true
 
-    additionalProperties: false
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index f8783f77cc54..9149f5685688 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -44,19 +44,17 @@ properties:
     description: Reset Pin GPIO Control (active low)
 
   port:
-    type: object
     description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
 
     properties:
       endpoint:
-        type: object
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
 
         properties:
-          remote-endpoint: true
-
-          link-frequencies:
-            $ref: /schemas/types.yaml#/definitions/uint64-array
-            description: Allowed MIPI CSI-2 link frequencies
+          link-frequencies: true
 
           data-lanes:
             minItems: 1
@@ -65,10 +63,6 @@ properties:
         required:
           - data-lanes
           - link-frequencies
-          - remote-endpoint
-
-    required:
-      - endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index c0ba28aa30c4..0699c7e4fdeb 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -44,19 +44,17 @@ properties:
     description: Reset Pin GPIO Control (active low)
 
   port:
-    type: object
     description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/properties/port
+    additionalProperties: false
 
     properties:
       endpoint:
-        type: object
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
 
         properties:
-          remote-endpoint: true
-
-          link-frequencies:
-            $ref: /schemas/types.yaml#/definitions/uint64-array
-            description: Allowed MIPI CSI-2 link frequencies
+          link-frequencies: true
 
           data-lanes:
             minItems: 1
@@ -65,10 +63,6 @@ properties:
         required:
           - data-lanes
           - link-frequencies
-          - remote-endpoint
-
-    required:
-      - endpoint
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index 24e689314bde..27cc5b7ff613 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -36,18 +36,17 @@ properties:
     description: Reference to the GPIO connected to the XCLR pin, if any.
 
   port:
-    type: object
     additionalProperties: false
     $ref: /schemas/graph.yaml#/properties/port
 
     properties:
       endpoint:
-        type: object
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
         properties:
-          data-lanes:
-            $ref: ../video-interfaces.yaml#/properties/data-lanes
-          link-frequencies:
-            $ref: ../video-interfaces.yaml#/properties/link-frequencies
+          data-lanes: true
+          link-frequencies: true
 
         required:
           - data-lanes
-- 
2.27.0

