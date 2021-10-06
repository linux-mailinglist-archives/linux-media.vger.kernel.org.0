Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77052423DCC
	for <lists+linux-media@lfdr.de>; Wed,  6 Oct 2021 14:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238379AbhJFMiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 08:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbhJFMiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 08:38:05 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF97C061749
        for <linux-media@vger.kernel.org>; Wed,  6 Oct 2021 05:36:13 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r7so8330022wrc.10
        for <linux-media@vger.kernel.org>; Wed, 06 Oct 2021 05:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89OOgwIjAdHEsJJAQ88awEfVzr+pvOl73kjL6eCX7Ww=;
        b=qh84H34U5hLSCDUP73mzuGZ0fIEmj0EMWOyrmqZPfZpFuaBbuwm4HGTDuZ+J/aAyxN
         TmM68rbq2cGiZuCBAulHC/qv2Cems1obpGqeS4b8AiXCaWQOLCsp5l7XXQK6irbFf96B
         wSuLfLujm6L3zDv8bw/l3sMw31PwlHl4LlsFUAHKzDGIw9m2FjAq7aS79VgjyOPH5qxv
         wOnL6trGQMsigOMISYeThR/rnlezJccu9fpeM0OM/K0DEpzx19TZWTVUS9ITrsCwiH+D
         LLDy0/O/Td1qVPYC5socDBsIhmLRFdSM5FVM/P8AWVGVusT/ex6+csso6BRdk0xVrZsB
         qX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89OOgwIjAdHEsJJAQ88awEfVzr+pvOl73kjL6eCX7Ww=;
        b=QIdBL1U7YAS+2z3fBIHiJwuip2b/9ZEiTykhoLAsJu2y12FsVT7bcYHR0FlLosc39j
         /wHfFwjNfYTf1t0b6ZtbI53UQdhFpvHa0mlOqJPS28d9HrSFFXO9XQ/aVekbQ8984dAC
         Davc5ohegBKA+ZnY0GD01E+2CJboQt67lnY71kkRecQO3Oatch83d07Jibzmpe1VYX8I
         qzOrOjGVayWgTPZKy75JgomLXb9Ge4YFb7MLtO0EhbHjhVfH87vtF16FjA02eo6M35h6
         ksUhLSToVCH3jQvLgQwARU55qmjU8lhKqBYjy3nJ9Cw/oneMX5+l9ZB3eAo2mongOf9K
         xwBQ==
X-Gm-Message-State: AOAM5329lI/YrCjcMAd4Mdk7NzEEKmg7jVEfOv0+Zg2h7Jm34Rvw1Qt3
        rxwKnp/BaqH7UHVpyNcWELY=
X-Google-Smtp-Source: ABdhPJzSJnI5oyhF4GY/Mg9pp/fHbN3cI0NXNZ0vDmZgpFuyWCgu+twOsdBPRFrH3we+AaP5BJAYqg==
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr9951186wme.127.1633523772342;
        Wed, 06 Oct 2021 05:36:12 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l124sm5194770wml.8.2021.10.06.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 05:36:11 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        daniel@ffwll.ch
Cc:     tvrtko.ursulin@linux.intel.com
Subject: [PATCH 2/2] dma-buf: add dma_resv selftest v3
Date:   Wed,  6 Oct 2021 14:36:09 +0200
Message-Id: <20211006123609.2026-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006123609.2026-1-christian.koenig@amd.com>
References: <20211006123609.2026-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just exercising a very minor subset of the functionality, but already
proven useful.

v2: add missing locking
v3: some more cleanup and consolidation, add unlocked test as well

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Makefile      |   3 +-
 drivers/dma-buf/selftests.h   |   1 +
 drivers/dma-buf/st-dma-resv.c | 282 ++++++++++++++++++++++++++++++++++
 3 files changed, 285 insertions(+), 1 deletion(-)
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
index 000000000000..50d3791ccb8c
--- /dev/null
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -0,0 +1,282 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+* Copyright © 2019 Intel Corporation
+* Copyright © 2021 Advanced Micro Devices, Inc.
+*/
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
+	struct dma_resv resv;
+	struct dma_fence *f;
+	int r;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_fence_signal(f);
+	dma_fence_put(f);
+
+	dma_resv_init(&resv);
+	r = dma_resv_lock(&resv, NULL);
+	if (r)
+		pr_err("Resv locking failed\n");
+	else
+		dma_resv_unlock(&resv);
+	dma_resv_fini(&resv);
+	return r;
+}
+
+static int test_signaling(void *arg, bool shared)
+{
+	struct dma_resv resv;
+	struct dma_fence *f;
+	int r;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_resv_init(&resv);
+	r = dma_resv_lock(&resv, NULL);
+	if (r) {
+		pr_err("Resv locking failed\n");
+		goto err_free;
+	}
+
+	if (shared) {
+		r = dma_resv_reserve_shared(&resv, 1);
+		if (r) {
+			pr_err("Resv shared slot allocation failed\n");
+			goto err_unlock;
+		}
+
+		dma_resv_add_shared_fence(&resv, f);
+	} else {
+		dma_resv_add_excl_fence(&resv, f);
+	}
+
+	if (dma_resv_test_signaled(&resv, shared)) {
+		pr_err("Resv unexpectedly signaled\n");
+		r = -EINVAL;
+		goto err_unlock;
+	}
+	dma_fence_signal(f);
+	if (!dma_resv_test_signaled(&resv, shared)) {
+		pr_err("Resv not reporting signaled\n");
+		r = -EINVAL;
+		goto err_unlock;
+	}
+err_unlock:
+	dma_resv_unlock(&resv);
+err_free:
+	dma_resv_fini(&resv);
+	dma_fence_put(f);
+	return r;
+}
+
+static int test_excl_signaling(void *arg)
+{
+	return test_signaling(arg, false);
+}
+
+static int test_shared_signaling(void *arg)
+{
+	return test_signaling(arg, true);
+}
+
+static int test_for_each(void *arg, bool shared)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *f, *fence;
+	struct dma_resv resv;
+	int r;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_resv_init(&resv);
+	r = dma_resv_lock(&resv, NULL);
+	if (r) {
+		pr_err("Resv locking failed\n");
+		goto err_free;
+	}
+
+	if (shared) {
+		r = dma_resv_reserve_shared(&resv, 1);
+		if (r) {
+			pr_err("Resv shared slot allocation failed\n");
+			goto err_unlock;
+		}
+
+		dma_resv_add_shared_fence(&resv, f);
+	} else {
+		dma_resv_add_excl_fence(&resv, f);
+	}
+
+	r = -ENOENT;
+	dma_resv_for_each_fence(&cursor, &resv, shared, fence) {
+		if (!r) {
+			pr_err("More than one fence found\n");
+			r = -EINVAL;
+			goto err_unlock;
+		}
+		if (f != fence) {
+			pr_err("Unexpected fence\n");
+			r = -EINVAL;
+			goto err_unlock;
+		}
+		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
+			pr_err("Unexpected fence usage\n");
+			r = -EINVAL;
+			goto err_unlock;
+		}
+		r = 0;
+	}
+	if (r) {
+		pr_err("No fence found\n");
+		goto err_unlock;
+	}
+	dma_fence_signal(f);
+err_unlock:
+	dma_resv_unlock(&resv);
+err_free:
+	dma_resv_fini(&resv);
+	dma_fence_put(f);
+	return r;
+}
+
+static int test_excl_for_each(void *arg)
+{
+	return test_for_each(arg, false);
+}
+
+static int test_shared_for_each(void *arg)
+{
+	return test_for_each(arg, false);
+}
+
+static int test_for_each_unlocked(void *arg, bool shared)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *f, *fence;
+	struct dma_resv resv;
+	int r;
+
+	f = alloc_fence();
+	if (!f)
+		return -ENOMEM;
+
+	dma_resv_init(&resv);
+	r = dma_resv_lock(&resv, NULL);
+	if (r) {
+		pr_err("Resv locking failed\n");
+		goto err_free;
+	}
+
+	if (shared) {
+		r = dma_resv_reserve_shared(&resv, 1);
+		if (r) {
+			pr_err("Resv shared slot allocation failed\n");
+			dma_resv_unlock(&resv);
+			goto err_free;
+		}
+
+		dma_resv_add_shared_fence(&resv, f);
+	} else {
+		dma_resv_add_excl_fence(&resv, f);
+	}
+	dma_resv_unlock(&resv);
+
+	r = -ENOENT;
+	dma_resv_iter_begin(&cursor, &resv, shared);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (!r) {
+			dma_resv_iter_end(&cursor);
+			pr_err("More than one fence found\n");
+			r = -EINVAL;
+			goto err_free;
+		}
+		if (f != fence) {
+			dma_resv_iter_end(&cursor);
+			pr_err("Unexpected fence\n");
+			r = -EINVAL;
+			goto err_free;
+		}
+		if (dma_resv_iter_is_exclusive(&cursor) != !shared) {
+			dma_resv_iter_end(&cursor);
+			pr_err("Unexpected fence usage\n");
+			r = -EINVAL;
+			goto err_free;
+		}
+		r = 0;
+	}
+	dma_resv_iter_end(&cursor);
+	if (r) {
+		pr_err("No fence found\n");
+		goto err_free;
+	}
+	dma_fence_signal(f);
+err_free:
+	dma_resv_fini(&resv);
+	dma_fence_put(f);
+	return r;
+}
+
+static int test_excl_for_each_unlocked(void *arg)
+{
+	return test_for_each_unlocked(arg, false);
+}
+
+static int test_shared_for_each_unlocked(void *arg)
+{
+	return test_for_each_unlocked(arg, true);
+}
+
+int dma_resv(void)
+{
+	static const struct subtest tests[] = {
+		SUBTEST(sanitycheck),
+		SUBTEST(test_excl_signaling),
+		SUBTEST(test_shared_signaling),
+		SUBTEST(test_excl_for_each),
+		SUBTEST(test_shared_for_each),
+		SUBTEST(test_excl_for_each_unlocked),
+		SUBTEST(test_shared_for_each_unlocked),
+	};
+
+	spin_lock_init(&fence_lock);
+	return subtests(tests, NULL);
+}
-- 
2.25.1

