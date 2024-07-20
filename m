Return-Path: <linux-media+bounces-15167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2176937F7E
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 09:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37B87281EE0
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 07:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8713A260;
	Sat, 20 Jul 2024 07:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TX6MEWIZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA132207A;
	Sat, 20 Jul 2024 07:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721459786; cv=none; b=d+Nt/u8QNeKWhrc/d5FvPa0d35SeUJicld4cBXLn6D4d5qNn7qVlPX6idTJxvqatowt/8CWfYAHkjtBg/MsLWsLdOzoBJkeeDxhAT/vYwceNR5Rj/DAoToXiDNCiiWCm5qiRcG3gC1+plSV3INum0KiJ5vJ0ewOXe/vn2DsS/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721459786; c=relaxed/simple;
	bh=hEfUmRooL/dwHs0so0YWrMhXGeERPXtnAhRoyzZXNEU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TlAeaQEEMaOsYaDsFpajHlCEemZQX9lhAnc+JWn9qzuWE3EhZsBbhzPU5mXAoMUQ4qb1Zp9rkxJrIcvXtEh+TBRN2jfbtnGVOPPChC1cc2fPHzlf8peow6QNa72Ax1VpzoSbD0InggGq9+DLGjiD8Ne8C1sdEpNsTymw22RwB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TX6MEWIZ; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f2dea878466711efb5b96b43b535fdb4-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bLZB/k6jso90VJO74ijPSPuDokAH3TsIn30+K8soOlI=;
	b=TX6MEWIZGCQ78NkRizO7b781o+7DWUyf/YfVsitXW7e2AcoyUhdnC6Z60Gb4o9yxnFbL20mV4PrL6CxEdKkS+ZaRMD4OW1eoBRciVA1X9Pzc4UNojFr4fnHMwf9UaTRYbuQYw082c339eu1LfzyrkulqA/FEcNjQdhjxTd6DN4g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:e4c66ad2-af3b-4f6d-bc54-58bb4dafe78d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:ba885a6,CLOUDID:2614b4d1-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f2dea878466711efb5b96b43b535fdb4-20240720
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 337576677; Sat, 20 Jul 2024 15:16:14 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:11 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 03/28] media: videobuf2: calculate restricted memory size
Date: Sat, 20 Jul 2024 15:15:41 +0800
Message-ID: <20240720071606.27930-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Getting the physical address with sg_dma_address for restricted memory,
only return the first physical address size since sg may not be physical
continuous, then leading to the dmabuf size is small than buf size. Need
to bypass continuous checking for restricted memory.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../common/videobuf2/videobuf2-dma-contig.c   | 34 +++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index 3d4fd4ef5310..f0e4652b615f 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -66,6 +66,22 @@ static unsigned long vb2_dc_get_contiguous_size(struct sg_table *sgt)
 	return size;
 }
 
+/**************************************************/
+/*   restricted mem scatterlist table functions   */
+/**************************************************/
+
+static unsigned long vb2_dc_get_res_mem_contiguous_size(struct sg_table *sgt)
+{
+	struct scatterlist *s;
+	unsigned int i;
+	unsigned long size = 0;
+
+	for_each_sgtable_dma_sg(sgt, s, i)
+		size += sg_dma_len(s);
+
+	return size;
+}
+
 /*********************************************/
 /*         callbacks for all buffers         */
 /*********************************************/
@@ -648,10 +664,13 @@ static void *vb2_dc_get_userptr(struct vb2_buffer *vb, struct device *dev,
 		goto fail_sgt_init;
 	}
 
-	contig_size = vb2_dc_get_contiguous_size(sgt);
+	if (buf->vb->vb2_queue->restricted_mem)
+		contig_size = vb2_dc_get_res_mem_contiguous_size(sgt);
+	else
+		contig_size = vb2_dc_get_contiguous_size(sgt);
 	if (contig_size < size) {
-		pr_err("contiguous mapping is too small %lu/%lu\n",
-			contig_size, size);
+		pr_err("contiguous mapping is too small %lu/%lu/%u\n",
+		       contig_size, size, buf->vb->vb2_queue->restricted_mem);
 		ret = -EFAULT;
 		goto fail_map_sg;
 	}
@@ -711,10 +730,13 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
 	}
 
 	/* checking if dmabuf is big enough to store contiguous chunk */
-	contig_size = vb2_dc_get_contiguous_size(sgt);
+	if (buf->vb->vb2_queue->restricted_mem)
+		contig_size = vb2_dc_get_res_mem_contiguous_size(sgt);
+	else
+		contig_size = vb2_dc_get_contiguous_size(sgt);
 	if (contig_size < buf->size) {
-		pr_err("contiguous chunk is too small %lu/%lu\n",
-		       contig_size, buf->size);
+		pr_err("contiguous chunk is too small %lu/%lu/%u\n",
+		       contig_size, buf->size, buf->vb->vb2_queue->restricted_mem);
 		dma_buf_unmap_attachment_unlocked(buf->db_attach, sgt,
 						  buf->dma_dir);
 		return -EFAULT;
-- 
2.18.0


