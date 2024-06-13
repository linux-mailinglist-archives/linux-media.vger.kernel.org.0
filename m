Return-Path: <linux-media+bounces-13178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAD89068EE
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 11:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A7121C23E60
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27641420A2;
	Thu, 13 Jun 2024 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BGYVVHWQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47690140383;
	Thu, 13 Jun 2024 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271254; cv=none; b=AUld0E7bNBHBq5g+CFsOJPaGt9i8upBuVsp2IDwopjIli1kV01w98Pl/kGMnjvEm6/335GZiGCPA+5KfarNQdgbjtfCn951ZWVL7rKisq/4ebmrD5kX4TyayJZmlizss7VKis+ADaUmj0Jh0kiT3+ccHyv2qCNaM/n2ub46mUvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271254; c=relaxed/simple;
	bh=Is62tAHfEk+9Yu83wvMsu1vlj9t8KP/x5KrX3bBovik=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ALD+lrQPHkXMmoEPiqb8uDV7wUN+7JmOIvrcMZKniubWIkV1tzbiKtfwubRIimwSDH4Jvkpbh29jAAMORJiflQUMgvuINVj51v64vSUznGK0ufppMofblsbsrwZuNUuzeg59YxnxPUG3WhiZTMJce84eLmfp1vsCucQ3aB4uvp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BGYVVHWQ; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1325593c296811efa22eafcdcd04c131-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pby+/hqkJE/CzcRR1xGYBA9igKHmA+L2OnFUaI9UPwc=;
	b=BGYVVHWQjazqDywqnDvg1nHmn2DknRUSZ9HnhSh6cJx+jx+I5tFR8B/+Gsb29/BsCpE/J/foJ3LrRQtC2ICzcOmNkIjQvhVKQ+BTbAn2ERRqEY55vcPOqQk1WmDkmxMgejGPn93KoF29LarXUX+Ewwy86OMHYfXRrMzNivhB4PQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:58d47724-c8a0-41be-ab03-cb5b17da9634,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:de488844-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1325593c296811efa22eafcdcd04c131-20240613
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2121973281; Thu, 13 Jun 2024 17:34:04 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 17:34:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 17:34:01 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 2/3] media: mediatek: vcodec: fix vp8 stateless decoder smatch warning
Date: Thu, 13 Jun 2024 17:33:56 +0800
Message-ID: <20240613093357.583-3-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613093357.583-1-yunfei.dong@mediatek.com>
References: <20240613093357.583-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.149600-8.000000
X-TMASE-MatchedRID: eyg11LmjlNWoft0ZW3r/iTCaEJt46PppPtDsRiRP0d9h2fnHe1cil/Rm
	0kmqtH+DgHpD5xuuxKghg4hY1jreIwLz+AfRlRoHoprTEHvewACuiRuR9mCaujedlpL1W1muo8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgRktVxdpRt2LJJDKI2wSGPXZYf4I7zh9XRl1VuAE0tgNlVD
	g+1TaX7p6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.149600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	6904F484E0D17E05173576915F85BA6F6D22F5EB803B6C05D060F2EA5985B8F92000:8
X-MTK: N

Fix smatch static checker warning for vdec_vp8_req_if.c. Leading
to kernel crash when fb is NULL.

Fixes: 7a7ae26fd458 ("media: mediatek: vcodec: support stateless VP8 decoding")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c     | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
index e27e728f392e..232ef3bd246a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -334,14 +334,18 @@ static int vdec_vp8_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
 
 	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
-	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+	if (!fb) {
+		mtk_vdec_err(inst->ctx, "fb buffer is NULL");
+		return -ENOMEM;
+	}
 
-	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+	y_fb_dma = fb->base_y.dma_addr;
 	if (inst->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
 		c_fb_dma = y_fb_dma +
 			inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
 	else
-		c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+		c_fb_dma = fb->base_c.dma_addr;
 
 	inst->vsi->dec.bs_dma = (u64)bs->dma_addr;
 	inst->vsi->dec.bs_sz = bs->size;
-- 
2.18.0


