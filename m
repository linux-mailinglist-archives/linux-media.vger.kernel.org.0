Return-Path: <linux-media+bounces-34945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C0ADB48B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92C603A7AC6
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1899D21A458;
	Mon, 16 Jun 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D/48o0hS"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C991EF39F;
	Mon, 16 Jun 2025 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085783; cv=none; b=kyU1IPbfs81VwMGDXbXF/YyXO0VjOQzRn6GOFcmUHrjRJEXzKEM1yLq/gY9X/Nvu5QERgZyBtCaTSKQzEPx4S00r2/18u5nJIyzvZium1wNaTUZU1o61ytQViKhz6sinqSdxmK4TmaLGhVz6xYKvakCNNQXSR64faAGEYyuhIsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085783; c=relaxed/simple;
	bh=1qAxktOKxTbmW0PiEUnD73TVhfHHyVm3g/YRGIvKoo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIxYpMOhLKHAUgcMTA63fDCYgmYwKTljv4yVHB2RogEi6JPEtGVRw70s/xGP2O0zX3VBRLU2ESUHjP7aeDATW5J6SmhzO60fE1WjMpgYtfhSQ+pbWyakVp4bTI+JMl/ZeYx4bLqykurRjvW9R6f+PHn8hHcS1gyusYLr07D8JHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=D/48o0hS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750085774;
	bh=1qAxktOKxTbmW0PiEUnD73TVhfHHyVm3g/YRGIvKoo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/48o0hS+VOof0kZmubcLZBx8xyM7t61KMrnaKhdbnGOiRafcJqLF7/sGQtmXfeq4
	 HIP9h9bHDfyXRmpAU+JfzXsFu3LneN2/SbH8sC1qeN23JpRjCefjhOutT4xYeEcr5R
	 Ivn4z3126pRTla7dgZXQ6oBgEWcSPvp+hL7ozlablOpdJ5o6uWOVn3jlcqAyCMFtVi
	 d+PjvWUzktDO/wPj/2g0WDENEus0XNvoyvEkjJTRJ3Q8qT2V+BAhbccnUVwTuoWIWU
	 4sIwoMgQc1mkxHUGBZThb98dPEJ33amd1kshhEXEGEEt6jCxAOCDVPXr7Vd5Yr1aKx
	 arraEZebs9ADw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4811:e81c:4b33:730c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 06DC417E10C7;
	Mon, 16 Jun 2025 16:56:14 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 2/5] dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
Date: Mon, 16 Jun 2025 16:55:50 +0200
Message-ID: <20250616145607.116639-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree binding for the Verisilicon (VSI) IOMMU. This IOMMU sits
in front of hardware encoder and decoder blocks on SoCs using Verisilicon IP,
such as the Rockchip RK3588.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../bindings/iommu/verisilicon,iommu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
new file mode 100644
index 000000000000..acef855fc61d
--- /dev/null
+++ b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iommu/verisilicon,iommu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Verisilicon IOMMU
+
+maintainers:
+  - Benjamin Gaignard <benjamin.gaignard@collabora.com>
+
+description: |+
+  A Versilicon iommu translates io virtual addresses to physical addresses for
+  its associated video decoder.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: verisilicon,iommu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: Interface clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: iface
+
+  "#iommu-cells":
+    const: 0
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
+  - "#iommu-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      vsi_mmu: iommu@fdca0000 {
+        compatible = "verisilicon,iommu";
+        reg = <0x0 0xfdca0000 0x0 0x600>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
+        clock-names = "aclk", "iface";
+        #iommu-cells = <0>;
+      };
+    };
-- 
2.43.0


