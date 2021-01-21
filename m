Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F892FF2A5
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 19:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389152AbhAUR7l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 12:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388837AbhAURzt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 12:55:49 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED884C06174A;
        Thu, 21 Jan 2021 09:55:08 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id m6so1954848pfm.6;
        Thu, 21 Jan 2021 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lIeZgxiGCsLILQUzar0fN74yeBikTXjhSQrKP1TVbyY=;
        b=jS+vKFbZa38LNSPxMW8UUy2WyAZczTi8cqUZ8Vw7R9TKkQGeMLimDs4yHnSciY+ftd
         Ixya86WbgEW3Df77hJx6pHgYlKeTA3dm3xrC9i5P5ddd6Yi1+Br7KNojGx825Gr+KbHX
         /mN47KYt9ao1PLRr1vC1A0mUkDYRRA0oSrPQGov1JyHVoekE2avecMMSNw7RlFUoXFkI
         Yv+s513YWQNaR3bDwo3D5R8nGscWbtMvYop1wJopXj/e+l+SYVwRWp0wcyU2p4pDDZdD
         pU2+wR148BChhKCpD4OQmWSBs/TmfkqZP4ZkgUzx/M1xr70whN01dPoMnf2kcQ5RCE2M
         GHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=lIeZgxiGCsLILQUzar0fN74yeBikTXjhSQrKP1TVbyY=;
        b=KkXwUpJyrUA+nafw+0k6ox6yNeza+35tI4VYhNsgtiORfnjtpUlG23y1NiYpZcSybm
         2kTG0b0vTuOTnYfSZv1eDaFY80u87+ahMxUJExbJz0Hl2QCO+eWIFMT3EqwDhlocV1zU
         ofOmTHX6pr5M0x+u+9bhNclPOKDiXBlr7J0f0a/U+mKwM+b5J920gt+/fcYkygufyZTG
         j+tYU6nVH2T+j2L4U4k7C7No2warjDGyFF4Ssmvn0ns6Z8NWAwbS+WShErC+KROM888T
         DO9qB2Aq/K8XBhTXDecbsEA/FvG4pOf7OhXvbox/m0a7k51F4w/7CFgRSgm2yo2gvsCu
         JkQg==
X-Gm-Message-State: AOAM531ZCOZ96e/xXZ2uyVZZDj6phRnraggTW8z+SauRPdmp1r+VEKt8
        T9p4LVTS99Zvsu5rWmXBWEc=
X-Google-Smtp-Source: ABdhPJwtihxfcT7CpRtx34TZuGHZTSg1DELFPxcH324ViojdMpZTcYglQ8vCxZ6nbMkVxVbk2hfbpA==
X-Received: by 2002:a05:6a00:15cc:b029:1ba:5282:3ab8 with SMTP id o12-20020a056a0015ccb02901ba52823ab8mr792072pfu.77.1611251708510;
        Thu, 21 Jan 2021 09:55:08 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:74d0:bb24:e25e:dc4d])
        by smtp.gmail.com with ESMTPSA id t2sm6897317pju.19.2021.01.21.09.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 09:55:07 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
        hyesoo.yu@samsung.com, david@redhat.com, mhocko@suse.com,
        surenb@google.com, pullip.cho@samsung.com, joaodias@google.com,
        hridya@google.com, john.stultz@linaro.org, sumit.semwal@linaro.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v4 0/4] Chunk Heap Support on DMA-HEAP
Date:   Thu, 21 Jan 2021 09:54:58 -0800
Message-Id: <20210121175502.274391-1-minchan@kernel.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset introduces a new dma heap, "chunk-heap" that makes it
easy to perform the bulk allocation of high order pages.
It has been created to help optimize the 4K/8K HDR video playback
with secure DRM HW to protect contents on memory. The HW needs
physically contiguous memory chunks(e.g, 64K) up to several hundred
MB memory.

To make such high-order big bulk allocations work, chunk-heap uses
CMA area. To avoid CMA allocation long stall on blocking pages(e.g.,
page writeback and/or page locking), it uses failfast mode of the
CMA API(i.e., __GFP_NORETRY) so it will continue to find easy
migratable pages in different pageblocks without stalling. At last
resort, it will allow the blocking only if it couldn't find the
available memory in the end.

First two patches introduces the failfast mode as __GFP_NORETRY
in alloc_contig_range and the allow to use it from the CMA API.
Third patch introduces device tree syntax for chunk-heap to bind
the specific CMA area with chunk-heap.
Finally, last patch implements chunk-heap as dma-buf heap.

* since v3 - https://lore.kernel.org/linux-mm/20210113012143.1201105-1-minchan@kernel.org/
  * use prefix for chunk-name - John
  * fix yamllint error - Rob
  * add reviewed-by - Suren

* since v2 - https://lore.kernel.org/linux-mm/20201201175144.3996569-1-minchan@kernel.org/
  * introduce gfp_mask with __GFP_NORETRY on cma_alloc - Michal
  * do not expoert CMA APIs - Christoph
  * use compatible string for DT instead of dma-heap specific property - Hridya

* Since v1 - https://lore.kernel.org/linux-mm/20201117181935.3613581-1-minchan@kernel.org/
  * introduce alloc_contig_mode - David
  * use default CMA instead of device tree - John

Hyesoo Yu (2):
  dt-bindings: reserved-memory: Make DMA-BUF CMA heap DT-configurable
  dma-buf: heaps: add chunk heap to dmabuf heaps

Minchan Kim (2):
  mm: cma: introduce gfp flag in cma_alloc instead of no_warn
  mm: failfast mode with __GFP_NORETRY in alloc_contig_range

 .../reserved-memory/dma_heap_chunk.yaml       |  56 ++
 drivers/dma-buf/heaps/Kconfig                 |   8 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/chunk_heap.c            | 492 ++++++++++++++++++
 drivers/dma-buf/heaps/cma_heap.c              |   2 +-
 drivers/s390/char/vmcp.c                      |   2 +-
 include/linux/cma.h                           |   2 +-
 kernel/dma/contiguous.c                       |   3 +-
 mm/cma.c                                      |  12 +-
 mm/cma_debug.c                                |   2 +-
 mm/hugetlb.c                                  |   6 +-
 mm/page_alloc.c                               |   8 +-
 mm/secretmem.c                                |   3 +-
 13 files changed, 581 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/dma_heap_chunk.yaml
 create mode 100644 drivers/dma-buf/heaps/chunk_heap.c

-- 
2.30.0.296.g2bfb1c46d8-goog

