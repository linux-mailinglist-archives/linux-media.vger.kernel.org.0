Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A4728E22A
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 16:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgJNO2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 10:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgJNO2S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 10:28:18 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A3FAC061755;
        Wed, 14 Oct 2020 07:28:16 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l15so1796350wmh.1;
        Wed, 14 Oct 2020 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=weIE6We1hJd9ch8TFEG5vpxigW2zKw5InIOFN8JMq3E=;
        b=Gd0fWKchXZZRZilwXUqD5KvIYu8TmNIRYSXG5iMJRrlwqDi3zWtEL6E3d4VBa3pLgu
         icwvlpS1h/ttVvZWluJ9NpZ1ZbmA8BVEjqyXzwyb1Dc90jeKmPcPqKn/R2UaCIRxXW+j
         b93J19wjiK08sKt+H5nkaNjEolAOoiqQEL/sn6HwhTPJ2Kmuw1pkreDlKkOw4jlp96wg
         znHFwcc830lPv+gSQtT9an+oVini59qBnTrhUKrYlIbqt1zGNe2Pl+ymlKTGrDslwNB1
         C7cz+f0ADaGIIi6D+fVY3UMawmy54XVguFoWT80jpm2wCMCVAgBglVN01oIYKpWH2fJW
         eZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=weIE6We1hJd9ch8TFEG5vpxigW2zKw5InIOFN8JMq3E=;
        b=CivL/c4O5MphyiY9ixeYhMis2lF2Tkdw/zGJrQp4/vBnbbZIY5Nen3NpTrF/uXhyi+
         YFhSYlmv/F6T+6MMu5A99QL7PN1blaPGqQCmk0x3bs27Z1lzat2JO1AjmbXZUXwqY8u4
         XLiVTzKzkRY3ozTYQnKKUxMH20wRv/4klxIYf835UYMtvTwXeGkBKq1UOyLfemhVL46l
         F2Eeqbg9pFHH6rL2AS5a9sEPKyQ6ydGcDIk3grbWyGpsntuKji2HvW/WaTWA0wmS2VzE
         7WqVnwEdjzJdX4Mblo2INKATFv31yxSauFNF53MUttcX1SNfpCMHvHP6RN16Alze4okh
         INyg==
X-Gm-Message-State: AOAM533h3Kv8buWfzOoG+WSUH9nkF1ttDD96eOO4ZNXtiIPTsI0iSeyo
        V5utaY/Ycjqe4fKzqD1Y4Fo=
X-Google-Smtp-Source: ABdhPJxnLNxslG4ne2Uu8W1FfuxKSWoGuk1OsNubMXXtEiRzQfQNmDPRSnKaVgOpiB/Ak8asv4rJ6Q==
X-Received: by 2002:a7b:c1c2:: with SMTP id a2mr3659049wmj.23.1602685695126;
        Wed, 14 Oct 2020 07:28:15 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id g5sm4068702wmi.4.2020.10.14.07.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 07:28:14 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 2/3] dt-bindings: imx7-csi: convert bindings to yaml
Date:   Wed, 14 Oct 2020 15:27:58 +0100
Message-Id: <20201014142759.726823-3-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014142759.726823-1-rmfrfs@gmail.com>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
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

