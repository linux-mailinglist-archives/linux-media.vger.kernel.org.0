Return-Path: <linux-media+bounces-31010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98502A9C262
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 10:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5850C4A6AC7
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408D823C39A;
	Fri, 25 Apr 2025 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ccB/B5AC"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232C22367A6;
	Fri, 25 Apr 2025 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571228; cv=none; b=lePn0gunxpsM7Eu8f89l8BIi6E5zu3CiKtN1uNMQxQ7fijSAPL8ZVxRUcCFAdMwAccfYfgWsNmUYfYMyfs81AUviRsEJmmpz9PM1EkhV8+m022l80NQOVjMlHSl9S/VoaDzjBjbiPuB6FWR7UsOLXtORB7UyXF13Qzvf8ueK4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571228; c=relaxed/simple;
	bh=KBxHNpyU83jVkDLAPtttL1X52bt5xNuqeSlFI0PkCNs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONQF5gkBB+OpL4kXS+q01wvjHJf+k9phNSc/z+dLP3ZuckgGR0GeYVmFnXfSkLf7uv8AWDGj0sKikVnfRp0JWpBnGVlFB7Cfe/P7K155yuhPtiWmJV6rpjqB8UaTqQA90+yNB8WD1WEXEKLyIPD2Si7YU7RUt5GUSStcIO1ZUk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ccB/B5AC; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: c854962221b211f0980a8d1746092496-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OZgJlLqonv38l5RGHoperSGRC6MB1OzkzkEVVzcVj6A=;
	b=ccB/B5ACa4YHU/8kSEC5Rd5jl37YE5M1GUMCYm4c8k8MkfJ680XvaJPyF6TdO/fyD8bkES+LzLqi1d2w72wp2D+Zv6vbMMs5FaIvpy9C88nHbmRq+em9IvnenGcpQ+xhIK/HJ+PVMBApNqzHNzfQxGtn6diiSca1Ae1xXa8Q/As=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a0c48d80-2b35-40cf-96fa-b95239fadd77,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:91ad9cf0-ff26-40e8-a637-f0e9524b171a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT|NGT
X-CID-BAS: 5,DFT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c854962221b211f0980a8d1746092496-20250425
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 815871272; Fri, 25 Apr 2025 16:53:39 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 16:53:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 16:53:37 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v3 07/12] media: mediatek: jpeg: refactor jpeg dst buffer layout
Date: Fri, 25 Apr 2025 16:53:23 +0800
Message-ID: <20250425085328.16929-8-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250425085328.16929-1-kyrie.wu@mediatek.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
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

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 52d59bb5c9ad..7e3509be6f69 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1103,7 +1103,7 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
 	dst_vq->drv_priv = ctx;
-	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->buf_struct_size = sizeof(struct mtk_jpeg_src_buf);
 	dst_vq->ops = jpeg->variant->qops;
 	dst_vq->mem_ops = &vb2_dma_contig_memops;
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 655dc9c3280c..186cd1862028 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -96,10 +96,10 @@ struct mtk_jpeg_variant {
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


