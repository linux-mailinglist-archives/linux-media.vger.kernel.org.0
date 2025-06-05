Return-Path: <linux-media+bounces-34118-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 054FBACEF2A
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 14:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7585C3AC1E0
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 12:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBB2225402;
	Thu,  5 Jun 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mV4X3C5w"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68A31F30C3;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126426; cv=none; b=YWt2yBpGab+h4IaImNLLy7XzszNzChRf1HVEJuiAEclz4nYVaEbOftLp3ZAqOlffSY1ERd9lMyfQPhmlKpzbtwpXpjFMfTZum1iBTbXoujRW93fD505hnpSdkO1LmcTPd6GMegfx1X+iYQg2yIEjOqN6zu/IPpUOXMQOb9qNwb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126426; c=relaxed/simple;
	bh=fyHeRo41514/MWnur/Zog9VGxEsADZDdW2r1BhXwQSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqCats2KgiO11FqAr2B47r+/oMiA52f/fb6+cyamz25kc+j5QZVViAZN8BArxzErb2XMkb7X0TD9pk9jtS+MKHxsGlbaH5dMV3M3YvGoRlU99djExN6O6yGPJ3WptpOXLDxMKDxPhEA8ZcV0C0EaCTW9TqGowpfx3iLuolKxDrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mV4X3C5w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F4F8C4CEEB;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749126426;
	bh=fyHeRo41514/MWnur/Zog9VGxEsADZDdW2r1BhXwQSY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mV4X3C5w5joySugjC1c0ALHr6hPe3HSnaWIWZFyXsxonyl7w4ZIpNdnqyeCJrVMCK
	 2Z1Xk2UqZ4BTgUyVOVSK9CnSysgcEkGutqUIhA6eVI8P9B358W9XlVHm5hNtKI6Kyv
	 M2Wl8ooKOKCLfBHDTZUTzr++P8yUM0qQlGj/70JOXnHjizK/kJrg7MQG85BqiSmLml
	 chEy7yrKWIzjG99AvOz1Yli0y8NrNw2jaPnqHPTv1smG6f2aq1UpH6v1crTa1eb5oh
	 cS4GrpjRjOEBxX75pCT8eCHV/zqub05maqKPAL30vim2d2Mawphpav+dmlXu/BRUZr
	 kAw/cZ6liwmKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63929C5AE59;
	Thu,  5 Jun 2025 12:27:06 +0000 (UTC)
From: Yassine Ouaissa via B4 Relay <devnull+yassine.ouaissa.allegrodvt.com@kernel.org>
Date: Thu, 05 Jun 2025 12:26:57 +0000
Subject: [PATCH v2 2/4] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-allegro_dvt_al300_dec_driver-v2-2-1ef4839f5f06@allegrodvt.com>
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
In-Reply-To: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4465;
 i=yassine.ouaissa@allegrodvt.com; h=from:subject:message-id;
 bh=gyDJpDMIBTqzfypvbD80Y9BICAPF5u6vCQosYsoMsbw=;
 b=owGbwMvMwCV2oHftXqU9jLMZT6slMWQ49oobrHHl/iGfJWFz6vXtrfNPnnny9khEPovGGpXCI
 I/emfOOdZSyMIhxMciKKbJ8MFj67Atbjc+MFrb5MHNYmUCGMHBxCsBEnA8w/NO7wS323m3ryVxl
 ta74V3E6Ukds/lpusLLeJ1HTPL1/83pGhrNGViHn9/61/iLDXl8X7st05vejAzrvL9d8yBM90CP
 tzQsA
X-Developer-Key: i=yassine.ouaissa@allegrodvt.com; a=openpgp;
 fpr=B0CE218FC8E89064DAED6179042F935CFB3AD0CC
X-Endpoint-Received: by B4 Relay for yassine.ouaissa@allegrodvt.com/default
 with auth_id=423
X-Original-From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Reply-To: yassine.ouaissa@allegrodvt.com

From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>

Add compatible for video decoder on allegrodvt Gen 3 IP.

v2:
- Change the YAML file name, use the existing vendor-prefix.
- Improuve the dt-bindings description.
- Change the device compatible identifier, from "allegrodvt, al300-vdec",
  to "allegro, al300-vdec"
- Simplify the register property specification,
  by using the simple min/max items constraint (Krzysztof Kozlowski)
- Remove the clock-names property. And remove it from the required
  properties list (Krzysztof Kozlowski) (Conor Dooley)
- Use the simple maxItems constraint for the memory-region property.
  Also for the firmware-name (Krzysztof Kozlowski)
- Example changes:
  - Use header provides definitions for the interrupts (Conor Dooley)
  - Improuve Interrupt specification using GIC constants (Conor Dooley)
  - Use generic node name "video-decoder" (Krzysztof Kozlowski) (Conor Dooley)
  - Remove unused label (Krzysztof Kozlowski)
  - Change clock reference from <&mcu_clock_dec> to <&mcu_core_clk>
  - Use hex format for reg property (Krzysztof Kozlowski) (Conor Dooley)
  - Reduce memory region size (Krzysztof Kozlowski) (Conor Dooley)

  - Link v1: https://patchwork.linuxtv.org/project/linux-media/patch/20250511144752.504162-4-yassine.ouaissa@allegrodvt.com/

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegro,al300-vdec.yaml         | 75 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..26f9ac39682431b1d4828aed5d1ed43ef099e204
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
@@ -0,0 +1,75 @@
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
+description: The al300-vdec represents the gen 3 of Allegro DVT IP video
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
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: regs
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: MCU core clock
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
+            reg = <0x00 0xa0120000 0x00 0x10000>,
+                  <0x01 0x80000000 0x00 0x8000>;
+            reg-names = "regs", "apb";
+            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&mcu_core_clk>;
+            firmware-name = "al300_vdec.fw";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index abc6ba61048771303bc219102f2db602266b7c30..1ff78b9a76cb8cdf32263fcd9b4579b4a2bb6b2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -816,7 +816,9 @@ M:	Michael Tretter <m.tretter@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
+F:	drivers/media/platform/allegro-dvt/al300
 F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER

-- 
2.30.2



