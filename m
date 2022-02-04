Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD294A9767
	for <lists+linux-media@lfdr.de>; Fri,  4 Feb 2022 11:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358106AbiBDKEp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Feb 2022 05:04:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358123AbiBDKEl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Feb 2022 05:04:41 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA94FC06173E
        for <linux-media@vger.kernel.org>; Fri,  4 Feb 2022 02:04:41 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id b13so12151443edn.0
        for <linux-media@vger.kernel.org>; Fri, 04 Feb 2022 02:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZqHQbmrfkSeH45/mViZpX0rM/1+Zya9JLAfRq+Wk+m8=;
        b=UTfcjAcYMTX22h1fkYsOiRByUelnx3X3bl0rl1ikR/aJO6QvD61verYKIzZSBf9eVH
         XMqkOwE5kUkib2ogQLmu9HTN+sqxX1DA8ZPCtSCYN5iqJXLrxhoFmdQ3aNSg/D68jcQv
         sk+hn2kTdnDJHyibjVdqeJ3b5uXROQUOHxgr/rVe55bsaZEUijn8ZKNW33JUzpRjrlCk
         yLpLk8j7YMqZmdFpktDAjs/2waxkOlWZ1MBtbrrkfOmigChFnQ0dpfADIXLTo/ahqMOs
         tb2ROlq3i1TYTKTd8NNDQIXQazEVb/bLBK/xrNsifZJPasNxltUuj2JFQ2/T18LSIdhV
         Xt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZqHQbmrfkSeH45/mViZpX0rM/1+Zya9JLAfRq+Wk+m8=;
        b=LxcQvWm7zrqRWmVZqKq9BFGuiuGZT5/lrOllZCt+voWyz5MpWrJhtTptYKqnSr+wHm
         MOj/BiJfImH90nNgTLbpLW0ICvw8z9s3TGX14/OXl0sdU8irXF5jjHsofWj9iw5/FJW0
         Ww8xPl0gOueT5/Rpm3Brju1nokMz5j8RbJPPJTyjs60HtXcMHwwrihvW+Et8zTx+cTFS
         E/KJcTuzIE9kIgzCNh9O+8Ji0j3R37IkJmzwO5T18nKRoCeotG6FcIPuQtaTA+tq1yxD
         YebkWn3jp0ltPDDTb9jXpfQahizH/9DTfZ6s+/fN5DqLFuy6Gwvd9LekTObOegyx7tCM
         V8bw==
X-Gm-Message-State: AOAM530i+KJU3CCveMNnF6nNJV8JzMhSbMjeT525NRlba0xJnEIWqddO
        f0tVYcgZVf8bsnpxS5aT6H4=
X-Google-Smtp-Source: ABdhPJzUVDomn6G0+FigRIR9w/gc5i6WBR+Ya0Sw2HySaEeAG3c5vDogUicENinZmg6AI0M2qES/dQ==
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr2158175edd.203.1643969080332;
        Fri, 04 Feb 2022 02:04:40 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
        by smtp.gmail.com with ESMTPSA id z10sm633943edl.54.2022.02.04.02.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 02:04:40 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     sumit.semwal@linaro.org, thomas.hellstrom@linux.intel.com,
        daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] dma-buf: warn about containers in dma_resv object
Date:   Fri,  4 Feb 2022 11:04:27 +0100
Message-Id: <20220204100429.2049-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204100429.2049-1-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Drivers should not add containers as shared fences to the dma_resv
object, instead each fence should be added individually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-resv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index ee31f15d633a..b51416405e86 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -256,6 +256,11 @@ void dma_resv_add_shared_fence(struct dma_resv *obj, struct dma_fence *fence)
 
 	dma_resv_assert_held(obj);
 
+	/* Drivers should not add containers here, instead add each fence
+	 * individually.
+	 */
+	WARN_ON(dma_fence_is_container(fence));
+
 	fobj = dma_resv_shared_list(obj);
 	count = fobj->shared_count;
 
-- 
2.25.1

