Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169E73E032E
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 16:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237104AbhHDO3J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 10:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236064AbhHDO24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Aug 2021 10:28:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3CEC0617A1;
        Wed,  4 Aug 2021 07:27:51 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:adf4:1f5e:19c9:b75f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 687011F43A2A;
        Wed,  4 Aug 2021 15:27:49 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com, mchehab@kernel.org,
        tfiga@chromium.org, tiffany.lin@mediatek.com,
        andrew-ct.chen@mediatek.com, matthias.bgg@gmail.com,
        hsinyi@chromium.org, maoguang.meng@mediatek.com,
        irui.wang@mediatek.com, acourbot@chromium.org,
        Yunfei.Dong@mediatek.com, yong.wu@mediatek.com, eizan@chromium.org
Subject: [PATCH 3/5] media: mtk-vcodec: change the venc handler funcs to return int
Date:   Wed,  4 Aug 2021 16:27:27 +0200
Message-Id: <20210804142729.7231-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the functions handle_enc_init_msg, handle_enc_encode_msg
return void and set vpu->failure to 1 in case of failure.
Instead, change the functions to return non 0 in case of failure
and then the vpu->failure is updated to their return value.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index be6d8790a41e..32dc844d16f9 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -9,7 +9,7 @@
 #include "venc_ipi_msg.h"
 #include "venc_vpu_if.h"
 
-static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
+static int handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 {
 	const struct venc_vpu_ipi_msg_init *msg = data;
 
@@ -19,7 +19,7 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 
 	/* Firmware version field value is unspecified on MT8173. */
 	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
-		return;
+		return 0;
 
 	/* Check firmware version. */
 	mtk_vcodec_debug(vpu, "firmware version: 0x%x\n",
@@ -30,18 +30,19 @@ static void handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 	default:
 		mtk_vcodec_err(vpu, "unhandled firmware version 0x%x\n",
 			       msg->venc_abi_version);
-		vpu->failure = 1;
-		break;
+		return -EINVAL;
 	}
+	return 0;
 }
 
-static void handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
+static int handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
 {
 	const struct venc_vpu_ipi_msg_enc *msg = data;
 
 	vpu->state = msg->state;
 	vpu->bs_size = msg->bs_size;
 	vpu->is_key_frm = msg->is_key_frm;
+	return 0;
 }
 
 static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
@@ -60,12 +61,12 @@ static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv)
 
 	switch (msg->msg_id) {
 	case VPU_IPIMSG_ENC_INIT_DONE:
-		handle_enc_init_msg(vpu, data);
+		vpu->failure = handle_enc_init_msg(vpu, data);
 		break;
 	case VPU_IPIMSG_ENC_SET_PARAM_DONE:
 		break;
 	case VPU_IPIMSG_ENC_ENCODE_DONE:
-		handle_enc_encode_msg(vpu, data);
+		vpu->failure = handle_enc_encode_msg(vpu, data);
 		break;
 	case VPU_IPIMSG_ENC_DEINIT_DONE:
 		break;
-- 
2.17.1

