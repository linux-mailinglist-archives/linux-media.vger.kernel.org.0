Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112F72EE783
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 22:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbhAGVQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 16:16:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbhAGVQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 16:16:11 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75CC2C0612F9
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 13:15:31 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d2so4740998pfq.5
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 13:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+HPHLTIbnqvyYqZakEN0yW6023R2vX5SvJvHEGRsu88=;
        b=cHSZgqczj464Vf520gWeFxP2skBA26Gc4qDuq1k8SZeOGcfiiKTsmZsKBzVJdyquDP
         AwP7iEXEk3FUyf7L5lc4NpelRvFLZEqi6kU8c4hrfifAl04y8vtm7TNoDnKC63HO5SWh
         lvZZyVDoTP+zd7oHSx0sgJu/5FP0Do/q4vTVgiaLwFYflQVgzzvQt/kR9/i31MISy4tq
         LbZLvEw+G5rucP4QbGOC20BkR+d3pP9e1EqPfafczaD7SUTW8Q7US+QdpxgtZQPx7nXU
         sKm0TId7I+tNjCMRk2+nJ9OV9f/iHF9+aoyoW0ijSIp6Kfox+9TUooajqLsw5KAD6xDw
         p5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+HPHLTIbnqvyYqZakEN0yW6023R2vX5SvJvHEGRsu88=;
        b=cbmK3U5yTnf4vHnxUqAjbaUAB1aPXgMyVEgfDzhJbu08xbYlL6jGXOIimpllHUkIl8
         jMzBd3HWNPo+OYLkuIpSgTgqZqyHN0l9ShRrwSCA4g4DdLPjYtgyzSVVFFcTs7ySluPr
         FKZLVuQAUBOiUhBiqLaeHIy2NEUH/v4z7groyrE+kzX5AHBYTOugLWZgFx7baYPgmZJo
         W48POCwsmb3/JYocNFmUI6nHckzQOPA+uGWbvidPIwU1UaNrWy4rvpvGoy0iYHwxIqSY
         Zyf/cJ6AYcbebcdcwoG2noSMCqkH7hXRU0PZa4/OKpBN19SE2fdxcJ5w7/KHbBCKh5dw
         dksw==
X-Gm-Message-State: AOAM532xDWNw3CN0q9diyoMJaETL1IqQW4swKD1pp1BPz0f7BUiT4jBa
        J0ZLWAcjddEIUo9iN/L7mutURA==
X-Google-Smtp-Source: ABdhPJy9pko8exsJmRsYgHZWzS6HB4ShY5PboCyRW7n6CbWSr9ryNiq7i9X3M83nJXNVn5LYJ0D45Q==
X-Received: by 2002:aa7:97bc:0:b029:19e:18c7:76b with SMTP id d28-20020aa797bc0000b029019e18c7076bmr501704pfq.23.1610054131037;
        Thu, 07 Jan 2021 13:15:31 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b6sm6574055pfd.43.2021.01.07.13.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 13:15:30 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dma-buf: heaps: Add a WARN_ON should the vmap_cnt go negative
Date:   Thu,  7 Jan 2021 21:15:24 +0000
Message-Id: <20210107211525.75951-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210107211525.75951-1-john.stultz@linaro.org>
References: <20210107211525.75951-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We shouldn't vunmap more then we vmap, but if we do, make
sure we complain loudly.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Suggested-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c    | 1 +
 drivers/dma-buf/heaps/system_heap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 364fc2f3e499..0c76cbc3fb11 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -232,6 +232,7 @@ static void cma_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	struct cma_heap_buffer *buffer = dmabuf->priv;
 
 	mutex_lock(&buffer->lock);
+	WARN_ON(buffer->vmap_cnt == 0);
 	if (!--buffer->vmap_cnt) {
 		vunmap(buffer->vaddr);
 		buffer->vaddr = NULL;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 405351aad2a8..2321c91891f6 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -273,6 +273,7 @@ static void system_heap_vunmap(struct dma_buf *dmabuf, struct dma_buf_map *map)
 	struct system_heap_buffer *buffer = dmabuf->priv;
 
 	mutex_lock(&buffer->lock);
+	WARN_ON(buffer->vmap_cnt == 0);
 	if (!--buffer->vmap_cnt) {
 		vunmap(buffer->vaddr);
 		buffer->vaddr = NULL;
-- 
2.17.1

