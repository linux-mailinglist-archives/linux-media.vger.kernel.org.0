Return-Path: <linux-media+bounces-39463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB3DB216E7
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 23:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D56B2168966
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 21:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2057B2E2F03;
	Mon, 11 Aug 2025 21:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Inrp3fT2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D902E2DF1;
	Mon, 11 Aug 2025 21:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754946345; cv=none; b=raVusRUzJuMk2QJ+3M4KZps4W58pbAaxoyjOybUNz3kylXnL2q7vbs8ea/umVDkyUfSiMpHHbjvsdqEdX8HzQgGB3B7DI9Ijf3iyGKYtu8BT62HLw8VfUfYIcK+m8qfkUvL362dmzUN3ymVG6WaNYPRjLxn67z3OCMh6waQY5L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754946345; c=relaxed/simple;
	bh=32XPruK+7/5/FZNF8heDvMOq1d1cR1EwqURZewdA3+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sEk0lozFoBrqhhyICRFDaufV8RcTDh5quzCRu5XS8Fy1KsGH9EvkUXUjjm4gULWorj1R3/OpBykzbUfQ4i5CoRbvNvPKQoAR8AljSWfalPHpK8r+o8ZG1m/TNn2WAIUJisbPdzRrxckTmzQ1LXnJ1S+8GI2Tk1+RTKJA1grb9Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Inrp3fT2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FCAC4CEED;
	Mon, 11 Aug 2025 21:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754946345;
	bh=32XPruK+7/5/FZNF8heDvMOq1d1cR1EwqURZewdA3+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Inrp3fT2Jl4X2SY7LIaVi30EFuhrnl8ZDJ1RNmDfmNEmMij789FqyiZURfy+f9TWj
	 Tcq73JOJ3gyXD04GqdqC13Skvn0jI4R2VGLXBjBqXZdLCzGTXXmz1Do4Uqx2ZRwjij
	 YcF14yqlXqImRa9JuG7aFptwtoYx88n8fh5ZvXMYVmT0cVO7SyQnZtgBdavN3x8IPf
	 ChY63W+rhRYk35MqeDG8x+nyf8fMMmKOWkhcxj7dWyGvJo1GRKU5iHkITN9pcyY0yS
	 WbH4ednjosI6d3tcHN/j6BdNTRZZwTlSWvpOYNB4ImgbHb6OERtiIjDSyjnyih1a9g
	 twxWekAtRM7qw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 11 Aug 2025 16:05:25 -0500
Subject: [PATCH v2 1/2] dt-bindings: npu: Add Arm Ethos-U65/U85
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-ethos-v2-1-a219fc52a95b@kernel.org>
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
In-Reply-To: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.15-dev

Add a binding schema for Arm Ethos-U65/U85 NPU. The Arm Ethos-U NPUs are
designed for edge AI inference applications.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/npu/arm,ethos.yaml         | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/arm,ethos.yaml b/Documentation/devicetree/bindings/npu/arm,ethos.yaml
new file mode 100644
index 000000000000..716c4997f976
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/arm,ethos.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/arm,ethos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Ethos U65/U85
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: >
+  The Arm Ethos-U NPUs are designed for IoT inference applications. The NPUs
+  can accelerate 8-bit and 16-bit integer quantized networks:
+
+    Transformer networks (U85 only)
+    Convolutional Neural Networks (CNN)
+    Recurrent Neural Networks (RNN)
+
+  Further documentation is available here:
+
+    U65 TRM: https://developer.arm.com/documentation/102023/
+    U85 TRM: https://developer.arm.com/documentation/102685/
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx93-npu
+          - const: arm,ethos-u65
+      - items:
+          - {}
+          - const: arm,ethos-u85
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: apb
+
+  power-domains:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/imx93-clock.h>
+
+    npu@4a900000 {
+        compatible = "fsl,imx93-npu", "arm,ethos-u65";
+        reg = <0x4a900000 0x1000>;
+        interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&mlmix>;
+        clocks = <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_APB>;
+        clock-names = "core", "apb";
+        sram = <&sram>;
+    };
+...

-- 
2.47.2


