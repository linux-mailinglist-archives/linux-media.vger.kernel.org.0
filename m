Return-Path: <linux-media+bounces-21476-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADA79CFC92
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 04:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C85CD284308
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 03:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83104197548;
	Sat, 16 Nov 2024 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DYnHFFyT"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41F2192D62;
	Sat, 16 Nov 2024 03:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731727058; cv=none; b=WXaKx3+B/eeBB3d0t+jUKKdfJpaQxf+x/vRXnArdJGhP3Ez9V1s6EpZ2NH3HuMmXBf1sTyO/n2mojlG/k5fw/laz2MitRTIYGYIhctXmJhfPH23KDs1ES9PVLOXvXBa2bVIWNbeEja5waMoe0g6+xrG124T6alUk3U+nlVt/AO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731727058; c=relaxed/simple;
	bh=lGToSgMvk2B3q7G5z72Kh/gXG/P1Sn99kRVXKZ8U0s8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWvcTBArjoLGhimWlSuZ1JbStawSLMtTKhnZmo2OQCNaFWqkyhSMYONetwP7mNk9YQ/1M29k185EELTzGPuN8KhqRKlR0m/3C984A3YGMKEx+XELhrHMwnGZi7uqmoxtbL6AsPTUinF2czAJ8DhMsk+sdmjtgT89SHQc6d2y5Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=DYnHFFyT; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 51499d1ea3c911efbd192953cf12861f-20241116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=U+Wa/gu1OcvAO05IVCtNhN7nadBhoIHWhdnKEeo81ds=;
	b=DYnHFFyT20avBK4E/ZfZc4GZxVQ5wCjtO3OaCD/aIgLDbVYl+jqcU6A4F5QBE0+nKIcgOJCVHNfunJma9TgceEW0+8G+G+D3rn0Nwktm51V7fvgQuDs0PparT6ouaqS30wlxiQ55qPvtPnSAf4arBepqJ5EDyFOMo2XIYj65J5k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:712aaf14-69a7-401f-97d5-3b0c157b9329,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ce19b8a,CLOUDID:6dedb85c-f18b-4d56-b49c-93279ee09144,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 51499d1ea3c911efbd192953cf12861f-20241116
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2003743283; Sat, 16 Nov 2024 11:17:31 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:17:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:17:29 +0800
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
Subject: [PATCH v7 5/5] media: mediatek: vcodec: store current vb2 buffer to decode again
Date: Sat, 16 Nov 2024 11:17:19 +0800
Message-ID: <20241116031724.15694-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241116031724.15694-1-yunfei.dong@mediatek.com>
References: <20241116031724.15694-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

All the src vb2 buffer are removed from ready list when STREAMOFF
capture queue, may remove a non exist vb2 buffer if lat is working
currently. The driver also need to use current vb2 buffer to decode
again to wait for enough resource when lat decode error.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 29 ++++++++++++++-----
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index ac568ed14fa2..e70e97e401ba 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -155,6 +155,7 @@ struct mtk_vcodec_dec_pdata {
  * @last_decoded_picinfo: pic information get from latest decode
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Used
  *		     for stateful decoder.
+ * @cur_src_buffer: current vb2 buffer for the latest decode.
  * @is_flushing: set to true if flushing is in progress.
  *
  * @current_codec: current set input codec, in V4L2 pixel format
@@ -201,6 +202,7 @@ struct mtk_vcodec_dec_ctx {
 	struct work_struct decode_work;
 	struct vdec_pic_info last_decoded_picinfo;
 	struct v4l2_m2m_buffer empty_flush_buf;
+	struct vb2_v4l2_buffer *cur_src_buffer;
 	bool is_flushing;
 
 	u32 current_codec;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index dd6ee694382e..ad3c585e339d 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -316,7 +316,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	struct mtk_vcodec_dec_ctx *ctx =
 		container_of(work, struct mtk_vcodec_dec_ctx, decode_work);
 	struct mtk_vcodec_dec_dev *dev = ctx->dev;
-	struct vb2_v4l2_buffer *vb2_v4l2_src;
+	struct vb2_v4l2_buffer *vb2_v4l2_src = ctx->cur_src_buffer;
 	struct vb2_buffer *vb2_src;
 	struct mtk_vcodec_mem *bs_src;
 	struct mtk_video_dec_buf *dec_buf_src;
@@ -325,7 +325,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bool res_chg = false;
 	int ret;
 
-	vb2_v4l2_src = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
+	vb2_v4l2_src = vb2_v4l2_src ? vb2_v4l2_src : v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
 	if (!vb2_v4l2_src) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_dbg(1, ctx, "[%d] no available source buffer", ctx->id);
@@ -375,13 +375,26 @@ static void mtk_vdec_worker(struct work_struct *work)
 		v4l2_m2m_buf_done_and_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx, state);
 		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
 		media_request_manual_complete(src_buf_req);
-	} else {
-		if (ret != -EAGAIN) {
-			v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
-			v4l2_m2m_buf_done(vb2_v4l2_src, state);
-		}
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+
+		return;
 	}
+
+	/*
+	 * If each codec return -EAGAIN to decode again, need to backup current source
+	 * buffer, then the driver will get this buffer next time.
+	 *
+	 * If each codec decode error, must to set buffer done with error status for
+	 * this buffer have been removed from ready list.
+	 */
+	ctx->cur_src_buffer = (ret != -EAGAIN) ? NULL : vb2_v4l2_src;
+	if (ret && ret != -EAGAIN) {
+		v4l2_ctrl_request_complete(src_buf_req, &ctx->ctrl_hdl);
+		media_request_manual_complete(src_buf_req);
+	}
+
+	if (ret != -EAGAIN)
+		v4l2_m2m_buf_done(vb2_v4l2_src, state);
+	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
 
 static void vb2ops_vdec_stateless_buf_queue(struct vb2_buffer *vb)
-- 
2.46.0


