Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC603260F1
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 11:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhBZKID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 05:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhBZKFw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 05:05:52 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F97C0611BE
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:44 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id z7so5041153plk.7
        for <linux-media@vger.kernel.org>; Fri, 26 Feb 2021 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qPSwT+xX3Q2DkuYpMonkhO740MAPhHWpp3ujktCbaHc=;
        b=X4nxA0w5pmGgqLUYe0BOnqj45ihcSpiLztDeSncdzC9m0rQJU9xeUFLykmDZoYIiem
         vQZKoRF4NHRKkv5s/McwJsu8gL+NSLhjKm6bcyiXfjjpl1VA9NMgdWUqNc6Aba+FSHmJ
         sc/S9fjMP3y94Nhg8VriyQ9g1pP9WGiO9aZYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qPSwT+xX3Q2DkuYpMonkhO740MAPhHWpp3ujktCbaHc=;
        b=RTtvbi0FYutUaibMX4pZlHku/xLvigDiGHgRtXM7vD2vs4bKPcnh9ieo65lwSlPKFg
         uTqOdKP0LOsS38qt9BYaTrEJLgleSxJIwTpDh4u4LkTgEGTQKGXRzoJY3ueXcOhJXSvg
         gZ+iXCy/nj55ULloF1LW0yTSf445vGes1X6ipol6INJZNm8ad0yV4at5I+u5yJCT+CQq
         PhQfXASAtV3ahIcyGsMh9n+ZSfhE4yJp8pyPdIPQps379saLK9T7RydP6QOyRxo91HQp
         RqpR5h4y9FS7c98POtaA0DteaQdA2JR2xsqQ18FLMgGnonzO9tG4OZXiqpV9SVhg1FHN
         QPvg==
X-Gm-Message-State: AOAM531PqFimuf2n3wjY0Yj4afy8htSWLDqF43n3T9FL1x/7SPzAD39Y
        1d+BUSgXjry44vFG3eEOGDO7FQ==
X-Google-Smtp-Source: ABdhPJxxQ1/2RZLhAohciVH031MqHR6rC1b7Td8HnDYnkfdgFOYwjFkptZILSZR9srUYEPTpAj+puA==
X-Received: by 2002:a17:90a:8913:: with SMTP id u19mr1816161pjn.59.1614333764019;
        Fri, 26 Feb 2021 02:02:44 -0800 (PST)
Received: from acourbot.tok.corp.google.com ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
        by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 02:02:43 -0800 (PST)
From:   Alexandre Courbot <acourbot@chromium.org>
To:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v3 15/15] media: mtk-vcodec: venc: make sure buffer exists in list before removing
Date:   Fri, 26 Feb 2021 19:01:48 +0900
Message-Id: <20210226100148.1663389-16-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hsin-Yi Wang <hsinyi@chromium.org>

It is possible that empty_flush_buf is removed in mtk_venc_worker() and
then again in vb2ops_venc_stop_streaming(). However, there's no empty
list check in v4l2_m2m_buf_remove_by_buf(). Double remove causes a
kernel crash.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
[acourbot: fix commit log a bit]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.c   | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 4de381b522ae..8af7e840b958 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -933,9 +933,21 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 		}
 		/* STREAMOFF on the CAPTURE queue completes any ongoing flush */
 		if (ctx->is_flushing) {
+			struct v4l2_m2m_buffer *b, *n;
+
 			mtk_v4l2_debug(1, "STREAMOFF called while flushing");
-			v4l2_m2m_buf_remove_by_buf(&ctx->m2m_ctx->out_q_ctx,
-						   &ctx->empty_flush_buf.vb);
+			/*
+			 * STREAMOFF could be called before the flush buffer is
+			 * dequeued. Check whether empty flush buf is still in
+			 * queue before removing it.
+			 */
+			v4l2_m2m_for_each_src_buf_safe(ctx->m2m_ctx, b, n) {
+				if (b == &ctx->empty_flush_buf) {
+					v4l2_m2m_src_buf_remove_by_buf(
+							ctx->m2m_ctx, &b->vb);
+					break;
+				}
+			}
 			ctx->is_flushing = false;
 		}
 	} else {
-- 
2.30.1.766.gb4fecdf3b7-goog

