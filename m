Return-Path: <linux-media+bounces-19540-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 085A999C16E
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BD561C22BEF
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D711547C9;
	Mon, 14 Oct 2024 07:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iFzjLr8C"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2998714C5AE;
	Mon, 14 Oct 2024 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891205; cv=none; b=seCf/Nt6gmzIlpfBq3nr9yt8seyTa/c4k/s+GTIzS0Tgo13eXo0EtXrxRGjMEpuK7OpYc5PUBiFoCrm+YF8cOvtWGd6m5s3HeM2BSptgPPwpjHii7UkjYgVALzcHgzbzIOQ7+XPElm7kEtp7XJkbKdCcNgpWXJzOFrpFQX6tqUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891205; c=relaxed/simple;
	bh=SqN3mGGMS4+mqPm/50hwOQG5Rbta2ZnybZkxr9Imvlg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fKJn3NhEVxWfChKT1GxukhcJSW7AWe1on4be3j9q0eU1NiruW8ZkGMu5AWxrq+Y/0GTQCKZ81dBnmZgsAcRi0YQiELzM90xVUb2iPkh43YCLH6ARyXPsZ6POdXla60Q4wd3fZuA22OQNru6r49XfPIoXiQxfVfETGi7OjbVFQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iFzjLr8C; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 94a11ed289fe11ef88ecadb115cee93b-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sHIKlEGQc1gMljjo6XctvH3MyRQKPj0bj6tE3zjFyEg=;
	b=iFzjLr8CxnuK4P6wd0HW9Rl4C9ASVWDnE6eFPZl+P2m5tFj5yCUQXe572eVdDDdK0bBVUhc4nF3QtECTFdtG9ysO4ZzEci8OoZyoY6IB4AP89rMOgt/EGmjC0KFeqeOeKFUxDoFI820s/um2jXl6RjHVw9P+GpnQrpeWZwpeHiI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3479295a-393e-474c-bf3d-3a31d37e68bb,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:25433465-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 94a11ed289fe11ef88ecadb115cee93b-20241014
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1864120405; Mon, 14 Oct 2024 15:33:18 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 15:33:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 15:33:15 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 5/6] media: mediatek: vcodec: adding non extend struct
Date: Mon, 14 Oct 2024 15:33:09 +0800
Message-ID: <20241014073314.18409-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241014073314.18409-1-yunfei.dong@mediatek.com>
References: <20241014073314.18409-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.865500-8.000000
X-TMASE-MatchedRID: SJCrnFkDoFsQ5hxJOM7hQxlckvO1m+JcTJDl9FKHbrkS+jFO7d+PW4XU
	efEuqZPbprivVPtMHvYgtOjYSVCcGMZR5zLxbV5qSHCU59h5KrHEoDEGChh7CQoDY6gYCVOTWLm
	v5Mq0iytzQGdyGqOMPYAy6p60ZV62fJ5/bZ6npdjKayT/BQTiGhsMr2aelUWF66AX8NMCygLa1t
	TiSs0wA9D8gdPbakiJ3KstBC/47ng=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.865500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A81E988DBF4D0C9E3BCA885B5E5AAA3B44D34589CF95CCF41E60A04EF21469B32000:8
X-MTK: N

Adding non extend struct to support old architecture to calculate
address end in kernel.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 76 ++++++++++++++++++-
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index ba7fd3200d98..d6dc1cc5a712 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -66,6 +66,29 @@ struct vdec_h264_slice_info_ex {
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
@@ -124,6 +147,44 @@ struct vdec_h264_slice_vsi_ex {
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
@@ -172,10 +233,19 @@ struct vdec_h264_slice_inst {
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
2.46.0


