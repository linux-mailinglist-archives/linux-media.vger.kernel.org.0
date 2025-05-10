Return-Path: <linux-media+bounces-32216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01DAB2209
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 10:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D0E01894E83
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 08:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFA1223DE2;
	Sat, 10 May 2025 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BgF0PASY"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C50A21C19D;
	Sat, 10 May 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863921; cv=none; b=a64SpHFVvPwd3uWFSq2S1jxs2/tU9uuUrRCpLpetrzTLKMGUu+wPdmfRqwFQ6+FF06fHhCpT1N56EGGxuOPbQOtgjA+EUWUBNBR6occUyNAkABQfOfFbmJRGq2cprlfLrzyXE68hOSsOrVv7Jj1YGmiw6wpKUi11S3UDvLQVEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863921; c=relaxed/simple;
	bh=8p6UYfNi8wQFowtMyVxAsLDHP4NeHI+I89LHcsPIzB8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d54UK1yu0xSP9I+esVqlgitK8sPGhtqI3iU9EbqqeYF4t0ByAxQGxZeoxFLVvS0FpjHuwsFha+4w3qPn212Izbp6e+O/Oxsrjg3snFmpy6nhNWEWreIl6dvC3Jj8BrI0YEaPigw0thKKMXCVVJl7wpjO8Q2oHPdiBkNtJ9w52WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=BgF0PASY; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 90b7c7662d7411f0813e4fe1310efc19-20250510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vAijlp3cZm95GOCMOQ/GMLzzUdfaGStQ+pcQIyxc2cE=;
	b=BgF0PASYq/xiYo45nCXUgcpyeAVP5s7VquzSN5ISXU5OcyollpxTmOSoukTQBn35s8HmiZz9ihR76tRy/pasrVWUd+r1HpCqwt+Jt85eJvU4IsF60fOyH6+lUMzvoBWqt0YV1+nCxRK5on7sg2XitapM1T+2GN/JXV2vA6I/JiU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:bf5d7a75-dff1-4b95-9acf-2f8c670f4afe,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:41cd5e51-76c0-4e62-bb75-246dfb0889c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 90b7c7662d7411f0813e4fe1310efc19-20250510
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1451040672; Sat, 10 May 2025 15:58:31 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 10 May 2025 15:58:28 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 10 May 2025 15:58:27 +0800
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
Subject: [PATCH 13/14] media: mediatek: decoder: fill av1 buffer size with picinfo
Date: Sat, 10 May 2025 15:53:43 +0800
Message-ID: <20250510075357.11761-14-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250510075357.11761-1-yunfei.dong@mediatek.com>
References: <20250510075357.11761-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The buffer size of y and c plane has been calculated in vcp/scp,
can fill each frame buffer size with picinfo directly.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c      | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2b2173062cb0..6070485e26c4 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1799,18 +1799,19 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
 {
 	struct vb2_buffer *vb;
 	struct vb2_queue *vq;
-	int w, h, plane, size;
+	int plane;
 	int i;
 
 	plane = instance->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
-	w = vsi->frame.uh.upscaled_width;
-	h = vsi->frame.uh.frame_height;
-	size = ALIGN(w, VCODEC_DEC_ALIGNED_64) * ALIGN(h, VCODEC_DEC_ALIGNED_64);
 
 	/* frame buffer */
 	vsi->fb.y.dma_addr = fb->base_y.dma_addr;
+
+	vsi->fb.y.size = instance->ctx->picinfo.fb_sz[0];
+	vsi->fb.c.size = instance->ctx->picinfo.fb_sz[1];
+
 	if (plane == 1)
-		vsi->fb.c.dma_addr = fb->base_y.dma_addr + size;
+		vsi->fb.c.dma_addr = fb->base_y.dma_addr + vsi->fb.y.size;
 	else
 		vsi->fb.c.dma_addr = fb->base_c.dma_addr;
 
@@ -1835,8 +1836,9 @@ static int vdec_av1_slice_setup_core_buffer(struct vdec_av1_slice_instance *inst
 		}
 
 		vref->y.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 0);
+		vref->y.size = vsi->fb.y.size;
 		if (plane == 1)
-			vref->c.dma_addr = vref->y.dma_addr + size;
+			vref->c.dma_addr = vref->y.dma_addr + vsi->fb.y.size;
 		else
 			vref->c.dma_addr = vb2_dma_contig_plane_dma_addr(vb, 1);
 	}
-- 
2.46.0


