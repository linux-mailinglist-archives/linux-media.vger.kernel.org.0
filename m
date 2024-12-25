Return-Path: <linux-media+bounces-24057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A689FC459
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 10:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E263D188307A
	for <lists+linux-media@lfdr.de>; Wed, 25 Dec 2024 09:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B9B1B218E;
	Wed, 25 Dec 2024 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lnFm3U4K"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7AD17D355;
	Wed, 25 Dec 2024 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735117294; cv=none; b=bJcG1zDZJBPtbAK2RYhwNWEh17W1MVmzzq8D/xzOLJ97weCp9vuc1Hr8FvSw4EC6S5w4FYSaQHrfKoSEmNRaDL38Usq2+tNqOqA64bjvCVbjM2tqVfvmkKM3108LmhJf14DKrwnw9QMYfe4qc2xxZ4+D46/rJEvEZKu0PcMYDyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735117294; c=relaxed/simple;
	bh=x1FeLClNJsCu5qRRbYsVbiIVvszVTmbO88fWW9N4HAo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8FQxOvJdg0Wwz2XKO4BfhRF1LOwjUxrSCH3DWbDp8TJgFCceLp2Vkox2tqyxJaEFHPEAuu6X9HKCMlROTZDT/EIIygA7yM9Kwm+Qo/Bt4zDTM2QOKRGmSz0Eb2UZNmkbOmRfvoYY0hv8ecwraB/vWKrT5GKqNX6mjR2rGYN1Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lnFm3U4K; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cd0e54c8c29e11efbd192953cf12861f-20241225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=aBWKK6ZjzSvH7LyonCX8Syja9oBgc2RQ52O9697Qzlc=;
	b=lnFm3U4Knm5GkDtDR518EbfYQaXPlQH3vlzN4C2tKT5akWihbs2DonyX6E2W4HJD0o7KdnNhjxaYK14t0JVSLQAdRezn0U5G/k3RBFFhqoUoJvOsoZQ/SPWP8pmsSsYuIV3Ehcqa6my9C/OjvZRW0+jzFmzelwItMeo6y5jp87w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:97304ac2-58cf-496e-bc9f-bb23bcf017c5,IP:0,U
	RL:25,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:9417df36-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cd0e54c8c29e11efbd192953cf12861f-20241225
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 637652939; Wed, 25 Dec 2024 17:01:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Dec 2024 17:01:15 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Dec 2024 17:01:15 +0800
From: bo.kong <bo.kong@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>
CC: <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 2/4] media: dt-bindings: add MT8188 AIE
Date: Wed, 25 Dec 2024 17:00:21 +0800
Message-ID: <20241225090113.17027-3-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241225090113.17027-1-bo.kong@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
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

Changes in v3:
none

Changes in v2:
1. Fix coding style
---
 .../bindings/media/mediatek,mt8188-aie.yaml   | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
new file mode 100644
index 000000000000..63dd720ef6ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek-aie.yaml#
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
+      - description: clock for ipe smi larb12
+      - description: clock for ipe top
+
+  clock-names:
+    items:
+      - const: img_ipe
+      - const: ipe_fdvt
+      - const: ipe_smi_larb12
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
+      #address-cells = <2>;
+      #size-cells = <2>;
+      compatible = "mediatek,mt8188-aie";
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
+      clock-names = "img_ipe",
+                    "ipe_fdvt",
+                    "ipe_smi_larb12",
+                    "ipe_top";
+    };
-- 
2.45.2


