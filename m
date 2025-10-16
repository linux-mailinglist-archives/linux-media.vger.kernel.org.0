Return-Path: <linux-media+bounces-44651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 13608BE1435
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 04:31:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8DF84E8F06
	for <lists+linux-media@lfdr.de>; Thu, 16 Oct 2025 02:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755E618DB2A;
	Thu, 16 Oct 2025 02:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="BQzSpDny"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw.securemx.jp (mo-csw1120.securemx.jp [210.130.202.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8300D1E487;
	Thu, 16 Oct 2025 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760581840; cv=none; b=pRUINcp2hk77T0EnRsp7MOGes63pfYjypX8PHlW3ALIHEMjBOoHnWviLMK/SkfR8kTTKM39OOjjo/2FPcK/9Mpppbq5/8TOJyLoKXJb0pFX6/7Vg+c5phOD6rbSrTSWIxEloeKk9bMmeXYh+vQ7cT7ZCmCi7tK7/z6NGN3xGXik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760581840; c=relaxed/simple;
	bh=2jNEsI2NMRmLujtXcsga+d3gEU9/ECwIaAeLpIEWDgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+i3QJI6Vimwz8RUTK48mDt4p1ZfcK4Bm1OwU6vshZwhl0OuO4UQ2sUKE6ddlJxI2Z1vipRoi90CIEYjOKHTl8rw6obbDuye+sjii3J6nuIyiR8MFS68A+GQ2mZ/3GgvSGJswoyVJUxtyuOopv460W2p621eNbRXOh6tYCbd2hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=BQzSpDny; arc=none smtp.client-ip=210.130.202.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:Date:
	Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1760581818;x=1761791418;bh=2jNEsI2NMRmLujtXcsga+d3gEU9/ECwIaAeLpIEWDgQ=;b=BQz
	SpDnyLQ3USDOwC9Zme9pD+HlzjQ6HblQoOLTuFmyrbSyunqyAatTePVmQH4bItUkDTkr3x6kHBtit
	+EKliiIDvOlmg7+76LuRgWMzXKTYS142HsbAWOhIs+b9Tf2v8YLvG2paL5UtHHdAfB1LHb0W7eHcO
	0zAQVqI+JfuUcaOVnveSj8miNm/tJkp1uxwcyLFR7W8nsmiM5+Z46XvtTsjjFRfDE+BfDEtZ6rYPt
	Cg9ljEhxXQo4qmqpMpvXOETajCUHTPamK6je8yAu+wnhrSN3+jEx4g/KBFmqc7cbC5WQRf/3YZVqZ
	cKA+r0fv/ugl+JWCTMnrFRQ0pNN8FQQ==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 59G2UIO9624595; Thu, 16 Oct 2025 11:30:18 +0900
X-Iguazu-Qid: 2rWhxZoCOwl4VuVAys
X-Iguazu-QSIG: v=2; s=0; t=1760581817; q=2rWhxZoCOwl4VuVAys; m=LEpAMaugEqPGCJ/KcarQv085ROL6Bf0qU1deVsQRS7I=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cnBkd3KRFz1xnj; Thu, 16 Oct 2025 11:30:17 +0900 (JST)
X-SA-MID: 53072909
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 16 Oct 2025 11:24:39 +0900
Subject: [PATCH v13 2/7] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TSB-HOP2: ON
Message-Id: <20251016-visconti-viif-v13-2-ceca656b9194@toshiba.co.jp>
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
the Video Input Interface found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
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

Changelog v12:
- remove property "clock-noncontinuous" as VIIF switches both modes automatically
- remove property "link-frequencies" as VIIF does not use the information
- remove reg[2] and interrupts[3] which are used for CSI2RX driver
- update example to refer csi2rx for remote-endpoint

Changelog v13:
- add entries to MAINTAINERS flle
- update email address of Nobuhiro Iwamatsu in /maintainers
- add Yuji Ishikawa to /maintainers
- remove "|-" from /description
- add definitions of clock and reset
- update /port/$ref to point port instead of port-base
- update /port/description
- remove CSI2 receiver specific definition from /port/properties/endpoint/properties because CSI2 is handled by the CSI2 driver.
- update sample dts
---
 .../bindings/media/toshiba,visconti5-viif.yaml     | 110 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
new file mode 100644
index 000000000000..92ffe844cdde
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/toshiba,visconti5-viif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti5 SoC Video Input Interface
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
+  - Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
+
+description:
+  Toshiba Visconti5 SoC Video Input Interface (VIIF) receives videostream
+  from MIPI CSI-2 receiver device, processes the stream with image signal
+  processors (L1ISP, L2ISP), then stores pictures to main memory.
+
+properties:
+  compatible:
+    const: toshiba,visconti5-viif
+
+  reg:
+    items:
+      - description: Registers for capture control
+      - description: Registers for bus interface unit control
+      - description: Registers for Memory Protection Unit
+
+  interrupts:
+    items:
+      - description: Sync Interrupt
+      - description: Status (Error) Interrupt
+      - description: L1ISP Interrupt
+
+  clocks:
+    items:
+      - description: Common clock
+      - description: Interface clock
+      - description: L1ISP clock
+      - description: L2ISP clock
+
+  clock-names:
+    items:
+      - const: bsproc
+      - const: proc
+      - const: l1isp
+      - const: l2isp
+
+  resets:
+    items:
+      - description: Interface reset
+      - description: L1ISP reset
+      - description: L2ISP reset
+
+  reset-names:
+    items:
+      - const: core
+      - const: l1isp
+      - const: l2isp
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Input port node with an endpoint pointing to the CSI-2 receiver.
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
+    #include <dt-bindings/clock/toshiba,tmpv770x.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video0: video@1c000000 {
+            compatible = "toshiba,visconti5-viif";
+            reg = <0 0x1c000000 0 0x6000>,
+                  <0 0x1c00e000 0 0x1000>,
+                  <0 0x2417a000 0 0x1000>;
+            interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&pismu TMPV770X_CLK_VIIFBS0_PROC>,
+                     <&pismu TMPV770X_CLK_VIIF0_PROC>,
+                     <&pismu TMPV770X_CLK_VIIF0_L1ISP>,
+                     <&pismu TMPV770X_CLK_VIIF0_L2ISP>;
+            clock-names = "bsproc", "proc", "l1isp", "l2isp";
+            resets = <&pismu TMPV770X_RESET_VIIFBS0>,
+                     <&pismu TMPV770X_RESET_VIIFBS0_L1ISP>,
+                     <&pismu TMPV770X_RESET_VIIFBS0_L2ISP>;
+            reset-names = "core", "l1isp", "l2isp";
+
+            port {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                video0_in: endpoint {
+                    remote-endpoint = <&csi0_out>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e4634a0aad74..c17c7ddba5af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25985,6 +25985,7 @@ M:	Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/toshiba,visconti5-csi2.yaml
+F:	Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
 
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>

-- 
2.34.1



