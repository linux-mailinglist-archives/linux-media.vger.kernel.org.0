Return-Path: <linux-media+bounces-48406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22ACAD508
	for <lists+linux-media@lfdr.de>; Mon, 08 Dec 2025 14:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC72302EA00
	for <lists+linux-media@lfdr.de>; Mon,  8 Dec 2025 13:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0278C318139;
	Mon,  8 Dec 2025 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8QLWUN/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180430F816;
	Mon,  8 Dec 2025 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765201313; cv=none; b=Q2lWcxoZFTdHg0FHiuVeThcjya60/YLv5PzcjEc721dixcBEehq6+00O3GlwMJOEfc0LsHPg1bkvpZf0oXtTnK8O8jAm+nplR1Q3o7O3NIpMHRAiuBUbYk8BwowJk+maQ7pcOjg1jVL4F35KCmkcQTK4U0L2KPcbb+w30VSCDeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765201313; c=relaxed/simple;
	bh=P5mZ0L0CwVMV7GLuSdH5kZFL7mttnkSJtjZ3tGQrvzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ifUoKfjIyeLd+scFOoXvna8Fog07NT4QQymq2t3FiwecTzHYo5ktqz6NsS23hncOetJI6IMCj2AK/QfNrQTMb6zaYxNaS5Ad83BPmuWtg5I4PCRDIWQWx3dR75Hgh9WBf5bpNikzAqaxm5sSUZrL89BE2QcAjyOnlRgl+ChJk4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8QLWUN/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5A79C19421;
	Mon,  8 Dec 2025 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765201312;
	bh=P5mZ0L0CwVMV7GLuSdH5kZFL7mttnkSJtjZ3tGQrvzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q8QLWUN/pBOEMi+X4cRPnwVlAQZvRYbuk3as+TbZ6dI7+DQib3uCvnjGJGLok7oOf
	 XL3w4ocEQgqsZKo1zhtn+dmUU8eJkxwCJhE34ZftwCehQHio7PiARlfg5vVVBpS6O9
	 QiAIJfw89/I8aHtNrYRORVt3kN6nkE5zdijwj7Rk1qB621SisJlyBIMhOT/Lnm4/kv
	 cfEU8elMLH9k4WVmuvqanAm+ezdXbSA/WrR9jaw9MR/bwiIaHJxOYSMHRqdzmGZA1V
	 Upb7ZhY91lhIjHyRLBlx/TX/V5eXofCGIR5sg14VZ+EF1pMpKo5OdH1tSPb6cpHCl1
	 j46BxhS+IL1FA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02D9D3B7E8;
	Mon,  8 Dec 2025 13:41:52 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Mon, 08 Dec 2025 14:41:22 +0100
Subject: [PATCH v6 2/4] dt-bindings: media: allegro: Add al300 decoder IPs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-allegro_dvt_al300_dec_driver-v6-2-2e51ab2e4ce9@allegrodvt.com>
References: <20251208-allegro_dvt_al300_dec_driver-v6-0-2e51ab2e4ce9@allegrodvt.com>
In-Reply-To: <20251208-allegro_dvt_al300_dec_driver-v6-0-2e51ab2e4ce9@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3244;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=jzj1ta0KXPH3flJwQD/CD3oKP8EK5pemrsqeprwRzpQ=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWSaXZ1n+emSlGtTsW2OYsfSO2+u7n67qH5WDN+9vxkdK
 uuuKFdN7ShlYRDjYpAVU2T5YLD02Re2Gp8ZLWzzYeawMoEMYeDiFICJ3GZi+GdtqnoqYLen4FaN
 jswi3k0b3uiUfu90XXZs8tsawVNlaeWMDCdljzR1G+yPFPCdm3Ln5adZ7qn3Nh+N1xXgYAk9+Pv
 ASUYA
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Reply-To: yassine.ouaissa@allegrodvt.com

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add a schema for the allegro gen3 video decoder.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegro,al300-vdec.yaml         | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 2 files changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
new file mode 100644
index 000000000000..12e86c306d55
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allegro,al300-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allegro DVT Video IP Decoder Gen 3
+
+maintainers:
+  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
+
+description:
+  The al300-vdec represents the gen 3 of Allegro DVT IP video
+  decoding technology, offering significant advancements over its
+  predecessors. This new decoder features enhanced processing capabilities
+  with improved throughput and reduced latency.
+
+  Communication between the host driver software and the MCU is implemented
+  through a specialized mailbox interface mechanism. This mailbox system
+  provides a structured channel for exchanging commands, parameters, and
+  status information between the host CPU and the MCU controlling the codec
+  engines.
+
+properties:
+  compatible:
+    const: allegro,al300-vdec
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: top
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: MCU core clock
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: False
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    axi {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-decoder@a0120000 {
+            compatible = "allegro,al300-vdec";
+            reg = <0x00 0xa0120000 0x00 0x10000>, /*VDEC_TOP*/
+                  <0x01 0x80000000 0x00 0x8000>;  /*MCU_APB*/
+            reg-names = "top", "apb";
+            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&mcu_core_clk>;
+            memory-region = <&vdec_mem>;
+            firmware-name = "al300_vdec.fw";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dc56841fa5e5..67dfc2ee1725 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -837,7 +837,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
+F:	drivers/media/platform/allegro-dvt/al300
 F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER

-- 
2.50.1



