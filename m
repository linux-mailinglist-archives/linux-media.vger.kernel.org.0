Return-Path: <linux-media+bounces-23085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD8F9EBA3F
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 20:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C439E280C47
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 19:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E9E8226866;
	Tue, 10 Dec 2024 19:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C5PRaJ0U"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2016B22578E;
	Tue, 10 Dec 2024 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733859664; cv=none; b=QPcleLn/2YCKUqyt3cN3P4iamJjEsRubwJrN7/wH1YybmV7fUEtlawhiLVRISoBJrzSkDF3fReTUsVfZaxiH9oHxgAOWtKN0K8VvfUE9XEvRlt+SvKXhtD/ft8NVUBTcfbPDKI/0vEpDPEUN6a+nmGPxdh7g0A89uxiQgiwxFkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733859664; c=relaxed/simple;
	bh=JsSMDgrRsjlUEEBw4cfo3sBgrN48B3LbiFcqeflM+UM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SXEoK3FjuAfoF2+fiyB6Zy7NMcFiGFtWg4kQtsIrnrPnoJmGDzLFLKBEIiPFEihY22xwu/hGol5VP3nFJDD7v3jH7WhYLXOXDEqdiQP4z/TXjTak7Gio4CSA0xLlU3M7tX3SszUtDis+Z0vlbIQLs3MmTu+D7HqmonBs48PN1Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C5PRaJ0U; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733859660;
	bh=JsSMDgrRsjlUEEBw4cfo3sBgrN48B3LbiFcqeflM+UM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C5PRaJ0UJSTLEhkldbllVJZrXZ03Ns9AkRGYruGVwPyk+GghgB6hf3y6wHaZu5WG2
	 +juJiAajfeJ0FVF2OgdR/1iJH6FyOdmVDKyZXyEhJXXGWIJ+dq2/j7Lpzodpd8dRKV
	 AyHYw3cCWiBTq7u01SQRWF9yfSD3Jp8t1whT/4ql+kkiV1KmH3YbWlpnh/zImiB6j0
	 ipja0fOpb8LxXl0jnc4MISceDL+ILGLXJN71khEg/V1jw+SIiFgaZvwzr2xvxTajSX
	 falUaD02rePcanLayyiJurW867bkKClI6NM4I8L8wDQz9tiWARYUrG2tzvsCokXNju
	 mPyiVZ0lS8YwQ==
Received: from shreeya.shreeya (unknown [110.226.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: shreeya)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A685F17E37F1;
	Tue, 10 Dec 2024 20:40:43 +0100 (CET)
From: Shreeya Patel <shreeya.patel@collabora.com>
To: heiko@sntech.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	hverkuil@xs4all.nl,
	hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	shreeya.patel@collabora.com,
	dmitry.osipenko@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RESEND PATCH v5 2/4] dt-bindings: media: Document bindings for HDMI RX Controller
Date: Wed, 11 Dec 2024 01:09:02 +0530
Message-Id: <20241210193904.883225-3-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210193904.883225-1-shreeya.patel@collabora.com>
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for the Synopsys DesignWare HDMI RX Controller.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---

Changes in v5 :-
- Correct the interrupt IRQ number

Changes in v4 :-
- No change

Changes in v3 :-
- Rename hdmirx_cma to hdmi_receiver_cma
- Add a Reviewed-by tag

Changes in v2 :-
- Add a description for the hardware
- Rename resets, vo1 grf and HPD properties
- Add a proper description for grf and vo1-grf phandles
- Rename the HDMI Input node name to hdmi-receiver
- Improve the subject line
- Include gpio header file in example to fix dt_binding_check failure

 .../bindings/media/snps,dw-hdmi-rx.yaml       | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml

diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
new file mode 100644
index 000000000000..510e94e9ca3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Device Tree bindings for Synopsys DesignWare HDMI RX Controller
+
+---
+$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare HDMI RX Controller
+
+maintainers:
+  - Shreeya Patel <shreeya.patel@collabora.com>
+
+description:
+  Synopsys DesignWare HDMI Input Controller preset on RK3588 SoCs
+  allowing devices to receive and decode high-resolution video streams
+  from external sources like media players, cameras, laptops, etc.
+
+properties:
+  compatible:
+    items:
+      - const: rockchip,rk3588-hdmirx-ctrler
+      - const: snps,dw-hdmi-rx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: cec
+      - const: hdmi
+      - const: dma
+
+  clocks:
+    maxItems: 7
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: audio
+      - const: cr_para
+      - const: pclk
+      - const: ref
+      - const: hclk_s_hdmirx
+      - const: hclk_vo1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: axi
+      - const: apb
+      - const: ref
+      - const: biu
+
+  memory-region:
+    maxItems: 1
+
+  hpd-gpios:
+    description: GPIO specifier for HPD.
+    maxItems: 1
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the general register file
+      containing HDMIRX PHY status bits.
+
+  rockchip,vo1-grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the Video Output GRF register
+      to enable EDID transfer through SDAIN and SCLIN.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+  - pinctrl-0
+  - hpd-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/rk3588-power.h>
+    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
+    hdmi_receiver: hdmi-receiver@fdee0000 {
+      compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
+      reg = <0xfdee0000 0x6000>;
+      interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
+                   <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
+                   <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
+      interrupt-names = "cec", "hdmi", "dma";
+      clocks = <&cru ACLK_HDMIRX>,
+               <&cru CLK_HDMIRX_AUD>,
+               <&cru CLK_CR_PARA>,
+               <&cru PCLK_HDMIRX>,
+               <&cru CLK_HDMIRX_REF>,
+               <&cru PCLK_S_HDMIRX>,
+               <&cru HCLK_VO1>;
+      clock-names = "aclk",
+                    "audio",
+                    "cr_para",
+                    "pclk",
+                    "ref",
+                    "hclk_s_hdmirx",
+                    "hclk_vo1";
+      power-domains = <&power RK3588_PD_VO1>;
+      resets = <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
+               <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
+      reset-names = "axi", "apb", "ref", "biu";
+      memory-region = <&hdmi_receiver_cma>;
+      pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_5v_detection>;
+      pinctrl-names = "default";
+      hpd-gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
+    };
-- 
2.39.2


