Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825EA443E1A
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 09:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhKCIPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbhKCIPO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:15:14 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F326BC061714;
        Wed,  3 Nov 2021 01:12:36 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id d13so2201836wrf.11;
        Wed, 03 Nov 2021 01:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6PkQ3oa1hrBIqSDtBCmc6g6vqm5e94FteFPaTzIHs+w=;
        b=dWxWDB/8hZjRDwFH55CGQDjWRInNWUTrjuXsNpn+6pbhiqoBhwwMigWZl6VsOYVYWZ
         aCW05F4gQbuuKWGtMtN+ddEvE83NsxQ0JTzBMudf2nbnrVrBND4RMqoYOKD0GdRKor2q
         pLYo/in+LnzMmMdcMp9/HjhrbZDHRRlPN/GEaunL38Gb4ZsJyZ26I1cxF8MwznPUq5XF
         hmeann7cnf/nB/mh5i5m28AHGYxB3gis2/vPHUHCgcoH4mcFL5VE9avnIjoccNHJllk6
         D/ksxdqAT9lPYr4tUNyAW2U8GSYTHDE4G7WpTM0PjRC7yrTBzWbXhdlo1pN4c8iB1sPt
         0KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6PkQ3oa1hrBIqSDtBCmc6g6vqm5e94FteFPaTzIHs+w=;
        b=rPxq6dYImZA5EJmF2c77pRGV4m+q4RWzz3EQ23T1/ZTufA2xB4koocyup/BfKHJaQv
         ysHgYNPtLMjmG3zD9NE/Ug8F3z0LegpzNIDw2UFFWk+PIb9VQIe/oKoSyHC566JrpQtU
         wHuoiJ91u4Am5vNgnv31qtv9xvs87RWOy8sVep+bIvRm2FY0lA0So4qUd+xq/ZBBUk0M
         UOx9nxEYYCnKW6BtffIAobXKfCBnKJ4bKE3z5XCykXU0D6T4agq6wID2I6vqFGsMTa9i
         51K9ZDhY3K1iAkSU/Mvb7oOlmAovlr3idV5kBX+GwO5hcR2bSPPJgTx83TnFFnpG6vnD
         KsCg==
X-Gm-Message-State: AOAM532HtUpAu/27P+/+jJXoKFLc6eibPDiAGmk/kRbDCdsQfdhh2dq3
        Kk+XtzayNwQ13+P1fmW9sx+6yEAJnwU=
X-Google-Smtp-Source: ABdhPJygSaNIkxB6dcQmxoYV0rxENHtn4TJzZeO3ZXaNhGUPxjyjmtmjD0mED986omYbswxSqqp4kg==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr51604325wrr.228.1635927155632;
        Wed, 03 Nov 2021 01:12:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l7sm1450088wry.86.2021.11.03.01.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 01:12:35 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-media@vger.kernel.org, etnaviv@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org
Cc:     sumit.semwal@linaro.org, l.stach@pengutronix.de, daniel@ffwll.ch
Subject: [PATCH 1/4] dma-buf: add dma_fence_describe and dma_resv_describe v2
Date:   Wed,  3 Nov 2021 09:12:28 +0100
Message-Id: <20211103081231.18578-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103081231.18578-1-christian.koenig@amd.com>
References: <20211103081231.18578-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add functions to dump dma_fence and dma_resv objects into a seq_file and
use them for printing the debugfs information.

v2: fix missing include reported by test robot.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Rob Clark <robdclark@gmail.com>
---
 drivers/dma-buf/dma-buf.c   | 11 +----------
 drivers/dma-buf/dma-fence.c | 17 +++++++++++++++++
 drivers/dma-buf/dma-resv.c  | 23 +++++++++++++++++++++++
 include/linux/dma-fence.h   |  1 +
 include/linux/dma-resv.h    |  1 +
 5 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 3f63d58bf68a..385cd037325e 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1321,8 +1321,6 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
 	struct dma_buf *buf_obj;
 	struct dma_buf_attachment *attach_obj;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	int count = 0, attach_count;
 	size_t size = 0;
 	int ret;
@@ -1350,14 +1348,7 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				file_inode(buf_obj->file)->i_ino,
 				buf_obj->name ?: "");
 
-		dma_resv_for_each_fence(&cursor, buf_obj->resv, true, fence) {
-			seq_printf(s, "\t%s fence: %s %s %ssignalled\n",
-				   dma_resv_iter_is_exclusive(&cursor) ?
-					"Exclusive" : "Shared",
-				   fence->ops->get_driver_name(fence),
-				   fence->ops->get_timeline_name(fence),
-				   dma_fence_is_signaled(fence) ? "" : "un");
-		}
+		dma_resv_describe(buf_obj->resv, s);
 
 		seq_puts(s, "\tAttached Devices:\n");
 		attach_count = 0;
diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 1e82ecd443fa..066400ed8841 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -15,6 +15,7 @@
 #include <linux/atomic.h>
 #include <linux/dma-fence.h>
 #include <linux/sched/signal.h>
+#include <linux/seq_file.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/dma_fence.h>
@@ -907,6 +908,22 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 }
 EXPORT_SYMBOL(dma_fence_wait_any_timeout);
 
+/**
+ * dma_fence_describe - Dump fence describtion into seq_file
+ * @fence: the 6fence to describe
+ * @seq: the seq_file to put the textual description into
+ *
+ * Dump a textual description of the fence and it's state into the seq_file.
+ */
+void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
+{
+	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
+		   fence->ops->get_driver_name(fence),
+		   fence->ops->get_timeline_name(fence), fence->seqno,
+		   dma_fence_is_signaled(fence) ? "" : "un");
+}
+EXPORT_SYMBOL(dma_fence_describe);
+
 /**
  * dma_fence_init - Initialize a custom fence.
  * @fence: the fence to initialize
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 9eb2baa387d4..ff3c0558b3b8 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -38,6 +38,7 @@
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
 #include <linux/mmu_notifier.h>
+#include <linux/seq_file.h>
 
 /**
  * DOC: Reservation Object Overview
@@ -666,6 +667,28 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
+/**
+ * dma_resv_describe - Dump description of the resv object into seq_file
+ * @obj: the reservation object
+ * @seq: the seq_file to dump the description into
+ *
+ * Dump a textual description of the fences inside an dma_resv object into the
+ * seq_file.
+ */
+void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+
+	dma_resv_for_each_fence(&cursor, obj, true, fence) {
+		seq_printf(seq, "\t%s fence:",
+			   dma_resv_iter_is_exclusive(&cursor) ?
+				"Exclusive" : "Shared");
+		dma_fence_describe(fence, seq);
+	}
+}
+EXPORT_SYMBOL_GPL(dma_resv_describe);
+
 #if IS_ENABLED(CONFIG_LOCKDEP)
 static int __init dma_resv_lockdep(void)
 {
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index a706b7bf51d7..1ea691753bd3 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -264,6 +264,7 @@ void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
 
 void dma_fence_release(struct kref *kref);
 void dma_fence_free(struct dma_fence *fence);
+void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
 
 /**
  * dma_fence_put - decreases refcount of the fence
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index dbd235ab447f..09c6063b199a 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -490,5 +490,6 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
+void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq);
 
 #endif /* _LINUX_RESERVATION_H */
-- 
2.25.1

