Return-Path: <linux-media+bounces-21971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EBB9D83C4
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88EEC286AE0
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17468193086;
	Mon, 25 Nov 2024 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="lvIL7ATL"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1801.securemx.jp [210.130.202.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C48192B90;
	Mon, 25 Nov 2024 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732531753; cv=none; b=Y6fqfRnn8ktX30CBamx2Mi8vVWuhXAM8b1xB3Tv5Cf4o5Kz5jDWRle+BcU9BIar+mWWOafQgQmXgpufp4UOF10xzrYUDKO+kVxUto4d2cCRf0DByh9SQXH1RwzRmBM/bjddyCzkrZm74g9AglrkBVjI3ROi34o3iunKWv/NpQk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732531753; c=relaxed/simple;
	bh=Qr2pR5iOFRSZ7+g1nq5Xf9e/SUtdQos9mUpQSfloGDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FUVjVsCjBxxAgtwf2amQIuZvRyj/dO2IASejRBlUlfJvndQ3rU2370OPZBSWlUWbvv1h6insymmqJikbT+/ad7YXkXV8+QHHRKUTPDLYawuMQ2LjkdWhHotRiSWljRLuqohullCADYcuV/6HgykghMr0GYOXnxIrXxaKzt0AkgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=lvIL7ATL; arc=none smtp.client-ip=210.130.202.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1801) id 4AP9RkbI2159794; Mon, 25 Nov 2024 18:27:47 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key2.smx;t=
	1732526832;x=1733736432;bh=Qr2pR5iOFRSZ7+g1nq5Xf9e/SUtdQos9mUpQSfloGDA=;b=lvI
	L7ATLHp6dSGjnKwSK8Da4e0uIogyTReWWuXo5KI0bM59tSckzXRoE2qzlW1hThceXYDpLFTjsDmqd
	LtC8ko4GmAltxivM3q3uq9FmXDdd7LWTOXT4gLxpx9GFblKkxyf04tIm38QWEn01CybXqDWBglxJy
	wfKH2It+dBRWwOwBXQCtrkDIv5+jtHfeDWFCOcOlTizfBXtaKZ4jK9sRMFmlr/Y86Ty2kBH1UFxZy
	UscyqlwwHknh3T67GJFs2mN7qWSO0z5JTMxQSRCdYtLXxZeDXQvrN9KNlQ8HRgGBAV48mKYyaZBKL
	EO+mcM50BA3FDWM03YI+cgEbqa92/cg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 4AP9RBDL023848; Mon, 25 Nov 2024 18:27:11 +0900
X-Iguazu-Qid: 2yAb1JZRvDQIMBFaAE
X-Iguazu-QSIG: v=2; s=0; t=1732526831; q=2yAb1JZRvDQIMBFaAE; m=/swN041lxFAH+9+RIDcVzDvhh2V5tx9Y49KeY+kjvec=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1801) id 4AP9R9Wd512264
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 18:27:10 +0900
X-SA-MID: 32872672
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
Subject: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add Toshiba Visconti Video Input Interface
Date: Mon, 25 Nov 2024 18:21:40 +0900
X-TSB-HOP2: ON
Message-Id: <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
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
the Video Input Interface found in Toshiba Visconti SoCs.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
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

 .../media/toshiba,visconti5-viif.yaml         | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml

diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
new file mode 100644
index 000000000000..ef0452a47e98
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
@@ -0,0 +1,95 @@
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
+          remote-endpoint: true
+
+        required:
+          - data-lanes
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
+                  <0 0x1c00e000 0 0x1000>,
+                  <0 0x2417a000 0 0x1000>;
+            interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+
+            port {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                csi_in0: endpoint {
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csi2rx_out0>;
+                };
+            };
+        };
+    };
-- 
2.25.1



