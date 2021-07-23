Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9F43D3614
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 10:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbhGWHYp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 03:24:45 -0400
Received: from mail.netline.ch ([148.251.143.180]:36189 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbhGWHYo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 03:24:44 -0400
X-Greylist: delayed 377 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Jul 2021 03:24:44 EDT
Received: from localhost (localhost [127.0.0.1])
        by netline-mail3.netline.ch (Postfix) with ESMTP id B409920201B;
        Fri, 23 Jul 2021 09:58:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
        by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id QA7ph4I77QHY; Fri, 23 Jul 2021 09:58:58 +0200 (CEST)
Received: from kaveri (24.99.2.85.dynamic.wline.res.cust.swisscom.ch [85.2.99.24])
        by netline-mail3.netline.ch (Postfix) with ESMTPA id 6202F20201A;
        Fri, 23 Jul 2021 09:58:58 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.94.2)
        (envelope-from <michel@daenzer.net>)
        id 1m6q5B-00014N-F3; Fri, 23 Jul 2021 09:58:57 +0200
From:   =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf/poll: Get a file reference for outstanding fence callbacks
Date:   Fri, 23 Jul 2021 09:58:57 +0200
Message-Id: <20210723075857.4065-1-michel@daenzer.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Michel Dänzer <mdaenzer@redhat.com>

This makes sure we don't hit the

	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);

in dma_buf_release, which could be triggered by user space closing the
dma-buf file description while there are outstanding fence callbacks
from dma_buf_poll.

Cc: stable@vger.kernel.org
Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/dma-buf/dma-buf.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 6c520c9bd93c..ec25498a971f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -65,12 +65,9 @@ static void dma_buf_release(struct dentry *dentry)
 	BUG_ON(dmabuf->vmapping_counter);
 
 	/*
-	 * Any fences that a dma-buf poll can wait on should be signaled
-	 * before releasing dma-buf. This is the responsibility of each
-	 * driver that uses the reservation objects.
-	 *
-	 * If you hit this BUG() it means someone dropped their ref to the
-	 * dma-buf while still having pending operation to the buffer.
+	 * If you hit this BUG() it could mean:
+	 * * There's a file reference imbalance in dma_buf_poll / dma_buf_poll_cb or somewhere else
+	 * * dmabuf->cb_in/out.active are non-0 despite no pending fence callback
 	 */
 	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
 
@@ -196,6 +193,7 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
 static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 {
 	struct dma_buf_poll_cb_t *dcb = (struct dma_buf_poll_cb_t *)cb;
+	struct dma_buf *dmabuf = container_of(dcb->poll, struct dma_buf, poll);
 	unsigned long flags;
 
 	spin_lock_irqsave(&dcb->poll->lock, flags);
@@ -203,6 +201,8 @@ static void dma_buf_poll_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	dcb->active = 0;
 	spin_unlock_irqrestore(&dcb->poll->lock, flags);
 	dma_fence_put(fence);
+	/* Paired with get_file in dma_buf_poll */
+	fput(dmabuf->file);
 }
 
 static bool dma_buf_poll_shared(struct dma_resv *resv,
@@ -278,6 +278,9 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLOUT) {
+			/* Paired with fput in dma_buf_poll_cb */
+			get_file(dmabuf->file);
+
 			if (!dma_buf_poll_shared(resv, dcb) &&
 			    !dma_buf_poll_excl(resv, dcb))
 				/* No callback queued, wake up any other waiters */
@@ -299,6 +302,9 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
 		spin_unlock_irq(&dmabuf->poll.lock);
 
 		if (events & EPOLLIN) {
+			/* Paired with fput in dma_buf_poll_cb */
+			get_file(dmabuf->file);
+
 			if (!dma_buf_poll_excl(resv, dcb))
 				/* No callback queued, wake up any other waiters */
 				dma_buf_poll_cb(NULL, &dcb->cb);
-- 
2.32.0

