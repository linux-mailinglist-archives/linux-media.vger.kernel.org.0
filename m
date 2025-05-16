Return-Path: <linux-media+bounces-32643-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A1AABA124
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 18:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F3F31BA53D0
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 16:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7051DEFF3;
	Fri, 16 May 2025 16:53:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D261D7E5C;
	Fri, 16 May 2025 16:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414412; cv=none; b=SeIjeUWWyz8cIMa/R1dan3+Jcz4DjEN7itscm6J8hEVv3cqkx6Qxr9qxxsvBkcR0ic0m8+cOLzY7VHZhFjNeF+gdScf3Id6mg6VVBYoALGHkaaUeg7VU/UHAiMkr2qdQYZOhEf+UbGqIPfgDN7htrWi8HX2jwvvqwW5H8hgG3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414412; c=relaxed/simple;
	bh=mI87wUYVwjJdeMND0P7OjMNfdN3yE7W8j+sh4Iu84i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/Juzh1XFrIUlPlHcBpHZjmcFIQZliDkNKg015KuE9AC278QLY09xWnEGEqJihjYBTV20ZnqW5r2XYgTe7qCuqR53Uf/pKfRdpuJLjnskiYOfHMKzGKoAd55UsAQFwrKhLvyneLVZMC3HAF/UY3WhCT77S/LZ5UhIg39UVe/QfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfe574976so15609915e9.1;
        Fri, 16 May 2025 09:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414409; x=1748019209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfHWyDzdYdPgseWM8in4Xga6BH3ORUK0taNjKDi8WrU=;
        b=SVkb1P1rv/1Oxk2hRy4J60CyOz69+09/qerlU/VvTsyxO6zMRuun89x/fiAgGsnvHs
         BEdHD5ifzH3iyzpeP0Xld+5mR1WkX4DrHGtusq79eJXbPqvlm/J1GAh5QwjdfpLGGmvw
         0alaMCvov1tjozT7py0K/tjGTfBDXxgeHmhRKjc/TyTCXT0ErpOnCWKGJbR7gOuEo5Ce
         p92vc717MXxRG4AIgnE5cP8Fo2FcxSPc3Is35shMRl5psFUKHkPHIHfR2SmlEDaJpsWE
         2SafJov4vDRAht71ISTX49ij0EsRJkXJ0R1luhT66/TvmD0TLgb68dK0ECxOFbErDy0G
         HKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUobGhrqYzn/GM8uykiIZRPrS/TUGwvEGkBIYo2xwlnj6pFbZwvp0+JYduvUD7IVkYsD/MR6Cg9Txo0EMzd@vger.kernel.org, AJvYcCW7LwhOQOnjVkOpyjKhGr7R2neoP6FtdNzWNP7+ThkakyHusM2tb1SCs71NvEIwZUOT+dsqXxxowM5ZR5M=@vger.kernel.org, AJvYcCWBmxFxNsCFIRZQb3veJaKJ/7VWquKSuMewfbY73pku+ueck8iARTQz6ODtHq167puwop/rWAe2/hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyBaXPFAMhxK7EwG/jDDudY5HqtG0zVzJWV42UO9N1atVCeJYE
	y8YJp2f9IfuRAbXW8TagvIWKSr8FvkQLw5/XKIls0f6caiDSGPMrc7+7
X-Gm-Gg: ASbGncvliiyiaTeeMXK2r0vrCWmFWXRfGiWk6vvOLbmyrZfwvZ1qVDLgO6e7aCxZHP4
	FOAS/XhJKxqdkKx/V00gl5WIoNq6PtFQvyVKkKcGJ5wttgFpJEo3LkYvSbe4tRzMN5z6y7mYEAI
	k7vQ57lc/Xx7D/h/NJ8/4CKbDvd+JagkleIpDnG/RI7eykio+9TEEdEvlfiiklRuSHEfFgSUd1F
	AJsqOhnK7eJE0TazRuf1b7WwDjPksaJKrw+nn4WVy3UQzlgDLADitcr9tZZ+LmMk2iclcOal1Cs
	05n7G+7w0EtCziW4hgWJFCpU4dnWa8VeNxtpoGKAjAnWKWJzQ7MhbAyI+1mQUQ3mWjEEenjDs55
	anOLSoDvx2ZO67oupMDjX
X-Google-Smtp-Source: AGHT+IEyqMrmDea7JavBMgkK3wvxNcoS+lcm9iLW6qMl0usvxOeRCVB8F+OJbgGXLnn2gpefZQpWQA==
X-Received: by 2002:a05:600c:4f42:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-442fd60b543mr50449995e9.3.1747414408596;
        Fri, 16 May 2025 09:53:28 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:28 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:15 +0200
Subject: [PATCH v3 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

Add the bindings for the Neural Processing Unit IP from Rockchip.

v2:
- Adapt to new node structure (one node per core, each with its own
  IOMMU)
- Several misc. fixes from Sebastian Reichel

v3:
- Split register block in its constituent subblocks, and only require
  the ones that the kernel would ever use (Nicolas Frattaroli)
- Group supplies (Rob Herring)
- Explain the way in which the top core is special (Rob Herring)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/npu/rockchip,rknn-core.yaml           | 162 +++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4572fb777f1454d0147da29791033fc27c53b8d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Neural Processing Unit IP from Rockchip
+
+maintainers:
+  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
+
+description:
+  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's
+  open source NVDLA IP.
+
+  There is to be a node per each core in the NPU. In Rockchip's design there
+  will be one core that is special and needs to be powered on before any of the
+  other cores can be used. This special core is called the top core and should
+  have the compatible string that corresponds to top cores.
+
+properties:
+  $nodename:
+    pattern: '^npu-core@[a-f0-9]+$'
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - rockchip,rk3588-rknn-core-top
+      - items:
+          - enum:
+              - rockchip,rk3588-rknn-core
+
+  reg:
+    minItems: 3
+
+  reg-names:
+    minItems: 3
+    items:
+      - const: pc
+      - const: cna
+      - const: core
+
+  clocks:
+    minItems: 2
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: npu
+      - const: pclk
+    minItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  npu-supply: true
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: srst_a
+      - const: srst_h
+
+  sram-supply: true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - iommus
+  - power-domains
+  - resets
+  - reset-names
+  - npu-supply
+  - sram-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rknn-core-top
+    then:
+      properties:
+        clocks:
+          minItems: 4
+
+        clock-names:
+          minItems: 4
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rknn-core
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      rknn_core_top: npu-core@fdab0000 {
+        compatible = "rockchip,rk3588-rknn-core-top", "rockchip,rknn-core-top";
+        reg = <0x0 0xfdab0000 0x0 0x9000>;
+        assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+        assigned-clock-rates = <200000000>;
+        clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
+                 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+        clock-names = "aclk", "hclk", "npu", "pclk";
+        interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+        iommus = <&rknn_mmu_top>;
+        npu-supply = <&vdd_npu_s0>;
+        power-domains = <&power RK3588_PD_NPUTOP>;
+        resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
+        reset-names = "srst_a", "srst_h";
+        sram-supply = <&vdd_npu_mem_s0>;
+      };
+
+      rknn_core_1: npu-core@fdac0000 {
+        compatible = "rockchip,rk3588-rknn-core", "rockchip,rknn-core";
+        reg = <0x0 0xfdac0000 0x0 0x9000>;
+        clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
+        clock-names = "aclk", "hclk";
+        interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
+        iommus = <&rknn_mmu_1>;
+        npu-supply = <&vdd_npu_s0>;
+        power-domains = <&power RK3588_PD_NPU1>;
+        resets = <&cru SRST_A_RKNN1>, <&cru SRST_H_RKNN1>;
+        reset-names = "srst_a", "srst_h";
+        sram-supply = <&vdd_npu_mem_s0>;
+      };
+    };
+...

-- 
2.49.0


