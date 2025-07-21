Return-Path: <linux-media+bounces-38137-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E316B0BFF6
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F9E3BEB5C
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 09:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D537728AB10;
	Mon, 21 Jul 2025 09:18:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F26628A411;
	Mon, 21 Jul 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753089501; cv=none; b=l8q6gTUaOGiZ5UhDc+PK+YAxLWSlPf5OLv8o0QEHqs/YT3dDocnM6HR7VvwGSxKpETGztbxOBurRo74o3C/ZA9UC9u6dXHUvbAnK4ZYcO7ya3u+Hj8C4a7eX4WGGAl9FwG2CZNXKauo2uhKaAFHyQ7aWW4T5Qy1V93VBKKmbQ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753089501; c=relaxed/simple;
	bh=z9+oC77vjBHzP3E5HmHa20qnNNAitpo4vpYKB9Aj+nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NYj/xZDBLSD3NWWp+45pvTQe9G1k/C3xh6koMz69Q34hMvos+8PBNlQoxkycltmfUzPvkd7cIMc9knHKmqLvjum4/p6+wlsbPFtevckju1C2h7NCeu1wNnzk+MhGd2sSAIXje2R6o5ToKsiX892x2FdzLqoZ/S9i/CYUhP0XW84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0de0c03e9so609765666b.2;
        Mon, 21 Jul 2025 02:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089498; x=1753694298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0shnpD272LCTIcktSbOwec73NOpSSL15XOo8LgFeXc=;
        b=ZaDcPYzlAsVye91o8bOM8LnfaujMb9/4W5cZkrge1M6iMikO/2mdhc/7raTLOc9gCm
         /6XYQu4lTwzUziO62Do3eiS9lUaaU4WE0yoeyAP5oGIU+W9z3DQRmHmlPJX2xhMaX/7C
         kZ73tZg0X/r1eHnRBF4cyXOnllKxSd9Ht46yBjJXEk7ZPaYEho9Lp8O8CUGHTbT49IGZ
         JrUazqBFZvsSku0wvJwP5KNarK/6vhQ7sY0jHI8lEmGwDy16SOETSiCQ9d5jLU5WzEQ3
         QqGzAm40UDOIioV+DjYb8FHdGjYveoRWh8h5a908ffD3WeJerZbjYrj2ISopLIi7OAP9
         OQqg==
X-Forwarded-Encrypted: i=1; AJvYcCUUC5SvL9Up/pUEtGbuhF6C//gT5r9HvY0Vs7LXM2q6UVfEFYGI8wPAPlSlbfEJR202EVm2v0G/tnJepWAi@vger.kernel.org, AJvYcCVmtmm3PmyLVgro1XEE5eXNfF0vt772Xej/4eX/kHh67uospJGhKNnyksupW7+qGA7/kgcRX8HGqhM=@vger.kernel.org, AJvYcCXOjE1WFxRbB8InBp8cLP4SmFkGnviiWaFCOxY6k5fSuv41IeqLHumdrNP4VSx4FpoovEuvrMKIH7cG48c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr1XY9W8by+EPfgMcuQn+ERbWlq88kfJ0kNf0VUNyg5KcmZRFx
	TbUo8Lg6tLIoZ1WlVrQwRvW6xsvWWyVMvACXYEUKUNGF9PEK4/088hGx
X-Gm-Gg: ASbGnctAj3K1hrflbp09TpM40Ry7CKnE6ibPxiq9dqYqlDQp6+Zfl/vP4HAKCcCm/81
	cV8ogb+IfhzfDVK4lCE0D/Qf6y0lHHRm3Yk7/Zmu9sk7Yh+hFBllqlL61jP32hB00C9oBdiNoc2
	kZjgwvsowz6/9RhCoXTFX5xmNDlT4J4FtDgPeu6j3+1pyqfvguYJ/up210g/D7pRY6gwFVLNmkV
	+YVepp7N3plc+l0PIF/Z19pCsUTnZxwZkQrktCDgF20i4NiNkxYWQUPHV7sbkwfHcRDxJPFmGGt
	HlutR+BhC50IKncD1Ya8OD8JxEySIHgsU1auQerGjY1rlfGDvc4J3uCH4JFyk6V9nhYC3BYDhiz
	Wr8GDEAm/waobgXtbqByZx+rHz/EcpqWMUJRMXRgGTpZhRpA1I1xK0OKi
X-Google-Smtp-Source: AGHT+IE++yQ6J3zklxF4MKp/EF/leIEps5+hFjKqjdF7o1BmnbGKHkCjf3wy7jm1GMw4qcEy+y+sJw==
X-Received: by 2002:a17:906:d263:b0:ad8:9a3b:b26e with SMTP id a640c23a62f3a-ae9c9b5ddd4mr1870923966b.56.1753089497441;
        Mon, 21 Jul 2025 02:18:17 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:16 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:33 +0200
Subject: [PATCH v9 06/10] dt-bindings: npu: rockchip,rknn: Add bindings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250721-6-10-rocket-v9-6-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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
index 0000000000000000000000000000000000000000..caca2a4903cd1556226fd2bff6ea9a63dbd375c2
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
+        iommus = <&rknn_mmu_0>;
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


