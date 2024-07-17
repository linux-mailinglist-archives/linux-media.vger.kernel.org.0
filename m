Return-Path: <linux-media+bounces-15078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6D9933D31
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 14:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BD8D1C23862
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 12:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3636A1802D4;
	Wed, 17 Jul 2024 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M0tywjZS"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0F38DC3;
	Wed, 17 Jul 2024 12:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721220884; cv=none; b=Wx1wFGn7AqEKu6zbvaTdfOo7hEjecvB4R+zdAcTBMMgOGZrE341hsSji6bjtt4nACPcZ5vL+BwvhB+8TrDOFZppaKQOlLdNtafH2i006GXnEhqrBYj7wr80FZhSl8FtvNcQXbJ64om/asdv5M9A1c0xY51FvVc6I7Gm4fGRydAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721220884; c=relaxed/simple;
	bh=/Nw9hc16VvCTkEo87Lx9+g1aQkovudhbvTgDKKNZNVA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cY8f5IjSEcn9DRhYlWR09Vi4i+cSz0ViDlUYHgIzTC4lpT/aTwp0ePLsYHOgUEZvMH3xUAbl+8L6Pm5HukMPhUQ8dgBgJenCrGPKd6oLVyESIbTQpyTgEUbvKVYJF/g1/yRVTCw+OzxjQ535Ti/SgB7DHSL5HhlkUHs6jX9llMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=M0tywjZS; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b3b35bc2443b11ef87684b57767b52b1-20240717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UFxsFxy+p6qngLI5V1N0rpnbRifRrEnu5xypjg+jAnY=;
	b=M0tywjZSuBR0O9usWCsnDdszsLPaNIsQmtKXDcyXk7/W1wx7xcrnrS6hvvPfPAD5B9xiiJDceJGY6dyacNdOF/mrFYENqwdfzxLksqz4A6bjh40daJuFNryy9qdIge4wqCK99uMyLqgRhw7dJiywF1TrQl8B7L7bZeBBrwXNlQU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:0bff3b46-dbb3-4651-bc1a-410ec6fc5777,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:b28a910d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b3b35bc2443b11ef87684b57767b52b1-20240717
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yelian.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1887325292; Wed, 17 Jul 2024 20:54:28 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 Jul 2024 05:54:30 -0700
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 Jul 2024 20:54:30 +0800
From: 20220614094956 created <yelian.wang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yelian Wang
	<yelian.wang@mediatek.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
	<hidenorik@chromium.org>
Subject: [PATCH 1/3] media: dt-bindings: add MT8188 AIE
Date: Wed, 17 Jul 2024 20:41:55 +0800
Message-ID: <20240717125426.32660-2-yelian.wang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717125426.32660-1-yelian.wang@mediatek.com>
References: <20240717125426.32660-1-yelian.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Yelian Wang <yelian.wang@mediatek.com>

Add YAML device tree binding for MT8188 AIE.

Signed-off-by: Yelian Wang <yelian.wang@mediatek.com>
---
 .../bindings/media/mediatek-aie.yaml          | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-aie.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek-aie.yaml b/Documentation/devicetree/bindings/media/mediatek-aie.yaml
new file mode 100644
index 000000000000..300aef43e02b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-aie.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek-aie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The AIE Unit of MediaTek Camera System
+
+maintainers:
+  - Yelian Wang <yelian.wang@mediatek.com>
+
+description:
+  MediaTek AIE is the ISP unit in MediaTek SoC.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt8188-aie
+      - enum:
+          - mediatek,aie-hw3.1
+          - mediatek,aie-hw3.0
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  reg:
+    maxItems: 2
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
+    maxItems: 4
+    minItems: 4
+
+  clock-names:
+    items:
+      - const: IMG_IPE
+      - const: IPE_FDVT
+      - const: IPE_SMI_LARB12
+      - const: IPE_TOP
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
+    aie: aie@15310000 {
+      compatible = "mediatek,mt8188-aie", "mediatek,aie-hw3.1";
+      reg = <0 0x15310000 0 0x1000>;
+      interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+      mediatek,larb = <&larb12>;
+      iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
+               <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
+      power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+      clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+               <&ipesys CLK_IPE_FDVT>,
+               <&ipesys CLK_IPE_SMI_LARB12>,
+               <&ipesys CLK_IPESYS_TOP>;
+      clock-names = "IMG_IPE",
+                    "IPE_FDVT",
+                    "IPE_SMI_LARB12",
+                    "IPE_TOP";
+    };
-- 
2.34.1


