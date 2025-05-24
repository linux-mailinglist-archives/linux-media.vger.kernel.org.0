Return-Path: <linux-media+bounces-33317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D74AC2F93
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 13:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 404FCA206CC
	for <lists+linux-media@lfdr.de>; Sat, 24 May 2025 11:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8462F1E9B02;
	Sat, 24 May 2025 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tmW8rKlX"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F811E2823;
	Sat, 24 May 2025 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748087529; cv=none; b=Qqa+bNxj8OKuIu+gFqMi9Av6T3CsICriQ4HKrhrwuK4SZSWp8nCskuv0EvDySZnrZ4wMpMqDft2M3qbdNecMtNlRsQhfPqJl0PhFegMz4bXzrqPaHWtXh1fwjsPBF5WVj1G2PKF741aGd5Fr3Z+CWDRj38TGcVwkIlELJ/aTdQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748087529; c=relaxed/simple;
	bh=GEZhTsGk3ZVSazcgFBI82QwzzCMtVU89vuijeUdVM8Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lDLB8BjYvHBRJ/PtPEOIGJWzucpsJnbiSbUab0vLuESpJZbvSt+vR3IXEYCdE5WlWdWLBsiH37ksHrwt4wnfG8U83+dREnRJl47BDfvNwKU1vH/KlHWac/mW1CG4msVvzkIInZIvs1NF9KpSV9YyeOxIb52AaAB0PrPXmpDwtZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tmW8rKlX; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7a7ccd30389511f0813e4fe1310efc19-20250524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kq/RIYP37aN0j/sweXWMRbMR+f6iN6gPQkEajgOKD/s=;
	b=tmW8rKlXb2I/Q2tSIkY1dvhRbQFLqzS2L3f59H7gPZdl65InkE6WmCj4TvIj129K05nqIkWZ++a43uSS2ElUags+adp42XQgYy5A25+qtDKNjPXtyO9XAhDXo1ADVjVDMuLObwNjxU7wgi5e1F/T/YMsQFozXMr9PKBBlbfyal0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:41116408-5831-4d70-bc34-cb7218a21f2d,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:edfaad47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 7a7ccd30389511f0813e4fe1310efc19-20250524
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 541028794; Sat, 24 May 2025 19:51:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
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
Subject: [PATCH v1 02/10] dt-bindings: media: Add MT8188 ImgSys's LARB
Date: Sat, 24 May 2025 19:49:54 +0800
Message-ID: <20250524115144.3832748-3-olivia.wen@mediatek.com>
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

This patch adds support for the MT8188 Image System's Local Arbiter
(LARB) in the device tree bindings. The LARB is a crucial component in
MediaTek's ImgSys architecture, responsible for managing memory access
and arbitration between various hardware modules.

Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>
---
 .../bindings/media/mediatek,imgsys-larbs.yaml | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml b/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
new file mode 100644
index 000000000000..d2966c64ddb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,imgsys-larbs.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,imgsys-larbs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LARB Information for MediaTek Camera Image System Hardware
+
+maintainers:
+  - Olivia Wen <olivia.wen@mediatek.com>
+
+description:
+  Detailed configuration for MediaTek Camera Image System's Local Arbiter
+  (LARB) hardware integration.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-imgsys-larbs
+
+  iommus:
+    minItems: 1
+    maxItems: 30
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+required:
+  - compatible
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
+
+    imgsys-l11b {
+        compatible = "mediatek,mt8188-imgsys-larb";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        iommus = <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_0>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_1>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_0>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_1>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_CQ0>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_CQ1>,
+             <&vpp_iommu M4U_PORT_L11B_PIMGI_P1>,
+             <&vpp_iommu M4U_PORT_L11B_PIMGBI_P1>,
+             <&vpp_iommu M4U_PORT_L11B_PIMGCI_P1>,
+             <&vpp_iommu M4U_PORT_L11B_IMGI_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_IMGBI_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_IMGCI_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTI_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTI_T4_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTI_T6_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVBO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVCO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_0>,
+             <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_4P_0>,
+             <&vpp_iommu M4U_PORT_L11B_WROT_P1>,
+             <&vpp_iommu M4U_PORT_L11B_TCCSO_P1>,
+             <&vpp_iommu M4U_PORT_L11B_TCCSI_P1>,
+             <&vpp_iommu M4U_PORT_L11B_TIMGO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVO_T2_C>,
+             <&vpp_iommu M4U_PORT_L11B_YUVO_T5_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTO_T1_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTO_T4_C>,
+             <&vpp_iommu M4U_PORT_L11B_SMTO_T6_C>,
+             <&vpp_iommu M4U_PORT_L11B_DBGO_T1_C>;
+    };
-- 
2.45.2


