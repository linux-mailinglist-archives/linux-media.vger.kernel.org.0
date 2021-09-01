Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48FD43FD931
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 14:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243968AbhIAMDs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 08:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243965AbhIAMDq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 08:03:46 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F72C061764
        for <linux-media@vger.kernel.org>; Wed,  1 Sep 2021 05:02:49 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id v10so4123360wrd.4
        for <linux-media@vger.kernel.org>; Wed, 01 Sep 2021 05:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t19VNYD7z90zjqfUtw8wZympFk0WCxWbJcimp6O0h0E=;
        b=G6ETOEwW1DPJao3SNyHPhkWySxellpwcrOanOx+H/U7C60K1lguHGdZmCJRhXBf3wf
         DBTcqxD2TEZNZSpFgA2EDgdJQU2E86xO5+toACv95jPAd5le/2TG6Vy1WGZJs+gH8kGh
         ek7/eCwhfvaygdmXw+kUt35t/X6Dr8xxXyg2RzH7xXSvxXi0kVpusUS2v3NW6rkMmgU/
         bxMvFO6cbDpiMe6jPWR5ZjG2TRrT2r+PxeAK2jBwsBILg+CM2IZ2sBusluOmYs83rD6f
         s4WH4X2oNm2nxupCldljLiylGJhtgBKgqjCKSXoVB2x7OIsXE+gh0TYAGmA3VVA42Ft1
         o4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t19VNYD7z90zjqfUtw8wZympFk0WCxWbJcimp6O0h0E=;
        b=VFJSBLWvwLDH2u0XGWkaV/zWfH2qFm78wvK/46IALtJ1pN2lAIowXnKP6PMAtT6wqG
         TBesSR5Ik7NkwImYcsYILDl+nTI308pkCBBzXmPI3xdhjAgSF8vcKnQHkZPVg1Bd27lA
         jIKcK7ZPFR39ZnDHxWhBIM9WOON2EcX0t6IhUX5K1Gm1gI/jbPu+zIqspjv/KTtnPTbg
         0G/V8IcfTpusBAzNI/br50xrsNcCa8+DvmHMgKCttS59lhvSIDUBsJ/ibpG9N/NfZWs6
         6syDnoBni8NABi2jYwun0Fq1QUBTANHXkJSiyLUxfZ9zpK/mhd2rppVejB1ixfolH/3X
         1Obg==
X-Gm-Message-State: AOAM53103zH8/tu8nQnyoxYopCEMWbYMbCdmB3ITksLLcSG4Z7b2WW0P
        2DSIu3CVSABEJ0LvTCawuf4=
X-Google-Smtp-Source: ABdhPJwwDwe3tgn7MblJIyLmFJyjf2zJInaWT7+HVsxQIqE9k+Ba7sN30IGAwqd20tWoBoVKXpyneA==
X-Received: by 2002:adf:90d0:: with SMTP id i74mr36369414wri.185.1630497767938;
        Wed, 01 Sep 2021 05:02:47 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l7sm5641336wmj.9.2021.09.01.05.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 05:02:47 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org
Cc:     daniel@ffwll.ch, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] dma-buf: clarify dma_fence_add_callback documentation
Date:   Wed,  1 Sep 2021 14:02:40 +0200
Message-Id: <20210901120240.7339-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901120240.7339-1-christian.koenig@amd.com>
References: <20210901120240.7339-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

That the caller doesn't need to keep a reference is rather
risky and not defensive at all.

Especially dma_buf_poll got that horrible wrong, so better
remove that sentence and also clarify that the callback
might be called in atomic or interrupt context.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ce0f5eff575d..1e82ecd443fa 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -616,20 +616,17 @@ EXPORT_SYMBOL(dma_fence_enable_sw_signaling);
  * @cb: the callback to register
  * @func: the function to call
  *
+ * Add a software callback to the fence. The caller should keep a reference to
+ * the fence.
+ *
  * @cb will be initialized by dma_fence_add_callback(), no initialization
  * by the caller is required. Any number of callbacks can be registered
  * to a fence, but a callback can only be registered to one fence at a time.
  *
- * Note that the callback can be called from an atomic context.  If
- * fence is already signaled, this function will return -ENOENT (and
+ * If fence is already signaled, this function will return -ENOENT (and
  * *not* call the callback).
  *
- * Add a software callback to the fence. Same restrictions apply to
- * refcount as it does to dma_fence_wait(), however the caller doesn't need to
- * keep a refcount to fence afterward dma_fence_add_callback() has returned:
- * when software access is enabled, the creator of the fence is required to keep
- * the fence alive until after it signals with dma_fence_signal(). The callback
- * itself can be called from irq context.
+ * Note that the callback can be called from an atomic context or irq context.
  *
  * Returns 0 in case of success, -ENOENT if the fence is already signaled
  * and -EINVAL in case of error.
-- 
2.25.1

