Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC1C32A856
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580184AbhCBRac (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445226AbhCBC5R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 21:57:17 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48159C06178C
        for <linux-media@vger.kernel.org>; Mon,  1 Mar 2021 18:56:37 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id z7so11160241plk.7
        for <linux-media@vger.kernel.org>; Mon, 01 Mar 2021 18:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qLXJJyTj2yGmwufJrM80dinHQtmlczvZXDaE20Ufino=;
        b=htFcUre7nmJ937TM3BXjnoM2/k9jS0HNIBATgAqlEiVfL9DmC9GCGhliVgBKQ0mW0q
         KSNhTijHLDFsuBUkzog/Ge0LuUq49qwdfqMo7d6xKfuFj15nX0fCIv033jIIOPT22C8c
         Adks/asM17AtDNgEx+9zIgi4GvJ2ZG0J7QmxiR5LxhzKJOhYh67DgOd6lgYFE93Rej0q
         MOGxYRsCUSV2r69BKt4OInL1gGNV5935enQ85wzw/1gYbK1Kb7synjizSroNH31eHCMb
         ceowi6mkHPHx6dZwMJmEddKkmEMCv1Q57MPtKJxWjxpx7OwiHqVcr3ogjnkm7gHAOM68
         TM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qLXJJyTj2yGmwufJrM80dinHQtmlczvZXDaE20Ufino=;
        b=KzSf7ZwNdIji7CIEV2w4GWTyBAGYRxecjW0/YpsvdKeyeQBC28qYJIW0FM0lOPjrjQ
         3y/lCyJTeaqXGVviEpcb9fy93AvUCzHhGXQYMT1VJSG0rqo4FbD9Mawe95uu9Da70JlO
         lxgL94bvQMvhidCIwNuYS3Wm7Gxv93W1064bE+XNdefqQpFePLpoG3haO92nj5HLsl6P
         1jVgYpU0ZtCprEtyKYiYCU7nMy5kXf0coRd8PXHoOgR6Mybig/7MNKUv8mza9KCgQAuZ
         JdGnce3qHnN0Rqt/mK4lM32Yf+trIjU0G/3+BYPBdj8xqGcnINpNkTG2Ulkxe54HQTXo
         aUxQ==
X-Gm-Message-State: AOAM532cTA7Aii4Bw3LnK3AqFb6OW7xrT5I22kTV1Ipid0y4OvM31A/L
        x/AF/VvJE/v9/Tr0N6lK9a9NaA==
X-Google-Smtp-Source: ABdhPJxBHNAF2OwS2gBChuYXTnwdjSw4f0lQ7k1NHAI6CiKbCqzF3nuyVHTR6ygWHmzZuPm/qFfgtQ==
X-Received: by 2002:a17:902:e20c:b029:e4:7a08:8452 with SMTP id u12-20020a170902e20cb02900e47a088452mr1563793plb.74.1614653796901;
        Mon, 01 Mar 2021 18:56:36 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id r16sm18928400pfh.168.2021.03.01.18.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 18:56:36 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
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
Subject: [RESEND][PATCH v2 2/2] dma-buf: heaps: Fix the name used when exporting dmabufs to be the actual heap name
Date:   Tue,  2 Mar 2021 02:56:29 +0000
Message-Id: <20210302025629.2558215-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302025629.2558215-1-john.stultz@linaro.org>
References: <20210302025629.2558215-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

By default dma_buf_export() sets the exporter name to be
KBUILD_MODNAME. Unfortunately this may not be identical to the
string used as the heap name (ie: "system" vs "system_heap").

This can cause some minor confusion with tooling, and there is
the future potential where multiple heap types may be exported
by the same module (but would all have the same name).

So to avoid all this, set the exporter exp_name to the heap name.

Cc: Daniel Vetter <daniel@ffwll.ch>
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
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/cma_heap.c    | 1 +
 drivers/dma-buf/heaps/system_heap.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 5d64eccd21d6..0c05b79870f9 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -339,6 +339,7 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 	buffer->pagecount = pagecount;
 
 	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.ops = &cma_heap_buf_ops;
 	exp_info.size = buffer->len;
 	exp_info.flags = fd_flags;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 29e49ac17251..23a7e74ef966 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -390,6 +390,7 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 	}
 
 	/* create the dmabuf */
+	exp_info.exp_name = dma_heap_get_name(heap);
 	exp_info.ops = &system_heap_buf_ops;
 	exp_info.size = buffer->len;
 	exp_info.flags = fd_flags;
-- 
2.25.1

