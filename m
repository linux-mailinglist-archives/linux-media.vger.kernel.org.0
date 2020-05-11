Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731601CD48F
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 11:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbgEKJL4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 05:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727093AbgEKJLz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 05:11:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC61C061A0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 02:11:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id w7so9929655wre.13
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q7OJr2fNjgGIcJIqqF9ej5dw8+vyB2iSNpGREcUJdJ8=;
        b=XSlecak9WF0+12diZ+csclqCd6URlr2zAoK8NqOOevNyeI615JACkJ6RVjZvHhQMm/
         cZGgYTHh6V8wa/pbt1dwPjKLdID/v2MfGPl4KhtWRCcVKYJfw4ylih3zuyirqJGbi73q
         mJOsRI5Mf796KuLVu06LlUNBFr7NHZpM8jVno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q7OJr2fNjgGIcJIqqF9ej5dw8+vyB2iSNpGREcUJdJ8=;
        b=RQfvdT2KWoYcGCnpXeIzZXf4wZohLbYM6S8/0u36k9ApEB55K7Mv5VF4Ysj61Ak+xo
         dcseNder4tR80ovZxUgHxNzLYJaABLImLxUqD3ws+oJ9X5wsldQtobr9pqo8hsqgHmrW
         fEt8rUi3313bX9T4zGi4uIgIKcVnveexliIfDa/GeV44m+Z4PN2/w/WdQsS4BoEVFoq/
         FPSjmJf48cNilf4XTD/uBbOIUlgojsedTTqM7/K2ae3pcZ2bI9c95fYCNuM0rz4A7+lT
         R/l7aZx0PwbSQAQ1u71ZZ7iUgHFTJVWX5blNSrhYqtq5wYdYsJ1MBHhMK9XtiajOt+u3
         vDAQ==
X-Gm-Message-State: AGi0PuYtclTM35Xn5GTYhe5s2oy9zgokTEu9lNtx/BY31FQQRq6JWhfU
        Ju02OEyRc/RJaVFYjYRv70m2AQ==
X-Google-Smtp-Source: APiQypKTOisFnohd+WRO0Z88W2Yg66YiWX7rj46BoIw2L57BnjAgP/PH17CP0/qQS37ikw0XH2izsw==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr6637314wrp.427.1589188314245;
        Mon, 11 May 2020 02:11:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t4sm17506299wri.54.2020.05.11.02.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 02:11:53 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/3] dma-fence: use default wait function for mock fences
Date:   Mon, 11 May 2020 11:11:41 +0200
Message-Id: <20200511091142.208787-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No need to micro-optmize when we're waiting in a mocked object ...

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 drivers/dma-buf/st-dma-fence.c | 41 ----------------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fence.c
index e593064341c8..8166d2984702 100644
--- a/drivers/dma-buf/st-dma-fence.c
+++ b/drivers/dma-buf/st-dma-fence.c
@@ -33,50 +33,9 @@ static void mock_fence_release(struct dma_fence *f)
 	kmem_cache_free(slab_fences, to_mock_fence(f));
 }
 
-struct wait_cb {
-	struct dma_fence_cb cb;
-	struct task_struct *task;
-};
-
-static void mock_wakeup(struct dma_fence *f, struct dma_fence_cb *cb)
-{
-	wake_up_process(container_of(cb, struct wait_cb, cb)->task);
-}
-
-static long mock_wait(struct dma_fence *f, bool intr, long timeout)
-{
-	const int state = intr ? TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE;
-	struct wait_cb cb = { .task = current };
-
-	if (dma_fence_add_callback(f, &cb.cb, mock_wakeup))
-		return timeout;
-
-	while (timeout) {
-		set_current_state(state);
-
-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &f->flags))
-			break;
-
-		if (signal_pending_state(state, current))
-			break;
-
-		timeout = schedule_timeout(timeout);
-	}
-	__set_current_state(TASK_RUNNING);
-
-	if (!dma_fence_remove_callback(f, &cb.cb))
-		return timeout;
-
-	if (signal_pending_state(state, current))
-		return -ERESTARTSYS;
-
-	return -ETIME;
-}
-
 static const struct dma_fence_ops mock_ops = {
 	.get_driver_name = mock_name,
 	.get_timeline_name = mock_name,
-	.wait = mock_wait,
 	.release = mock_fence_release,
 };
 
-- 
2.26.2

