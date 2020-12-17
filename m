Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C89D2DD183
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 13:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgLQMbr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 07:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgLQMbq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 07:31:46 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78114C061794;
        Thu, 17 Dec 2020 04:31:06 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id g18so20249795pgk.1;
        Thu, 17 Dec 2020 04:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZcXeGJJMM5OnozixyGJRr6W72s9oCpGnZVP+dO6FDqI=;
        b=hRhRpnDuKp4PB5JZZW2jLmbSfNCbvNH4LiF9ILPVPsdlBFbGmZwQCpt4FZXr1/f/g2
         tFBXcdaQZfgVXLrwXwGYMDPHnvBam42sJ2Do/EeWQ1ddSpkdLvWg8bDWbGJ8M9n837R6
         LXLB+CaLKdyUzxVGsk6+a4fRSZVCpVcNw4V7c+1X88ARHHBbQKdf+E4vRRmC4XqY3Pmw
         40PCdCkWomb0oa+kPpVdeeimdwFt+a9kb7Py/bmvHA/HT4Ftf6rJNjfo2wJNRPTTHzuh
         znMxJ46KsnTzYD1SRpHefrp8Av3u5Ia8hWeTTdLCTW6rF3lGjDjJ5HX+IOHrNFDMAmwm
         bNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZcXeGJJMM5OnozixyGJRr6W72s9oCpGnZVP+dO6FDqI=;
        b=X8AxmRn8ORnXdOgsUk/D+cQUBD5D+Nx1++5YpUJOQdsvEoqIwnhEa4GnS8yvivDPz0
         IjrkdgiGCvroMtOGGUZD/8Vfapa45r/QpVxEJyMHJEo4di/LHcWFWEGrifcbuaWcG6Z9
         QnuAW5nkEGnA2P410v9QW+5Ep0W61hBggaS6sHbV22vGu79pARQF5DhlLXJewofddG36
         IvHM3CLiEsZyVWAWhQbVsOPll+1bT8hFsXSI/JGIwIC6nvt9/FKlgo3P41xbGIS0XoxC
         vQ0X9KiRD61VABRvY++5+LCRXbv1A3T+wCaaCo7X1x+cZ3Z+YPmv8aw1DKC8XqHWSNDR
         4cRg==
X-Gm-Message-State: AOAM530vP9ref5mTkNtJYEQrepUSwGoVGDppMN6I7u/6FwFeR7+A3vdt
        KFF8afA9w+RN6TBa6+RJc2g=
X-Google-Smtp-Source: ABdhPJwrN+TGqwitW6OzLtn7nzPccO8xU68OD4Xob+uqCOWc5V6ZJoPyLWwPttbytZl6+2HIg7U3hQ==
X-Received: by 2002:a65:6a53:: with SMTP id o19mr7051111pgu.212.1608208266108;
        Thu, 17 Dec 2020 04:31:06 -0800 (PST)
Received: from localhost.localdomain ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id x5sm5044692pjr.38.2020.12.17.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 04:31:05 -0800 (PST)
From:   siyanteng01@gmail.com
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        siyanteng <siyanteng01@gmail.com>
Subject: [PATCH] cma_heap: fix implicit function declaration
Date:   Thu, 17 Dec 2020 20:30:53 +0800
Message-Id: <20201217123053.2166511-1-siyanteng01@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: siyanteng <siyanteng01@gmail.com>

When building cma_heap the following error shows up:

drivers/dma-buf/heaps/cma_heap.c:195:10: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
195 |  vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
    |          ^~~~
    |          kmap

Use this include: linux-next/include/linux/vmalloc.h

Signed-off-by: siyanteng <siyanteng01@gmail.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 5e7c3436310c..3c4e34301172 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 
 
 struct cma_heap {
-- 
2.27.0

