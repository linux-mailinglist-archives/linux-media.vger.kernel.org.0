Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1F6738B39D
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 17:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241644AbhETPtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 11:49:45 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45096 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239131AbhETPtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 11:49:41 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2585FC06AB;
        Thu, 20 May 2021 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1621525699; bh=z81DeKSKri9DqTSD8pXM6mMeptAEtqDUsinYUan7qOc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=TNZXs6Er9ImEym/zHgmaXfxNPV0nEd2gCouX2s/dX8qprKDvGzWPewjb+q69cXqAP
         8KtTWt5YXFKPcRUE+p5FrPjGdghMapACmZdan00ggzbc3VAT17r9LZhlO2tFCuqaV5
         92SJ92bE1jtfGpilbR8Z7AEqcjVZBDePkigjoDV9nsrKHS7dpvjljY35ifordWbCX5
         gYuGAjl8kkrwQyzyjsK96cbaQnGaxMRe4/BDlKwM4k83PY8B2xLIhOzJJkKNBYHzyw
         oY/TcgLhBxoQu/CSsP4az9E5WpqXGyiNi5IsrSkyM6W/DMnzdBqMnroo7xWIL/GWwl
         ZkrlpV006FS9A==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id C9608A0061;
        Thu, 20 May 2021 15:48:17 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From:   Nelson Costa <Nelson.Costa@synopsys.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Nelson Costa <Nelson.Costa@synopsys.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [RFC v2 2/9] dt-bindings: media: Document Synopsys DesignWare HDMI RX
Date:   Thu, 20 May 2021 17:47:56 +0200
Message-Id: <a5a52c738db7a4b3125225ac27e5aaff19604aec.1621524721.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1621524721.git.nelson.costa@synopsys.com>
References: <cover.1621524721.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1621524721.git.nelson.costa@synopsys.com>
References: <cover.1621524721.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the device tree bindings for the Synopsys DesignWare HDMI RX
Controller.

Signed-off-by: Jose Abreu <jose.abreu@synopsys.com>
Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
---
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
new file mode 100644
index 0000000..4f2169e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare HDMI RX Controller Device Tree Bindings
+
+maintainers:
+  - Jose Abreu <jose.abreu@synopsys.com>
+  - Nelson Costa <nelson.costa@synopsys.com>
+
+description: |
+  The Synopsys DesignWare HDMI RX Controller and PHYs e405/e406 is an HDMI 2.0
+  Receiver solution that is able to decode video and audio.
+
+properties:
+  compatible:
+    const: snps,dw-hdmi-rx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: |
+      phandle to the configuration clock
+
+  clock-names:
+    const: cfg
+
+  phys:
+    maxItems: 1
+    description: |
+      phandle for the HDMI RX PHY
+
+  phy-names:
+    const: hdmi-phy
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: |
+      Input port node, multiple endpoints describing the HDMI RX data connected
+      to the HDMI PHY receiver.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi_rx: hdmi-rx@0 {
+        compatible = "snps,dw-hdmi-rx";
+        reg = <0x0 0x10000>;
+        interrupts = <1 2>;
+
+        clocks = <&dw_hdmi_refclk>;
+        clock-names = "cfg";
+
+        phys = <&hdmi_e406_phy>;
+        phy-names = "hdmi-phy";
+
+        port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            hdmi_rx_0: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&hdmi_e406_phy_0>;
+            };
+
+            hdmi_rx_1: endpoint@1 {
+                reg = <1>;
+                remote-endpoint = <&hdmi_e406_phy_1>;
+            };
+
+            hdmi_rx_2: endpoint@2 {
+                reg = <2>;
+                remote-endpoint = <&hdmi_e406_phy_2>;
+            };
+
+            hdmi_rx_3: endpoint@3 {
+                reg = <3>;
+                remote-endpoint = <&hdmi_e406_phy_3>;
+            };
+        };
+    };
-- 
2.7.4

