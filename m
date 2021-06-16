Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C203A94EF
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 10:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbhFPI3K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 04:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhFPI3J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 04:29:09 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0B7C061574
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id w21so1563412edv.3
        for <linux-media@vger.kernel.org>; Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gH3OUhd3wXODbH6KpjmAlhZdfVecYYvZR4fcrZvAXRQ=;
        b=tYxvk49yyGvTd8vEGSVaCnxFvwFkVCpsUMnteHFBbcJSiCa9f7yiKk3IAxuwoEzIHM
         DsNEKfPn5ZZG/Gzt5/goj6jN9vFtjg8UWoG76YxDEwmKQWwa/9LEJ50GshNb9nVVt0J1
         Rpoc/Z58kE7LRRJqvUXjs2xhJgBdHSN27aqqWXj3vrs4er6qr675VMwtk1BrOkuQQLki
         kzonZ95ZHRvR7ydrkVjOxJksBpymEf7jfB83+npzBMPJXekPDel2c6/9hF8fDbFXRl8g
         3DjQeAQdObC7q++IFfYHliGT95LofP/flAapNDxXtLCEBAnQt6F6Ed1tSZAhcQt+Hpch
         Pw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gH3OUhd3wXODbH6KpjmAlhZdfVecYYvZR4fcrZvAXRQ=;
        b=YwWIc3ExZR/pYsobIdbybj1/lQFLOPPd6dL/ayd/3zlRJgAL8wo20a73z5UaakXQxQ
         p1skkm4Xmulj5WydZpB4LaM44h8mlBF5ZSoHAXemQRIBhZS6PXM96wM429RrAdwZTwxk
         zfPAQC9d1S8IhWb6OGM9VcewbW3kZwEVnl4qaeXRRHiHySOBf0RwqMQYd2NPJPyNTkwb
         Ml98jMWVlabl1a6+aLwyeHlmzSA1LN0frtZmkj8N5hJ1QqYv37foqeMv2Owxy1j/otRD
         J1QxjT0yNtYVdzgtDIA2ggriHiiLwgqOKw3l/8Uff/yH/gNIfELiUM6Il9pGY5C4gvL4
         fFQA==
X-Gm-Message-State: AOAM533tt0yo7cm3MUGdREALzHgH/vmdOoQ4ZFbxJGEIwimbf5qXFpH4
        ZrWDhmtv0/pdP1UjFfRsTxQ=
X-Google-Smtp-Source: ABdhPJyoEYuhmKxBRIP4z0Q2CNfPcVS2L6+e9AYh23KI9VbQsFNPnAWmb3Pc18CsbpC5neEG9/X/0Q==
X-Received: by 2002:aa7:dd0b:: with SMTP id i11mr2693934edv.51.1623832020758;
        Wed, 16 Jun 2021 01:27:00 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
        by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 01:27:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org
Subject: [PATCH 2/7] dma-buf: fix and rework dma_buf_poll v2
Date:   Wed, 16 Jun 2021 10:26:50 +0200
Message-Id: <20210616082655.111001-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Daniel pointed me towards this function and there are multiple obvious problems
in the implementation.

First of all the retry loop is not working as intended. In general the retry
makes only sense if you grab the reference first and then check the sequence
values.

It's also good practice to keep the reference around when installing callbacks
to fences you don't own.

Then we skipped checking the exclusive fence when shared fences were present.

And last the whole implementation was unnecessary complex and rather hard to
understand which could lead to probably unexpected behavior of the IOCTL.

Fix all this by reworking the implementation from scratch.

Only mildly tested and needs a thoughtful review of the code.

v2: fix the reference counting as well

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 133 ++++++++++++++++----------------------
 include/linux/dma-buf.h   |   2 +-
 2 files changed, 55 insertions(+), 80 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 511fe0d217a0..b67fbf4e3705 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -72,7 +72,7 @@ static void dma_buf_release(struct dentry *dentry)
 	 * If you hit this BUG() it means someone dropped their ref to the
 	 * dma-buf while still having pending operation to the buffer.
 	 */
-	BUG_ON(dmabuf->cb_shared.active || dmabuf->cb_excl.active);
+	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
 	dmabuf->ops->release(dmabuf);
 
@@ -202,16 +202,20 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	wake_up_locked_poll(dcb->poll, dcb->active);
 	dcb->active = 0;
 	spin_unlock_irqrestore(&dcb->poll->lock, flags);
+	dma_fence_put(fence);
 }
 
 static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 {
+	struct dma_buf_poll_cb_t *dcb;
 	struct dma_buf *dmabuf;
 	struct dma_resv *resv;
 	struct dma_resv_list *fobj;
 	struct dma_fence *fence_excl;
-	__poll_t events;
 	unsigned shared_count, seq;
+	struct dma_fence *fence;
+	__poll_t events;
+	int r, i;
 
 	dmabuf = file->private_data;
 	if (!dmabuf || !dmabuf->resv)
@@ -225,99 +229,70 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 	if (!events)
 		return 0;
 
+	dcb = events & EPOLLOUT ? &dmabuf->cb_out : &dmabuf->cb_in;
+
+	/* Only queue a new one if we are not still waiting for the old one */
+	spin_lock_irq(&dmabuf->poll.lock);
+	if (dcb->active)
+		events = 0;
+	else
+		dcb->active = events;
+	spin_unlock_irq(&dmabuf->poll.lock);
+	if (!events)
+		return 0;
+
 retry:
 	seq = read_seqcount_begin(&resv->seq);
 	rcu_read_lock();
 
 	fobj = rcu_dereference(resv->fence);
-	if (fobj)
+	if (fobj && events & EPOLLOUT)
 		shared_count = fobj->shared_count;
 	else
 		shared_count = 0;
-	fence_excl = dma_resv_excl_fence(resv);
-	if (read_seqcount_retry(&resv->seq, seq)) {
-		rcu_read_unlock();
-		goto retry;
-	}
 
-	if (fence_excl && (!(events & EPOLLOUT) || shared_count == 0)) {
-		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_excl;
-		__poll_t pevents = EPOLLIN;
-
-		if (shared_count == 0)
-			pevents |= EPOLLOUT;
-
-		spin_lock_irq(&dmabuf->poll.lock);
-		if (dcb->active) {
-			dcb->active |= pevents;
-			events &= ~pevents;
-		} else
-			dcb->active = pevents;
-		spin_unlock_irq(&dmabuf->poll.lock);
-
-		if (events & pevents) {
-			if (!dma_fence_get_rcu(fence_excl)) {
-				/* force a recheck */
-				events &= ~pevents;
-				dma_buf_poll_cb(NULL, &dcb->cb);
-			} else if (!dma_fence_add_callback(fence_excl, &dcb->cb,
-							   dma_buf_poll_cb)) {
-				events &= ~pevents;
-				dma_fence_put(fence_excl);
-			} else {
-				/*
-				 * No callback queued, wake up any additional
-				 * waiters.
-				 */
-				dma_fence_put(fence_excl);
-				dma_buf_poll_cb(NULL, &dcb->cb);
-			}
+	for (i = 0; i < shared_count; ++i) {
+		fence = rcu_dereference(fobj->shared[i]);
+		fence = dma_fence_get_rcu(fence);
+		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
+			/* Concurrent modify detected, force re-check */
+			dma_fence_put(fence);
+			rcu_read_unlock();
+			goto retry;
 		}
-	}
 
-	if ((events & EPOLLOUT) && shared_count > 0) {
-		struct dma_buf_poll_cb_t *dcb = &dmabuf->cb_shared;
-		int i;
-
-		/* Only queue a new callback if no event has fired yet */
-		spin_lock_irq(&dmabuf->poll.lock);
-		if (dcb->active)
-			events &= ~EPOLLOUT;
-		else
-			dcb->active = EPOLLOUT;
-		spin_unlock_irq(&dmabuf->poll.lock);
-
-		if (!(events & EPOLLOUT))
+		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		if (!r) {
+			/* Callback queued */
+			events = 0;
 			goto out;
+		}
+		dma_fence_put(fence);
+	}
 
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence = rcu_dereference(fobj->shared[i]);
-
-			if (!dma_fence_get_rcu(fence)) {
-				/*
-				 * fence refcount dropped to zero, this means
-				 * that fobj has been freed
-				 *
-				 * call dma_buf_poll_cb and force a recheck!
-				 */
-				events &= ~EPOLLOUT;
-				dma_buf_poll_cb(NULL, &dcb->cb);
-				break;
-			}
-			if (!dma_fence_add_callback(fence, &dcb->cb,
-						    dma_buf_poll_cb)) {
-				dma_fence_put(fence);
-				events &= ~EPOLLOUT;
-				break;
-			}
+	fence = dma_resv_excl_fence(resv);
+	if (fence) {
+		fence = dma_fence_get_rcu(fence);
+		if (!fence || read_seqcount_retry(&resv->seq, seq)) {
+			/* Concurrent modify detected, force re-check */
 			dma_fence_put(fence);
+			rcu_read_unlock();
+			goto retry;
+
 		}
 
-		/* No callback queued, wake up any additional waiters. */
-		if (i == shared_count)
-			dma_buf_poll_cb(NULL, &dcb->cb);
+		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
+		if (!r) {
+			/* Callback queued */
+			events = 0;
+			goto out;
+		}
+		dma_fence_put(fence_excl);
 	}
 
+	/* No callback queued, wake up any additional waiters. */
+	dma_buf_poll_cb(NULL, &dcb->cb);
+
 out:
 	rcu_read_unlock();
 	return events;
@@ -562,8 +537,8 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	dmabuf->owner = exp_info->owner;
 	spin_lock_init(&dmabuf->name_lock);
 	init_waitqueue_head(&dmabuf->poll);
-	dmabuf->cb_excl.poll = dmabuf->cb_shared.poll = &dmabuf->poll;
-	dmabuf->cb_excl.active = dmabuf->cb_shared.active = 0;
+	dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
+	dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
 
 	if (!resv) {
 		resv = (struct dma_resv *)&dmabuf[1];
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index efdc56b9d95f..7e747ad54c81 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -329,7 +329,7 @@ struct dma_buf {
 		wait_queue_head_t *poll;
 
 		__poll_t active;
-	} cb_excl, cb_shared;
+	} cb_in, cb_out;
 };
 
 /**
-- 
2.25.1

