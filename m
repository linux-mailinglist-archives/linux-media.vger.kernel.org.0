Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67E93E0331
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 16:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237395AbhHDObI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 10:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236467AbhHDO24 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Aug 2021 10:28:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0C0C0617A2;
        Wed,  4 Aug 2021 07:27:52 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:adf4:1f5e:19c9:b75f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3C8FD1F43A32;
        Wed,  4 Aug 2021 15:27:50 +0100 (BST)
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
Subject: [PATCH 4/5] media: mtk-vcodec: Add two error cases upon vpu irq handling
Date:   Wed,  4 Aug 2021 16:27:28 +0200
Message-Id: <20210804142729.7231-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

1. Fail if the function mtk_vcodec_fw_map_dm_addr
returns ERR pointer.
2. Fail if the state from the vpu msg is either
VEN_IPI_MSG_ENC_STATE_ERROR or VEN_IPI_MSG_ENC_STATE_PART

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index 32dc844d16f9..234705ba7cd6 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -17,6 +17,8 @@ static int handle_enc_init_msg(struct venc_vpu_inst *vpu, const void *data)
 	vpu->vsi = mtk_vcodec_fw_map_dm_addr(vpu->ctx->dev->fw_handler,
 					     msg->vpu_inst_addr);
 
+	if (IS_ERR(vpu->vsi))
+		return PTR_ERR(vpu->vsi);
 	/* Firmware version field value is unspecified on MT8173. */
 	if (vpu->ctx->dev->venc_pdata->chip == MTK_MT8173)
 		return 0;
@@ -42,6 +44,12 @@ static int handle_enc_encode_msg(struct venc_vpu_inst *vpu, const void *data)
 	vpu->state = msg->state;
 	vpu->bs_size = msg->bs_size;
 	vpu->is_key_frm = msg->is_key_frm;
+	if (vpu->state == VEN_IPI_MSG_ENC_STATE_ERROR ||
+	    vpu->state == VEN_IPI_MSG_ENC_STATE_PART) {
+		mtk_vcodec_err(vpu, "bad ipi-enc-state: %s",
+			       vpu->state == VEN_IPI_MSG_ENC_STATE_ERROR ? "ERR" : "PART");
+		return -EINVAL;
+	}
 	return 0;
 }
 
-- 
2.17.1

