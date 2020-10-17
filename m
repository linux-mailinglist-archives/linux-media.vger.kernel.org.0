Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B736290FE9
	for <lists+linux-media@lfdr.de>; Sat, 17 Oct 2020 08:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437004AbgJQGCe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Oct 2020 02:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436736AbgJQGBj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Oct 2020 02:01:39 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040A8C0613AF
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 18:33:03 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id az3so2281780pjb.4
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2020 18:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5OysJtvM42BExDrSWPepk1+ntovtD7pOwO/xcdChaw=;
        b=BGY23IMQRW0yl9F0jX0ao1lYRZTCAEgSrhcam5pGSwwBp0okWk+jVwa9eE2JYEObKD
         TsKP5vCtq0XeXWIsl8EF7en+vJ96qBGaRGyGS/sBNu7Cn3G0qLnJhsIIfJ0hODOD+x1G
         IWh+t//F12zX9gFDr9pJaxHGXIvAECOcSuKr1aVEhzQ7o3JU7JTi4cNqnAwUDV7CEcM0
         MBD3RflPojsg3nphAfPmG1ex0B8G5rezL4jWclRFgINVtkc1yZfGerA/eBJWgwj/fXwc
         gWBK7YerfQ0X/3X6o/xS+8FfUTNj/jeBheSJYLo3UZXYq6YQwTx3GX6EDpXobV03Kt+H
         vj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5OysJtvM42BExDrSWPepk1+ntovtD7pOwO/xcdChaw=;
        b=oE7pq+tN9D5mk6H+9KklSCVubM1DtjiDbwGP5RBfJ+xR/c5VmWPPY/jqXRAbQ/3NI/
         9naVyfErJNm+VE1hqAJDvL8mvGwUExo7s9EHtyAYlDCWbwT+zYaloKEF1vOJabnhlcXK
         d84+RRnL2ce75uZ+vfPifwUjG5vtZhXod7JmJ59riRxbiNUVwW6Z7rg65+sI6skKEqTV
         kp276rYOJxZ1o2La1rZ2A0BmYzIZLDPTYBiqriB1hSeQN7FY8qbAM5Gs2FA/96O6kozF
         5cQSiT3ZIeMgWP6/S8m/PdQVZzge+xkdSYQ1BLB4aif5MSHH8eurh+fZH93er7k6EWKk
         79kg==
X-Gm-Message-State: AOAM532TpZCwDCkzGuBVvu/343W+u2Yx7gMdx4vlsTDltFi4wss9l5rZ
        xYpu/pHij2Q2PLmUbLvER4QokA==
X-Google-Smtp-Source: ABdhPJwHJlZeqN6N0aXNECfz8P9EDG08ntt+PJs7x5uLqu0m/hGKeYlTAa5AxHxGx7pS07nW5P3kOw==
X-Received: by 2002:a17:902:7c14:b029:d4:d894:7eed with SMTP id x20-20020a1709027c14b02900d4d8947eedmr6994979pll.81.1602898382292;
        Fri, 16 Oct 2020 18:33:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id e186sm4222122pfh.60.2020.10.16.18.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 18:33:01 -0700 (PDT)
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
Subject: [PATCH v4 0/7] dma-buf: Performance improvements for system heap & a system-uncached implementation
Date:   Sat, 17 Oct 2020 01:32:48 +0000
Message-Id: <20201017013255.43568-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey All,
  So this is another revision of my patch series to performance
optimizations to the dma-buf system heap.

This series reworks the system heap to use sgtables, and then
consolidates the pagelist method from the heap-helpers into the
CMA heap. After which the heap-helpers logic is removed (as it
is unused). I'd still like to find a better way to avoid some of
the logic duplication in implementing the entire dma_buf_ops
handlers per heap. But unfortunately that code is tied somewhat
to how the buffer's memory is tracked.

After this, the series introduces an optimization that
Ørjan Eide implemented for ION that avoids calling sync on
attachments that don't have a mapping.

Next, an optimization to use larger order pages for the system
heap. This change brings us closer to the current performance
of the ION allocation code (though there still is a gap due
to ION using a mix of deferred-freeing and page pools, I'll be
looking at integrating those eventually).

Finally, a reworked version of my uncached system heap
implementation I was submitting a few weeks back. Since it
duplicated a lot of the now reworked system heap code, I
realized it would be much simpler to add the functionality to
the system_heap implementaiton itself.

While not improving the core allocation performance, the
uncached heap allocations do result in *much* improved
performance on HiKey960 as it avoids a lot of flushing and
invalidating buffers that the cpu doesn't touch often.

Feedback on these would be great!

thanks
-john

New in v4:
* Make sys_heap static (indirectly) Reported-by:
     kernel test robot <lkp@intel.com>
* Spelling fixes suggested by BrianS
* Make sys_uncached_heap static, as
    Reported-by: kernel test robot <lkp@intel.com>
* Fix wrong return value, caught by smatch
    Reported-by: kernel test robot <lkp@intel.com>
    Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
* Ensure we call flush/invalidate_kernel_vmap_range() in the
  uncached cases to try to address feedback about VIVT caches
  from Christoph
* Reorder a few lines as suggested by BrianS
* Avoid holding the initial mapping for the lifetime of the buffer
  as suggested by BrianS
* Fix a unlikely race between allocate and updating the dma_mask
  that BrianS noticed.


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

John Stultz (7):
  dma-buf: system_heap: Rework system heap to use sgtables instead of
    pagelists
  dma-buf: heaps: Move heap-helper logic into the cma_heap
    implementation
  dma-buf: heaps: Remove heap-helpers code
  dma-buf: heaps: Skip sync if not mapped
  dma-buf: system_heap: Allocate higher order pages if available
  dma-buf: dma-heap: Keep track of the heap device struct
  dma-buf: system_heap: Add a system-uncached heap re-using the system
    heap

 drivers/dma-buf/dma-heap.c           |  33 +-
 drivers/dma-buf/heaps/Makefile       |   1 -
 drivers/dma-buf/heaps/cma_heap.c     | 327 +++++++++++++++---
 drivers/dma-buf/heaps/heap-helpers.c | 270 ---------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ---
 drivers/dma-buf/heaps/system_heap.c  | 488 ++++++++++++++++++++++++---
 include/linux/dma-heap.h             |   9 +
 7 files changed, 749 insertions(+), 432 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

-- 
2.17.1

