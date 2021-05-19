Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FDA38957A
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 20:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhESSgb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 14:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231533AbhESSgb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 14:36:31 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D57C06175F;
        Wed, 19 May 2021 11:35:10 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so4014872pjb.2;
        Wed, 19 May 2021 11:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3wJ3aAZEjHNKbopPDn5vozw1zWhc/Pr5fh5dknRs1w4=;
        b=gss/L8cW9B++qVCsEGdCG6oyYYiTxRsGPdKSYCe1zBs5bT3idIR4abiZ0irz76WItc
         WpRgUAI44ocQkA8xO50TCzSHlckQ//W8HrKtpV4wxxNY8wd6gBvLlP7K37MMnVXjcZNo
         dFFm5gTuswMS3COzZC+kulswD44KBUZfeQ3Ne/OtZpGDLbCABk3oxHv1zXvs3o4cnJeC
         MIZ56MpgQLv/myFNSnJ9lnu4lGEbPmS40KMIp6Rz7R5spCKiFQC5ZoGhsIrS5uB2Zzkq
         dcJSy6ToG6vyTsNROyQaOB1bEUbpbuCePtx/j5gCb4dsJCglofD/dge709+34GYJ9wFZ
         POdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3wJ3aAZEjHNKbopPDn5vozw1zWhc/Pr5fh5dknRs1w4=;
        b=AH3j3fYQHIKkiou2DUWoXsh2liTbuYd4nlYQ+5Fwda0LakJBnCMDC9FvnsfUaKQrHx
         lxMLIt8Zw6nD4dRQw1/jxfREeKXejLKk+7PK9yMmZARpVYGCscGKfOZjOBDegHYlMJWE
         nWLgOixIMFpRfkCbE0SoAGNJ1v2qZD8nAw+AmWKZYXXIV1065iL7z/Qd5R49SXcMemYl
         wbviZ21WEmZknXFZpmwRGrxR+micK/V3QNp+F1fiE85sQ4osGzW5KlOTQDwZbk0WkauZ
         2l71Wxg4er13p7syeLUe7JmV7zKWbvSJi7l7eHYLwDH3ZPnPuUBVi/bhf/7imQXGlYB5
         3nGg==
X-Gm-Message-State: AOAM5317R2URMohfOgYTbxrchCMw1ILgGRBTVz5ctAuEK/B9koQxzy7s
        WniLgbp4BtyQ8osBM8+MbcM=
X-Google-Smtp-Source: ABdhPJyGeOGkaCXLxdAuqUKvIOco88WnEXbNBPl9Cjgvro6oNP8qt0XB9utbkH5lWpk264hkhmH0vw==
X-Received: by 2002:a17:902:6ac3:b029:e6:c6a3:a697 with SMTP id i3-20020a1709026ac3b02900e6c6a3a697mr1064923plt.2.1621449309998;
        Wed, 19 May 2021 11:35:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id v9sm114698pfn.22.2021.05.19.11.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 11:35:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-kernel@vger.kernel.org (open list)
Subject: [RFC 1/3] dma-fence: Add boost fence op
Date:   Wed, 19 May 2021 11:38:52 -0700
Message-Id: <20210519183855.1523927-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210519183855.1523927-1-robdclark@gmail.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add a way to hint to the fence signaler that a fence waiter has missed a
deadline waiting on the fence.

In some cases, missing a vblank can result in lower gpu utilization,
when really we want to go in the opposite direction and boost gpu freq.
The boost callback gives some feedback to the fence signaler that we
are missing deadlines, so it can take this into account in it's freq/
utilization calculations.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 include/linux/dma-fence.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 9f12efaaa93a..172702521acc 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -231,6 +231,17 @@ struct dma_fence_ops {
 	signed long (*wait)(struct dma_fence *fence,
 			    bool intr, signed long timeout);
 
+	/**
+	 * @boost:
+	 *
+	 * Optional callback, to indicate that a fence waiter missed a deadline.
+	 * This can serve as a signal that (if possible) whatever signals the
+	 * fence should boost it's clocks.
+	 *
+	 * This can be called in any context that can call dma_fence_wait().
+	 */
+	void (*boost)(struct dma_fence *fence);
+
 	/**
 	 * @release:
 	 *
@@ -586,6 +597,21 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
 	return ret < 0 ? ret : 0;
 }
 
+/**
+ * dma_fence_boost - hint from waiter that it missed a deadline
+ *
+ * @fence: the fence that caused the missed deadline
+ *
+ * This function gives a hint from a fence waiter that a deadline was
+ * missed, so that the fence signaler can factor this in to device
+ * power state decisions
+ */
+static inline void dma_fence_boost(struct dma_fence *fence)
+{
+	if (fence->ops->boost)
+		fence->ops->boost(fence);
+}
+
 struct dma_fence *dma_fence_get_stub(void);
 u64 dma_fence_context_alloc(unsigned num);
 
-- 
2.30.2

