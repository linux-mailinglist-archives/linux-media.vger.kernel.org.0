Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96DFCAB772
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 13:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391415AbfIFLzg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 07:55:36 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42324 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbfIFLzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 07:55:36 -0400
Received: by mail-pg1-f194.google.com with SMTP id p3so3364658pgb.9
        for <linux-media@vger.kernel.org>; Fri, 06 Sep 2019 04:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xs0FBb2Eh/a0ZfUN3lmjqgA2lvRsBqNMJJ4Hr+t8rsk=;
        b=kmeCQIBiGhW+tQk1fg/PEzbkGpG3iO+oFGAUpfEbSWNTm3PcVsny+MysO5F3WoE8LT
         6a1P2nxNWtuzOcJDNmFvJvCTt/BzxCDIh+lGvKuymsWqD5KYCc1+yhDA5KbdNkk90OvF
         BXy91nw60TByc1eZCT/j7tGOHhq8l0wGAhkwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xs0FBb2Eh/a0ZfUN3lmjqgA2lvRsBqNMJJ4Hr+t8rsk=;
        b=Gd0tRu9R/oCSlBkkYAsJCGkhhY9d3uRgGETo1/clREy+M8VVY1IxIMZc/02bp2HSF9
         NLQIN0FoP26OPla3bThkypQe5+uRI2qV2TfDkwM10Dzgb0v2Ycd1kHu7L1BiTBDCTKRB
         cjMYYHhLAMyfo2cDhtu1DDUvx+hg5YqzrmIN6bNv+oyPz8YLO7HL/IhhBRqUNKIo+bVD
         0GoQ7XqJpKyXlJHRCvwg6GFMwM41ELosWU9f8Hb4oE+lOMBvm4flainb+KcxFyPgxEuA
         fjARL0ysPFu+4U1XuvW75q6g31Ooi2dXhfVEGsdKnPu16S9OrtTB2lqnhAfBXSlwZN3f
         Y6pQ==
X-Gm-Message-State: APjAAAWLW/lGi50QrNyfybAXIqFKSvoFaWcZXsMjWQdxCzvVFWnkzp0F
        pdh56HkWRyjNwZ4szgXm1E+K/A==
X-Google-Smtp-Source: APXvYqyowvNhtzHl1k0Wi0wS4lHGEUaq8Era+YDWf70Q5A7/cxadAiuvSkuQdQrv8pFKymQ7yzZiUQ==
X-Received: by 2002:aa7:920b:: with SMTP id 11mr9848278pfo.231.1567770935302;
        Fri, 06 Sep 2019 04:55:35 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id o22sm3667394pjq.21.2019.09.06.04.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 04:55:34 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFC PATCH v2 02/13] media: mtk-vcodec: vdec: set VPI IPI handler in one place
Date:   Fri,  6 Sep 2019 20:55:02 +0900
Message-Id: <20190906115513.159705-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906115513.159705-1-acourbot@chromium.org>
References: <20190906115513.159705-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each of the supported decoder formats used to set the same RPC
interrupt handler by themselves, even though this could be done
by the IF init function itself. Move it to the right place and stop
making its symbol public.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c | 1 -
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c  | 1 -
 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c  | 1 -
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c       | 9 ++++++++-
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.h       | 9 ---------
 5 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
index 49aa85a9bb5a..50048c170b99 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_if.c
@@ -283,7 +283,6 @@ static int vdec_h264_init(struct mtk_vcodec_ctx *ctx)
 	inst->vpu.id = IPI_VDEC_H264;
 	inst->vpu.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu.ctx = ctx;
-	inst->vpu.handler = vpu_dec_ipi_handler;
 
 	err = vpu_dec_init(&inst->vpu);
 	if (err) {
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
index 63a8708ce682..6011fdd60a22 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp8_if.c
@@ -402,7 +402,6 @@ static int vdec_vp8_init(struct mtk_vcodec_ctx *ctx)
 	inst->vpu.id = IPI_VDEC_VP8;
 	inst->vpu.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu.ctx = ctx;
-	inst->vpu.handler = vpu_dec_ipi_handler;
 
 	err = vpu_dec_init(&inst->vpu);
 	if (err) {
diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
index 5066c283d86d..24c1f0bf2147 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
@@ -793,7 +793,6 @@ static int vdec_vp9_init(struct mtk_vcodec_ctx *ctx)
 	inst->vpu.id = IPI_VDEC_VP9;
 	inst->vpu.dev = ctx->dev->vpu_plat_dev;
 	inst->vpu.ctx = ctx;
-	inst->vpu.handler = vpu_dec_ipi_handler;
 
 	if (vpu_dec_init(&inst->vpu)) {
 		mtk_vcodec_err(inst, "vp9_dec_vpu_init failed");
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
index 3f38cc4509ef..70abfd4cd4b9 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
@@ -25,10 +25,16 @@ static void handle_init_ack_msg(struct vdec_vpu_ipi_init_ack *msg)
 }
 
 /*
+ * vpu_dec_ipi_handler - Handler for VPU ipi message.
+ *
+ * @data: ipi message
+ * @len : length of ipi message
+ * @priv: callback private data which is passed by decoder when register.
+ *
  * This function runs in interrupt context and it means there's an IPI MSG
  * from VPU.
  */
-void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
+static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv)
 {
 	struct vdec_vpu_ipi_ack *msg = data;
 	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
@@ -102,6 +108,7 @@ int vpu_dec_init(struct vdec_vpu_inst *vpu)
 	mtk_vcodec_debug_enter(vpu);
 
 	init_waitqueue_head(&vpu->wq);
+	vpu->handler = vpu_dec_ipi_handler;
 
 	err = vpu_ipi_register(vpu->dev, vpu->id, vpu->handler, "vdec", NULL);
 	if (err != 0) {
diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
index b76f717e4fd7..f779b0676fbd 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
@@ -76,13 +76,4 @@ int vpu_dec_deinit(struct vdec_vpu_inst *vpu);
  */
 int vpu_dec_reset(struct vdec_vpu_inst *vpu);
 
-/**
- * vpu_dec_ipi_handler - Handler for VPU ipi message.
- *
- * @data: ipi message
- * @len : length of ipi message
- * @priv: callback private data which is passed by decoder when register.
- */
-void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv);
-
 #endif
-- 
2.23.0.187.g17f5b7556c-goog

