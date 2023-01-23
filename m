Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2378677B15
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 13:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjAWMiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 07:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjAWMiE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 07:38:04 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E56E073
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:38:03 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h16so10642295wrz.12
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 04:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXN5GkMQp7hu9CGhDS6OQxzJfUxb9ZcG/2PxTv2bgTk=;
        b=PRp+K8o/qTb7x4Y1T4vYADVymgsFKRTiEQUeIw441b4+7ksI/PO8lCH5nm/rIRROsn
         4iDMmlJJZNdtKrxH21SPVt6hGd52qj7s5OsiIVfSlWaUeOpvfxE4TU3jF5kUaDJ+QCTx
         bQJgw6nfDkGfN0OoxfEebu0UfsuBEFMbcnTwXKOtuClRamGYCZr34BG8Iq+FuWPnorcK
         HxURxh6w1av0zX2Ly+9wrUaVN5sp+1l5/rl0FNBqrV9zbWJSc1njgdpi+lTy9NDlIrq+
         aHFWcg9XG1+lAOOI1AivWVVwObRowL0aF72L3uePVBGdz+XMfNrRQ+KTbE97l1W5tm67
         VrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXN5GkMQp7hu9CGhDS6OQxzJfUxb9ZcG/2PxTv2bgTk=;
        b=17H/Xa6JHt3Mgv2dLY1MPG9d0Uv4Xo0FbfCakRog/nkqPnUPL6dUZjidCEw+o0Kgx1
         uqYoo9wm6YXfLqW/YbiATl3ZWW2KfkoIA0pLRnti9cA/c9FtKgwsnOGzBg4TjMBzQLZZ
         xCSCGrZYoKkASd2PQ7jE/eKZTkUuv82ymBqn2Ikx7iO3G2cbLj5MfSIxcsO7OvI6I1K5
         z8Bg+F//yQ4lzSd3bzeu3Qhs3tWvLy3aiodEp0WDBTDePSjTlyr4/QXW6+oWaw+SuDvw
         1yjF/OrjOiM5wSTisCwg3qaAu7KVZoebzIYoeSVV1Ep17WljT05oJkz+iw/DQ2fQVXMV
         1+SA==
X-Gm-Message-State: AFqh2kqMF75Rxgj61cv5V6RX5vW9cBdLfw50cscae3WysyPgWQKBDtAf
        JlIw4UXqnn18mAv86r/81ocJJ9CrZqk=
X-Google-Smtp-Source: AMrXdXvYyLMHWTRnrKqjQOgBOftzo1qbhvRaLIe14a7zX93YHo/yUYT9qtTwOY/d9I30A1VU7c/EMA==
X-Received: by 2002:a05:6000:a03:b0:2bd:e036:6b1a with SMTP id co3-20020a0560000a0300b002bde0366b1amr24265990wrb.64.1674477481885;
        Mon, 23 Jan 2023 04:38:01 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6e83000000b00289bdda07b7sm4284510wrz.92.2023.01.23.04.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:38:01 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     l.stach@pengutronix.de, nicolas@ndufresne.ca, ppaalanen@gmail.com,
        sumit.semwal@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
        tfiga@chromium.org, sebastian.wick@redhat.com, hverkuil@xs4all.nl,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-media@vger.kernel.org, benjamin.gaignard@collabora.com,
        lmark@codeaurora.org, labbott@redhat.com, Brian.Starkey@arm.com,
        jstultz@google.com, laurent.pinchart@ideasonboard.com,
        mchehab@kernel.org
Subject: [PATCH 1/2] dma-heap: add device link and unlink functions
Date:   Mon, 23 Jan 2023 13:37:55 +0100
Message-Id: <20230123123756.401692-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123123756.401692-1-christian.koenig@amd.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
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

This allows device drivers to specify a DMA-heap where they want their
buffers to be allocated from. This information is then exposed as
sysfs link between the device and the DMA-heap.

Useful for userspace when in need to decide from which provider to
allocate a buffer.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-heap.c | 41 ++++++++++++++++++++++++++++++--------
 include/linux/dma-heap.h   | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index c9e41e8a9e27..0f7cf713c22f 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -31,6 +31,7 @@
  * @heap_devt		heap device node
  * @list		list head connecting to list of heaps
  * @heap_cdev		heap char device
+ * @dev:		heap device in sysfs
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -41,6 +42,7 @@ struct dma_heap {
 	dev_t heap_devt;
 	struct list_head list;
 	struct cdev heap_cdev;
+	struct device *dev;
 };
 
 static LIST_HEAD(heap_list);
@@ -49,6 +51,33 @@ static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
+int dma_heap_create_device_link(struct device *dev, const char *heap)
+{
+	struct dma_heap *h;
+
+	/* check the name is valid */
+	mutex_lock(&heap_list_lock);
+	list_for_each_entry(h, &heap_list, list) {
+		if (!strcmp(h->name, heap))
+			break;
+	}
+	mutex_unlock(&heap_list_lock);
+
+	if (list_entry_is_head(h, &heap_list, list)) {
+		pr_err("dma_heap: Link to invalid heap requested %s\n", heap);
+		return -EINVAL;
+	}
+
+	return sysfs_create_link(&dev->kobj, &h->dev->kobj, DEVNAME);
+}
+EXPORT_SYMBOL(dma_heap_create_device_link);
+
+void dma_heap_remove_device_link(struct device *dev)
+{
+	sysfs_remove_link(&dev->kobj, DEVNAME);
+}
+EXPORT_SYMBOL(dma_heap_remove_device_link);
+
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 unsigned int fd_flags,
 				 unsigned int heap_flags)
@@ -219,7 +248,6 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
-	struct device *dev_ret;
 	unsigned int minor;
 	int ret;
 
@@ -261,14 +289,11 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 		goto err1;
 	}
 
-	dev_ret = device_create(dma_heap_class,
-				NULL,
-				heap->heap_devt,
-				NULL,
-				heap->name);
-	if (IS_ERR(dev_ret)) {
+	heap->dev = device_create(dma_heap_class, NULL, heap->heap_devt, NULL,
+				  heap->name);
+	if (IS_ERR(heap->dev)) {
 		pr_err("dma_heap: Unable to create device\n");
-		err_ret = ERR_CAST(dev_ret);
+		err_ret = ERR_CAST(heap->dev);
 		goto err2;
 	}
 
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..097076766496 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -65,4 +65,39 @@ const char *dma_heap_get_name(struct dma_heap *heap);
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+#ifdef CONFIG_DMABUF_HEAPS
+
+/**
+ * dma_heap_create_device_link() - add link between device and heap
+ * @dev: the device which should be linked to a heap
+ * @heap: name of the heap to link to
+ *
+ * Add a sysfs link between a device and a DMA-heap. This link can then be used
+ * by userspace to figure out from which DMA-heap a device wants it's buffers
+ * to be allocated.
+ */
+int dma_heap_create_device_link(struct device *dev, const char *heap);
+
+/**
+ * dma_heap_remove_device_link() - remove link between device and heap
+ * @dev: the device which should be unlinked
+ *
+ * Removes the sysfs link between the device and it's DMA-heap again when a
+ * driver is unloaded.
+ */
+void dma_heap_remove_device_link(struct device *dev);
+
+#else
+
+int dma_heap_create_device_link(struct device *dev, const char *heap)
+{
+	return 0;
+}
+
+void dma_heap_remove_device_link(struct device *dev)
+{
+}
+
+#endif
+
 #endif /* _DMA_HEAPS_H */
-- 
2.34.1

