Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5D640052A
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 20:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350470AbhICSpY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 14:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350056AbhICSpQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 14:45:16 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3AEC061764;
        Fri,  3 Sep 2021 11:44:16 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 7so185985pfl.10;
        Fri, 03 Sep 2021 11:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ePxJybomMw7KwNl/06F/f9BuSUg0DBEjdIp9sOebF7o=;
        b=BvMTOHBoJQkt0BIhnKLwCwWsS493zyVEfOi0uWmcJC2buz2melLUXyaqwMUK4fSo3I
         y3aDAag69Mz6ynkPjigXyEg9Jl0nV+MYC1ndP1ma/Lh44jH/QjHOSs6x/3U/H1rD3bHS
         mGsKVnKN3FCYSTm655cSyebyavRCqtX2W3RFDB86rHu6twvqj4jx5KGUAgBKK/nWaiND
         dPap3WbMNgoBPMYK+DkbLTNIVDSf/Zi0N/glyV5rQz1uZ+3yUxXWiSjQrQONKO06UL+g
         gCo2fQMcpUmwzjBRHMY/2iVs3gkNmgkKjLnhHIvrWnKiOFne/vCmrW31siHiRvex8buq
         e2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ePxJybomMw7KwNl/06F/f9BuSUg0DBEjdIp9sOebF7o=;
        b=pb+sm67XgTj147EiaPWXOcnpb+cON0rWdoJ0Sa/uuSXwXAHfvVPCkDhhlN2NnTMRJ2
         CobIYIM9BgC0u95f5eGyzKmxbTZqUaVd7f+kCGdMLTbGWVIIWexqMRtE3xQypxLWtE2i
         8A4A794NMnV3pnVaf0PK5KBfr45dg2IyUlzuKN/zNzkAd741siPeDafIiNSiVuYNVnBw
         zo3OLTiNvYiFOgfHn9F9P9zB2baRVdkntzZdB4wbti/m+K1NHUlvnYuuSaqQxAuAmO0B
         Ke1nTwb9dp/B+i8mp1bO+en284C1KyykES6Z3hOA2a4AhiJqG7exdRYkJOiJWP8zMKkD
         Fnaw==
X-Gm-Message-State: AOAM533Xi5ir52tqwpSGJ6+zziJSy4Gj93q478uA6aHjd/f8xtiJoULn
        FKoEgHzQRwb3pAquZI3K/fI=
X-Google-Smtp-Source: ABdhPJyGwtF5mT3HvxEWHeK5JnkHczkKSvr/MzHyDH1596nS2xrPI0PFohMJe721nbImhGOHVn4BLA==
X-Received: by 2002:a63:6f83:: with SMTP id k125mr365747pgc.379.1630694655988;
        Fri, 03 Sep 2021 11:44:15 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id n13sm113692pff.164.2021.09.03.11.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 11:44:15 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 6/9] dma-buf/fence-array: Add fence deadline support
Date:   Fri,  3 Sep 2021 11:47:57 -0700
Message-Id: <20210903184806.1680887-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903184806.1680887-1-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/dma-buf/dma-fence-array.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index d3fbd950be94..8d194b09ee3d 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -119,12 +119,23 @@ static void dma_fence_array_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+static void dma_fence_array_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	struct dma_fence_array *array = to_dma_fence_array(fence);
+	unsigned i;
+
+	for (i = 0; i < array->num_fences; ++i)
+		dma_fence_set_deadline(array->fences[i], deadline);
+}
+
 const struct dma_fence_ops dma_fence_array_ops = {
 	.get_driver_name = dma_fence_array_get_driver_name,
 	.get_timeline_name = dma_fence_array_get_timeline_name,
 	.enable_signaling = dma_fence_array_enable_signaling,
 	.signaled = dma_fence_array_signaled,
 	.release = dma_fence_array_release,
+	.set_deadline = dma_fence_array_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_array_ops);
 
-- 
2.31.1

