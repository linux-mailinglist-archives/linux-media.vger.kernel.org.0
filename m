Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430632929C5
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 16:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbgJSOtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 10:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729645AbgJSOtj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 10:49:39 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED29C0613CE;
        Mon, 19 Oct 2020 07:49:39 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k21so168210wmi.1;
        Mon, 19 Oct 2020 07:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8LaJT1t/uhPX8iNdB8F5JFFUaJrvQ94tvYAIagtEtDo=;
        b=nQxbIp2EgKI39CqBKYfrzRxKpV3NM/fUwEYpEANrBNnf1CrhXngiFlJhoUEfFPBDbA
         b8FMH27SNwxtAPLwBsPvAcaBR+VQjzPmRRPcAzcInZvP73QMqzO8UpHd0Mkq7eYo8BTK
         9FZO3PFPynXoqArIYl5hulzj2TBYqSgzheof5Kx4roYHgpVhqW7F3PbLxnAjcQW7XjqN
         KGH0+o50xUDZaQJvgLdGkia3iYoKSNfj3GyjSkqvI2xRENazoxOl7QkdL8UAGctn+OA5
         pT+FJd7QbaWcZGGTZqXCWE9kzKIbvezDAWNSt45GMZOm8OnNT0l+qorqKGg0I7NMxK05
         7HPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8LaJT1t/uhPX8iNdB8F5JFFUaJrvQ94tvYAIagtEtDo=;
        b=aMub0bB3YkLktX0UrjxKr6EYJtmbk0qQrOY96l5SmTM55yfeCRCFW5f3XpEuNWCEz5
         8sDVslOl1tx51AFPHaaAvjB26qpcJKIatscDjPndOh2CRrD4AKrLbavL6cxmQloBcdHq
         FsNPYRbdyVG1wuJvdfoP/SJxeZpW4nF98YO1QAJc7yGRm0Xu+VNNStse2xoFbug1LcSq
         SjQP84OJxV8kKnDdUUs9yTEWFW7EqOxUwmoTUf/59Ncq1ar1HpQw0XeeFmJ4We4iT/hc
         imlERA5orypLeXXCRHwfYVl9xGW0gc1wk4u+xPPF7aLZa49iIQWjg+U1a5pqqWaF6NYt
         6KkQ==
X-Gm-Message-State: AOAM532gkjzUqbq3y+2sfdJECIwhMTD4HKjMV5LkIbC2KXfAA7juY1lZ
        Dw8FadwAH9da3oP1Agkw2DQ=
X-Google-Smtp-Source: ABdhPJycA85a+LoEiw6YX6Crp/iy9SbExL2qOJZCg9UGX19WvXbpTOcGz2MyWNH0aTWrZJPWWWuipg==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr17214316wmk.136.1603118978016;
        Mon, 19 Oct 2020 07:49:38 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id d4sm18319243wrp.47.2020.10.19.07.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 07:49:37 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 2/3] dt-bindings: imx7-csi: convert bindings to yaml
Date:   Mon, 19 Oct 2020 15:49:24 +0100
Message-Id: <20201019144925.1627715-3-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019144925.1627715-1-rmfrfs@gmail.com>
References: <20201019144925.1627715-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert imx7-csi bindings documentation to yaml schema, remove the
textual bindings document and update MAINTAINERS entry.

Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
v2 -> v3:
    https://lore.kernel.org/linux-media/20201015144905.4b23k5uy7ycuhvlo@uno.localdomain/
    - fix dual license
    - rearrange ports properties
    - add Jacopo Reviewed-by tag

 .../devicetree/bindings/media/imx7-csi.txt    | 42 -----------
 .../bindings/media/nxp,imx7-csi.yaml          | 71 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 72 insertions(+), 43 deletions(-)
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
index 000000000000..4e81a47e60ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+    description:
+      A node containing input port nodes with endpoint definitions as documented
+      in Documentation/devicetree/bindings/media/video-interfaces.txt
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
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
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 2cb2a5c60a1d..557713b3ee95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10779,8 +10779,8 @@ L:	linux-media@vger.kernel.org
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

