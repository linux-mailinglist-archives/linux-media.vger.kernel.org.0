Return-Path: <linux-media+bounces-63540-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eHIJOtDpH2pDsQAAu9opvQ
	(envelope-from <linux-media+bounces-63540-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:46:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C979D635D55
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 10:46:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=H3U5hZ3n;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63540-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-63540-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2226308CE7C
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 08:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F2B44CAF9;
	Wed,  3 Jun 2026 08:41:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E6438FEF;
	Wed,  3 Jun 2026 08:41:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780476092; cv=none; b=RHpDZByg3jjAFZ0gS1bY+61O87M3JtzHEyiwt+NRt8KRpMSzPHKkQ6qTGn+8pshn5gHqI9Szxnlkv7UwAyIdydBvU16RiD3uJSLESQlfkGQzZyp48Uu7pnGp0yiz9JdRmm0MGqwDUDU1jmQHod20HrtwTZFvZdAbhXwxMnQvZy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780476092; c=relaxed/simple;
	bh=ZcIWzt8LqGRAA9jvpqfvER8OYpI/qsCCTsqYL0L979k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IvXESM5Kx79DNI9cfeW3Xr9jKLxrldFLlSBzEmk3DgMPuwVtBlnyd8mpe+S2C1JRBRuxjgi4Ix3FnXU6PYMsmA+F5GZrmEVc69+8oWAKDxWCZ+qsNERva4hW7KMVL2bwCaxPQ+ngjdZzEpgNanKKuakWhQzxnuCkYx6GDsz+Vgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=H3U5hZ3n; arc=none smtp.client-ip=210.61.82.184
X-UUID: 02382ecc5f2811f18dc8c9802ae25ab1-20260603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+dqfuCJbs+O/ElOdUAzqup4cvk+s5X6t24No/bT+PNI=;
	b=H3U5hZ3nmXT9vxRPC/XM3oHNBx24y9+aiewZ6F363vH3OwTzbfSaizDeBqJq8IbhYYUMnUFzUB/isrxxnUCgTEavuWhq20VTvqYMwDHU4QcfmlVI/tmzEJlYXHj5yXIcH6EhdnxCWOk2Q1hcSmhcMAl9Vx3BiNQ27h3/h2uMG+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:cd833c48-e24b-4060-b364-b4bd7949a797,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:fa180a50-23b6-41e0-a310-51c498ab6908,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 02382ecc5f2811f18dc8c9802ae25ab1-20260603
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1926935807; Wed, 03 Jun 2026 16:41:26 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Jun 2026 16:41:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 3 Jun 2026 16:41:23 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
	Kees Cook <kees@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	Haoxiang Li <haoxiang_li2024@163.com>, Fei Shao <fshao@chromium.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Irui Wang <irui.wang@mediatek.com>, Fan Wu
	<fanwu01@zju.edu.cn>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Kyrie Wu <kyrie.wu@mediatek.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v5 12/14] media: mediatek: vcodec: add decoder compatible to support mt8196
Date: Wed, 3 Jun 2026 16:40:42 +0800
Message-ID: <20260603084045.17488-13-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603084045.17488-1-kyrie.wu@mediatek.com>
References: <20260603084045.17488-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
	TAGGED_FROM(0.00)[bounces-63540-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_TO(0.00)[mediatek.com,kernel.org,gmail.com,collabora.com,chromium.org,163.com,ideasonboard.com,pengutronix.de,vivo.com,zju.edu.cn,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:nicolas.dufresne@collabora.com,m:ribalda@chromium.org,m:kees@kernel.org,m:hverkuil+cisco@kernel.org,m:haoxiang_li2024@163.com,m:fshao@chromium.org,m:wenst@chromium.org,m:laurent.pinchart+renesas@ideasonboard.com,m:sebastian.fricke@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:rongqianfeng@vivo.com,m:jacopo.mondi@ideasonboard.com,m:irui.wang@mediatek.com,m:fanwu01@zju.edu.cn,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:kyrie.wu@mediatek.com,m:sakari.ailus@linux.intel.com,m:tzungbi@kernel.org,m:tfiga@chromium.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:hverku
 il@kernel.org,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mediatek.com:mid,mediatek.com:dkim,mediatek.com:from_mime,mediatek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C979D635D55

From: Yunfei Dong <yunfei.dong@mediatek.com>

MT8196 is lat single core architecture. Support its compatible and
use `mtk_lat_sig_core_pdata` to initialize platform data.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c   | 6 ++++++
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 68759db6f8d1..bee6e057b0a7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -347,6 +347,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
 		vdec_dev->chip_name = MTK_VDEC_MT8186;
 	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
 		vdec_dev->chip_name = MTK_VDEC_MT8188;
+	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
+		vdec_dev->chip_name = MTK_VDEC_MT8196;
 	else
 		vdec_dev->chip_name = MTK_VDEC_INVAL;
 }
@@ -573,6 +575,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
 		.compatible = "mediatek,mt8188-vcodec-dec",
 		.data = &mtk_lat_sig_core_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8196-vcodec-dec",
+		.data = &mtk_lat_sig_core_pdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index 15e437323af5..53d1708b012b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -29,6 +29,7 @@ enum mtk_vcodec_dec_chip_name {
 	MTK_VDEC_MT8188 = 8188,
 	MTK_VDEC_MT8192 = 8192,
 	MTK_VDEC_MT8195 = 8195,
+	MTK_VDEC_MT8196 = 8196,
 };
 
 /*
-- 
2.45.2


