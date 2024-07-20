Return-Path: <linux-media+bounces-15185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 929CD937FA7
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 09:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B4E3281E46
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 07:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98BB149E0B;
	Sat, 20 Jul 2024 07:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ir6rsODJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354EC149C6C;
	Sat, 20 Jul 2024 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721459818; cv=none; b=UOYiFlubh7uFJKixDIhUdTi8x5kWcH7DTLBR+g7h7OlJqL8f0M63x/S8dRnxNfl5V3nHgA+vLz4PkoaoBNrYBSItWM3kpE1uLSwchYjiT5WnofZ0NmEgeL8wluPXfBa5zg2HUE485UnZoZxKSzOOKWDtVF9uFeQHMiEGXjqI+eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721459818; c=relaxed/simple;
	bh=Zqm5NZQaEI39gR1zKs7ZSyjC3Nz5LEaRfpwK1ViX+Kg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAq1UBWeVGYorSZ00nvi4wioDPHrvlyvF5vogFnwJC8IeN2gtJJqYWP6Nj0xvcvA2n0Woy1PrRcY5XXU4iFQK7JtvM06fhuoDitmVfdPs3bBCCHopWpNx2hC2PSGGbXxcgLqCX8/GAdE7O8ZiJg7gm++OSEn251Lnid/EojMvss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Ir6rsODJ; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 080e3128466811efb5b96b43b535fdb4-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ls8vv00ZGhvGA4qmFtrNDhCNt27OWvxlvD2BDSCrlIw=;
	b=Ir6rsODJ2mSqWQx3KzUsNMwm6n1im5cbahYnRkuOIeRutrY+K6eaymB4RgrPSNNRCpswvDygF6z0hud5CtovrGcIFiXFGeKeZ7hMDXdPvTqLsoJii5BmWpziVb9ClrLgV+X4A2b7WHzYrqPwg+82FudTIZ532eAOL43Ca+xOPKQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:d168b228-4dda-409d-8c19-1739cca3f974,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ba885a6,CLOUDID:833c8545-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 080e3128466811efb5b96b43b535fdb4-20240720
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1802241622; Sat, 20 Jul 2024 15:16:49 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 00:16:48 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:47 +0800
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
Subject: [PATCH v7 27/28] media: mediatek: vcodec: adding non extend struct
Date: Sat, 20 Jul 2024 15:16:05 +0800
Message-ID: <20240720071606.27930-28-yunfei.dong@mediatek.com>
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

Adding non extend struct to support two different architecture.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 76 ++++++++++++++++++-
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index ed63430aca9d..8d88670c2f38 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -68,6 +68,29 @@ struct vdec_h264_slice_info_ex {
 	u32 reserved;
 };
 
+/**
+ * struct vdec_h264_slice_info - decode information
+ *
+ * @nal_info:		nal info of current picture
+ * @timeout:		Decode timeout: 1 timeout, 0 no timeount
+ * @bs_buf_size:	bitstream size
+ * @bs_buf_addr:	bitstream buffer dma address
+ * @y_fb_dma:		Y frame buffer dma address
+ * @c_fb_dma:		C frame buffer dma address
+ * @vdec_fb_va:	VDEC frame buffer struct virtual address
+ * @crc:		Used to check whether hardware's status is right
+ */
+struct vdec_h264_slice_info {
+	u16 nal_info;
+	u16 timeout;
+	u32 bs_buf_size;
+	u64 bs_buf_addr;
+	u64 y_fb_dma;
+	u64 c_fb_dma;
+	u64 vdec_fb_va;
+	u32 crc[8];
+};
+
 /*
  * struct vdec_h264_slice_mem - memory address and size
  */
@@ -128,6 +151,44 @@ struct vdec_h264_slice_vsi_ex {
 	struct vdec_h264_slice_lat_dec_param h264_slice_params;
 };
 
+/**
+ * struct vdec_h264_slice_vsi - shared memory for decode information exchange
+ *        between SCP and Host.
+ *
+ * @wdma_err_addr:		wdma error dma address
+ * @wdma_start_addr:		wdma start dma address
+ * @wdma_end_addr:		wdma end dma address
+ * @slice_bc_start_addr:	slice bc start dma address
+ * @slice_bc_end_addr:		slice bc end dma address
+ * @row_info_start_addr:	row info start dma address
+ * @row_info_end_addr:		row info end dma address
+ * @trans_start:		trans start dma address
+ * @trans_end:			trans end dma address
+ * @wdma_end_addr_offset:	wdma end address offset
+ *
+ * @mv_buf_dma:		HW working motion vector buffer
+ *				dma address (AP-W, VPU-R)
+ * @dec:			decode information (AP-R, VPU-W)
+ * @h264_slice_params:		decode parameters for hw used
+ */
+struct vdec_h264_slice_vsi {
+	/* LAT dec addr */
+	u64 wdma_err_addr;
+	u64 wdma_start_addr;
+	u64 wdma_end_addr;
+	u64 slice_bc_start_addr;
+	u64 slice_bc_end_addr;
+	u64 row_info_start_addr;
+	u64 row_info_end_addr;
+	u64 trans_start;
+	u64 trans_end;
+	u64 wdma_end_addr_offset;
+
+	u64 mv_buf_dma[H264_MAX_MV_NUM];
+	struct vdec_h264_slice_info dec;
+	struct vdec_h264_slice_lat_dec_param h264_slice_params;
+};
+
 /**
  * struct vdec_h264_slice_share_info - shared information used to exchange
  *                                     message between lat and core
@@ -176,10 +237,19 @@ struct vdec_h264_slice_inst {
 	struct mtk_vcodec_mem pred_buf;
 	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
 	struct vdec_vpu_inst vpu;
-	struct vdec_h264_slice_vsi_ex *vsi_ex;
-	struct vdec_h264_slice_vsi_ex *vsi_core_ex;
+	union {
+		struct vdec_h264_slice_vsi_ex *vsi_ex;
+		struct vdec_h264_slice_vsi *vsi;
+	};
+	union {
+		struct vdec_h264_slice_vsi_ex *vsi_core_ex;
+		struct vdec_h264_slice_vsi *vsi_core;
+	};
 
-	struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
+	union {
+		struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
+		struct vdec_h264_slice_vsi vsi_ctx;
+	};
 	struct vdec_h264_slice_lat_dec_param h264_slice_param;
 
 	unsigned int resolution_changed;
-- 
2.18.0


