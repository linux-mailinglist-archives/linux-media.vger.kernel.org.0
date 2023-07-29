Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA39767BB1
	for <lists+linux-media@lfdr.de>; Sat, 29 Jul 2023 04:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235717AbjG2Czj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 22:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235477AbjG2Czg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 22:55:36 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3009B49F1;
        Fri, 28 Jul 2023 19:55:29 -0700 (PDT)
X-UUID: 5ca469d02dbb11eeb20a276fd37b9834-20230729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fWrJYUiIrHhmwTijBB0Zqp28eJcaJUFq3kmU7rpj4kU=;
        b=RTvICHU1UhFLglx6fuCkZZxVuM9RZtmm92izzFxVf/Aa/w2NJ9uMQgJBklhRhyRMfhsxeUyZwERsZeabndOYrNMgpKFLqhaQ6ayy+nBelaK9rzaDorKE1hQOmSmjC8w/F2DMOwqOieaUssRQFmFrjRdRRhtaBAedcFmY0sr42wY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:23f61945-9b62-4f9e-8bce-b183c1ddca7c,IP:0,U
        RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
        N:release,TS:-25
X-CID-META: VersionHash:1fcc6f8,CLOUDID:191273d2-cd77-4e67-bbfd-aa4eaace762f,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
        DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 2,OSH
X-CID-BAS: 2,OSH,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5ca469d02dbb11eeb20a276fd37b9834-20230729
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 2005717149; Sat, 29 Jul 2023 10:55:23 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 29 Jul 2023 10:55:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 29 Jul 2023 10:55:20 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Nathan Hebert <nhebert@chromium.org>
CC:     Chen-Yu Tsai <wenst@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Steve Cho <stevecho@chromium.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8,05/11] media: mediatek: vcodec: remove the dependency of vcodec debug log
Date:   Sat, 29 Jul 2023 10:55:08 +0800
Message-ID: <20230729025515.16029-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230729025515.16029-1-yunfei.dong@mediatek.com>
References: <20230729025515.16029-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

'mtk_vcodec_debug' and 'mtk_vcodec_err' depends on 'mtk_vcodec_ctx'
to get the index of each instance. Define two different macro
mtk_vdec_debug and mtk_venc_debug for decoder and encoder, and re-write
macro mtk_vcodec_debug as the common interface which is called
by mtk_vdec_debug and mtk_venc_debug. The vcodec debug log can be
separeated by encoder and decoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/vcodec/mtk_vcodec_util.h         |  34 +++--
 .../vcodec/vdec/vdec_av1_req_lat_if.c         | 123 +++++++++--------
 .../mediatek/vcodec/vdec/vdec_h264_if.c       |  66 +++++-----
 .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  46 +++----
 .../vcodec/vdec/vdec_h264_req_multi_if.c      | 124 +++++++++---------
 .../vcodec/vdec/vdec_hevc_req_multi_if.c      |  94 +++++++------
 .../mediatek/vcodec/vdec/vdec_vp8_if.c        |  47 ++++---
 .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  66 +++++-----
 .../mediatek/vcodec/vdec/vdec_vp9_if.c        | 122 ++++++++---------
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 108 +++++++--------
 .../platform/mediatek/vcodec/vdec_vpu_if.c    |  45 ++++---
 .../mediatek/vcodec/venc/venc_h264_if.c       |  69 +++++-----
 .../mediatek/vcodec/venc/venc_vp8_if.c        |  32 ++---
 .../platform/mediatek/vcodec/venc_vpu_if.c    |  53 ++++----
 14 files changed, 494 insertions(+), 535 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
index 1f24114c5fb0..fd951ff47fc3 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
@@ -31,9 +31,8 @@ struct mtk_vcodec_dev;
 #define mtk_v4l2_err(fmt, args...)                \
 	pr_err("[MTK_V4L2][ERROR] " fmt "\n", ##args)
 
-#define mtk_vcodec_err(h, fmt, args...)				\
-	pr_err("[MTK_VCODEC][ERROR][%d]: " fmt "\n",		\
-	       ((struct mtk_vcodec_ctx *)(h)->ctx)->id, ##args)
+#define mtk_vcodec_err(inst_id, plat_dev, fmt, args...)                                 \
+	dev_err(&(plat_dev)->dev, "[MTK_VCODEC][ERROR][%d]: " fmt "\n", inst_id, ##args)
 
 #if defined(CONFIG_DEBUG_FS)
 extern int mtk_v4l2_dbg_level;
@@ -46,22 +45,31 @@ extern int mtk_vcodec_dbg;
 				 __func__, __LINE__, ##args);	        \
 	} while (0)
 
-#define mtk_vcodec_debug(h, fmt, args...)				                      \
-	do {								                      \
-		if (mtk_vcodec_dbg)					                      \
-			dev_dbg(&(((struct mtk_vcodec_ctx *)(h)->ctx)->dev->plat_dev->dev),   \
-				"[MTK_VCODEC][%d]: %s, %d " fmt "\n",                         \
-				((struct mtk_vcodec_ctx *)(h)->ctx)->id,                      \
-				__func__, __LINE__, ##args);                                  \
+#define mtk_vcodec_debug(inst_id, plat_dev, fmt, args...)                               \
+	do {                                                                            \
+		if (mtk_vcodec_dbg)                                                     \
+			dev_dbg(&(plat_dev)->dev, "[MTK_VCODEC][%d]: %s, %d " fmt "\n", \
+				inst_id, __func__, __LINE__, ##args);                   \
 	} while (0)
 #else
 #define mtk_v4l2_debug(level, fmt, args...) pr_debug(fmt, ##args)
 
-#define mtk_vcodec_debug(h, fmt, args...)			\
-	pr_debug("[MTK_VCODEC][%d]: " fmt "\n",			\
-		((struct mtk_vcodec_ctx *)(h)->ctx)->id, ##args)
+#define mtk_vcodec_debug(inst_id, plat_dev, fmt, args...)			\
+	dev_dbg(&(plat_dev)->dev, "[MTK_VCODEC][%d]: " fmt "\n", inst_id, ##args)
 #endif
 
+#define mtk_vdec_err(ctx, fmt, args...)                               \
+	mtk_vcodec_err((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
+
+#define mtk_vdec_debug(ctx, fmt, args...)                             \
+	mtk_vcodec_debug((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
+
+#define mtk_venc_err(ctx, fmt, args...)                               \
+	mtk_vcodec_err((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
+
+#define mtk_venc_debug(ctx, fmt, args...)                              \
+	mtk_vcodec_debug((ctx)->id, (ctx)->dev->plat_dev, fmt, ##args)
+
 void __iomem *mtk_vcodec_get_reg_addr(void __iomem **reg_base, unsigned int reg_idx);
 int mtk_vcodec_write_vdecsys(struct mtk_vcodec_ctx *ctx, unsigned int reg, unsigned int val);
 int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem);
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
index b00b423274b3..963233028893 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
@@ -778,12 +778,11 @@ static int vdec_av1_slice_init_cdf_table(struct vdec_av1_slice_instance *instanc
 	remote_cdf_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
 						     (u32)vsi->cdf_table_addr);
 	if (IS_ERR(remote_cdf_table)) {
-		mtk_vcodec_err(instance, "failed to map cdf table\n");
+		mtk_vdec_err(ctx, "failed to map cdf table\n");
 		return PTR_ERR(remote_cdf_table);
 	}
 
-	mtk_vcodec_debug(instance, "map cdf table to 0x%p\n",
-			 remote_cdf_table);
+	mtk_vdec_debug(ctx, "map cdf table to 0x%p\n", remote_cdf_table);
 
 	if (instance->cdf_table.va)
 		mtk_vcodec_mem_free(ctx, &instance->cdf_table);
@@ -810,11 +809,11 @@ static int vdec_av1_slice_init_iq_table(struct vdec_av1_slice_instance *instance
 	remote_iq_table = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
 						    (u32)vsi->iq_table_addr);
 	if (IS_ERR(remote_iq_table)) {
-		mtk_vcodec_err(instance, "failed to map iq table\n");
+		mtk_vdec_err(ctx, "failed to map iq table\n");
 		return PTR_ERR(remote_iq_table);
 	}
 
-	mtk_vcodec_debug(instance, "map iq table to 0x%p\n", remote_iq_table);
+	mtk_vdec_debug(ctx, "map iq table to 0x%p\n", remote_iq_table);
 
 	if (instance->iq_table.va)
 		mtk_vcodec_mem_free(ctx, &instance->iq_table);
@@ -965,8 +964,8 @@ static int vdec_av1_slice_alloc_working_buffer(struct vdec_av1_slice_instance *i
 	if (level == instance->level)
 		return 0;
 
-	mtk_vcodec_debug(instance, "resolution level changed from %u to %u, %ux%u",
-			 instance->level, level, w, h);
+	mtk_vdec_debug(ctx, "resolution level changed from %u to %u, %ux%u",
+		       instance->level, level, w, h);
 
 	max_sb_w = DIV_ROUND_UP(max_w, 128);
 	max_sb_h = DIV_ROUND_UP(max_h, 128);
@@ -1400,17 +1399,17 @@ static int vdec_av1_slice_setup_tile_group(struct vdec_av1_slice_instance *insta
 
 	if (tile_group->num_tiles != tge_size ||
 	    tile_group->num_tiles > V4L2_AV1_MAX_TILE_COUNT) {
-		mtk_vcodec_err(instance, "invalid tge_size %d, tile_num:%d\n",
-			       tge_size, tile_group->num_tiles);
+		mtk_vdec_err(instance->ctx, "invalid tge_size %d, tile_num:%d\n",
+			     tge_size, tile_group->num_tiles);
 		return -EINVAL;
 	}
 
 	for (i = 0; i < tge_size; i++) {
 		if (i != ctrl_tge[i].tile_row * vsi->frame.uh.tile.tile_cols +
 		    ctrl_tge[i].tile_col) {
-			mtk_vcodec_err(instance, "invalid tge info %d, %d %d %d\n",
-				       i, ctrl_tge[i].tile_row, ctrl_tge[i].tile_col,
-				       vsi->frame.uh.tile.tile_rows);
+			mtk_vdec_err(instance->ctx, "invalid tge info %d, %d %d %d\n",
+				     i, ctrl_tge[i].tile_row, ctrl_tge[i].tile_col,
+				     vsi->frame.uh.tile.tile_rows);
 			return -EINVAL;
 		}
 		tile_group->tile_size[i] = ctrl_tge[i].tile_size;
@@ -1639,7 +1638,7 @@ static void vdec_av1_slice_setup_seg_buffer(struct vdec_av1_slice_instance *inst
 
 	/* reset segment buffer */
 	if (uh->primary_ref_frame == AV1_PRIMARY_REF_NONE || !uh->seg.segmentation_enabled) {
-		mtk_vcodec_debug(instance, "reset seg %d\n", vsi->slot_id);
+		mtk_vdec_debug(instance->ctx, "reset seg %d\n", vsi->slot_id);
 		if (vsi->slot_id != AV1_INVALID_IDX) {
 			buf = &instance->seg[vsi->slot_id];
 			memset(buf->va, 0, buf->size);
@@ -1694,18 +1693,18 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 		    uh->disable_frame_end_update_cdf == 0)
 			tile_info_buf[tile_info_base + 4] |= (1 << 17);
 
-		mtk_vcodec_debug(instance, "// tile buf %d pos(%dx%d) offset 0x%x\n",
-				 tile_num, tile_row, tile_col, tile_info_base);
-		mtk_vcodec_debug(instance, "// %08x %08x %08x %08x\n",
-				 tile_info_buf[tile_info_base + 0],
-				 tile_info_buf[tile_info_base + 1],
-				 tile_info_buf[tile_info_base + 2],
-				 tile_info_buf[tile_info_base + 3]);
-		mtk_vcodec_debug(instance, "// %08x %08x %08x %08x\n",
-				 tile_info_buf[tile_info_base + 4],
-				 tile_info_buf[tile_info_base + 5],
-				 tile_info_buf[tile_info_base + 6],
-				 tile_info_buf[tile_info_base + 7]);
+		mtk_vdec_debug(instance->ctx, "// tile buf %d pos(%dx%d) offset 0x%x\n",
+			       tile_num, tile_row, tile_col, tile_info_base);
+		mtk_vdec_debug(instance->ctx, "// %08x %08x %08x %08x\n",
+			       tile_info_buf[tile_info_base + 0],
+			       tile_info_buf[tile_info_base + 1],
+			       tile_info_buf[tile_info_base + 2],
+			       tile_info_buf[tile_info_base + 3]);
+		mtk_vdec_debug(instance->ctx, "// %08x %08x %08x %08x\n",
+			       tile_info_buf[tile_info_base + 4],
+			       tile_info_buf[tile_info_base + 5],
+			       tile_info_buf[tile_info_base + 6],
+			       tile_info_buf[tile_info_base + 7]);
 	}
 }
 
@@ -1747,8 +1746,8 @@ static int vdec_av1_slice_update_lat(struct vdec_av1_slice_instance *instance,
 	struct vdec_av1_slice_vsi *vsi;
 
 	vsi = &pfc->vsi;
-	mtk_vcodec_debug(instance, "frame %u LAT CRC 0x%08x, output size is %d\n",
-			 pfc->seq, vsi->state.crc[0], vsi->state.out_size);
+	mtk_vdec_debug(instance->ctx, "frame %u LAT CRC 0x%08x, output size is %d\n",
+		       pfc->seq, vsi->state.crc[0], vsi->state.out_size);
 
 	/* buffer full, need to re-decode */
 	if (vsi->state.full) {
@@ -1859,12 +1858,12 @@ static int vdec_av1_slice_update_core(struct vdec_av1_slice_instance *instance,
 {
 	struct vdec_av1_slice_vsi *vsi = instance->core_vsi;
 
-	mtk_vcodec_debug(instance, "frame %u Y_CRC %08x %08x %08x %08x\n",
-			 pfc->seq, vsi->state.crc[0], vsi->state.crc[1],
-			 vsi->state.crc[2], vsi->state.crc[3]);
-	mtk_vcodec_debug(instance, "frame %u C_CRC %08x %08x %08x %08x\n",
-			 pfc->seq, vsi->state.crc[8], vsi->state.crc[9],
-			 vsi->state.crc[10], vsi->state.crc[11]);
+	mtk_vdec_debug(instance->ctx, "frame %u Y_CRC %08x %08x %08x %08x\n",
+		       pfc->seq, vsi->state.crc[0], vsi->state.crc[1],
+		       vsi->state.crc[2], vsi->state.crc[3]);
+	mtk_vdec_debug(instance->ctx, "frame %u C_CRC %08x %08x %08x %08x\n",
+		       pfc->seq, vsi->state.crc[8], vsi->state.crc[9],
+		       vsi->state.crc[10], vsi->state.crc[11]);
 
 	return 0;
 }
@@ -1887,14 +1886,14 @@ static int vdec_av1_slice_init(struct mtk_vcodec_ctx *ctx)
 
 	ret = vpu_dec_init(&instance->vpu);
 	if (ret) {
-		mtk_vcodec_err(instance, "failed to init vpu dec, ret %d\n", ret);
+		mtk_vdec_err(ctx, "failed to init vpu dec, ret %d\n", ret);
 		goto error_vpu_init;
 	}
 
 	/* init vsi and global flags */
 	vsi = instance->vpu.vsi;
 	if (!vsi) {
-		mtk_vcodec_err(instance, "failed to get AV1 vsi\n");
+		mtk_vdec_err(ctx, "failed to get AV1 vsi\n");
 		ret = -EINVAL;
 		goto error_vsi;
 	}
@@ -1902,20 +1901,20 @@ static int vdec_av1_slice_init(struct mtk_vcodec_ctx *ctx)
 	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler, (u32)vsi->core_vsi);
 
 	if (!instance->core_vsi) {
-		mtk_vcodec_err(instance, "failed to get AV1 core vsi\n");
+		mtk_vdec_err(ctx, "failed to get AV1 core vsi\n");
 		ret = -EINVAL;
 		goto error_vsi;
 	}
 
 	if (vsi->vsi_size != sizeof(struct vdec_av1_slice_vsi))
-		mtk_vcodec_err(instance, "remote vsi size 0x%x mismatch! expected: 0x%zx\n",
-			       vsi->vsi_size, sizeof(struct vdec_av1_slice_vsi));
+		mtk_vdec_err(ctx, "remote vsi size 0x%x mismatch! expected: 0x%zx\n",
+			     vsi->vsi_size, sizeof(struct vdec_av1_slice_vsi));
 
 	instance->irq_enabled = 1;
 	instance->inneracing_mode = IS_VDEC_INNER_RACING(instance->ctx->dev->dec_capability);
 
-	mtk_vcodec_debug(instance, "vsi 0x%p core_vsi 0x%llx 0x%p, inneracing_mode %d\n",
-			 vsi, vsi->core_vsi, instance->core_vsi, instance->inneracing_mode);
+	mtk_vdec_debug(ctx, "vsi 0x%p core_vsi 0x%llx 0x%p, inneracing_mode %d\n",
+		       vsi, vsi->core_vsi, instance->core_vsi, instance->inneracing_mode);
 
 	ret = vdec_av1_slice_init_cdf_table(instance);
 	if (ret)
@@ -1942,7 +1941,7 @@ static void vdec_av1_slice_deinit(void *h_vdec)
 
 	if (!instance)
 		return;
-	mtk_vcodec_debug(instance, "h_vdec 0x%p\n", h_vdec);
+	mtk_vdec_debug(instance->ctx, "h_vdec 0x%p\n", h_vdec);
 	vpu_dec_deinit(&instance->vpu);
 	vdec_av1_slice_free_working_buffer(instance);
 	vdec_msg_queue_deinit(&instance->ctx->msg_queue, instance->ctx);
@@ -1955,7 +1954,7 @@ static int vdec_av1_slice_flush(void *h_vdec, struct mtk_vcodec_mem *bs,
 	struct vdec_av1_slice_instance *instance = h_vdec;
 	int i;
 
-	mtk_vcodec_debug(instance, "flush ...\n");
+	mtk_vdec_debug(instance->ctx, "flush ...\n");
 
 	vdec_msg_queue_wait_lat_buf_full(&instance->ctx->msg_queue);
 
@@ -1970,7 +1969,7 @@ static void vdec_av1_slice_get_pic_info(struct vdec_av1_slice_instance *instance
 	struct mtk_vcodec_ctx *ctx = instance->ctx;
 	u32 data[3];
 
-	mtk_vcodec_debug(instance, "w %u h %u\n", ctx->picinfo.pic_w, ctx->picinfo.pic_h);
+	mtk_vdec_debug(ctx, "w %u h %u\n", ctx->picinfo.pic_w, ctx->picinfo.pic_h);
 
 	data[0] = ctx->picinfo.pic_w;
 	data[1] = ctx->picinfo.pic_h;
@@ -2000,8 +1999,8 @@ static void vdec_av1_slice_get_crop_info(struct vdec_av1_slice_instance *instanc
 	cr->width = ctx->picinfo.pic_w;
 	cr->height = ctx->picinfo.pic_h;
 
-	mtk_vcodec_debug(instance, "l=%d, t=%d, w=%d, h=%d\n",
-			 cr->left, cr->top, cr->width, cr->height);
+	mtk_vdec_debug(ctx, "l=%d, t=%d, w=%d, h=%d\n",
+		       cr->left, cr->top, cr->width, cr->height);
 }
 
 static int vdec_av1_slice_get_param(void *h_vdec, enum vdec_get_param_type type, void *out)
@@ -2019,7 +2018,7 @@ static int vdec_av1_slice_get_param(void *h_vdec, enum vdec_get_param_type type,
 		vdec_av1_slice_get_crop_info(instance, out);
 		break;
 	default:
-		mtk_vcodec_err(instance, "invalid get parameter type=%d\n", type);
+		mtk_vdec_err(instance->ctx, "invalid get parameter type=%d\n", type);
 		return -EINVAL;
 	}
 
@@ -2043,7 +2042,7 @@ static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	/* init msgQ for the first time */
 	if (vdec_msg_queue_init(&ctx->msg_queue, ctx,
 				vdec_av1_slice_core_decode, sizeof(*pfc))) {
-		mtk_vcodec_err(instance, "failed to init AV1 msg queue\n");
+		mtk_vdec_err(ctx, "failed to init AV1 msg queue\n");
 		return -ENOMEM;
 	}
 
@@ -2053,7 +2052,7 @@ static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	lat_buf = vdec_msg_queue_dqbuf(&ctx->msg_queue.lat_ctx);
 	if (!lat_buf) {
-		mtk_vcodec_err(instance, "failed to get AV1 lat buf\n");
+		mtk_vdec_err(ctx, "failed to get AV1 lat buf\n");
 		return -EAGAIN;
 	}
 	pfc = (struct vdec_av1_slice_pfc *)lat_buf->private_data;
@@ -2065,14 +2064,14 @@ static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	ret = vdec_av1_slice_setup_lat(instance, bs, lat_buf, pfc);
 	if (ret) {
-		mtk_vcodec_err(instance, "failed to setup AV1 lat ret %d\n", ret);
+		mtk_vdec_err(ctx, "failed to setup AV1 lat ret %d\n", ret);
 		goto err_free_fb_out;
 	}
 
 	vdec_av1_slice_vsi_to_remote(vsi, instance->vsi);
 	ret = vpu_dec_start(&instance->vpu, NULL, 0);
 	if (ret) {
-		mtk_vcodec_err(instance, "failed to dec AV1 ret %d\n", ret);
+		mtk_vdec_err(ctx, "failed to dec AV1 ret %d\n", ret);
 		goto err_free_fb_out;
 	}
 	if (instance->inneracing_mode)
@@ -2084,7 +2083,7 @@ static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 						   MTK_VDEC_LAT0);
 		/* update remote vsi if decode timeout */
 		if (ret) {
-			mtk_vcodec_err(instance, "AV1 Frame %d decode timeout %d\n", pfc->seq, ret);
+			mtk_vdec_err(ctx, "AV1 Frame %d decode timeout %d\n", pfc->seq, ret);
 			WRITE_ONCE(instance->vsi->state.timeout, 1);
 		}
 		vpu_dec_end(&instance->vpu);
@@ -2095,7 +2094,7 @@ static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	/* LAT trans full, re-decode */
 	if (ret == -EAGAIN) {
-		mtk_vcodec_err(instance, "AV1 Frame %d trans full\n", pfc->seq);
+		mtk_vdec_err(ctx, "AV1 Frame %d trans full\n", pfc->seq);
 		if (!instance->inneracing_mode)
 			vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
 		return 0;
@@ -2103,14 +2102,14 @@ static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	/* LAT trans full, no more UBE or decode timeout */
 	if (ret == -ENOMEM || vsi->state.timeout) {
-		mtk_vcodec_err(instance, "AV1 Frame %d insufficient buffer or timeout\n", pfc->seq);
+		mtk_vdec_err(ctx, "AV1 Frame %d insufficient buffer or timeout\n", pfc->seq);
 		if (!instance->inneracing_mode)
 			vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
 		return -EBUSY;
 	}
 	vsi->trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
-	mtk_vcodec_debug(instance, "lat dma 1 0x%pad 0x%pad\n",
-			 &pfc->vsi.trans.dma_addr, &pfc->vsi.trans.dma_addr_end);
+	mtk_vdec_debug(ctx, "lat dma 1 0x%pad 0x%pad\n",
+		       &pfc->vsi.trans.dma_addr, &pfc->vsi.trans.dma_addr_end);
 
 	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue, vsi->trans.dma_addr_end);
 
@@ -2124,7 +2123,7 @@ static int vdec_av1_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
 
 	if (pfc)
-		mtk_vcodec_err(instance, "slice dec number: %d err: %d", pfc->seq, ret);
+		mtk_vdec_err(ctx, "slice dec number: %d err: %d", pfc->seq, ret);
 
 	return ret;
 }
@@ -2157,13 +2156,13 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
 
 	ret = vdec_av1_slice_setup_core(instance, fb, lat_buf, pfc);
 	if (ret) {
-		mtk_vcodec_err(instance, "vdec_av1_slice_setup_core\n");
+		mtk_vdec_err(ctx, "vdec_av1_slice_setup_core\n");
 		goto err;
 	}
 	vdec_av1_slice_vsi_to_remote(&pfc->vsi, instance->core_vsi);
 	ret = vpu_dec_core(&instance->vpu);
 	if (ret) {
-		mtk_vcodec_err(instance, "vpu_dec_core\n");
+		mtk_vdec_err(ctx, "vpu_dec_core\n");
 		goto err;
 	}
 
@@ -2173,7 +2172,7 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
 						   MTK_VDEC_CORE);
 		/* update remote vsi if decode timeout */
 		if (ret) {
-			mtk_vcodec_err(instance, "AV1 frame %d core timeout\n", pfc->seq);
+			mtk_vdec_err(ctx, "AV1 frame %d core timeout\n", pfc->seq);
 			WRITE_ONCE(instance->vsi->state.timeout, 1);
 		}
 		vpu_dec_core_end(&instance->vpu);
@@ -2181,12 +2180,12 @@ static int vdec_av1_slice_core_decode(struct vdec_lat_buf *lat_buf)
 
 	ret = vdec_av1_slice_update_core(instance, lat_buf, pfc);
 	if (ret) {
-		mtk_vcodec_err(instance, "vdec_av1_slice_update_core\n");
+		mtk_vdec_err(ctx, "vdec_av1_slice_update_core\n");
 		goto err;
 	}
 
-	mtk_vcodec_debug(instance, "core dma_addr_end 0x%pad\n",
-			 &instance->core_vsi->trans.dma_addr_end);
+	mtk_vdec_debug(ctx, "core dma_addr_end 0x%pad\n",
+		       &instance->core_vsi->trans.dma_addr_end);
 	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, instance->core_vsi->trans.dma_addr_end);
 
 	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c
index 24312a90afbb..ca5437ae37f6 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_if.c
@@ -144,7 +144,7 @@ static int allocate_predication_buf(struct vdec_h264_inst *inst)
 	inst->pred_buf.size = BUF_PREDICTION_SZ;
 	err = mtk_vcodec_mem_alloc(inst->ctx, &inst->pred_buf);
 	if (err) {
-		mtk_vcodec_err(inst, "failed to allocate ppl buf");
+		mtk_vdec_err(inst->ctx, "failed to allocate ppl buf");
 		return err;
 	}
 
@@ -176,7 +176,7 @@ static int alloc_mv_buf(struct vdec_h264_inst *inst, struct vdec_pic_info *pic)
 		mem->size = buf_sz;
 		err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 		if (err) {
-			mtk_vcodec_err(inst, "failed to allocate mv buf");
+			mtk_vdec_err(inst->ctx, "failed to allocate mv buf");
 			return err;
 		}
 		inst->vsi->mv_buf_dma[i] = mem->dma_addr;
@@ -207,9 +207,9 @@ static int check_list_validity(struct vdec_h264_inst *inst, bool disp_list)
 	if (list->count > H264_MAX_FB_NUM ||
 	    list->read_idx >= H264_MAX_FB_NUM ||
 	    list->write_idx >= H264_MAX_FB_NUM) {
-		mtk_vcodec_err(inst, "%s list err: cnt=%d r_idx=%d w_idx=%d",
-			       disp_list ? "disp" : "free", list->count,
-			       list->read_idx, list->write_idx);
+		mtk_vdec_err(inst->ctx, "%s list err: cnt=%d r_idx=%d w_idx=%d",
+			     disp_list ? "disp" : "free", list->count,
+			     list->read_idx, list->write_idx);
 		return -EINVAL;
 	}
 
@@ -226,12 +226,12 @@ static void put_fb_to_free(struct vdec_h264_inst *inst, struct vdec_fb *fb)
 
 		list = &inst->vsi->list_free;
 		if (list->count == H264_MAX_FB_NUM) {
-			mtk_vcodec_err(inst, "[FB] put fb free_list full");
+			mtk_vdec_err(inst->ctx, "[FB] put fb free_list full");
 			return;
 		}
 
-		mtk_vcodec_debug(inst, "[FB] put fb into free_list @(%p, %llx)",
-				 fb->base_y.va, (u64)fb->base_y.dma_addr);
+		mtk_vdec_debug(inst->ctx, "[FB] put fb into free_list @(%p, %llx)",
+			       fb->base_y.va, (u64)fb->base_y.dma_addr);
 
 		list->fb_list[list->write_idx].vdec_fb_va = (u64)(uintptr_t)fb;
 		list->write_idx = (list->write_idx == H264_MAX_FB_NUM - 1) ?
@@ -244,10 +244,9 @@ static void get_pic_info(struct vdec_h264_inst *inst,
 			 struct vdec_pic_info *pic)
 {
 	*pic = inst->vsi->pic;
-	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
-			 pic->pic_w, pic->pic_h, pic->buf_w, pic->buf_h);
-	mtk_vcodec_debug(inst, "fb size: Y(%d), C(%d)",
-			 pic->fb_sz[0], pic->fb_sz[1]);
+	mtk_vdec_debug(inst->ctx, "pic(%d, %d), buf(%d, %d)",
+		       pic->pic_w, pic->pic_h, pic->buf_w, pic->buf_h);
+	mtk_vdec_debug(inst->ctx, "fb size: Y(%d), C(%d)", pic->fb_sz[0], pic->fb_sz[1]);
 }
 
 static void get_crop_info(struct vdec_h264_inst *inst, struct v4l2_rect *cr)
@@ -257,14 +256,14 @@ static void get_crop_info(struct vdec_h264_inst *inst, struct v4l2_rect *cr)
 	cr->width = inst->vsi->crop.width;
 	cr->height = inst->vsi->crop.height;
 
-	mtk_vcodec_debug(inst, "l=%d, t=%d, w=%d, h=%d",
-			 cr->left, cr->top, cr->width, cr->height);
+	mtk_vdec_debug(inst->ctx, "l=%d, t=%d, w=%d, h=%d", cr->left, cr->top,
+		       cr->width, cr->height);
 }
 
 static void get_dpb_size(struct vdec_h264_inst *inst, unsigned int *dpb_sz)
 {
 	*dpb_sz = inst->vsi->dec.dpb_sz;
-	mtk_vcodec_debug(inst, "sz=%d", *dpb_sz);
+	mtk_vdec_debug(inst->ctx, "sz=%d", *dpb_sz);
 }
 
 static int vdec_h264_init(struct mtk_vcodec_ctx *ctx)
@@ -283,7 +282,7 @@ static int vdec_h264_init(struct mtk_vcodec_ctx *ctx)
 
 	err = vpu_dec_init(&inst->vpu);
 	if (err) {
-		mtk_vcodec_err(inst, "vdec_h264 init err=%d", err);
+		mtk_vdec_err(ctx, "vdec_h264 init err=%d", err);
 		goto error_free_inst;
 	}
 
@@ -292,7 +291,7 @@ static int vdec_h264_init(struct mtk_vcodec_ctx *ctx)
 	if (err)
 		goto error_deinit;
 
-	mtk_vcodec_debug(inst, "H264 Instance >> %p", inst);
+	mtk_vdec_debug(ctx, "H264 Instance >> %p", inst);
 
 	ctx->drv_handle = inst;
 	return 0;
@@ -344,8 +343,8 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	uint64_t y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
 	uint64_t c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
 
-	mtk_vcodec_debug(inst, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
-			 ++inst->num_nalu, y_fb_dma, c_fb_dma, fb);
+	mtk_vdec_debug(inst->ctx, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
+		       ++inst->num_nalu, y_fb_dma, c_fb_dma, fb);
 
 	/* bs NULL means flush decoder */
 	if (bs == NULL)
@@ -355,15 +354,15 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	buf_sz = bs->size;
 	nal_start_idx = find_start_code(buf, buf_sz);
 	if (nal_start_idx < 0) {
-		mtk_vcodec_err(inst, "invalid nal start code");
+		mtk_vdec_err(inst->ctx, "invalid nal start code");
 		err = -EIO;
 		goto err_free_fb_out;
 	}
 
 	nal_start = buf[nal_start_idx];
 	nal_type = NAL_TYPE(buf[nal_start_idx]);
-	mtk_vcodec_debug(inst, "\n + NALU[%d] type %d +\n", inst->num_nalu,
-			 nal_type);
+	mtk_vdec_debug(inst->ctx, "\n + NALU[%d] type %d +\n", inst->num_nalu,
+		       nal_type);
 
 	if (nal_type == NAL_H264_PPS) {
 		buf_sz -= nal_start_idx;
@@ -384,8 +383,7 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	err = vpu_dec_start(vpu, data, 2);
 	if (err) {
 		if (err > 0 && (DEC_ERR_RET(err) == H264_ERR_NOT_VALID)) {
-			mtk_vcodec_err(inst, "- error bitstream - err = %d -",
-				       err);
+			mtk_vdec_err(inst->ctx, "- error bitstream - err = %d -", err);
 			err = -EIO;
 		}
 		goto err_free_fb_out;
@@ -395,7 +393,7 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (*res_chg) {
 		struct vdec_pic_info pic;
 
-		mtk_vcodec_debug(inst, "- resolution changed -");
+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
 		get_pic_info(inst, &pic);
 
 		if (inst->vsi->dec.realloc_mv_buf) {
@@ -416,13 +414,12 @@ static int vdec_h264_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		vpu_dec_end(vpu);
 	}
 
-	mtk_vcodec_debug(inst, "\n - NALU[%d] type=%d -\n", inst->num_nalu,
-			 nal_type);
+	mtk_vdec_debug(inst->ctx, "\n - NALU[%d] type=%d -\n", inst->num_nalu, nal_type);
 	return 0;
 
 err_free_fb_out:
 	put_fb_to_free(inst, fb);
-	mtk_vcodec_err(inst, "\n - NALU[%d] err=%d -\n", inst->num_nalu, err);
+	mtk_vdec_err(inst->ctx, "\n - NALU[%d] err=%d -\n", inst->num_nalu, err);
 	return err;
 }
 
@@ -436,8 +433,7 @@ static void vdec_h264_get_fb(struct vdec_h264_inst *inst,
 		return;
 
 	if (list->count == 0) {
-		mtk_vcodec_debug(inst, "[FB] there is no %s fb",
-				 disp_list ? "disp" : "free");
+		mtk_vdec_debug(inst->ctx, "[FB] there is no %s fb", disp_list ? "disp" : "free");
 		*out_fb = NULL;
 		return;
 	}
@@ -447,10 +443,10 @@ static void vdec_h264_get_fb(struct vdec_h264_inst *inst,
 	fb->status |= (disp_list ? FB_ST_DISPLAY : FB_ST_FREE);
 
 	*out_fb = fb;
-	mtk_vcodec_debug(inst, "[FB] get %s fb st=%d poc=%d %llx",
-			 disp_list ? "disp" : "free",
-			 fb->status, list->fb_list[list->read_idx].poc,
-			 list->fb_list[list->read_idx].vdec_fb_va);
+	mtk_vdec_debug(inst->ctx, "[FB] get %s fb st=%d poc=%d %llx",
+		       disp_list ? "disp" : "free",
+		       fb->status, list->fb_list[list->read_idx].poc,
+		       list->fb_list[list->read_idx].vdec_fb_va);
 
 	list->read_idx = (list->read_idx == H264_MAX_FB_NUM - 1) ?
 			 0 : list->read_idx + 1;
@@ -484,7 +480,7 @@ static int vdec_h264_get_param(void *h_vdec, enum vdec_get_param_type type,
 		break;
 
 	default:
-		mtk_vcodec_err(inst, "invalid get parameter type=%d", type);
+		mtk_vdec_err(inst->ctx, "invalid get parameter type=%d", type);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
index dc6ee266f232..250746db366b 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_if.c
@@ -162,7 +162,7 @@ static int allocate_predication_buf(struct vdec_h264_slice_inst *inst)
 	inst->pred_buf.size = BUF_PREDICTION_SZ;
 	err = mtk_vcodec_mem_alloc(inst->ctx, &inst->pred_buf);
 	if (err) {
-		mtk_vcodec_err(inst, "failed to allocate ppl buf");
+		mtk_vdec_err(inst->ctx, "failed to allocate ppl buf");
 		return err;
 	}
 
@@ -195,7 +195,7 @@ static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
 		mem->size = buf_sz;
 		err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 		if (err) {
-			mtk_vcodec_err(inst, "failed to allocate mv buf");
+			mtk_vdec_err(inst->ctx, "failed to allocate mv buf");
 			return err;
 		}
 		inst->vsi_ctx.mv_buf_dma[i] = mem->dma_addr;
@@ -230,11 +230,11 @@ static void get_pic_info(struct vdec_h264_slice_inst *inst,
 		ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
 
 	*pic = ctx->picinfo;
-	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
-			 ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-			 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
-	mtk_vcodec_debug(inst, "Y/C(%d, %d)", ctx->picinfo.fb_sz[0],
-			 ctx->picinfo.fb_sz[1]);
+	mtk_vdec_debug(inst->ctx, "pic(%d, %d), buf(%d, %d)",
+		       ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+		       ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+	mtk_vdec_debug(inst->ctx, "Y/C(%d, %d)", ctx->picinfo.fb_sz[0],
+		       ctx->picinfo.fb_sz[1]);
 
 	if (ctx->last_decoded_picinfo.pic_w != ctx->picinfo.pic_w ||
 	    ctx->last_decoded_picinfo.pic_h != ctx->picinfo.pic_h) {
@@ -259,14 +259,14 @@ static void get_crop_info(struct vdec_h264_slice_inst *inst, struct v4l2_rect *c
 	cr->width = inst->vsi_ctx.crop.width;
 	cr->height = inst->vsi_ctx.crop.height;
 
-	mtk_vcodec_debug(inst, "l=%d, t=%d, w=%d, h=%d",
-			 cr->left, cr->top, cr->width, cr->height);
+	mtk_vdec_debug(inst->ctx, "l=%d, t=%d, w=%d, h=%d",
+		       cr->left, cr->top, cr->width, cr->height);
 }
 
 static void get_dpb_size(struct vdec_h264_slice_inst *inst, unsigned int *dpb_sz)
 {
 	*dpb_sz = inst->vsi_ctx.dec.dpb_sz;
-	mtk_vcodec_debug(inst, "sz=%d", *dpb_sz);
+	mtk_vdec_debug(inst->ctx, "sz=%d", *dpb_sz);
 }
 
 static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
@@ -285,7 +285,7 @@ static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
 
 	err = vpu_dec_init(&inst->vpu);
 	if (err) {
-		mtk_vcodec_err(inst, "vdec_h264 init err=%d", err);
+		mtk_vdec_err(ctx, "vdec_h264 init err=%d", err);
 		goto error_free_inst;
 	}
 
@@ -297,13 +297,13 @@ static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
 	if (err)
 		goto error_deinit;
 
-	mtk_vcodec_debug(inst, "struct size = %zu,%zu,%zu,%zu\n",
-			 sizeof(struct mtk_h264_sps_param),
-			 sizeof(struct mtk_h264_pps_param),
-			 sizeof(struct mtk_h264_dec_slice_param),
-			 sizeof(struct mtk_h264_dpb_info));
+	mtk_vdec_debug(ctx, "struct size = %zu,%zu,%zu,%zu\n",
+		       sizeof(struct mtk_h264_sps_param),
+		       sizeof(struct mtk_h264_pps_param),
+		       sizeof(struct mtk_h264_dec_slice_param),
+		       sizeof(struct mtk_h264_dpb_info));
 
-	mtk_vcodec_debug(inst, "H264 Instance >> %p", inst);
+	mtk_vdec_debug(ctx, "H264 Instance >> %p", inst);
 
 	ctx->drv_handle = inst;
 	return 0;
@@ -354,8 +354,8 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
 	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
 
-	mtk_vcodec_debug(inst, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
-			 inst->num_nalu, y_fb_dma, c_fb_dma, fb);
+	mtk_vdec_debug(inst->ctx, "+ [%d] FB y_dma=%llx c_dma=%llx va=%p",
+		       inst->num_nalu, y_fb_dma, c_fb_dma, fb);
 
 	inst->vsi_ctx.dec.bs_dma = (uint64_t)bs->dma_addr;
 	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
@@ -380,7 +380,7 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	*res_chg = inst->vsi_ctx.dec.resolution_changed;
 	if (*res_chg) {
-		mtk_vcodec_debug(inst, "- resolution changed -");
+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
 		if (inst->vsi_ctx.dec.realloc_mv_buf) {
 			err = alloc_mv_buf(inst, &inst->ctx->picinfo);
 			inst->vsi_ctx.dec.realloc_mv_buf = false;
@@ -404,11 +404,11 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	vpu_dec_end(vpu);
 
 	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
-	mtk_vcodec_debug(inst, "\n - NALU[%d]", inst->num_nalu);
+	mtk_vdec_debug(inst->ctx, "\n - NALU[%d]", inst->num_nalu);
 	return 0;
 
 err_free_fb_out:
-	mtk_vcodec_err(inst, "\n - NALU[%d] err=%d -\n", inst->num_nalu, err);
+	mtk_vdec_err(inst->ctx, "\n - NALU[%d] err=%d -\n", inst->num_nalu, err);
 	return err;
 }
 
@@ -430,7 +430,7 @@ static int vdec_h264_slice_get_param(void *h_vdec, enum vdec_get_param_type type
 		break;
 
 	default:
-		mtk_vcodec_err(inst, "invalid get parameter type=%d", type);
+		mtk_vdec_err(inst->ctx, "invalid get parameter type=%d", type);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
index 3cb5b967f48a..2a160dcb5296 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c
@@ -199,7 +199,7 @@ static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *i
 		return PTR_ERR(pps);
 
 	if (dec_params->flags & V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC) {
-		mtk_vcodec_err(inst, "No support for H.264 field decoding.");
+		mtk_vdec_err(inst->ctx, "No support for H.264 field decoding.");
 		inst->is_field_bitstream = true;
 		return -EINVAL;
 	}
@@ -322,7 +322,7 @@ static int vdec_h264_slice_alloc_mv_buf(struct vdec_h264_slice_inst *inst,
 		mem->size = buf_sz;
 		err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 		if (err) {
-			mtk_vcodec_err(inst, "failed to allocate mv buf");
+			mtk_vdec_err(inst->ctx, "failed to allocate mv buf");
 			return err;
 		}
 	}
@@ -359,11 +359,11 @@ static void vdec_h264_slice_get_pic_info(struct vdec_h264_slice_inst *inst)
 	inst->cap_num_planes =
 		ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
 
-	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
-			 ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-			 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
-	mtk_vcodec_debug(inst, "Y/C(%d, %d)", ctx->picinfo.fb_sz[0],
-			 ctx->picinfo.fb_sz[1]);
+	mtk_vdec_debug(ctx, "pic(%d, %d), buf(%d, %d)",
+		       ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+		       ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+	mtk_vdec_debug(ctx, "Y/C(%d, %d)", ctx->picinfo.fb_sz[0],
+		       ctx->picinfo.fb_sz[1]);
 
 	if (ctx->last_decoded_picinfo.pic_w != ctx->picinfo.pic_w ||
 	    ctx->last_decoded_picinfo.pic_h != ctx->picinfo.pic_h) {
@@ -389,8 +389,8 @@ static void vdec_h264_slice_get_crop_info(struct vdec_h264_slice_inst *inst,
 	cr->width = inst->ctx->picinfo.pic_w;
 	cr->height = inst->ctx->picinfo.pic_h;
 
-	mtk_vcodec_debug(inst, "l=%d, t=%d, w=%d, h=%d",
-			 cr->left, cr->top, cr->width, cr->height);
+	mtk_vdec_debug(inst->ctx, "l=%d, t=%d, w=%d, h=%d",
+		       cr->left, cr->top, cr->width, cr->height);
 }
 
 static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
@@ -412,7 +412,7 @@ static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
 
 	err = vpu_dec_init(&inst->vpu);
 	if (err) {
-		mtk_vcodec_err(inst, "vdec_h264 init err=%d", err);
+		mtk_vdec_err(ctx, "vdec_h264 init err=%d", err);
 		goto error_free_inst;
 	}
 
@@ -423,14 +423,14 @@ static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
 	inst->resolution_changed = true;
 	inst->realloc_mv_buf = true;
 
-	mtk_vcodec_debug(inst, "lat struct size = %d,%d,%d,%d vsi: %d\n",
-			 (int)sizeof(struct mtk_h264_sps_param),
-			 (int)sizeof(struct mtk_h264_pps_param),
-			 (int)sizeof(struct vdec_h264_slice_lat_dec_param),
-			 (int)sizeof(struct mtk_h264_dpb_info),
-			 vsi_size);
-	mtk_vcodec_debug(inst, "lat H264 instance >> %p, codec_type = 0x%x",
-			 inst, inst->vpu.codec_type);
+	mtk_vdec_debug(ctx, "lat struct size = %d,%d,%d,%d vsi: %d\n",
+		       (int)sizeof(struct mtk_h264_sps_param),
+		       (int)sizeof(struct mtk_h264_pps_param),
+		       (int)sizeof(struct vdec_h264_slice_lat_dec_param),
+		       (int)sizeof(struct mtk_h264_dpb_info),
+		       vsi_size);
+	mtk_vdec_debug(ctx, "lat H264 instance >> %p, codec_type = 0x%x",
+		       inst, inst->vpu.codec_type);
 
 	ctx->drv_handle = inst;
 	return 0;
@@ -464,14 +464,14 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	struct mtk_vcodec_mem *mem;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 
-	mtk_vcodec_debug(inst, "[h264-core] vdec_h264 core decode");
+	mtk_vdec_debug(ctx, "[h264-core] vdec_h264 core decode");
 	memcpy(&inst->vsi_core->h264_slice_params, &share_info->h264_slice_params,
 	       sizeof(share_info->h264_slice_params));
 
 	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
 	if (!fb) {
 		err = -EBUSY;
-		mtk_vcodec_err(inst, "fb buffer is NULL");
+		mtk_vdec_err(ctx, "fb buffer is NULL");
 		goto vdec_dec_end;
 	}
 
@@ -483,8 +483,7 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	else
 		c_fb_dma = (u64)fb->base_c.dma_addr;
 
-	mtk_vcodec_debug(inst, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma,
-			 c_fb_dma);
+	mtk_vdec_debug(ctx, "[h264-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
 
 	inst->vsi_core->dec.y_fb_dma = y_fb_dma;
 	inst->vsi_core->dec.c_fb_dma = c_fb_dma;
@@ -514,7 +513,7 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 
 	err = vpu_dec_core(vpu);
 	if (err) {
-		mtk_vcodec_err(inst, "core decode err=%d", err);
+		mtk_vdec_err(ctx, "core decode err=%d", err);
 		goto vdec_dec_end;
 	}
 
@@ -522,22 +521,21 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
 					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
 	if (timeout)
-		mtk_vcodec_err(inst, "core decode timeout: pic_%d",
-			       ctx->decoded_frame_cnt);
+		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
 	inst->vsi_core->dec.timeout = !!timeout;
 
 	vpu_dec_core_end(vpu);
-	mtk_vcodec_debug(inst, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
-			 ctx->decoded_frame_cnt,
-			 inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
-			 inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
-			 inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
-			 inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
+	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       ctx->decoded_frame_cnt,
+		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
+		       inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
+		       inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
+		       inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
 
 vdec_dec_end:
 	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans_end);
 	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
-	mtk_vcodec_debug(inst, "core decode done err=%d", err);
+	mtk_vdec_debug(ctx, "core decode done err=%d", err);
 	ctx->decoded_frame_cnt++;
 	return 0;
 }
@@ -594,7 +592,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	lat_buf = vdec_msg_queue_dqbuf(&inst->ctx->msg_queue.lat_ctx);
 	if (!lat_buf) {
-		mtk_vcodec_debug(inst, "failed to get lat buffer");
+		mtk_vdec_debug(inst->ctx, "failed to get lat buffer");
 		return -EAGAIN;
 	}
 	share_info = lat_buf->private_data;
@@ -623,7 +621,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
-		mtk_vcodec_debug(inst, "- resolution changed -");
+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
 		if (inst->realloc_mv_buf) {
 			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
 			inst->realloc_mv_buf = false;
@@ -646,19 +644,19 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	inst->vsi->trans_end = inst->ctx->msg_queue.wdma_rptr_addr;
 	inst->vsi->trans_start = inst->ctx->msg_queue.wdma_wptr_addr;
-	mtk_vcodec_debug(inst, "lat:trans(0x%llx 0x%llx) err:0x%llx",
-			 inst->vsi->wdma_start_addr,
-			 inst->vsi->wdma_end_addr,
-			 inst->vsi->wdma_err_addr);
-
-	mtk_vcodec_debug(inst, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
-			 inst->vsi->slice_bc_start_addr,
-			 inst->vsi->slice_bc_end_addr,
-			 inst->vsi->trans_start,
-			 inst->vsi->trans_end);
+	mtk_vdec_debug(inst->ctx, "lat:trans(0x%llx 0x%llx) err:0x%llx",
+		       inst->vsi->wdma_start_addr,
+		       inst->vsi->wdma_end_addr,
+		       inst->vsi->wdma_err_addr);
+
+	mtk_vdec_debug(inst->ctx, "slice(0x%llx 0x%llx) rprt((0x%llx 0x%llx))",
+		       inst->vsi->slice_bc_start_addr,
+		       inst->vsi->slice_bc_end_addr,
+		       inst->vsi->trans_start,
+		       inst->vsi->trans_end);
 	err = vpu_dec_start(vpu, data, 2);
 	if (err) {
-		mtk_vcodec_debug(inst, "lat decode err: %d", err);
+		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
 		goto err_free_fb_out;
 	}
 
@@ -677,7 +675,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
 					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
 	if (timeout)
-		mtk_vcodec_err(inst, "lat decode timeout: pic_%d", inst->slice_dec_num);
+		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
 	inst->vsi->dec.timeout = !!timeout;
 
 	err = vpu_dec_end(vpu);
@@ -685,7 +683,7 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
 			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
 		inst->slice_dec_num++;
-		mtk_vcodec_err(inst, "lat dec fail: pic_%d err:%d", inst->slice_dec_num, err);
+		mtk_vdec_err(inst->ctx, "lat dec fail: pic_%d err:%d", inst->slice_dec_num, err);
 		return -EINVAL;
 	}
 
@@ -698,14 +696,14 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		       sizeof(share_info->h264_slice_params));
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
-	mtk_vcodec_debug(inst, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
-			 inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
+	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
+		       inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
 
 	inst->slice_dec_num++;
 	return 0;
 err_free_fb_out:
 	vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
-	mtk_vcodec_err(inst, "slice dec number: %d err: %d", inst->slice_dec_num, err);
+	mtk_vdec_err(inst->ctx, "slice dec number: %d err: %d", inst->slice_dec_num, err);
 	return err;
 }
 
@@ -732,8 +730,8 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
 	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
-	mtk_vcodec_debug(inst, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
-			 inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
+	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx c_dma=%llx",
+		       inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma);
 
 	inst->vsi_ctx.dec.bs_buf_addr = (u64)bs->dma_addr;
 	inst->vsi_ctx.dec.bs_buf_size = bs->size;
@@ -757,7 +755,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
-		mtk_vcodec_debug(inst, "- resolution changed -");
+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
 		if (inst->realloc_mv_buf) {
 			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
 			inst->realloc_mv_buf = false;
@@ -781,8 +779,7 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	err = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
 					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
 	if (err)
-		mtk_vcodec_err(inst, "decode timeout: pic_%d",
-			       inst->ctx->decoded_frame_cnt);
+		mtk_vdec_err(inst->ctx, "decode timeout: pic_%d", inst->ctx->decoded_frame_cnt);
 
 	inst->vsi->dec.timeout = !!err;
 	err = vpu_dec_end(vpu);
@@ -790,19 +787,18 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 		goto err_free_fb_out;
 
 	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
-	mtk_vcodec_debug(inst, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
-			 inst->ctx->decoded_frame_cnt,
-			 inst->vsi_ctx.dec.crc[0], inst->vsi_ctx.dec.crc[1],
-			 inst->vsi_ctx.dec.crc[2], inst->vsi_ctx.dec.crc[3],
-			 inst->vsi_ctx.dec.crc[4], inst->vsi_ctx.dec.crc[5],
-			 inst->vsi_ctx.dec.crc[6], inst->vsi_ctx.dec.crc[7]);
+	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       inst->ctx->decoded_frame_cnt,
+		       inst->vsi_ctx.dec.crc[0], inst->vsi_ctx.dec.crc[1],
+		       inst->vsi_ctx.dec.crc[2], inst->vsi_ctx.dec.crc[3],
+		       inst->vsi_ctx.dec.crc[4], inst->vsi_ctx.dec.crc[5],
+		       inst->vsi_ctx.dec.crc[6], inst->vsi_ctx.dec.crc[7]);
 
 	inst->ctx->decoded_frame_cnt++;
 	return 0;
 
 err_free_fb_out:
-	mtk_vcodec_err(inst, "dec frame number: %d err: %d",
-		       inst->ctx->decoded_frame_cnt, err);
+	mtk_vdec_err(inst->ctx, "dec frame number: %d err: %d", inst->ctx->decoded_frame_cnt, err);
 	return err;
 }
 
@@ -839,7 +835,7 @@ static int vdec_h264_slice_get_param(void *h_vdec, enum vdec_get_param_type type
 		vdec_h264_slice_get_crop_info(inst, out);
 		break;
 	default:
-		mtk_vcodec_err(inst, "invalid get parameter type=%d", type);
+		mtk_vdec_err(inst->ctx, "invalid get parameter type=%d", type);
 		return -EINVAL;
 	}
 	return 0;
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
index 0bb5b54578e9..5a864bcfe7ba 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
@@ -657,7 +657,7 @@ static int vdec_hevc_slice_alloc_mv_buf(struct vdec_hevc_slice_inst *inst,
 		mem->size = buf_sz;
 		err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 		if (err) {
-			mtk_vcodec_err(inst, "failed to allocate mv buf");
+			mtk_vdec_err(inst->ctx, "failed to allocate mv buf");
 			return err;
 		}
 	}
@@ -694,11 +694,11 @@ static void vdec_hevc_slice_get_pic_info(struct vdec_hevc_slice_inst *inst)
 	inst->cap_num_planes =
 		ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes;
 
-	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
-			 ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-			 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
-	mtk_vcodec_debug(inst, "Y/C(%d, %d)", ctx->picinfo.fb_sz[0],
-			 ctx->picinfo.fb_sz[1]);
+	mtk_vdec_debug(ctx, "pic(%d, %d), buf(%d, %d)",
+		       ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+		       ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+	mtk_vdec_debug(ctx, "Y/C(%d, %d)", ctx->picinfo.fb_sz[0],
+		       ctx->picinfo.fb_sz[1]);
 
 	if (ctx->last_decoded_picinfo.pic_w != ctx->picinfo.pic_w ||
 	    ctx->last_decoded_picinfo.pic_h != ctx->picinfo.pic_h) {
@@ -724,8 +724,8 @@ static void vdec_hevc_slice_get_crop_info(struct vdec_hevc_slice_inst *inst,
 	cr->width = inst->ctx->picinfo.pic_w;
 	cr->height = inst->ctx->picinfo.pic_h;
 
-	mtk_vcodec_debug(inst, "l=%d, t=%d, w=%d, h=%d",
-			 cr->left, cr->top, cr->width, cr->height);
+	mtk_vdec_debug(inst->ctx, "l=%d, t=%d, w=%d, h=%d",
+		       cr->left, cr->top, cr->width, cr->height);
 }
 
 static int vdec_hevc_slice_setup_lat_buffer(struct vdec_hevc_slice_inst *inst,
@@ -747,7 +747,7 @@ static int vdec_hevc_slice_setup_lat_buffer(struct vdec_hevc_slice_inst *inst,
 
 	*res_chg = inst->resolution_changed;
 	if (inst->resolution_changed) {
-		mtk_vcodec_debug(inst, "- resolution changed -");
+		mtk_vdec_debug(inst->ctx, "- resolution changed -");
 		if (inst->realloc_mv_buf) {
 			err = vdec_hevc_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
 			inst->realloc_mv_buf = false;
@@ -779,16 +779,16 @@ static int vdec_hevc_slice_setup_lat_buffer(struct vdec_hevc_slice_inst *inst,
 	share_info->trans.dma_addr = inst->vsi->trans.dma_addr;
 	share_info->trans.dma_addr_end = inst->vsi->trans.dma_addr_end;
 
-	mtk_vcodec_debug(inst, "lat: ube addr/size(0x%llx 0x%llx) err:0x%llx",
-			 inst->vsi->ube.buf,
-			 inst->vsi->ube.padding,
-			 inst->vsi->err_map.buf);
+	mtk_vdec_debug(inst->ctx, "lat: ube addr/size(0x%llx 0x%llx) err:0x%llx",
+		       inst->vsi->ube.buf,
+		       inst->vsi->ube.padding,
+		       inst->vsi->err_map.buf);
 
-	mtk_vcodec_debug(inst, "slice addr/size(0x%llx 0x%llx) trans start/end((0x%llx 0x%llx))",
-			 inst->vsi->slice_bc.buf,
-			 inst->vsi->slice_bc.padding,
-			 inst->vsi->trans.buf,
-			 inst->vsi->trans.padding);
+	mtk_vdec_debug(inst->ctx, "slice addr/size(0x%llx 0x%llx) trans start/end((0x%llx 0x%llx))",
+		       inst->vsi->slice_bc.buf,
+		       inst->vsi->slice_bc.padding,
+		       inst->vsi->trans.buf,
+		       inst->vsi->trans.padding);
 
 	return 0;
 }
@@ -806,7 +806,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 
 	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
 	if (!fb) {
-		mtk_vcodec_err(inst, "fb buffer is NULL");
+		mtk_vdec_err(inst->ctx, "fb buffer is NULL");
 		return -EBUSY;
 	}
 
@@ -817,8 +817,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 	else
 		c_fb_dma = (u64)fb->base_c.dma_addr;
 
-	mtk_vcodec_debug(inst, "[hevc-core] y/c addr = 0x%llx 0x%llx", y_fb_dma,
-			 c_fb_dma);
+	mtk_vdec_debug(inst->ctx, "[hevc-core] y/c addr = 0x%llx 0x%llx", y_fb_dma, c_fb_dma);
 
 	inst->vsi_core->fb.y.dma_addr = y_fb_dma;
 	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[0];
@@ -874,7 +873,7 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_ctx *ctx)
 	ctx->drv_handle = inst;
 	err = vpu_dec_init(&inst->vpu);
 	if (err) {
-		mtk_vcodec_err(inst, "vdec_hevc init err=%d", err);
+		mtk_vdec_err(ctx, "vdec_hevc init err=%d", err);
 		goto error_free_inst;
 	}
 
@@ -891,14 +890,14 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_ctx *ctx)
 	if (err)
 		goto error_free_inst;
 
-	mtk_vcodec_debug(inst, "lat struct size = %d,%d,%d,%d vsi: %d\n",
-			 (int)sizeof(struct mtk_hevc_sps_param),
-			 (int)sizeof(struct mtk_hevc_pps_param),
-			 (int)sizeof(struct vdec_hevc_slice_lat_dec_param),
-			 (int)sizeof(struct mtk_hevc_dpb_info),
+	mtk_vdec_debug(ctx, "lat struct size = %d,%d,%d,%d vsi: %d\n",
+		       (int)sizeof(struct mtk_hevc_sps_param),
+		       (int)sizeof(struct mtk_hevc_pps_param),
+		       (int)sizeof(struct vdec_hevc_slice_lat_dec_param),
+		       (int)sizeof(struct mtk_hevc_dpb_info),
 			 vsi_size);
-	mtk_vcodec_debug(inst, "lat hevc instance >> %p, codec_type = 0x%x",
-			 inst, inst->vpu.codec_type);
+	mtk_vdec_debug(ctx, "lat hevc instance >> %p, codec_type = 0x%x",
+		       inst, inst->vpu.codec_type);
 
 	return 0;
 error_free_inst:
@@ -930,7 +929,7 @@ static int vdec_hevc_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	struct vdec_hevc_slice_share_info *share_info = lat_buf->private_data;
 	struct vdec_vpu_inst *vpu = &inst->vpu;
 
-	mtk_vcodec_debug(inst, "[hevc-core] vdec_hevc core decode");
+	mtk_vdec_debug(ctx, "[hevc-core] vdec_hevc core decode");
 	memcpy(&inst->vsi_core->hevc_slice_params, &share_info->hevc_slice_params,
 	       sizeof(share_info->hevc_slice_params));
 
@@ -942,7 +941,7 @@ static int vdec_hevc_slice_core_decode(struct vdec_lat_buf *lat_buf)
 					    share_info);
 	err = vpu_dec_core(vpu);
 	if (err) {
-		mtk_vcodec_err(inst, "core decode err=%d", err);
+		mtk_vdec_err(ctx, "core decode err=%d", err);
 		goto vdec_dec_end;
 	}
 
@@ -950,22 +949,21 @@ static int vdec_hevc_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
 					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
 	if (timeout)
-		mtk_vcodec_err(inst, "core decode timeout: pic_%d",
-			       ctx->decoded_frame_cnt);
+		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
 	inst->vsi_core->dec.timeout = !!timeout;
 
 	vpu_dec_core_end(vpu);
-	mtk_vcodec_debug(inst, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
-			 ctx->decoded_frame_cnt,
-			 inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
-			 inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
-			 inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
-			 inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
+	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       ctx->decoded_frame_cnt,
+		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
+		       inst->vsi_core->dec.crc[2], inst->vsi_core->dec.crc[3],
+		       inst->vsi_core->dec.crc[4], inst->vsi_core->dec.crc[5],
+		       inst->vsi_core->dec.crc[6], inst->vsi_core->dec.crc[7]);
 
 vdec_dec_end:
 	vdec_msg_queue_update_ube_rptr(&lat_buf->ctx->msg_queue, share_info->trans.dma_addr_end);
 	ctx->dev->vdec_pdata->cap_to_disp(ctx, !!err, lat_buf->src_buf_req);
-	mtk_vcodec_debug(inst, "core decode done err=%d", err);
+	mtk_vdec_debug(ctx, "core decode done err=%d", err);
 	ctx->decoded_frame_cnt++;
 	return 0;
 }
@@ -993,7 +991,7 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	lat_buf = vdec_msg_queue_dqbuf(&inst->ctx->msg_queue.lat_ctx);
 	if (!lat_buf) {
-		mtk_vcodec_debug(inst, "failed to get lat buffer");
+		mtk_vdec_debug(inst->ctx, "failed to get lat buffer");
 		return -EAGAIN;
 	}
 
@@ -1008,7 +1006,7 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	err = vpu_dec_start(vpu, data, 2);
 	if (err) {
-		mtk_vcodec_debug(inst, "lat decode err: %d", err);
+		mtk_vdec_debug(inst->ctx, "lat decode err: %d", err);
 		goto err_free_fb_out;
 	}
 
@@ -1022,7 +1020,7 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
 					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
 	if (timeout)
-		mtk_vcodec_err(inst, "lat decode timeout: pic_%d", inst->slice_dec_num);
+		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
 	inst->vsi->dec.timeout = !!timeout;
 
 	err = vpu_dec_end(vpu);
@@ -1030,7 +1028,7 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
 			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
 		inst->slice_dec_num++;
-		mtk_vcodec_err(inst, "lat dec fail: pic_%d err:%d", inst->slice_dec_num, err);
+		mtk_vdec_err(inst->ctx, "lat dec fail: pic_%d err:%d", inst->slice_dec_num, err);
 		return -EINVAL;
 	}
 
@@ -1043,14 +1041,14 @@ static int vdec_hevc_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		       sizeof(share_info->hevc_slice_params));
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
-	mtk_vcodec_debug(inst, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
-			 inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
+	mtk_vdec_debug(inst->ctx, "dec num: %d lat crc: 0x%x 0x%x 0x%x", inst->slice_dec_num,
+		       inst->vsi->dec.crc[0], inst->vsi->dec.crc[1], inst->vsi->dec.crc[2]);
 
 	inst->slice_dec_num++;
 	return 0;
 err_free_fb_out:
 	vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
-	mtk_vcodec_err(inst, "slice dec number: %d err: %d", inst->slice_dec_num, err);
+	mtk_vdec_err(inst->ctx, "slice dec number: %d err: %d", inst->slice_dec_num, err);
 	return err;
 }
 
@@ -1081,7 +1079,7 @@ static int vdec_hevc_slice_get_param(void *h_vdec, enum vdec_get_param_type type
 		vdec_hevc_slice_get_crop_info(inst, out);
 		break;
 	default:
-		mtk_vcodec_err(inst, "invalid get parameter type=%d", type);
+		mtk_vdec_err(inst->ctx, "invalid get parameter type=%d", type);
 		return -EINVAL;
 	}
 	return 0;
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
index c3a1fbb2e1b5..1d4597f28a42 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_if.c
@@ -282,10 +282,10 @@ static void get_pic_info(struct vdec_vp8_inst *inst, struct vdec_pic_info *pic)
 {
 	*pic = inst->vsi->pic;
 
-	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
-			 pic->pic_w, pic->pic_h, pic->buf_w, pic->buf_h);
-	mtk_vcodec_debug(inst, "fb size: Y(%d), C(%d)",
-			 pic->fb_sz[0], pic->fb_sz[1]);
+	mtk_vdec_debug(inst->ctx, "pic(%d, %d), buf(%d, %d)",
+		       pic->pic_w, pic->pic_h, pic->buf_w, pic->buf_h);
+	mtk_vdec_debug(inst->ctx, "fb size: Y(%d), C(%d)",
+		       pic->fb_sz[0], pic->fb_sz[1]);
 }
 
 static void vp8_dec_finish(struct vdec_vp8_inst *inst)
@@ -293,7 +293,7 @@ static void vp8_dec_finish(struct vdec_vp8_inst *inst)
 	struct vdec_fb_node *node;
 	uint64_t prev_y_dma = inst->vsi->dec.prev_y_dma;
 
-	mtk_vcodec_debug(inst, "prev fb base dma=%llx", prev_y_dma);
+	mtk_vdec_debug(inst->ctx, "prev fb base dma=%llx", prev_y_dma);
 
 	/* put last decode ok frame to fb_free_list */
 	if (prev_y_dma != 0) {
@@ -368,7 +368,7 @@ static int alloc_working_buf(struct vdec_vp8_inst *inst)
 	mem->size = VP8_WORKING_BUF_SZ;
 	err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 	if (err) {
-		mtk_vcodec_err(inst, "Cannot allocate working buffer");
+		mtk_vdec_err(inst->ctx, "Cannot allocate working buffer");
 		return err;
 	}
 
@@ -402,7 +402,7 @@ static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx)
 
 	err = vpu_dec_init(&inst->vpu);
 	if (err) {
-		mtk_vcodec_err(inst, "vdec_vp8 init err=%d", err);
+		mtk_vdec_err(ctx, "vdec_vp8 init err=%d", err);
 		goto error_free_inst;
 	}
 
@@ -413,7 +413,7 @@ static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx)
 		goto error_deinit;
 
 	get_hw_reg_base(inst);
-	mtk_vcodec_debug(inst, "VP8 Instance >> %p", inst);
+	mtk_vdec_debug(ctx, "VP8 Instance >> %p", inst);
 
 	ctx->drv_handle = inst;
 	return 0;
@@ -446,8 +446,8 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
 	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
 
-	mtk_vcodec_debug(inst, "+ [%d] FB y_dma=%llx c_dma=%llx fb=%p",
-			 inst->frm_cnt, y_fb_dma, c_fb_dma, fb);
+	mtk_vdec_debug(inst->ctx, "+ [%d] FB y_dma=%llx c_dma=%llx fb=%p",
+		       inst->frm_cnt, y_fb_dma, c_fb_dma, fb);
 
 	inst->cur_fb = fb;
 	dec->bs_dma = (unsigned long)bs->dma_addr;
@@ -455,7 +455,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	dec->cur_y_fb_dma = y_fb_dma;
 	dec->cur_c_fb_dma = c_fb_dma;
 
-	mtk_vcodec_debug(inst, "\n + FRAME[%d] +\n", inst->frm_cnt);
+	mtk_vdec_debug(inst->ctx, "\n + FRAME[%d] +\n", inst->frm_cnt);
 
 	write_hw_segmentation_data(inst);
 	enable_hw_rw_function(inst);
@@ -470,7 +470,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (err) {
 		add_fb_to_free_list(inst, fb);
 		if (dec->wait_key_frame) {
-			mtk_vcodec_debug(inst, "wait key frame !");
+			mtk_vdec_debug(inst->ctx, "wait key frame !");
 			return 0;
 		}
 
@@ -478,7 +478,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	}
 
 	if (dec->resolution_changed) {
-		mtk_vcodec_debug(inst, "- resolution_changed -");
+		mtk_vdec_debug(inst->ctx, "- resolution_changed -");
 		*res_chg = true;
 		add_fb_to_free_list(inst, fb);
 		return 0;
@@ -498,14 +498,13 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	if (err)
 		goto error;
 
-	mtk_vcodec_debug(inst, "\n - FRAME[%d] - show=%d\n", inst->frm_cnt,
-			 dec->show_frame);
+	mtk_vdec_debug(inst->ctx, "\n - FRAME[%d] - show=%d\n", inst->frm_cnt, dec->show_frame);
 	inst->frm_cnt++;
 	*res_chg = false;
 	return 0;
 
 error:
-	mtk_vcodec_err(inst, "\n - FRAME[%d] - err=%d\n", inst->frm_cnt, err);
+	mtk_vdec_err(inst->ctx, "\n - FRAME[%d] - err=%d\n", inst->frm_cnt, err);
 	return err;
 }
 
@@ -520,11 +519,10 @@ static void get_disp_fb(struct vdec_vp8_inst *inst, struct vdec_fb **out_fb)
 		list_move_tail(&node->list, &inst->available_fb_node_list);
 		fb = (struct vdec_fb *)node->fb;
 		fb->status |= FB_ST_DISPLAY;
-		mtk_vcodec_debug(inst, "[FB] get disp fb %p st=%d",
-				 node->fb, fb->status);
+		mtk_vdec_debug(inst->ctx, "[FB] get disp fb %p st=%d", node->fb, fb->status);
 	} else {
 		fb = NULL;
-		mtk_vcodec_debug(inst, "[FB] there is no disp fb");
+		mtk_vdec_debug(inst->ctx, "[FB] there is no disp fb");
 	}
 
 	*out_fb = fb;
@@ -541,11 +539,10 @@ static void get_free_fb(struct vdec_vp8_inst *inst, struct vdec_fb **out_fb)
 		list_move_tail(&node->list, &inst->available_fb_node_list);
 		fb = (struct vdec_fb *)node->fb;
 		fb->status |= FB_ST_FREE;
-		mtk_vcodec_debug(inst, "[FB] get free fb %p st=%d",
-				 node->fb, fb->status);
+		mtk_vdec_debug(inst->ctx, "[FB] get free fb %p st=%d", node->fb, fb->status);
 	} else {
 		fb = NULL;
-		mtk_vcodec_debug(inst, "[FB] there is no free fb");
+		mtk_vdec_debug(inst->ctx, "[FB] there is no free fb");
 	}
 
 	*out_fb = fb;
@@ -557,8 +554,8 @@ static void get_crop_info(struct vdec_vp8_inst *inst, struct v4l2_rect *cr)
 	cr->top = 0;
 	cr->width = inst->vsi->pic.pic_w;
 	cr->height = inst->vsi->pic.pic_h;
-	mtk_vcodec_debug(inst, "get crop info l=%d, t=%d, w=%d, h=%d",
-			 cr->left, cr->top, cr->width, cr->height);
+	mtk_vdec_debug(inst->ctx, "get crop info l=%d, t=%d, w=%d, h=%d",
+		       cr->left, cr->top, cr->width, cr->height);
 }
 
 static int vdec_vp8_get_param(void *h_vdec, enum vdec_get_param_type type,
@@ -588,7 +585,7 @@ static int vdec_vp8_get_param(void *h_vdec, enum vdec_get_param_type type,
 		break;
 
 	default:
-		mtk_vcodec_err(inst, "invalid get parameter type=%d", type);
+		mtk_vdec_err(inst->ctx, "invalid get parameter type=%d", type);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
index f7181f4a4d2a..4193fe20bb92 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
@@ -137,11 +137,11 @@ static void vdec_vp8_slice_get_pic_info(struct vdec_vp8_slice_inst *inst)
 	inst->vsi->pic.buf_h = ctx->picinfo.buf_h;
 	inst->vsi->pic.fb_sz[0] = ctx->picinfo.fb_sz[0];
 	inst->vsi->pic.fb_sz[1] = ctx->picinfo.fb_sz[1];
-	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
-			 ctx->picinfo.pic_w, ctx->picinfo.pic_h,
-			 ctx->picinfo.buf_w, ctx->picinfo.buf_h);
-	mtk_vcodec_debug(inst, "fb size: Y(%d), C(%d)",
-			 ctx->picinfo.fb_sz[0], ctx->picinfo.fb_sz[1]);
+	mtk_vdec_debug(inst->ctx, "pic(%d, %d), buf(%d, %d)",
+		       ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+		       ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+	mtk_vdec_debug(inst->ctx, "fb size: Y(%d), C(%d)",
+		       ctx->picinfo.fb_sz[0], ctx->picinfo.fb_sz[1]);
 }
 
 static int vdec_vp8_slice_alloc_working_buf(struct vdec_vp8_slice_inst *inst)
@@ -153,7 +153,7 @@ static int vdec_vp8_slice_alloc_working_buf(struct vdec_vp8_slice_inst *inst)
 	mem->size = VP8_SEG_ID_SZ;
 	err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 	if (err) {
-		mtk_vcodec_err(inst, "Cannot allocate working buffer");
+		mtk_vdec_err(inst->ctx, "Cannot allocate working buffer");
 		return err;
 	}
 	inst->vsi->dec.seg_id_buf_dma = (u64)mem->dma_addr;
@@ -162,7 +162,7 @@ static int vdec_vp8_slice_alloc_working_buf(struct vdec_vp8_slice_inst *inst)
 	mem->size = VP8_PP_WRAPY_SZ;
 	err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 	if (err) {
-		mtk_vcodec_err(inst, "cannot allocate WRAP Y buffer");
+		mtk_vdec_err(inst->ctx, "cannot allocate WRAP Y buffer");
 		return err;
 	}
 	inst->vsi->dec.wrap_y_dma = (u64)mem->dma_addr;
@@ -171,7 +171,7 @@ static int vdec_vp8_slice_alloc_working_buf(struct vdec_vp8_slice_inst *inst)
 	mem->size = VP8_PP_WRAPC_SZ;
 	err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 	if (err) {
-		mtk_vcodec_err(inst, "cannot allocate WRAP C buffer");
+		mtk_vdec_err(inst->ctx, "cannot allocate WRAP C buffer");
 		return err;
 	}
 	inst->vsi->dec.wrap_c_dma = (u64)mem->dma_addr;
@@ -180,7 +180,7 @@ static int vdec_vp8_slice_alloc_working_buf(struct vdec_vp8_slice_inst *inst)
 	mem->size = VP8_VLD_PRED_SZ;
 	err = mtk_vcodec_mem_alloc(inst->ctx, mem);
 	if (err) {
-		mtk_vcodec_err(inst, "cannot allocate vld wrapper buffer");
+		mtk_vdec_err(inst->ctx, "cannot allocate vld wrapper buffer");
 		return err;
 	}
 	inst->vsi->dec.vld_wrapper_dma = (u64)mem->dma_addr;
@@ -249,8 +249,8 @@ static int vdec_vp8_slice_get_decode_parameters(struct vdec_vp8_slice_inst *inst
 		vb = vb2_find_buffer(vq, referenct_ts);
 		if (!vb) {
 			if (!V4L2_VP8_FRAME_IS_KEY_FRAME(frame_header))
-				mtk_vcodec_err(inst, "reference invalid: index(%d) ts(%lld)",
-					       index, referenct_ts);
+				mtk_vdec_err(inst->ctx, "reference invalid: index(%d) ts(%lld)",
+					     index, referenct_ts);
 			inst->vsi->vp8_dpb_info[index].reference_flag = 0;
 			continue;
 		}
@@ -291,7 +291,7 @@ static int vdec_vp8_slice_init(struct mtk_vcodec_ctx *ctx)
 
 	err = vpu_dec_init(&inst->vpu);
 	if (err) {
-		mtk_vcodec_err(inst, "vdec_vp8 init err=%d", err);
+		mtk_vdec_err(ctx, "vdec_vp8 init err=%d", err);
 		goto error_free_inst;
 	}
 
@@ -300,11 +300,11 @@ static int vdec_vp8_slice_init(struct mtk_vcodec_ctx *ctx)
 	if (err)
 		goto error_deinit;
 
-	mtk_vcodec_debug(inst, "vp8 struct size = %d vsi: %d\n",
-			 (int)sizeof(struct v4l2_ctrl_vp8_frame),
-			 (int)sizeof(struct vdec_vp8_slice_vsi));
-	mtk_vcodec_debug(inst, "vp8:%p, codec_type = 0x%x vsi: 0x%p",
-			 inst, inst->vpu.codec_type, inst->vpu.vsi);
+	mtk_vdec_debug(ctx, "vp8 struct size = %d vsi: %d\n",
+		       (int)sizeof(struct v4l2_ctrl_vp8_frame),
+		       (int)sizeof(struct vdec_vp8_slice_vsi));
+	mtk_vdec_debug(ctx, "vp8:%p, codec_type = 0x%x vsi: 0x%p",
+		       inst, inst->vpu.codec_type, inst->vpu.vsi);
 
 	ctx->drv_handle = inst;
 	return 0;
@@ -350,10 +350,10 @@ static int vdec_vp8_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	inst->vsi->dec.cur_y_fb_dma = y_fb_dma;
 	inst->vsi->dec.cur_c_fb_dma = c_fb_dma;
 
-	mtk_vcodec_debug(inst, "frame[%d] bs(%zu 0x%llx) y/c(0x%llx 0x%llx)",
-			 inst->ctx->decoded_frame_cnt,
-			 bs->size, (u64)bs->dma_addr,
-			 y_fb_dma, c_fb_dma);
+	mtk_vdec_debug(inst->ctx, "frame[%d] bs(%zu 0x%llx) y/c(0x%llx 0x%llx)",
+		       inst->ctx->decoded_frame_cnt,
+		       bs->size, (u64)bs->dma_addr,
+		       y_fb_dma, c_fb_dma);
 
 	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
 				   &dst_buf_info->m2m_buf.vb, true);
@@ -364,12 +364,12 @@ static int vdec_vp8_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	err = vpu_dec_start(vpu, &data, 1);
 	if (err) {
-		mtk_vcodec_debug(inst, "vp8 dec start err!");
+		mtk_vdec_debug(inst->ctx, "vp8 dec start err!");
 		goto error;
 	}
 
 	if (inst->vsi->dec.resolution_changed) {
-		mtk_vcodec_debug(inst, "- resolution_changed -");
+		mtk_vdec_debug(inst->ctx, "- resolution_changed -");
 		*res_chg = true;
 		return 0;
 	}
@@ -380,15 +380,15 @@ static int vdec_vp8_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	err = vpu_dec_end(vpu);
 	if (err || timeout)
-		mtk_vcodec_debug(inst, "vp8 dec error timeout:%d err: %d pic_%d",
-				 timeout, err, inst->ctx->decoded_frame_cnt);
+		mtk_vdec_debug(inst->ctx, "vp8 dec error timeout:%d err: %d pic_%d",
+			       timeout, err, inst->ctx->decoded_frame_cnt);
 
-	mtk_vcodec_debug(inst, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
-			 inst->ctx->decoded_frame_cnt,
-			 inst->vsi->dec.crc[0], inst->vsi->dec.crc[1],
-			 inst->vsi->dec.crc[2], inst->vsi->dec.crc[3],
-			 inst->vsi->dec.crc[4], inst->vsi->dec.crc[5],
-			 inst->vsi->dec.crc[6], inst->vsi->dec.crc[7]);
+	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+		       inst->ctx->decoded_frame_cnt,
+		       inst->vsi->dec.crc[0], inst->vsi->dec.crc[1],
+		       inst->vsi->dec.crc[2], inst->vsi->dec.crc[3],
+		       inst->vsi->dec.crc[4], inst->vsi->dec.crc[5],
+		       inst->vsi->dec.crc[6], inst->vsi->dec.crc[7]);
 
 	inst->ctx->decoded_frame_cnt++;
 error:
@@ -404,13 +404,13 @@ static int vdec_vp8_slice_get_param(void *h_vdec, enum vdec_get_param_type type,
 		vdec_vp8_slice_get_pic_info(inst);
 		break;
 	case GET_PARAM_CROP_INFO:
-		mtk_vcodec_debug(inst, "No need to get vp8 crop information.");
+		mtk_vdec_debug(inst->ctx, "No need to get vp8 crop information.");
 		break;
 	case GET_PARAM_DPB_SIZE:
 		*((unsigned int *)out) = VP8_DPB_SIZE;
 		break;
 	default:
-		mtk_vcodec_err(inst, "invalid get parameter type=%d", type);
+		mtk_vdec_err(inst->ctx, "invalid get parameter type=%d", type);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
index a27a109d8d14..b418db1b3e89 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
@@ -247,7 +247,7 @@ static void vp9_add_to_fb_free_list(struct vdec_vp9_inst *inst,
 			list_move_tail(&node->list, &inst->fb_free_list);
 		}
 	} else {
-		mtk_vcodec_debug(inst, "No free fb node");
+		mtk_vdec_debug(inst->ctx, "No free fb node");
 	}
 }
 
@@ -331,7 +331,7 @@ static int vp9_get_sf_ref_fb(struct vdec_vp9_inst *inst)
 	}
 
 	if (idx == ARRAY_SIZE(vsi->sf_ref_fb)) {
-		mtk_vcodec_err(inst, "List Full");
+		mtk_vdec_err(inst->ctx, "List Full");
 		return -1;
 	}
 
@@ -340,7 +340,7 @@ static int vp9_get_sf_ref_fb(struct vdec_vp9_inst *inst)
 		vsi->buf_len_sz_y;
 
 	if (mtk_vcodec_mem_alloc(inst->ctx, mem_basy_y)) {
-		mtk_vcodec_err(inst, "Cannot allocate sf_ref_buf y_buf");
+		mtk_vdec_err(inst->ctx, "Cannot allocate sf_ref_buf y_buf");
 		return -1;
 	}
 
@@ -349,7 +349,7 @@ static int vp9_get_sf_ref_fb(struct vdec_vp9_inst *inst)
 		vsi->buf_len_sz_c;
 
 	if (mtk_vcodec_mem_alloc(inst->ctx, mem_basy_c)) {
-		mtk_vcodec_err(inst, "Cannot allocate sf_ref_fb c_buf");
+		mtk_vdec_err(inst->ctx, "Cannot allocate sf_ref_fb c_buf");
 		return -1;
 	}
 	vsi->sf_ref_fb[idx].used = 0;
@@ -378,17 +378,13 @@ static bool vp9_alloc_work_buf(struct vdec_vp9_inst *inst)
 
 	if ((vsi->pic_w > max_pic_w) ||
 		(vsi->pic_h > max_pic_h)) {
-		mtk_vcodec_err(inst, "Invalid w/h %d/%d",
-				vsi->pic_w, vsi->pic_h);
+		mtk_vdec_err(inst->ctx, "Invalid w/h %d/%d", vsi->pic_w, vsi->pic_h);
 		return false;
 	}
 
-	mtk_vcodec_debug(inst, "BUF CHG(%d): w/h/sb_w/sb_h=%d/%d/%d/%d",
-			vsi->resolution_changed,
-			vsi->pic_w,
-			vsi->pic_h,
-			vsi->buf_w,
-			vsi->buf_h);
+	mtk_vdec_debug(inst->ctx, "BUF CHG(%d): w/h/sb_w/sb_h=%d/%d/%d/%d",
+		       vsi->resolution_changed, vsi->pic_w,
+		       vsi->pic_h, vsi->buf_w, vsi->buf_h);
 
 	mem = &inst->mv_buf;
 	if (mem->va)
@@ -399,7 +395,7 @@ static bool vp9_alloc_work_buf(struct vdec_vp9_inst *inst)
 	result = mtk_vcodec_mem_alloc(inst->ctx, mem);
 	if (result) {
 		mem->size = 0;
-		mtk_vcodec_err(inst, "Cannot allocate mv_buf");
+		mtk_vdec_err(inst->ctx, "Cannot allocate mv_buf");
 		return false;
 	}
 	/* Set the va again */
@@ -416,7 +412,7 @@ static bool vp9_alloc_work_buf(struct vdec_vp9_inst *inst)
 	result = mtk_vcodec_mem_alloc(inst->ctx, mem);
 	if (result) {
 		mem->size = 0;
-		mtk_vcodec_err(inst, "Cannot allocate seg_id_buf");
+		mtk_vdec_err(inst->ctx, "Cannot allocate seg_id_buf");
 		return false;
 	}
 	/* Set the va again */
@@ -437,7 +433,7 @@ static bool vp9_add_to_fb_disp_list(struct vdec_vp9_inst *inst,
 	struct vdec_fb_node *node;
 
 	if (!fb) {
-		mtk_vcodec_err(inst, "fb == NULL");
+		mtk_vdec_err(inst->ctx, "fb == NULL");
 		return false;
 	}
 
@@ -447,7 +443,7 @@ static bool vp9_add_to_fb_disp_list(struct vdec_vp9_inst *inst,
 		node->fb = fb;
 		list_move_tail(&node->list, &inst->fb_disp_list);
 	} else {
-		mtk_vcodec_err(inst, "No available fb node");
+		mtk_vdec_err(inst->ctx, "No available fb node");
 		return false;
 	}
 
@@ -493,10 +489,10 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
 			 * size
 			 */
 			if (frm_to_show->fb != NULL)
-				mtk_vcodec_err(inst,
-					"inst->cur_fb->base_y.size=%zu, frm_to_show->fb.base_y.size=%zu",
-					inst->cur_fb->base_y.size,
-					frm_to_show->fb->base_y.size);
+				mtk_vdec_err(inst->ctx,
+					     "base_y.size=%zu, frm_to_show: base_y.size=%zu",
+					     inst->cur_fb->base_y.size,
+					     frm_to_show->fb->base_y.size);
 		}
 		if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
 			if (vsi->show_frame & BIT(0))
@@ -583,20 +579,19 @@ static bool vp9_decode_end_proc(struct vdec_vp9_inst *inst)
 	if (!vsi->show_existing_frame) {
 		ret = vp9_wait_dec_end(inst);
 		if (!ret) {
-			mtk_vcodec_err(inst, "Decode failed, Decode Timeout @[%d]",
-				vsi->frm_num);
+			mtk_vdec_err(inst->ctx, "Decode failed, Decode Timeout @[%d]",
+				     vsi->frm_num);
 			return false;
 		}
 
 		if (vpu_dec_end(&inst->vpu)) {
-			mtk_vcodec_err(inst, "vp9_dec_vpu_end failed");
+			mtk_vdec_err(inst->ctx, "vp9_dec_vpu_end failed");
 			return false;
 		}
-		mtk_vcodec_debug(inst, "Decode Ok @%d (%d/%d)", vsi->frm_num,
-				vsi->pic_w, vsi->pic_h);
+		mtk_vdec_debug(inst->ctx, "Decode Ok @%d (%d/%d)", vsi->frm_num,
+			       vsi->pic_w, vsi->pic_h);
 	} else {
-		mtk_vcodec_debug(inst, "Decode Ok @%d (show_existing_frame)",
-				vsi->frm_num);
+		mtk_vdec_debug(inst->ctx, "Decode Ok @%d (show_existing_frame)", vsi->frm_num);
 	}
 
 	vp9_swap_frm_bufs(inst);
@@ -625,10 +620,9 @@ static struct vdec_fb *vp9_rm_from_fb_disp_list(struct vdec_vp9_inst *inst)
 		fb = (struct vdec_fb *)node->fb;
 		fb->status |= FB_ST_DISPLAY;
 		list_move_tail(&node->list, &inst->available_fb_node_list);
-		mtk_vcodec_debug(inst, "[FB] get disp fb %p st=%d",
-				 node->fb, fb->status);
+		mtk_vdec_debug(inst->ctx, "[FB] get disp fb %p st=%d", node->fb, fb->status);
 	} else
-		mtk_vcodec_debug(inst, "[FB] there is no disp fb");
+		mtk_vdec_debug(inst->ctx, "[FB] there is no disp fb");
 
 	return fb;
 }
@@ -639,7 +633,7 @@ static bool vp9_add_to_fb_use_list(struct vdec_vp9_inst *inst,
 	struct vdec_fb_node *node;
 
 	if (!fb) {
-		mtk_vcodec_debug(inst, "fb == NULL");
+		mtk_vdec_debug(inst->ctx, "fb == NULL");
 		return false;
 	}
 
@@ -649,7 +643,7 @@ static bool vp9_add_to_fb_use_list(struct vdec_vp9_inst *inst,
 		node->fb = fb;
 		list_move_tail(&node->list, &inst->fb_use_list);
 	} else {
-		mtk_vcodec_err(inst, "No free fb node");
+		mtk_vdec_err(inst->ctx, "No free fb node");
 		return false;
 	}
 	return true;
@@ -666,7 +660,7 @@ static void vp9_reset(struct vdec_vp9_inst *inst)
 	inst->vsi->sf_next_ref_fb_idx = vp9_get_sf_ref_fb(inst);
 
 	if (vpu_dec_reset(&inst->vpu))
-		mtk_vcodec_err(inst, "vp9_dec_vpu_reset failed");
+		mtk_vdec_err(inst->ctx, "vp9_dec_vpu_reset failed");
 
 	/* Set the va again, since vpu_dec_reset will clear mv_buf in vpu */
 	inst->vsi->mv_buf.va = (unsigned long)inst->mv_buf.va;
@@ -707,11 +701,9 @@ static void get_pic_info(struct vdec_vp9_inst *inst, struct vdec_pic_info *pic)
 	pic->buf_w = inst->vsi->buf_w;
 	pic->buf_h = inst->vsi->buf_h;
 
-	mtk_vcodec_debug(inst, "pic(%d, %d), buf(%d, %d)",
-		 pic->pic_w, pic->pic_h, pic->buf_w, pic->buf_h);
-	mtk_vcodec_debug(inst, "fb size: Y(%d), C(%d)",
-		pic->fb_sz[0],
-		pic->fb_sz[1]);
+	mtk_vdec_debug(inst->ctx, "pic(%d, %d), buf(%d, %d)",
+		       pic->pic_w, pic->pic_h, pic->buf_w, pic->buf_h);
+	mtk_vdec_debug(inst->ctx, "fb size: Y(%d), C(%d)", pic->fb_sz[0], pic->fb_sz[1]);
 }
 
 static void get_disp_fb(struct vdec_vp9_inst *inst, struct vdec_fb **out_fb)
@@ -733,10 +725,9 @@ static void get_free_fb(struct vdec_vp9_inst *inst, struct vdec_fb **out_fb)
 		list_move_tail(&node->list, &inst->available_fb_node_list);
 		fb = (struct vdec_fb *)node->fb;
 		fb->status |= FB_ST_FREE;
-		mtk_vcodec_debug(inst, "[FB] get free fb %p st=%d",
-				 node->fb, fb->status);
+		mtk_vdec_debug(inst->ctx, "[FB] get free fb %p st=%d", node->fb, fb->status);
 	} else {
-		mtk_vcodec_debug(inst, "[FB] there is no free fb");
+		mtk_vdec_debug(inst->ctx, "[FB] there is no free fb");
 	}
 
 	*out_fb = fb;
@@ -745,18 +736,15 @@ static void get_free_fb(struct vdec_vp9_inst *inst, struct vdec_fb **out_fb)
 static int validate_vsi_array_indexes(struct vdec_vp9_inst *inst,
 		struct vdec_vp9_vsi *vsi) {
 	if (vsi->sf_frm_idx >= VP9_MAX_FRM_BUF_NUM - 1) {
-		mtk_vcodec_err(inst, "Invalid vsi->sf_frm_idx=%u.",
-				vsi->sf_frm_idx);
+		mtk_vdec_err(inst->ctx, "Invalid vsi->sf_frm_idx=%u.", vsi->sf_frm_idx);
 		return -EIO;
 	}
 	if (vsi->frm_to_show_idx >= VP9_MAX_FRM_BUF_NUM) {
-		mtk_vcodec_err(inst, "Invalid vsi->frm_to_show_idx=%u.",
-				vsi->frm_to_show_idx);
+		mtk_vdec_err(inst->ctx, "Invalid vsi->frm_to_show_idx=%u.", vsi->frm_to_show_idx);
 		return -EIO;
 	}
 	if (vsi->new_fb_idx >= VP9_MAX_FRM_BUF_NUM) {
-		mtk_vcodec_err(inst, "Invalid vsi->new_fb_idx=%u.",
-				vsi->new_fb_idx);
+		mtk_vdec_err(inst->ctx, "Invalid vsi->new_fb_idx=%u.", vsi->new_fb_idx);
 		return -EIO;
 	}
 	return 0;
@@ -770,7 +758,7 @@ static void vdec_vp9_deinit(void *h_vdec)
 
 	ret = vpu_dec_deinit(&inst->vpu);
 	if (ret)
-		mtk_vcodec_err(inst, "vpu_dec_deinit failed");
+		mtk_vdec_err(inst->ctx, "vpu_dec_deinit failed");
 
 	mem = &inst->mv_buf;
 	if (mem->va)
@@ -799,7 +787,7 @@ static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx)
 	inst->vpu.ctx = ctx;
 
 	if (vpu_dec_init(&inst->vpu)) {
-		mtk_vcodec_err(inst, "vp9_dec_vpu_init failed");
+		mtk_vdec_err(inst->ctx, "vp9_dec_vpu_init failed");
 		goto err_deinit_inst;
 	}
 
@@ -830,17 +818,17 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	*res_chg = false;
 
 	if ((bs == NULL) && (fb == NULL)) {
-		mtk_vcodec_debug(inst, "[EOS]");
+		mtk_vdec_debug(inst->ctx, "[EOS]");
 		vp9_reset(inst);
 		return ret;
 	}
 
 	if (bs == NULL) {
-		mtk_vcodec_err(inst, "bs == NULL");
+		mtk_vdec_err(inst->ctx, "bs == NULL");
 		return -EINVAL;
 	}
 
-	mtk_vcodec_debug(inst, "Input BS Size = %zu", bs->size);
+	mtk_vdec_debug(inst->ctx, "Input BS Size = %zu", bs->size);
 
 	while (1) {
 		struct vdec_fb *cur_fb = NULL;
@@ -883,7 +871,7 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 		ret = vpu_dec_start(&inst->vpu, data, 3);
 		if (ret) {
-			mtk_vcodec_err(inst, "vpu_dec_start failed");
+			mtk_vdec_err(inst->ctx, "vpu_dec_start failed");
 			goto DECODE_ERROR;
 		}
 
@@ -893,7 +881,7 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 			if (vsi->show_frame & BIT(2)) {
 				ret = vpu_dec_start(&inst->vpu, NULL, 0);
 				if (ret) {
-					mtk_vcodec_err(inst, "vpu trig decoder failed");
+					mtk_vdec_err(inst->ctx, "vpu trig decoder failed");
 					goto DECODE_ERROR;
 				}
 			}
@@ -901,7 +889,7 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 		ret = validate_vsi_array_indexes(inst, vsi);
 		if (ret) {
-			mtk_vcodec_err(inst, "Invalid values from VPU.");
+			mtk_vdec_err(inst->ctx, "Invalid values from VPU.");
 			goto DECODE_ERROR;
 		}
 
@@ -927,18 +915,18 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		if (!vp9_is_sf_ref_fb(inst, inst->cur_fb))
 			vp9_add_to_fb_use_list(inst, inst->cur_fb);
 
-		mtk_vcodec_debug(inst, "[#pic %d]", vsi->frm_num);
+		mtk_vdec_debug(inst->ctx, "[#pic %d]", vsi->frm_num);
 
 		if (vsi->show_existing_frame)
-			mtk_vcodec_debug(inst,
-				"drv->new_fb_idx=%d, drv->frm_to_show_idx=%d",
-				vsi->new_fb_idx, vsi->frm_to_show_idx);
+			mtk_vdec_debug(inst->ctx,
+				       "drv->new_fb_idx=%d, drv->frm_to_show_idx=%d",
+				       vsi->new_fb_idx, vsi->frm_to_show_idx);
 
 		if (vsi->show_existing_frame && (vsi->frm_to_show_idx <
 					VP9_MAX_FRM_BUF_NUM)) {
-			mtk_vcodec_debug(inst,
-				"Skip Decode drv->new_fb_idx=%d, drv->frm_to_show_idx=%d",
-				vsi->new_fb_idx, vsi->frm_to_show_idx);
+			mtk_vdec_debug(inst->ctx,
+				       "Skip Decode drv->new_fb_idx=%d, drv->frm_to_show_idx=%d",
+				       vsi->new_fb_idx, vsi->frm_to_show_idx);
 
 			vp9_ref_cnt_fb(inst, &vsi->new_fb_idx,
 					vsi->frm_to_show_idx);
@@ -955,14 +943,14 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 		if (vsi->resolution_changed) {
 			*res_chg = true;
-			mtk_vcodec_debug(inst, "VDEC_ST_RESOLUTION_CHANGED");
+			mtk_vdec_debug(inst->ctx, "VDEC_ST_RESOLUTION_CHANGED");
 
 			ret = 0;
 			goto DECODE_ERROR;
 		}
 
 		if (!vp9_decode_end_proc(inst)) {
-			mtk_vcodec_err(inst, "vp9_decode_end_proc");
+			mtk_vdec_err(inst->ctx, "vp9_decode_end_proc");
 			ret = -EINVAL;
 			goto DECODE_ERROR;
 		}
@@ -986,8 +974,8 @@ static void get_crop_info(struct vdec_vp9_inst *inst, struct v4l2_rect *cr)
 	cr->top = 0;
 	cr->width = inst->vsi->pic_w;
 	cr->height = inst->vsi->pic_h;
-	mtk_vcodec_debug(inst, "get crop info l=%d, t=%d, w=%d, h=%d\n",
-			 cr->left, cr->top, cr->width, cr->height);
+	mtk_vdec_debug(inst->ctx, "get crop info l=%d, t=%d, w=%d, h=%d\n",
+		       cr->left, cr->top, cr->width, cr->height);
 }
 
 static int vdec_vp9_get_param(void *h_vdec, enum vdec_get_param_type type,
@@ -1013,7 +1001,7 @@ static int vdec_vp9_get_param(void *h_vdec, enum vdec_get_param_type type,
 		get_crop_info(inst, out);
 		break;
 	default:
-		mtk_vcodec_err(inst, "not supported param type %d", type);
+		mtk_vdec_err(inst->ctx, "not supported param type %d", type);
 		ret = -EINVAL;
 		break;
 	}
diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index c2f90848f498..913077d6e701 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -518,7 +518,7 @@ static int vdec_vp9_slice_init_default_frame_ctx(struct vdec_vp9_slice_instance
 	remote_frame_ctx = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
 						     (u32)vsi->default_frame_ctx);
 	if (!remote_frame_ctx) {
-		mtk_vcodec_err(instance, "failed to map default frame ctx\n");
+		mtk_vdec_err(ctx, "failed to map default frame ctx\n");
 		return -EINVAL;
 	}
 
@@ -577,8 +577,8 @@ static int vdec_vp9_slice_alloc_working_buffer(struct vdec_vp9_slice_instance *i
 	if (level == instance->level)
 		return 0;
 
-	mtk_vcodec_debug(instance, "resolution level changed, from %u to %u, %ux%u",
-			 instance->level, level, w, h);
+	mtk_vdec_debug(ctx, "resolution level changed, from %u to %u, %ux%u",
+		       instance->level, level, w, h);
 
 	max_sb_w = DIV_ROUND_UP(max_w, 64);
 	max_sb_h = DIV_ROUND_UP(max_h, 64);
@@ -1025,9 +1025,9 @@ static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instance *inst
 
 	uh = &vsi->frame.uh;
 
-	mtk_vcodec_debug(instance, "ctx dirty %u idx %d\n",
-			 instance->dirty[uh->frame_context_idx],
-			 uh->frame_context_idx);
+	mtk_vdec_debug(instance->ctx, "ctx dirty %u idx %d\n",
+		       instance->dirty[uh->frame_context_idx],
+		       uh->frame_context_idx);
 
 	if (instance->dirty[uh->frame_context_idx])
 		frame_ctx = &instance->frame_ctx[uh->frame_context_idx];
@@ -1051,7 +1051,7 @@ static void vdec_vp9_slice_setup_seg_buffer(struct vdec_vp9_slice_instance *inst
 	    uh->error_resilient_mode ||
 	    uh->frame_width != instance->width ||
 	    uh->frame_height != instance->height) {
-		mtk_vcodec_debug(instance, "reset seg\n");
+		mtk_vdec_debug(instance->ctx, "reset seg\n");
 		memset(buf->va, 0, buf->size);
 	}
 }
@@ -1093,16 +1093,14 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
 	cols = 1 << cols_log2;
 
 	if (rows > 4 || cols > 64) {
-		mtk_vcodec_err(instance, "tile_rows %u tile_cols %u\n",
-			       rows, cols);
+		mtk_vdec_err(instance->ctx, "tile_rows %u tile_cols %u\n", rows, cols);
 		return -EINVAL;
 	}
 
 	offset = uh->uncompressed_header_size +
 		uh->header_size_in_bytes;
 	if (bs->size <= offset) {
-		mtk_vcodec_err(instance, "bs size %zu tile offset %u\n",
-			       bs->size, offset);
+		mtk_vdec_err(instance->ctx, "bs size %zu tile offset %u\n", bs->size, offset);
 		return -EINVAL;
 	}
 
@@ -1596,14 +1594,12 @@ static int vdec_vp9_slice_update_single(struct vdec_vp9_slice_instance *instance
 	vsi = &pfc->vsi;
 	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
 
-	mtk_vcodec_debug(instance, "Frame %u Y_CRC %08x %08x %08x %08x\n",
-			 pfc->seq,
-			 vsi->state.crc[0], vsi->state.crc[1],
-			 vsi->state.crc[2], vsi->state.crc[3]);
-	mtk_vcodec_debug(instance, "Frame %u C_CRC %08x %08x %08x %08x\n",
-			 pfc->seq,
-			 vsi->state.crc[4], vsi->state.crc[5],
-			 vsi->state.crc[6], vsi->state.crc[7]);
+	mtk_vdec_debug(instance->ctx, "Frame %u Y_CRC %08x %08x %08x %08x\n",
+		       pfc->seq, vsi->state.crc[0], vsi->state.crc[1],
+		       vsi->state.crc[2], vsi->state.crc[3]);
+	mtk_vdec_debug(instance->ctx, "Frame %u C_CRC %08x %08x %08x %08x\n",
+		       pfc->seq, vsi->state.crc[4], vsi->state.crc[5],
+		       vsi->state.crc[6], vsi->state.crc[7]);
 
 	vdec_vp9_slice_update_prob(instance, vsi);
 
@@ -1624,10 +1620,10 @@ static int vdec_vp9_slice_update_lat(struct vdec_vp9_slice_instance *instance,
 	vsi = &pfc->vsi;
 	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
 
-	mtk_vcodec_debug(instance, "Frame %u LAT CRC 0x%08x %lx %lx\n",
-			 pfc->seq, vsi->state.crc[0],
-			 (unsigned long)vsi->trans.dma_addr,
-			 (unsigned long)vsi->trans.dma_addr_end);
+	mtk_vdec_debug(instance->ctx, "Frame %u LAT CRC 0x%08x %lx %lx\n",
+		       pfc->seq, vsi->state.crc[0],
+		       (unsigned long)vsi->trans.dma_addr,
+		       (unsigned long)vsi->trans.dma_addr_end);
 
 	/* buffer full, need to re-decode */
 	if (vsi->state.full) {
@@ -1844,14 +1840,12 @@ static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
 	vsi = &pfc->vsi;
 	memcpy(&pfc->state[1], &vsi->state, sizeof(vsi->state));
 
-	mtk_vcodec_debug(instance, "Frame %u Y_CRC %08x %08x %08x %08x\n",
-			 pfc->seq,
-			 vsi->state.crc[0], vsi->state.crc[1],
-			 vsi->state.crc[2], vsi->state.crc[3]);
-	mtk_vcodec_debug(instance, "Frame %u C_CRC %08x %08x %08x %08x\n",
-			 pfc->seq,
-			 vsi->state.crc[4], vsi->state.crc[5],
-			 vsi->state.crc[6], vsi->state.crc[7]);
+	mtk_vdec_debug(instance->ctx, "Frame %u Y_CRC %08x %08x %08x %08x\n",
+		       pfc->seq, vsi->state.crc[0], vsi->state.crc[1],
+		       vsi->state.crc[2], vsi->state.crc[3]);
+	mtk_vdec_debug(instance->ctx, "Frame %u C_CRC %08x %08x %08x %08x\n",
+		       pfc->seq, vsi->state.crc[4], vsi->state.crc[5],
+		       vsi->state.crc[6], vsi->state.crc[7]);
 
 	return 0;
 }
@@ -1874,7 +1868,7 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_ctx *ctx)
 
 	ret = vpu_dec_init(&instance->vpu);
 	if (ret) {
-		mtk_vcodec_err(instance, "failed to init vpu dec, ret %d\n", ret);
+		mtk_vdec_err(ctx, "failed to init vpu dec, ret %d\n", ret);
 		goto error_vpu_init;
 	}
 
@@ -1882,7 +1876,7 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_ctx *ctx)
 
 	vsi = instance->vpu.vsi;
 	if (!vsi) {
-		mtk_vcodec_err(instance, "failed to get VP9 vsi\n");
+		mtk_vdec_err(ctx, "failed to get VP9 vsi\n");
 		ret = -EINVAL;
 		goto error_vsi;
 	}
@@ -1890,7 +1884,7 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_ctx *ctx)
 	instance->core_vsi = mtk_vcodec_fw_map_dm_addr(ctx->dev->fw_handler,
 						       (u32)vsi->core_vsi);
 	if (!instance->core_vsi) {
-		mtk_vcodec_err(instance, "failed to get VP9 core vsi\n");
+		mtk_vdec_err(ctx, "failed to get VP9 core vsi\n");
 		ret = -EINVAL;
 		goto error_vsi;
 	}
@@ -1931,7 +1925,7 @@ static int vdec_vp9_slice_flush(void *h_vdec, struct mtk_vcodec_mem *bs,
 {
 	struct vdec_vp9_slice_instance *instance = h_vdec;
 
-	mtk_vcodec_debug(instance, "flush ...\n");
+	mtk_vdec_debug(instance->ctx, "flush ...\n");
 	if (instance->ctx->dev->vdec_pdata->hw_arch != MTK_VDEC_PURE_SINGLE_CORE)
 		vdec_msg_queue_wait_lat_buf_full(&instance->ctx->msg_queue);
 	return vpu_dec_reset(&instance->vpu);
@@ -1942,8 +1936,7 @@ static void vdec_vp9_slice_get_pic_info(struct vdec_vp9_slice_instance *instance
 	struct mtk_vcodec_ctx *ctx = instance->ctx;
 	unsigned int data[3];
 
-	mtk_vcodec_debug(instance, "w %u h %u\n",
-			 ctx->picinfo.pic_w, ctx->picinfo.pic_h);
+	mtk_vdec_debug(instance->ctx, "w %u h %u\n", ctx->picinfo.pic_w, ctx->picinfo.pic_h);
 
 	data[0] = ctx->picinfo.pic_w;
 	data[1] = ctx->picinfo.pic_h;
@@ -1975,11 +1968,10 @@ static int vdec_vp9_slice_get_param(void *h_vdec, enum vdec_get_param_type type,
 		vdec_vp9_slice_get_dpb_size(instance, out);
 		break;
 	case GET_PARAM_CROP_INFO:
-		mtk_vcodec_debug(instance, "No need to get vp9 crop information.");
+		mtk_vdec_debug(instance->ctx, "No need to get vp9 crop information.");
 		break;
 	default:
-		mtk_vcodec_err(instance, "invalid get parameter type=%d\n",
-			       type);
+		mtk_vdec_err(instance->ctx, "invalid get parameter type=%d\n", type);
 		return -EINVAL;
 	}
 
@@ -2011,14 +2003,14 @@ static int vdec_vp9_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	ret = vdec_vp9_slice_setup_single(instance, bs, fb, pfc);
 	if (ret) {
-		mtk_vcodec_err(instance, "Failed to setup VP9 single ret %d\n", ret);
+		mtk_vdec_err(ctx, "Failed to setup VP9 single ret %d\n", ret);
 		return ret;
 	}
 	vdec_vp9_slice_vsi_to_remote(vsi, instance->vsi);
 
 	ret = vpu_dec_start(&instance->vpu, NULL, 0);
 	if (ret) {
-		mtk_vcodec_err(instance, "Failed to dec VP9 ret %d\n", ret);
+		mtk_vdec_err(ctx, "Failed to dec VP9 ret %d\n", ret);
 		return ret;
 	}
 
@@ -2026,7 +2018,7 @@ static int vdec_vp9_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
 	/* update remote vsi if decode timeout */
 	if (ret) {
-		mtk_vcodec_err(instance, "VP9 decode timeout %d\n", ret);
+		mtk_vdec_err(ctx, "VP9 decode timeout %d\n", ret);
 		WRITE_ONCE(instance->vsi->state.timeout, 1);
 	}
 
@@ -2035,7 +2027,7 @@ static int vdec_vp9_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	vdec_vp9_slice_vsi_from_remote(vsi, instance->vsi, 0);
 	ret = vdec_vp9_slice_update_single(instance, pfc);
 	if (ret) {
-		mtk_vcodec_err(instance, "VP9 decode error: %d\n", ret);
+		mtk_vdec_err(ctx, "VP9 decode error: %d\n", ret);
 		return ret;
 	}
 
@@ -2069,7 +2061,7 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	lat_buf = vdec_msg_queue_dqbuf(&instance->ctx->msg_queue.lat_ctx);
 	if (!lat_buf) {
-		mtk_vcodec_debug(instance, "Failed to get VP9 lat buf\n");
+		mtk_vdec_debug(ctx, "Failed to get VP9 lat buf\n");
 		return -EAGAIN;
 	}
 	pfc = (struct vdec_vp9_slice_pfc *)lat_buf->private_data;
@@ -2081,14 +2073,14 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	ret = vdec_vp9_slice_setup_lat(instance, bs, lat_buf, pfc);
 	if (ret) {
-		mtk_vcodec_err(instance, "Failed to setup VP9 lat ret %d\n", ret);
+		mtk_vdec_err(ctx, "Failed to setup VP9 lat ret %d\n", ret);
 		goto err_free_fb_out;
 	}
 	vdec_vp9_slice_vsi_to_remote(vsi, instance->vsi);
 
 	ret = vpu_dec_start(&instance->vpu, NULL, 0);
 	if (ret) {
-		mtk_vcodec_err(instance, "Failed to dec VP9 ret %d\n", ret);
+		mtk_vdec_err(ctx, "Failed to dec VP9 ret %d\n", ret);
 		goto err_free_fb_out;
 	}
 
@@ -2097,7 +2089,7 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
 		/* update remote vsi if decode timeout */
 		if (ret) {
-			mtk_vcodec_err(instance, "VP9 decode timeout %d pic %d\n", ret, pfc->seq);
+			mtk_vdec_err(ctx, "VP9 decode timeout %d pic %d\n", ret, pfc->seq);
 			WRITE_ONCE(instance->vsi->state.timeout, 1);
 		}
 		vpu_dec_end(&instance->vpu);
@@ -2108,13 +2100,13 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 
 	/* LAT trans full, no more UBE or decode timeout */
 	if (ret) {
-		mtk_vcodec_err(instance, "VP9 decode error: %d\n", ret);
+		mtk_vdec_err(ctx, "VP9 decode error: %d\n", ret);
 		goto err_free_fb_out;
 	}
 
-	mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
-			 (unsigned long)pfc->vsi.trans.dma_addr,
-			 (unsigned long)pfc->vsi.trans.dma_addr_end);
+	mtk_vdec_debug(ctx, "lat dma addr: 0x%lx 0x%lx\n",
+		       (unsigned long)pfc->vsi.trans.dma_addr,
+		       (unsigned long)pfc->vsi.trans.dma_addr_end);
 
 	vdec_msg_queue_update_ube_wptr(&ctx->msg_queue,
 				       vsi->trans.dma_addr_end +
@@ -2169,14 +2161,14 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 
 	ret = vdec_vp9_slice_setup_core(instance, fb, lat_buf, pfc);
 	if (ret) {
-		mtk_vcodec_err(instance, "vdec_vp9_slice_setup_core\n");
+		mtk_vdec_err(ctx, "vdec_vp9_slice_setup_core\n");
 		goto err;
 	}
 	vdec_vp9_slice_vsi_to_remote(&pfc->vsi, instance->core_vsi);
 
 	ret = vpu_dec_core(&instance->vpu);
 	if (ret) {
-		mtk_vcodec_err(instance, "vpu_dec_core\n");
+		mtk_vdec_err(ctx, "vpu_dec_core\n");
 		goto err;
 	}
 
@@ -2185,7 +2177,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
 		/* update remote vsi if decode timeout */
 		if (ret) {
-			mtk_vcodec_err(instance, "VP9 core timeout pic %d\n", pfc->seq);
+			mtk_vdec_err(ctx, "VP9 core timeout pic %d\n", pfc->seq);
 			WRITE_ONCE(instance->core_vsi->state.timeout, 1);
 		}
 		vpu_dec_core_end(&instance->vpu);
@@ -2194,13 +2186,13 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 	vdec_vp9_slice_vsi_from_remote(&pfc->vsi, instance->core_vsi, 1);
 	ret = vdec_vp9_slice_update_core(instance, lat_buf, pfc);
 	if (ret) {
-		mtk_vcodec_err(instance, "vdec_vp9_slice_update_core\n");
+		mtk_vdec_err(ctx, "vdec_vp9_slice_update_core\n");
 		goto err;
 	}
 
 	pfc->vsi.trans.dma_addr_end += ctx->msg_queue.wdma_addr.dma_addr;
-	mtk_vcodec_debug(instance, "core dma_addr_end 0x%lx\n",
-			 (unsigned long)pfc->vsi.trans.dma_addr_end);
+	mtk_vdec_debug(ctx, "core dma_addr_end 0x%lx\n",
+		       (unsigned long)pfc->vsi.trans.dma_addr_end);
 	vdec_msg_queue_update_ube_rptr(&ctx->msg_queue, pfc->vsi.trans.dma_addr_end);
 	ctx->dev->vdec_pdata->cap_to_disp(ctx, 0, lat_buf->src_buf_req);
 
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
index 60e5b70fa127..ab15ee6e2005 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
@@ -16,7 +16,7 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
 					(unsigned long)msg->ap_inst_addr;
 
-	mtk_vcodec_debug(vpu, "+ ap_inst_addr = 0x%llx", msg->ap_inst_addr);
+	mtk_vdec_debug(vpu->ctx, "+ ap_inst_addr = 0x%llx", msg->ap_inst_addr);
 
 	/* mapping VPU address to kernel virtual address */
 	/* the content in vsi is initialized to 0 in VPU */
@@ -24,7 +24,7 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 					     msg->vpu_inst_addr);
 	vpu->inst_addr = msg->vpu_inst_addr;
 
-	mtk_vcodec_debug(vpu, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
+	mtk_vdec_debug(vpu->ctx, "- vpu_inst_addr = 0x%x", vpu->inst_addr);
 
 	/* Set default ABI version if dealing with unversioned firmware. */
 	vpu->fw_abi_version = 0;
@@ -40,7 +40,7 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 
 	/* Check firmware version. */
 	vpu->fw_abi_version = msg->vdec_abi_version;
-	mtk_vcodec_debug(vpu, "firmware version 0x%x\n", vpu->fw_abi_version);
+	mtk_vdec_debug(vpu->ctx, "firmware version 0x%x\n", vpu->fw_abi_version);
 	switch (vpu->fw_abi_version) {
 	case 1:
 		break;
@@ -48,8 +48,7 @@ static void handle_init_ack_msg(const struct vdec_vpu_ipi_init_ack *msg)
 		vpu->inst_id = msg->inst_id;
 		break;
 	default:
-		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
-			       vpu->fw_abi_version);
+		mtk_vdec_err(vpu->ctx, "unhandled firmware version 0x%x\n", vpu->fw_abi_version);
 		vpu->failure = 1;
 		break;
 	}
@@ -60,7 +59,7 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
 	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
 					(unsigned long)msg->ap_inst_addr;
 
-	mtk_vcodec_debug(vpu, "+ ap_inst_addr = 0x%llx", msg->ap_inst_addr);
+	mtk_vdec_debug(vpu->ctx, "+ ap_inst_addr = 0x%llx", msg->ap_inst_addr);
 
 	/* param_type is enum vdec_get_param_type */
 	switch (msg->param_type) {
@@ -69,7 +68,7 @@ static void handle_get_param_msg_ack(const struct vdec_vpu_ipi_get_param_ack *ms
 		vpu->fb_sz[1] = msg->data[1];
 		break;
 	default:
-		mtk_vcodec_err(vpu, "invalid get param type=%d", msg->param_type);
+		mtk_vdec_err(vpu->ctx, "invalid get param type=%d", msg->param_type);
 		vpu->failure = 1;
 		break;
 	}
@@ -96,7 +95,7 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 		return;
 	}
 
-	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
+	mtk_vdec_debug(vpu->ctx, "+ id=%X", msg->msg_id);
 
 	vpu->failure = msg->status;
 	vpu->signaled = 1;
@@ -119,12 +118,12 @@ static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 			handle_get_param_msg_ack(data);
 			break;
 		default:
-			mtk_vcodec_err(vpu, "invalid msg=%X", msg->msg_id);
+			mtk_vdec_err(vpu->ctx, "invalid msg=%X", msg->msg_id);
 			break;
 		}
 	}
 
-	mtk_vcodec_debug(vpu, "- id=%X", msg->msg_id);
+	mtk_vdec_debug(vpu->ctx, "- id=%X", msg->msg_id);
 }
 
 static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
@@ -132,7 +131,7 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 	int err, id, msgid;
 
 	msgid = *(uint32_t *)msg;
-	mtk_vcodec_debug(vpu, "id=%X", msgid);
+	mtk_vdec_debug(vpu->ctx, "id=%X", msgid);
 
 	vpu->failure = 0;
 	vpu->signaled = 0;
@@ -150,8 +149,8 @@ static int vcodec_vpu_send_msg(struct vdec_vpu_inst *vpu, void *msg, int len)
 	err = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, id, msg,
 				     len, 2000);
 	if (err) {
-		mtk_vcodec_err(vpu, "send fail vpu_id=%d msg_id=%X status=%d",
-			       id, msgid, err);
+		mtk_vdec_err(vpu->ctx, "send fail vpu_id=%d msg_id=%X status=%d",
+			     id, msgid, err);
 		return err;
 	}
 
@@ -163,7 +162,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 	struct vdec_ap_ipi_cmd msg;
 	int err = 0;
 
-	mtk_vcodec_debug(vpu, "+ id=%X", msg_id);
+	mtk_vdec_debug(vpu->ctx, "+ id=%X", msg_id);
 
 	memset(&msg, 0, sizeof(msg));
 	msg.msg_id = msg_id;
@@ -174,7 +173,7 @@ static int vcodec_send_ap_ipi(struct vdec_vpu_inst *vpu, unsigned int msg_id)
 	msg.codec_type = vpu->codec_type;
 
 	err = vcodec_vpu_send_msg(vpu, &msg, sizeof(msg));
-	mtk_vcodec_debug(vpu, "- id=%X ret=%d", msg_id, err);
+	mtk_vdec_debug(vpu->ctx, "- id=%X ret=%d", msg_id, err);
 	return err;
 }
 
@@ -189,7 +188,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	err = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
 					 vpu->handler, "vdec", NULL);
 	if (err) {
-		mtk_vcodec_err(vpu, "vpu_ipi_register fail status=%d", err);
+		mtk_vdec_err(vpu->ctx, "vpu_ipi_register fail status=%d", err);
 		return err;
 	}
 
@@ -198,7 +197,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 						 vpu->core_id, vpu->handler,
 						 "vdec", NULL);
 		if (err) {
-			mtk_vcodec_err(vpu, "vpu_ipi_register core fail status=%d", err);
+			mtk_vdec_err(vpu->ctx, "vpu_ipi_register core fail status=%d", err);
 			return err;
 		}
 	}
@@ -208,10 +207,10 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	msg.ap_inst_addr = (unsigned long)vpu;
 	msg.codec_type = vpu->codec_type;
 
-	mtk_vcodec_debug(vpu, "vdec_inst=%p", vpu);
+	mtk_vdec_debug(vpu->ctx, "vdec_inst=%p", vpu);
 
 	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
-	mtk_vcodec_debug(vpu, "- ret=%d", err);
+	mtk_vdec_debug(vpu->ctx, "- ret=%d", err);
 	return err;
 }
 
@@ -222,7 +221,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 	int err = 0;
 
 	if (len > ARRAY_SIZE(msg.data)) {
-		mtk_vcodec_err(vpu, "invalid len = %d\n", len);
+		mtk_vdec_err(vpu->ctx, "invalid len = %d\n", len);
 		return -EINVAL;
 	}
 
@@ -238,7 +237,7 @@ int vpu_dec_start(struct vdec_vpu_inst *vpu, uint32_t *data, unsigned int len)
 	msg.codec_type = vpu->codec_type;
 
 	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
-	mtk_vcodec_debug(vpu, "- ret=%d", err);
+	mtk_vdec_debug(vpu->ctx, "- ret=%d", err);
 	return err;
 }
 
@@ -249,7 +248,7 @@ int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
 	int err;
 
 	if (len > ARRAY_SIZE(msg.data)) {
-		mtk_vcodec_err(vpu, "invalid len = %d\n", len);
+		mtk_vdec_err(vpu->ctx, "invalid len = %d\n", len);
 		return -EINVAL;
 	}
 
@@ -261,7 +260,7 @@ int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
 	msg.codec_type = vpu->codec_type;
 
 	err = vcodec_vpu_send_msg(vpu, (void *)&msg, sizeof(msg));
-	mtk_vcodec_debug(vpu, "- ret=%d", err);
+	mtk_vdec_debug(vpu->ctx, "- ret=%d", err);
 	return err;
 }
 
diff --git a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
index c821ed427537..5abc9c4e6d4f 100644
--- a/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc/venc_h264_if.c
@@ -240,13 +240,13 @@ static unsigned int h264_get_profile(struct venc_h264_inst *inst,
 	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
 		return 100;
 	case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
-		mtk_vcodec_err(inst, "unsupported CONSTRAINED_BASELINE");
+		mtk_venc_err(inst->ctx, "unsupported CONSTRAINED_BASELINE");
 		return 0;
 	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
-		mtk_vcodec_err(inst, "unsupported EXTENDED");
+		mtk_venc_err(inst->ctx, "unsupported EXTENDED");
 		return 0;
 	default:
-		mtk_vcodec_debug(inst, "unsupported profile %d", profile);
+		mtk_venc_debug(inst->ctx, "unsupported profile %d", profile);
 		return 100;
 	}
 }
@@ -256,7 +256,7 @@ static unsigned int h264_get_level(struct venc_h264_inst *inst,
 {
 	switch (level) {
 	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
-		mtk_vcodec_err(inst, "unsupported 1B");
+		mtk_venc_err(inst->ctx, "unsupported 1B");
 		return 0;
 	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
 		return 10;
@@ -289,7 +289,7 @@ static unsigned int h264_get_level(struct venc_h264_inst *inst,
 	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
 		return 51;
 	default:
-		mtk_vcodec_debug(inst, "unsupported level %d", level);
+		mtk_venc_debug(inst->ctx, "unsupported level %d", level);
 		return 31;
 	}
 }
@@ -360,8 +360,7 @@ static int h264_enc_alloc_work_buf(struct venc_h264_inst *inst, bool is_34bit)
 			ret = mtk_vcodec_mem_alloc(inst->ctx,
 						   &inst->work_bufs[i]);
 			if (ret) {
-				mtk_vcodec_err(inst,
-					       "cannot allocate buf %d", i);
+				mtk_venc_err(inst->ctx, "cannot allocate buf %d", i);
 				goto err_alloc;
 			}
 			/*
@@ -385,18 +384,17 @@ static int h264_enc_alloc_work_buf(struct venc_h264_inst *inst, bool is_34bit)
 		else
 			wb[i].iova = inst->work_bufs[i].dma_addr;
 
-		mtk_vcodec_debug(inst,
-				 "work_buf[%d] va=0x%p iova=%pad size=%zu",
-				 i, inst->work_bufs[i].va,
-				 &inst->work_bufs[i].dma_addr,
-				 inst->work_bufs[i].size);
+		mtk_venc_debug(inst->ctx, "work_buf[%d] va=0x%p iova=%pad size=%zu",
+			       i, inst->work_bufs[i].va,
+			       &inst->work_bufs[i].dma_addr,
+			       inst->work_bufs[i].size);
 	}
 
 	/* the pps_buf is used by AP side only */
 	inst->pps_buf.size = 128;
 	ret = mtk_vcodec_mem_alloc(inst->ctx, &inst->pps_buf);
 	if (ret) {
-		mtk_vcodec_err(inst, "cannot allocate pps_buf");
+		mtk_venc_err(inst->ctx, "cannot allocate pps_buf");
 		goto err_alloc;
 	}
 
@@ -416,7 +414,7 @@ static unsigned int h264_enc_wait_venc_done(struct venc_h264_inst *inst)
 	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
 					  WAIT_INTR_TIMEOUT_MS, 0)) {
 		irq_status = ctx->irq_status;
-		mtk_vcodec_debug(inst, "irq_status %x <-", irq_status);
+		mtk_venc_debug(ctx, "irq_status %x <-", irq_status);
 	}
 	return irq_status;
 }
@@ -450,13 +448,12 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
 
 	irq_status = h264_enc_wait_venc_done(inst);
 	if (irq_status != MTK_VENC_IRQ_STATUS_SPS) {
-		mtk_vcodec_err(inst, "expect irq status %d",
-			       MTK_VENC_IRQ_STATUS_SPS);
+		mtk_venc_err(inst->ctx, "expect irq status %d", MTK_VENC_IRQ_STATUS_SPS);
 		return -EINVAL;
 	}
 
 	*bs_size = h264_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
-	mtk_vcodec_debug(inst, "bs size %d <-", *bs_size);
+	mtk_venc_debug(inst->ctx, "bs size %d <-", *bs_size);
 
 	return ret;
 }
@@ -474,13 +471,12 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
 
 	irq_status = h264_enc_wait_venc_done(inst);
 	if (irq_status != MTK_VENC_IRQ_STATUS_PPS) {
-		mtk_vcodec_err(inst, "expect irq status %d",
-			       MTK_VENC_IRQ_STATUS_PPS);
+		mtk_venc_err(inst->ctx, "expect irq status %d", MTK_VENC_IRQ_STATUS_PPS);
 		return -EINVAL;
 	}
 
 	*bs_size = h264_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
-	mtk_vcodec_debug(inst, "bs size %d <-", *bs_size);
+	mtk_venc_debug(inst->ctx, "bs size %d <-", *bs_size);
 
 	return ret;
 }
@@ -519,7 +515,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
 	struct venc_frame_info frame_info;
 	struct mtk_vcodec_ctx *ctx = inst->ctx;
 
-	mtk_vcodec_debug(inst, "frm_cnt = %d\n ", inst->frm_cnt);
+	mtk_venc_debug(ctx, "frm_cnt = %d\n ", inst->frm_cnt);
 
 	if (MTK_ENC_IOVA_IS_34BIT(ctx)) {
 		gop_size = inst->vsi_34->config.gop_size;
@@ -532,9 +528,9 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
 	frame_info.skip_frm_count = inst->skip_frm_cnt;
 	frame_info.frm_type = h264_frame_type(inst->frm_cnt, gop_size,
 					      intra_period);
-	mtk_vcodec_debug(inst, "frm_count = %d,skip_frm_count =%d,frm_type=%d.\n",
-			 frame_info.frm_count, frame_info.skip_frm_count,
-			 frame_info.frm_type);
+	mtk_venc_debug(ctx, "frm_count = %d,skip_frm_count =%d,frm_type=%d.\n",
+		       frame_info.frm_count, frame_info.skip_frm_count,
+		       frame_info.frm_type);
 
 	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME,
 			     frm_buf, bs_buf, &frame_info);
@@ -557,15 +553,15 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
 
 	irq_status = h264_enc_wait_venc_done(inst);
 	if (irq_status != MTK_VENC_IRQ_STATUS_FRM) {
-		mtk_vcodec_err(inst, "irq_status=%d failed", irq_status);
+		mtk_venc_err(ctx, "irq_status=%d failed", irq_status);
 		return -EIO;
 	}
 
 	*bs_size = h264_read_reg(inst, VENC_PIC_BITSTREAM_BYTE_CNT);
 
 	++inst->frm_cnt;
-	mtk_vcodec_debug(inst, "frm %d bs_size %d key_frm %d <-",
-			 inst->frm_cnt, *bs_size, inst->vpu_inst.is_key_frm);
+	mtk_venc_debug(ctx, "frm %d bs_size %d key_frm %d <-",
+		       inst->frm_cnt, *bs_size, inst->vpu_inst.is_key_frm);
 
 	return 0;
 }
@@ -576,7 +572,7 @@ static void h264_encode_filler(struct venc_h264_inst *inst, void *buf,
 	unsigned char *p = buf;
 
 	if (size < H264_FILLER_MARKER_SIZE) {
-		mtk_vcodec_err(inst, "filler size too small %d", size);
+		mtk_venc_err(inst->ctx, "filler size too small %d", size);
 		return;
 	}
 
@@ -626,7 +622,7 @@ static int h264_enc_encode(void *handle,
 	struct venc_h264_inst *inst = (struct venc_h264_inst *)handle;
 	struct mtk_vcodec_ctx *ctx = inst->ctx;
 
-	mtk_vcodec_debug(inst, "opt %d ->", opt);
+	mtk_venc_debug(ctx, "opt %d ->", opt);
 
 	enable_irq(ctx->dev->enc_irq);
 
@@ -661,7 +657,7 @@ static int h264_enc_encode(void *handle,
 			break;
 		}
 
-		mtk_vcodec_debug(inst, "h264_encode_frame prepend SPS/PPS");
+		mtk_venc_debug(ctx, "h264_encode_frame prepend SPS/PPS");
 
 		ret = h264_encode_header(inst, bs_buf, &bs_size_hdr);
 		if (ret)
@@ -688,9 +684,8 @@ static int h264_enc_encode(void *handle,
 
 		result->bs_size = hdr_sz + filler_sz + bs_size_frm;
 
-		mtk_vcodec_debug(inst, "hdr %d filler %d frame %d bs %d",
-				 hdr_sz, filler_sz, bs_size_frm,
-				 result->bs_size);
+		mtk_venc_debug(ctx, "hdr %d filler %d frame %d bs %d",
+			       hdr_sz, filler_sz, bs_size_frm, result->bs_size);
 
 		inst->prepend_hdr = 0;
 		result->is_key_frm = inst->vpu_inst.is_key_frm;
@@ -698,7 +693,7 @@ static int h264_enc_encode(void *handle,
 	}
 
 	default:
-		mtk_vcodec_err(inst, "venc_start_opt %d not supported", opt);
+		mtk_venc_err(ctx, "venc_start_opt %d not supported", opt);
 		ret = -EINVAL;
 		break;
 	}
@@ -706,7 +701,7 @@ static int h264_enc_encode(void *handle,
 encode_err:
 
 	disable_irq(ctx->dev->enc_irq);
-	mtk_vcodec_debug(inst, "opt %d <-", opt);
+	mtk_venc_debug(ctx, "opt %d <-", opt);
 
 	return ret;
 }
@@ -758,7 +753,7 @@ static int h264_enc_set_param(void *handle,
 	struct mtk_vcodec_ctx *ctx = inst->ctx;
 	const bool is_34bit = MTK_ENC_IOVA_IS_34BIT(ctx);
 
-	mtk_vcodec_debug(inst, "->type=%d", type);
+	mtk_venc_debug(ctx, "->type=%d", type);
 
 	switch (type) {
 	case VENC_SET_PARAM_ENC:
@@ -781,7 +776,7 @@ static int h264_enc_set_param(void *handle,
 
 	case VENC_SET_PARAM_PREPEND_HEADER:
 		inst->prepend_hdr = 1;
-		mtk_vcodec_debug(inst, "set prepend header mode");
+		mtk_venc_debug(ctx, "set prepend header mode");
 		break;
 	case VENC_SET_PARAM_FORCE_INTRA:
 	case VENC_SET_PARAM_GOP_SIZE:
diff --git a/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
index ddcdb565db17..ff54064497f1 100644
--- a/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc/venc_vp8_if.c
@@ -171,8 +171,7 @@ static int vp8_enc_alloc_work_buf(struct venc_vp8_inst *inst)
 		inst->work_bufs[i].size = wb[i].size;
 		ret = mtk_vcodec_mem_alloc(inst->ctx, &inst->work_bufs[i]);
 		if (ret) {
-			mtk_vcodec_err(inst,
-				       "cannot alloc work_bufs[%d]", i);
+			mtk_venc_err(inst->ctx, "cannot alloc work_bufs[%d]", i);
 			goto err_alloc;
 		}
 		/*
@@ -193,11 +192,10 @@ static int vp8_enc_alloc_work_buf(struct venc_vp8_inst *inst)
 		}
 		wb[i].iova = inst->work_bufs[i].dma_addr;
 
-		mtk_vcodec_debug(inst,
-				 "work_bufs[%d] va=0x%p,iova=%pad,size=%zu",
-				 i, inst->work_bufs[i].va,
-				 &inst->work_bufs[i].dma_addr,
-				 inst->work_bufs[i].size);
+		mtk_venc_debug(inst->ctx, "work_bufs[%d] va=0x%p,iova=%pad,size=%zu",
+			       i, inst->work_bufs[i].va,
+			       &inst->work_bufs[i].dma_addr,
+			       inst->work_bufs[i].size);
 	}
 
 	return ret;
@@ -216,7 +214,7 @@ static unsigned int vp8_enc_wait_venc_done(struct venc_vp8_inst *inst)
 	if (!mtk_vcodec_wait_for_done_ctx(ctx, MTK_INST_IRQ_RECEIVED,
 					  WAIT_INTR_TIMEOUT_MS, 0)) {
 		irq_status = ctx->irq_status;
-		mtk_vcodec_debug(inst, "isr return %x", irq_status);
+		mtk_venc_debug(ctx, "isr return %x", irq_status);
 	}
 	return irq_status;
 }
@@ -261,8 +259,7 @@ static int vp8_enc_compose_one_frame(struct venc_vp8_inst *inst,
 	}
 
 	if (bs_buf->size < bs_hdr_len + bs_frm_size + ac_tag_size) {
-		mtk_vcodec_err(inst, "bitstream buf size is too small(%zu)",
-			       bs_buf->size);
+		mtk_venc_err(inst->ctx, "bitstream buf size is too small(%zu)", bs_buf->size);
 		return -EINVAL;
 	}
 
@@ -292,7 +289,7 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
 	int ret = 0;
 	unsigned int irq_status;
 
-	mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
+	mtk_venc_debug(inst->ctx, "->frm_cnt=%d", inst->frm_cnt);
 
 	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, NULL);
 	if (ret)
@@ -300,18 +297,17 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
 
 	irq_status = vp8_enc_wait_venc_done(inst);
 	if (irq_status != MTK_VENC_IRQ_STATUS_FRM) {
-		mtk_vcodec_err(inst, "irq_status=%d failed", irq_status);
+		mtk_venc_err(inst->ctx, "irq_status=%d failed", irq_status);
 		return -EIO;
 	}
 
 	if (vp8_enc_compose_one_frame(inst, bs_buf, bs_size)) {
-		mtk_vcodec_err(inst, "vp8_enc_compose_one_frame failed");
+		mtk_venc_err(inst->ctx, "vp8_enc_compose_one_frame failed");
 		return -EINVAL;
 	}
 
 	inst->frm_cnt++;
-	mtk_vcodec_debug(inst, "<-size=%d key_frm=%d", *bs_size,
-			 inst->vpu_inst.is_key_frm);
+	mtk_venc_debug(inst->ctx, "<-size=%d key_frm=%d", *bs_size, inst->vpu_inst.is_key_frm);
 
 	return ret;
 }
@@ -364,7 +360,7 @@ static int vp8_enc_encode(void *handle,
 		break;
 
 	default:
-		mtk_vcodec_err(inst, "opt not support:%d", opt);
+		mtk_venc_err(ctx, "opt not support:%d", opt);
 		ret = -EINVAL;
 		break;
 	}
@@ -382,7 +378,7 @@ static int vp8_enc_set_param(void *handle,
 	int ret = 0;
 	struct venc_vp8_inst *inst = (struct venc_vp8_inst *)handle;
 
-	mtk_vcodec_debug(inst, "->type=%d", type);
+	mtk_venc_debug(inst->ctx, "->type=%d", type);
 
 	switch (type) {
 	case VENC_SET_PARAM_ENC:
@@ -413,7 +409,7 @@ static int vp8_enc_set_param(void *handle,
 	 */
 	case VENC_SET_PARAM_TS_MODE:
 		inst->ts_mode = 1;
-		mtk_vcodec_debug(inst, "set ts_mode");
+		mtk_venc_debug(inst->ctx, "set ts_mode");
 		break;
 
 	default:
diff --git a/drivers/media/platform/mediatek/vcodec/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/venc_vpu_if.c
index 63ebab28242c..c69f66b6d341 100644
--- a/drivers/media/platform/mediatek/vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/venc_vpu_if.c
@@ -22,14 +22,13 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 		return;
 
 	/* Check firmware version. */
-	mtk_vcodec_debug(vpu, "firmware version: 0x%x\n",
-			 msg->venc_abi_version);
+	mtk_venc_debug(vpu->ctx, "firmware version: 0x%x\n", msg->venc_abi_version);
 	switch (msg->venc_abi_version) {
 	case 1:
 		break;
 	default:
-		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
-			       msg->venc_abi_version);
+		mtk_venc_err(vpu->ctx, "unhandled firmware version 0x%x\n",
+			     msg->venc_abi_version);
 		vpu->failure = 1;
 		break;
 	}
@@ -50,13 +49,12 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 	struct venc_vpu_inst *vpu =
 		(struct venc_vpu_inst *)(unsigned long)msg->venc_inst;
 
-	mtk_vcodec_debug(vpu, "msg_id %x inst %p status %d",
-			 msg->msg_id, vpu, msg->status);
+	mtk_venc_debug(vpu->ctx, "msg_id %x inst %p status %d", msg->msg_id, vpu, msg->status);
 
 	vpu->signaled = 1;
 	vpu->failure = (msg->status != VENC_IPI_MSG_STATUS_OK);
 	if (vpu->failure) {
-		mtk_vcodec_err(vpu, "vpu enc status failure %d", vpu->failure);
+		mtk_venc_err(vpu->ctx, "vpu enc status failure %d", vpu->failure);
 		return;
 	}
 
@@ -72,7 +70,7 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 	case VPU_IPIMSG_ENC_DEINIT_DONE:
 		break;
 	default:
-		mtk_vcodec_err(vpu, "unknown msg id %x", msg->msg_id);
+		mtk_venc_err(vpu->ctx, "unknown msg id %x", msg->msg_id);
 		break;
 	}
 }
@@ -83,15 +81,15 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 	int status;
 
 	if (!vpu->ctx->dev->fw_handler) {
-		mtk_vcodec_err(vpu, "inst dev is NULL");
+		mtk_venc_err(vpu->ctx, "inst dev is NULL");
 		return -EINVAL;
 	}
 
 	status = mtk_vcodec_fw_ipi_send(vpu->ctx->dev->fw_handler, vpu->id, msg,
 					len, 2000);
 	if (status) {
-		mtk_vcodec_err(vpu, "vpu_ipi_send msg_id %x len %d fail %d",
-			       *(uint32_t *)msg, len, status);
+		mtk_venc_err(vpu->ctx, "vpu_ipi_send msg_id %x len %d fail %d",
+			     *(uint32_t *)msg, len, status);
 		return -EINVAL;
 	}
 	if (vpu->failure)
@@ -113,7 +111,7 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 					    vpu_enc_ipi_handler, "venc", NULL);
 
 	if (status) {
-		mtk_vcodec_err(vpu, "vpu_ipi_register fail %d", status);
+		mtk_venc_err(vpu->ctx, "vpu_ipi_register fail %d", status);
 		return -EINVAL;
 	}
 
@@ -121,7 +119,7 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	out.msg_id = AP_IPIMSG_ENC_INIT;
 	out.venc_inst = (unsigned long)vpu;
 	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
-		mtk_vcodec_err(vpu, "AP_IPIMSG_ENC_INIT fail");
+		mtk_venc_err(vpu->ctx, "AP_IPIMSG_ENC_INIT fail");
 		return -EINVAL;
 	}
 
@@ -157,7 +155,7 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
 		sizeof(struct venc_ap_ipi_msg_set_param);
 	struct venc_ap_ipi_msg_set_param_ext out;
 
-	mtk_vcodec_debug(vpu, "id %d ->", id);
+	mtk_venc_debug(vpu->ctx, "id %d ->", id);
 
 	memset(&out, 0, sizeof(out));
 	out.base.msg_id = AP_IPIMSG_ENC_SET_PARAM;
@@ -199,16 +197,15 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
 		out.base.data_item = 0;
 		break;
 	default:
-		mtk_vcodec_err(vpu, "id %d not supported", id);
+		mtk_venc_err(vpu->ctx, "id %d not supported", id);
 		return -EINVAL;
 	}
 	if (vpu_enc_send_msg(vpu, &out, msg_size)) {
-		mtk_vcodec_err(vpu,
-			       "AP_IPIMSG_ENC_SET_PARAM %d fail", id);
+		mtk_venc_err(vpu->ctx, "AP_IPIMSG_ENC_SET_PARAM %d fail", id);
 		return -EINVAL;
 	}
 
-	mtk_vcodec_debug(vpu, "id %d <-", id);
+	mtk_venc_debug(vpu->ctx, "id %d <-", id);
 
 	return 0;
 }
@@ -225,7 +222,7 @@ static int vpu_enc_encode_32bits(struct venc_vpu_inst *vpu,
 		sizeof(struct venc_ap_ipi_msg_enc);
 	struct venc_ap_ipi_msg_enc_ext out;
 
-	mtk_vcodec_debug(vpu, "bs_mode %d ->", bs_mode);
+	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
 
 	memset(&out, 0, sizeof(out));
 	out.base.msg_id = AP_IPIMSG_ENC_ENCODE;
@@ -239,7 +236,7 @@ static int vpu_enc_encode_32bits(struct venc_vpu_inst *vpu,
 			out.base.input_addr[1] = frm_buf->fb_addr[1].dma_addr;
 			out.base.input_addr[2] = frm_buf->fb_addr[2].dma_addr;
 		} else {
-			mtk_vcodec_err(vpu, "dma_addr not align to 16");
+			mtk_venc_err(vpu->ctx, "dma_addr not align to 16");
 			return -EINVAL;
 		}
 	}
@@ -254,8 +251,7 @@ static int vpu_enc_encode_32bits(struct venc_vpu_inst *vpu,
 		out.data[2] = frame_info->frm_type;
 	}
 	if (vpu_enc_send_msg(vpu, &out, msg_size)) {
-		mtk_vcodec_err(vpu, "AP_IPIMSG_ENC_ENCODE %d fail",
-			       bs_mode);
+		mtk_venc_err(vpu->ctx, "AP_IPIMSG_ENC_ENCODE %d fail", bs_mode);
 		return -EINVAL;
 	}
 
@@ -271,7 +267,7 @@ static int vpu_enc_encode_34bits(struct venc_vpu_inst *vpu,
 	struct venc_ap_ipi_msg_enc_ext_34 out;
 	size_t msg_size = sizeof(struct venc_ap_ipi_msg_enc_ext_34);
 
-	mtk_vcodec_debug(vpu, "bs_mode %d ->", bs_mode);
+	mtk_venc_debug(vpu->ctx, "bs_mode %d ->", bs_mode);
 
 	memset(&out, 0, sizeof(out));
 	out.msg_id = AP_IPIMSG_ENC_ENCODE;
@@ -286,7 +282,7 @@ static int vpu_enc_encode_34bits(struct venc_vpu_inst *vpu,
 			out.input_addr[1] = frm_buf->fb_addr[1].dma_addr;
 			out.input_addr[2] = frm_buf->fb_addr[2].dma_addr;
 		} else {
-			mtk_vcodec_err(vpu, "dma_addr not align to 16");
+			mtk_venc_err(vpu->ctx, "dma_addr not align to 16");
 			return -EINVAL;
 		}
 	}
@@ -301,8 +297,7 @@ static int vpu_enc_encode_34bits(struct venc_vpu_inst *vpu,
 		out.data[2] = frame_info->frm_type;
 	}
 	if (vpu_enc_send_msg(vpu, &out, msg_size)) {
-		mtk_vcodec_err(vpu, "AP_IPIMSG_ENC_ENCODE %d fail",
-			       bs_mode);
+		mtk_venc_err(vpu->ctx, "AP_IPIMSG_ENC_ENCODE %d fail", bs_mode);
 		return -EINVAL;
 	}
 
@@ -326,8 +321,8 @@ int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 	if (ret)
 		return ret;
 
-	mtk_vcodec_debug(vpu, "bs_mode %d state %d size %d key_frm %d <-",
-			 bs_mode, vpu->state, vpu->bs_size, vpu->is_key_frm);
+	mtk_venc_debug(vpu->ctx, "bs_mode %d state %d size %d key_frm %d <-",
+		       bs_mode, vpu->state, vpu->bs_size, vpu->is_key_frm);
 
 	return 0;
 }
@@ -340,7 +335,7 @@ int vpu_enc_deinit(struct venc_vpu_inst *vpu)
 	out.msg_id = AP_IPIMSG_ENC_DEINIT;
 	out.vpu_inst_addr = vpu->inst_addr;
 	if (vpu_enc_send_msg(vpu, &out, sizeof(out))) {
-		mtk_vcodec_err(vpu, "AP_IPIMSG_ENC_DEINIT fail");
+		mtk_venc_err(vpu->ctx, "AP_IPIMSG_ENC_DEINIT fail");
 		return -EINVAL;
 	}
 
-- 
2.18.0

