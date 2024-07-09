Return-Path: <linux-media+bounces-14716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F6792AD6F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 02:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4CEFB213FE
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 00:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FABC2B9DA;
	Tue,  9 Jul 2024 00:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="PIoj5GCY"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1121.securemx.jp [210.130.202.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FB2629D;
	Tue,  9 Jul 2024 00:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720486608; cv=none; b=RB2RCsgid5IY0bungbdAld7IiQES4hnAtj4IbvRTS4WqeFeYpoWjeyBL3N56MvbhBam65oLx8qTqzJsFJBf7XjGZ67mBk6R63972vqa1HitWdofumbxqLHb1CT7JSunJu/DxSN9KCk4cjGOXQ+ZvtQGwvP16y8Q2D853NpkbXkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720486608; c=relaxed/simple;
	bh=k54OwyzEI9CQ5Jv14pCG4WNSPzFTk/etUxtTuHqboYs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FYEZJbZGklmy2sTNIangAC5XzjjbnWMIE81C7Hm9vMb8NQjbX7q1TLiLp1K4FVBjpCFg5xoKqVps2QBF6/mhM+ZrSvWcKW0My5wHLkCDKZQzF12P30U7SS3x8KHln4KNT5CBidMl7qtdt2MELnpfLxISYgcem70byR+5NKLJQ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=PIoj5GCY; arc=none smtp.client-ip=210.130.202.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1121) id 4690FHsx2760176; Tue, 9 Jul 2024 09:15:17 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1720484070;x=1721693670;bh=k54OwyzEI9CQ5Jv14pCG4WNSPzFTk/etUxtTuHqboYs=;b=PIo
	j5GCYVAWegKFzfdu+8mc0Woklf8y/NZlUoEL6KziyRW3EHJRGymM+LjSNJbUjwK0vIbr2hyxe4ZM+
	LVLwSNWMKqH1IMeL+iSSP6OPPK/zfuYNKvPYdHWXcWvSCZcEmW7C60l+Ci5Pbd32Ey6bih5s73U2A
	gUx90z7rauWGLokxDNylPQSz0IUvmvrme+CxqDaK81WiY3eSVkPmlQ4T6PmeL4dDvXL2J7yaVVPtr
	GMd/UUPTH+Fs4rjmPKAXHS/RWJRbC6EY8/2Pvd6/yZY6EJ+iu2jymJDmWbzb7S8/ATqdG1VeBr6wg
	QVj0zOODgQW0lNjwTdRCgSEeinLbhDQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 4690ET8C3580465; Tue, 9 Jul 2024 09:14:29 +0900
X-Iguazu-Qid: 2rWgDT56m9icomVPkt
X-Iguazu-QSIG: v=2; s=0; t=1720484069; q=2rWgDT56m9icomVPkt; m=HHO3hzq3McyvrP3CuDTwfOPyk7CLTqRpdO7D0e7XGNQ=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1120) id 4690ERNe950929
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 09:14:27 +0900
X-SA-MID: 26358968
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 1/6] dt-bindings: media: platform: visconti: Add Toshiba Visconti Video Input Interface
Date: Tue,  9 Jul 2024 09:08:43 +0900
X-TSB-HOP2: ON
Message-Id: <20240709000848.1108788-2-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
References: <20240709000848.1108788-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the Device Tree binding documentation that allows to describe
the Video Input Interface found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changelog v2:
- no change

Changelog v3:
- no change

Changelog v4:
- fix style problems at the v3 patch
- remove "index" member
- update example

Changelog v5:
- no change

Changelog v6:
- add register definition of BUS-IF and MPU

Changelog v7:
- remove trailing "bindings" from commit header message
- remove trailing "Device Tree Bindings" from title
- fix text wrapping of description
- change compatible to visconti5-viif
- explicitly define allowed properties for port::endpoint

Changelog v8:
- Suggestion from Krzysztof Kozlowski
  - rename bindings description file
  - use block style array instead of inline style
  - remove clock-lane (as it is fixed at position 0)
  - update sample node's name
  - use lowercase hex for literals
- Suggestion from Laurent Pinchart
  - update description message port::description
  - remove port::endpoint::bus-type as it is fixed to <4>
  - remove port::endpoint::clock-lanes from example
  - add port::endpoint::data-lanes to required parameters list
  - fix sequence of data-lanes: <1 2 3 4> because current driver does not support data reordering
  - update port::endpoint::data-lanes::description
  - remove redundant type definition for port::endpoint::data-lanes

Changelog v9:
- place "required" after "properties"
- dictionary ordering of properties

Changelog v10:
- no change

Changelog v11:
- no change

 .../media/toshiba,visconti5-viif.yaml         | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml

diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
new file mode 100644
index 0000000000..97e8bda427
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/toshiba,visconti5-viif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti5 SoC Video Input Interface
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+description: |-
+  Toshiba Visconti5 SoC Video Input Interface (VIIF) receives MIPI CSI2 video
+  stream, processes the stream with image signal processors (L1ISP, L2ISP),
+  then stores pictures to main memory.
+
+properties:
+  compatible:
+    const: toshiba,visconti5-viif
+
+  reg:
+    items:
+      - description: Registers for capture control
+      - description: Registers for CSI2 receiver control
+      - description: Registers for bus interface unit control
+      - description: Registers for Memory Protection Unit
+
+  interrupts:
+    items:
+      - description: Sync Interrupt
+      - description: Status (Error) Interrupt
+      - description: CSI2 Receiver Interrupt
+      - description: L1ISP Interrupt
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: CSI-2 input port, with a single endpoint connected to the CSI-2 transmitter.
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            description: VIIF supports 1, 2, 3 or 4 data lanes
+            minItems: 1
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+          clock-noncontinuous: true
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - clock-noncontinuous
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - port
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
+        video@1c000000 {
+            compatible = "toshiba,visconti5-viif";
+            reg = <0 0x1c000000 0 0x6000>,
+                  <0 0x1c008000 0 0x400>,
+                  <0 0x1c00e000 0 0x1000>,
+                  <0 0x2417a000 0 0x1000>;
+            interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+
+            port {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                csi_in0: endpoint {
+                    clock-noncontinuous;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <456000000>;
+                    remote-endpoint = <&imx219_out0>;
+                };
+            };
+        };
+    };
-- 
2.25.1



