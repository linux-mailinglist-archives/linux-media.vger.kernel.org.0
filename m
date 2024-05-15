Return-Path: <linux-media+bounces-11472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E41578C6585
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 13:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13C701C21C35
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2024 11:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C692E6F06D;
	Wed, 15 May 2024 11:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c5i5rGnn"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4B96E617;
	Wed, 15 May 2024 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715772229; cv=none; b=cTA7Ywlg+vC64k6M9WKZvJmVLIRedY1mtvtae9Wt2qCH/oZl8ID6lPgdUAOK4uLJ1OjClxYC4uurTuU55ewudGdPHxYCKSNecDjJAmeVVDzwA/tTR724/gSfFy1DIUk9eXziB+aqsHP9kN1U5++j94WyNkxgU7MXIl6eECulEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715772229; c=relaxed/simple;
	bh=qM1TDFcxh+PiMjy8AJB98oy8yX3j/UJC9igLh6IPfX8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cvGCfKgjY1Apge3l7d9ONICzuu8Ipje0BMUHopSucGipoA1DpQAPz7S11NkSkUwzzJIdQfHqKHJ6hdWyX4fmr33uNzSRJ49PdnhEtvuK+yCAmq7CAmbhd3hvKghQ9JDEgeZwjVC6TC/MhHbXBN0gCrWeTu39ufC1nbV4MHq3d28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=c5i5rGnn; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 94de844812ad11efb92737409a0e9459-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CsDipHrMcSMQZ5T1xzar/uAvtmPl0zEeVcCMjR5KaC0=;
	b=c5i5rGnnJH3cA62MBtwDtZc6hm/5liYJDd3mi5O3txRo3QBUwqth6IeDGnLCUfL3ofUnyM181II9a1vWpUTv0VpCWe4O9PPQn3H8Fyi41hHoK7C213GLoj0m7oHTVR2D0FHyK5MvsmTMNuNJ9Vmyus5vJTCAuwyQF13v6k7x2ng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:f9a45b0c-bcec-4af9-b9c1-5f4a8b691f0e,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:82c5f88,CLOUDID:2cc81ffc-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 94de844812ad11efb92737409a0e9459-20240515
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1109716021; Wed, 15 May 2024 19:23:40 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:23:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:23:35 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech
	<joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, "Pavel
 Machek" <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
	<ppaalanen@gmail.com>, <willy@infradead.org>, Logan Gunthorpe
	<logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>,
	<jianjiao.zeng@mediatek.com>, <kuohong.wang@mediatek.com>,
	<youlin.pei@mediatek.com>
Subject: [PATCH v5 1/9] dt-bindings: reserved-memory: Add mediatek,dynamic-restricted-region
Date: Wed, 15 May 2024 19:23:00 +0800
Message-ID: <20240515112308.10171-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.946300-8.000000
X-TMASE-MatchedRID: l5qCKP2S+CYxaBEU4bKrV8LPXKYZysJRecvjbu/xDjpMOjKUxCZwr6oy
	tXMP4p4T7Oz5SO8AjrT8deRGOD4hQJ/vdeQQfVo4zfqlpbtmcWhMkOX0Uoduubuqk4cq52pzNDP
	jsaoNaOmcPcDHCp4L+uSWVqW5qzmOGHMruoCVNItsG7r4Qh7N3J15MaKbV6Qv92wasZo4p00VN8
	HXIE+U8k5/nzWZD6z607K+59sjwLdAXbiRmn1bD54CIKY/Hg3AaZGo0EeYG978V77yhJRgo99pj
	zubZ2rHwrbXMGDYqV+FR9Hau8GO7oCxaPcRWGBYkik2Q7DaYM+FM1ZvdZds7crl8mP4ERMT9yXU
	za0W6DonyDffjvbK+iB9TparQODyGAhBST/DW+QK0fPSRjZItaWn1XP+V4+Y82Gj2QC3yG0smXV
	K/H8eHzG7sr7xobSAsPEFD+rZA81DDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.946300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	92DBBFBA56F52E6A5E22EDA4524B47671DD9FFB83DFC8A6B06D3DD2320D9BA292000:8
X-MTK: N

Add a binding for describing the dynamic restricted reserved memory range.
The memory range also will be defined in the TEE firmware. It means the TEE
will be configured with the same address/size that is being set in this
DT node. Regarding to the detail TEE command, Please search
MTK_TZCMD_SECMEM_ZALLOC and MTK_TZCMD_SECMEM_FREE.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../mediatek,dynamic-restricted-region.yaml   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-restricted-region.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-restricted-region.yaml b/Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-restricted-region.yaml
new file mode 100644
index 000000000000..5cbe3a5637fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-restricted-region.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/mediatek,dynamic-restricted-region.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Dynamic Reserved Region
+
+description:
+  A memory region that can dynamically transition as a whole between
+  secure and non-secure states. This memory will be protected by OP-TEE
+  when allocations are active and unprotected otherwise.
+
+maintainers:
+  - Yong Wu <yong.wu@mediatek.com>
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: mediatek,dynamic-restricted-region
+
+required:
+  - compatible
+  - reg
+  - reusable
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        reserved-memory@80000000 {
+            compatible = "mediatek,dynamic-restricted-region";
+            reg = <0x80000000 0x18000000>;
+            reusable;
+        };
+    };
-- 
2.25.1


