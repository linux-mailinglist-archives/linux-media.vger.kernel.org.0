Return-Path: <linux-media+bounces-26898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FD2A4369F
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 08:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E9897A6B4F
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 07:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6503B25C6E2;
	Tue, 25 Feb 2025 07:56:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E70925B663;
	Tue, 25 Feb 2025 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740470164; cv=none; b=WBTctdjZLcg5TXt4K4fJpxlS0lcvKa9Llg32HLaPfQoCRtO9h/DqTMJ8HLupWWIfiiT+RYzzktFw6pLwxj0j57351H0fCTzdn5TizXJt7zAAbxOItPJ5QE54bRVs1hOXNXhgirSzCk+MdYnuQSG+kB2RLbyHpErfhKhN6zdk6hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740470164; c=relaxed/simple;
	bh=BXIMUBEmLfwZfoDlwf7xojMJTX0m2le6qLN3oAXEZrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9M+TB8C1/yhV8lRlTY6xKLrN0v6ythBLt/6ZkTw6x0qmjJ3+JFvzAjrEb/UDZX91IN0rkQ+/vEc4xStVxKxcCsiyOcA7X33DIvrIAgWKzATYOAhEe/WkvTD+0Ri75pybqoQ+cZcigYKXT1LE38yI/2uF6PunswdK0QWqZN0Qzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43998deed24so49721035e9.2;
        Mon, 24 Feb 2025 23:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470161; x=1741074961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQ8rK/SFPwv0iTdPidLWNwq+goMXwpaEZtcN5vvMS8I=;
        b=hMt3CrxPIZhNfpZJ37+RKQAFYcNkFHwYvPpzT1iYVFV+fySV7tj7XIMXMsopMfc8k5
         JH/sDpNkmRjZm332nt2hCKW8zyjfIOUdkgk89TcKVzaHkodKMtMP//cdgF4XhQ6B/Z/j
         40JNv6LBEuAy8h+PH+AXrvwG1bcXFczMY9Yr6EGQXkOewkASb5A4noz0W1XrqgSgO6nW
         asrQn6jitjsVfiduoyOYj6VBlmn4vVOPIykUf+gLTMCGQZ+Olb6kAIZmNmgJHuGpa6q5
         Vvtaorp5Od7QiVxmXNvNeWlRNNPbO4SRYybSmSuSWyO3ofbY5wJdZhFheBgVYw9Za+YT
         /rCg==
X-Forwarded-Encrypted: i=1; AJvYcCU6pQjY5kM98POrsmIIbDUtUgFlftNQpt4PRcqHpG9vZjAYIgT8E617YSrmpvYDSZY0dvvrrtCmbZ/jMZ6X@vger.kernel.org, AJvYcCV5gl+8w+XdySMQ6GZ+Lb1gkm/okv25gKiy8ijrGBdmbmMApY9ZUp3dPg78MqY00kvUM/yl0HujARPTDqk=@vger.kernel.org, AJvYcCW4l6qcevbmws8UhVbgL88Eq3boE0vhfkYCHtJZYKIAm+43r7ikIqNDkZ30kSUf9HexpTkJ1KWh6/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJYjNPUmAgSanSUG8X01Eseh9ZT1/lZqESVk3xhX5diKA6V08J
	uuOvagBqAZA8ye/B9I4LPakohq9If6RGwMwZ21c2p1+x5bh/aG6A
X-Gm-Gg: ASbGncsEw+v+xGlTsmNLm5YNNUuMMkxK9HL1v1Ijq2VIWeJCJE9kLQIyAr/KBweh0XP
	p2AyP4UytxfSNIvdGXi6OFvQ1h1cZdfkrltKDng0eWifeM5zlTVNblaeTRSDL222vXHX1YG9o/w
	Ur8PxZH8O7jeJJqGrFvtKEPznFa1HsPC7tCHDBooV3+UkkJJM3PRQW+zXib8iOm8ixGW6StrQIg
	EXadU8alD7njnEEMCSoFnzNO6aLX3og3c0UBCLEONaMSyGc/xXCdj5NW1YkUHMT+9Wbae47nNOb
	hqcbqpX8KFjsMCn8nCM24FmPbeSYveFr9Li7oT8fqYxISNOFwB0Ni9yVDA==
X-Google-Smtp-Source: AGHT+IFLYntsPuTOziMl5zbK7YW3u6WRQqcDsC52Yv/3/P2y2cWtuj2SxpqE0RPE7hoOsemVi3pcMQ==
X-Received: by 2002:a05:600c:450d:b0:439:9a43:dd62 with SMTP id 5b1f17b1804b1-439aebb2d6fmr101608685e9.24.1740470161102;
        Mon, 24 Feb 2025 23:56:01 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:55:59 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:47 +0100
Subject: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-6-10-rocket-v2-1-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf13a9f4aa7c1901362a3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
@@ -0,0 +1,152 @@
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
+properties:
+  $nodename:
+    pattern: '^npu-core@[a-f0-9]+$'
+
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - rockchip,rk3588-rknn-core-top
+          - const: rockchip,rknn-core-top
+      - items:
+          - enum:
+              - rockchip,rk3588-rknn-core
+          - const: rockchip,rknn-core
+
+  reg:
+    maxItems: 1
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
+  - npu-supply
+  - power-domains
+  - resets
+  - reset-names
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
2.48.1


