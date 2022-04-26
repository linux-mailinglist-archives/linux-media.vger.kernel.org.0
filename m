Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B9F5104CE
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 19:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344451AbiDZREY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 13:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353614AbiDZRD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 13:03:57 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC5A7090A
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 10:00:48 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so1983209wmn.1
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VRXpIchH9YdU1da8XhTk+Hd+H0itPA9JgyDMdUY39zI=;
        b=ICCfinvqRuhEMo1acsCySqoZ+mt2J78Zb9sjoGr7/JCExf7fi9cFYhJj50I2iwgWFa
         3+XLYBGwijNpxZSCtt1FSMsoc+uM8RROF4ZTNspD5K2TQuDQ8EQrvGHARKVo8PDgoSos
         66tozFAwCRKLgb2/kkhN/LXBp1BON5nf+4fwvc9UIngYuoD/iC5i7tOaoi92qqqJfiHv
         UwrJCa6vE9HDxhZ7P/b0MdLJwEBhSrndqGgLp0c95U04+0NAt2hrrHfPrXkVEOJSNuw9
         uGJ6yLQpqnugEge67ohBY2B4UBq9YQs5gS7XKCwSAKucheI5sk6nKI2hSaFnDaaThY2D
         BRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VRXpIchH9YdU1da8XhTk+Hd+H0itPA9JgyDMdUY39zI=;
        b=5Rf3cC2Nv0uVsf0MV9ts9FB/VDM/wC5zmy/3GrO1Sda8Him1VmAoDe6Kd1UwtupKGi
         4RRJlGu6yquc/bQ7DZSHD1RXcCc19QSAgHf8ONMVgfDh/aUPMrPtB7JKP8eICKo6Th8a
         kfOLjPxZvAVMH1kv0QOH/25WyI3BDTwDyAmnGlYfmNc7ea1wndjQNZpXfrWmb6xKLIHv
         HVZRofbEWiu857pJjat/Cjoe72k9tmjx5IkzrdzJyf6VFwrNdaLz33+xjt2HOdiIsZQe
         agzP5HHzNqpXwocSs3imp0gwEVVQCS85lK5oJyU6G+UKZ+moMO5Rvpk6ElEay3IrCzEo
         HAKA==
X-Gm-Message-State: AOAM532fW4/yKyaa5L4VmOevcv4Am5XE3UAsb2/6qT8L6q0qoMSZZ/0H
        Ol8w9TZtLL9Z8UjTBLUTZFxNyc6666M=
X-Google-Smtp-Source: ABdhPJwrVU+Hbo3q1YlzZcaTM3Yc9CkRjM+fZxbLxmsyCZjWxmYNt4TxRPNfn9p+uDRKyiOVUe7w6w==
X-Received: by 2002:a05:600c:4e01:b0:392:aa5d:6093 with SMTP id b1-20020a05600c4e0100b00392aa5d6093mr31183928wmq.114.1650992447065;
        Tue, 26 Apr 2022 10:00:47 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id o9-20020adf8b89000000b0020adeb916d8sm4685957wra.30.2022.04.26.10.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 10:00:46 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     sumit.semwal@linaro.org, gustavo@padovan.org,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: remove trace_dma_fence_emit
Date:   Tue, 26 Apr 2022 19:00:44 +0200
Message-Id: <20220426170044.29454-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

There was never any significant difference between trace_dma_fence_emit()
and trace_dma_fence_init() and the only place where it would made a
significant difference was never implemented.

So remove trace_dma_fence_emit() since we have an repeating issue that
people are trying to use it for visualization and are surprised that
it actually doesn't work for most drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c             | 1 -
 drivers/gpu/drm/nouveau/nouveau_fence.c | 1 -
 drivers/gpu/drm/qxl/qxl_release.c       | 1 -
 drivers/gpu/drm/virtio/virtgpu_fence.c  | 2 --
 include/trace/events/dma_fence.h        | 7 -------
 5 files changed, 12 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 066400ed8841..d0d704f3edae 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -20,7 +20,6 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/dma_fence.h>
 
-EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7f01dcf81fab..abcac7db4347 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -224,7 +224,6 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 			       &fctx->lock, fctx->context, ++fctx->sequence);
 	kref_get(&fctx->fence_ref);
 
-	trace_dma_fence_emit(&fence->base);
 	ret = fctx->emit(fence);
 	if (!ret) {
 		dma_fence_get(&fence->base);
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..cb9f27771f32 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -424,7 +424,6 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 	 */
 	dma_fence_init(&release->base, &qxl_fence_ops, &qdev->release_lock,
 		       release->id | 0xf0000000, release->base.seqno);
-	trace_dma_fence_emit(&release->base);
 
 	list_for_each_entry(entry, &release->bos, head) {
 		bo = entry->bo;
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index f28357dbde35..e8b6dec37977 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -111,8 +111,6 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 	list_add_tail(&fence->node, &drv->fences);
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
 
-	trace_dma_fence_emit(&fence->f);
-
 	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
 	cmd_hdr->fence_id = cpu_to_le64(fence->fence_id);
 
diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index 3963e79ca7b4..eb744a6aca49 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -34,13 +34,6 @@ DECLARE_EVENT_CLASS(dma_fence,
 		  __entry->seqno)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_emit,
-
-	TP_PROTO(struct dma_fence *fence),
-
-	TP_ARGS(fence)
-);
-
 DEFINE_EVENT(dma_fence, dma_fence_init,
 
 	TP_PROTO(struct dma_fence *fence),
-- 
2.25.1

