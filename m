Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2BCC517487
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 18:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243212AbiEBQlT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 12:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243296AbiEBQlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 12:41:14 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A1410FF3
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 09:37:30 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id d5so20238895wrb.6
        for <linux-media@vger.kernel.org>; Mon, 02 May 2022 09:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ztozpp4Hd7P88p5EylObdLnFFM2e9No0uy0uVps0Q4o=;
        b=l8cnH0/oWnlGs4iC9nSE0GWCX5g6JqtmjJMCjqSOAwOlKROP5Dav+7qr2vV22I5AyR
         P29H9FiZL0l2XMAOD39ti1qK7CTYjhCfhB/1+yXOLeBeRWny9/cVyMmgwWfoI/s/Irld
         ZRtRAzcb0kVhafr3YK4q7sAqJH9N878z6sN9gTuvwmb5v79Q5utfbdU/1lMGWZC9QQFQ
         UNgGqrfbGFfgl4WqqTb8n9jL+C74NUCcdbKkwWbHWD8HODMIuK3SPi81YaAuOHrXN9cS
         2i0O0Ls4YIs41WHjk2OSpRFoFPhhX0T09C3YwERYz33I3c2eqkXCNeI1/XrcKaWKZgfC
         uTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ztozpp4Hd7P88p5EylObdLnFFM2e9No0uy0uVps0Q4o=;
        b=dDPwiDJvWLGs0FwYYAtApgA8tVrIC/nAqqMVjQwGzqN1Iq2XkgNc4Sz1GnahaCWqpQ
         wsf6BGnJqMkRMbu0kgwYphoCb2nPsjxpI3NxQTwj8PiIsRRDVW9J1ntUSS/u5b07CoQ5
         paxfYFYbDKiMDZObUoBo6q5gSbROXKKHBu+5MRkuZI6f4dFXJ16Up7RcHJKi2qRCody4
         U88/F5UYk1xR0UG8Tq6PvSnEfT/60heQ7e27gkm3lfPNl/g5QUoJWWf3ghuznYwcBGu+
         HkeeSuk6ojKIxXNFbpRtzBfAhmPThrcvI4BLIGTcxoH2Z1XXSdFQTNmRgEMbI3MvUPwa
         F72Q==
X-Gm-Message-State: AOAM530yGTJw/159xNVZnhMO134z0Im8uX8Gdo3FWhe0yG3KW4q3NcAi
        om0CwtZXJLfCYaes1xxfwBM=
X-Google-Smtp-Source: ABdhPJz2JXWWJflLQjuCGIgmn7WtX7jC1WTxfxIIZ7Mwf9txYB3Hit3CNEpghfRADVo4PLGr1oZzVg==
X-Received: by 2002:a05:6000:c:b0:20a:df2e:2c38 with SMTP id h12-20020a056000000c00b0020adf2e2c38mr9823627wrx.481.1651509448873;
        Mon, 02 May 2022 09:37:28 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
        by smtp.gmail.com with ESMTPSA id p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 09:37:28 -0700 (PDT)
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
Subject: [PATCH 01/15] dma-buf: rename DMA_FENCE_FLAG_USER_BITS to _DEVICE
Date:   Mon,  2 May 2022 18:37:08 +0200
Message-Id: <20220502163722.3957-2-christian.koenig@amd.com>
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

This is supposed to be used by device drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_request.h       | 2 +-
 drivers/gpu/drm/i915/i915_sw_fence_work.h | 2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c   | 4 ++--
 include/linux/dma-fence.h                 | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
index 28b1f9db5487..716c8c413cc4 100644
--- a/drivers/gpu/drm/i915/i915_request.h
+++ b/drivers/gpu/drm/i915/i915_request.h
@@ -80,7 +80,7 @@ enum {
 	 *
 	 * See i915_request_is_active()
 	 */
-	I915_FENCE_FLAG_ACTIVE = DMA_FENCE_FLAG_USER_BITS,
+	I915_FENCE_FLAG_ACTIVE = DMA_FENCE_FLAG_DRIVER,
 
 	/*
 	 * I915_FENCE_FLAG_PQUEUE - this request is ready for execution
diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.h b/drivers/gpu/drm/i915/i915_sw_fence_work.h
index d56806918d13..ece0a06e598c 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.h
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.h
@@ -33,7 +33,7 @@ struct dma_fence_work {
 };
 
 enum {
-	DMA_FENCE_WORK_IMM = DMA_FENCE_FLAG_USER_BITS,
+	DMA_FENCE_WORK_IMM = DMA_FENCE_FLAG_DRIVER,
 };
 
 void dma_fence_work_init(struct dma_fence_work *f,
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7f01dcf81fab..e2f61b34cc1e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -61,7 +61,7 @@ nouveau_fence_signal(struct nouveau_fence *fence)
 	list_del(&fence->head);
 	rcu_assign_pointer(fence->channel, NULL);
 
-	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags)) {
+	if (test_bit(DMA_FENCE_FLAG_DRIVER, &fence->base.flags)) {
 		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 		if (!--fctx->notify_ref)
@@ -510,7 +510,7 @@ static bool nouveau_fence_enable_signaling(struct dma_fence *f)
 
 	ret = nouveau_fence_no_signaling(f);
 	if (ret)
-		set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
+		set_bit(DMA_FENCE_FLAG_DRIVER, &fence->base.flags);
 	else if (!--fctx->notify_ref)
 		nvif_notify_put(&fctx->notify);
 
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 775cdc0b4f24..afea82ec5946 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -49,7 +49,7 @@ struct dma_fence_cb;
  * DMA_FENCE_FLAG_SIGNALED_BIT - fence is already signaled
  * DMA_FENCE_FLAG_TIMESTAMP_BIT - timestamp recorded for fence signaling
  * DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT - enable_signaling might have been called
- * DMA_FENCE_FLAG_USER_BITS - start of the unused bits, can be used by the
+ * DMA_FENCE_FLAG_DRIVER - start of the unused bits, can be used by the
  * implementer of the fence for its own purposes. Can be used in different
  * ways by different fence implementers, so do not rely on this.
  *
@@ -99,7 +99,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
-	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
+	DMA_FENCE_FLAG_DRIVER, /* must always be last member */
 };
 
 typedef void (*dma_fence_func_t)(struct dma_fence *fence,
-- 
2.25.1

