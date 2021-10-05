Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C16A422524
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbhJELjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234396AbhJELjp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:45 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C03C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:54 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id k7so36615363wrd.13
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+zjjRS+8SmWmuiEHBZ1EQ1Juvwdnv29UPzLRK7KSTng=;
        b=ohTGmGBM0A8SAi0X4KFX3NT6pQ/30b41WhOGkrrL+7B8UvTjLrJWvZAntXY8girHBR
         ajYj7yCpVysGzaqRBmDutEmLCHMS7paIiTg6+SKdfssvVWh//unH0GJ2eHZxgtZq6nq/
         0P9ySyi6lyyaa0EiPFEYHsWPN0D7lbQXESG/t4UK6B+EXG73QnqMBUopGqhPNb82A3jY
         BojXM0m+pQfac26WOf/Gp5+ZvEAxLGzKhE9LcoTMPLpS+wJShMnmiLwQj5xUcctM1os6
         JuKHFmDaRSFj2ebuepKHQKXc6jCYGzEh8eCZLpId4NIvD9pf8MxjqIBDA/GRKph1jLkm
         l9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+zjjRS+8SmWmuiEHBZ1EQ1Juvwdnv29UPzLRK7KSTng=;
        b=BtbIO5X8NYG2LkWXq3R7KaMp2BEZg8KHrLRyvcQLoih6ai1ZsTwdkSLqqTAZG2IMhv
         8TC86T79dOTvTcAxJwGRDiJI3qG+UWtWTwSOSrQyVq7Lvwze2/iYE7PlYbqJnyQpinqE
         nho32djy9Kca0r+npxy3lVb+EkIx9fkUEboSAE+EFjRKfGHLS+2miHUAyQ2jxap+O1LS
         Pqw58rG6pOGz1GvU+YO8ghrldyEttPxSfXYX2le6tgEmxfxQGuDGSi/l5QUq6l9XovJc
         yMBlAWPPXQgI45rf2PrZxAt7tgo2PDUsrL1hs8eQoYfuS6BuSQA/qxspkQUgtcXAVUN1
         kwnQ==
X-Gm-Message-State: AOAM53207TYEqDoC1qXfnHBNeva5g5plQ1cAg+cBsGTIBmx7wIKVdl4g
        cfKdHt6aHxK8l3vcOd5uw6A=
X-Google-Smtp-Source: ABdhPJy2pixIZqFIovlFcXsQYTpIiaXY4KfMYzOgWwdofof5tdX29oAHfep9AQ0wksJU1J4oI5B7QQ==
X-Received: by 2002:a5d:6c6e:: with SMTP id r14mr21115749wrz.264.1633433873170;
        Tue, 05 Oct 2021 04:37:53 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:52 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/28] dma-buf: use the new iterator in dma_resv_poll
Date:   Tue,  5 Oct 2021 13:37:23 +0200
Message-Id: <20211005113742.1101-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/dma-buf/dma-buf.c | 36 ++++++------------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8242b5d9baeb..beb504a92d60 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -209,19 +209,14 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	dma_fence_put(fence);
 }
 
-static bool dma_buf_poll_shared(struct dma_resv *resv,
+static bool dma_buf_poll_add_cb(struct dma_resv *resv, bool write,
 				struct dma_buf_poll_cb_t *dcb)
 {
-	struct dma_resv_list *fobj = dma_resv_shared_list(resv);
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i, r;
-
-	if (!fobj)
-		return false;
+	int r;
 
-	for (i = 0; i < fobj->shared_count; ++i) {
-		fence = rcu_dereference_protected(fobj->shared[i],
-						  dma_resv_held(resv));
+	dma_resv_for_each_fence(&cursor, resv, write, fence) {
 		dma_fence_get(fence);
 		r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
 		if (!r)
@@ -232,24 +227,6 @@ static bool dma_buf_poll_shared(struct dma_resv *resv,
 	return false;
 }
 
-static bool dma_buf_poll_excl(struct dma_resv *resv,
-			      struct dma_buf_poll_cb_t *dcb)
-{
-	struct dma_fence *fence = dma_resv_excl_fence(resv);
-	int r;
-
-	if (!fence)
-		return false;
-
-	dma_fence_get(fence);
-	r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
-	if (!r)
-		return true;
-	dma_fence_put(fence);
-
-	return false;
-}
-
 static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 {
 	struct dma_buf *dmabuf;
@@ -282,8 +259,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLOUT) {
-			if (!dma_buf_poll_shared(resv, dcb) &&
-			    !dma_buf_poll_excl(resv, dcb))
+			if (!dma_buf_poll_add_cb(resv, true, dcb))
 				/* No callback queued, wake up any other waiters */
 				dma_buf_poll_cb(NULL, &dcb->cb);
 			else
@@ -303,7 +279,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLIN) {
-			if (!dma_buf_poll_excl(resv, dcb))
+			if (!dma_buf_poll_add_cb(resv, false, dcb))
 				/* No callback queued, wake up any other waiters */
 				dma_buf_poll_cb(NULL, &dcb->cb);
 			else
-- 
2.25.1

