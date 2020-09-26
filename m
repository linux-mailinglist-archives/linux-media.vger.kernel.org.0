Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB41A2796A3
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 06:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbgIZEY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 00:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgIZEY5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 00:24:57 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AD8C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:24:57 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id u4so351187plr.4
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 21:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u7Z9AmMaAX9Vb4Ld53icr/xLpCufMXVRoWb2ypLsc80=;
        b=mVKL30wyp8QWxrO/AXPzbqcUkAgUwQ5PQLPtaTkJUo85MCgp0lLqI759YCjmqYCkfo
         0vofLOZ+oqHZEyalKS9grgA6QsTsHTLZUVGmcmn4NXUp+sOGw9tqWOL6ubqGxS3Nrc00
         q7tnYBkMjfrG4/lWYFeHodZ7QGCewEqSZ6IsvQh/3ZR0RsD03VrR8qY1GpHDuym1lq5x
         vmaDqZ8UEYL5EXf8Wktjix4s29ercJuTkpkr1blwjS1MwNlPlh5wQKPWzsMsYaIxYeKr
         psDWBvDxbJDar9sPHmE6joj+ftiS9KY4vzTpm7AdJVQcwhLAOkWQl4oK2hkRKUtga3cW
         uDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u7Z9AmMaAX9Vb4Ld53icr/xLpCufMXVRoWb2ypLsc80=;
        b=ZfuFaAbricJiyzbnz30g7VHbOIKpxhpMjNpS60U3YxtYXmyf5PUzNyOs7bmO1u6RgV
         xNOLtOwvE1bHvYvwvvFXRKF32YbFLX6dlQ+GdY94DnRrmGJ/3cb+XL/WUh56uROe+cig
         XceZuN3Qj+bpevk0dDto9MvtAtXpHMDd0/T5qfnt0Uz1OoAVTA00fSX/LIk3a4G+OWAX
         w5gZdc5WCYhWTptZh8xmjJlVrrgJRI8m+Igg8xnlirEs8nOx/4TnAWwl03YXOqym5FEs
         7elH6oIpngDMf70rYzveCbuxebYLu8tj8PSEXEBMVsAYDt14Ary/opOG2zsTngKUAgQI
         ZPSg==
X-Gm-Message-State: AOAM531D4lTPyBJC1EDc2pRu83sAbzPosBoqwLI/CMqFQ+n7qClfeNC3
        VgxlXRmvFUjtOMggvRHax8owLw==
X-Google-Smtp-Source: ABdhPJzK4xRnW4GQ7wUmaWVVtyqAzUaT2hQgL6Vkyx4xR/37YLk5BaJvFuZ7unQ2rLB0zWZJPt03KQ==
X-Received: by 2002:a17:902:8347:b029:d1:f365:6fb5 with SMTP id z7-20020a1709028347b02900d1f3656fb5mr2420471pln.61.1601094296568;
        Fri, 25 Sep 2020 21:24:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id a5sm3585886pgk.13.2020.09.25.21.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 21:24:55 -0700 (PDT)
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
Subject: [RFC][PATCH 0/6] dma-buf: Performance improvements for system heap
Date:   Sat, 26 Sep 2020 04:24:47 +0000
Message-Id: <20200926042453.67517-1-john.stultz@linaro.org>
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
  https://git.linaro.org/people/john.stultz/android-dev.git/commit/?h=dev/dma-buf-heap-perf&id=e33aabd34b300f8f8be8d71ec7253dd0abe702f2

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
 drivers/dma-buf/heaps/cma_heap.c     | 332 +++++++++++++++++----
 drivers/dma-buf/heaps/heap-helpers.c | 271 -----------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ----
 drivers/dma-buf/heaps/system_heap.c  | 426 ++++++++++++++++++++++++---
 6 files changed, 660 insertions(+), 424 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

-- 
2.17.1

