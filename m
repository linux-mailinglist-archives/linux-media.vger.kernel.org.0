Return-Path: <linux-media+bounces-13043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 146EE905449
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 827BA1F22428
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 13:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A532217F36B;
	Wed, 12 Jun 2024 13:53:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C04517E8F5;
	Wed, 12 Jun 2024 13:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200392; cv=none; b=DQUR0Jg3ljSixyLdRI2SJtOWpFGH5dMYXlT8Sv/1yxzGuFpWHl9DU3A/NEyrCCs1HE1t+ueULc+bLYM4c4i4ZXcep4nDMZalcNWsUDMDn76V0bUgcEMe6yrmRoX5GYrPbEQw5LUToF0hlhGUeKE0cMOJD9w+8wFq6nLBhfg7QEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200392; c=relaxed/simple;
	bh=6FW0/xFE2fEOj5ei+gbMztyqER1rejBqluKM9G44W8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HINWXudyxkjHJqpGTNZIuHWC5UBMhkduge7MJ23H8m4Ip76GSjV9nIl1cLZeEiPR+8Loik2E8V3rr1i/MSzEpxAodWSELZuZ4DrdXQ+h1g+fX1iAtPFOpOyojRqKdrAADaLpj/LOn/CGf4vamexcaTQYHkzzPM/f+NlzWIVmrp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso6219505e9.0;
        Wed, 12 Jun 2024 06:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718200389; x=1718805189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cz9Php77CN5sqNTwFGYv2UDE+c/YCm+M4vWABkPbT/c=;
        b=KfO1lJkOQjgnuClie1w2LmiAEvR050cdmMSdwRt+ZFzrIFP/QNuFjJH4jByUdXdGiN
         bxsH6HAuryfC2v+xAiBYUoelpfR344K8GFPhbgAVIYkWgNNV6QpGSYSwbTwTKnKBxij/
         ueJM8oGvF+0fpTdVjF5YiV6qvazurhpc9Spv3bapuDg8YbNrXoXr+Mutoul93WrZDZ2Q
         jiawOmAx18jrvU2HbPGPhbDPlJXup2H1qVFbhchth3+z5eRaWJjLfNdLgy8BwQvrM+I2
         HaEH21H23BGF6sXmxRT/saSGv9yhSh7e2Z1Q82f7hhIm00QOxNqJyX8tVMjGlLDzIV/z
         9xiA==
X-Forwarded-Encrypted: i=1; AJvYcCU/AO/1vMT/nx04iyXuu8g4TGc49XNDUagSAQZcXIPIblsnZ1FOP4TtNuZAfxsGNP6Q8zaVx5t1e+bSwM6fY3HSNfMLtStXcpZu7vadsipv5oRcLahcwWohGltr0254IbiicjI6jvnX+MX1/qWVIPUdhN16LKGjdQT1Fb5lFxCD2mIv5IRf
X-Gm-Message-State: AOJu0YxURQ66bjsRGEBRjwGSapKVcyJWarjzrLmYugkxeadEUwR6PXDG
	hH99+hZmdRpEukdFf5f+YfLLv8bZ0oDAQ/FWGrww38iTd9AbA6jU
X-Google-Smtp-Source: AGHT+IEqb5Q+XEHVzZbym8NFLwOC3wy9t9R6o2Sd4pfu6UKsad2cWupip8wZTpYH3xU98HUt7kmz6A==
X-Received: by 2002:a05:6000:1250:b0:35f:2551:b967 with SMTP id ffacd0b85a97d-35f2b28a77amr5039442f8f.16.1718200389052;
        Wed, 12 Jun 2024 06:53:09 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 06:53:08 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:52:56 +0200
Subject: [PATCH 3/9] dt-bindings: mailbox: rockchip,rknn: Add bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-3-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0

Add the bindings for the Neural Processing Unit IP from Rockchip.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../devicetree/bindings/npu/rockchip,rknn.yaml     | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn.yaml
new file mode 100644
index 000000000000..570a4889c11c
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rknn.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/rockchip,rknn.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Neural Processing Unit IP from Rockchip, based on NVIDIA's NVDLA
+
+maintainers:
+  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
+
+description: |+
+  Rockchip IP for accelerating inference of neural networks, based on NVIDIA's open source NVDLA IP.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - rockchip,rk3588-rknn
+      - const: rockchip,rknn
+
+  reg:
+    description: Base registers for NPU cores
+    minItems: 1
+    maxItems: 20
+
+  interrupts:
+    minItems: 1
+    maxItems: 20
+
+  interrupt-names:
+    minItems: 1
+    maxItems: 20
+
+  clocks:
+    minItems: 1
+    maxItems: 20
+
+  clock-names:
+    minItems: 1
+    maxItems: 20
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+  resets:
+    minItems: 1
+    maxItems: 20
+
+  reset-names:
+    minItems: 1
+    maxItems: 20
+
+  power-domains:
+    minItems: 1
+    maxItems: 20
+
+  power-domain-names:
+    minItems: 1
+    maxItems: 20
+
+  iommus:
+    items:
+      - description: IOMMU for all cores
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-rates
+  - resets
+  - reset-names
+  - power-domains
+  - power-domain-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rknn: npu@fdab0000 {
+          compatible = "rockchip,rk3588-rknn", "rockchip,rknn";
+          reg = <0x0 0xfdab0000 0x0 0x9000>,
+                <0x0 0xfdac0000 0x0 0x9000>,
+                <0x0 0xfdad0000 0x0 0x9000>;
+          interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
+                       <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
+          interrupt-names = "npu0_irq", "npu1_irq", "npu2_irq";
+          clocks = <&scmi_clk 0>, <&cru 1>,
+                   <&cru 2>, <&cru 3>,
+                   <&cru 4>, <&cru 5>,
+                   <&cru 6>, <&cru 7>;
+          clock-names = "clk_npu",
+                  "aclk0", "aclk1", "aclk2",
+                  "hclk0", "hclk1", "hclk2",
+                  "pclk";
+          assigned-clocks = <&scmi_clk 0>;
+          assigned-clock-rates = <200000000>;
+          resets = <&cru 0>, <&cru 1>, <&cru 2>,
+                   <&cru 3>, <&cru 4>, <&cru 5>;
+          reset-names = "srst_a0", "srst_a1", "srst_a2",
+                        "srst_h0", "srst_h1", "srst_h2";
+          power-domains = <&power 0>, <&power 1>, <&power 2>;
+          power-domain-names = "npu0", "npu1", "npu2";
+          iommus = <&rknpu_mmu>;
+          status = "disabled";
+        };
+    };
+...

-- 
2.45.2


