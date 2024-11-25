Return-Path: <linux-media+bounces-21977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2969D8492
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 12:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2EFC163533
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D89199947;
	Mon, 25 Nov 2024 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="ptyofG6g"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1802.securemx.jp [210.130.202.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547AA35;
	Mon, 25 Nov 2024 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534516; cv=none; b=jme9rGNx5Ye6ode0oOhGv58wJf150rb3vq7RBSjnXZb7fENbeJ/z6SeUdFlvaeFLckDrtVLm1mupvnOzsuDrxjsdJdudiURCNexVhR++NgqmIx1Z4gAgBG48wLKx6rXMJyJ2DgN402dwdFvFKQh51S/crT47Ic2x7trIXRn0AsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534516; c=relaxed/simple;
	bh=s2QBTYvjALWbK/9t34XSfK/DRgxA5dhcbwCLcFUYzbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t1Lg6glUQrQEq5GAIl8I3MeqGr1WePP5lXG9BvG+Z9f/r8hs1Ps9NTkiWAoMEw2ZjxQ7xpRJsGBnu77bIlbXhP7VBzpRbJkhIvwstQUys7ZgUR4eEzxpBomMmvJbQzFpbfI0rt9T7+BnBsTM2a2E4twORXRIyQ7uBjGY/3Yu83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=ptyofG6g; arc=none smtp.client-ip=210.130.202.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1802) id 4AP9RmHF2534971; Mon, 25 Nov 2024 18:27:48 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1732526832;x=1733736432;bh=s2QBTYvjALWbK/9t34XSfK/DRgxA5dhcbwCLcFUYzbo=;b=pty
	ofG6gvZXuTXmZGloaGRHFDN5vnjmOEroyjENtiofn8xO4VTjp1TLme5RC2i6D8x3XF0t0m8T9w7Ax
	eObOVKuKAH7pi/SsJ7ANV+MV6BWFBqbouVlZj4HaG8jW+vh1YfDx9t1jImAXui5x6rX/G28eqTtRy
	5ez1eumDiY5rFvYCj/es1wcgnRSm5/M6LTcL00EIdz1d+wSL2X9qcV4TGJzIAntKwhmHyrsf6Gsx+
	9v2kYeJIQDRaI4j+xqsjjoWCbhpo3v0VKpvpXsC+SmUdq1Mr/0VCfB2Xd/96ZHRXWL1/6z7D0dLY2
	gWYDXlRF9EAjG51TwXKBuivXBa19y3A==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 4AP9RCWA2549162; Mon, 25 Nov 2024 18:27:12 +0900
X-Iguazu-Qid: 2yAb1JZRvDQIMBFaAK
X-Iguazu-QSIG: v=2; s=0; t=1732526831; q=2yAb1JZRvDQIMBFaAK; m=N3BxzmwQ7zs0tp7sqbG9wCdMkvuwdICtP93CLzazhJo=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1802) id 4AP9R9Gm4129038
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:10 +0900
X-SA-MID: 32872668
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add Toshiba Visconti MIPI CSI-2 Receiver
Date: Mon, 25 Nov 2024 18:21:39 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the Device Tree binding documentation that allows to describe
the MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---

Changelog v12:
- Newly add bindings for CSI2RX driver 

 .../media/toshiba,visconti5-csi2rx.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml

diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
new file mode 100644
index 000000000000..5488072bc82a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/toshiba,visconti5-csi2rx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description: |-
+  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI CSI-2 video
+  stream. Use with VIIF device. T.B.D
+
+properties:
+  compatible:
+    const: toshiba,visconti5-csi2rx
+
+  reg:
+    items:
+      - description: Registers for CSI2 receiver control
+
+  interrupts:
+    items:
+      - description: CSI2 Receiver Interrupt
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port node, single endpoint describing the CSI-2 transmitter.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: CSI2 receiver supports 1, 2, 3 or 4 data lanes
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
+          Output port node, single endpoint describing the Visconti VIIF.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi2rx@1c008000 {
+            compatible = "toshiba,visconti5-csi2rx";
+            reg = <0 0x1c008000 0 0x400>;
+            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    csi2rx_in0: endpoint {
+                        data-lanes = <1 2>;
+                        remote-endpoint = <&imx219_out0>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    csi2rx_out0: endpoint {
+                        remote-endpoint = <&csi_in0>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.25.1



