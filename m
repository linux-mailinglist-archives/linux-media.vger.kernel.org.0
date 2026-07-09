Return-Path: <linux-media+bounces-67087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FCe4MjYVT2r6aAIAu9opvQ
	(envelope-from <linux-media+bounces-67087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 05:27:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DC42872C46A
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 05:27:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b="PY/RdAaZ";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67087-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-67087-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D28A3020D25
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 03:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C4A38B133;
	Thu,  9 Jul 2026 03:27:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F18E36D9F6;
	Thu,  9 Jul 2026 03:27:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783567663; cv=none; b=phLjHlXLfk2gXyYVp2p6KwQyoLBa2jCKsrbaRxTStrDsG69T0wgNFc7sQSXtvnRRiVdkkRvDtiAazcZvhEXNKNwppaYVFAxs6qY8hAPNlV+1WMYbjaBDQ27Q3wKt+VEfkMg9+jl9BlAoZWahBGkki0TjIMQiY2UuBR6lwRpi8gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783567663; c=relaxed/simple;
	bh=/uF8Kg6y6Fu1rBMtYqW6leB8o1ApzeDn9wVFXIcdNns=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qyT5eCZvM3BLBeoPoj+kbrjWXMJVuEMZESODzmsfER0ODZon4ITM6T15vvQWRFc+fyGAb3AYM3MkI3DWnClozx0ZpuR5Y+8HXtt+fLKFeZZvGdpVp8kmpff4cyd1WzCKxX5v3S0McKQPS6k2oKLB1K3L+Ud2+hgx8gGx9jaFrqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PY/RdAaZ; arc=none smtp.client-ip=210.61.82.184
X-UUID: 21762e8a7b4611f18dc8c9802ae25ab1-20260709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2BRD1Gp5164QiUOR5PbsNTFChT5+p1uqHNWdI1JbBIY=;
	b=PY/RdAaZrihxJ4/2tJgAFtExHe1vYU5WhKTXESeKQy54i8UqMkmdm3KUYROe4c/2LFZQstG76b1GCNSgrNXYAoOSxDzPpkkQMPtbs8167eSbInMs9MyU4dD1XFwrJAZaV4E5kPwI+B4go6cVq1fnbz1CWkQe4XFUGZ8ZhDH/TOQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:e696974f-bb69-49c0-8a16-8bc48ccea949,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:c03a2158-fac4-43c3-afe2-1defadc905cc,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|100|102|156,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 21762e8a7b4611f18dc8c9802ae25ab1-20260709
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 569043469; Thu, 09 Jul 2026 11:27:36 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 9 Jul 2026 11:27:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 9 Jul 2026 11:27:34 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <nicolas@ndufresne.ca>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH v9 2/3] dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible string
Date: Thu, 9 Jul 2026 11:26:55 +0800
Message-ID: <20260709032657.25730-3-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260709032657.25730-1-jianhua.lin@mediatek.com>
References: <20260709032657.25730-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67087-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[ndufresne.ca,kernel.org,gmail.com,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nicolas@ndufresne.ca,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:Project_Global_Chrome_Upstream_Group@mediatek.com,m:sirius.wang@mediatek.com,m:vince-wl.liu@mediatek.com,m:jh.hsu@mediatek.com,m:jianhua.lin@mediatek.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jianhua.lin@mediatek.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianhua.lin@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC42872C46A

Add the compatible string for the JPEG encoder block found in the
MediaTek MT8189 SoC.

Unlike some previous SoCs, the MT8189 JPEG encoder requires 34-bit IOVA
address space support. Therefore, it is added as a standalone compatible
string without falling back to the generic "mediatek,mtk-jpgenc" to
ensure the driver applies the correct hardware-specific configurations.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-encoder.yaml | 35 +++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5b15f8977f67..62a327f74b90 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -14,13 +14,17 @@ description: |-
 
 properties:
   compatible:
-    items:
+    oneOf:
       - enum:
-          - mediatek,mt2701-jpgenc
-          - mediatek,mt8183-jpgenc
-          - mediatek,mt8186-jpgenc
-          - mediatek,mt8188-jpgenc
-      - const: mediatek,mtk-jpgenc
+          - mediatek,mt8189-jpgenc
+      - items:
+          - enum:
+              - mediatek,mt2701-jpgenc
+              - mediatek,mt8183-jpgenc
+              - mediatek,mt8186-jpgenc
+              - mediatek,mt8188-jpgenc
+          - const: mediatek,mtk-jpgenc
+
   reg:
     maxItems: 1
 
@@ -45,6 +49,15 @@ properties:
       Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
       Ports are according to the HW.
 
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      A phandle to the local arbiter (SMI LARB) node. This explicitly
+      describes the hardware topology where the JPEG block is connected
+      to a dedicated SMI LARB for memory bandwidth arbitration. It is
+      required to accurately represent the hardware connection independently
+      of the IOMMU.
+
 required:
   - compatible
   - reg
@@ -54,6 +67,16 @@ required:
   - power-domains
   - iommus
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-jpgenc
+    then:
+      required:
+        - mediatek,larb
+
 additionalProperties: false
 
 examples:
-- 
2.45.2


