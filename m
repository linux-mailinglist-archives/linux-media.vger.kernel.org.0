Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1A43B7B43
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 03:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhF3Bg6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Jun 2021 21:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhF3Bg6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Jun 2021 21:36:58 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8C83C061760
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 18:34:30 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id w15so552024pgk.13
        for <linux-media@vger.kernel.org>; Tue, 29 Jun 2021 18:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBEInOJoYqxwrlE52K6MZcC340XktufPlx9tQHJv3jk=;
        b=fpOTxwV4zxW4Q0vXTnzAdyWRKSNOkJ6Yt5nUdEs8+fAMn3XqRToSnVNet0pTIFnaQR
         cCMSSrzMa51N8/Ca9p8l+jqocYP7FxLde/JNiiOXRZpFjYvUZvmjGetBCLP3kAsvmSTu
         vPYFOQyaPT9Nc9Ch2RPF7gKN/31atj/e33ZaTm42GJBlu+dsply2TCWz1h9jDasglrK2
         lxd+aDaz4eznt1K2MTO1ZUdHwqjfof/Z0YadmFAefD1MZJ0VnjY/1G99vVC7naW8Orzn
         AsBMrloc8ZhRKOkpgR1aURI0ECgbQu8TPF0eYWu1KJ4Sq+UEo+4orwgB5DI31WQzdTTg
         N9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FBEInOJoYqxwrlE52K6MZcC340XktufPlx9tQHJv3jk=;
        b=fEGNwq1BajPrJAK7lzdA21y5NV5rryQ8GCzG0I0TYpSCwZI09yicD/QsfzVpe86+mo
         AK8L7ftW9GVgBwdh8WdONBNXNxF/bAKgq44/MDA59WPlmalf6D+H85Hcit3vQY0+MfxD
         InAVOPhODNxKh8qWyTApwiiDex/UwOYojgdEYVhD6wCv/skwqeOJ5i3LU5UH3ZcEUvQK
         BxWvP3TCZUwkJ/7SwmVMv3FarmnwKkvgpqmT47/AhhFPDCkC3kLIpJbEsosnQL+OQOuH
         Nz6on1E6o+BwqugfrqIulfvDqGuKcZqvT+fK+1R6zbSwjgEhCkIuYXxfwIWukRuXU8fn
         bvQA==
X-Gm-Message-State: AOAM531sjSyk4qlMCHwMF43pFwmLSIC/7tlHSzLvVjsMsDDK9eolj20H
        iPS3fLghKq8/OW7Df1VwzFpYow==
X-Google-Smtp-Source: ABdhPJzSoY1EJeRDCOfTvywVVy/GFDhxptRl0SIl647lxALfT485QBgs8oQza+YKOuAOTR5gyn9Lag==
X-Received: by 2002:a63:5966:: with SMTP id j38mr30913446pgm.451.1625016870033;
        Tue, 29 Jun 2021 18:34:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id g8sm20252901pja.14.2021.06.29.18.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 18:34:29 -0700 (PDT)
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
Subject: [PATCH v9 0/5] Generic page pool & deferred freeing for system dmabuf hea
Date:   Wed, 30 Jun 2021 01:34:16 +0000
Message-Id: <20210630013421.735092-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After an unfortunately long pause (covid work-schedule burnout),
I wanted to revive and resubmit this series.

As before, the point of this series is trying to add both a page
pool as well as deferred-freeingto the DMA-BUF system heap to
improve allocation performance (so that it can match or beat the
old ION system heaps performance).

The combination of the page pool along with deferred freeing
allows us to offload page-zeroing out of the allocation hot
path. This was done originally with ION and this patch series
allows the DMA-BUF system heap to match ION's system heap
allocation performance in a simple microbenchmark [1] (ION
re-added to the kernel for comparision, running on an x86 vm
image):

./dmabuf-heap-bench -i 0 1 system
Testing dmabuf system vs ion heaptype 0 (flags: 0x1)
---------------------------------------------
dmabuf heap: alloc 4096 bytes 5000 times in 79314244 ns          15862 ns/call
ion heap:    alloc 4096 bytes 5000 times in 107390769 ns         21478 ns/call
dmabuf heap: alloc 1048576 bytes 5000 times in 259083419 ns      51816 ns/call
ion heap:    alloc 1048576 bytes 5000 times in 340497344 ns      68099 ns/call
dmabuf heap: alloc 8388608 bytes 5000 times in 2603105563 ns     520621 ns/call
ion heap:    alloc 8388608 bytes 5000 times in 3613592860 ns     722718 ns/call
dmabuf heap: alloc 33554432 bytes 5000 times in 12212492979 ns   2442498 ns/call
ion heap:    alloc 33554432 bytes 5000 times in 14584157792 ns   2916831 ns/call


Daniel didn't like earlier attempts to re-use the network
page-pool code to achieve this, and suggested the ttm_pool be
used instead, so this series pulls the page pool functionality
out of the ttm_pool logic and creates a generic page pool
that can be shared.

New in v9:
* Tried to address Christian König's feedback on the page pool
  changes (Kerneldoc, static functions, locking issues, duplicative
  order tracking)
* Fix up Kconfig dependency issue as Reported-by:
  kernel test robot <lkp@intel.com>
* Fix compiler warning Reported-by:
  kernel test robot <lkp@intel.com>

I know Christian had some less specific feedback on the deferred free
work that I'd like to revisit, but I wanted to restart the discussion
with this new series, rather then trying to dregdge up and reply to
a ~4mo old thread.

Input would be greatly appreciated. Testing as well, as I don't
have any development hardware that utilizes the ttm pool.

Thanks
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

John Stultz (5):
  drm: Add a sharable drm page-pool implementation
  drm: ttm_pool: Rework ttm_pool to use drm_page_pool
  dma-buf: system_heap: Add drm pagepool support to system heap
  dma-buf: heaps: Add deferred-free-helper library code
  dma-buf: system_heap: Add deferred freeing to the system heap

 drivers/dma-buf/heaps/Kconfig                |   5 +
 drivers/dma-buf/heaps/Makefile               |   1 +
 drivers/dma-buf/heaps/deferred-free-helper.c | 138 +++++++++
 drivers/dma-buf/heaps/deferred-free-helper.h |  55 ++++
 drivers/dma-buf/heaps/system_heap.c          |  46 ++-
 drivers/gpu/drm/Kconfig                      |   4 +
 drivers/gpu/drm/Makefile                     |   2 +
 drivers/gpu/drm/page_pool.c                  | 297 +++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_pool.c               | 167 ++---------
 include/drm/page_pool.h                      |  68 +++++
 include/drm/ttm/ttm_pool.h                   |  14 +-
 11 files changed, 643 insertions(+), 154 deletions(-)
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.c
 create mode 100644 drivers/dma-buf/heaps/deferred-free-helper.h
 create mode 100644 drivers/gpu/drm/page_pool.c
 create mode 100644 include/drm/page_pool.h

-- 
2.25.1

