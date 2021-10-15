Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAA842F030
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 14:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238655AbhJOMJC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 08:09:02 -0400
Received: from mblankhorst.nl ([141.105.120.124]:47938 "EHLO mblankhorst.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238651AbhJOMI6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 08:08:58 -0400
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 1/2] dma-buf: Fix dma_resv_wait_timeout handling of timeout = 0.
Date:   Fri, 15 Oct 2021 13:57:19 +0200
Message-Id: <20211015115720.79958-2-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
References: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit ada5c48b11a3 ("dma-buf: use new iterator in dma_resv_wait_timeout")
accidentally started mishandling timeout = 0, by forcing a blocking wait
with timeout = 1 passed to fences. This is not intended, as timeout = 0
may be used for peeking, similar to test_signaled.

Fixes: ada5c48b11a3 ("dma-buf: use new iterator in dma_resv_wait_timeout")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-resv.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 9eb2baa387d4..70a8082660c5 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -617,18 +617,18 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
-	long ret = timeout ? timeout : 1;
+	long ret = timeout ?: 1;
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
 	dma_resv_iter_begin(&cursor, obj, wait_all);
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		ret = dma_fence_wait_timeout(fence, intr, timeout);
+		if (ret <= 0)
+			break;
 
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		if (ret <= 0) {
-			dma_resv_iter_end(&cursor);
-			return ret;
-		}
+		if (timeout)
+			timeout = ret;
 	}
 	dma_resv_iter_end(&cursor);
 
-- 
2.33.0

