Return-Path: <linux-media+bounces-29850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78332A8394A
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD7354A1E5F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B21204F91;
	Thu, 10 Apr 2025 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FTIGni76"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAE8204584;
	Thu, 10 Apr 2025 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266625; cv=none; b=bRzvQTJEFIWgFbC/lGe3aK05O3eou3c+ml/P7MhrYp1tg69pGQvTbGviYLRxEhfhYeLGX0T0sBFzk0udABsPUMJSHAUAyUncjFxOJukA5wkT09wbeBLYI40DURX/VTbrVrowTqfMO4zJ+IF46v7S2yGY71qwpwj2pK8va11snmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266625; c=relaxed/simple;
	bh=WSisLmr23XkuINHiPFThJZvz4v5wsI15/EbjsMWfdrw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j9fyHws8Skpq2pQg4SFj21gC6zEFO45kjPf6woCEmlDohXbgdBAXrT4dr/AL934PYKU5KiyfU6D4swaq2nZnRQpDq8djSTPwILkOKkUut+xWvTw/pkHhygilAwKqrJdWvHAwxaUfmZlzxKBa/Bmgw4eJgAXB4k8UZ606ZmS42FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=FTIGni76; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4550b6a415d511f0aae1fd9735fae912-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HZpwQYi0LcWC3/4dCKnkownlqBa9y91eskNU6i1GdHY=;
	b=FTIGni76I5sz5j2dS/AEBdgKhDxokU9QW16z0p15AfXOkIUDwCWHngtstMV1OaQ77MqKhISyaMSM6B7jMscXPVN/TntPlmtTaGFHy1b3D8cdpW8ctqqNe7YlJKVX4JPioTH5lD6XR9CeY4tMbOp1wuspMK9aenPo8BpTepIBzAU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d2590cf0-2355-423a-b410-c41f8c741b78,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:ca9b138b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT|NGT
X-CID-BAS: 5,DFT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4550b6a415d511f0aae1fd9735fae912-20250410
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2110833412; Thu, 10 Apr 2025 14:30:18 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 14:30:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 14:30:16 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2 07/12] media: mediatek: jpeg: refactor jpeg dst buffer layout
Date: Thu, 10 Apr 2025 14:30:00 +0800
Message-ID: <20250410063006.5313-8-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250410063006.5313-1-kyrie.wu@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

1. change dst buffer size to same as struct mtk_jpeg_src_buf
to make sure all params of mtk_jpeg_src_buf could get a memory.
2. For memory alloc operation:
the v4l2 framework malloc a memory, the base addr is vb2_buffer and
the size is sizeof(struct mtk_jpeg_src_buf), mtk_jpeg_src_buf could get
itself addr by container_of like that:
vb2_buffer -> vb2_v4l2_buffer -> mtk_jpeg_src_buf.
vb2_v4l2_buffer must keep on the top of mtk_jpeg_src_buf.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 3b386ec44b36..79a47a59caba 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1102,7 +1102,7 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
 	dst_vq->drv_priv = ctx;
-	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->buf_struct_size = sizeof(struct mtk_jpeg_src_buf);
 	dst_vq->ops = jpeg->variant->qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index cff156697603..25ba21d80de7 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -86,10 +86,10 @@ struct mtk_jpeg_variant {
 };
 
 struct mtk_jpeg_src_buf {
-	u32 frame_num;
 	struct vb2_v4l2_buffer b;
 	struct list_head list;
 	u32 bs_size;
+	u32 frame_num;
 	struct mtk_jpeg_dec_param dec_param;
 
 	struct mtk_jpeg_ctx *curr_ctx;
-- 
2.46.0


