Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E88B936DB87
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240019AbhD1P0H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 11:26:07 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:56584 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237195AbhD1P0D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 11:26:03 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0E980404B4;
        Wed, 28 Apr 2021 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619623518; bh=ZuELJ6ATn+aQJhZHTtn05un1cSBEa9qDYpvqo1rZLMg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=GPKzhDf9P1PNnMRIaUgQu+a6j3YhuBh6vt+CJhl6TA3BQ0M0Q9Qe4TGf0a+hXo9E2
         3yQLlPbhGPkc0Ly7MR/fOpAzU5dvgvrgYXPJrE+uMsUuXZlO8zL5Vx3ixgmXGkGhAm
         J6c9CU3RcKKNDpO40RP7odOCbz6Z0ASfdDHq0CIYAwlqyMr/r41/TP6hZCEUKTJXpB
         +32SOW4q/I5pqBRLjR76fdFRJmaaUx0mV6EKxEJLGUyBPqDvkOS4rQor+pCH8JqiVM
         VuPstjenSZLS6bi02ECSZjzEPpC1MYUSywwI4zoLR2VjJZ5Ou+6HgFZEEppTSab426
         r0z/FnW4zX8KQ==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id 4DCA2A0063;
        Wed, 28 Apr 2021 15:25:16 +0000 (UTC)
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
Subject: [RFC 1/8] dt-bindings: media: Document Synopsys DesignWare HDMI RX
Date:   Wed, 28 Apr 2021 17:25:04 +0200
Message-Id: <21bdecce9dd0a8035d906af2242bc7e3495cc1b0.1618937288.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1618937288.git.nelson.costa@synopsys.com>
References: <cover.1618937288.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the bindings for the Synopsys DesignWare HDMI RX.

Signed-off-by: Jose Abreu <jose.abreu@synopsys.com>
Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
---
 .../devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
new file mode 100644
index 0000000..19c7dd4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare HDMI RX Controller and PHYs e405/e406 Device Tree Bindings
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
+    description: phandle to the configuration clock
+
+  clock-names:
+    const: cfg
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  phys:
+    maxItems: 1
+    description: phandle for the HDMI RX PHY
+
+  phy-names:
+    const: hdmi-phy
+
+  hdmi-phy@fc:
+    type: object
+    description: connection point for HDMI PHY
+    additionalProperties: false
+
+    properties:
+      compatible:
+        oneOf:
+          - const: snps,dw-hdmi-phy-e405
+          - const: snps,dw-hdmi-phy-e406
+
+      reg:
+        maxItems: 1
+
+      clocks:
+        maxItems: 1
+        description: phandle to the configuration clock
+
+      clock-names:
+        const: cfg
+
+      "#phy-cells":
+        const: 0
+
+      input-count:
+        description: Number of PHY input ports
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [1, 2, 3, 4]
+
+    required:
+      - compatible
+      - reg
+      - clocks
+      - clock-names
+      - "#phy-cells"
+      - input-count
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - "#address-cells"
+  - "#size-cells"
+  - phys
+  - phy-names
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi_rx0: hdmi-rx@0 {
+        compatible = "snps,dw-hdmi-rx";
+        reg = <0x0 0x10000>;
+        interrupts = <1 2>;
+
+        clocks = <&dw_hdmi_refclk>;
+        clock-names = "cfg";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        phys = <&hdmi_e405_phy>;
+        phy-names = "hdmi-phy";
+
+        hdmi_e405_phy: hdmi-phy@fc {
+                compatible = "snps,dw-hdmi-phy-e405";
+                reg = <0xfc>;
+
+                clocks = <&dw_hdmi_refclk>;
+                clock-names = "cfg";
+
+                #phy-cells = <0>;
+                input-count = <4>;
+        };
+    };
+  - |
+    hdmi_rx1: hdmi-rx@1 {
+        compatible = "snps,dw-hdmi-rx";
+        reg = <0x0 0x10000>;
+        interrupts = <1 2>;
+
+        clocks = <&dw_hdmi_refclk>;
+        clock-names = "cfg";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        phys = <&hdmi_e406_phy>;
+        phy-names = "hdmi-phy";
+
+        hdmi_e406_phy: hdmi-phy@fc {
+                compatible = "snps,dw-hdmi-phy-e406";
+                reg = <0xfc>;
+
+                clocks = <&dw_hdmi_refclk>;
+                clock-names = "cfg";
+
+                #phy-cells = <0>;
+                input-count = <4>;
+        };
+    };
-- 
2.7.4

