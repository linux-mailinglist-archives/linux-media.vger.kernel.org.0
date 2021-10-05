Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C71422522
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbhJELjq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234318AbhJELjo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:44 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CB1C061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:37:53 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id o20so18737117wro.3
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oFRvQ6RV96jBX25654PxBqA2cF5GdsX8IuqjMmhPmaQ=;
        b=J0goe+paILeDCstwX5dO+h/f5bdXMgwbJdcHxWzBYkDA/HeUVVb7H7f3ZT71kzpH5S
         wH07Kb8OjSYBSh6h0vemMtzWYVVxScn0nAHYsugxnRIzpyjxekPsCyu/N32zTzHKMuhN
         uvdYf6xWJyTe9P4vEc/nxdliS4yYEBaFmu+b3KHp2nUgOFzkFxsoNuz7zW99HglZHM8D
         1W0ti9/J7LfMY/IlTioCpKEWHfEbhUYRcrtXhuRLexAJ/xMP5aR5ZSITuW8bx4zDwpon
         sRhO9T0gjPqBROkajLhR6xgWMi2VBficySW04o17XHg5jMgmrSbFtO3Y+BFu3MjDKVxn
         nRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oFRvQ6RV96jBX25654PxBqA2cF5GdsX8IuqjMmhPmaQ=;
        b=INAf3PyVWAljW0z/OwhkRu0O7QsTccK3EtxdXHOfXa/S+RjxFWtyMsUKjF+7VzToMv
         gYl9W0elsdXoBLRcTVBZB6AyBC6d7w0pjN6YWmInta3vOYoI34V5BrtW5ZF+jczBqLDe
         d336/JBcW4/+4OAdxUTks3KOtXe6RgyPUXQPsiavVPukQz9Scx79X9EB+NvrPU/dRtFb
         bVY2WfB116e6jteTRYOI6q9bepu94ZM1WjNKi+70gUCDmJH1bWLzK2fEqDfsSTFORmdw
         QyCihHSDZQ9YOnI5X+XlenbgckSiXoAAMxhDcTVY6kJYwLJpj9KnLQRZyeGNsb4aTWdh
         SI9g==
X-Gm-Message-State: AOAM531KmC8PjlPehZnJTugUgChaA4FpDDhVWWJriubq3MxtRs/rOJoF
        tQsA57Mm+Mhv/TK59O9/NX0=
X-Google-Smtp-Source: ABdhPJx9O8AMO2EbzbaaLU0qYPUVdrF8sww3tGKZar9j615pxOcLezJVK4/CW3wMxw/5Y8lCl1penQ==
X-Received: by 2002:adf:bb93:: with SMTP id q19mr9464875wrg.423.1633433872113;
        Tue, 05 Oct 2021 04:37:52 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:37:51 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 08/28] dma-buf: use the new iterator in dma_buf_debug_show
Date:   Tue,  5 Oct 2021 13:37:22 +0200
Message-Id: <20211005113742.1101-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/dma-buf/dma-buf.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 61e20ae7b08b..8242b5d9baeb 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1356,10 +1356,9 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
 	struct dma_buf *buf_obj;
 	struct dma_buf_attachment *attach_obj;
-	struct dma_resv *robj;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int count = 0, attach_count, shared_count, i;
+	int count = 0, attach_count;
 	size_t size = 0;
 	int ret;
 
@@ -1386,21 +1385,10 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				file_inode(buf_obj->file)->i_ino,
 				buf_obj->name ?: "");
 
-		robj = buf_obj->resv;
-		fence = dma_resv_excl_fence(robj);
-		if (fence)
-			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
-				   fence->ops->get_driver_name(fence),
-				   fence->ops->get_timeline_name(fence),
-				   dma_fence_is_signaled(fence) ? "" : "un");
-
-		fobj = rcu_dereference_protected(robj->fence,
-						 dma_resv_held(robj));
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference_protected(fobj->shared[i],
-							  dma_resv_held(robj));
-			seq_printf(s, "\tShared fence: %s %s %ssignalled\n",
+		dma_resv_for_each_fence(&cursor, buf_obj->resv, true, fence) {
+			seq_printf(s, "\t%s fence: %s %s %ssignalled\n",
+				   dma_resv_iter_is_exclusive(&cursor) ?
+					"Exclusive" : "Shared",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
-- 
2.25.1

