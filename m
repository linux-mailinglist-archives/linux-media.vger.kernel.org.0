Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02454144C6
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbhIVJNS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234268AbhIVJMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:43 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61999C061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:13 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u15so4676502wru.6
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yn0dGzK8VwWATbg/MRLaeJ+EViGvUvAidNc2i9iKcqg=;
        b=bAI4QNHT6vZca+VmFCOr8IcuGXzG39ykF9NW3OCQnREbvSP4HdtVYbDCDCvnpb0uwp
         kiQDOiUHYuerHcdO0clz0n8em/ntx/m9ZEoC+SPuawsAbuNU+G8VjJkshFDctQafV8b7
         kWI+27wdOqFJW/b3CKnzoMtaCfk+MJOsq9QIfLaZ3phScwnLtxV3TX0aGtVcqoGCY1Ro
         yz0ThFDp5Cfc2O28+YF/58t8Licv5AKPUWZMGap6ksAZS+Xns9oL/4DoFbvpqTKGygEo
         KoyYl25NDtQWDpwd2GG+gXQh5hE56wBf5l6O3dtZ2AMl3LiFdWRlr+mQX+cUVIzDz87Y
         tMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yn0dGzK8VwWATbg/MRLaeJ+EViGvUvAidNc2i9iKcqg=;
        b=IpVI4/jNCvrC4cnv6tQ2rAChAR/X0q5UpXLLl6oCRORSNrMZBR9XEv0NB9LZmQvdf8
         azMxE0QhF6Y+Mfuc6RvHJC0gH/ftC+QyUF6IqUfGVi1ZMkmeBSJX4H3HbvjMf/kuqsaD
         BuuGAbrjgkmnxZD3RPZgDLuyS2aK5gosNdc/wK6vdw4+YriewlWVtKL8oQXHK2OGIXqx
         fgaMOlmUMjetjU+xLChSl39rPsjrUb1G3WR7oJZlHSmc94hCMPBoFKD7EOHX3EWcPuPW
         jpbdRHQ3jJs9wXQyAVReDxisPpESYTgVRcFSyWL49Qnqt/pr9s7Dl3fTBcOCsEAiAk+a
         Ti1A==
X-Gm-Message-State: AOAM5311HAFHcGTK7XqAopPIL3YRfaFvpf31t9agq8Z2H5vWHS4pufs8
        yQx6ILz51QpFqEr8MNXlHTU=
X-Google-Smtp-Source: ABdhPJx1e4IYSS2hUCc44tdiMviIyop+wkXx3UxTQUXZN8BLtELRRtnSwV5mF7dKgP+yM4dDjp6h0Q==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr40573442wro.418.1632301871941;
        Wed, 22 Sep 2021 02:11:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:11:11 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 26/26] dma-buf: nuke dma_resv_get_excl_unlocked
Date:   Wed, 22 Sep 2021 11:10:44 +0200
Message-Id: <20210922091044.2612-27-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Heureka, that's finally not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-resv.h | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 72e7ebaa675f..42ea6f667120 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -436,32 +436,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
 	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
 }
 
-/**
- * dma_resv_get_excl_unlocked - get the reservation object's
- * exclusive fence, without lock held.
- * @obj: the reservation object
- *
- * If there is an exclusive fence, this atomically increments it's
- * reference count and returns it.
- *
- * RETURNS
- * The exclusive fence or NULL if none
- */
-static inline struct dma_fence *
-dma_resv_get_excl_unlocked(struct dma_resv *obj)
-{
-	struct dma_fence *fence;
-
-	if (!rcu_access_pointer(obj->fence_excl))
-		return NULL;
-
-	rcu_read_lock();
-	fence = dma_fence_get_rcu_safe(&obj->fence_excl);
-	rcu_read_unlock();
-
-	return fence;
-}
-
 /**
  * dma_resv_shared_list - get the reservation object's shared fence list
  * @obj: the reservation object
-- 
2.25.1

