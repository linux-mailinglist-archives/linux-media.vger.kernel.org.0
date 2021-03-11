Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C51EE3381A0
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 00:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbhCKXlS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 18:41:18 -0500
Received: from mail-il1-f175.google.com ([209.85.166.175]:35161 "EHLO
        mail-il1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhCKXkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 18:40:46 -0500
Received: by mail-il1-f175.google.com with SMTP id h18so982102ils.2;
        Thu, 11 Mar 2021 15:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n2sTZeIKn/ut99wwHC5Vg6UPseHZk+tqoKh8lUL2TvQ=;
        b=GXSc0Eo+cmgaTISPlnyP7qyFghNCZNt4pbgbnNziZb8Iv2qW7DfWrm+iNflEESVBqv
         djHFMsGD3wtJRbtGjGZSCRionh1UIr4wTg3GFsN5EdZmH9g1tCxWRtgYW6YenLrO90wW
         ++tcnumdWGBUNoUJ3IKsQUVk1PSalZguXgSbpXpQorFKlC1L5D45HmAUW6KR2y9CbzTY
         SvKgvzF0mjw4TFkqXIyfJ1FkSOo6JOMKOcZyAuGgemLpIpgaGxu0wYCatTHn1yXIWmnR
         x22sf6gVRTzP8xZowEsQLjWK8X3xn6FbHgZq1bOkVTViCHdJoe31XO8PddUxkOejJ66F
         eJCg==
X-Gm-Message-State: AOAM531ybGf4SZ+2+WhpS+brkbaDxfAOR6nGmebv03RDdrp1qkJjWm7s
        7gJoZO8iX7taBSmwECKAx0rbKCp5gQ==
X-Google-Smtp-Source: ABdhPJzOJCcn0MxQ/FQUm4OPUFAamQ9LTRYrDIL12ik9Q7r+rHgRS52Z5CmXjBUN5YXhnE9C+QrFUA==
X-Received: by 2002:a92:1e12:: with SMTP id e18mr717987ile.270.1615506045159;
        Thu, 11 Mar 2021 15:40:45 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id p13sm2097921ilp.1.2021.03.11.15.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:40:44 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH] dt-bindings: media: Convert video-mux to DT schema
Date:   Thu, 11 Mar 2021 16:40:42 -0700
Message-Id: <20210311234042.1588310-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we have the graph schema, convert the video-mux binding to DT
schema.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/video-mux.txt   | 60 ------------
 .../devicetree/bindings/media/video-mux.yaml  | 93 +++++++++++++++++++
 2 files changed, 93 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/video-mux.txt
 create mode 100644 Documentation/devicetree/bindings/media/video-mux.yaml

diff --git a/Documentation/devicetree/bindings/media/video-mux.txt b/Documentation/devicetree/bindings/media/video-mux.txt
deleted file mode 100644
index 63b9dc913e45..000000000000
--- a/Documentation/devicetree/bindings/media/video-mux.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-Video Multiplexer
-=================
-
-Video multiplexers allow to select between multiple input ports. Video received
-on the active input port is passed through to the output port. Muxes described
-by this binding are controlled by a multiplexer controller that is described by
-the bindings in Documentation/devicetree/bindings/mux/mux-controller.txt
-
-Required properties:
-- compatible : should be "video-mux"
-- mux-controls : mux controller node to use for operating the mux
-- #address-cells: should be <1>
-- #size-cells: should be <0>
-- port@*: at least three port nodes containing endpoints connecting to the
-  source and sink devices according to of_graph bindings. The last port is
-  the output port, all others are inputs.
-
-Optionally, #address-cells, #size-cells, and port nodes can be grouped under a
-ports node as described in Documentation/devicetree/bindings/graph.txt.
-
-Example:
-
-	mux: mux-controller {
-		compatible = "gpio-mux";
-		#mux-control-cells = <0>;
-
-		mux-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
-	};
-
-	video-mux {
-		compatible = "video-mux";
-		mux-controls = <&mux>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			mux_in0: endpoint {
-				remote-endpoint = <&video_source0_out>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			mux_in1: endpoint {
-				remote-endpoint = <&video_source1_out>;
-			};
-		};
-
-		port@2 {
-			reg = <2>;
-
-			mux_out: endpoint {
-				remote-endpoint = <&capture_interface_in>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/video-mux.yaml b/Documentation/devicetree/bindings/media/video-mux.yaml
new file mode 100644
index 000000000000..780fbbd46a38
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/video-mux.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/video-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Video Multiplexer
+
+maintainers:
+  - Sakari Ailus <sakari.ailus@linux.intel.com>
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description:
+  Video multiplexers allow to select between multiple input ports. Video
+  received on the active input port is passed through to the output port. Muxes
+  described by this binding are controlled by a multiplexer controller.
+
+properties:
+  compatible:
+    const: video-mux
+
+  mux-controls:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@':
+        $ref: /schemas/graph.yaml#/properties/port
+
+patternProperties:
+  '^port@':
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      At least three port nodes containing endpoints connecting to the source
+      and sink devices according to of_graph bindings. The last port is the
+      output port, all others are inputs.
+
+required:
+  - compatible
+  - mux-controls
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mux: mux-controller {
+        compatible = "gpio-mux";
+        #mux-control-cells = <0>;
+
+        mux-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH>;
+    };
+
+    video-mux {
+        compatible = "video-mux";
+        mux-controls = <&mux>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+            reg = <0>;
+
+            mux_in0: endpoint {
+                remote-endpoint = <&video_source0_out>;
+            };
+        };
+
+        port@1 {
+            reg = <1>;
+
+            mux_in1: endpoint {
+                remote-endpoint = <&video_source1_out>;
+            };
+        };
+
+        port@2 {
+            reg = <2>;
+
+            mux_out: endpoint {
+                remote-endpoint = <&capture_interface_in>;
+            };
+        };
+    };
+...
-- 
2.27.0

