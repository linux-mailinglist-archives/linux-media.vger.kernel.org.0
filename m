Return-Path: <linux-media+bounces-36917-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C249AFA8DD
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 03:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C16081894A85
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 01:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5321A83F7;
	Mon,  7 Jul 2025 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BnlR651Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C4728E7;
	Mon,  7 Jul 2025 01:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751851932; cv=none; b=kSscAYGBGjslJNqN9o3YT9p8Eeut+lo9XYnUNcHZXhf/+HiUfQaPxBNy6cJFOfU/hTj3g2ezlSmYMInC28wz0VuNbstgUxBqYdcDwr+943+rvm9YG+XpBG2uSJJknuPUx5HJIE6+4M8UXyTr+cSxddgz+DwjuTkOtg1/Ww3S56o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751851932; c=relaxed/simple;
	bh=c4mz24+uIEgZP/zbZ4GY5gUi4GHqqwmZtQDCr5bdGtM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=df5/Q0EceTmlYAFSZKtaxfSD+3oBYLop/m820LmUvJ6BNPdlC2x/mWrTbHBabnUq4x+x/Jw9BqZMqLkZYhZgnPuk0sZxxDi1JRFOT+u88btPeUGaMNRQKWql3mbs34CAfaaqJXMQ5vH5GpGZs5BXM/tHDJ8M8gzs1N87sAM6tdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BnlR651Z; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 30e8cc8c5ad211f0b1510d84776b8c0b-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZzMOl2Ky58KKtiKwQ5AlruNWO0UQZa7Vyr+LxTHTVVA=;
	b=BnlR651ZLf8lepxYjBZEC0oULSHtlh94pqeeAXfu9Ve2NThVjSbYJSwSKUaJA8KB7EWNG4jVezf3VCYv2/uMpvkkRQFPbZrIITQkasYaz4KOuuTw8YhVvEQ0M7hkgNzYiBzVURFFFWI0vy7+qbL15L8ASkPApkvJvjN08N4IYMQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:68331ff6-c91b-4b9d-829f-e9af432df466,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:9eb4ff7,CLOUDID:3abe0260-2aa0-4c76-8faa-804d844c7164,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|97|99|83|106|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30e8cc8c5ad211f0b1510d84776b8c0b-20250707
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shangyao.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1224092829; Mon, 07 Jul 2025 09:32:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:32:04 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:32:04 +0800
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
Subject: [PATCH v2 02/13] dt-bindings: media: mediatek: add seninf-core binding
Date: Mon, 7 Jul 2025 09:31:43 +0800
Message-ID: <20250707013154.4055874-3-shangyao.lin@mediatek.com>
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

1. Add camera isp7x module device document

---

Changes in v2:
  - Rename binding file to mediatek,mt8188-seninf-core.yaml
  - Various fixes per review comments
  - Update maintainers list

Question for reviewer (CK):

Hi CK,

Thank you for your review and suggestions on this patch, especially for providing the reference patch (https://patchwork.kernel.org/project/linux-mediatek/list/?series=874617) and for mentioning in another patch ([V1,02/10] MEDIA: PLATFORM: MEDIATEK: ADD SENINF CONTROLLER) the suggestion to "Move the phy part to phy/mediatek/ folder. You could refer to phy/mediatek/phy-mtk-mipi-csi-0-5.c".

After reading your comments and the reference patches, my understanding is that only the seninf-core driver should manage all ports internally, and each port corresponds to a PHY. During probe, the driver will parse each port, obtain the corresponding PHY (e.g., devm_phy_get(dev, "csi0"), devm_phy_get(dev, "csi1"), etc.), and operate the PHY for each port individually during stream on/off or power on/off.

Could you please confirm if my understanding is correct?
If you have any additional reference patches or examples, I would greatly appreciate it.

Thank you for your guidance!

Best regards,
Shangyao

Signed-off-by: shangyao.lin <shangyao.lin@mediatek.com>
---
 .../mediatek/mediatek,mt8188-seninf-core.yaml | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml
new file mode 100755
index 000000000000..763b96b561cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek Inc.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: The seninf-core top unit of MediaTek ISP system
+
+maintainers:
+  - Shangyao Lin <shangyao.lin@mediatek.com>
+  - Shu-hsiang Yang <shu-hsiang.yang@mediatek.com>
+  - Shun-yi Wang <shun-yi.wang@mediatek.com>
+  - Teddy Chen <teddy.chen@mediatek.com>
+
+description: |
+  MediaTek seninf-core is the ISP sensor interface unit in MediaTek SoC.
+  The sensor interface serves as the MIPI-CSI2 top RX controller.
+
+properties:
+  compatible:
+    const: mediatek,mt8188-seninf-core
+
+  reg:
+    minItems: 1
+    maxItems: 1
+    description: |
+      Base address register region.
+
+  reg-names:
+    items:
+      - const: base
+    minItems: 1
+    maxItems: 1
+
+  mtk_csi_phy_ver:
+    description: Describes MediaTek camera Rx controller version
+    $ref: /schemas/types.yaml#/definitions/string
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+
+  power-domains:
+    minItems: 1
+    maxItems: 4
+
+  clocks:
+    minItems: 4
+    maxItems: 4
+    description: List of clock phandles required by the controller.
+
+  clock-names:
+    items:
+      - const: clk_cam_seninf
+      - const: clk_top_seninf
+      - const: clk_top_seninf1
+      - const: clk_top_camtm
+    minItems: 4
+    maxItems: 4
+
+  mediatek,larbs:
+    description: |
+      List of phandles to the local arbiters in the current SoCs.
+      Refer to bindings/memory-controllers/mediatek,smi-larb.yaml.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 32
+
+  dma-ranges:
+    description: |
+      Describes the address information of IOMMU mapping to memory.
+      Defines six fields for the MediaTek IOMMU extended iova, pa, and size.
+    minItems: 1
+
+  phys:
+    description: List of phandle and args to the PHY provider.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  phy-names:
+    description: Names of the PHYs.
+    $ref: /schemas/types.yaml#/definitions/string-array
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+
+    seninf@16010000 {
+      compatible = "mediatek,mt8188-seninf-core";
+      reg = <0 0x16010000 0 0x8000>;
+      reg-names = "base";
+      mtk_csi_phy_ver = "mtk_csi_phy_2_0";
+      interrupts = <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH 0>;
+      power-domains = <&spm MT8188_POWER_DOMAIN_CSIRX_TOP>,
+                      <&spm MT8188_POWER_DOMAIN_CAM_VCORE>,
+                      <&spm MT8188_POWER_DOMAIN_CAM_MAIN>;
+      clocks = <&camsys CLK_CAM_MAIN_SENINF>,
+               <&topckgen CLK_TOP_SENINF>,
+               <&topckgen CLK_TOP_SENINF1>,
+               <&topckgen CLK_TOP_CAMTM>;
+      clock-names = "clk_cam_seninf",
+                    "clk_top_seninf",
+                    "clk_top_seninf1",
+                    "clk_top_camtm";
+    };
+
+...
\ No newline at end of file
-- 
2.18.0


