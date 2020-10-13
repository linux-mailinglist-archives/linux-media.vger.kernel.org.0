Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC42428D13A
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 17:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389384AbgJMP1I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 11:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389378AbgJMP1I (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 11:27:08 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D05C0613D2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 08:27:07 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id b127so69557wmb.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 08:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=weIE6We1hJd9ch8TFEG5vpxigW2zKw5InIOFN8JMq3E=;
        b=h0Wp/EHVo11qfprXyHqpwzH3PAjBPo2mLerZRxmuCE2q3pIFMFQFx/HaYK2AwTnoBe
         El2rNCFcakV9WNNqiqiED81ZPTVoJd7gFEi2zS20BlnaEdvYEJzI3P915YfLe7oz5Dds
         4s6v44mgXuXlL+O9/KZRzFnV4qH8Sbh1eMRQmdRbMzRM2eVkuizu65LHqmXO9WJu0I4N
         y6EG0lLAvajLJmaj9zQY/rQgooZssrZJhmSwiXOo+YWwC66QbBRNFLwA9hWnTHaZY5iL
         helsNrf8S0vCVYlh3ESqXIsYQEzxa51Gy7uqs7dgMM92OQlExp+i6QKh347Ka5c5TEvR
         gyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=weIE6We1hJd9ch8TFEG5vpxigW2zKw5InIOFN8JMq3E=;
        b=WWWQB3pcg4qejDyWp2x22Xt70T3xGwTBu53KeiJzVB0LQVSgk5ejFYJB7rtRFfqHAW
         uh+QVvPjVac30UtxbGA9pb7JUJoqcNQrIethejRJgnLX+AKzX+Q1ScBhEV6dicEo9di4
         nHi9iRmrE0Gr/bj3YhoJyN2n27noCAyXBYYqDP933uRAUVtqOrmJUxiTVacj00OralSc
         euvsOOsVQAfGY437brE9ULnJyco/ZmAsWmzomghDgPObOLFHb8QwVxfxCYOVqV2qZPGB
         zwZQW+o+Jm/VqAH8l2Yq9R4RuwJARdh4K8v7LOBUbTdYUi0ZYIZfKuikOttvAUVx7ee7
         JaUw==
X-Gm-Message-State: AOAM532yLEMauVdsMBZU0gBEFgrYM/qm1b9S1KZpATEVtNUbQp8gj+jv
        0foQztR+GB3lz2f7XbxZ/rQe/Q==
X-Google-Smtp-Source: ABdhPJwAbs9AfhegEr3x0CTkWxPz0+EfvDTSojuzOp+rXmc+KlbHtRqVDurzCeaaYOFmUyPb76LRyw==
X-Received: by 2002:a1c:dc43:: with SMTP id t64mr456066wmg.6.1602602826562;
        Tue, 13 Oct 2020 08:27:06 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z127sm111575wmc.2.2020.10.13.08.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 08:27:06 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 2/3] dt-bindings: imx7-csi: convert bindings to yaml
Date:   Tue, 13 Oct 2020 16:26:46 +0100
Message-Id: <20201013152647.537323-3-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013152647.537323-1-rmfrfs@gmail.com>
References: <20201013152647.537323-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert imx7-csi bindings documentation to yaml schema, remove the
textual bindings document and update MAINTAINERS entry.

Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 .../devicetree/bindings/media/imx7-csi.txt    | 42 ----------
 .../bindings/media/nxp,imx7-csi.yaml          | 84 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 85 insertions(+), 43 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-csi.txt
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml

diff --git a/Documentation/devicetree/bindings/media/imx7-csi.txt b/Documentation/devicetree/bindings/media/imx7-csi.txt
deleted file mode 100644
index d80ceefa0c00..000000000000
--- a/Documentation/devicetree/bindings/media/imx7-csi.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Freescale i.MX7 CMOS Sensor Interface
-=====================================
-
-csi node
---------
-
-This is device node for the CMOS Sensor Interface (CSI) which enables the chip
-to connect directly to external CMOS image sensors.
-
-Required properties:
-
-- compatible    : "fsl,imx7-csi" or "fsl,imx6ul-csi";
-- reg           : base address and length of the register set for the device;
-- interrupts    : should contain CSI interrupt;
-- clocks        : list of clock specifiers, see
-        Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
-- clock-names   : must contain "mclk";
-
-The device node shall contain one 'port' child node with one child 'endpoint'
-node, according to the bindings defined in:
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-In the following example a remote endpoint is a video multiplexer.
-
-example:
-
-                csi: csi@30710000 {
-                        #address-cells = <1>;
-                        #size-cells = <0>;
-
-                        compatible = "fsl,imx7-csi";
-                        reg = <0x30710000 0x10000>;
-                        interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-                        clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
-                        clock-names = "mclk";
-
-                        port {
-                                csi_from_csi_mux: endpoint {
-                                        remote-endpoint = <&csi_mux_to_csi>;
-                                };
-                        };
-                };
diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
new file mode 100644
index 000000000000..9fe064dd5ba3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX7 CMOS Sensor Interface
+
+maintainers:
+  - Rui Miguel Silva <rmfrfs@gmail.com>
+
+description: |
+  This is device node for the CMOS Sensor Interface (CSI) which enables the
+  chip to connect directly to external CMOS image sensors.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx7-csi
+      - fsl,imx6ul-csi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  port:
+    type: object
+    additionalProperties: false
+    description:
+      A node containing input port nodes with endpoint definitions as documented
+      in Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      endpoint:
+        type: object
+        additionalProperties: false
+
+        properties:
+          remote-endpoint: true
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
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx7d-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    csi: csi@30710000 {
+            compatible = "fsl,imx7-csi";
+            reg = <0x30710000 0x10000>;
+            interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clks IMX7D_CSI_MCLK_ROOT_CLK>;
+            clock-names = "mclk";
+
+            port {
+                    csi_from_csi_mux: endpoint {
+                            remote-endpoint = <&csi_mux_to_csi>;
+                    };
+            };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 926dcdc4794c..b7f7f14cd85b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10773,8 +10773,8 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/admin-guide/media/imx7.rst
-F:	Documentation/devicetree/bindings/media/imx7-csi.txt
 F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
+F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	drivers/staging/media/imx/imx7-media-csi.c
 F:	drivers/staging/media/imx/imx7-mipi-csis.c
 
-- 
2.28.0

