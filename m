Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428D3254559
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 14:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgH0MuS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 08:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729131AbgH0MuI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 08:50:08 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43433C06121B;
        Thu, 27 Aug 2020 05:50:08 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 67so3268813pgd.12;
        Thu, 27 Aug 2020 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tJoGp29OgjxfQZ/rs065wQ2H4gpJMwEOpG42+00lmMo=;
        b=nWq2Q3kOSBA4eUQNC/PkeUzMlnm0FTH+mQa/wOrydL6eCiXoEYZuL07MuE2sZdJrng
         fnvKM5+WRf4ooDY4cTXdpmrdG0l7N2Mjjz5j+FaJGKR/coiJWI/t7Xft73lY5YMfZayo
         0yJBEiahSwxqcWywPnOmm2y8uXi41rC4pEKnfRCCz9IVgMx8H4ZtdXZTw7hRpbwIIPLt
         PmPYCouvI5gGj9kYH37C5Hl9UAvGqaF2mavsAUp0oGNnl6YULnviFSyjt5nwJjdBpVsH
         epBJqoPVZt5hoQJqWWjo72YdETQbogDi2YiQfDI0WyvWh9fgvUs4Lu9uU1XWnhQ+ksKz
         d12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tJoGp29OgjxfQZ/rs065wQ2H4gpJMwEOpG42+00lmMo=;
        b=jCP3M/412ermcgLnkIrE+gvgdkCHfSLlvzIhOxJi68oDqgBInbX6m5J8Dw+9Pjb+d7
         A42NX8NhFytPgVUKdbzJYxg7G8bFd/ep/eiFzbgBOkz4Vt/s9THxCMh1Vkdc/U5gY7+f
         rykWPd3Q2GZGdFFeSPFiQv/A8Jq4GaAxyjRhLVCBT1jheMnV1BPIKxpuK0g5edJ9cJNn
         sRhPVL3+Kpbe3L1Su4kbD/p/CjEiIOprPX8i59jCiEfDNXmCX+IKobA3TNZA6aJq5m/I
         hunPWT3U9/sdyhWZ5JsX1fxeRUo2B98jYEaZM8daN0oE1UcxC8EHOUZ/FlB7HtZzsFAn
         6baQ==
X-Gm-Message-State: AOAM530B4OW8a7ns61St5b4OhvnOGBMptwVmSP0sv9bF48AZDqGNbssd
        PgrrRcsXcn7YWb8Hgxo4abM=
X-Google-Smtp-Source: ABdhPJyGoxnkKj9G59MOf7GJPe+vX7/wpqFRcAeweD6nHHvKFLtUajPKb+m4tJs3YB5Uvjk5p+I1Cg==
X-Received: by 2002:a63:1341:: with SMTP id 1mr7078186pgt.144.1598532607763;
        Thu, 27 Aug 2020 05:50:07 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id v18sm2947044pfu.15.2020.08.27.05.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 05:50:06 -0700 (PDT)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH v2 2/2] media: v4l2-mem2mem: simplify poll logic
Date:   Thu, 27 Aug 2020 21:49:46 +0900
Message-Id: <20200827124946.328700-3-gnurou@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827124946.328700-1-gnurou@gmail.com>
References: <20200827124946.328700-1-gnurou@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Factorize redundant checks into a single code block, remove unneeded
checks (a buffer in done_list is necessarily in the DONE or ERROR
state), and we end up with a much simpler version of this function.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index fe90c3c0e4128..af8138c5d7ced 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -841,7 +841,6 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
 				       struct poll_table_struct *wait)
 {
 	struct vb2_queue *src_q, *dst_q;
-	struct vb2_buffer *src_vb = NULL, *dst_vb = NULL;
 	__poll_t rc = 0;
 	unsigned long flags;
 
@@ -862,32 +861,17 @@ static __poll_t v4l2_m2m_poll_for_data(struct file *file,
 	     list_empty(&dst_q->queued_list)))
 		return EPOLLERR;
 
-	spin_lock_irqsave(&dst_q->done_lock, flags);
-	if (list_empty(&dst_q->done_list)) {
-		/*
-		 * If the last buffer was dequeued from the capture queue,
-		 * return immediately. DQBUF will return -EPIPE.
-		 */
-		if (dst_q->last_buffer_dequeued)
-			rc |= EPOLLIN | EPOLLRDNORM;
-	}
-	spin_unlock_irqrestore(&dst_q->done_lock, flags);
-
 	spin_lock_irqsave(&src_q->done_lock, flags);
 	if (!list_empty(&src_q->done_list))
-		src_vb = list_first_entry(&src_q->done_list, struct vb2_buffer,
-						done_entry);
-	if (src_vb && (src_vb->state == VB2_BUF_STATE_DONE
-			|| src_vb->state == VB2_BUF_STATE_ERROR))
 		rc |= EPOLLOUT | EPOLLWRNORM;
 	spin_unlock_irqrestore(&src_q->done_lock, flags);
 
 	spin_lock_irqsave(&dst_q->done_lock, flags);
-	if (!list_empty(&dst_q->done_list))
-		dst_vb = list_first_entry(&dst_q->done_list, struct vb2_buffer,
-						done_entry);
-	if (dst_vb && (dst_vb->state == VB2_BUF_STATE_DONE
-			|| dst_vb->state == VB2_BUF_STATE_ERROR))
+	/*
+	 * If the last buffer was dequeued from the capture queue, signal
+	 * userspace. DQBUF(CAPTURE) will return -EPIPE.
+	 */
+	if (!list_empty(&dst_q->done_list) || dst_q->last_buffer_dequeued)
 		rc |= EPOLLIN | EPOLLRDNORM;
 	spin_unlock_irqrestore(&dst_q->done_lock, flags);
 
-- 
2.28.0

