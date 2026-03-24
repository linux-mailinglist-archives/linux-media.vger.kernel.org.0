Return-Path: <linux-media+bounces-56837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMdfDsVhwmmecAQAu9opvQ
	(envelope-from <linux-media+bounces-56837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:04:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC3306296
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 11:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCEF2305D6CD
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 09:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AF53DF008;
	Tue, 24 Mar 2026 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SyFfQfjb"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF913DEACF;
	Tue, 24 Mar 2026 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346138; cv=none; b=WpIAuFjw4paGFHVoKSQBwOofIVQFypDexh5Qcxs30Ywga3SprE832AK5zy6WTg6J90/C58N3FTr2BXjd5/R0MkPDO7AXMPbLQIXI+nayWmaqAemZMvWA5tVF8liujyGnX6G95zABDqQd/xJbHZEVgJWoIJqOHVanLkj/54pTsss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346138; c=relaxed/simple;
	bh=fatNy9RBzouY2zdjzofnd6rHUykqgXusKcCuyd/uUZs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FL8Ck8/WjvmkknR3B4uc2jF/pQYq2Ma6+WWK+kRUj7HCwWXLGpuZiuiIlwyl6HpsRRp9Oaby6Eq4EFHK5vOgNqsvbgbft9LX2l36C5ppUGYgae1KYPX5+DuV2GbaVvrc72eIUqvzuuiyjTnQl2C9Fzcp9RLCG889xbzYZWuHWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SyFfQfjb; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 98359e1c276711f1a02d4725871ece0b-20260324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/fBSZMb7Iwfd/5tDgwiZaN3Gwe32gMWlhzgFDOwLlKY=;
	b=SyFfQfjbH+EqHN0UKCfYmciNbKRiNlJBwcb02ZwYk5hvjyLUN2Oq5Z+gNgXS/7zXL4MCmaKgVnBnpFfEA2M3APHWSfYOVyL6znrrBEI1x7cWfwqK6TZG+uf3t1ZcHXvwY1MqNJdKguueg+Wy/yK8RbgBo3yhs1iaOKoohvfDE6o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:017d9fb2-4ead-4305-895a-61c998f694c8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:a70013d5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 98359e1c276711f1a02d4725871ece0b-20260324
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1323865086; Tue, 24 Mar 2026 17:55:31 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 17:55:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 17:55:29 +0800
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
Subject: [PATCH v4 1/3] dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible string
Date: Tue, 24 Mar 2026 17:54:53 +0800
Message-ID: <20260324095455.1437-2-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260324095455.1437-1-jianhua.lin@mediatek.com>
References: <20260324095455.1437-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ndufresne.ca,kernel.org,gmail.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56837-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianhua.lin@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:dkim,mediatek.com:email,mediatek.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A0BC3306296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the compatible string for the JPEG decoder block found in the
MediaTek MT8189 SoC.

Compared to previous generation ICs, the MT8189 JPEG decoder requires
34-bit IOVA address space support and only needs a single clock
("jpgdec") instead of two. Therefore, it is added as a standalone
compatible string without falling back to older SoCs.

Update the binding schema to include the new compatible string and add
an `allOf` block with conditional checks. This enforces the single clock
requirement for MT8189 while preserving the two-clock requirement
("jpgdec-smi", "jpgdec") for older SoCs.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
 .../bindings/media/mediatek-jpeg-decoder.yaml | 39 ++++++++++++++++---
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index a4aacd3eb189..91c9b2a4687b 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -17,13 +17,14 @@ properties:
     oneOf:
       - items:
           - enum:
-              - mediatek,mt8173-jpgdec
               - mediatek,mt2701-jpgdec
+              - mediatek,mt8173-jpgdec
       - items:
           - enum:
               - mediatek,mt7623-jpgdec
               - mediatek,mt8188-jpgdec
           - const: mediatek,mt2701-jpgdec
+      - const: mediatek,mt8189-jpgdec
 
   reg:
     maxItems: 1
@@ -32,13 +33,22 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 1
     maxItems: 2
-    minItems: 2
 
   clock-names:
-    items:
-      - const: jpgdec-smi
-      - const: jpgdec
+    minItems: 1
+    maxItems: 2
+    oneOf:
+      - items:
+          - const: jpgdec
+      - items:
+          - const: jpgdec-smi
+          - const: jpgdec
+
+  mediatek,larb:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the smi_larb node.
 
   power-domains:
     maxItems: 1
@@ -60,6 +70,25 @@ required:
   - power-domains
   - iommus
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8189-jpgdec
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+    else:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.46.0


