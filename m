Return-Path: <linux-media+bounces-42368-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C59B53864
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 17:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1862E188AF77
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41C5356912;
	Thu, 11 Sep 2025 15:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GHbuWtUc"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B3C345726;
	Thu, 11 Sep 2025 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606251; cv=none; b=n3FD8gmuGT0dcbkRrgg042KCjga5yKuaE9EnobmuJz+TgByJuKr/7kdILaFGzEfisDIIocJQgYQoDtAm0gc9FwDN1bw0y6JRZbOJEDG+eYZYB2EE2mMjSAhHEViHH5YEnGTkDYNJ+ngVFm21OlY4SiXpfkmJ8HINQdlWO+F0Hpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606251; c=relaxed/simple;
	bh=heh+k/1ODoaxXv2R5HPjXJm6oybJcbQZVD3EyshC35g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1KBFHa4sfpNvn0klibfqiYGqlOYni0BwUL4eumEiBLnQk9HKYNfPBXW43W7HkCFxm4Cn6g7QUz7JGzpid2Dbr5vZMBMwauWovAmP4Aw0ubfFGWW/Ru6M3wcrVHy9w7C/T0fY1b5ujuRiXkONdlRyp04WP30NGl2IIkXCnMAr/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GHbuWtUc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757606247;
	bh=heh+k/1ODoaxXv2R5HPjXJm6oybJcbQZVD3EyshC35g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GHbuWtUcRVBoVaUx/NKmcy08pY/B8d5VQ27aFIwvZvgK8Gy9moE1hd95mLTpWD56I
	 hbXUrRJ13vJL4n0J5WDMVjIHYkwCyREl9taUOgvULJFDxBlYTz5ovyqrV+bLxE23Ny
	 blTviMbeJK1mYGAB75zb35jG4oL+tnoCy8ubiasiLBaIwYHhQe7XKEvzKFYGldMB0W
	 ZISUzLXeFuGH6TYSW3imANRzw4ri947YdJ5CxHBj2zeEPmuVSxtpGBQ6eC5XWCmQ3u
	 p4aGRfBm89qgewn3I5/Y4q9wtX2GpRU6Bk4OgPiJNMpvkFuPAQBjQOvKnlq7vV+Gzm
	 k3joLjrg19y9A==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36e5:357f:56a7:54dd])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 59F4517E1091;
	Thu, 11 Sep 2025 17:57:27 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	linux-media@vger.kernel.org,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 2/7] dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
Date: Thu, 11 Sep 2025 17:57:12 +0200
Message-ID: <20250911155720.180465-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device tree binding for the Verisilicon (VSI) IOMMU.
This IOMMU sits in front of hardware encoder and decoder
blocks on SoCs using Verisilicon IP, such as the Rockchip RK3588.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iommu/verisilicon,iommu.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml

diff --git a/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml b/Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
new file mode 100644
index 000000000000..d3ce9e603b61
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
+    items:
+      - const: rockchip,rk3588-av1-iommu
+      - const: verisilicon,iommu-1.2
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
+      - const: core
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
+      iommu@fdca0000 {
+        compatible = "rockchip,rk3588-av1-iommu","verisilicon,iommu-1.2";
+        reg = <0x0 0xfdca0000 0x0 0x600>;
+        interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
+        clock-names = "core", "iface";
+        #iommu-cells = <0>;
+      };
+    };
-- 
2.43.0


