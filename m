Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA62B417792
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347162AbhIXPc6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347141AbhIXPc5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:32:57 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5471BC061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:24 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id t28so15273677wra.7
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=94c9/cvO4ig+518zY5xyP/tzsv4f6nlGZ8qTXZ85g0M=;
        b=YlNroZ5biwT4gRqCxs308agE8oTbg2jZFIcIx5gpx/s397fd+zzRJQ5Hplq1GevfSW
         b2ZSzIzAVlaZ3Z/2ECfLxMkY8q59zM4ZtLbGQZ/rwtTRi1Gkwht9FStOAeQo9yULR7Nr
         AZyi4hr9cQuyI7NIXADwKXP0vpCKJKQ3TGei6/q/TXtedJwOISdZ/uXXmRsbYCbLmQO7
         yafiDUqIfvWVm8f3Jmne0f6ilncN1MH7/NLGe6YL48xcUOJBnMvLlt9TVzrNXhMViZtg
         Oa7kq23yTRLK0lNIL3BGDl5sMKWtBKGaovIgSJTAz04am2GFkIZwwT3UUcRGMTJgH5hM
         ZVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=94c9/cvO4ig+518zY5xyP/tzsv4f6nlGZ8qTXZ85g0M=;
        b=44/+dzPqhVkItse3eX+4Dpgn53+CRQEZjCCMf7XCswFLeHJOqrC424Alk9bULA3mGw
         abcPvBuD1bs0w4RZFxXXCtF6thzc6gNwoVPVKEbo4GQiqeg6M4JeTHOBk9VZgtO3FnDH
         ssRPLArQEV7PcmfCGtbvshJM/mqvUz2gx9Vfh/GNm+K3Bhwol77FtBZRNylTiQPfVZvl
         FKOKigQw9SUsZfWSi47nXRWhV/QmMEqKLs2ODTkQ1HWlvpuhWSYkzgqkFK04Mo1S/Jmw
         mNvBR2g7niNDoEg1Nmq8upNRsMzFPxvanN+qqHRaQGHPoIFy/wIhHCTJB0rCYOYcQuV+
         HWMA==
X-Gm-Message-State: AOAM530SgINofcay80unn7N/IYHQdViKd2K1Br4jWVzV32c5NFzDeoxs
        s3iQFojSCglhPU9QiVMAP/8=
X-Google-Smtp-Source: ABdhPJy+yiRepmZL6xJsYzD6MfHT8qUFF2ibMp+Qb4FMclBELxNiicxgkVgOBbeClOYdUw6jjBg0fw==
X-Received: by 2002:a5d:5229:: with SMTP id i9mr12230244wra.373.1632497483032;
        Fri, 24 Sep 2021 08:31:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:22 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 08/27] dma-buf: use the new iterator in dma_buf_debug_show
Date:   Fri, 24 Sep 2021 17:30:54 +0200
Message-Id: <20210924153113.2159-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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
index 474de2d988ca..d35c71743ccb 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1368,10 +1368,9 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
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
 
@@ -1398,21 +1397,10 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
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

