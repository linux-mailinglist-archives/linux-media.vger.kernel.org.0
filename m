Return-Path: <linux-media+bounces-29287-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD4A79D28
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEB087A6227
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 07:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5209241682;
	Thu,  3 Apr 2025 07:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N8wMtqK1"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C704B22CBC9;
	Thu,  3 Apr 2025 07:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743666018; cv=none; b=hKyD7GW5g/AjbNdmCFNtMMP7Z6xHnBnM/Vp+5vXwec4zAOHUnS9MurS1gHN5jrd6pgZxpIyZvkuwgZayQPSzQKjvks65f46BZdPZ5PWT5KLrtuKgZAn7ONWYI4PtH5MANq11sGiINdTcgQZjJpaMjK9+oDCxCPQA2W/1yNbC5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743666018; c=relaxed/simple;
	bh=NiYwD3xS7y25WvibUMq5XXUcu4V80ry5iS40KaeNfxc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ep0Q9ntyqMWbNdfjDyDFuQw/81EuyrEtbMH7NNQu/JgKRBwnR73QrplS0XSDdFNrTKMEqapcLBeFJQS1HPo38eKuC5kX9izf47OKo/19/miF+EZNVZZkVcvqQitceMMtkCB+X9CiOoOR6Xt1ET9qTzGga3C8d00pCwXfG8/f7V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=N8wMtqK1; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: dedc2352105e11f0aae1fd9735fae912-20250403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=j7V+na5WMoWftKQ2Hz3mhtzoxRwiO3a5WF1VMKOb3JI=;
	b=N8wMtqK1O1QhkAXLaW1QNLneRqVSkX66rNKMIA7aX4jZW5iMCG8+p6Smg1f6ywmS+2iVWfYMsSMwoCkjLEqP4JT4l+1rZHbf33P2hT+lj+ggGGxappyPw/i0LhQeTGTb+L4Uy0r1knfWXPQLYQjPbPqAUMXopriwryoK4Vv0cTs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:249707aa-77b5-41c5-b7a7-e825b2b2a545,IP:0,UR
	L:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:0ab6a5a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dedc2352105e11f0aae1fd9735fae912-20250403
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1810931772; Thu, 03 Apr 2025 15:40:10 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 15:40:08 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 15:40:08 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Rob Herring <robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <zhaoyuan.chen@mediatek.com>, <Teddy.Chen@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 1/4] media: dt-bindings: add MT8188 AIE
Date: Thu, 3 Apr 2025 15:38:33 +0800
Message-ID: <20250403074005.21472-2-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403074005.21472-1-bo.kong@mediatek.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Bo Kong <Bo.Kong@mediatek.com>

Add YAML device tree bindings for MT8188 AIE.

Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
---
Changes in v5:
1. Modify the description to make it more concise.
2. Delete the description of reg.
3. Modify the description of iommus and delete the maxItems of iommus.
4. Delete all mediatek,larb.
5. Modify the name of clock, change _ to -.

Changes in v4:
1. Remove address-cells and size-cells
2. Remove larb12 related content
3. Update id content

Changes in v3:
None

Changes in v2:
1. Fix coding style
---
 .../bindings/media/mediatek,mt8188-aie.yaml   | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
new file mode 100644
index 000000000000..861110bb0c98
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8188-aie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The AI Engine Unit of MediaTek Camera System
+
+maintainers:
+  - Bo Kong <bo.kong@mediatek.com>
+
+description:
+  AIE(AI Engine) provides a hardware-accelerated face detection function.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8188-aie
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    description:
+      List of the hardware port in respective IOMMU block for current Socs.
+      Refer to bindings/iommu/mediatek,iommu.yaml.
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock for imgsys main ipe
+      - description: clock for ipe fdvt
+      - description: clock for ipe top
+
+  clock-names:
+    items:
+      - const: img-ipe
+      - const: ipe-fdvt
+      - const: ipe-top
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - iommus
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    aie@15310000 {
+      compatible = "mediatek,mt8188-aie";
+      reg = <0x15310000 0x1000>;
+      interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+      iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
+      power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+      clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+               <&ipesys CLK_IPE_FDVT>,
+               <&ipesys CLK_IPESYS_TOP>;
+      clock-names = "img-ipe",
+                    "ipe-fdvt",
+                    "ipe-top";
+    };
-- 
2.45.2


