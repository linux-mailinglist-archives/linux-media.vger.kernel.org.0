Return-Path: <linux-media+bounces-26423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B030CA3D1B4
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 08:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 658E93AD1D5
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 07:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4391E7C18;
	Thu, 20 Feb 2025 07:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tIGBH5Zf"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DAC1E47D9;
	Thu, 20 Feb 2025 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740034887; cv=none; b=N8uOiX9SYRkRaIwgnSEynbmPAEUO66UrVAReRKmpRc45LYcwYCCfKRxcM9gRc26t4tb8qSyVIsYq+45ZzCwNi6K/xmFeNiGV9DyeYsbFhoADT1NHpHJ97X+v/Gvzn8D6mjOch0pMmWTV9ou2FeNKV7TE8zuwjdN/+ZmH6WmFYCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740034887; c=relaxed/simple;
	bh=Z5wrTWu1ObrZhRf1PuGR0xs1vpV1ODKX1aAMfXRSuIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uCKMWm4RYbID4maMDNOVnhIA17/vcdgSuB/Gs/XmaOaHIGUBcgNS0yz8lccjZYDJ7PcSgBO49lAz1ZYrNP0U7DbAjmx4rP+SFdR2dcHXh9br9OZgXdt1L2BTM9TT2nTQdZdvfO5NaKY+lnbJ++RnCIKC3O6NxZyRYj1koaV4wYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tIGBH5Zf; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7b6e75daef5811ef8eb9c36241bbb6fb-20250220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GBpfUY9olAAkhSfL2VXX5zsMPlwbrPBi5J4Rr2vR3II=;
	b=tIGBH5ZfeygUKKBwCD4R4nA3uDBXIXQxgmgI14ICScfAegsL8npBgfsG7IlKIALZqdSx4OTFa78A+Sg4o3wOcA6nFmxss12NGohuUfeyLs4rbHVbEGDwxn/lyMtD4080WyDGCceSV9VCtX3U96HeGxxz+UObahQWsTe+giKSR0o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:3ba59015-72e6-4930-9f15-6eae1c042d7d,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:fca55bb5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7b6e75daef5811ef8eb9c36241bbb6fb-20250220
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 803668369; Thu, 20 Feb 2025 15:01:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 20 Feb 2025 15:01:16 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 20 Feb 2025 15:01:16 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor
 Dooley <conor+dt@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<zhaoyuan.chen@mediatek.com>, <teddy.chen@mediatek.com>
Subject: [PATCH v4 1/4] media: dt-bindings: add MT8188 AIE
Date: Thu, 20 Feb 2025 14:59:50 +0800
Message-ID: <20250220070114.15015-2-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250220070114.15015-1-bo.kong@mediatek.com>
References: <20250220070114.15015-1-bo.kong@mediatek.com>
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
Changes in v4:
1. Remove address-cells and size-cells
2. Remove larb12 related content
3. Update id content

Changes in v3:
None

Changes in v2:
1. Fix coding style
---
 .../bindings/media/mediatek,mt8188-aie.yaml   | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
new file mode 100644
index 000000000000..232b5afc2ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
@@ -0,0 +1,90 @@
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
+  AIE(AI Engine) is one of the units in mt8188 ISP which
+  provides hardware accelerated face detection function,
+  it can detect different sizes of faces in a raw image.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8188-aie
+
+  reg:
+    maxItems: 1
+    description: Physical base address and length of the register space.
+
+  interrupts:
+    maxItems: 1
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Must contain the local arbiters in the current SoCs, see
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+      for details.
+
+  iommus:
+    maxItems: 4
+    description:
+      Points to the respective IOMMU block with master port as argument, see
+      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+      Ports are according to the HW.
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
+      - const: img_ipe
+      - const: ipe_fdvt
+      - const: ipe_top
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
+      clock-names = "img_ipe",
+                    "ipe_fdvt",
+                    "ipe_top";
+    };
-- 
2.45.2


