Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 626DE41EA62
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353463AbhJAKIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353407AbhJAKIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:09 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D89BEC06177B
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:22 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id b192so6812183wmb.2
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4oUqNlwRJHuQB2mIRsKmTeRaOwkcWmdtZ6villVsEcY=;
        b=Czbm+9usHUFKPdcRQ2WYOrvJ0RF3b5jz4tkhBVrUnY2ybN33X6b1Z4nJz/DRThDH73
         zHa1Nl9QIRSpHLCYzmRlX+4bO5htIukCw9FoCdKjJhsfNHSQNNscizt7USHQqJHzGS+9
         HCx/+vA8WPC+IwhVRd0tNfZ3Ah7mWuZwjFn7V3UMrVPOJxQ8ZTuGIBw1jZNUxOvDjlqC
         CCLOnn88N5PZSNwYlWYoHfHiJwJJoSOSGHBlCViLCGwdQHSBll26BgvmwyZLMDI03nQl
         gOqnG3BlTFz2rN1HyBGMan85SRQhjRX2BRi3NN83iwEEr7kej+4o56DCBhas/5W2RTJf
         zRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4oUqNlwRJHuQB2mIRsKmTeRaOwkcWmdtZ6villVsEcY=;
        b=wghHFIDdOqE6Kh8BEJhw+KfRlvUZco/nq1acu0lZ+IY1yC5JfblFY6YEBS15EcTcqE
         buohQl0r9qsw1FocUwJk5w6IBO4G/SXhsdGXrU+7297Oei6VnHr34Yl4/qiclp94jMtg
         WBRnlrMsgTNkilOMMvxFPDlekK2305SpP1x0IJSfrh3XrAtadSuqqu9nUuKABae0vQLU
         CIq5IJ8ubdYADzoqLAp1eavMJoowuzh/pe1+YGp6T854Q/6dA67hwiYplU33FOeFFdp8
         sjzyrfIRfN8zA23RjCcm9u01tr/S0/ZBCLsVeblgiSue40ozpdFogqIOfhAW5oF8yeK8
         xzBQ==
X-Gm-Message-State: AOAM530ooQBdBeAPpu9JjHyALnwjujTunBxQ/NwCtK8wje8aKKCKh2Wd
        7Rg6r6YnG+4qkZs78tw78xo=
X-Google-Smtp-Source: ABdhPJyJ9+sUT94cagH8ST7a3wE9TSF5SLVIKCTHVtTtHAGvOEn+x/WN9d8Ez2+gly8HzfXpfBGnTw==
X-Received: by 2002:a05:600c:4e93:: with SMTP id f19mr3535149wmq.185.1633082781519;
        Fri, 01 Oct 2021 03:06:21 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:21 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 09/28] dma-buf: use the new iterator in dma_resv_poll
Date:   Fri,  1 Oct 2021 12:05:51 +0200
Message-Id: <20211001100610.2899-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
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

