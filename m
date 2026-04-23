Return-Path: <linux-media+bounces-59389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDoeN+/t6Wm2nAIAu9opvQ
	(envelope-from <linux-media+bounces-59389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:01:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1107A4502CB
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 12:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA337302B72E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD7C3E8C5A;
	Thu, 23 Apr 2026 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k+rkIqbD"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CD23E6399;
	Thu, 23 Apr 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937639; cv=none; b=vCLl5sUmNqVQH9qror7kqfXngOlfjhJk/juIUrlUJKg9U0CYkAoKJDKjVYgRmuc3DxPfsdqMnUj93j8N5v9MWBhcbaVuuFVZZq5l5uNQD8mB7HcOhK9l66xpPzEkKCaCqYNRJk+Mm7trOOPUzmCEKawzleYrgBVeiQ7GEdLo5wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937639; c=relaxed/simple;
	bh=xnuiii9zq94ZjQ33C5+BwNfuGZD5x+YdWMy1IteqJZU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4N7MW283f+EiZAe+DPQnLL2LXXB2UhRWlgS8UXN04A1OAa88D/HgdKQjCYV0SqqUYc0AJuPcX3Bm1Pha93q7uqfajeF+02/7sUvrat9Y3uPikU8N6J1nlhCqKdlyjpzCRqrjvTGWU2EadihoIVS9XGXy3NL9z0LVoiJvV6n1JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=k+rkIqbD; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6697a2703ef911f19a16598d5ca7f8ec-20260423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=l86b3wFQLp7qqyYC3UYkYG48yFwPuGR6BvkHaLpMrlk=;
	b=k+rkIqbDXQ0d/Qksa+6Dc+gmpG4R61hUFzZ55MNuZq59V1n9/ixtQIvhXohouTWCbLsUIkEKPcam1Gmt9pSs4Mj0fh/gW5sgE2zGtewqj+qMNGJ+TKZTIi+4vZUAMCwwKhQqmyiEgc4bsnicOICZgPUR2Jnkn02B+sZZDlY6OeE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6864d365-ae37-4f89-af61-75bef4bdb0a9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:e7bac3a,CLOUDID:1a96cb8f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6697a2703ef911f19a16598d5ca7f8ec-20260423
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1956706885; Thu, 23 Apr 2026 17:47:11 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Apr 2026 17:47:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Apr 2026 17:47:09 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v14 10/12] media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc compatible
Date: Thu, 23 Apr 2026 17:46:54 +0800
Message-ID: <20260423094656.32044-11-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260423094656.32044-1-kyrie.wu@mediatek.com>
References: <20260423094656.32044-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,collabora.com,gmail.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-59389-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	MAILSPIKE_FAIL(0.00)[104.64.211.4:query timed out];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 1107A4502CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Compared to the previous generation IC, the MT8196 uses SMMU
instead of IOMMU and supports features such as dynamic voltage
and frequency scaling. Therefore, add "mediatek,mt8196-jpgenc"
compatible to the binding document.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/mediatek,mt8195-jpegenc.yaml           | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index 596186497b68..e2d772ea0fb0 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195-jpgenc
+    enum:
+      - mediatek,mt8195-jpgenc
+      - mediatek,mt8196-jpgenc
 
   power-domains:
     maxItems: 1
@@ -44,7 +46,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mt8195-jpgenc-hw
+        enum:
+          - mediatek,mt8195-jpgenc-hw
+          - mediatek,mt8196-jpgenc-hw
 
       reg:
         maxItems: 1
-- 
2.45.2


