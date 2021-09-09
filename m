Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13F44043AE
	for <lists+linux-media@lfdr.de>; Thu,  9 Sep 2021 04:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236257AbhIICiy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 22:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbhIICiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 22:38:54 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9EFC061575
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 19:37:45 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id e16so453992pfc.6
        for <linux-media@vger.kernel.org>; Wed, 08 Sep 2021 19:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5YCXnOiX361RXst/Dj0kh5mfTvHw/XbbmDLBua51kU=;
        b=JMMW46p0Yi2eqXRdlDn8FwI1MOm7uFUW6DSImYerI9dX1tYK2SO0GcNmaRQ/JHcFkM
         b4Y7d154QEgiSHzOAM7rZY2wU3AuhjqyMlwtAr/NZ8EY+dZTJjS0Wl5xZ6wwsLcYU6fL
         mOUWek4y0GmDzIoZQ1BkQZ6z+u8oVXLtki2zeYR+9MuN18RVqJV8svPagaL+AYahrAUL
         ebhFkHhRLKdSRvCU62zBFnd+gb/kDCrRgq4z04bZ4hIytA1HWjeomOnJoa02m1B7s3US
         D3pZB6XlvYPl1qdxlc+Tey4M1odRhMUJPct1zF42zOVcmGmnIOs+ESgnST2WcB0Cuewq
         GLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K5YCXnOiX361RXst/Dj0kh5mfTvHw/XbbmDLBua51kU=;
        b=giG8Y4/JU4Jm++BV/9MbySIR6YUtNeC0ChnW4lFqZgvt/K5VR1p5OSxcG76LWQWNf1
         oP6nuiuNeyeZCeM1HV45z3OJxQNVGdJoYRJcCU5WgE3lT9JHw4OmXRrP0FDq9W/M+AJv
         SHd/FpHhoropa8UTg2ijX12nQuVPuL5VMPy1HsYtLsdYlBcfixoYDIamSy/wZbeu+/Yg
         M013HsJHcFkXHsqp2krzEtRypY0Gq8vXNrRb1J88Wr4PeGBf4KpIJEcaHXrwaGron7iw
         lbFjD6A6L8GWeV7PEnZ67hzi7f97QKza1zRI/MXUnHjUVeIdMpUPKiyioEjQj6m08P/t
         aSag==
X-Gm-Message-State: AOAM532kgK54n+w9wKw+gqlicd4g3y28KubWrkLuYWW6hvbBKkPGQyBh
        0mXmCN1GEWxU7i7zu2AfXaloHA==
X-Google-Smtp-Source: ABdhPJx67ZfUJQOS7EFxj4RJBf9z5uJTsHC3qufEA08FU6XaEQgSBIopVskMt5axXYtC+B/dT4IGZQ==
X-Received: by 2002:a63:77cc:: with SMTP id s195mr528941pgc.147.1631155065095;
        Wed, 08 Sep 2021 19:37:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id n1sm206832pfv.209.2021.09.08.19.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 19:37:44 -0700 (PDT)
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
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, Leo Yan <leo.yan@linaro.org>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: system_heap: Avoid warning on mid-order allocations
Date:   Thu,  9 Sep 2021 02:37:41 +0000
Message-Id: <20210909023741.2592429-1-john.stultz@linaro.org>
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

