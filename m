Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C612CAA2C
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 18:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387448AbgLARwa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 12:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbgLARwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 12:52:30 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCE8C0613CF;
        Tue,  1 Dec 2020 09:51:50 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id r9so1675550pjl.5;
        Tue, 01 Dec 2020 09:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k6Xb9MXJVov2wm4juOQ7YbGN8C26NDDinzdyjfuUn68=;
        b=ok8kPmCe3llCdZTU47fe5dTRRP4u7SG0gPPLUr2FUD806/GcKfVnyVsXgjOcHewNr+
         HyXZhRjFiu/IiaCWgjBO9ZzsSRBlNKSpulVhiKziCzQE1zVHBtkA65QRS4vcFapPlgdV
         UHr/eS5gxALc3bwXwsHfokAxLWuAgCiHpV/GvnmRaQFqNT3PSh3/nr/bOr+OyzkwF40J
         3zWpu/RmaSvX+e/hYV+ucNN8qJyaEGDDkErBfGTm/8wXLDNg+c3gFVkxe5UyGeqkT8id
         ITmSl/ToKZiudo/F2EiSj/L9nY/6I8Lw3gnV9d0dvyFwfFeIsOpoO9t7LuBoo/qMkZUH
         sF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=k6Xb9MXJVov2wm4juOQ7YbGN8C26NDDinzdyjfuUn68=;
        b=On/pyF/T3/BlmeagcWGbWXNNcXCYfwXMfhVuBlc86xX2CTa/65APn1TguzhWsPy51I
         364lIlN/RYsHToS+0cjbfIQRcX7YrmmDbGOK0UADoAEontlsCNz69bcOQi7j2SMKKwhK
         LXF6xlGMorAcLq/1ivpNFD5REBOG6trjF09ie3BD05au1+KSQL6KNelVPHAl78e1rfX2
         jYAae+a+75L4q69m60bSZZuNfjQ/Xp09QIoZRRa/8lpvKqfg1gMwV9P2KzsmyhkQsStO
         MKlq4D/AsLUSH+SaMxl1qBybh8fggWmjmk4pNA7Jk9WZD+RfiImD1n/d7PjrpdIFDUds
         p6Gw==
X-Gm-Message-State: AOAM530jZXRX4U2K2AfJtzPGOgp37u2SJ30LEU9d6SHJJnHWYfbhKJps
        7phLYorGBkdMjr7lvs0oR6c=
X-Google-Smtp-Source: ABdhPJzSmx8SXb+o8aTUE2sD5HDesL5BsQaDTaF4cLIZmuGSDBxGOhBU7W0xvz5ruGhxvmVGYiktuw==
X-Received: by 2002:a17:90a:c257:: with SMTP id d23mr3934185pjx.211.1606845109590;
        Tue, 01 Dec 2020 09:51:49 -0800 (PST)
Received: from bbox-1.mtv.corp.google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id q23sm390082pfg.192.2020.12.01.09.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 09:51:48 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
From:   Minchan Kim <minchan@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        hyesoo.yu@samsung.com, willy@infradead.org, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz, surenb@google.com,
        pullip.cho@samsung.com, joaodias@google.com, hridya@google.com,
        sumit.semwal@linaro.org, john.stultz@linaro.org,
        Brian.Starkey@arm.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
        Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 0/4] Chunk Heap Support on DMA-HEAP
Date:   Tue,  1 Dec 2020 09:51:40 -0800
Message-Id: <20201201175144.3996569-1-minchan@kernel.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset introduces a new dma heap, chunk heap that makes it
easy to perform the bulk allocation of high order pages.
It has been created to help optimize the 4K/8K HDR video playback
with secure DRM HW to protect contents on memory. The HW needs
physically contiguous memory chunks up to several hundred MB memory.

This patchset is against on next-20201130.

The patchset includes the following:
 - cma_alloc_bulk API
 - export dma-heap API to register kernel module dma heap.
 - add chunk heap implementation.

* Since v1 - 
  https://lore.kernel.org/linux-mm/20201117181935.3613581-1-minchan@kernel.org/

  * introduce alloc_contig_mode - David
  * use default CMA instead of device tree - John
    
Hyesoo Yu (2):
  dma-buf: add export symbol for dma-heap
  dma-buf: heaps: add chunk heap to dmabuf heaps

Minchan Kim (2):
  mm: introduce alloc_contig_mode
  mm: introduce cma_alloc_bulk API

 drivers/dma-buf/dma-heap.c         |   2 +
 drivers/dma-buf/heaps/Kconfig      |  15 +
 drivers/dma-buf/heaps/Makefile     |   1 +
 drivers/dma-buf/heaps/chunk_heap.c | 429 +++++++++++++++++++++++++++++
 drivers/virtio/virtio_mem.c        |   2 +-
 include/linux/cma.h                |   5 +
 include/linux/gfp.h                |  10 +-
 kernel/dma/contiguous.c            |   1 +
 mm/cma.c                           | 134 ++++++++-
 mm/page_alloc.c                    |  25 +-
 10 files changed, 607 insertions(+), 17 deletions(-)
 create mode 100644 drivers/dma-buf/heaps/chunk_heap.c

-- 
2.29.2.454.gaff20da3a2-goog

