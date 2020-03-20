Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D9318CE7D
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 14:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgCTNND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 09:13:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44759 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgCTNND (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 09:13:03 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jFHSP-0001XK-9x; Fri, 20 Mar 2020 14:13:01 +0100
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, kernel@pengutronix.de,
        devicetree@vger.kernel.org
Subject: [PATCH v6 1/4] media: dt-bindings: Document i.MX8MQ VPU bindings
Date:   Fri, 20 Mar 2020 14:12:53 +0100
Message-Id: <20200320131256.23294-2-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320131256.23294-1-p.zabel@pengutronix.de>
References: <20200320131256.23294-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add devicetree binding documentation for the Hantro G1/G2 VPU on i.MX8MQ.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v5:
 - Drop i.MX8MM bindings
 - Change example node name to video-codec
 - Convert to YAML
---
 .../bindings/media/nxp,imx8mq-vpu.yaml        | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
new file mode 100644
index 000000000000..a2d1cd77c1e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/nxp,imx8mq-vpu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Hantro G1/G2 VPU codecs implemented on i.MX8MQ SoCs
+
+maintainers:
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description:
+  Hantro G1/G2 video decode accelerators present on i.MX8MQ SoCs.
+
+properties:
+  compatible:
+    const: nxp,imx8mq-vpu
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: g1
+      - const: g2
+      - const: ctrl
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: g1
+      - const: g2
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: g1
+      - const: g2
+      - const: bus
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+
+examples:
+  - |
+        #include <dt-bindings/clock/imx8mq-clock.h>
+        #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+        vpu: video-codec@38300000 {
+                compatible = "nxp,imx8mq-vpu";
+                reg = <0x38300000 0x10000>,
+                      <0x38310000 0x10000>,
+                      <0x38320000 0x10000>;
+                reg-names = "g1", "g2", "ctrl";
+                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+                             <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "g1", "g2";
+                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+                         <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
+                         <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+                clock-names = "g1", "g2", "bus";
+                power-domains = <&pgc_vpu>;
+        };
-- 
2.20.1

