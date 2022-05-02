Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF06F517498
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348468AbiEBQl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386376AbiEBQlR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:17 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C0711A37
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:42 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id v12so20216751wrv.10
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=luXkB4nWXeAscrwTivcA3+3hC+4sNV5dGxBhEUAh3ZU=;
        b=k0XTUm0RlYmuvq1Vpcu2zWJ5tdQzQuOA+T08xmE0ef/5Dyc0xYC6BQAX34i28BS1Z8
         6XGRhh7G2F22HV+0FPj/JcbDmACUCgXPkrEdo3I9NWjw4bA29u96MPyVvSoRzYdx1rBX
         gSWXdr9puipmo5tWtuIreVuPGd8eYr+NO6ZdUxIRuDfe4piN9qo4yhufC0sCs6VtwARK
         tYH/gsiPCBMv8t8xXv2T8wRxDCKJnpAk6UnCuya2Mu/feqUYuoJeALg8waJFYxAjBFWX
         iVqkjS9lxfi2YWQEE4sgHujeMU83XQ+HkhOs3s66prDHuhTyV2B0iquM7AXw+g3L66z2
         +Dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=luXkB4nWXeAscrwTivcA3+3hC+4sNV5dGxBhEUAh3ZU=;
        b=2Q2hl2LzITdZs4vk9SR0sk/U6M/cEGZXmmO/BBYz/Lt1W6ywK+V4av/gL8zeq7ySPB
         pf1cJxF/mfJOyRHvoYUGkEnMI0ApAWNE+vl26kuqIHqvkgVgLaobC4JwopF/Fkoubly3
         SmXuq73U6/BH3otYs7OUZ04T6p2qU/w85lDuJj/WVLSU9wvtayskJAni98VMqPmhQKo/
         C3RAc7kCZPm9fi3EjLdmN79gAgfxFIrLhBmjPg4EK+oadLrgGg7vMi1pvArRGZ+sGU5d
         r9Li/XQqUzo5MJY8M4Sf/pDDAtvO120wdAvLSQLlo8XF5J4TJ7epYoownZKCCvddg5jk
         hnjQ==
X-Gm-Message-State: AOAM531/8Ylm3CP97WjvtKPMRnunQkoIq8SbuHhzdQnjmuU5iGOhWbd0
        feSTyPK/1GRLDGOgvIb3BfM=
X-Google-Smtp-Source: ABdhPJwFAgphDT678QEW7VWXj8k6i1GwEjBCaYDNGAPv6oGS3glcX9En450Rka0fCDvCp7Ve13HMwA==
X-Received: by 2002:adf:d1e9:0:b0:20c:6c76:14d5 with SMTP id g9-20020adfd1e9000000b0020c6c7614d5mr2360003wrd.375.1651509460622;
        Mon, 02 May 2022 09:37:40 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:40 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
        skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
        sumit.semwal@linaro.org, gustavo@padovan.org,
        Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Cc:     =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH 09/15] dma-buf/sync_file: add user fence support
Date:   Mon,  2 May 2022 18:37:16 +0200
Message-Id: <20220502163722.3957-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Keep user fences separate from normal fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/sync_file.c | 82 +++++++++++++++++++++++++++++++++----
 include/linux/sync_file.h   |  4 +-
 2 files changed, 76 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
index fe149d7e3ce2..630472d79dc1 100644
--- a/drivers/dma-buf/sync_file.c
+++ b/drivers/dma-buf/sync_file.c
@@ -70,7 +70,13 @@ struct sync_file *sync_file_create(struct dma_fence *fence)
 	if (!sync_file)
 		return NULL;
 
-	sync_file->fence = dma_fence_get(fence);
+	if (test_bit(DMA_FENCE_FLAG_USER, &fence->flags)) {
+		sync_file->fence = dma_fence_get_stub(false);
+		sync_file->user_fence = dma_fence_get(fence);
+	} else {
+		sync_file->fence = dma_fence_get(fence);
+		sync_file->user_fence = dma_fence_get_stub(true);
+	}
 
 	return sync_file;
 }
@@ -116,6 +122,28 @@ struct dma_fence *sync_file_get_fence(int fd)
 }
 EXPORT_SYMBOL(sync_file_get_fence);
 
+/**
+ * sync_file_get_user_fence - get user fence related to the sync_file fd
+ * @fd:		sync_file fd to get the fence from
+ *
+ * Ensures @fd references a valid sync_file and returns an user fence reference
+ * which represents all fence in the sync_file. On error NULL is returned.
+ */
+struct dma_fence *sync_file_get_user_fence(int fd)
+{
+	struct sync_file *sync_file;
+	struct dma_fence *fence;
+
+	sync_file = sync_file_fdget(fd);
+	if (!sync_file)
+		return NULL;
+
+	fence = dma_fence_merge(sync_file->fence, sync_file->user_fence);
+	fput(sync_file->file);
+	return fence;
+}
+EXPORT_SYMBOL(sync_file_get_user_fence);
+
 /**
  * sync_file_get_name - get the name of the sync_file
  * @sync_file:		sync_file to get the fence from
@@ -136,6 +164,9 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 	} else {
 		struct dma_fence *fence = sync_file->fence;
 
+		if (dma_fence_is_signaled(fence))
+			fence = sync_file->user_fence;
+
 		snprintf(buf, len, "%s-%s%llu-%lld",
 			 fence->ops->get_driver_name(fence),
 			 fence->ops->get_timeline_name(fence),
@@ -159,21 +190,32 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
 static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
 					 struct sync_file *b)
 {
+	struct dma_fence *fence, *user_fence;
 	struct sync_file *sync_file;
-	struct dma_fence *fence;
 
 	sync_file = sync_file_alloc();
 	if (!sync_file)
 		return NULL;
 
 	fence = dma_fence_merge(a->fence, b->fence);
-	if (!fence) {
-		fput(sync_file->file);
-		return NULL;
-	}
+	if (!fence)
+		goto error_fput;
+
+	user_fence = dma_fence_merge(a->user_fence, b->user_fence);
+	if (!user_fence)
+		goto error_put_fence;
+
 	sync_file->fence = fence;
+	sync_file->user_fence = user_fence;
 	strlcpy(sync_file->user_name, name, sizeof(sync_file->user_name));
 	return sync_file;
+
+error_put_fence:
+	dma_fence_put(fence);
+
+error_fput:
+	fput(sync_file->file);
+	return NULL;
 }
 
 static int sync_file_release(struct inode *inode, struct file *file)
@@ -183,6 +225,7 @@ static int sync_file_release(struct inode *inode, struct file *file)
 	if (test_bit(POLL_ENABLED, &sync_file->flags))
 		dma_fence_remove_callback(sync_file->fence, &sync_file->cb);
 	dma_fence_put(sync_file->fence);
+	dma_fence_put(sync_file->user_fence);
 	kfree(sync_file);
 
 	return 0;
@@ -191,17 +234,25 @@ static int sync_file_release(struct inode *inode, struct file *file)
 static __poll_t sync_file_poll(struct file *file, poll_table *wait)
 {
 	struct sync_file *sync_file = file->private_data;
+	int ret;
 
 	poll_wait(file, &sync_file->wq, wait);
 
 	if (list_empty(&sync_file->cb.node) &&
 	    !test_and_set_bit(POLL_ENABLED, &sync_file->flags)) {
-		if (dma_fence_add_callback(sync_file->fence, &sync_file->cb,
-					   fence_check_cb_func) < 0)
+		ret = dma_fence_add_callback(sync_file->fence, &sync_file->cb,
+					     fence_check_cb_func);
+		if (ret) {
+			ret = dma_fence_add_callback(sync_file->user_fence,
+						     &sync_file->cb,
+						     fence_check_cb_func);
+		}
+		if (ret)
 			wake_up_all(&sync_file->wq);
 	}
 
-	return dma_fence_is_signaled(sync_file->fence) ? EPOLLIN : 0;
+	return (dma_fence_is_signaled(sync_file->fence) &&
+		dma_fence_is_signaled(sync_file->user_fence)) ? EPOLLIN : 0;
 }
 
 static long sync_file_ioctl_merge(struct sync_file *sync_file,
@@ -299,6 +350,8 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
 	num_fences = 0;
 	dma_fence_unwrap_for_each(fence, &iter, sync_file->fence)
 		++num_fences;
+	dma_fence_unwrap_for_each(fence, &iter, sync_file->user_fence)
+		++num_fences;
 
 	/*
 	 * Passing num_fences = 0 means that userspace doesn't want to
@@ -307,7 +360,12 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
 	 * info->num_fences.
 	 */
 	if (!info.num_fences) {
+		int status;
+
 		info.status = dma_fence_get_status(sync_file->fence);
+		status = dma_fence_get_status(sync_file->user_fence);
+		if (!info.status)
+			info.status = status;
 		goto no_fences;
 	} else {
 		info.status = 1;
@@ -328,6 +386,12 @@ static long sync_file_ioctl_fence_info(struct sync_file *sync_file,
 		status = sync_fill_fence_info(fence, &fence_info[num_fences++]);
 		info.status = info.status <= 0 ? info.status : status;
 	}
+	dma_fence_unwrap_for_each(fence, &iter, sync_file->user_fence) {
+		int status;
+
+		status = sync_fill_fence_info(fence, &fence_info[num_fences++]);
+		info.status = info.status <= 0 ? info.status : status;
+	}
 
 	if (copy_to_user(u64_to_user_ptr(info.sync_fence_info), fence_info,
 			 size)) {
diff --git a/include/linux/sync_file.h b/include/linux/sync_file.h
index 790ca021203a..14aff1a4ee75 100644
--- a/include/linux/sync_file.h
+++ b/include/linux/sync_file.h
@@ -50,13 +50,15 @@ struct sync_file {
 	unsigned long		flags;
 
 	struct dma_fence	*fence;
-	struct dma_fence_cb cb;
+	struct dma_fence	*user_fence;
+	struct dma_fence_cb	cb;
 };
 
 #define POLL_ENABLED 0
 
 struct sync_file *sync_file_create(struct dma_fence *fence);
 struct dma_fence *sync_file_get_fence(int fd);
+struct dma_fence *sync_file_get_user_fence(int fd);
 char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len);
 
 #endif /* _LINUX_SYNC_H */
-- 
2.25.1

