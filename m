Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC7E41EA5D
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353488AbhJAKIP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353405AbhJAKIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:09 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F0AC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:22 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 205-20020a1c01d6000000b0030cd17ffcf8so10782670wmb.3
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eXOyf2Axg9vbweqRF85gRFPRys7FD2K3wIzrdoghDjE=;
        b=f3SJa+yl39fdzfr+eQ3qogubPh4JXxTayU7uod7iR/pYu8GMn/ZDCtQh9mfnfghJLT
         x7A7wAf9WUq4lnrJqXfADeXcPC4YFI++CJH0O5Syf8nalDmKqztxZdeATm5d8V+FrgNp
         RMedTVN5vO47M1WzPxnccfphC7k7kG9EZ1ut90fsv0Lee9Vs1kkJLqUqoV//wA7CUQjz
         WW/jMrXIL7Si7LKXiYVgfgwFNvd7lMGZr9mQYHKcwvxsGdWBBSeT6BPZ/hc/j2bgb6Gd
         w1pX1v4UEiV04Ooy966Dq5pZNFVEEU9/SzYowqnmQH4mRE4F6J0Nl3Q22pQzhm2jAehL
         F/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eXOyf2Axg9vbweqRF85gRFPRys7FD2K3wIzrdoghDjE=;
        b=qVjPnsLUKryLJGh41JaegNn+ZMf7eHyy9lrMRTYcjpkSgp5B5jOCfw6njSrLv9T9LL
         +vyBxGtIYZhHKFnwm21aqYw+MgREhCN3MRXzcHZjrf4N1qDorG4GMHYIfo5jHiU04Xdm
         klBxDMC/muzUHbx3p+g6H4ft5ElKsOhRnubMsVmimaIQ2/FJClqcj0YG821Yl5hi5rlz
         4nMPjNUDHPwieNtR0sk5cYJwrAsKeDpglA4ehB4HhPDlmSdP80On7Lcc+UYdC3UFwE7e
         /oP1z+H0BFXyWeGWqDaRLNcfYFNLIKp8NF0kPR9ZJCsACxldKW8EHKS+lkDjPvlQUIt4
         9n9w==
X-Gm-Message-State: AOAM531CLLQULcaV5dKB+bh7uktkdEhyu1cfhKmSOaymvBQegmrOLWU0
        7uxWERQY1sHrvhykp28yLT3G84aMBd4=
X-Google-Smtp-Source: ABdhPJyyQVfysNmOcePFx27bxTFG1UOPzy4hO6DgLiIYp5NUkPq9miqXDk1ukzvUPvbwPA0/Rp3xvg==
X-Received: by 2002:a1c:48c:: with SMTP id 134mr3536403wme.137.1633082780703;
        Fri, 01 Oct 2021 03:06:20 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:20 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 08/28] dma-buf: use the new iterator in dma_buf_debug_show
Date:   Fri,  1 Oct 2021 12:05:50 +0200
Message-Id: <20211001100610.2899-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
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

