Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115992ACC04
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 04:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730482AbgKJDtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 22:49:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730249AbgKJDti (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 22:49:38 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2231C0613CF
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 19:49:38 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w6so4653281pfu.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 19:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sDoxEoYXzOGDTRqKHmsK1PmkQ+v+kjtjORMumiaAdaY=;
        b=VRHtKHrHp+YYnxmp5gRTU5t79Mq1+WJABfC0oh+1Cza26fX35vqeIx0L7pTcKEGdU6
         oE7L7TMvPdmMiAWjDBxnEqqH6vZuu7nkQdgMtO4ya0zUSdp7zFPLHG3cAA/4+I6iJTSv
         Dfl+SskuSqxVcP06diQkjLgkoaYUzFobZyNAuAzBxuDJ8rW3bYmniabBkXEE0iYn6lKD
         2Offn4yIOhOBLAHNJbPGPN85qS+phnyo+6ye4t7WOzp8VkUz/Fdu0eGL1ZJ/ssKFriBO
         NlMBufWsCcZcYF5pfeFv30h41qabhd8gLf3ysS0yokatYdlM5+pOlK+I6mntknRC7TcX
         En8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sDoxEoYXzOGDTRqKHmsK1PmkQ+v+kjtjORMumiaAdaY=;
        b=FTm9vkJXzszdrmG5PRQC1lFJQTzCh40Q7L41NfKn4CPbIhd3rk8wuPMTFXoBi5P3bn
         sktiOt3l3uOpC1/bGpVrhysmD/mFkN/Igf6jSv/7rjSMohLH25YoAK1ouh0HDzzpwxLc
         pbEKJeLH6b7RZD9s0gGTK6toiypvFT2RQMK86hm6dX6QG8DuHz4pqm1FY4dAJ2W01ynu
         U12ygefLL5X1JRRlmqg0Ay+MBETTkvAqmyif8Huy2nZCl3UXw6ZRhwqtosEScube81SP
         gQYxqlklU3mGq0Kmkh+UQSoo/EURkDF0cXIoDTz4oIT5QK1NGfeZJiQ6s6muq0eve63q
         9hKg==
X-Gm-Message-State: AOAM5315WiK163A+4BV7MI38YFoTzuD/4wV1rULrTXb4uhNhLRFZniy0
        8VX5/PsrxlflMKT+GLWjsCwJlQ==
X-Google-Smtp-Source: ABdhPJzH2pSKF1PV/0DDDEBwUaDZ0Qy7l115AmJfeyhAyHCxq657BbYMJVv7zdoWvPj0zHB54WdOCw==
X-Received: by 2002:a17:90b:3708:: with SMTP id mg8mr2765897pjb.192.1604980178162;
        Mon, 09 Nov 2020 19:49:38 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b4sm12380693pfi.208.2020.11.09.19.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 19:49:37 -0800 (PST)
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
Subject: [PATCH v5 0/7] dma-buf: Performance improvements for system heap & a system-uncached implementation
Date:   Tue, 10 Nov 2020 03:49:27 +0000
Message-Id: <20201110034934.70898-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hey All,
  So just wanted to send my last revision of my patch series
of performance optimizations to the dma-buf system heap.

This series reworks the system heap to use sgtables, and then
consolidates the pagelist method from the heap-helpers into the
CMA heap. After which the heap-helpers logic is removed (as it
is unused). I'd still like to find a better way to avoid some of
the logic duplication in implementing the entire dma_buf_ops
handlers per heap. But unfortunately that code is tied somewhat
to how the buffer's memory is tracked. As more heaps show up I
think we'll have a better idea how to best share code, so for
now I think this is ok.

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
the system_heap implementation itself.

While not improving the core allocation performance, the
uncached heap allocations do result in *much* improved
performance on HiKey960 as it avoids a lot of flushing and
invalidating buffers that the cpu doesn't touch often.

Feedback on these would be great!

thanks
-john

New in v5:
* Added a comment explaining why the order sizes are
  chosen as they are

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
 drivers/dma-buf/heaps/cma_heap.c     | 324 +++++++++++++++---
 drivers/dma-buf/heaps/heap-helpers.c | 270 ---------------
 drivers/dma-buf/heaps/heap-helpers.h |  53 ---
 drivers/dma-buf/heaps/system_heap.c  | 494 ++++++++++++++++++++++++---
 include/linux/dma-heap.h             |   9 +
 7 files changed, 753 insertions(+), 431 deletions(-)
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.c
 delete mode 100644 drivers/dma-buf/heaps/heap-helpers.h

-- 
2.17.1

