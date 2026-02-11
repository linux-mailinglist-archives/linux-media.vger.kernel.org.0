Return-Path: <linux-media+bounces-52561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CD0jGlIXjGnegQAAu9opvQ
	(envelope-from <linux-media+bounces-52561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 06:44:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D711216C2
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 06:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B03E5309609A
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 05:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B6F350D7E;
	Wed, 11 Feb 2026 05:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A2l48PjW"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F9034F469;
	Wed, 11 Feb 2026 05:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770788563; cv=none; b=tupKbXuXKrTLKy7BAvg9m1GcsmcORz5Yqmo8w7rU7SwZRa83aDbEuQ77ZWvltAe0UP6NejZ8qfv/2J6z+HuIXQB253qWXN29syqMht2DkPPcDtq1pwWjnVWZRmynKOwW5EjhGb71GwDSTvfDkCo6m36ltF+GcPvRF4CJyP3B7Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770788563; c=relaxed/simple;
	bh=3thw4NfFdeP3JXHype/OBUTqDDI8TNQuLLMvB7ghI98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MpiDIoIhKivoj870XX20iYlbwFpPIcL+PoRMyUKckZ+WB6e2c0FWyoiSLxIZy7V5v/ELh/ePQMkRLSVBnODbZoTlwjdDfUx5hBLN7isZO7aSoSdfuiITeGxKInE/X/4CX1dXalDaR4rc924C6lRe03/IjC/i0xvf73NhZV3UPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=A2l48PjW; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 7621f170070c11f185319dbc3099e8fb-20260211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eGspLHbpygDK2bKTNo5LRmeiQiktsodc8p2NlA9SHpw=;
	b=A2l48PjWWsB64GOwS8YzZowxWu6Ymj8POaRmCUgQ2pwObgeReUbhFpHXkBYa1amrIxsEGOIMeQTWmwtrmK8tVy0PVFi+jxxji6L0Ko8x7eRSV0T3n/1FfKGlaHOVUnqslDgeu9AGo2h94wdUlasODDcUgY/8eFRN2gD5EIZPiRI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:322d48e9-b20f-4453-ad97-25fa847e4c17,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:31692b5b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7621f170070c11f185319dbc3099e8fb-20260211
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 244322738; Wed, 11 Feb 2026 13:42:32 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Feb 2026 13:42:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Feb 2026 13:42:31 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 11/14] media: mediatek: vcodec: add debug information
Date: Wed, 11 Feb 2026 13:41:38 +0800
Message-ID: <20260211054149.27249-12-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260211054149.27249-1-yunfei.dong@mediatek.com>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52561-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,xs4all.nl,chromium.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunfei.dong@mediatek.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mediatek.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:mid,mediatek.com:dkim,mediatek.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: D4D711216C2
X-Rspamd-Action: no action

Print hevc/av1 output format and 10bit capture format
information to debug.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 643d6fff088b..5eead4eb6f31 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -29,6 +29,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_dec_ctx *ctx, char
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\toutput format: vp9 slice\n");
 		break;
+	case V4L2_PIX_FMT_HEVC_SLICE:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: hevc slice\n");
+		break;
+	case V4L2_PIX_FMT_AV1_FRAME:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\toutput format: av1 slice\n");
+		break;
 	default:
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tunsupported output format: 0x%x\n",
@@ -45,6 +53,14 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_dec_ctx *ctx, char
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tcapture format: MT21C\n");
 		break;
+	case V4L2_PIX_FMT_MT2110T:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: MT2110T (10bit tile mode)\n");
+		break;
+	case V4L2_PIX_FMT_MT2110R:
+		curr_len = snprintf(buf + *used, total - *used,
+				    "\tcapture format: MT2110T (10bit raster mode)\n");
+		break;
 	default:
 		curr_len = snprintf(buf + *used, total - *used,
 				    "\tunsupported capture format: 0x%x\n",
@@ -122,9 +138,10 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 
 		if (dbgfs_index[MTK_VDEC_DBGFS_PICINFO]) {
 			curr_len = snprintf(buf + used_len, total_len - used_len,
-					    "\treal(%dx%d)=>align(%dx%d)\n",
+					    "\treal(%dx%d)=>align(%dx%d) 10bit(%d)\n",
 					    ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-					    ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+					    ctx->picinfo.buf_w, ctx->picinfo.buf_h,
+					    ctx->is_10bit_bitstream);
 			used_len += curr_len;
 		}
 
-- 
2.45.2


