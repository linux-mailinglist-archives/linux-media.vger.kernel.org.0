Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9132570C79
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 23:12:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbiGKVMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 17:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231719AbiGKVME (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 17:12:04 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA199804AE
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 14:12:01 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-10c8e8d973eso6367352fac.5
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 14:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/WA3B+oJQPaCUSKWO1kYwgTDh8dNmGQop6oukbbkhI0=;
        b=O9SPIG+W18OzzmbRWEyaybl/cIecyTTauRNUeFplMk14mb3PSuUp03CXwwPf5FVtJJ
         z11ohFqFGW/H43Aupcs8Nusef79N8MXTfY1mGRAH7xXQ73KwjsJ1X2ECa+tIYs17AG+5
         woDNhzbOQyk3Ik4Lm2z8FmZLbRpsSn1z28yZnxOAUl1PIgXbaMU0Q4GJuS0rtzLZ3CXr
         Sl/bfVsZtHC30FmYi8Ylx7s5XI49NK0Is86xgXK7ukLUNlducHHzfMtB/uymnV+EBHi2
         9768ExZqzX33S1RaJOcz0BdDH6W5Y4ISPuFDJympzBXflJH2YTj4DC3zHswr4SOYlVVI
         nzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/WA3B+oJQPaCUSKWO1kYwgTDh8dNmGQop6oukbbkhI0=;
        b=1b3A9TzPgrQZI6gnLal5/lGPMb4lBlaMwZAeYib1JoORgWrLjbApABcLeNb9426ZaD
         5XWDyQ3ExgSi9/Yq/A0GsNdw7svbLswXLAIJ2Fv+G8SxIldg27pETVWxbDpvmQVgPJgO
         pO2fGP0/9OR0lAhqCyvNfJLWZf7cE7ENIXhAHjYRP0FvGqdhAI7EzVDOhQ775asGkxyD
         cZuH62bMUMdUwQTd3Eq29Re1syyKQSKWc0V3X+LB83rbFtjvtH00jaIaiFQ39mT58KMJ
         aOv+rAhOq/5jtFkDQx8jPR/lbS01ZMwRhxDNxH8ry7f4Wvv3ehpCOGe5mIbjycCAcxji
         3lEA==
X-Gm-Message-State: AJIora8oC+4w6iBuUj+zXw4VlS48jmHzuQZjfltSIQa3+v5C2ysr11wR
        OvdqOQbgaTWocnTXkZ9n/qW2HzYhHvR2RrGs
X-Google-Smtp-Source: AGRyM1vw9AWihe3B3I4UpvLIKTNVK29B1XuoFaIYm2CrZADlUfU3O83MwoZmtQ3f+cGuZaBsynL7aA==
X-Received: by 2002:a05:6871:1d0:b0:101:59af:c6b7 with SMTP id q16-20020a05687101d000b0010159afc6b7mr154782oad.89.1657573920614;
        Mon, 11 Jul 2022 14:12:00 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id c128-20020aca3586000000b00338869042fdsm3198817oia.32.2022.07.11.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 14:12:00 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 5/8] hantro: Use vb2_find_buffer
Date:   Mon, 11 Jul 2022 18:11:38 -0300
Message-Id: <20220711211141.349902-6-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220711211141.349902-1-ezequiel@vanguardiasur.com.ar>
References: <20220711211141.349902-1-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly introduced vb2_find_buffer API to get a vb2_buffer
given a buffer timestamp.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/staging/media/hantro/hantro_drv.c        |  6 ++----
 drivers/staging/media/hantro/hantro_g2_vp9_dec.c | 10 +++++-----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 01d33dcb0467..8cb5cf53e5e7 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -47,12 +47,10 @@ dma_addr_t hantro_get_ref(struct hantro_ctx *ctx, u64 ts)
 {
 	struct vb2_queue *q = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
 	struct vb2_buffer *buf;
-	int index;
 
-	index = vb2_find_timestamp(q, ts, 0);
-	if (index < 0)
+	buf = vb2_find_buffer(q, ts);
+	if (!buf)
 		return 0;
-	buf = vb2_get_buffer(q, index);
 	return hantro_get_dec_buf_addr(ctx, buf);
 }
 
diff --git a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
index 91c21b634fab..6d452c779633 100644
--- a/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_vp9_dec.c
@@ -111,17 +111,17 @@ get_ref_buf(struct hantro_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 timestamp)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
-	int buf_idx;
+	struct vb2_buffer *buf;
 
 	/*
 	 * If a ref is unused or invalid, address of current destination
 	 * buffer is returned.
 	 */
-	buf_idx = vb2_find_timestamp(cap_q, timestamp, 0);
-	if (buf_idx < 0)
-		return vb2_to_hantro_decoded_buf(&dst->vb2_buf);
+	buf = vb2_find_buffer(cap_q, timestamp);
+	if (!buf)
+		buf = &dst->vb2_buf;
 
-	return vb2_to_hantro_decoded_buf(vb2_get_buffer(cap_q, buf_idx));
+	return vb2_to_hantro_decoded_buf(buf);
 }
 
 static void update_dec_buf_info(struct hantro_decoded_buffer *buf,
-- 
2.34.3

