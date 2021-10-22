Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD8B43798D
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 17:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbhJVPGl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 11:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233297AbhJVPGj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 11:06:39 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF4DC061767;
        Fri, 22 Oct 2021 08:04:21 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:50fa:5c7d:20f4:e8d3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D29DF1F417C2;
        Fri, 22 Oct 2021 16:04:19 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
        hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com
Subject: [PATCH 3/3] meida: mtk-vcodec: remove unused func parameter
Date:   Fri, 22 Oct 2021 17:04:10 +0200
Message-Id: <20211022150410.29335-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
References: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The prarameter bs_size to function vpu_enc_encode
is not used. Remove it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c | 9 +++------
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c  | 3 +--
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c       | 1 -
 drivers/media/platform/mtk-vcodec/venc_vpu_if.h       | 1 -
 4 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index b6a4f2074fa5..bf03888a824f 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -367,8 +367,7 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
 
 	mtk_vcodec_debug_enter(inst);
 
-	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL,
-			     bs_buf, bs_size, NULL);
+	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL, bs_buf, NULL);
 	if (ret)
 		return ret;
 
@@ -394,8 +393,7 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
 
 	mtk_vcodec_debug_enter(inst);
 
-	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL,
-			     bs_buf, bs_size, NULL);
+	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL, bs_buf, NULL);
 	if (ret)
 		return ret;
 
@@ -451,8 +449,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
 	mtk_vcodec_debug(inst, "frm_count = %d,skip_frm_count =%d,frm_type=%d.\n",
 			 frame_info.frm_count, frame_info.skip_frm_count,
 			 frame_info.frm_type);
-	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf,
-			     bs_buf, bs_size, &frame_info);
+	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf, bs_buf, &frame_info);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 8267a9c4fd25..6b66957d5192 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -302,8 +302,7 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
 
 	mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
 
-	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size,
-			     NULL);
+	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, NULL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index be6d8790a41e..e7899d8a3e4e 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -225,7 +225,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
 int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 		   struct venc_frm_buf *frm_buf,
 		   struct mtk_vcodec_mem *bs_buf,
-		   unsigned int *bs_size,
 		   struct venc_frame_info *frame_info)
 {
 	const bool is_ext = MTK_ENC_CTX_IS_EXT(vpu->ctx);
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
index f9be9cab7ff7..f83bc1b3f2bf 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
@@ -45,7 +45,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
 int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 		   struct venc_frm_buf *frm_buf,
 		   struct mtk_vcodec_mem *bs_buf,
-		   unsigned int *bs_size,
 		   struct venc_frame_info *frame_info);
 int vpu_enc_deinit(struct venc_vpu_inst *vpu);
 
-- 
2.17.1

