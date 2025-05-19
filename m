Return-Path: <linux-media+bounces-32784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34EAABBF75
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE7677A26E8
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CC027B50F;
	Mon, 19 May 2025 13:44:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCF62777E2;
	Mon, 19 May 2025 13:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662239; cv=none; b=uBkJN+pJYwi6cH/XuVPzDXwFEmBbWdQQQybGTLOYsv8aFQE+/JBjQ8yfC79ji2SQzyPeAkF93A+auchQT+8kCnq2bEYbqQGCAX/rgRghxOu+Be5bdR8huFKqKZT/Lq9KNGPsSrEmEdWctzKKOR6n1DeHe6N0qLHajd/qkRYmX4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662239; c=relaxed/simple;
	bh=OC/UpTkOXGB2c6FB+hrPqxNqGjLoVuqPqKIPHwRLnu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BT9gGSRwd/s/HKrM/WZsh/JFeO0Uct/LHMFY+d6xb0hw22SDTFA7Zns+j5xpJKAhzQaVTrvcax1JOO7V4hb/lf5hG0rk1tOKc9HHvp/wgAdNmoGpUHU85bhl2H2kHkqFLKPgBUrQT1H+JuvL+hvv1QxKQOFMGWr2eRdtoYl+sd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so48231985e9.3;
        Mon, 19 May 2025 06:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662236; x=1748267036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+H+QjYYirUuZ6VXmZOTL8x+mr2txa8jEni8E06nGxy0=;
        b=NV4MgNZFZOJdPBXR0dQ3fX7sS7bLZIhuHGsgsZ2sd3RmVvDfmbWX5yvxQiDVBcR3vY
         /LHyO6g9rlU/V+TuHaoHHkGqyMceM6uXlVNEZwz3dT3X3MzKBUc2A8hdznXyyWSsTunO
         2fXoF6v+KFTV59VojFJ8iLd4Nk+/Se9W/rOZitLcXxwDOT7i2JtESOruKrUNrOjBTevH
         M+LH+mf8uFIuVaKworhJ0nRWYoCIHTj8MRVv93c47Xz5MZqTeFVaE3Kcb4pqBreBVJNN
         CCRY7Vyv52e7YF1pFKZSRr/6iXLxRT+6OM0mVRxvbbWf/iwB0uD4eEF0BbLwBKB8RLf0
         qZbg==
X-Forwarded-Encrypted: i=1; AJvYcCUPZllSCZMBJ5WQEaJAE1hrh1I5sk/Sw5qbtGdghqiPUv+mFtrZ5vKQ73T0qel5oZS87xie0eudwIsdgwU=@vger.kernel.org, AJvYcCW0AWlwm/3hJswTkmVPyXVY2ZSbKrRWIk09tNzTwo0XWTD0dIPQVYPdDIBGC33s9/9UpRYvukn6nwvfxhb9@vger.kernel.org, AJvYcCWbk2ecYlHuAarI+rTWvbHGGyTvBGIcy/rcNV7LLygDich1Qj1PtAuwAKRgfMUexSGaQpbGPB0obOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaI37xXMYZyqGvdWP5DQXzzziOnxyPnc8/OoSxRsbuqh+qh3mY
	Aqs58HNKufMDVI3Z5DNMGW1OV8ENRkOF4qrtB+NewOK+tWWcPSY8+rzf
X-Gm-Gg: ASbGncvXbxUpBdaLBGe326HL4g+x7QXEu9eKdFqQCN33BIp7BDm4Kfkk4dQduYfzYpx
	2HgdDcorr/SuwnspPt1whp9gpEnHSY3gQv00flAkW886EgIdKQ35p1iAlREjjHxKTas8xx3AlG1
	JpaVc7pPkU0osw7CKmg7dP9DB1UZ/OCusGvG6Ox457xKRJNhWlvmTkzTiLgw3DfgPRg9QAA0TKK
	k0nJuH6wDJqWsK2pTkSSgV6Q8PNAYRkWQeGDR7Jx5CgV9pY7ZnWiPrfUyILYY31t8pEad63vYl4
	9XnVUxVrE7Z9XQZAG4RfhHsUE4/w5XhmeRiZQtdRPR7aFPGW5/8slgT4xxHIUU2ZC/DrrNx7bC0
	Kvjcbi8oDoJFbg84PRoj2
X-Google-Smtp-Source: AGHT+IGZ5AVAOUUrV/itIQOxyxWaIOPioGnU50ZCLD4atOKReeR9NFCFcmT5D8fhTHzDDxUl/EQ7HQ==
X-Received: by 2002:a05:600c:8597:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-442fd780527mr130353025e9.15.1747662235557;
        Mon, 19 May 2025 06:43:55 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:43:55 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:33 +0200
Subject: [PATCH v4 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-1-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
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

v4:
- Change required node name to npu@ (Rob Herring and Krzysztof Kozlowski)
- Remove unneeded items: (Krzysztof Kozlowski)
- Fix use of minItems/maxItems (Krzysztof Kozlowski)
- Add reg-names to list of required properties (Krzysztof Kozlowski)
- Fix example (Krzysztof Kozlowski)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/npu/rockchip,rknn-core.yaml           | 149 +++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fafd0b01da215c7396262012988e364ef07ea137
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
@@ -0,0 +1,149 @@
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
+    pattern: '^npu@[a-f0-9]+$'
+
+  compatible:
+    oneOf:
+      - enum:
+          - rockchip,rk3588-rknn-core-top
+      - enum:
+          - rockchip,rk3588-rknn-core
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


