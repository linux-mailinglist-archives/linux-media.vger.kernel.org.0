Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2CA2942A6
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437913AbgJTTBf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390864AbgJTTBf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:01:35 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A07CCC0613CE;
        Tue, 20 Oct 2020 12:01:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y12so3561108wrp.6;
        Tue, 20 Oct 2020 12:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=grGm9RnPrgjuYxcel2QgBtgp0qVpOagR72abqGZuq0s=;
        b=VN+AL05Hi98bj6gN6OStd1f4kdxwSNcwyLgPCPqyvfedA5ayM1joP/UE1UrMzGEBxR
         8SvtQPLhPugALbqOlv8PshZynBPSz1NwXB6iXuVcg6SWSlgJ2mfJS3PTz1vL1Ve0gQCV
         D/qqRGjKWAx1L74nxbqcZT8OU5HmMSfDpTIaCD14qlT0WzKyDIEni5wUqAVoo3+3iqnd
         unXmeuPgq6nPNcdt2twocOYBC/E3hVN04FB9cwSpmYLAzfO0d0vQJh1jMrzX8VVlC8dh
         vI3eDazcvg/0cL2CqwodvAeNWfKlL/SizQhv6u+LNA592aT7QHn5Lz1uVPc4qaIvjzae
         KGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=grGm9RnPrgjuYxcel2QgBtgp0qVpOagR72abqGZuq0s=;
        b=h1Whx/m3qeyZlk4nd3sc/JTRJsG8K/IWy3uH0gtIf/g1vBAdYMlfz1aQAwocYdC3Aj
         2rbfdl/4eEfrUsuqSyibaeDtgYJ2RrYBBmvuOcP/GpjiNZWRwdyM4yxlwrDzdyVkvMYO
         Mf8rGIWm6U63G224r9Y6ZrGdDzjVCfp5bcj3g9v49vnV5+Bdy6oV2AN2o0Tr5LfQqhEN
         iEuoB+yePco70loW9upwrzsnxNLzKokNiniCyGG/643T50ob+XgiaetOgIVAC226Pvw6
         eJqXd23coBjq5wRUQyp4fycnMwRytpXcQJscJ3jRdQoWrf4lwNjYw3WL2DAgV+YyzVpj
         iheA==
X-Gm-Message-State: AOAM532eiEVKA4DPJSFD4V/f3q1wR6FSw7SCqkGH1J1mTAzhd2jBuxVk
        09iRuB4m+iGPhLCdnSadSZg=
X-Google-Smtp-Source: ABdhPJwEeDWRZ6qzORbusR8f6kwhv247kojQvQaCxBIiNALL89N8gptmhpiERapgMEgREjrS9pgp7A==
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr5161730wrg.83.1603220493334;
        Tue, 20 Oct 2020 12:01:33 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c18sm4279289wrq.5.2020.10.20.12.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 12:01:32 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 2/3] dt-bindings: imx7-csi: convert bindings to yaml
Date:   Tue, 20 Oct 2020 20:00:50 +0100
Message-Id: <20201020190051.1852778-3-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020190051.1852778-1-rmfrfs@gmail.com>
References: <20201020190051.1852778-1-rmfrfs@gmail.com>
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

