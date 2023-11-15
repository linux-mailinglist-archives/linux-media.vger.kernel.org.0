Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5AA7E20E2
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:06:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbjKFMGC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:06:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbjKFMFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:05:25 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A3410EF;
        Mon,  6 Nov 2023 04:04:53 -0800 (PST)
X-UUID: aeabf7187c9c11ee8051498923ad61e6-20231106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vk/aLiaXZ0o3UQ6PiFFLCT/a4mk5UwMANXijj0JOuQo=;
        b=ZGRTltl81GIaxZh/H+cSjVinZ0aYpxDsypLyRPi/AhduWsYZScwbYQdPS50sh5p/gqFJVBA5rscieHXIu5uSEZwTcF/mzwXjMyemioH1oRlzVnHPGV3Sct2z4VJTi+jMCnNgkNhqTGVB+uFeVYJRLoibqulgI9DRQOY/AokAu7Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:59e8fc2b-86b0-4dd1-863d-fb5d86b28509,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:ae485472-1bd3-4f48-b671-ada88705968c,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
        DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aeabf7187c9c11ee8051498923ad61e6-20231106
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1192884147; Mon, 06 Nov 2023 20:04:48 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Nov 2023 20:04:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Nov 2023 20:04:45 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Jeffrey Kardatzke <jkardatzke@google.com>,
        "T . J . Mercier" <tjmercier@google.com>,
        John Stultz <jstultz@google.com>,
        Yong Wu <yong.wu@mediatek.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
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
Subject: [PATCH v2,19/21] media: medkatek: vcodec: disable wait interrupt for svp mode
Date:   Mon, 6 Nov 2023 20:04:21 +0800
Message-ID: <20231106120423.23364-20-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231106120423.23364-1-yunfei.dong@mediatek.com>
References: <20231106120423.23364-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK:  N
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Waiting interrupt in optee-os for svp mode, need to disable it in kernel
in case of interrupt is cleaned.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        | 34 +++++------
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 57 +++++++++++--------
 2 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
index 881d5de41e05..1982c088c6da 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
@@ -72,26 +72,28 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 
 	ctx = mtk_vcodec_get_curr_ctx(dev->main_dev, dev->hw_idx);
 
-	/* check if HW active or not */
-	cg_status = readl(dev->reg_base[VDEC_HW_SYS] + VDEC_HW_ACTIVE_ADDR);
-	if (cg_status & VDEC_HW_ACTIVE_MASK) {
-		mtk_v4l2_vdec_err(ctx, "vdec active is not 0x0 (0x%08x)", cg_status);
-		return IRQ_HANDLED;
-	}
+	if (!ctx->is_secure_playback) {
+		/* check if HW active or not */
+		cg_status = readl(dev->reg_base[VDEC_HW_SYS] + VDEC_HW_ACTIVE_ADDR);
+		if (cg_status & VDEC_HW_ACTIVE_MASK) {
+			mtk_v4l2_vdec_err(ctx, "vdec active is not 0x0 (0x%08x)", cg_status);
+			return IRQ_HANDLED;
+		}
 
-	dec_done_status = readl(vdec_misc_addr);
-	if ((dec_done_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS) !=
-	    MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
-		return IRQ_HANDLED;
+		dec_done_status = readl(vdec_misc_addr);
+		if ((dec_done_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS) !=
+		    MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
+			return IRQ_HANDLED;
 
-	/* clear interrupt */
-	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
-	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
+		/* clear interrupt */
+		writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
+		writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
-	wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
+		wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
 
-	mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=%x",
-			  ctx->id, dec_done_status);
+		mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=%x",
+				  ctx->id, dec_done_status);
+	}
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 2dfb3043493e..3e2270399b6c 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -593,14 +593,16 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 		goto vdec_dec_end;
 	}
 
-	/* wait decoder done interrupt */
-	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
-	if (timeout)
-		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
-	inst->vsi_core->dec.timeout = !!timeout;
-
-	vpu_dec_core_end(vpu);
+	if (!ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+		if (timeout)
+			mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
+		inst->vsi_core->dec.timeout = !!timeout;
+
+		vpu_dec_core_end(vpu);
+	}
 	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
 		       ctx->decoded_frame_cnt,
 		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
@@ -724,14 +726,16 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
 
-	/* wait decoder done interrupt */
-	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
-	if (timeout)
-		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
-	inst->vsi->dec.timeout = !!timeout;
+	if (!inst->ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
+		if (timeout)
+			mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
+		inst->vsi->dec.timeout = !!timeout;
 
-	err = vpu_dec_end(vpu);
+		err = vpu_dec_end(vpu);
+	}
 	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
 		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
 			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
@@ -831,16 +835,19 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
-	/* wait decoder done interrupt */
-	err = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
-	if (err)
-		mtk_vdec_err(inst->ctx, "decode timeout: pic_%d", inst->ctx->decoded_frame_cnt);
-
-	inst->vsi->dec.timeout = !!err;
-	err = vpu_dec_end(vpu);
-	if (err)
-		goto err_free_fb_out;
+	if (!inst->ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		err = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+		if (err)
+			mtk_vdec_err(inst->ctx, "decode timeout: pic_%d",
+				     inst->ctx->decoded_frame_cnt);
+
+		inst->vsi->dec.timeout = !!err;
+		err = vpu_dec_end(vpu);
+		if (err)
+			goto err_free_fb_out;
+	}
 
 	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
 	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
-- 
2.18.0

