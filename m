Return-Path: <linux-media+bounces-34193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1ACACFCBC
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:31:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B9C81899756
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 06:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEA3255F28;
	Fri,  6 Jun 2025 06:29:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CCC253F16;
	Fri,  6 Jun 2025 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191350; cv=none; b=TkkKXsXRL+6xXGXTUw3l6Vd7OOWEXggB4xENVuoI2zHInWf8ADeCOqZzjiScDepp2+06DTH9/c5y7t40UiEjyMDq2u5ffRXyi5ITdNHaPsIVBTOyR1OGNNLXuoM75v9HrmgH/emLXm0S03Dxoy0qNthSF8v8XnEwh0WHMHo9zXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191350; c=relaxed/simple;
	bh=Uu7juDcYUnr+a/wENiIDknZN6mPGx1IlDJ+uZGhFGoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LwxWcpS51GP0OExHqGUYvoT4AmHXYnOPSkSpZT6YXWrF/Zoii9mtFWXkfAdJG9Sy7mi3cQxr7GNYc6EDkURFLlKGmaLrJdKUznRQVbpNDest9dCL6omiBMOSdPOQhnZPj0A5sdfUy8+SC8WLIv9hg8gPwhUaJTeu6C8uSP4WRnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adb2bb25105so277365166b.0;
        Thu, 05 Jun 2025 23:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191347; x=1749796147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPukWtw2G3pjbqdi0Ei1Rnuvtpi0YW6Xb0VOKSKt6ek=;
        b=m0yBaCdhFsqYTMX2Wo3IiI1BQiRNpUloT+gLx2C85Q/ryrE2fdm8eSZRjJy6clNSBY
         S+3Mz79328v0mDEFBEbD+lWt77d95B2jbmX8QHFTs4F9Y3lnyjM9a7FxeU3UaRQa6nad
         O7yFKAQ96Xt4Z7uav58qkrIaWPAJwByKm0BjeVhjoPvuStZ28M4BStscVyFAXVTjJtLN
         d9c1FsSW8sdzk0xNl/hE1pnUZhZ3ByiBuuoC3nBANQJF8tzqO36XBDz/LfO08wwRsCW7
         f/KFRdR8JDauy6fbuBpoFmpHfnnIXZKucsOzSmnhGHAdSUtiSkXuWDQfqT7rtqJkvZei
         DN3w==
X-Forwarded-Encrypted: i=1; AJvYcCUL2eNFOmR04E7U5G3pAh2+b3eBEOoI2eTLy/M0HH1rsiotHLHH5orLBU4iQM0MvCD4KP422ognU/egRDo=@vger.kernel.org, AJvYcCVFQsLLGYe60dttUNxKUxnHLo4eXdg2n4tagNuAsaNmVbLFNcXSjwj2bVd3V2C9cNqNJhVRZgqS/Ys5iT6n@vger.kernel.org, AJvYcCW5A5jNayc/RA2QJmFgicFRB+9Bdfm9KJH4zrmjPKsoeGEZ4xfBOLaSAuoqEoklok+HQTbzdQThy9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHsyodDzq73NVqazki3X9jpoZb2INOkmkiWC+C0ngPsi5Ciku
	u3Cs7FpoZE9GoVkpKiGzzHC7qdfgJbo02SlfyhiOM26TWsXwwYyP9jmO
X-Gm-Gg: ASbGnctM0XFVjNpx088GdQ52ozeyanWe5GfdVr5SLNqaTYhLt6A4GsNvMQCf9rmzbHi
	pmcxJZV8H9V5kKUiqU6Leo3ongn5SFCD7j8QDoIak8dLn3BTm59lH8+OWCkwfL+S8CtoIQn/UhR
	FI0Eoc4snZU46Snog6Lk01gcWvMMtn6NTLnsl9wecpD1GIxPsyXxHKk3wno9akPdYXX9CZDR/4G
	d3r2DhoZjzonP57D+TfqGwO/fkXnWuHwnatX+1wjL421NbgmX1YMugPXhp7fgg4/Jv6quzm65NP
	6XV3TMNjSBoBUckknOoDxJ8aW/xO4nD4DyGFXEctckM57kF5j+BKGBzoA9u1pWL1K4RvtrbuI2X
	w5x/Rs0WdsA==
X-Google-Smtp-Source: AGHT+IEsag9vw6Nn7OEnilm+FmZVJ6FdiJUajR3eq5nDZMSo0SkP7dbEPJwLxYEQcAnCF8Ld4GIxJg==
X-Received: by 2002:a17:906:6a16:b0:ade:7c3:7e14 with SMTP id a640c23a62f3a-ade1ab8771dmr170871266b.46.1749191346629;
        Thu, 05 Jun 2025 23:29:06 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:06 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:26 +0200
Subject: [PATCH v7 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-6-10-rocket-v7-6-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
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

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/npu/rockchip,rk3588-rknn-core.yaml    | 118 +++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0588c085a723a34f4fa30a9680ea948d960b092f
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -0,0 +1,118 @@
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
+  There is to be a node per each core in the NPU. In Rockchip's design there
+  will be one core that is special because it is able to redistribute work to
+  the other cores by forwarding register writes and sharing data. This special
+  core is called the top core and should have the compatible string that
+  corresponds to top cores.
+
+properties:
+  $nodename:
+    pattern: '^npu@[a-f0-9]+$'
+
+  compatible:
+    enum:
+      - rockchip,rk3588-rknn-core-top
+      - rockchip,rk3588-rknn-core
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: pc
+      - const: cna
+      - const: core
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
+        compatible = "rockchip,rk3588-rknn-core-top";
+        reg = <0x0 0xfdab0000 0x0 0x1000>,
+              <0x0 0xfdab1000 0x0 0x1000>,
+              <0x0 0xfdab3000 0x0 0x1000>;
+        reg-names = "pc", "cna", "core";
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
+    };
+...

-- 
2.49.0


