Return-Path: <linux-media+bounces-44660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C2BE169E
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 06:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 306404E356D
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36ED219A67;
	Thu, 16 Oct 2025 04:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="aVHzry1a"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1802.securemx.jp [210.130.202.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87399323E;
	Thu, 16 Oct 2025 04:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760588047; cv=none; b=dNp12qXzToxRlEyL/XrVlBpsBH3k2ojsuU031o7ZRgKbKSoytIH8DgBTj1FpTnZ4S29+8vyAwUoULHlCv0b1p4xm0uEJnNAie/vDRK+QZ76SybIu5z+b16XjRpdK/qwRXC1HPktBpCMvZ+KnrgwJ20/Tmvko+3o+GnI70Wp2q2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760588047; c=relaxed/simple;
	bh=4eMEvvInNJVezn6qKbiFKfyhSEC25c8IQvCxXUyLOzY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3IhfpXD6Fpfucu5bEoVdAaCg2dkqqpZuBsKWBqIH92uUJijioC31gp0AY1+29aJb/K24HliOqGZBw0Tml+/hQLgZePqy8P7viK90DHofiESQmPx3f/aBsnmE25OvPrnduO+2+ILC8BC3CHXaQLHqDKAHrvUq8+WkJP7RTguS3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=aVHzry1a; arc=none smtp.client-ip=210.130.202.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1802) id 59G2Um9k3101334; Thu, 16 Oct 2025 11:30:49 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:Date:
	Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760581818;x=1761791418;bh=4eMEvvInNJVezn6qKbiFKfyhSEC25c8IQvCxXUyLOzY=;b=aVH
	zry1au3936erVN/c2lpUwz7FOopKQqoeojGkhqYGyyoGJPTEt0Ilo5IEhAKrZO86416jxiQRqS58F
	b1i8WaAOxl5WLXtHhvEDhgzfk5kZH2HTVvwBfEJxnH0Xc4RYJjlDYqJcVn9tokZOG4B65aF5jsXob
	Gs5aSrx2E7rOjMgPJkt51d5+mKva/bbPqJGRMKlXF6+I6k/MVFZWzQJXZ1qglO8f5zzScUJcdhMWb
	/5UVV9fzf/kf+q4N6hgF7YhOXfAi6eCDq1IOf8sCbVr9OZUCr+nnnNbcTie4VOFls4y0sOb3VLyIg
	W45xUWSNSqHqap3E8fyCjgaOibh+UXQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 59G2UHnN1823703; Thu, 16 Oct 2025 11:30:18 +0900
X-Iguazu-Qid: 2yAbDoX6m4uSGDnER1
X-Iguazu-QSIG: v=2; s=0; t=1760581817; q=2yAbDoX6m4uSGDnER1; m=IDxflAj8nPPKWdhIPiFRPmkpXWRzuaZN/qYu0wh2ay4=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cnBkd2DzQzyPd; Thu, 16 Oct 2025 11:30:17 +0900 (JST)
X-SA-MID: 53072906
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 16 Oct 2025 11:24:38 +0900
Subject: [PATCH v13 1/7] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TSB-HOP2: ON
Message-Id: <20251016-visconti-viif-v13-1-ceca656b9194@toshiba.co.jp>
References: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
In-Reply-To: <20251016-visconti-viif-v13-0-ceca656b9194@toshiba.co.jp>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Adds the Device Tree binding documentation that allows to describe
the MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v12:
- Newly add bindings for CSI2RX driver

Changelog v13:
- add entries to MAINTAINERS file.
- update email address of Nobuhiro Iwamatsu in /maintainers
- add Yuji Ishikawa to /maintainers
- change /properties/compatible: toshiba,visconti5-csi2rx -> toshiba,visconti5-csi2
- change bindings file name: toshiba,visconti5-csi2rx -> toshiba,visconti5-csi2
- change node name in sample DTS: csi2rx -> csi
- remove "|-" from /description
- update /description
- add definitions of clock and reset
- update /properties/ports/properties/port@0/description for better comment
- update /properties/ports/properties/port@0/$ref to specify full pathname
- remove /properties/ports/properties/port@0/properties/endpoint/properties/data-lanes/description because the default text provides enough information.
- update sample dts
---
 .../bindings/media/toshiba,visconti5-csi2.yaml     | 125 +++++++++++++++++++++
 MAINTAINERS                                        |   7 ++
 2 files changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
new file mode 100644
index 000000000000..21fb46de5b6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/toshiba,visconti5-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
+  - Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
+
+description:
+  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI CSI-2 video
+  stream. The obtained video stream is used as input for the Visconti5 VIIF.
+
+properties:
+  compatible:
+    const: toshiba,visconti5-csi2
+
+  reg:
+    items:
+      - description: Registers for CSI2 receiver control
+
+  interrupts:
+    items:
+      - description: CSI2 Receiver Interrupt
+
+  clocks:
+    items:
+      - description: MIPI DPHY configuration clock
+      - description: Register access clock
+
+  clock-names:
+    items:
+      - const: cfg
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node, with an endpoint pointing to the image sensor.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port node, with an endpoint pointing to the Visconti VIIF.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/toshiba,tmpv770x.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi0: csi@1c008000 {
+            compatible = "toshiba,visconti5-csi2";
+            reg = <0 0x1c008000 0 0x400>;
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&pismu TMPV770X_CLK_VIIFBS0_CFG>,
+                     <&pismu TMPV770X_CLK_VIIFBS0_APB>;
+            clock-names = "cfg", "apb";
+            resets = <&pismu TMPV770X_RESET_VIIFBS0_APB>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    csi0_in: endpoint {
+                        data-lanes = <1 2>;
+                        remote-endpoint = <&imx219_out>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    csi0_out: endpoint {
+                        remote-endpoint = <&video0_in>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..e4634a0aad74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25979,6 +25979,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA VISCONTI VIIF DRIVER
+M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
+M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org

-- 
2.34.1



