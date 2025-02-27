Return-Path: <linux-media+bounces-27115-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3FA47573
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 06:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DAD016FAD3
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 05:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4FD21CC67;
	Thu, 27 Feb 2025 05:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="S/g4SB7r"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3D721B9E3;
	Thu, 27 Feb 2025 05:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740635539; cv=pass; b=D0VwjTyq+aVuekFUN5c1DXEBRy4ECj5JHkNXGwkAExa8DfBzuXZttEBQlD8ae0H6EeKNJG+oN/8M7nvFU5UQTRjCMBu3mGLwgBB9Q6b/EE6eVwbuHGfFtVeztO4156R3NgZH5RFKzSjbftsxf4IX57DOJ6FUrRIAuSPAeB2HD+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740635539; c=relaxed/simple;
	bh=s1ziSytSVmc8iAUI3o7CjEFR1GPcDl4EsLBgMcR8CUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GbmURHVTtyduQFDaSttaD8elC5eUCvHZL9bAvslVqPPh49GV5Mpff5IkbBq0mQzAb19lubEuUNmFmcWDXZSkXAJBvLYVauLVyiqxxJUlHqwVKZffHTa6YHWfadzU58QayBYWC9S6aZ2CRKs7E3Dwada4dZlviH4SvSe8BMVQzeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=S/g4SB7r; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740635494; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F6E6cGr2vBEnuClIPRVzbNYEtN/q9frPfpcXXJWYz9F8R1tSYhhaN1KApCs/enFN8dipXbG3tYPdhqkWCEwkTU6FjN97Hl0PM9KrnBsbHt7j6HuUiB1vFsHkWXuV16OgGiNmDvdjwqRFMDb8OUSPvNw3oFzkP3Z85wZype/0Prs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740635494; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FAp90OZBq8uFu2M+L9vXUc0FUFCjHQCQSXx6G4QVIok=; 
	b=fSPEZNMbSvPnM+Xe9TxN7BKUagHLjOVdha929srQ6f3C2jq8+PoQi0T16cOz4RkFuTwI+IfiAj5Bva4FE78ltD8fma+lMQqsiz63Q4VO0wH+jYRRmgPz6hBAjh0X/oUo/HmyjxhF7usWOWgown7ZgQrNoWOCzkCvI0sGfK0zkFE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740635494;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FAp90OZBq8uFu2M+L9vXUc0FUFCjHQCQSXx6G4QVIok=;
	b=S/g4SB7ra/X/Qwoe5Ru1LYUFrVcIp4ihYXVR8K5nD1hgF31sIZ0sYmwsz6utvvCf
	hmShDpQi6Q5G5nacWwKv9EVrKpoN8zyZ1W1SztE5Qba8wsPZN2LW+H+cnO4exs86UKt
	csuSi8eqJh2gPPB46gyO8oJ8eD5cJ/VQ9J+MEhTY=
Received: by mx.zohomail.com with SMTPS id 1740635492367382.1392896864369;
	Wed, 26 Feb 2025 21:51:32 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v12 2/6] dt-bindings: media: Document bindings for HDMI RX Controller
Date: Thu, 27 Feb 2025 08:50:21 +0300
Message-ID: <20250227055025.766018-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227055025.766018-1-dmitry.osipenko@collabora.com>
References: <20250227055025.766018-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Shreeya Patel <shreeya.patel@collabora.com>

Document bindings for the Synopsys DesignWare HDMI RX Controller.

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
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
2.48.1


