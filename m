Return-Path: <linux-media+bounces-51375-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGE4IXLocmmvrAAAu9opvQ
	(envelope-from <linux-media+bounces-51375-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 04:18:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 486CF6FF65
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 04:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3C55301680C
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 03:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE24D2C027A;
	Fri, 23 Jan 2026 03:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KO88kxR9"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1692334E771;
	Fri, 23 Jan 2026 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769138268; cv=none; b=stKXz7JpseBYTb6s2Ke9j7J4zROcZ+/5G3y3qYTmjHzo4Pn0i3cUYG0kP2VnAgAXIYPwNI8UKPOOVCZ0kuZkbdj5P38Kl1wRvgkBpHDzUk+N8WwuJTUEgQXkqK6NAB9hnEd1qTVdCWgFbC5hcPKS5Z1VNC1E6RhdZzxo8J42U6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769138268; c=relaxed/simple;
	bh=wD6J8yK4Dh8mTkHpnhqGsikcT28YEdxNZN0zUrllz90=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GZpvgch75WsBDXyPfNzmyE82mGaLT4osY1yo0vbw4ZnIacmK4Pm0jTyIV7njYFD0gzecWDpWXCvt4UmJqMjdQRSZsc67vwyc7nHpJNqIQFr1TOg90xjmmpINs5TID3dzxtLefgv4Wn7WPhzZYyUCIkuL5abHASJAiMZ1k56JmyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=KO88kxR9; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 080e57f2f80a11f085319dbc3099e8fb-20260123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=anQRm/eFUR7Iw7QNsgtzYjyCFge/OFPlIXy/DZlO384=;
	b=KO88kxR9UT7+5TJ1TDSEmGYCD2H8YCvz/4pdRkqiFrzV3Lg/tQNORFwnMIek29qa4UTtXL5M4BeFn0oC4KDEUqIXwEPoeUKLk+wRuLtolw0HUuXlnFuVBkjEf9gdZpFjRnn+O0MaaJB69HbMf9hupYoHYa1ssp5K3Xeb1jgp2wc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:f1c9a28c-e617-4e8c-a51f-b24596b641be,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:31061e7a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 080e57f2f80a11f085319dbc3099e8fb-20260123
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 713586479; Fri, 23 Jan 2026 11:17:21 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 23 Jan 2026 11:17:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 23 Jan 2026 11:17:20 +0800
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
Subject: [PATCH v12 02/12] media: mediatek: jpeg: fix jpeg buffer payload size setting
Date: Fri, 23 Jan 2026 11:17:03 +0800
Message-ID: <20260123031713.14621-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260123031713.14621-1-kyrie.wu@mediatek.com>
References: <20260123031713.14621-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-Rspamd-Server: lfdr
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
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,collabora.com,gmail.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51375-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 486CF6FF65
X-Rspamd-Action: no action

For multi-core jpegdec, if one core gets resolution change event,
the payload size, representing the size of Y/C data, needs to change.
But others are decoding at the same time and it can not be changed
immediately, which results in the payload size to not match the real
buffer length.
The payload size must less than the real buffer length to remove
the warnning logs.

Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 030d2a75972a..504b3d40b137 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -702,6 +702,7 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct v4l2_plane_pix_format plane_fmt = {};
+	size_t max_size;
 	int i;
 
 	q_data = mtk_jpeg_get_q_data(ctx, vb->vb2_queue->type);
@@ -710,12 +711,20 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
+		max_size = plane_fmt.sizeimage;
+
 		if (ctx->enable_exif &&
-		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
-			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
-					      MTK_JPEG_MAX_EXIF_SIZE);
-		else
-			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
+			q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
+			max_size += MTK_JPEG_MAX_EXIF_SIZE;
+
+			vb2_set_plane_payload(vb, i,
+					      MIN(vb->planes[i].length,
+						  max_size));
+		} else {
+			vb2_set_plane_payload(vb, i,
+					      MIN(plane_fmt.sizeimage,
+						  vb->planes[i].length));
+		}
 	}
 
 	return 0;
-- 
2.45.2


