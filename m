Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 448BE27F727
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 03:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730560AbgJABV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 21:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730499AbgJABV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 21:21:56 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99CAC061755
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:21:55 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 7so2558596pgm.11
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvY55OKvdBQuZcw5ImE/AN2tBcW6EILZrL1RIyXg90E=;
        b=b7EY98onG6qWo1zxpcIa1WXVRCHcZZvWrwT6452qabZ8yWmguH1x4Px6q+6NsmdHyj
         owqPUCFI4SjLTAX2FsL59orOOEgACCwFoe1I3VVFqgSzfMw4i04YEn6BTwqFwL6SUaJP
         MBgVjf+YW0zCPsGcxND0z7bldFNESSs+iNRyWFiPCCsEGFNZBdeDfIlvXTKDnfdkhzFI
         UcZi4HTOWf4l4/O7IN7Jf3xd7Rijuxy089ScscjJfiqTojcdjC+WjwCfJoJTqzjx4cp0
         sIMtEv2c29Nu7sVd/MKo7e0B0IoP5t7BIMra0+twOu1UBhZNDTdDIjJr2UJy+Rz0cAZK
         rmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvY55OKvdBQuZcw5ImE/AN2tBcW6EILZrL1RIyXg90E=;
        b=fQgOx9j5Ij7u2p3l0Z9Mw0dikcSkNv6W+ibtn+Gn82lAcDFuhip6h4e9kC8rAXz/vU
         /g+9bZ28ABCddHKGY8iGml/Ub4eGHLPpocA95KmNqEw8qByjfCt2uy8cPFTcTpX7/xGx
         l2R6rW6ch12qgweejjEWON8rFAssyIwEIRT937kESjCQzzqy2lt6/m1i7Kbk0L7wk9gE
         4zav0KqgBdTLIjeYAx3rdCRviN7RoAAqQt4uBlUT63Ko5DEQOs9oCQ58Oggr08yF3gRi
         P7Z4cpZbHZut4usOQzjEKzfJZZja4yYYtav+aRrCLfhdOBhNuk06iYLV/HScoTqAGOZd
         30Cg==
X-Gm-Message-State: AOAM530PPPdBxWz3FU8/eQWj9XLmUV55x7+WRJ0gbBAYSpNEFZpGY1zw
        6UwN0R7GhUuiiOyITu8TXDW8qA==
X-Google-Smtp-Source: ABdhPJxM/aCR52AHNBDdjEC2YIKRegJP/yr49/KVMHTHHeY78lQHqaRradU2OZgQ2PcioJvZKdDoFQ==
X-Received: by 2002:a62:3605:0:b029:151:ee7f:d910 with SMTP id d5-20020a6236050000b0290151ee7fd910mr355682pfa.49.1601515315070;
        Wed, 30 Sep 2020 18:21:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id s187sm4229372pfc.134.2020.09.30.18.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 18:21:54 -0700 (PDT)
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
        =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] dma-buf: Performance improvements for system heap
Date:   Thu,  1 Oct 2020 01:21:45 +0000
Message-Id: <20201001012151.21149-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey All,
  So this patch series contains a series of performance
optimizations to the dma-buf system heap.

Unfortunately, in working these up, I realized the heap-helpers
infrastructure we tried to add to miniimize code duplication is
not as generic as we intended. For some heaps it makes sense to
deal with page lists, for other heaps it makes more sense to
track things with sgtables.

So this series reworks the system heap to use sgtables, and then
consolidates the pagelist method from the heap-helpers into the
CMA heap. After which the heap-helpers logic is removed (as it
is unused). I'd still like to find a better way to avoid some of
the logic duplication in implementing the entire dma_buf_ops
handlers per heap. But unfortunately that code is tied somewhat
to how the buffer's memory is tracked.

After this, the series introduces two optimizations to the the
system heap, utilizing large order pages, and adding a page-pool
(maybe abusing the pagepool logic from the network code, but it
seems silly to reimplement it).

I implemented a simple allocation microbenchmark to compare
dmabuf heaps vs ion:
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/dma-buf-heap-perf&id=24c723fb41c7a9cb5cf9b2412722866cba3a1417

With these changes, the allocation path is *much* improved,
performing better then ION (though to be fair, the repeated
allocating and freeing of the same size buffer is the ideal
case for the pagepool logic, so don't read too much into it).

I charted some datapoints from the microbenchmark with each
of the patches should folks be interested.
https://docs.google.com/spreadsheets/d/1-1C8ZQpmkl_0DISkI6z4xelE08MlNAN7oEu34AnO4Ao/edit#gid=0

Finally, a port of a patch that Ørjan Eide implemented for ION
that avoids calling sync on attachments that don't have a
mapping.

Feedback on these would be great!

thanks
-john

New in v2:
* Fix unused return value and locking issue Reported-by:
    kernel test robot <lkp@intel.com>
    Julia Lawall <julia.lawall@inria.fr>
* Make system_heap_buf_ops static Reported-by:
     kernel test robot <lkp@intel.com>
* Make cma_heap_buf_ops static suggested by
    kernel test robot <lkp@intel.com>
* Fix uninitialized return in cma Reported-by:
    kernel test robot <lkp@intel.com>
* Minor cleanups

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

John Stultz (6):
  dma-buf: system_heap: Rework system heap to use sgtables instead of
    pagelists
  dma-buf: heaps: Move heap-helper logic into the cma_heap
    implementation
  dma-buf: heaps: Remove heap-helpers code
  dma-buf: system_heap: Allocate higher order pages if available
  dma-buf: system_heap: Add pagepool support to system heap
  dma-buf: heaps: Skip sync if not mapped

 drivers/dma-buf/heaps/Kconfig        |   1 +
 drivers/dma-buf/heaps/Makefile       |   1 -
 drivers/dma-buf/heaps/cma_heap.c     | 328 ++++++++++++++++----
 drivers/dma-buf/heaps/heap-helpers.c | 271 -----------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ----
 drivers/dma-buf/heaps/system_heap.c  | 427 ++++++++++++++++++++++++---
 6 files changed, 659 insertions(+), 422 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

-- 
2.17.1

