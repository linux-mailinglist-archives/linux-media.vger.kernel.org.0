Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16803310648
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 09:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhBEIHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 03:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231575AbhBEIHG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 03:07:06 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0742C06178A
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 00:06:26 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id b21so3992043pgk.7
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zKwoaw8bdzrF/FhsWPWtgeGzPvNKHujT195hYCj6ZCs=;
        b=K0THtBNlTDmpc3F2F9qo3PXiSflivANjFuhFHO0/w0OQkh9BJFI2DLfQCg3umFdPRT
         9DU5VNc7SfomsN45a3Kb9J3ZAcxuU/PcFTQaVK8roWSeawag+xcKSAwCs5/MQo8f2H3d
         viFJJrrovEHFzeIeEu8FqgsGG29CWEPTETHs3GBuUPsPi0L7kJqZ/1FRq6mEPCH/5VDb
         6V9juYaeCpzq6xCPRvBkXCRT98zvQdGItcWAQezWayHIaKbLl7aAMecJp3C2A6Upcqfq
         CHJNQWQRiVgDzfcgpmshCIoa3TqUQKF+dkdYVW/++YTotTS02mqYGn3sGt4SqKPViMJ0
         ULZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zKwoaw8bdzrF/FhsWPWtgeGzPvNKHujT195hYCj6ZCs=;
        b=eMIKlOWAzvumg9x2Pd9tndfGIu+dsCs4NiwCg+VdhDyV6PYx7bxoRnl6N4kJPGG/HF
         03kmiszUEJK5P0rvVfr3u4csTCTwsjlmJgn26k7h4vytmDyRsOG9d2f6ZUMTZG9sfUrK
         0ZKWI7g25CuhMYrfiVo9QIcCKPnwQdiB2YiPL9AE8Sfus12ycJvWnbzoQksKwroNRHGW
         WEzkTSIFuMvh5+JHQAw6zlImuNWMKX0Q2qlb6vQ1PT3YPPHLyX50DKzuha416FZ5WNtB
         iMiqiBfW9Zh7S6gOlYN+4tfoOngfEN0ZLFDrQ7TKuXMvSuVfV4PldecDaLVffd4vofpU
         09Tg==
X-Gm-Message-State: AOAM531pXfKK4dFzEg46Lw+KmwwEwg89SZCN24pdFBDk96CgqgU7a4tF
        n4i+VgkE6tgLKTp+6YU/ImOlRg==
X-Google-Smtp-Source: ABdhPJyRH2+aPnRrC0zh854reLPDhJihnNvupmtnylhjqPZmslPnqqJCsTysj9OXBE675MNHWcjGGA==
X-Received: by 2002:a63:bc02:: with SMTP id q2mr3217163pge.198.1612512385535;
        Fri, 05 Feb 2021 00:06:25 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 32sm9520070pgq.80.2021.02.05.00.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:06:24 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian Koenig <christian.koenig@amd.com>,
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
Subject: [RFC][PATCH v6 0/7] Generic page pool & deferred freeing for system dmabuf heap
Date:   Fri,  5 Feb 2021 08:06:14 +0000
Message-Id: <20210205080621.3102035-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series is starting to get long, so I figured I'd add a
short cover letter for context.

The point of this series is trying to add both deferred-freeing
logic as well as a page pool to the DMA-BUF system heap.

This is desired, as the combination of deferred freeing along
with the page pool allows us to offload page-zeroing out of
the allocation hot path. This was done originally with ION
and this patch series allows the DMA-BUF system heap to match
ION's system heap allocation performance in a simple
microbenchmark [1] (ION re-added to the kernel for comparision,
running on an x86 vm image):

./dmabuf-heap-bench -i 0 1 system                     
Testing dmabuf system vs ion heaptype 0 (flags: 0x1)
---------------------------------------------
dmabuf heap: alloc 4096 bytes 5000 times in 86572223 ns          17314 ns/call
ion heap:    alloc 4096 bytes 5000 times in 97442526 ns          19488 ns/call
dmabuf heap: alloc 1048576 bytes 5000 times in 196635057 ns      39327 ns/call
ion heap:    alloc 1048576 bytes 5000 times in 357323629 ns      71464 ns/call
dmabuf heap: alloc 8388608 bytes 5000 times in 3165445534 ns     633089 ns/call
ion heap:    alloc 8388608 bytes 5000 times in 3699591271 ns     739918 ns/call
dmabuf heap: alloc 33554432 bytes 5000 times in 13327402517 ns   2665480 ns/call
ion heap:    alloc 33554432 bytes 5000 times in 15292352796 ns   3058470 ns/call

Daniel didn't like earlier attempts to re-use the network
page-pool code to achieve this, and suggested the ttm_pool be
used instead. This required pulling the fairly tightly knit
ttm_pool logic apart, but after many failed attmempts I think
I found a workable abstraction to split out shared logic.

So this series contains a new generic drm_page_pool helper
library, converts the ttm_pool to use it, and then adds the
dmabuf deferred freeing and adds support to the dmabuf system
heap to use both deferred freeing and the new drm_page_pool.

Input would be greatly appreciated. Testing as well, as I don't
have any development hardware that utilizes the ttm pool.

thanks
-john

[1] https://android.googlesource.com/platform/system/memory/libdmabufheap/+/refs/heads/master/tests/dmabuf_heap_bench.c

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
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

John Stultz (7):
  drm: Add a sharable drm page-pool implementation
  drm: ttm_pool: Rename the ttm_pool_dma structure to ttm_pool_page_dat
  drm: ttm_pool: Rework ttm_pool_free_page to allow us to use it as a
    function pointer
  drm: ttm_pool: Rework ttm_pool to use drm_page_pool
  dma-buf: heaps: Add deferred-free-helper library code
  dma-buf: system_heap: Add drm pagepool support to system heap
  dma-buf: system_heap: Add deferred freeing to the system heap

 drivers/dma-buf/heaps/Kconfig                |   5 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/deferred-free-helper.c | 145 ++++++++++
 drivers/dma-buf/heaps/deferred-free-helper.h |  55 ++++
 drivers/dma-buf/heaps/system_heap.c          |  77 ++++-
 drivers/gpu/drm/Kconfig                      |   5 +
 drivers/gpu/drm/Makefile                     |   1 +
 drivers/gpu/drm/page_pool.c                  | 220 +++++++++++++++
 drivers/gpu/drm/ttm/ttm_pool.c               | 278 ++++++-------------
 include/drm/page_pool.h                      |  54 ++++
 include/drm/ttm/ttm_pool.h                   |  23 +-
 11 files changed, 639 insertions(+), 225 deletions(-)
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h
 create mode 100644 drivers/gpu/drm/page_pool.c
 create mode 100644 include/drm/page_pool.h

-- 
2.25.1

