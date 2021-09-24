Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3708C41778C
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347148AbhIXPcx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbhIXPcx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:32:53 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231F9C061571
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id w29so28586426wra.8
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lj2Yv/wWR6TC7dOizEI5QN7SBISIYTE1BHrEKqHlUyU=;
        b=EHI/GN6zLHjnVSCx4/mw7LwnyTXJEk8y0ZtD2faHsuyN0r684yxdvxrku53+zpSUSx
         2+5b4B6x4pPwWMPWVJyGbvXded/IdhyhjugMKOiNGzDW8PHpl4TJ1srq+vvpvHJyGB75
         DBhUlvV98AhJGO+ffjx0DPptZRpQvTy3uCRPs47qneJvrZ8wY9HQ3+iomi3Ljj7oxFQB
         o3ykjQGAGxCQsezSTzH9dS9BzBm7jpot6zTRqjcgKXoVLEg6EzcIUJY+7UZFNnbWCaEq
         2Um+MLM+saqx+K5O1mnkpLVb0U3C7ibfaAW+s4ZEBy786xJmFY+rqSX7jYxMHrUKfGor
         Kwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lj2Yv/wWR6TC7dOizEI5QN7SBISIYTE1BHrEKqHlUyU=;
        b=EwVtZo6j5mZeAgLpaYwK5NBKZEukKtpr57ls0sQEZHABmYAsHLTGzqZA7//cZPvXV3
         6MJ20D/yQP5zAv4e/elqM60zx4aj2D9XxnFsND6TRtayMkdTt3bMKpxmY/6YANFVMQNm
         +qNz+l8WPY4vrN/KpdwnqSrnkfsCoLk2kp7HfAQlj8iIBSkJkUWfLtUnoCgv/uQFRhpO
         EMJHmvvKWBt7B+KOJ8RgUMZ/K7/3g20Iu/DZSrLKOiCr9qmYFOaeLJtWjTRVqt5KdOu+
         pVcR95QDbhl9yitkfKC0aXdkIgtmOJos/LBidF+MNXNiZMKeI/1EvKfSI9/a623Q78lw
         JCdA==
X-Gm-Message-State: AOAM5307v0jk2Xbb17ndIYtrTSKFVdxBxR+tc+pxS7RsRGRcz7XpMT6n
        rjN7TBH656fANRLjP5UqeqA=
X-Google-Smtp-Source: ABdhPJxugfWY0jf88JQ7B+wdQvMpJkmUKl2qk9Ih/jM6ZmeQU97dioXheSAakYLMsfZG/j5flckT3A==
X-Received: by 2002:a7b:ce94:: with SMTP id q20mr2854368wmj.83.1632497478333;
        Fri, 24 Sep 2021 08:31:18 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:18 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 03/27] dma-buf: add dma_resv selftest
Date:   Fri, 24 Sep 2021 17:30:49 +0200
Message-Id: <20210924153113.2159-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just exercising a very minor subset of the functionality, but already
proven useful.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Makefile      |   3 +-
 drivers/dma-buf/selftests.h   |   1 +
 drivers/dma-buf/st-dma-resv.c | 164 ++++++++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 drivers/dma-buf/st-dma-resv.c

diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
index 1ef021273a06..511805dbeb75 100644
--- a/drivers/dma-buf/Makefile
+++ b/drivers/dma-buf/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
 dmabuf_selftests-y := \
 	selftest.o \
 	st-dma-fence.o \
-	st-dma-fence-chain.o
+	st-dma-fence-chain.o \
+	st-dma-resv.o
 
 obj-$(CONFIG_DMABUF_SELFTESTS)	+= dmabuf_selftests.o
diff --git a/drivers/dma-buf/selftests.h b/drivers/dma-buf/selftests.h
index bc8cea67bf1e..97d73aaa31da 100644
--- a/drivers/dma-buf/selftests.h
+++ b/drivers/dma-buf/selftests.h
@@ -12,3 +12,4 @@
 selftest(sanitycheck, __sanitycheck__) /* keep first (igt selfcheck) */
 selftest(dma_fence, dma_fence)
 selftest(dma_fence_chain, dma_fence_chain)
+selftest(dma_resv, dma_resv)
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
new file mode 100644
index 000000000000..ea44769d058d
--- /dev/null
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+* Copyright © 2019 Intel Corporation
+*/
+
+//#include <linux/delay.h>
+//#include <linux/dma-fence.h>
+//#include <linux/kernel.h>
+//#include <linux/kthread.h>
+//#include <linux/sched/signal.h>
+
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/dma-resv.h>
+
+#include "selftest.h"
+
+static struct spinlock fence_lock;
+
+static const char *fence_name(struct dma_fence *f)
+{
+	return "selftest";
+}
+
+static const struct dma_fence_ops fence_ops = {
+	.get_driver_name = fence_name,
+	.get_timeline_name = fence_name,
+};
+
+static struct dma_fence *alloc_fence(void)
+{
+	struct dma_fence *f;
+
+	f = kmalloc(sizeof(*f), GFP_KERNEL);
+	if (!f)
+		return NULL;
+
+	dma_fence_init(f, &fence_ops, &fence_lock, 0, 0);
+	return f;
+}
+
+static int sanitycheck(void *arg)
+{
+	struct dma_fence *f;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_fence_signal(f);
+	dma_fence_put(f);
+	return 0;
+}
+
+static int test_excl_signaling(void *arg)
+{
+	struct dma_resv resv;
+	struct dma_fence *f;
+	int err = -EINVAL;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_resv_init(&resv);
+	dma_resv_add_excl_fence(&resv, f);
+	if (dma_resv_test_signaled(&resv, false)) {
+		pr_err("Resv unexpectedly signaled\n");
+		goto err_free;
+	}
+	dma_fence_signal(f);
+	if (!dma_resv_test_signaled(&resv, false)) {
+		pr_err("Resv not reporting signaled\n");
+		goto err_free;
+	}
+	err = 0;
+err_free:
+	dma_resv_fini(&resv);
+	dma_fence_put(f);
+	return err;
+}
+
+static int test_shared_signaling(void *arg)
+{
+	struct dma_resv resv;
+	struct dma_fence *f;
+	int err;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_resv_init(&resv);
+	err = dma_resv_reserve_shared(&resv, 1);
+	if (err) {
+		pr_err("Resv shared slot allocation failed\n");
+		goto err_free;
+	}
+
+	err = -EINVAL;
+	dma_resv_add_shared_fence(&resv, f);
+	if (dma_resv_test_signaled(&resv, true)) {
+		pr_err("Resv unexpectedly signaled\n");
+		goto err_free;
+	}
+	dma_fence_signal(f);
+	if (!dma_resv_test_signaled(&resv, true)) {
+		pr_err("Resv not reporting signaled\n");
+		goto err_free;
+	}
+	err = 0;
+err_free:
+	dma_resv_fini(&resv);
+	dma_fence_put(f);
+	return err;
+}
+
+static int test_excl_for_each(void *arg)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *f, *fence;
+	struct dma_resv resv;
+	int err;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_resv_init(&resv);
+	dma_resv_add_excl_fence(&resv, f);
+
+	err = -EINVAL;
+	dma_resv_for_each_fence(&cursor, &resv, false, fence) {
+		if (f != fence) {
+			pr_err("Unexpected fence\n");
+			goto err_free;
+		}
+		err = 0;
+	}
+	if (err) {
+		pr_err("No fence found\n");
+		goto err_free;
+	}
+	dma_fence_signal(f);
+	err = 0;
+err_free:
+	dma_resv_fini(&resv);
+	dma_fence_put(f);
+	return err;
+}
+
+int dma_resv(void)
+{
+	static const struct subtest tests[] = {
+		SUBTEST(sanitycheck),
+		SUBTEST(test_excl_signaling),
+		SUBTEST(test_shared_signaling),
+		SUBTEST(test_excl_for_each),
+	};
+
+	spin_lock_init(&fence_lock);
+	return subtests(tests, NULL);
+}
-- 
2.25.1

