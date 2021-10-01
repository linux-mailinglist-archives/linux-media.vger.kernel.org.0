Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA97B41EA56
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353348AbhJAKID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbhJAKIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:02 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E9EC06177B
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:17 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x20so14589231wrg.10
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lj2Yv/wWR6TC7dOizEI5QN7SBISIYTE1BHrEKqHlUyU=;
        b=F1cew7aZEUucNVVNFZlNfSBSfXsZ8gbknKuLsr23knf9WXCaxF7SSM845G0YLqkIxP
         TFPr0rb/+iezQtLlEYcm/bci1worOBdkAy7AmYGc0xhQJzZWgF9vQeIj1+sb3Qe/uFYp
         pUhQYXiWK3CJneoQbRLveMWgZ5BlgudG604+Rl9I7IFeAbufJpa98KtU19i9dMNDoQfd
         AAphbF++RL5oETTWkFDFTlpuO7+tmKU21/jcTpKyF9uEMu7nr7z/MIlsjhHHTGnyAqqS
         VDzTF28/wAFWxRm58SHZSH+O5oYk2JFTnP6C2/JQzB9KEJ88IVwDLYlT4yc4PTpFORg9
         CciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lj2Yv/wWR6TC7dOizEI5QN7SBISIYTE1BHrEKqHlUyU=;
        b=RpjPd32QGwT3uca4dwhXxvLC7wcXdCh1uvASooMaKE0vCbK6eYZ2N1VKDmSzR92oes
         gi5jyimRbnlLLOuwTR0DDESk/u5EHIso+3PZXExRLXlEwfx9pP5AlmFmCMqadB7F/lr5
         dc6hufY3du+iwXiphYNuUQh3yBgGl7vKzYHq7M7I2yXsu9FQZ7R6PZzjaG435lUbkTp+
         yI5+gHELnhOpw6/DWq6BbnD3FF9+p+tpptG+EZFuTT8KBp1rEBWa3xMsf5926pJB2Ycq
         k5Tz5QLRiWlaCCQygCEJHNFWtQbsXOz2xlLoOLiRtQORkQbGEMU9AGnNiaNowpEg9a66
         g1og==
X-Gm-Message-State: AOAM531Jf2qkVO/ZucFzX4qWLKFZhATyqW08Lqt/B6Q4VeON4Pnq8Msy
        3xhBxXyzsnAdu8ONgOdlYJI=
X-Google-Smtp-Source: ABdhPJwF4w8sP02fwa4GAQ5OjEFRtUPoYdMOh1BHF+3PWJhYQbxaJOfIm2jrfhL09Kz2OJkbgOazRA==
X-Received: by 2002:adf:fec6:: with SMTP id q6mr11075927wrs.122.1633082776331;
        Fri, 01 Oct 2021 03:06:16 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:15 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 03/28] dma-buf: add dma_resv selftest
Date:   Fri,  1 Oct 2021 12:05:45 +0200
Message-Id: <20211001100610.2899-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

