Return-Path: <linux-media+bounces-45076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD26BF3385
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 21:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 11D844EC939
	for <lists+linux-media@lfdr.de>; Mon, 20 Oct 2025 19:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9247A3314DF;
	Mon, 20 Oct 2025 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jci9A00z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E518332860D;
	Mon, 20 Oct 2025 19:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988823; cv=none; b=Ks7s31dd9PUfYY/v0gai4Qj383JIzq3rxp+nqv8N9qAlqGEGPpPU2PDSDTwFDwnaOYVaZSnmf9HRp0dbwqbXdKyoMUYSwg5P2eD+EXHs/O7DKhyNJ4I4UD0JRZOICRGvXoQSLgBQq/lMO9ybXnN5shZRprZx5ZpVCDYsUU8Qcw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988823; c=relaxed/simple;
	bh=OzZYNhfeXWS2afdATzSyTHgckQWTy81RjyXUnXpvsek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fGouDs2d4u1/yE3ebVJbaMl4T45Q4V05eqXiaI+0WLmeupVMFCZfHSMFvLtdNKHyyh/w+n+yCX+fNKncG+yAEoHA+fMifdI9DCiPm8Eyt2XBouoh3m9OV8bEfrCcPIvBFVRHZYM2DilNvNseUBb6QDfoCOBDdwFrhzgb2UnfUVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jci9A00z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B79C116D0;
	Mon, 20 Oct 2025 19:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760988822;
	bh=OzZYNhfeXWS2afdATzSyTHgckQWTy81RjyXUnXpvsek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jci9A00zEDwXACAILpAmyXxDGhEnez5clF45Fw6Xr1sMev4oOR8Loe6vUu1tyLJws
	 5m+6t5VUwnL66YYjIZ4u7xU/WyqHFpYCaG4WPAkzF/eWkYsi/XmM352iTGln86lWlo
	 t4J8RQRZh3JlI7/FAIkObhb2i2YY630R75xip48Mu1IHJBSv9eqQ+7uXBHc1SIpKpX
	 FfYbj2qv3o5JvsQD4IY95MDCJO9O//PAHcns3iQX4Wr+o1xERmTyn+CvRNOkrmMh4R
	 sKylGf8LHt4htRyBxFh7ERqplMg6fneLWQ0IAts5RvgdBHLlFCPe71s9MCMkrQKtDE
	 SUTiKgjlMKkqA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 20 Oct 2025 14:33:27 -0500
Subject: [PATCH v6 1/2] dt-bindings: npu: Add Arm Ethos-U65/U85
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-ethos-v6-1-ecebc383c4b7@kernel.org>
References: <20251020-ethos-v6-0-ecebc383c4b7@kernel.org>
In-Reply-To: <20251020-ethos-v6-0-ecebc383c4b7@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Price <steven.price@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Frank Li <Frank.li@nxp.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Matthew Brost <matthew.brost@intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15-dev

Add a binding schema for Arm Ethos-U65/U85 NPU. The Arm Ethos-U NPUs are
designed for edge AI inference applications.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
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
2.51.0


