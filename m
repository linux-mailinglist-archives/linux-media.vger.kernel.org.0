Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FE237A90A
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 16:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbhEKOYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 10:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhEKOYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 10:24:54 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFCDC06175F
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 07:23:48 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id f1so862430edt.4
        for <linux-media@vger.kernel.org>; Tue, 11 May 2021 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Br8rMX5HFxDRkh9ZQ3wOwD7w/n9WgFZfbCjeKHedFic=;
        b=F/yK3VMsNrQ9uRK+zK0uvVo09atNln8Pg6B/yMAjawvRyCz0GXT3c1ObjYFC5pwL4E
         CjR5EKMW3JX/U4+RPdpRbknd5AFDz+2cySorzXzlfDxe3Pl8pCZoDwDLd+qyWXxdt3kT
         GopJlW7OnIJDhWv662lQGvPuctkuZkghWO/oouxmysx9HUA1P8rIYeNRxhDlkzYyC/pW
         2vCAMeuEsyReoSJ/9BoEvAVvcxwL1M4oG1O4RTqM9HHVT1a+UAT6nSgr1nIfuu1x3+24
         88IUgrqu9ozVqLiQ+xFEbUJq8nB24LRCiNmgPz3hX8vIgj9CAy9iy7gFUKUTcBc1bHps
         OLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Br8rMX5HFxDRkh9ZQ3wOwD7w/n9WgFZfbCjeKHedFic=;
        b=mv/NqJ5mcn1gcuVS7nmPU/UtXUVFpmTjvGx4CLi6HoCOzzDz+J7Wt3TNgCq+NOhV2e
         gOwoiMiJdiGujZ7mbBeziGZqunJFhDrz3OVuiXuLFIoeCRP4F4S1m5dcyPbKwMpdatxn
         78kfopoJReqtxY63sk8gWWkhk/76PduHGfG6sOwKwjSo/V8Aw1zBgQDTvSlpqKNVTQOo
         bCxObMfR2IuHG6Djkmmx4eDeiE9/ATRm+LLQ3fYp7ZA0tN5Rbn23+cKgqz8FqN7EsYGZ
         bTrmQov23KNAzfZkWu2TN2kmTd+5RyOaNHIHsd826AfCkgHEjIU8wylqdXBWcK5IMirn
         LQww==
X-Gm-Message-State: AOAM533VSc4MnoVcGu7h78rxjZAeudt0vpAp5TNSQcN2Kv6fWoLJnU7d
        I3JgAQtiFjF+acoAgJm6nh7F0YiHU5wAz1H05II=
X-Google-Smtp-Source: ABdhPJw3QMO17Xc6fkoixF8k6OA9IQQZz7j/h65Uo4/I+kG0XIJ3DEl2gOMptIKZkzLjjP2i6E2wfQ==
X-Received: by 2002:a05:6402:c7:: with SMTP id i7mr37569269edu.194.1620743027005;
        Tue, 11 May 2021 07:23:47 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de. [84.172.85.33])
        by smtp.googlemail.com with ESMTPSA id l11sm14303565eds.75.2021.05.11.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 07:23:46 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] media: dt-bindings: media: renesas,isp: Add bindings for ISP Channel Selector
Date:   Tue, 11 May 2021 16:23:20 +0200
Message-Id: <20210511142320.3463742-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add bindings for Renesas R-Car ISP Channel Selector IP. The ISP is
responsible for filtering the MIPI CSI-2 bus and directing the different
CSI-2 virtual channels to different R-Car VIN instances (DMA engines)
for capture.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Fix order of compatible value.
- Use /schemas/graph.yaml#/properties/port instead of
  /schemas/graph.yaml#/$defs/port-base for port@0.
- Drop status in examples.
---
 .../bindings/media/renesas,isp.yaml           | 196 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,isp.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,isp.yaml b/Documentation/devicetree/bindings/media/renesas,isp.yaml
new file mode 100644
index 0000000000000000..514857d36f6b7d74
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,isp.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (C) 2021 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,isp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car ISP Channel Selector
+
+maintainers:
+  - Niklas Söderlund <niklas.soderlund@ragnatech.se>
+
+description:
+  The R-Car ISP Channel Selector provides MIPI CSI-2 VC and DT filtering
+  capabilities for the Renesas R-Car family of devices. It is used in
+  conjunction with the R-Car VIN and CSI-2 modules, which provides the video
+  capture capabilities.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a779a0-isp # V3U
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port node, multiple endpoints describing the connected R-Car
+          CSI-2 receivers.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 0.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 1.
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 2.
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 3.
+
+      port@5:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 4.
+
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 5.
+
+      port@7:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 6.
+
+      port@8:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Single endpoint describing the R-Car VIN connected to output port 7.
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+      - port@5
+      - port@6
+      - port@7
+      - port@8
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - power-domains
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a779a0-sysc.h>
+
+    isp1: isp@fed20000 {
+            compatible = "renesas,r8a779a0-isp";
+            reg = <0xfed20000 0x10000>;
+            interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 613>;
+            power-domains = <&sysc R8A779A0_PD_A3ISP01>;
+            resets = <&cpg 613>;
+
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            reg = <0>;
+                            isp1csi41: endpoint@1 {
+                                    reg = <1>;
+                                    remote-endpoint = <&csi41isp1>;
+                            };
+                    };
+
+                    port@1 {
+                            reg = <1>;
+                            isp1vin08: endpoint {
+                                    remote-endpoint = <&vin08isp1>;
+                            };
+                    };
+
+                    port@2 {
+                            reg = <2>;
+                            isp1vin09: endpoint {
+                                    remote-endpoint = <&vin09isp1>;
+                            };
+                    };
+
+                    port@3 {
+                            reg = <3>;
+                            isp1vin10: endpoint {
+                                    remote-endpoint = <&vin10isp1>;
+                            };
+                    };
+
+                    port@4 {
+                            reg = <4>;
+                            isp1vin11: endpoint {
+                                    remote-endpoint = <&vin11isp1>;
+                            };
+                    };
+
+                    port@5 {
+                            reg = <5>;
+                            isp1vin12: endpoint {
+                                    remote-endpoint = <&vin12isp1>;
+                            };
+                    };
+
+                    port@6 {
+                            reg = <6>;
+                            isp1vin13: endpoint {
+                                    remote-endpoint = <&vin13isp1>;
+                            };
+                    };
+
+                    port@7 {
+                            reg = <7>;
+                            isp1vin14: endpoint {
+                                    remote-endpoint = <&vin14isp1>;
+                            };
+                    };
+
+                    port@8 {
+                            reg = <8>;
+                            isp1vin15: endpoint {
+                                    remote-endpoint = <&vin15isp1>;
+                            };
+                    };
+            };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d36a86863b25335..c35a9c93da84f4f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11398,6 +11398,7 @@ L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
+F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
 F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
 F:	drivers/media/platform/rcar-vin/
 
-- 
2.31.1

