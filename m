Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38F673435F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 11:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbfFDJiI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 05:38:08 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35661 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727179AbfFDJiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jun 2019 05:38:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id s27so4414832pgl.2
        for <linux-media@vger.kernel.org>; Tue, 04 Jun 2019 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kfKR4zIJY5Q7mLLSSnEqtRMlxyZNbSUA1f1fGIbLQtA=;
        b=SqKAjRwGPeznbRHq14yh+MdKPzB2UlkQq+rY79BVw0o99j5riYGogmLQWyRGa4CV9D
         yXU+nzbphMJin777kMGmpYxmiOt3guezpTWJ80gMOevfTZm/ve7AXEsdxR1ynh36o1q3
         TBq7U2o8GgviftlEn+OeJATftUgCrWBanShTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kfKR4zIJY5Q7mLLSSnEqtRMlxyZNbSUA1f1fGIbLQtA=;
        b=WLWjb+4MDTcdYm3wI2O2ke8ZEED2FVuBxlfX9Op5a+q4wOBfs3iEXgvB59L2t1WMmZ
         zk4JbQc+dP3VSdbBXsiE2DEHl14zO3Sjw6/E3+3SRca23Ui+d7DhuQ8Uvkow5keDGXUL
         zLBj6kh0WSac5o4GOO/R6ciLJ3C49gXM9M9+StVWch4Ws77aJ8OEp3OY/K0omNd3MNjX
         H0G1BGbxpvnOH4jFpi76n02WqgDWXIlIwP19BvEpYqgTSYCl8rjP1SPz1sF2wyQM87sk
         P6nU7LUzIyJ6zzW8qq0n1XPnhVOR6PHcmG+B40VfKxPpsMPhThHYKntWgJ0XL2Aw/j+s
         rU2A==
X-Gm-Message-State: APjAAAXMXZneTjCLWyVxdtKwnvnTWub2K/Fj6FQVfr4gGlL2wxAwXy4G
        OfcNiIN802vFRwgj6kv/chy/Aw==
X-Google-Smtp-Source: APXvYqyWS5dM/l4M3+5y02FrXWl3FHdeFzRApJLhFiUHB9nkoj0cukopH+788acAn59bdd3teuxmBg==
X-Received: by 2002:a17:90a:cf0b:: with SMTP id h11mr29074586pju.90.1559641087044;
        Tue, 04 Jun 2019 02:38:07 -0700 (PDT)
Received: from acourbot.tok.corp.google.com ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
        by smtp.gmail.com with ESMTPSA id j7sm17431588pfa.184.2019.06.04.02.38.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 02:38:06 -0700 (PDT)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH 5/5] media: mtk-vcodec: support single-buffer frames
Date:   Tue,  4 Jun 2019 18:37:37 +0900
Message-Id: <20190604093737.172599-6-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190604093737.172599-1-acourbot@chromium.org>
References: <20190604093737.172599-1-acourbot@chromium.org>
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
index 131a8117ece2..6b99b877a3b4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -117,8 +117,9 @@ static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
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
@@ -389,7 +390,8 @@ static void mtk_vdec_worker(struct work_struct *work)
 		vdec_if_decode(ctx, NULL, NULL, &res_chg);
 		clean_display_buffer(ctx);
 		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 0, 0);
-		vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dst_buf_info->vb.vb2_buf, 1, 0);
 		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
 		v4l2_m2m_buf_done(&dst_buf_info->vb, VB2_BUF_STATE_DONE);
 		clean_free_buffer(ctx);
@@ -1320,7 +1322,8 @@ static void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 
 	while ((dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx))) {
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
-		vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
+		if (ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 2)
+			vb2_set_plane_payload(&dst_buf->vb2_buf, 1, 0);
 		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
 	}
 
-- 
2.22.0.rc1.311.g5d7573a151-goog

