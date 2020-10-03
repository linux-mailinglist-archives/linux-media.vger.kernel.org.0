Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237C22820E5
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 06:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgJCEDF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 00:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgJCEDF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 00:03:05 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F599C0613D0
        for <linux-media@vger.kernel.org>; Fri,  2 Oct 2020 21:03:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id o20so2775072pfp.11
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2020 21:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VjaWCVVHnQkyjgZIf+F5rOHFvTh6Oj2mEVi69T9s924=;
        b=KHGKrTS4eMx4zeqKXxUrtf+ZXVtgB0NHPyLsRT96T1A3zG5TuEhdRy6U18S43zwA1f
         2YIldOPesNlBtEKnk0r5EV+J3Air7t7eHaKcV7ydpMka5SLd6wmNy+RFto6yfOJnvnlr
         9seQC5gFITUdsj0smCtMwOowEnt+3koJAv3ItloHOn6of1Y8HuK46F7Sf27EaVsMvwCM
         d3SrxbrCwIldC+c8v3HsbLx9Ncs8DNbfVDrzq/Cogdha17EnpLBWUbW4FJyVsTKZsFdk
         ZG1LubdsfYfXus12O2dAGXG2UVfZV8VN4fjMGlK++4U8fBGTqP6GiLcn3TSGOjir2b0L
         EFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VjaWCVVHnQkyjgZIf+F5rOHFvTh6Oj2mEVi69T9s924=;
        b=mJX4NOhTblFBLllJT0bKBx0gyWXqDrQj/F0IbfPBB/+RBcLNNjuyj06ITZlXt5JBja
         LoUn+wEfY4uzogyterZO6Jx1zI5jBH+jm0sn0JnXTOF8DF5lnK3QO8quP2JYN8tvPrUF
         D1c6PB9uvXgu7VpssNf8L9bhOPIkRd5P0ip/k+ovFGjrwOxiZ/smz66HsNVhr3mYZ4Sa
         T8QdcxS1XuTgMTnCcbjVqnABGDBMVvosggzl/FVPN35lPYBwTu8LWSsdoXNgYh4kBMNB
         2jgn4kv9x5G5SvQOOrzylAjEspsF22e0Xzekq4qLX+8jpFBw05uBMryq1/WZwLOeF3Xa
         RmVA==
X-Gm-Message-State: AOAM530fFq7Xmj09d56nSy3HDV+eKVu/cEkNSJglby8JMeUdtm9m4hXq
        BIenuRemMyKhUGTebmii2YOK24DPP/aZmg==
X-Google-Smtp-Source: ABdhPJzkXxcRaSO+6+4+aDg4abp67iwneyQm/cvxOIoR8lrdt1w8XWzkhH0Qz1V1uu9y3MYgXyu3PQ==
X-Received: by 2002:aa7:8249:0:b029:142:2501:39dd with SMTP id e9-20020aa782490000b0290142250139ddmr5982786pfn.44.1601697783389;
        Fri, 02 Oct 2020 21:03:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id 190sm3909290pfy.22.2020.10.02.21.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 21:03:02 -0700 (PDT)
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
Subject: [PATCH v3 0/7] dma-buf: Performance improvements for system heap & a system-uncached implementation
Date:   Sat,  3 Oct 2020 04:02:50 +0000
Message-Id: <20201003040257.62768-1-john.stultz@linaro.org>
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

After this, the series introduces an optimization that
Ørjan Eide implemented for ION that avoids calling sync on
attachments that don't have a mapping.

Next, an optimization to use larger order pages for the system
heap. This change brings us closer to the current performance
of the ION code.

Unfortunately, after submitting the last round, I realized that
part of the reason the page-pooling patch I had included was
providing such great performance numbers, was because the
network page-pool implementation doesn't zero pages that it
pulls from the cache. This is very inappropriate for buffers we
pass to userland and was what gave it an unfair advantage
(almost constant time performance) relative to ION's allocation
performance numbers. I added some patches to zero the buffers
manually similar to how ION does it, but I found this resulted
in basically no performance improvement from the standard page
allocator. Thus I've dropped that patch in this series for now.

Unfortunately this means we still have a performance delta from
the ION system heap as measured by my microbenchmark, and this
delta comes from ION system_heap's use of deferred freeing of
pages. So less work is done in the measured interval of the
microbenchmark. I'll be looking at adding similar code
eventually but I don't want to hold the rest of the patches up
on this, as it is still a good improvement over the current
code.

I've updated the chart I shared earlier with current numbers
(including with the unsubmitted net pagepool implementation, and
with a different unsubmitted pagepool implementation borrowed
from ION) here:
https://docs.google.com/spreadsheets/d/1-1C8ZQpmkl_0DISkI6z4xelE08MlNAN7oEu34AnO4Ao/edit?usp=sharing

I did add to this series a reworked version of my uncached
system heap implementation I was submitting a few weeks back.
Since it duplicated a lot of the now reworked system heap code,
I realized it would be much simpler to add the functionality to
the system_heap implementaiton itself.

While not improving the core allocation performance, the
uncached heap allocations do result in *much* improved
performance on HiKey960 as it avoids a lot of flushing and
invalidating buffers that the cpu doesn't touch often.

Feedback on these would be great!

thanks
-john


New in v3:
* Dropped page-pool patches as after correcting the code to
  zero buffers, they provided no net performance gain.
* Added system-uncached implementation ontop of reworked
  system-heap.
* Use the new sgtable mapping functions, in the system and cma
  code  as Suggested-by: Daniel Mentz <danielmentz@google.com>
* Cleanup: Use page_size() rather then open-coding it



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
 drivers/dma-buf/heaps/heap-helpers.c | 271 ---------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ---
 drivers/dma-buf/heaps/system_heap.c  | 480 ++++++++++++++++++++++++---
 include/linux/dma-heap.h             |   9 +
 7 files changed, 741 insertions(+), 433 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

-- 
2.17.1

