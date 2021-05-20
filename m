Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791B438B39A
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 17:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241396AbhETPtn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 11:49:43 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45090 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239128AbhETPtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 11:49:41 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 215A2C06A6;
        Thu, 20 May 2021 15:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1621525699; bh=87hJyrxMvoFsZVKKPTNltIEwtsJBX5wGxSe+YuT5l2I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
         References:From;
        b=eIGD+KYFIE6QuwwfQ2hn4jysnNuRWrW1bzvwc1nSuf/ES+Hry3t44qlPc+M6gqMJp
         wsfH06iiaK/Fic95nEXUbHM2obFauANkjm0A+CdaZiNQXvYxZZhsXMiKhM6q+n7kno
         zirMikfUwuoUhMw3H+XcMGtIjuRBsNBW6crnm1D3DXPk3s9e8cGUrw20SNxcEKpimT
         F1BAXQIJzixRSF/hpeUP1K118TH91k6Pjtn5sNdTwNWPup4q1QlQAjt5jhkx+hoLqs
         4TbkZe1Typzh/hzLvf0lsg9JhGXBe71K+aPnf9+5GgowjXBqY4lF7A+j1GOZ6T8BKa
         uVkc3jQGTS6GA==
Received: from de02dwvm009.internal.synopsys.com (de02dwvm009.internal.synopsys.com [10.225.17.73])
        by mailhost.synopsys.com (Postfix) with ESMTP id C0BA3A005D;
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
        Nelson Costa <Nelson.Costa@synopsys.com>
Subject: [RFC v2 1/9] dt-bindings: phy: Document Synopsys DesignWare HDMI RX PHYs e405 and e406
Date:   Thu, 20 May 2021 17:47:55 +0200
Message-Id: <570d5fa01a17be017346262b8a9b06d36bebe8f1.1621524721.git.nelson.costa@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1621524721.git.nelson.costa@synopsys.com>
References: <cover.1621524721.git.nelson.costa@synopsys.com>
In-Reply-To: <cover.1621524721.git.nelson.costa@synopsys.com>
References: <cover.1621524721.git.nelson.costa@synopsys.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the device tree bindings for the Synopsys DesignWare HDMI RX
PHYs e405 and e406.

Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
---
 .../bindings/phy/snps,phy-dw-hdmi-e40x.yaml        | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/snps,phy-dw-hdmi-e40x.yaml

diff --git a/Documentation/devicetree/bindings/phy/snps,phy-dw-hdmi-e40x.yaml b/Documentation/devicetree/bindings/phy/snps,phy-dw-hdmi-e40x.yaml
new file mode 100644
index 0000000..25bece5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/snps,phy-dw-hdmi-e40x.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/snps,phy-dw-hdmi-e40x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare HDMI PHYs e405/e406 Device Tree Bindings
+
+maintainers:
+  - Jose Abreu <jose.abreu@synopsys.com>
+  - Nelson Costa <nelson.costa@synopsys.com>
+
+description: |
+  The Synopsys DesignWare HDMI PHYs e405/e406 are HDMI 2.0 PHY Receivers that
+  receive video and audio, and send to the HDMI RX Controller.
+
+properties:
+  compatible:
+    oneOf:
+      - const: snps,dw-hdmi-phy-e405
+      - const: snps,dw-hdmi-phy-e406
+
+  reg:
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
+  "#phy-cells":
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: |
+      Output port node, multiple endpoints describing the PHY HDMI inputs data
+      connected to the HDMI RX Controller.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    parent {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+        hdmi_e406_phy: hdmi-phy@fc {
+            compatible = "snps,dw-hdmi-phy-e406";
+            reg = <0xfc>;
+
+            clocks = <&dw_hdmi_refclk>;
+            clock-names = "cfg";
+
+            #phy-cells = <0>;
+
+            port {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                hdmi_e406_phy_0: endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&hdmi_rx_0>;
+                };
+
+                hdmi_e406_phy_1: endpoint@1 {
+                    reg = <1>;
+                    remote-endpoint = <&hdmi_rx_1>;
+                };
+
+                hdmi_e406_phy_2: endpoint@2 {
+                    reg = <2>;
+                    remote-endpoint = <&hdmi_rx_2>;
+                };
+
+                hdmi_e406_phy_3: endpoint@3 {
+                    reg = <3>;
+                    remote-endpoint = <&hdmi_rx_3>;
+                };
+            };
+        };
+    };
-- 
2.7.4

