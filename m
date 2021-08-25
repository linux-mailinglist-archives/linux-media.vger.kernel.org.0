Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6123F7C32
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 20:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236730AbhHYSbv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 14:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbhHYSbu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 14:31:50 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3DBC061757
        for <linux-media@vger.kernel.org>; Wed, 25 Aug 2021 11:31:04 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id qe12-20020a17090b4f8c00b00179321cbae7so443966pjb.2
        for <linux-media@vger.kernel.org>; Wed, 25 Aug 2021 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qfk6BSvcgBI7Pc/jE3YW7xZmx9KCBB6EdbOOmvrD6Qc=;
        b=o/kwIS9r/jytIoTEBqNyRfm1IR4OcGddRWAo+yF9fpQLIb+9crwAo912mpdNTPka7k
         jEua+cYFJcUHhwXbdudbENPFHXpuVrdJGkBWbMgP8Yv3O9J1NT+qE4YQBsMDrHss0aZZ
         mATbCEQd0H2F5LDvP/Q+3vnLxXjVKghXtt5BkXNTr5o5yFTuj94hQvHvGCIfSZVCb4mK
         0ADz6SCGJEbjL0NoMsqBC2DXVteR88Zr8uklUMYOT1vFoR1QGC+VhR9OuTG6p8+OIto0
         BtmIqhLO9WQ4QLXP+gcM1TbJmvC7qhoC8xFqXKlb3PObbxREqOe3oodksIkkajQ6e2ku
         nR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qfk6BSvcgBI7Pc/jE3YW7xZmx9KCBB6EdbOOmvrD6Qc=;
        b=Dq1PvWT83OzkS+maZxVteTP1F4O07nkLdlqxB+NO/odEsevLfZ/gMj1Q73p0jP4kJ8
         VG1ZrL39PTY93YpQAIkPmGTNzBd9QUAVk+lvPujmZsulXywAwW6rwACmeUR+IlmMroCg
         VXmq/7ggIbWeCx0tGvsKA+05sOllY2ELjFWVDKkg+L5tsV/q0zuO43i4Ryq7HDwvOpzR
         vJQU+Ze/RD5yc0ym1BL6DoaeXsIQLoz4mtEl1ABJe6a7BEAUH8skrgrORfIqBlHNU/Q8
         jVNNX+Weq0OGg0hEqXyrZVL28L6R8h5MtoVKwRD+OftrOyV/ZcGT43CiMvP3jS0HweAF
         Xa+Q==
X-Gm-Message-State: AOAM530pW8HEg8ZHkodqnSVquAku1IMCJa6KeMGCuy1tBZvthtvbvML1
        RBT9sb0ggBbRH4nYRPXTxbz2Fw==
X-Google-Smtp-Source: ABdhPJxVRQSxOVe/2e9Ph5nzkeeO5xcy1nbYxdf35mJm41j0UOFiUOzNVz5K4WJ/FtwIgoSYLxNmiA==
X-Received: by 2002:a17:90a:eb0d:: with SMTP id j13mr10470703pjz.163.1629916263928;
        Wed, 25 Aug 2021 11:31:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id x20sm382813pfh.188.2021.08.25.11.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 11:31:03 -0700 (PDT)
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
        James Jones <jajones@nvidia.com>, Leo Yan <leo.yan@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH] dma-buf: system_heap: Avoid warning on mid-order allocations
Date:   Wed, 25 Aug 2021 18:30:59 +0000
Message-Id: <20210825183059.1085561-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When trying to do mid-order allocations, set __GFP_NOWARN to
avoid warning messages if the allocation fails, as we will
still fall back to single page allocatitions in that case.
This is the similar to what we already do for large order
allocations.

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
Cc: Leo Yan <leo.yan@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/system_heap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..f57a39ddd063 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -40,11 +40,12 @@ struct dma_heap_attachment {
 	bool mapped;
 };
 
+#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
+#define MID_ORDER_GFP (LOW_ORDER_GFP | __GFP_NOWARN)
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
 				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
 				| __GFP_COMP)
-#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
-static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORDER_GFP};
+static gfp_t order_flags[] = {HIGH_ORDER_GFP, MID_ORDER_GFP, LOW_ORDER_GFP};
 /*
  * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
  * to match with the sizes often found in IOMMUs. Using order 4 pages instead
-- 
2.25.1

