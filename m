Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF5AE5691C2
	for <lists+linux-media@lfdr.de>; Wed,  6 Jul 2022 20:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234350AbiGFS1l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jul 2022 14:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbiGFS1h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jul 2022 14:27:37 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F14D13E83
        for <linux-media@vger.kernel.org>; Wed,  6 Jul 2022 11:27:37 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id t127so2002519vsb.8
        for <linux-media@vger.kernel.org>; Wed, 06 Jul 2022 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=McgJarXoZM45I88Tjkykz9D1NEdll4H/rO3vnYMbjF8=;
        b=oX/Uyq2BPSSGb8F4U0b+VccUzMVgyUrnFb+uaTpEyDeQjNmBZ9Jz6JEUch2ZwMQ0nH
         mNQIncj0ZpUFFDVh8Q5HQkJC21RJOCKwiLQKjNUiByiIcThxrTLU1Oe7/JDB4Wag9sfR
         Bf4Z5hC5erNOALnSNp8zYEonzu2g+5FkZpEM0VbLiLquxlXab7g7HqRXcy8E3CQBpoY9
         gwrx5SxJWbj6DyQlyybXjAOPvjhTfUBL2b3YjYWSRDJfNUz+tSqR66E50Bkhk91ecFhb
         tZVH5RUQXW6GDP7ARjQWNBxDbpVKM7wNOp7cR0/whrPNG3pLVWU/7W0KkoMdL1TKRM4u
         5O7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=McgJarXoZM45I88Tjkykz9D1NEdll4H/rO3vnYMbjF8=;
        b=C+S8KUvR88FVt8Z0Ek9rKWQWstiFyfs4jbDb0hWCae2lgDJlVtfuZ4wApdH7CbqEdm
         5soP7eL0oVGUjDf579L5ZqW54Np2MfOgJdmbd4cOGZQ5TbAJx6Z0IQqg4e/mEXihpSuB
         mjLgrFQ1g1Tczwr2GuSHkBznVSlUIAJyk/x2tjbCwdYMBOxu+a+YSmqdVHhRW+zIWUAr
         4Ysmh3O/94q5KtosvMKNcgnJrE+0bR+SDAuqGUr4vZAn52bAD4rjTAWfh5HxtB81EAz7
         NywpM6SHXINp8fuUH4tjVGuUhEIYFCCgygBHD2Ngke6C3m+897RcKo5RlK0OunIuI4nc
         XhXA==
X-Gm-Message-State: AJIora9v5fa2u3HOvPhXU1OpIhUDdIcJP3z3gXyEts9tHqd7kVNH5NXd
        aoJHk9Y12AbxvCD+ojUo24VmVLUzTEjr2kwy
X-Google-Smtp-Source: AGRyM1u+9y1GvDNJjTADUZtxLGQcFZ4mTEixyb9LWGvZao1+L59nYg+Zu6EIMXAbEu6UcCVPeOVgvQ==
X-Received: by 2002:a67:ba09:0:b0:354:5d45:67ed with SMTP id l9-20020a67ba09000000b003545d4567edmr23473379vsn.18.1657132056035;
        Wed, 06 Jul 2022 11:27:36 -0700 (PDT)
Received: from zeta-build.. ([190.190.187.68])
        by smtp.gmail.com with ESMTPSA id bl9-20020a056102508900b003563680212asm7445539vsb.27.2022.07.06.11.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 11:27:35 -0700 (PDT)
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 5/8] hantro: Use vb2_find_buffer
Date:   Wed,  6 Jul 2022 15:26:54 -0300
Message-Id: <20220706182657.210650-6-ezequiel@vanguardiasur.com.ar>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
References: <20220706182657.210650-1-ezequiel@vanguardiasur.com.ar>
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

