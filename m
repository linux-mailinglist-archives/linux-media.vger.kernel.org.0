Return-Path: <linux-media+bounces-33314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF79AC2F89
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A4914A5D07
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E382B1E5B64;
	Sat, 24 May 2025 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jgHrtuwv"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99791DF27E;
	Sat, 24 May 2025 11:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087528; cv=none; b=qJGUQ/PFiX1KJkGIoW19vde6jbCjrCA8yJ08Xcw7zIXbA6a+XZXalZfXA0NjMnUc4Fjn94K+8jBGvSuoQ8glflfCP7avQTnnT/qLsnWxLB2B2u1PhbmoH57TR4heWCG6AR1ANqUkSjiQ3v/h2YcMnGiKXN5E/bDfyQxIWJ048EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087528; c=relaxed/simple;
	bh=Pu9Yvmb9+8GRPligAAalQcAnQclxBISRhP/p5AS6HPQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNTRmxb0618rJ76K6d3PT59OaC8jblFgtFu5KeR9HD41I8evEvdzAnOs3kH4Y8dUQ3Ro3USqCbm37MxHlK9oNseOmRnc39Fqr4wsfJmidVhGJ5gEfCtfwDeRxFbC1obk6LU4gtfLcYUjB82K+/bFrkEUoesscrZ1WJHyFulfEUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jgHrtuwv; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7a736088389511f0813e4fe1310efc19-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LFhkfG5hFlvoLcVg2OosYLYbiX+Pk5SM/1IR3ru0lMQ=;
	b=jgHrtuwvPSvbJjT+lVuNrqpFJ0CWfYQ46eAu85vMNEZYxwev5IFZzmEiPFvjDLSK8pKStcmjfViWoCtEiOEXBUJYtlgZAGi3xnAjY7naybfvLYWeeXZnXAHO5/ZHtYdtd1CJqDviBMvELGGIhhdVc1Rn26i/1yFTFswywXLE03M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:c5f2383a-99fb-4f94-838e-a1118985b68f,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:eefaad47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7a736088389511f0813e4fe1310efc19-20250524
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 176741765; Sat, 24 May 2025 19:51:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 24 May 2025 19:51:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 24 May 2025 19:51:48 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Olivia Wen <olivia.wen@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<teddy.chen@mediatek.com>, <yunkec@chromium.org>
Subject: [PATCH v1 01/10] dt-bindings: media: Add MediaTek mt8188 ImgSys components
Date: Sat, 24 May 2025 19:49:53 +0800
Message-ID: <20250524115144.3832748-2-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250524115144.3832748-1-olivia.wen@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Introduce more Image System (ImgSys) components present in MT8188.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../bindings/media/mediatek,imgsys.yaml       | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,imgsys.yaml b/Documentation/devicetree/bindings/media/mediatek,imgsys.yaml
new file mode 100644
index 000000000000..c2899c4b227b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,imgsys.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,imgsys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Camera Image System
+
+maintainers:
+  - Olivia Wen <olivia.wen@mediatek.com>
+
+description:
+  MediaTek Camera Image System is the image processing hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-isp-imgsys
+
+  reg:
+    minItems: 1
+    maxItems: 17
+
+  clocks:
+    minItems: 1
+    maxItems: 17
+
+  clock-names:
+    minItems: 1
+    maxItems: 17
+
+  assigned-clocks: true
+
+  assigned-clock-parents: true
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  iommus:
+    minItems: 1
+    maxItems: 30
+
+  mediatek,larbs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+    items:
+      maxItems: 1
+    description: |
+      List of phandle to the local arbiters in the current Socs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
+      according to the local arbiter index, like larb0, larb1, larb2...
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - iommus
+  - mediatek,larbs
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8188-isp-imgsys
+
+    then:
+      required:
+        - compatible
+        - reg
+        - clocks
+        - clock-names
+        - iommus
+        - mediatek,larbs
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+
+    imgsys_fw: imgsys-fw@15000000 {
+        compatible = "mediatek,mt8188-isp-imgsys";
+        reg = <0 0x15000000 0 0x4000>,  /* 0 IMGSYS_TOP */
+              <0 0x15020000 0 0x10000>, /* 1 IMGSYS_TRAW */
+              <0 0x15040000 0 0x10000>, /* 2 IMGSYS_LTRAW */
+              <0 0x15640000 0 0x10000>, /* 3 IMGSYS_XTRAW */
+              <0 0x15100000 0 0x10000>, /* 4 IMGSYS_DIP */
+              <0 0x15150000 0 0x10000>, /* 5 IMGSYS_DIP_NR */
+              <0 0x15210000 0 0x10000>, /* 6 IMGSYS_PQDIP_A */
+              <0 0x15510000 0 0x10000>,	/* 7 IMGSYS_PQDIP_B */
+              <0 0x15200000 0 0x10000>,	/* 8 IMGSYS_WPE_EIS */
+              <0 0x15500000 0 0x10000>,	/* 9 IMGSYS_WPE_TNR */
+              <0 0x15600000 0 0x10000>,	/* 10 IMGSYS_WPE_LITE */
+              <0 0x15220000 0 0x00100>,	/* 11 IMGSYS_WPE1_DIP1 */
+              <0 0x15320000 0 0x10000>,	/* 12 IMGSYS_ME */
+              <0 0x15520000 0 0x00100>,	/* 13 IMGSYS_WPE2_DIP1 */
+              <0 0x15620000 0 0x00100>,	/* 14 IMGSYS_WPE3_DIP1 */
+              <0 0x15110000 0 0x00100>,	/* 15 IMGSYS_DIP_TOP */
+              <0 0x15130000 0 0x00100>;	/* 16 IMGSYS_DIP_TOP_NR */
+
+        assigned-clocks = <&topckgen CLK_TOP_IMG>;
+        assigned-clock-parents = <&apmixedsys CLK_APMIXED_IMGPLL>;
+        #address-cells = <2>;
+        #size-cells = <2>;
+        clocks = <&imgsys CLK_IMGSYS_MAIN_TRAW0>,
+             <&imgsys CLK_IMGSYS_MAIN_TRAW1>,
+             <&imgsys CLK_IMGSYS_MAIN_VCORE_GALS>,
+             <&imgsys CLK_IMGSYS_MAIN_DIP0>,
+             <&imgsys CLK_IMGSYS_MAIN_WPE0>,
+             <&imgsys CLK_IMGSYS_MAIN_WPE1>,
+             <&imgsys CLK_IMGSYS_MAIN_WPE2>,
+             <&imgsys CLK_IMGSYS_MAIN_GALS>,
+             <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_DIP_TOP>,
+             <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_DIP_NR>,
+             <&imgsys_wpe1 CLK_IMGSYS_WPE1>,
+             <&imgsys_wpe2 CLK_IMGSYS_WPE2>,
+             <&imgsys_wpe3 CLK_IMGSYS_WPE3>,
+             <&imgsys CLK_IMGSYS_MAIN_IPE>,
+             <&ipesys CLK_IPESYS_TOP>,
+             <&ipesys CLK_IPE_ME>,
+             <&ipesys CLK_IPE_SMI_LARB12>;
+        clock-names = "IMGSYS_CG_IMG_TRAW0",
+                  "IMGSYS_CG_IMG_TRAW1",
+                  "IMGSYS_CG_IMG_VCORE_GALS",
+                  "IMGSYS_CG_IMG_DIP0",
+                  "IMGSYS_CG_IMG_WPE0",
+                  "IMGSYS_CG_IMG_WPE1",
+                  "IMGSYS_CG_IMG_WPE2",
+                  "IMGSYS_CG_IMG_GALS",
+                  "DIP_TOP_DIP_TOP",
+                  "DIP_NR_DIP_NR",
+                  "WPE1_CG_DIP1_WPE",
+                  "WPE2_CG_DIP1_WPE",
+                  "WPE3_CG_DIP1_WPE",
+                  "ME_CG_IPE",
+                  "ME_CG_IPE_TOP",
+                  "ME_CG",
+                  "ME_CG_LARB12";
+
+        iommus = <&vdo_iommu M4U_PORT_L9_IMGI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_UFDI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_IMGBI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_IMGCI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_SMTI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_SMTI_T4_A>,
+                 <&vdo_iommu M4U_PORT_L9_TNCSTI_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_TNCSTI_T4_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVBO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVCO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_TIMGO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T2_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T5_A>,
+                 <&vdo_iommu M4U_PORT_L9_IMGI_T1_B>,
+                 <&vdo_iommu M4U_PORT_L9_IMGBI_T1_B>,
+                 <&vdo_iommu M4U_PORT_L9_IMGCI_T1_B>,
+                 <&vdo_iommu M4U_PORT_L9_SMTI_T4_B>,
+                 <&vdo_iommu M4U_PORT_L9_TNCSO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_SMTO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_SMTO_T4_A>,
+                 <&vdo_iommu M4U_PORT_L9_TNCSTO_T1_A>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T2_B>,
+                 <&vdo_iommu M4U_PORT_L9_YUVO_T5_B>,
+                 <&vdo_iommu M4U_PORT_L9_SMTO_T4_B>;
+
+        mediatek,larbs = <&larb9>,
+                         <&larb10>,
+                         <&larb11a>,
+                         <&larb11b>,
+                         <&larb11c>,
+                         <&larb15>,
+                         <&larb12>;
+    };
-- 
2.45.2


