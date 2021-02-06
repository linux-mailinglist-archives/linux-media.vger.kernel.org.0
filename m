Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F2D311BAA
	for <lists+linux-media@lfdr.de>; Sat,  6 Feb 2021 06:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhBFFsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Feb 2021 00:48:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbhBFFsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Feb 2021 00:48:35 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EE6C0613D6
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 21:47:55 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id cl8so4774758pjb.0
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 21:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ysXoxmHGWekWNyITP0f9QwT2Iyo77pJXB4WoqmtP4Co=;
        b=MLL+lNMZWZo9tRRfPkaLmM7dZ/6WNlE+hPWt8/xKtrnExLFYxkcpBZnolJqOVe3y2r
         RoCyhZ01Av+Cj2obyhiM3Aq29N4MBK5Q9cXxb9QZt6FCd8QUu2wfgzR4U/A1x6CxPHvs
         enRyhpFs8icHd/u53gN54C31eGfENGEDLoSz6X6BcJFl39I9Hs7ODAewm8PFf66AotKD
         51L2HrkgbHGQjJG09XzKFPq58sEPDQd98Rn7kcGJpTmTYTkzWOFB/N5S0YZ1sK7KOBRK
         TbHzs2ONwl6u+jm3zgWj6ylyiBm4oHVJa0z6iKOyg7KuSQ89+15gS84yDDM7ohuJ0B8n
         pLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ysXoxmHGWekWNyITP0f9QwT2Iyo77pJXB4WoqmtP4Co=;
        b=qgmFAhUA/TEHuwiE9lUmTmGBL4z5HbpXHUJMIK+s5XF5DYvvk+ICuwWJozh3/yBdId
         puVpRBWR/yBPrr37uBSrn1eYJTKcKGUTjcve6d50PpvFVSh42eg8gJ6Ggmqw4lOQi/d3
         Mqz9/0m4cvuq/C0AksjHXNP6T4jDRRtT1GZg0ch4JmI7ffcKA4MuPSW98m/bOFHsqz2W
         nPvKrarOVrdJLd92awSDOjv8LziknbbJyzDCWCZMqQI2IVMnHMuGWLdDhtNhXzCoRt2c
         5Dl7zWyc13CDzDo6UeB/+ASOb+1H7Ibtan7nj5HVDcV3aUR3TTy2L1j/Fa24KGMTdLsf
         spEg==
X-Gm-Message-State: AOAM533jO/KOJCrrUsJ+deYgOv/eRN1e2qf4ba1kFeUv4RO6GEThPix6
        /B0AYLQ5we/fd7B46cqDmYYt7A==
X-Google-Smtp-Source: ABdhPJzmd8A00mIxv5h6tiX3iJxykxthFlYvrr/Jc67oyFQ7FQBCfqGGUdNmJMiuKKMKjea51Dr8ww==
X-Received: by 2002:a17:90b:4c10:: with SMTP id na16mr7320475pjb.49.1612590474659;
        Fri, 05 Feb 2021 21:47:54 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id ob6sm9200211pjb.30.2021.02.05.21.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 21:47:53 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 2/2] dma-buf: heaps: Fix the name used when exporting dmabufs to be the actual heap name
Date:   Sat,  6 Feb 2021 05:47:48 +0000
Message-Id: <20210206054748.378300-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210206054748.378300-1-john.stultz@linaro.org>
References: <20210206054748.378300-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

By default dma_buf_export() sets the exporter name to be
KBUILD_MODNAME. Unfortunately this may not be identical to the
string used as the heap name (ie: "system" vs "system_heap").

This can cause some minor confusion with tooling, and there is
the future potential where multiple heap types may be exported
by the same module (but would all have the same name).

So to avoid all this, set the exporter exp_name to the heap name.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c    | 1 +
 drivers/dma-buf/heaps/system_heap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 364fc2f3e499..62465d61ccc7 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -339,6 +339,7 @@ static int cma_heap_allocate(struct dma_heap *heap,
 	buffer->pagecount = pagecount;
 
 	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.ops = &cma_heap_buf_ops;
 	exp_info.size = buffer->len;
 	exp_info.flags = fd_flags;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a68baf..2d4afc79c700 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -388,6 +388,7 @@ static int system_heap_allocate(struct dma_heap *heap,
 	}
 
 	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.ops = &system_heap_buf_ops;
 	exp_info.size = buffer->len;
 	exp_info.flags = fd_flags;
-- 
2.25.1

