Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358D29D213
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 16:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732762AbfHZO5k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 10:57:40 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46997 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732749AbfHZO5i (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 10:57:38 -0400
Received: by mail-wr1-f65.google.com with SMTP id z1so15631530wru.13
        for <linux-media@vger.kernel.org>; Mon, 26 Aug 2019 07:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GefcgZIGi5vsG6C57y1gbEiNAKDUmLjbeYvTQElZ2d8=;
        b=KD6ZJoDdrEtCWrNY63PfxzIIIL6WvSRgiwXrbfalOX3b9dnnCuHvAvBOFp/qfrDOI2
         hPPtIG+tZ6LQbuE88P5NVbYdNcVU0Zf2ZLkpfvvGGU8znDJtfQ8N1wsODNVAOC3udnwp
         2271dlAXstMfuavAKkKnBfQkvH7gavmveIXKMBnSmc2dMmkHpldg0XPAlk87bcdXawKd
         XmCduwZ1z1gou8+MuqLoha9FJdfTucALI5XougmHkg+fAKj6ydEn94rc+JjB1dJsD06M
         VVfyzY7Xdk1JbJDgFChRXZOhZeRwo+nB8Q62VT2CrWYJtPTDue+bWCvfoCI7ApCJQb2N
         l62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GefcgZIGi5vsG6C57y1gbEiNAKDUmLjbeYvTQElZ2d8=;
        b=kE4velZEiXt+uiCfxFrrEO2fUv+ifIX3tBc4Eawzc8cBZMr3edoden/aviMWmcjvl7
         zE8UW91+E14tBcFGHzChFkzcw636TBeTdbhTRsgL+VXL02wh2YIXRSQ9AOuqFFqEe+d8
         boocIfXQtMJUm6EnLWb2IvYb1kO+3BwyBjqwUCfQjUEr/NGG71ogBIfxaXb0G8n5Uit1
         L7MeZKZyqD4c2xM9fBTi+jEs49Y0Q3zoT8JQ9KlgYRiZe2XsCXTQbV9l8F954yEuFrg5
         Zhu9yOqYmmTyBpA6SmdNsseZKJ/rsil6UFMU1PgczdmgzQjFjDTT/dAxdzM9tfsqRzzn
         HUuA==
X-Gm-Message-State: APjAAAVA3Hi53jPvRCiONNidbgXYjIA3HOFUPEhSkOULJUkqjzmftrHx
        nmzqXkpCHcweqPLvC8kspyE=
X-Google-Smtp-Source: APXvYqxbtIvVlf0LU8sBoH1O7i1a5htrmWUBLD1TBbgGDi1pOovTAaMRMU/7OanU/acQYDQTx8LqPw==
X-Received: by 2002:adf:fc87:: with SMTP id g7mr22435677wrr.319.1566831456491;
        Mon, 26 Aug 2019 07:57:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
        by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 07:57:36 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 4/9] dma-buf: add dma_fence_array_recycle v2
Date:   Mon, 26 Aug 2019 16:57:26 +0200
Message-Id: <20190826145731.1725-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Try to recycle an dma_fence_array object by dropping the last
reference to it without freeing it.

v2: fix the WARN_ON_ONCE recycle test after rebase

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 28 ++++++++++++++++++++++++++++
 include/linux/dma-fence-array.h   |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 4664607f0abc..ea7713b40514 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -198,6 +198,34 @@ void dma_fence_array_init(struct dma_fence_array *array, u64 context,
 }
 EXPORT_SYMBOL(dma_fence_array_init);
 
+/**
+ * dma_fence_array_reuse - dummy for dma_fence_array_recycle
+ */
+static void dma_fence_array_reuse(struct kref *kref)
+{
+	struct dma_fence_array *array = container_of(kref, typeof(*array),
+						     base.refcount);
+
+	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &array->base.flags))
+		WARN_ON_ONCE(!list_empty(&array->base.cb_list));
+}
+
+/**
+ * dma_fence_array_try_reuse - try to reuse a dma_fence_array object
+ * @array: array which we should try to reuse
+ *
+ * Try to drop the last reference to an dma_fence_array and so allow it to be
+ * reused.
+ *
+ * Returns true if this was the last reference then caller can reuse the array.
+ * In this case the array is reset into a state where it can be used with
+ * dma_fence_array_init again.
+ */
+bool dma_fence_array_recycle(struct dma_fence_array *array)
+{
+	return kref_put(&array->base.refcount, dma_fence_array_reuse);
+}
+
 /**
  * dma_fence_array_free - free a dma_fence_array object
  * @array: the object to free
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index be85c06b524d..35d1d1e7c93b 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -93,6 +93,7 @@ struct dma_fence_array *dma_fence_array_alloc(int num_fences,
 					      struct dma_fence **fences);
 void dma_fence_array_init(struct dma_fence_array *array, u64 context,
 			  unsigned int seqno, bool signal_on_any);
+bool dma_fence_array_recycle(struct dma_fence_array *array);
 void dma_fence_array_free(struct dma_fence_array *array);
 
 /**
-- 
2.17.1

