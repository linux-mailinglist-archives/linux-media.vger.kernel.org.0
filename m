Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5A292BED5
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 07:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbfE1F52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 01:57:28 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45503 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbfE1F5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 01:57:25 -0400
Received: by mail-pg1-f195.google.com with SMTP id w34so5608718pga.12
        for <linux-media@vger.kernel.org>; Mon, 27 May 2019 22:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bEBsXwaX/neCPcXyx6wXDJfeu95Gwu3oPLMhy1Vt32c=;
        b=KSia6Ef358U7BfYZSB6heqJSuEOr86MTrC0gjINF+9RrZoyStLIrUEdaDPSawKcGlX
         +XcIUuR923pbxBBZZCjm6hazvE2eNvf1GSQJ9STFZ6nKhpldVKbWoBu0EhYicPxCYcly
         ngauHTDZ9EfGJLTSaOwN536YforCY5ucQjSTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bEBsXwaX/neCPcXyx6wXDJfeu95Gwu3oPLMhy1Vt32c=;
        b=BPgvm1P9A6o/AVOgWRQUwgDlAJWz6EBlQmsk81XU2uZcOOhzaD45GHIECvlDrSAIEQ
         DjOAiFUI/BoCXIgB5fcc0fd9zMcMEmilifEn1k1ASAhCg5qQzopEk5e83yiYma4Mku9x
         wyR/v41yxiAKvomKB97kIGS8hs88ELvl/LzUU/w8rcMZ1X88nX4Ulr6n36/LyHJ/Uc/1
         BbuKS6efhwKk1DRW4yQw8TLvA6u8bacuo91VsLFaGrTse28eoIKHEPfRO+iOQj9VpVOm
         l1QUHoq4Pph76VJIJKfTz4osnrFvrLaBfO3bY8ldfCdwaQBVBi+1H+QLpLHwBgdKscln
         6A0w==
X-Gm-Message-State: APjAAAUaG+833j3X+xTKiiWrPojVxJZL95U/bPYly7HQqAhHvMZv5nEY
        UrCYi8Yr7coNJdI761zAwFTqww==
X-Google-Smtp-Source: APXvYqytIqRF1dRFeewd0cIzKJxfcElwxHzRYE0XELvCK83wU5bqMoTXjVexePilluGJgoFTC1GvIg==
X-Received: by 2002:a17:90a:4814:: with SMTP id a20mr3417520pjh.62.1559023044800;
        Mon, 27 May 2019 22:57:24 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id w1sm13950551pfg.51.2019.05.27.22.57.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 22:57:24 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [RFCv1 05/12] media: mtk-vcodec: support single-buffer frames
Date:   Tue, 28 May 2019 14:56:28 +0900
Message-Id: <20190528055635.12109-6-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190528055635.12109-1-acourbot@chromium.org>
References: <20190528055635.12109-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Yunfei Dong <yunfei.dong@mediatek.com>

MT8183 will use a multi-planar format backed by a single buffer. Adapt
the existing code to be able to handle such frames instead of assuming
each frame is backed by two buffers.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
[acourbot: refactor, cleanup and split]
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 2175883e22d4..2fdf23ce8ac4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -130,8 +130,9 @@ static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
 	if (dstbuf->used) {
 		vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 0,
 					ctx->picinfo.fb_sz[0]);
-		vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 1,
-					ctx->picinfo.fb_sz[1]);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dstbuf->vb.vb2_buf, 1,
+						ctx->picinfo.fb_sz[1]);
 
 		mtk_v4l2_debug(2,
 				"[%d]status=%x queue id=%d to done_list %d",
@@ -402,7 +403,8 @@ static void mtk_vdec_worker(struct work_struct *work)
 		vdec_if_decode(ctx, NULL, NULL, &res_chg);
 		clean_display_buffer(ctx);
 		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 0, 0);
-		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
 		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
 		v4l2_m2m_buf_done(&dst_buf_info->vb, VB2_BUF_STATE_DONE);
 		clean_free_buffer(ctx);
@@ -1333,7 +1335,8 @@ static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-		vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
 		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 	}
 
-- 
2.22.0.rc1.257.g3120a18244-goog

