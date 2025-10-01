Return-Path: <linux-media+bounces-43505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 929CDBB17F4
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 20:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07DCE4A649D
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 18:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CBF2D4811;
	Wed,  1 Oct 2025 18:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="kwOHFWIC"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AC412CD8B;
	Wed,  1 Oct 2025 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759343517; cv=pass; b=TMq0HhtLkre4iEgYN1mwukliG2dCuPBV7aSjPk2EMSlViSgtdTL2txZ/ssctKfFtvHlNi85uPayBWIDhEIcKVsg7RyNf/069h2NdmCwtssbOYiyLn+SVxRe/zXW2tK5vzs1G3RbA04EUrtpwSXozvEPIGyckOzxBRbfe878iCjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759343517; c=relaxed/simple;
	bh=4BlsQK6hu84yffCNw/vLaKs56wlWnO3gqqiBdOFVmQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DOA8yKeRIrqsa96W1tv7fL+UD7xKqhE7uxhjyrWyrqm9G73MzDC/67fCoToqDLhLIRPDY7rZO7sNagen+9wR3Otyddon1SRmZ4g9tRpIqzuuimysrQkc4P2dNNCWHXy2ySaNaDARQ+PGQLPs5svdmwJgfMZeAOWy9H5FtrQrAHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=kwOHFWIC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1759343499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MnfkV/QraCT2nEFHlMtP3veonzUh8G6xopxDwoU4jmysazq5A17wHCvGl4pL1u9jZ1fBG0gYQRaAFLOLL9HzRyt12vmZI9RRKu20X9etAaPm+iyTvat52EpJQ13myv2DkK6/S0u2NMZ8uUr1tfnyf8ggoNuf7ibQ6R9wAOzNrEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759343499; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ueXnuvF8NcC5dz827yR+2fQW9nE2zi6Yqc5bfd4+/B4=; 
	b=XqNdY3YvzBlyBZLBKfXCPZnI+l7YlhKjCYy4JUpHuBwJ4MQMgL/0E3E3A7CyjF1ZaaL5lwqiHS+mjdKWW7h3AIOnG2BrYWih6qDlsOKo1PiAvO/4IjyjEhzUVR/SLhiLur7bx9nwYFQL6fR7TahizggpqVIPVBh+1ZtXhmEQg44=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759343499;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ueXnuvF8NcC5dz827yR+2fQW9nE2zi6Yqc5bfd4+/B4=;
	b=kwOHFWICLM0m6/DktWnmiDSleXnnrcTAt6vp+DqUX2hfIAd1bEaiUFTOWsseqhDH
	afAC6j7hogJyAiQNpyJYxcUa24upoOQjDGaaNybWu3vK4eDFJ6ZcgS5uOWHKdsDMejX
	vecqpuCTTYZQX+kBCoOM8637ysbgm1xFRO4PMwWk=
Received: by mx.zohomail.com with SMTPS id 1759343496555351.1782091237104;
	Wed, 1 Oct 2025 11:31:36 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	conor+dt@kernel.org,
	houlong.wei@mediatek.com,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	robh@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v3] dt-bindings: media: Convert MediaTek mt8173-mdp bindings to DT schema
Date: Wed,  1 Oct 2025 15:31:15 -0300
Message-ID: <20251001183115.83111-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Convert the existing text-based DT bindings for MediaTek MT8173 Media Data
Path to a DT schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
 .../bindings/media/mediatek-mdp.txt           |  96 ----------
 2 files changed, 169 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
new file mode 100644
index 0000000000000..8ca33a733c478
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT8173 Media Data Path
+
+maintainers:
+  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
+
+description:
+  Media Data Path is used for scaling and color space conversion.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt8173-mdp-rdma
+          - mediatek,mt8173-mdp-rsz
+          - mediatek,mt8173-mdp-wdma
+          - mediatek,mt8173-mdp-wrot
+      - items:
+          - const: mediatek,mt8173-mdp-rdma
+          - const: mediatek,mt8173-mdp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  mediatek,vpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to Mediatek Video Processor Unit for HW Codec encode/decode and
+      image processing.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-mdp-rdma
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Main clock
+            - description: Mutex clock
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Main clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8173-mdp-rdma
+              - mediatek,mt8173-mdp-wdma
+              - mediatek,mt8173-mdp-wrot
+    then:
+      required:
+        - iommus
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-mdp
+    then:
+      required:
+        - mediatek,vpu
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/memory/mt8173-larb-port.h>
+    #include <dt-bindings/power/mt8173-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mdp_rdma0: rdma@14001000 {
+            compatible = "mediatek,mt8173-mdp-rdma",
+                         "mediatek,mt8173-mdp";
+            reg = <0 0x14001000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+                     <&mmsys CLK_MM_MUTEX_32K>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+            mediatek,vpu = <&vpu>;
+        };
+
+        mdp_rdma1: rdma@14002000 {
+            compatible = "mediatek,mt8173-mdp-rdma";
+            reg = <0 0x14002000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RDMA1>,
+                     <&mmsys CLK_MM_MUTEX_32K>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_RDMA1>;
+        };
+
+        mdp_rsz0: rsz@14003000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14003000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_rsz1: rsz@14004000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14004000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_rsz2: rsz@14005000 {
+            compatible = "mediatek,mt8173-mdp-rsz";
+            reg = <0 0x14005000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_RSZ2>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        };
+
+        mdp_wdma0: wdma@14006000 {
+            compatible = "mediatek,mt8173-mdp-wdma";
+            reg = <0 0x14006000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WDMA>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WDMA>;
+        };
+
+        mdp_wrot0: wrot@14007000 {
+            compatible = "mediatek,mt8173-mdp-wrot";
+            reg = <0 0x14007000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WROT0>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WROT0>;
+        };
+
+        mdp_wrot1: wrot@14008000 {
+            compatible = "mediatek,mt8173-mdp-wrot";
+            reg = <0 0x14008000 0 0x1000>;
+            clocks = <&mmsys CLK_MM_MDP_WROT1>;
+            power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+            iommus = <&iommu M4U_PORT_MDP_WROT1>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
deleted file mode 100644
index 253a93eabb5e5..0000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-* Mediatek Media Data Path
-
-Media Data Path is used for scaling and color space conversion.
-
-Required properties (controller node):
-- compatible: "mediatek,mt8173-mdp"
-- mediatek,vpu: the node of video processor unit, see
-  Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml for 
-  details.
-
-Required properties (all function blocks, child node):
-- compatible: Should be one of
-        "mediatek,mt8173-mdp-rdma"  - read DMA
-        "mediatek,mt8173-mdp-rsz"   - resizer
-        "mediatek,mt8173-mdp-wdma"  - write DMA
-        "mediatek,mt8173-mdp-wrot"  - write DMA with rotation
-- reg: Physical base address and length of the function block register space
-- clocks: device clocks, see
-  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- power-domains: a phandle to the power domain, see
-  Documentation/devicetree/bindings/power/power_domain.txt for details.
-
-Required properties (DMA function blocks, child node):
-- compatible: Should be one of
-        "mediatek,mt8173-mdp-rdma"
-        "mediatek,mt8173-mdp-wdma"
-        "mediatek,mt8173-mdp-wrot"
-- iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-
-Example:
-	mdp_rdma0: rdma@14001000 {
-		compatible = "mediatek,mt8173-mdp-rdma";
-			     "mediatek,mt8173-mdp";
-		reg = <0 0x14001000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RDMA0>,
-			 <&mmsys CLK_MM_MUTEX_32K>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-		mediatek,vpu = <&vpu>;
-	};
-
-	mdp_rdma1: rdma@14002000 {
-		compatible = "mediatek,mt8173-mdp-rdma";
-		reg = <0 0x14002000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RDMA1>,
-			 <&mmsys CLK_MM_MUTEX_32K>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
-	};
-
-	mdp_rsz0: rsz@14003000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14003000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ0>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_rsz1: rsz@14004000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14004000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ1>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_rsz2: rsz@14005000 {
-		compatible = "mediatek,mt8173-mdp-rsz";
-		reg = <0 0x14005000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_RSZ2>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-	};
-
-	mdp_wdma0: wdma@14006000 {
-		compatible = "mediatek,mt8173-mdp-wdma";
-		reg = <0 0x14006000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WDMA>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WDMA>;
-	};
-
-	mdp_wrot0: wrot@14007000 {
-		compatible = "mediatek,mt8173-mdp-wrot";
-		reg = <0 0x14007000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WROT0>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WROT0>;
-	};
-
-	mdp_wrot1: wrot@14008000 {
-		compatible = "mediatek,mt8173-mdp-wrot";
-		reg = <0 0x14008000 0 0x1000>;
-		clocks = <&mmsys CLK_MM_MDP_WROT1>;
-		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
-		iommus = <&iommu M4U_PORT_MDP_WROT1>;
-	};
-- 
2.51.0


