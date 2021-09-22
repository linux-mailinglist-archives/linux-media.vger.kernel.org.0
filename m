Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B194144A7
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 11:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbhIVJMp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 05:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234274AbhIVJM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 05:12:28 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3153EC061574
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:58 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q26so4654158wrc.7
        for <linux-media@vger.kernel.org>; Wed, 22 Sep 2021 02:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
        b=p7WAnkjoVfQgL/EfL1Mpq6ylSS4qMkMDw2JPO+KstqU0ffx/A42eUDDzFGmiNAlLIy
         gVW+NMxVbw6bF8yJAd5zyJaMmVJB5BTOcFGXjTPUb+2l58MD6RBnH9Kdyh5jEFPjskc8
         3uJGAofPN1C0JqlcOj84GzjouzUbk1alFl5/6sddInbjNHR/2T/JfpF5+1afxf2/wfoO
         ln85lRvvxeWbb5npSV45JP2GeIgqU+/P/gZyVKjd4FYKWH9+2LsgEzMLOgx6JXRTeytM
         +ufhBejDCzE2tSDA6vEkyEhVbiZ/7IuRb0+I/tVFVyRQRJlj1M8D85PbBmpwurrtd6dQ
         Qvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
        b=cAj3sdYM5E+Ppw4t2Bj55lkHoiAbO47LZrQ+3hU9AEK5WSNRZ5dIc38xiw5rDLvghj
         nT1M+4Ox7AQH3uXGBCAM/BYUeazIbhhCNp2mHGyU/4GDKOFypdvFOil5aZlFNdKxJjZr
         8B04M5bgGUytxvBA418ArOB1FqRw60KknPmTXDLHowBuicfd7KmjbLQ9EoVo374ViXf7
         DCskJ+DtJj+yBv62gRwHjraqTiRJiojPq7DmDXsKDpl5nv+or6erLujrfQmL7UqT37J+
         OJHUx+MlsyULewl0kM6d4Qh40e+UjlsxjYxZHGmrGF5O7ZMa93XBXWmBZAUKpEsKFTKz
         r6FQ==
X-Gm-Message-State: AOAM530Hd9YNWUwcvC8C4mTDnQUCvQkyrZvI3NCFHVbPfHzXN8GRQA6r
        2unh7VxGB9CFIS4ZvRnn180=
X-Google-Smtp-Source: ABdhPJyVxLiD0ZQqAZZuVAbIuyKWPspNQoHWqmjtviHpXw7fP8OkMR4fQWvYU2Zmsx5B1WRQGFyX8A==
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr8990009wmh.130.1632301856839;
        Wed, 22 Sep 2021 02:10:56 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id r25sm1535515wra.76.2021.09.22.02.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 02:10:56 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/26] drm/msm: use new iterator in msm_gem_describe
Date:   Wed, 22 Sep 2021 11:10:28 +0200
Message-Id: <20210922091044.2612-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit. Also drop the RCU read side lock since the
object is locked anyway.

Untested since I can't get the driver to compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 22308a1b66fc..14907622769f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
@@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence(&cursor, robj, true, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			describe_fence(fence, "Exclusive", m);
+		else
 			describe_fence(fence, "Shared", m);
-		}
 	}
 
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
-
 	msm_gem_unlock(obj);
 }
 
-- 
2.25.1

