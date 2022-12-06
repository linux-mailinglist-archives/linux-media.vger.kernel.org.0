Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBFD6447C7
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 16:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233661AbiLFPQj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 10:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbiLFPQH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 10:16:07 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D22B2E6BA
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 07:12:13 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ud5so6965038ejc.4
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAwwuZGcB6zPCMej99H4ZxGfukIlcThhrdeWSERYxiU=;
        b=nbt1uvHTXIFHa7SZJIzUQqcm7GgHqGmS80M0TidVWzt162So6KKDGy6gM8fGhAx80E
         MRjsekWXmOw/ZO7ck+3ZUAdsDY9riYk5Lq8ysmttr3Mge1eIZPbsFwsI/Nm3B3lTjK66
         xyw4COH8c1Nkwz1+DSKwU2hx+o/rRiUuaglMl6dxI9bdKs9d6GzrbA+c+CQQgOHQpYV4
         4hnHGe9q5uETO0ydd4AVM7CT8jeO0eemcqb/dmCIZZGo60O8rQ1Cz/RBKG3W8NPpBlzl
         o23fm04xFwOWI1IpWqV34oinZ3JXYKjp4Z0LJjqpq1F4oyQYw/9CkmGEDYlUSJAqdtng
         3ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAwwuZGcB6zPCMej99H4ZxGfukIlcThhrdeWSERYxiU=;
        b=x9H0NJ0glE9EfO/v9xdWtUMDYs/XBK2+IoiFcFBYLBeE0X4Wld2uwbHDyrm4iocm98
         MCgtX06ii2AA3dwAIPwuEb1lrMVoLLSm/U4StsBhU1BRy/tg//HX1egPv4p/XI5LrDrt
         Sfn9vX02Nrqmy/dYvHkQ4JeY1Z4ipDeq2yWo03wWqoauzBVSbo/pNhWcKjJmd4m47Lj2
         cbG9lsFgU4+RyspQVMBRa5nK99x3t95dfP7QBEqm7w8oektfsOqfqJhu/P3+FLYxyonH
         SA+/PYhjs1iSaspark5l78IIuM/sXDfOUCvG3uoBUOl3TrLKhEY8BPmzi/lLOQ0e0fL5
         GXSQ==
X-Gm-Message-State: ANoB5pmVUpu4eS2thzMSN7Kw3hqKvOpJJFA34i3QoL4hcKHdP6KKf9g8
        aGYvwa5r04w/IIe7f6Fo+FU=
X-Google-Smtp-Source: AA0mqf7auaCY/9FYt7tioLSNUV49Je74hCB77cWcy1VArJ0c6nMh54u0yP1lGJoaL7fdF4h+tIhmFQ==
X-Received: by 2002:a17:906:ee1:b0:78a:efde:b84a with SMTP id x1-20020a1709060ee100b0078aefdeb84amr73368452eji.744.1670339530694;
        Tue, 06 Dec 2022 07:12:10 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
        by smtp.gmail.com with ESMTPSA id j9-20020aa7c409000000b0046c53c3b2dfsm1096655edq.38.2022.12.06.07.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 07:12:09 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     quic_charante@quicinc.com, cuigaosheng1@huawei.com,
        tjmercier@google.com, sumit.semwal@linaro.org
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: fix dma_buf_export init order
Date:   Tue,  6 Dec 2022 16:12:07 +0100
Message-Id: <20221206151207.8801-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The init order and resulting error handling in dma_buf_export
was pretty messy.

Subordinate objects like the file and the sysfs kernel objects
were initializing and wiring itself up with the object in the
wrong order resulting not only in complicating and partially
incorrect error handling, but also in publishing only halve
initialized DMA-buf objects.

Clean this up thoughtfully by allocating the file independent
of the DMA-buf object. Then allocate and initialize the DMA-buf
object itself, before publishing it through sysfs. If everything
works as expected the file is then connected with the DMA-buf
object and publish it through debugfs.

Also adds the missing dma_resv_fini() into the error handling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf-sysfs-stats.c |  7 +--
 drivers/dma-buf/dma-buf-sysfs-stats.h |  4 +-
 drivers/dma-buf/dma-buf.c             | 65 +++++++++++++--------------
 3 files changed, 34 insertions(+), 42 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
index 2bba0babcb62..4b680e10c15a 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -168,14 +168,11 @@ void dma_buf_uninit_sysfs_statistics(void)
 	kset_unregister(dma_buf_stats_kset);
 }
 
-int dma_buf_stats_setup(struct dma_buf *dmabuf)
+int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
 {
 	struct dma_buf_sysfs_entry *sysfs_entry;
 	int ret;
 
-	if (!dmabuf || !dmabuf->file)
-		return -EINVAL;
-
 	if (!dmabuf->exp_name) {
 		pr_err("exporter name must not be empty if stats needed\n");
 		return -EINVAL;
@@ -192,7 +189,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
 
 	/* create the directory for buffer stats */
 	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
-				   "%lu", file_inode(dmabuf->file)->i_ino);
+				   "%lu", file_inode(file)->i_ino);
 	if (ret)
 		goto err_sysfs_dmabuf;
 
diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
index a49c6e2650cc..7a8a995b75ba 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.h
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
@@ -13,7 +13,7 @@
 int dma_buf_init_sysfs_statistics(void);
 void dma_buf_uninit_sysfs_statistics(void);
 
-int dma_buf_stats_setup(struct dma_buf *dmabuf);
+int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file);
 
 void dma_buf_stats_teardown(struct dma_buf *dmabuf);
 #else
@@ -25,7 +25,7 @@ static inline int dma_buf_init_sysfs_statistics(void)
 
 static inline void dma_buf_uninit_sysfs_statistics(void) {}
 
-static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
+static inline int dma_buf_stats_setup(struct dma_buf *dmabuf, struct file *file)
 {
 	return 0;
 }
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index e6f36c014c4c..ea08049b70ae 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -614,19 +614,11 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	size_t alloc_size = sizeof(struct dma_buf);
 	int ret;
 
-	if (!exp_info->resv)
-		alloc_size += sizeof(struct dma_resv);
-	else
-		/* prevent &dma_buf[1] == dma_buf->resv */
-		alloc_size += 1;
-
-	if (WARN_ON(!exp_info->priv
-			  || !exp_info->ops
-			  || !exp_info->ops->map_dma_buf
-			  || !exp_info->ops->unmap_dma_buf
-			  || !exp_info->ops->release)) {
+	if (WARN_ON(!exp_info->priv || !exp_info->ops
+		    || !exp_info->ops->map_dma_buf
+		    || !exp_info->ops->unmap_dma_buf
+		    || !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
-	}
 
 	if (WARN_ON(exp_info->ops->cache_sgt_mapping &&
 		    (exp_info->ops->pin || exp_info->ops->unpin)))
@@ -638,10 +630,21 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	if (!try_module_get(exp_info->owner))
 		return ERR_PTR(-ENOENT);
 
+	file = dma_buf_getfile(exp_info->size, exp_info->flags);
+	if (IS_ERR(file)) {
+		ret = PTR_ERR(file);
+		goto err_module;
+	}
+
+	if (!exp_info->resv)
+		alloc_size += sizeof(struct dma_resv);
+	else
+		/* prevent &dma_buf[1] == dma_buf->resv */
+		alloc_size += 1;
 	dmabuf = kzalloc(alloc_size, GFP_KERNEL);
 	if (!dmabuf) {
 		ret = -ENOMEM;
-		goto err_module;
+		goto err_file;
 	}
 
 	dmabuf->priv = exp_info->priv;
@@ -653,44 +656,36 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	init_waitqueue_head(&dmabuf->poll);
 	dmabuf->cb_in.poll = dmabuf->cb_out.poll = &dmabuf->poll;
 	dmabuf->cb_in.active = dmabuf->cb_out.active = 0;
+	mutex_init(&dmabuf->lock);
+	INIT_LIST_HEAD(&dmabuf->attachments);
 
 	if (!resv) {
-		resv = (struct dma_resv *)&dmabuf[1];
-		dma_resv_init(resv);
+		dmabuf->resv = (struct dma_resv *)&dmabuf[1];
+		dma_resv_init(dmabuf->resv);
+	} else {
+		dmabuf->resv = resv;
 	}
-	dmabuf->resv = resv;
 
-	file = dma_buf_getfile(dmabuf, exp_info->flags);
-	if (IS_ERR(file)) {
-		ret = PTR_ERR(file);
+	ret = dma_buf_stats_setup(dmabuf, file);
+	if (ret)
 		goto err_dmabuf;
-	}
 
+	file->private_data = dmabuf;
+	file->f_path.dentry->d_fsdata = dmabuf;
 	dmabuf->file = file;
 
-	mutex_init(&dmabuf->lock);
-	INIT_LIST_HEAD(&dmabuf->attachments);
-
 	mutex_lock(&db_list.lock);
 	list_add(&dmabuf->list_node, &db_list.head);
 	mutex_unlock(&db_list.lock);
 
-	ret = dma_buf_stats_setup(dmabuf);
-	if (ret)
-		goto err_sysfs;
-
 	return dmabuf;
 
-err_sysfs:
-	/*
-	 * Set file->f_path.dentry->d_fsdata to NULL so that when
-	 * dma_buf_release() gets invoked by dentry_ops, it exits
-	 * early before calling the release() dma_buf op.
-	 */
-	file->f_path.dentry->d_fsdata = NULL;
-	fput(file);
 err_dmabuf:
+	if (!resv)
+		dma_resv_fini(dmabuf->resv);
 	kfree(dmabuf);
+err_file:
+	fput(file);
 err_module:
 	module_put(exp_info->owner);
 	return ERR_PTR(ret);
-- 
2.34.1

