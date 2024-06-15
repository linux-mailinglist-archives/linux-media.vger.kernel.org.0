Return-Path: <linux-media+bounces-13293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA85909573
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 03:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF058285A55
	for <lists+linux-media@lfdr.de>; Sat, 15 Jun 2024 01:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F23EAC7;
	Sat, 15 Jun 2024 01:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JGHH+EUF"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B32FCA6B;
	Sat, 15 Jun 2024 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718416707; cv=none; b=WU6fI7uMnBMcE36P5vpfQF0zxGQJTR7T7TFgXJo0M7CeFQRkfXt8OI9EDbM4z9ptyL5w66qFuUy5YmsH0spca4Yi9DcqWc2YgiCkja6CuJr0GfhPnFKO5fjHVdTrDM8jBU6l1Xcf3R5NarM8L8usdI7Iai4RVsEsFgHSuJs0ShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718416707; c=relaxed/simple;
	bh=7LZ/FP1QmtvjACTE2f8O6hoX6TgsfBpUkTOe/3lcqDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+0QwOeGP6M4VJcVoaCRw7HiXISOvBcRYWpkrIm/WUzi8vYXH6LZ3gWBsla+8/N4LEsso679M4jWcyiUy5VHN0zy065JEJgqka6tsc5BW2BLU1G1t3t/3n/egGtBJqcY+0Avz1iScEmSYMM3iPpnnM8FwNW3BNZEqv8laKhijko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JGHH+EUF; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718416704;
	bh=7LZ/FP1QmtvjACTE2f8O6hoX6TgsfBpUkTOe/3lcqDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGHH+EUFdDCx+0Uair3kGw8oOxdoysb8igYxpPsCaF++LM0CzfNmn9z0bk/yQBxVz
	 r5VS8Ypy+f3kFDyKyFYQsWHu5qNxC89RdNmmdw2/107j3zqI5Wq5lU36cJ7JIod2CQ
	 JYbi5RiSM3OfqPbdHUIkRAfLT7HeAsoijRdlZLbS+gpCHtf/LJF+Rx3dYOKUOE9+MU
	 iMaEgGfplXJTXuYJE0IJAJlfwxdm/C4pJbH9CLVRu0I1LMueCqo81KhexDSST0RoKo
	 6+HPCvOjv3UXvYnUDZvQAOTrzLkN3vDahVggFoQMdR1/54muaDG0QkYtWEPZfVRHHG
	 v0+2PSdttl/jA==
Received: from arisu.hitronhub.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 11EC537821C3;
	Sat, 15 Jun 2024 01:58:20 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 2/3] media: dt-bindings: rockchip: Document RK3588 Video Decoder 2 bindings
Date: Fri, 14 Jun 2024 21:56:28 -0400
Message-ID: <20240615015734.1612108-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240615015734.1612108-1-detlev.casanova@collabora.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Rockchip RK3588 Video Decoder 2 bindings.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../bindings/media/rockchip,vdec2.yaml        | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec2.yaml

diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec2.yaml b/Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
new file mode 100644
index 000000000000..e54891b46986
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/rockchip,vdec2.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip,vdec2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Video Decoder 2 (VDec2)
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |-
+  The Rockchip rk3588 has a stateless Video Decoder that can decodes H.264,
+  HEVC, VP9 and AVS2 streams.
+
+properties:
+  compatible:
+    const: rockchip,rk3588-vdec2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The Video decoder AXI interface clock
+      - description: The Video decoder AHB interface clock
+      - description: The Video decoder core clock
+      - description: The Video decoder CABAC clock
+      - description: The Video decoder HEVC CABAC clock
+
+  clock-names:
+    items:
+      - const: axi
+      - const: ahb
+      - const: core
+      - const: cabac
+      - const: hevc_cabac
+
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/power/rk3588-power.h>
+
+    vdec2: video-codec@fdc38100 {
+        compatible = "rockchip,rk3588-vdec2";
+        reg = <0x0 0xfdc38100 0x0 0x500>;
+        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
+                 <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
+        clock-names = "axi", "ahc", "core",
+                      "cabac", "hevc_cabac";
+        assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
+                          <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
+        assigned-clock-rates = <800000000>, <600000000>,
+                               <600000000>, <1000000000>;
+        power-domains = <&power RK3588_PD_RKVDEC0>;
+    };
+
+...
-- 
2.44.2


