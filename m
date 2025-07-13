Return-Path: <linux-media+bounces-37563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF30B03027
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4B6E1A61AEA
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 08:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F6F2192F8;
	Sun, 13 Jul 2025 08:39:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941B020FAB4;
	Sun, 13 Jul 2025 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752395956; cv=none; b=MnOo9c12baE2qCAjwZ1iyEBZgS2puBCb0WNwxSe/OAhSRtVs5umzdIjTzCcUwjPLUOGIVX3nZoGcWhbETxhLdz+n8FE9COOeVoWH7RMNvLQd/Aiaax3ciPtakuygu9YQQq5i6+9CoY/johDp3zyp/GAGWMPe3mn8jc+/JPPZDYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752395956; c=relaxed/simple;
	bh=w6hnmUaPhiE+4dM8mRU8UM9oSOauuUw29qfONcEGBlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OGpIQSIT7X38h7V3EFYitkCsHZMLgNJZ5CjLqmElt/9p3RCfknc/UMZ3eeoMgBtXeipKS+u5UwRtNdD6dzvHim1W9dO4UwEU5mPat8J7AcQ/ap9JNAGr4DM9NOUvzhkt9aNZa4fVlnLkONL7Y6J72CYwHCUFX1/LbBhWn3AXx0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso5339201a12.0;
        Sun, 13 Jul 2025 01:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395953; x=1753000753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOHpT8kGZSJVLxTQMVWR2M9VRzfmT5p8z/9ngbND8fo=;
        b=VGO0uaTzyNXbG4zypB/gwo1poriXd+PGk6VbvydkETuiiCsdm6yOaK0giGdjVuC2Hj
         b/NsFJ62CMc7BLorbflSWi24W7023Z9HT8d4/Lzgp9klJj/co+d468DXkhY7aaEEtKyj
         uUXvLW4sKgO6QWYoI4eUbEfI2i7hKpWUVBbo5eQhOGD6Eq5yChLR5JnuG7PQt+HRTYts
         kdSsjgJAHc11AoFdGP0Sr1ecYwaWxgepmQUXBuapTqOLCgYgtyGWp5xVtPWudjWWv8TR
         pXjekuB5V5b9XqaYWKoGEG15oGihRSxlvlhoBUCcrQjsMTZS8s72O3kuZQ6ieM/FNPOX
         WydA==
X-Forwarded-Encrypted: i=1; AJvYcCUfu2KJnOgIbO4qxx5CHBVO8mnp0rgHCrL0+1j0xL6CSbXqroEREouDC32JzmZjUIeNK0FjJb4gwSRNsq07@vger.kernel.org, AJvYcCXoCqnf6e6rch+GfhmZQBGeOJ1iIkYNQsS2UiEMGtTU8YzGfSxBJPBG/dUyCFLFC0UBEaPT/aDaFls=@vger.kernel.org, AJvYcCXwqBCl9OcxZoyG3F7fYedxURtWnnl3oV1fNk0xMrUcIPmRLTGGtmTKdKeLU0JL57kBQh5clIXfwmNCkFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdJuHG9+lbKqw8ICI9oS/v34Zw1Xt6g29LmFIxRwUO5xH34Zgq
	bG0KYggghfDq1n+SZWvJF2QoVS2z25thoXy2OVruPCKIH0cED4hR8n+A
X-Gm-Gg: ASbGncuV1aH3I+Qumk1u35YB3ryFlq8YpRXit+haP7gzYhMxbTUWLTtgRT1C7BsQuDV
	aGnDKBjx9ekY9UP0+prsKxMpw/u1BoAyYAdYiPAddvP4bo2QsemiexHnqE1ibBiK+MBQ4aTvNcQ
	bkVW5dMMvWZc//UiDW8htZlqoZig/3zjCiArmRPrUmT3zIF71HcXvpKe+Oj3sIR5Vqu3bYWqUzi
	ebYgSALJqOXnLaZZCLvsumDvIIzBtyrvmcWcDVduEluQrMyPpIl8Oguwc9jfdjA4ejZcZiYuNsG
	HxwfFLxU9LD1fQdT/zGLIaDjTcbjhpeVBHl8mKPpn/FI7I+MOOzAiPpPX1r251uOXZwP/yUz04p
	LzSUI7vgu26+yTX4GdRWR+dLlwugukyflAOgauTSnbKHc8xGkgwLSfBhm
X-Google-Smtp-Source: AGHT+IHl3nw9qjo4aS5LVukEuyLIVG/s6+0jGJrU9nM4JX0orxt25nmWT7xes/c92JOudJh9cADHRw==
X-Received: by 2002:a17:907:1b08:b0:ad8:a41a:3cd2 with SMTP id a640c23a62f3a-ae6fbe71f29mr1117728466b.16.1752395952721;
        Sun, 13 Jul 2025 01:39:12 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:12 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:56 +0200
Subject: [PATCH v8 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250713-6-10-rocket-v8-6-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

v4:
- Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
- Remove unneeded items: (Krzysztof Kozlowski)
- Fix use of minItems/maxItems (Krzysztof Kozlowski)
- Add reg-names to list of required properties (Krzysztof Kozlowski)
- Fix example (Krzysztof Kozlowski)

v5:
- Rename file to rockchip,rk3588-rknn-core.yaml (Krzysztof Kozlowski)
- Streamline compatible property (Krzysztof Kozlowski)

v6:
- Remove mention to NVDLA, as the hardware is only incidentally related
  (Kever Yang)
- Mark pclk and npu clocks as required by all clocks (Rob Herring)

v7:
- Remove allOf section, not needed now that all nodes require 4 clocks
  (Heiko Stübner)

v8:
- Remove notion of top core (Robin Murphy)

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 112 +++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a1bdd831a8e665a7c73b73f15a9cde8deb474095
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/rockchip,rk3588-rknn-core.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Neural Processing Unit IP from Rockchip
+
+maintainers:
+  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
+
+description:
+  Rockchip IP for accelerating inference of neural networks.
+
+  There is to be a node per each NPU core in the SoC, and each core should reference all the
+  resources that it needs to function, such as clocks, power domains, and resets.
+
+properties:
+  $nodename:
+    pattern: '^npu@[a-f0-9]+$'
+
+  compatible:
+    enum:
+      - rockchip,rk3588-rknn-core
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: pc # Program Control-related registers
+      - const: cna # Convolution Neural Network Accelerator registers
+      - const: core # Main NPU core processing unit registers
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: hclk
+      - const: npu
+      - const: pclk
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
+  - reg-names
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
+      npu@fdab0000 {
+        compatible = "rockchip,rk3588-rknn-core";
+        reg = <0x0 0xfdab0000 0x0 0x1000>,
+              <0x0 0xfdab1000 0x0 0x1000>,
+              <0x0 0xfdab3000 0x0 0x1000>;
+        reg-names = "pc", "cna", "core";
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
+    };
+...

-- 
2.50.0


