Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53C53E033E
	for <lists+linux-media@lfdr.de>; Wed,  4 Aug 2021 16:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238803AbhHDObM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 10:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236321AbhHDO3C (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Aug 2021 10:29:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8342C0617A3;
        Wed,  4 Aug 2021 07:27:52 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:adf4:1f5e:19c9:b75f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1321D1F43A34;
        Wed,  4 Aug 2021 15:27:51 +0100 (BST)
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
Subject: [PATCH 5/5] media: mtk-vcodec: venc: Fail if a msg sent to VPU was not signaled
Date:   Wed,  4 Aug 2021 16:27:29 +0200
Message-Id: <20210804142729.7231-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
References: <20210804142729.7231-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each message sent to the VPU should raise a signal. The signal
handler sets vpu->signaled. Test the field and fail
if it is 0.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index 234705ba7cd6..8331b1bd1971 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -92,6 +92,7 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 {
 	int status;
 
+	vpu->signaled = 0;
 	mtk_vcodec_debug_enter(vpu);
 
 	if (!vpu->ctx->dev->fw_handler) {
@@ -106,6 +107,8 @@ static int vpu_enc_send_msg(struct venc_vpu_inst *vpu, void *msg,
 			       *(uint32_t *)msg, len, status);
 		return -EINVAL;
 	}
+	if (!vpu->signaled)
+		return -EINVAL;
 	if (vpu->failure)
 		return -EINVAL;
 
@@ -122,7 +125,6 @@ int vpu_enc_init(struct venc_vpu_inst *vpu)
 	mtk_vcodec_debug_enter(vpu);
 
 	init_waitqueue_head(&vpu->wq_hd);
-	vpu->signaled = 0;
 	vpu->failure = 0;
 
 	status = mtk_vcodec_fw_ipi_register(vpu->ctx->dev->fw_handler, vpu->id,
-- 
2.17.1

