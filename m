Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F81497966
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 14:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbfHUMby (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 08:31:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33204 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbfHUMby (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 08:31:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id p77so4680261wme.0
        for <linux-media@vger.kernel.org>; Wed, 21 Aug 2019 05:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gEP1Eqz1ufX2Zh9MidlHV8n+9w6C1Ut7DiH3LFU9MtI=;
        b=DJUlo0KYyigUgu1cb+IKQJvlF6QOYqZRpUesSagcWxBp1taRWMilO/sBy9nxmsInwk
         ZwQbMqGGIMLB1GmdlMG27EiLtmBT2fbxIUQs/t5/8t9Zo3vnkvyzb/g+RgfCmBB04Uha
         bti2qtG25M1Hc35obkEIgSLV2dIf6rxXGLbz3+VT9L0Y9axTGNU3BdR4PtqA+mn0unuI
         JiZOPjeys2y6iccUpEjiWMTKYKC2OJq/MyofaQtH85tsI4tjBBsXAkzxnXDvdLQ1iuRG
         oaUfqx+qtE2F6jMZZoiLkLZERx0UeikX3sLO7z+uRlN1LctciD3PnTjkakGtUzI3yJC1
         X1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gEP1Eqz1ufX2Zh9MidlHV8n+9w6C1Ut7DiH3LFU9MtI=;
        b=UMTzDYtOcvtAI/DWNaOB4q2n0qexUG7p8SW1WsmGfu0e4+YGLxBY3bzGmlElWXGPDj
         ZMCgaIE7AQn22b8b86cMDl2qDVaDI5RWCZXwmgK8sD6CulediUQw3/nFLTUa1irJ6U79
         QPXpqFK6ejVtHAWUVtyNrE0FCGBbESnEgBA3VQ0OhX6fY39+1oUVXQq7SvZ2h/+utzoW
         qQwupnNpdSoIpurHXnz5r4Rfdd7pn4tQDmgNp52bwMeca4VNPZ4/co61CXYH/wmZo69G
         +RBPB4lnyZpvGr2Lw5omG9zgcgDWme7sG7FV51VgYwLmKFItqsjCbJo0xvGA0lRr0zZF
         o9ww==
X-Gm-Message-State: APjAAAV7Dp9+edyjfacbumepgwczUOORC9GRybc7hU+5z/9mfr6pRPCH
        INC/AN8TkSG7U6ynyBysZJ8=
X-Google-Smtp-Source: APXvYqwx9pX44R+PFq43qthQnp/yMbCW+JvAOSh2ZSqYDCJ44j5cH765sJSCBDbSneJzpLWvbFGy1Q==
X-Received: by 2002:a05:600c:145:: with SMTP id w5mr5821281wmm.75.1566390711937;
        Wed, 21 Aug 2019 05:31:51 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
        by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 05:31:51 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
        daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/10] dma-buf: add dma_fence_array_recycle
Date:   Wed, 21 Aug 2019 14:31:40 +0200
Message-Id: <20190821123147.110736-4-christian.koenig@amd.com>
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

Try to recycle an dma_fence_array object by dropping the last
reference to it without freeing it.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 27 +++++++++++++++++++++++++++
 include/linux/dma-fence-array.h   |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index e82f30551aa1..314cf0e881d9 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -188,6 +188,33 @@ void dma_fence_array_init(struct dma_fence_array *array, u64 context,
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
+	WARN_ON_ONCE(!list_empty(&array->base.cb_list));
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

