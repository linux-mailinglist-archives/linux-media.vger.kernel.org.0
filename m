Return-Path: <linux-media+bounces-32217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B32AB220D
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 10:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16D3C1C00188
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 08:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834CB22A1D4;
	Sat, 10 May 2025 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CT31vcog"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1D8221F24;
	Sat, 10 May 2025 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863922; cv=none; b=QRRx4N4pUfMNTWP3M6HjD7T4f5w/SaIylvKl2sW1YmydQd1xX3QXWLnr13vuY8GyYKRSLUWPX5HdEhOK/TE2oeEONWKkvJq456Dvv7ho2hSOk5n+5RFgQJrlwBjlN8tty4AuVP6RW9dMntxxgzRRgmQv7Fdh6YsPyrxikUfDmkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863922; c=relaxed/simple;
	bh=mI3iewsuJuKo4PZ8m0kiHtdODfzA7n4MnVvFLvXaZ3o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gNatTmFE+AT3IkMFN7D7EY5AfahKUVB6lB419Ljpr4D3G1xWGAJHaQYiNbFU0Az/wnaX6DqUnDD1tn9ZZ6enSkW1RD17LxN/xwqoYKDPv5Ksv5d8uy9xG6tAW2KYJaUg1OzziXr7oFRgmC3/HTeyBNi5RbOIdD44IPYZ4gI914I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CT31vcog; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 916bc0042d7411f082f7f7ac98dee637-20250510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BAIkgZN1tALx+5TYHI1VWwihIl2+mQhkPkkhE3bXgMA=;
	b=CT31vcogJBI8qia2wLXYDH7nOgAAWepZp15yDdbdhQ1jaYkarFZbzCmzwmelZBNOrfbKB7pdP0NEnBPTlK/45VMuU5EcX6+CEiz/c0ux4bPwNTUAEJfZ75I8Zf+nSpxzd7iJ2HFCznQuX7dmLp5CVwytzJK5paZtlnLGjlgmETY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6bc19390-9b50-4609-a069-bf24a27641f0,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:43cd5e51-76c0-4e62-bb75-246dfb0889c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 916bc0042d7411f082f7f7ac98dee637-20250510
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1546077641; Sat, 10 May 2025 15:58:32 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 10 May 2025 15:58:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 10 May 2025 15:58:29 +0800
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
Subject: [PATCH 14/14] media: mediatek: decoder: support av1 extend vsi
Date: Sat, 10 May 2025 15:53:44 +0800
Message-ID: <20250510075357.11761-15-yunfei.dong@mediatek.com>
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

The driver can't access tile buffer address for extend architecture,
set tile group information in vcp and share it with kernel.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 46 ++++++++++++++++---
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 6070485e26c4..43541faeea87 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -25,6 +25,8 @@
 
 #define AV1_INVALID_IDX			-1
 
+#define AV1_NON_EXT_VSI_SIZE		0xD50
+
 #define AV1_DIV_ROUND_UP_POW2(value, n)			\
 ({							\
 	typeof(n) _n  = n;				\
@@ -641,6 +643,8 @@ struct vdec_av1_slice_fb {
  * @frame:		current frame info
  * @state:		status after decode done
  * @cur_lst_tile_id:	tile id for large scale
+ * @tile_group:	tile group info
+ * @reserved:		reserved
  */
 struct vdec_av1_slice_vsi {
 	/* lat */
@@ -665,6 +669,8 @@ struct vdec_av1_slice_vsi {
 	struct vdec_av1_slice_frame frame;
 	struct vdec_av1_slice_state state;
 	u32 cur_lst_tile_id;
+	struct vdec_av1_slice_tile_group tile_group;
+	unsigned int reserved[4];
 };
 
 /**
@@ -1394,13 +1400,18 @@ static int vdec_av1_slice_setup_tile_group(struct vdec_av1_slice_instance *insta
 					   struct vdec_av1_slice_vsi *vsi)
 {
 	struct v4l2_ctrl_av1_tile_group_entry *ctrl_tge;
-	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
+	struct vdec_av1_slice_tile_group *tile_group;
 	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
 	struct vdec_av1_slice_tile *tile = &uh->tile;
 	struct v4l2_ctrl *ctrl;
 	u32 tge_size;
 	int i;
 
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		tile_group = &vsi->tile_group;
+	else
+		tile_group = &instance->tile_group;
+
 	ctrl = v4l2_ctrl_find(&instance->ctx->ctrl_hdl, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
 	if (!ctrl)
 		return -EINVAL;
@@ -1601,6 +1612,7 @@ static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *inst
 					    struct vdec_lat_buf *lat_buf)
 {
 	struct vdec_av1_slice_work_buffer *work_buffer;
+	u32 num_tiles;
 	int i;
 
 	vsi->bs.dma_addr = bs->dma_addr;
@@ -1635,12 +1647,18 @@ static void vdec_av1_slice_setup_lat_buffer(struct vdec_av1_slice_instance *inst
 
 	vsi->tile.buf = instance->tile.dma_addr;
 	vsi->tile.size = instance->tile.size;
-	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * instance->tile_group.num_tiles);
 
 	vsi->cdf_table.buf = instance->cdf_table.dma_addr;
 	vsi->cdf_table.size = instance->cdf_table.size;
 	vsi->iq_table.buf = instance->iq_table.dma_addr;
 	vsi->iq_table.size = instance->iq_table.size;
+
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		num_tiles = vsi->tile_group.num_tiles;
+	else
+		num_tiles = instance->tile_group.num_tiles;
+
+	memcpy(lat_buf->tile_addr.va, instance->tile.va, 64 * num_tiles);
 }
 
 static void vdec_av1_slice_setup_seg_buffer(struct vdec_av1_slice_instance *instance,
@@ -1663,7 +1681,7 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 					     struct vdec_av1_slice_vsi *vsi,
 					     struct mtk_vcodec_mem *bs)
 {
-	struct vdec_av1_slice_tile_group *tile_group = &instance->tile_group;
+	struct vdec_av1_slice_tile_group *tile_group;
 	struct vdec_av1_slice_uncompressed_header *uh = &vsi->frame.uh;
 	struct vdec_av1_slice_tile *tile = &uh->tile;
 	u32 tile_num, tile_row, tile_col;
@@ -1674,6 +1692,11 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 	u32 *tile_info_buf = instance->tile.va;
 	u64 pa = (u64)bs->dma_addr;
 
+	if (IS_VDEC_SUPPORT_EXT(instance->ctx->dev->dec_capability))
+		tile_group = &vsi->tile_group;
+	else
+		tile_group = &instance->tile_group;
+
 	if (uh->disable_cdf_update == 0)
 		allow_update_cdf = 1;
 
@@ -1887,7 +1910,7 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 {
 	struct vdec_av1_slice_instance *instance;
 	struct vdec_av1_slice_init_vsi *vsi;
-	int ret;
+	int ret, vsi_size = AV1_NON_EXT_VSI_SIZE;
 
 	instance = kzalloc(sizeof(*instance), GFP_KERNEL);
 	if (!instance)
@@ -1926,9 +1949,18 @@ static int vdec_av1_slice_init(struct mtk_vcodec_dec_ctx *ctx)
 		goto error_vsi;
 	}
 
-	if (vsi->vsi_size != sizeof(struct vdec_av1_slice_vsi))
-		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%zx\n",
-			     vsi->vsi_size, sizeof(struct vdec_av1_slice_vsi));
+	if (IS_VDEC_SUPPORT_EXT(ctx->dev->dec_capability)) {
+		vsi_size = sizeof(struct vdec_av1_slice_vsi);
+		vsi->iq_table_size = AV1_IQ_TABLE_SIZE;
+		vsi->cdf_table_size = AV1_CDF_SIZE;
+	}
+
+	if (vsi->vsi_size != vsi_size) {
+		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%x\n",
+			     vsi->vsi_size, vsi_size);
+		ret = -EINVAL;
+		goto error_vsi;
+	}
 
 	instance->irq_enabled = 1;
 	instance->inneracing_mode = IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability);
-- 
2.46.0


