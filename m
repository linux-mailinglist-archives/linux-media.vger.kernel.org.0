Return-Path: <linux-media+bounces-32822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E44ABC172
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F58A7A2A53
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB1C284B42;
	Mon, 19 May 2025 14:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SWjT8KMl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B48280015;
	Mon, 19 May 2025 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666688; cv=none; b=F0CpS7bib5t3Nh//QoNuSYXEB9DyVd0lUaAXC8WZpA9HV0uaTLWKRpb3YdW5/HyshyChnJBahGRXTuzzLpkZNUyRp2vhf281Mkb8YalVyohsnpQxFKCFmzT541hfr/NDQUm2bPD6QIW1SN6ah0PLtCNrc4I3NlIu8+qcakwisiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666688; c=relaxed/simple;
	bh=dGy/uruh1KqSdXb1q5+NmZ3EcCXGhuT9NtwUulvpFOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DTZ2PpJq4qlJzNJeZwoCg3JggaL7PGINtPaAIfcw0KilfmhEFAvF5tykavfYaGcpqlHq4XC6J1Gbo1nVTk4qKT6QDX/h0k8FyHRZXqf2ULlRtohsicaUg4ofnqGokZHF1EywF5EvYJjrhn+ny5Bngux/yyWsXYlcG4gLij7BpF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SWjT8KMl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67B4F1116;
	Mon, 19 May 2025 16:57:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747666665;
	bh=dGy/uruh1KqSdXb1q5+NmZ3EcCXGhuT9NtwUulvpFOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SWjT8KMlY5tlyja8hAzAcR12Eodv7u1uAzWDh3QFilXVt4OTmv2ou/wFDhgdBdwtY
	 suA8ptxaQEcQ73HC48ua6KxD8uT1/FaeZax/DNzagt8qdWE/fm7yCSoVPNzfNqFw6L
	 YHpTPIVOFsf3GSGsOKFZ7HF6pXejtm6cSbphQhdY=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 1/3] dt-bindings: media: Add bindings for the RZ/V2H IVC block
Date: Mon, 19 May 2025 15:57:52 +0100
Message-Id: <20250519145754.454005-2-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519145754.454005-1-dan.scally@ideasonboard.com>
References: <20250519145754.454005-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/V2H SoC has a block called the Input Video Control block which
feeds image data into the Image Signal Processor. Add dt bindings to
describe the IVC.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 .../bindings/media/renesas,rzv2h-ivc.yaml     | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml

diff --git a/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
new file mode 100644
index 000000000000..29d522f7d365
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/renesas,rzv2h-ivc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H Input Video Control Block
+
+maintainers:
+  - Daniel Scally <dan.scally@ideasonboard.com>
+
+description:
+  The IVC block is a module that takes video frames from memory and feeds them
+  to the Image Signal Processor for processing.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-ivc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Input Video Control block register access clock
+      - description: Video input data AXI bus clock
+      - description: ISP system clock
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: vin_aclk
+      - const: sclk
+
+  resets:
+    items:
+      - description: Input Video Control block register access reset
+      - description: Video input data AXI bus reset
+      - description: ISP core reset
+
+  reset-names:
+    items:
+      - const: presetn
+      - const: vin_aresetn
+      - const: sresetn
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Output parallel video bus
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/properties/endpoint
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ivc: ivc@16040000 {
+      compatible = "renesas,r9a09g057-ivc";
+      reg = <0x16040000 0x230>;
+
+      clocks = <&cpg CPG_MOD R9A09G057_ISP0_PCLK>,
+      <&cpg CPG_MOD R9A09G057_ISP0_VIN_ACLK>,
+      <&cpg CPG_MOD R9A09G057_ISP0_SCLK>;
+      clock-names = "pclk", "vin_aclk", "sclk";
+
+      resets = <&cpg R9A09G057_ISP_0_PRESETN>,
+      <&cpg R9A09G057_ISP_0_VIN_ARESETN>,
+      <&cpg R9A09G057_ISP_0_ISP_SRESETN>;
+      reset-names = "presetn", "vin_aresetn", "sresetn";
+
+      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+
+      status = "okay";
+
+      port {
+        ivc_out: endpoint {
+          remote-endpoint = <&isp_in>;
+        };
+      };
+    };
+...
-- 
2.34.1


