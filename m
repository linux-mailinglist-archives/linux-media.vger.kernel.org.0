Return-Path: <linux-media+bounces-36918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEEAFA8E0
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 03:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CF923B467B
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 01:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067C31D5AC0;
	Mon,  7 Jul 2025 01:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QQi3vYKG"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAC51B0F33;
	Mon,  7 Jul 2025 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751851935; cv=none; b=Ooy1JkfLNMJ3lUPjBIq/xDrKdnSxNTkEjt102+G/ssnojry3ZUFzprCqYKPy9Ilj1UMB817iY4UsjQus4K9UbJvnI6v4ZxoDkZ4dDLL3Yhq2s7H+VYTKuLS0/QJUV6YuzFJyIqRUMewRQEOsxw0mNOI5SIVDm/Wwl1ZmUawCiYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751851935; c=relaxed/simple;
	bh=631dtQH0JwwwTXukk0MxXx97wvnhYCBKEKEdg5jyfYg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekDwrAZCQ4DIVNDI7wMNLwKXtVt530PvHhBOAPiuB6mTGOvv18aJFR7x8u1rmPIdSaB0GVvNPEXB7+Y7ehdeDtAlk/B0sBlL+eSHsnnYMjQgtB/XEkK8YjCVlnrLQhthKHjZp2McBVuVnjNhgQSghs9QDYYF/F+OeLzuk5UJcdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=QQi3vYKG; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2da10f585ad211f0b1510d84776b8c0b-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9yxv9B+ZNUkuaWw2CZRUqnNvn+dTrF4fhWFkMUqKXeM=;
	b=QQi3vYKGqQfVstRFHXxuaGbQXHKNUKRbODsaGdOi7JE0n7tz4kIgkYrZ1eyv5VXYLyB5etAM3DyNNuZnqIVGWyNFMQubbErMcSoks0mEvfegGvlQYiOIGZifD+N5niNKjQK/LRkNlU2bxIV11y9ELAJ2WrVi9900zViA40ge7Eg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:5df8c442-09db-4c66-b407-1507c92131db,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:9eb4ff7,CLOUDID:69fec79c-b8a9-480a-b7e5-687022facff7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2da10f585ad211f0b1510d84776b8c0b-20250707
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shangyao.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1683010872; Mon, 07 Jul 2025 09:32:00 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:31:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:31:58 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 01/13] dt-bindings: media: mediatek: add camisp binding
Date: Mon, 7 Jul 2025 09:31:42 +0800
Message-ID: <20250707013154.4055874-2-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: "shangyao.lin" <shangyao.lin@mediatek.com>

Add camera isp7x module device document.

---

Changes in v2:
  - Rename binding file to mediatek,mt8188-camisp.yaml
  - Split bindings into four separate patches (one per YAML file)
  - Various fixes per review comments
  - Update maintainers list

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../mediatek/mediatek,mt8188-camisp.yaml      | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-camisp.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-camisp.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-camisp.yaml
new file mode 100755
index 000000000000..53dbf5152e78
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-camisp.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2024 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek/mediatek,camisp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: The camisp unit of MediaTek ISP system
+
+maintainers:
+  - Shangyao Lin <shangyao.lin@mediatek.com>
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description:
+  MediaTek camisp is the ISP auxiliary unit for camera system in MediaTek SoC.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-camisp
+
+  reg:
+    minItems: 1
+    maxItems: 1
+    description:
+      Base address of the camisp hardware block.
+
+  reg-names:
+    items:
+      - const: base
+    minItems: 1
+    maxItems: 1
+    description:
+      Name for the register region. Must be "base".
+
+  power-domains:
+    minItems: 1
+    maxItems: 1
+    description: Power domain for the camisp block.
+
+  mediatek,scp:
+    description: MediaTek co-process unit for ISP system
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+
+    soc {
+      isp@16000000 {
+        compatible = "mediatek,mt8188-camisp";
+        reg = <0 0x16000000 0 0x1000>;
+        reg-names = "base";
+        mediatek,scp = <&scp_dual>;
+        power-domains = <&spm MT8188_POWER_DOMAIN_CAM_MAIN>;
+      };
+    };
+
+...
\ No newline at end of file
-- 
2.18.0


