Return-Path: <linux-media+bounces-59359-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBnbKkbM6WkKkgIAu9opvQ
	(envelope-from <linux-media+bounces-59359-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:37:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480944E09C
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E17B930C3E86
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 07:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE232ECD1D;
	Thu, 23 Apr 2026 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lR37S7GN"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C922D0C97;
	Thu, 23 Apr 2026 07:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776929641; cv=none; b=uko/N//Zs9aG40M1oC5TRordcxUQPPuxdTPhE8CbGA9EXsIdFCeOheNZ5TtCV2sXg6yZLCdZ+5cQmRw0V09TrdqhZXJhUAK5LY1YAhXiLazymGOjMDra1ebJ4JC2P4vCkczwN0G4+2s2K5L9lYz5Z6lVE57KAQrw4APYuCsg7sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776929641; c=relaxed/simple;
	bh=uUr2WX0hfhqFblDSBBPdFGtDvl61n05tGhgtx80/7Yg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8rjl1xeQ/u50Vv0ABNDCcz1W5j1q5GnbvXU0/jWcAOSrCvb1caN1JpHJaY23ntdmVI6m7FSuk/dbgp26CJMRFFxDwBgoxKZ9TMOx9emKD/dmuDXrhrTL5UoymM1aaWgkhID+44pDhk4kdUk3BeQaLMnNIoEwMrwm6qbfeOoPqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=lR37S7GN; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c8545bce3ee611f19a16598d5ca7f8ec-20260423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/dslgzlo3e3q4Fp9CcQ8kHNOhLW06kFWzrlqwahyqjg=;
	b=lR37S7GNd+TGgtciLjs3l+10gQrRAckZICHxx7FuxykCxgkX18MUCgcK3d7Co2SEeNxWPvhwu3ABw05UNOdC2F05bhp44wAh/CJbq0RhvGosR6dMk6iDo0OcM6pfiJKZiL1/sQL69Znm8QiSivh7E+07D15k0L71CepXLg552bc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:06fafe75-1661-4670-ab7d-21b2efc87a70,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:52577c64-469e-4eb6-aeb8-4b21454b0f32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c8545bce3ee611f19a16598d5ca7f8ec-20260423
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2112026363; Thu, 23 Apr 2026 15:33:54 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Apr 2026 15:33:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Apr 2026 15:33:52 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v6 1/6] media: dt-bindings: mediatek,vcodec-encoder: Add MT8196
Date: Thu, 23 Apr 2026 15:33:38 +0800
Message-ID: <20260423073345.27402-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260423073345.27402-1-irui.wang@mediatek.com>
References: <20260423073345.27402-1-irui.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-59359-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,gmail.com,collabora.com,mediatek.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irui.wang@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 2480944E09C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for MT8196 video encoder which uses VCP (Video Co-Processor)
for firmware management. Unlike previous platforms that use SCP/VPU, MT8196
requires VCP to load and execute the video encoding firmware, with the
encoder communicating through VCP to perform encoding operations.

Add the "mediatek,mt8196-vcodec-enc" compatible string and introduce
the "mediatek,vcp" property to reference the VCP device, which is
required for MT8196 encoder operation.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/mediatek,vcodec-encoder.yaml        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index ebc615584f92..72698456374a 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -24,6 +24,7 @@ properties:
               - mediatek,mt8188-vcodec-enc
               - mediatek,mt8192-vcodec-enc
               - mediatek,mt8195-vcodec-enc
+              - mediatek,mt8196-vcodec-enc
       - items:
           - const: mediatek,mt8186-vcodec-enc
           - const: mediatek,mt8183-vcodec-enc
@@ -58,6 +59,13 @@ properties:
     description:
       Describes point to scp.
 
+  mediatek,vcp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Reference to the VCP (Video Co-Processor) device that loads and executes
+      the video encoding firmware. The encoder communicates with the firmware
+      through VCP to perform encoding operations.
+
   power-domains:
     maxItems: 1
 
@@ -76,6 +84,20 @@ required:
   - iommus
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8196-vcodec-enc
+
+    then:
+      required:
+        - mediatek,vcp
+    else:
+      properties:
+        mediatek,vcp: false
+
   - if:
       properties:
         compatible:
-- 
2.45.2


