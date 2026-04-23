Return-Path: <linux-media+bounces-59386-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kP0bGpbt6Wm2nAIAu9opvQ
	(envelope-from <linux-media+bounces-59386-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 11:59:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63063450289
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 11:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2F3F3044F6E
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 09:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4063E866B;
	Thu, 23 Apr 2026 09:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GkgWOMDE"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BB3E5ED6;
	Thu, 23 Apr 2026 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937637; cv=none; b=mzOxIeBsFo8qYV+qnHBHk3OaEij6dlm+WDsw2YwjYgv2sa7k+DMHth4HuWAFE3MbT65u0znOwoh8gG/NUOiHcW/+7HACEispDFVbu06n/Y75QNSW89NM/FvKfGjxGkcfooi45jo28aqGfbByOOHaGzRXwnlbW2ikHvK2m3dVN90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937637; c=relaxed/simple;
	bh=1Ylvsf6L/fPPwMOKHfrlAeXYv+eGQMSzOMvz+HSzCrw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLdQUsxjEIm0p5JOLM9uxk3cdbQvXv+vvdr1EziAW7cf67AFCQD9NECZKd3Sc6bQVUVkPmpnaMzo9O2QS7q9sW6qfo6jEetxoatZwtGY0gdyEFdPjqM3d3c435fW5JxYZmMrNAGPVfAZbH+66roK+yCJ6wdJLCABvD4BXCTjSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=GkgWOMDE; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 635db5683ef911f19a16598d5ca7f8ec-20260423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=uTBXwuHcKDtg3GVJur0+WmjyNjN36KouHB+B4PWNBys=;
	b=GkgWOMDEejL30UnQe4r/ByLx+RqrvMqeEjbcQLhuafzupd13V9GjplctHs9dDxRmDfgimSHYnyTXvKCJY4jVb9MWmnzSUpLU3lBveHML6PCjxIQXoU5oNfV0tHk7h8/IcJxIviZgFEusA/udyWb8vEcx3z4DNWnjgZviTwuExmE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8beb4ac4-318e-4032-9fd3-cdfc415cd44e,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:c595cb8f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 635db5683ef911f19a16598d5ca7f8ec-20260423
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1723574798; Thu, 23 Apr 2026 17:47:06 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 23 Apr 2026 17:47:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 23 Apr 2026 17:47:04 +0800
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
Subject: [PATCH v14 04/12] media: mediatek: jpeg: Fix buffer completion on multi-core streaming stop
Date: Thu, 23 Apr 2026 17:46:48 +0800
Message-ID: <20260423094656.32044-5-kyrie.wu@mediatek.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,collabora.com,gmail.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59386-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,mediatek.com:dkim,mediatek.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63063450289
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enhances the Mediatek JPEG driver's stability and reliability by ensuring
that all queued buffers are processed before stopping the streaming in
multi-core environments. It introduces a call to
`vb2_wait_for_all_buffers()` in the `mtk_jpeg_enc_stop_streaming()` and
`mtk_jpeg_dec_stop_streaming()` functions when the `multi_core` variant
is enabled. This change ensures that no buffers are left unprocessed,
preventing potential data loss or corruption during multi-core flow.

Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interface")
Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index ef7362feb697..6e5de2680e3a 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -850,8 +850,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
 static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
+	if (jpeg->variant->multi_core)
+		vb2_wait_for_all_buffers(q);
+
 	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
 		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
 }
@@ -859,6 +863,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
 	/*
@@ -866,6 +871,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 	 * Before STREAMOFF, we still have to return the old resolution and
 	 * subsampling. Update capture queue when the stream is off.
 	 */
+	if (jpeg->variant->multi_core)
+		vb2_wait_for_all_buffers(q);
+
 	if (ctx->state == MTK_JPEG_SOURCE_CHANGE &&
 	    V4L2_TYPE_IS_CAPTURE(q->type)) {
 		struct mtk_jpeg_src_buf *src_buf;
-- 
2.45.2


