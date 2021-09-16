Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7DC40D8B6
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238220AbhIPLcY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238207AbhIPLcX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:23 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63707C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:03 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so4250174wms.2
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nKJGab4KxNdwiRXb5cOBKKfaCdcTidREjaK9cb7+I50=;
        b=faC9MiRQTffUsa9jeg4wzjIR+8ziw8LUSd/l7eg45cOhMU4ErUSfimwL4tqzjPghpt
         LuNCyQJ86XDUiv+5Uexn+RL9LYs+ixfFp+aQXprFunAoIjC728oe5hmkbPzORbc5aD6k
         zfJkmBLyOW5jOYVf0reUr8LNw4MG983Jav4CMltaJ7frH+X9l5n9SeKDtNNK2cT3UrtQ
         FEOCUn/wY3v0dlMDfc5T8F7dOp/P67KWFS0kUBgeVRKp85tOk+VRKJC2ORsXTcr42GZi
         mk/0ZpbauxL0WZjXi9PDG/BuoT2MjcPXnMCwmPLWkBDLbo7sgUtclt0pl5onmRKZWK32
         JynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nKJGab4KxNdwiRXb5cOBKKfaCdcTidREjaK9cb7+I50=;
        b=mghYNJpZ5eVqUb9vP8vIYpfZbcnG9gmXpxZkKqAws0+ESaN53odRsbqpO0662zNVB6
         2xT0oncHLIfzHKXNK0n3Gau14cCvZK1qvGcXf5DK/u4tndOgvw0iuy1IExTDjqRtvWBu
         LnvAWZKPWSW7MnynubVQ0eY+BzPeEnAUmMhlxYkMWbID65CyFqXnDe5S2GzlBtl+aRn8
         ES3fCI0xZQdhofaXzsklxFPfiRWD378uDYPR0ZFvpOoZH5g61ke+Tvc/d9l+7cNduFA4
         3U2Ihvu+N8sxnDZukZas3ZaZGAYyexocm1Shi+U/JHPb8LZDQJc916ZmKDeoMbAQRlzk
         8Dzg==
X-Gm-Message-State: AOAM531Tf22sI7qHUi/fHGaQVY3+SGBnWck4ZbtiSehgDT00fpLyy/GD
        7iB1+bfqYPOnUfVuFkG4mNE=
X-Google-Smtp-Source: ABdhPJyZjUH4DtJZeezkSkAZ1UqJnFkp/cGf8pQdOoCFKn3HbozqyHhH6ejvkAZtKawfIwM534rzUQ==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr9530127wmf.82.1631791862006;
        Thu, 16 Sep 2021 04:31:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:01 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/26] drm/i915: use new iterator in i915_gem_object_last_write_engine v2
Date:   Thu, 16 Sep 2021 13:30:34 +0200
Message-Id: <20210916113042.3631-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is maybe even a fix since the RCU usage here looks incorrect.

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..7ff0027af7d9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -507,16 +507,17 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
 	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
+					 fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
 	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
 	return engine;
 }
 
-- 
2.25.1

