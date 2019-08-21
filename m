Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E58A97972
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbfHUMcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:32:06 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38796 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbfHUMcG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:32:06 -0400
Received: by mail-wm1-f65.google.com with SMTP id m125so1957430wmm.3
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MZJwoU8EhjpqcfOVk/0UG/4FrwiANEoCi8kk0rWYdbg=;
        b=d078rngoBxhERwo8VvL6b5SgmaYW+//qijiLogHL72rlIO5Pm8L7LSMSx6GyJmF65k
         C8q7M9/DvhYezkDiP+SWBJ8RFefSWz2sID92nlUbQbr0g/tIbvWM85tcR4tJRHRj0z+P
         G8/B2D8rkSeYsaVSE6eN1CDNN/EKJBfbXT157FpigZPLtXKpJSTh8lXKfpk0due1MkVA
         Sb0OvgvGbCbxryZ7/dOHetHUfO1thPixmEfzgrWwYthNgNbG1A6uUPVdDOI9HhK7UNHU
         7aGrHm+4UTnRPa/iyfBS5TNBpPntvDoY1kO3T7ligHPmU54CgUdbZ2LygxEEpcpDlpiz
         VYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MZJwoU8EhjpqcfOVk/0UG/4FrwiANEoCi8kk0rWYdbg=;
        b=BTd2pmzwwKYplq+Pr7QJd6U+P89TCqE898dLmhi4cCSFq2g+bSEP4l0gnnmcjqd15o
         5lDlatMMYtp93MwUp6HiMq34rS/qp9jhaokvjXv04xTh155D4POe+GP5j6zm+RB+yzKM
         B5Bm6k35HWl0tOKxkk3HQ1nTr3Wje7iaKw3sxN+PpkYAgBBnFkFzgFkxBs0M85W2R8Wi
         qRn6sR2SChBnCBYaGp4ddIdUBPhLympuZDxBaReaM0jeC/xpjj7GJ6gOsUYrZP/B38iD
         vsNZN4tUfCkVEs24xcd/v2VoBCmAgVPqg8IwSzIs68gZHn7aSMDWNOBpXHy5lnbx59sP
         5/yQ==
X-Gm-Message-State: APjAAAV6MAQmt2jEM8epRK73SD1isVJB4XAXex6wSeWIqSFJzQUFBxOB
        DDcaDVZU+7p1x3lHAhseJ/0=
X-Google-Smtp-Source: APXvYqwZ8Gd/KOK6OMmUJsHhzoQ82fdVwJdWeRR2KTsdPwyQ4ORWAL/wvp+i3s7QDG9IRFkvzuVI5Q==
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr5415866wmc.87.1566390723528;
        Wed, 21 Aug 2019 05:32:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
        by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:32:00 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/10] dma-buf/resv: add other operations
Date:   Wed, 21 Aug 2019 14:31:47 +0200
Message-Id: <20190821123147.110736-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Additional to readers and writers add another class of operations
which never participate in implicit synchronization.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 27 ++++++++++++++++++++++++---
 include/linux/dma-resv.h   |  2 ++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 8ef7dbc7fd8e..c6dd6c36dba2 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -280,6 +280,7 @@ void dma_resv_init(struct dma_resv *obj)
 
 	dma_resv_fences_init(&obj->writers);
 	dma_resv_fences_init(&obj->readers);
+	dma_resv_fences_init(&obj->others);
 }
 EXPORT_SYMBOL(dma_resv_init);
 
@@ -295,6 +296,7 @@ void dma_resv_fini(struct dma_resv *obj)
 	 */
 	dma_resv_fences_fini(&obj->writers);
 	dma_resv_fences_fini(&obj->readers);
+	dma_resv_fences_fini(&obj->others);
 	ww_mutex_destroy(&obj->lock);
 }
 EXPORT_SYMBOL(dma_resv_fini);
@@ -334,6 +336,10 @@ void dma_resv_prune_fences(struct dma_resv *obj)
 	fence = dma_resv_fences_deref(obj, &obj->readers);
 	if (dma_fence_is_signaled(fence))
 		dma_resv_fences_set(obj, &obj->readers, NULL);
+
+	fence = dma_resv_fences_deref(obj, &obj->others);
+	if (dma_fence_is_signaled(fence))
+		dma_resv_fences_set(obj, &obj->others, NULL);
 }
 EXPORT_SYMBOL(dma_resv_prune_fences);
 
@@ -346,17 +352,19 @@ EXPORT_SYMBOL(dma_resv_prune_fences);
 */
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
 {
-	struct dma_fence *writers, *readers;
+	struct dma_fence *writers, *readers, *others;
 
 	dma_resv_assert_held(dst);
 
 	rcu_read_lock();
 	writers = dma_resv_fences_get_rcu(&src->writers);
 	readers = dma_resv_fences_get_rcu(&src->readers);
+	others = dma_resv_fences_get_rcu(&src->others);
 	rcu_read_unlock();
 
 	dma_resv_fences_set(dst, &dst->writers, writers);
 	dma_resv_fences_set(dst, &dst->readers, readers);
+	dma_resv_fences_set(dst, &dst->readers, others);
 
 	return 0;
 }
@@ -440,12 +448,13 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 			       bool wait_all, bool intr,
 			       unsigned long timeout)
 {
-	struct dma_fence *writers, *readers;
+	struct dma_fence *writers, *readers, *others;
 	long ret = timeout ? timeout : 1;
 
 	rcu_read_lock();
 	writers = dma_resv_fences_get_rcu(&obj->writers);
 	readers = dma_resv_fences_get_rcu(&obj->readers);
+	others = dma_resv_fences_get_rcu(&obj->others);
 	rcu_read_unlock();
 
 	if (wait_all && readers) {
@@ -454,12 +463,19 @@ long dma_resv_wait_timeout_rcu(struct dma_resv *obj,
 			goto out;
 	}
 
+	if (wait_all && others) {
+		ret = dma_fence_wait_timeout(others, intr, ret);
+		if (ret <= 0)
+			goto out;
+	}
+
 	if (writers)
 		ret = dma_fence_wait_timeout(writers, intr, ret);
 
 out:
 	dma_fence_put(writers);
 	dma_fence_put(readers);
+	dma_fence_put(others);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_rcu);
@@ -476,12 +492,13 @@ EXPORT_SYMBOL_GPL(dma_resv_wait_timeout_rcu);
  */
 bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 {
-	struct dma_fence *writers, *readers;
+	struct dma_fence *writers, *readers, *others;
 	bool ret = true;
 
 	rcu_read_lock();
 	writers = dma_resv_fences_get_rcu(&obj->writers);
 	readers = dma_resv_fences_get_rcu(&obj->readers);
+	others = dma_resv_fences_get_rcu(&obj->others);
 	rcu_read_unlock();
 
 	if (writers)
@@ -490,8 +507,12 @@ bool dma_resv_test_signaled_rcu(struct dma_resv *obj, bool test_all)
 	if (test_all && readers)
 		ret &= dma_fence_is_signaled(readers);
 
+	if (test_all && others)
+		ret &= dma_fence_is_signaled(others);
+
 	dma_fence_put(writers);
 	dma_fence_put(readers);
+	dma_fence_put(others);
 
 	return ret;
 }
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 72c3c4f99711..bf8d21cc7720 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -76,12 +76,14 @@ void dma_resv_fences_commit(struct dma_resv *obj,
  * @seq: sequence count for managing RCU read-side synchronization
  * @writers: array of write operations for implicit sync
  * @readers: array of read operations for implicit sync
+ * @others: other operations not participating in implicit sync
  */
 struct dma_resv {
 	struct ww_mutex lock;
 
 	struct dma_resv_fences writers;
 	struct dma_resv_fences readers;
+	struct dma_resv_fences others;
 };
 
 #define dma_resv_held(obj) lockdep_is_held(&(obj)->lock.base)
-- 
2.17.1

