Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4743E36AF
	for <lists+linux-media@lfdr.de>; Sat,  7 Aug 2021 20:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhHGSeP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Aug 2021 14:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhHGSeO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Aug 2021 14:34:14 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539A1C0613CF;
        Sat,  7 Aug 2021 11:33:56 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so27707011pjr.1;
        Sat, 07 Aug 2021 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nOt70Hk3X7Lhxeo4A7VPI3vXTVhEV/b3gfLzjthYuh8=;
        b=WAJhm4odxC+0a/CWhJcaCrimxRJDZh5esiUKqykfPr5N1kMEVgNwONgEmAlIOTKl9E
         LCSTg6HYP5W97cgx6DJ2NkW1KfF/V3D7RHMHRPICqWPaEMITetDbQ+Rh0QpIxSIAG0qT
         BGQY5S9IA65YWJmhmu5YXqvqghyumjv4vVd4zFhf1DBFOHY+cf/8NteTFisigZbHv7zB
         8DbTyZ1PAxrgiBLlYdb2XfK6I8lH6Awt0IjF+ncgnI/s3EFjkiHC3JRhMKU0h1z+sHvu
         rjz4FGBGsGpY7AXkpabfwI2v+1bsCdi/Ivo8o/IFbsRwe0UF2a0NI57QKYx4YsMeQaQk
         cO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nOt70Hk3X7Lhxeo4A7VPI3vXTVhEV/b3gfLzjthYuh8=;
        b=dj+ZPtrojFrlOk27Y1z0HSCp85eBOB4sgCpv7LyGTwL74fnuxMcufG+HriG8ZFCsMi
         ZiRaU6sBrTxMPUTnlgkRQjg2PTHFAKdpec4XgRzUUzmnhC0V7t0RLq1bxTFyjLK1DFhi
         v+NHSrsSHXa806YJDsbvmZzqjgpwBC1VUrDiGG703jWmiQustRCZdZ9OfgD3tgLHX1i/
         KgH7+M2LZEHH2K3ELyDI06r9eIffcq2Rv/qUyxzwCCN/KAbgUHauJjwGmFBuqtOkkfgp
         aCQbharFdOGTjbq2RglaivhajQVYxVK29hQEIxZmPVio/E8u86OoPjnr/CX8ShP/B0Fs
         ex/A==
X-Gm-Message-State: AOAM532a5MRgxFx9q+LzYLzotMCj92O1i5IHo1ngyiu1bg/GHAjqf0ig
        yHMou9WhpUwsSqIn9pULKJI=
X-Google-Smtp-Source: ABdhPJytMjoeUYGSmDlTuSrzeu4f9QCl9g1DzeiK4PJJWz9V3/ILIBnuVV+igG8Pn5Bsx9k2KKTCfA==
X-Received: by 2002:a17:902:8bc3:b029:124:919f:6213 with SMTP id r3-20020a1709028bc3b0290124919f6213mr13954733plo.51.1628361235906;
        Sat, 07 Aug 2021 11:33:55 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id s3sm14514449pfk.61.2021.08.07.11.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 11:33:54 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/5] dma-fence: Add deadline awareness
Date:   Sat,  7 Aug 2021 11:37:55 -0700
Message-Id: <20210807183804.459850-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807183804.459850-1-robdclark@gmail.com>
References: <20210807183804.459850-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add a way to hint to the fence signaler of an upcoming deadline, such as
vblank, which the fence waiter would prefer not to miss.  This is to aid
the fence signaler in making power management decisions, like boosting
frequency as the deadline approaches and awareness of missing deadlines
so that can be factored in to the frequency scaling.

v2: Drop dma_fence::deadline and related logic to filter duplicate
    deadlines, to avoid increasing dma_fence size.  The fence-context
    implementation will need similar logic to track deadlines of all
    the fences on the same timeline.  [ckoenig]

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-fence.c | 20 ++++++++++++++++++++
 include/linux/dma-fence.h   | 16 ++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index ce0f5eff575d..1f444863b94d 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -910,6 +910,26 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
 }
 EXPORT_SYMBOL(dma_fence_wait_any_timeout);
 
+
+/**
+ * dma_fence_set_deadline - set desired fence-wait deadline
+ * @fence:    the fence that is to be waited on
+ * @deadline: the time by which the waiter hopes for the fence to be
+ *            signaled
+ *
+ * Inform the fence signaler of an upcoming deadline, such as vblank, by
+ * which point the waiter would prefer the fence to be signaled by.  This
+ * is intended to give feedback to the fence signaler to aid in power
+ * management decisions, such as boosting GPU frequency if a periodic
+ * vblank deadline is approaching.
+ */
+void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
+		fence->ops->set_deadline(fence, deadline);
+}
+EXPORT_SYMBOL(dma_fence_set_deadline);
+
 /**
  * dma_fence_init - Initialize a custom fence.
  * @fence: the fence to initialize
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..9c809f0d5d0a 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -99,6 +99,7 @@ enum dma_fence_flag_bits {
 	DMA_FENCE_FLAG_SIGNALED_BIT,
 	DMA_FENCE_FLAG_TIMESTAMP_BIT,
 	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
+	DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
 	DMA_FENCE_FLAG_USER_BITS, /* must always be last member */
 };
 
@@ -261,6 +262,19 @@ struct dma_fence_ops {
 	 */
 	void (*timeline_value_str)(struct dma_fence *fence,
 				   char *str, int size);
+
+	/**
+	 * @set_deadline:
+	 *
+	 * Callback to allow a fence waiter to inform the fence signaler of an
+	 * upcoming deadline, such as vblank, by which point the waiter would
+	 * prefer the fence to be signaled by.  This is intended to give feedback
+	 * to the fence signaler to aid in power management decisions, such as
+	 * boosting GPU frequency.
+	 *
+	 * This callback is optional.
+	 */
+	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
 };
 
 void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
@@ -586,6 +600,8 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 	return ret < 0 ? ret : 0;
 }
 
+void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
+
 struct dma_fence *dma_fence_get_stub(void);
 struct dma_fence *dma_fence_allocate_private_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
-- 
2.31.1

