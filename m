Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604B740F7B0
	for <lists+linux-media@lfdr.de>; Fri, 17 Sep 2021 14:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244208AbhIQMgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Sep 2021 08:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244209AbhIQMgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Sep 2021 08:36:48 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FC4C061574
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:26 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x6so14881815wrv.13
        for <linux-media@vger.kernel.org>; Fri, 17 Sep 2021 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
        b=gTKSq5IlpVVhJ7LmSQq4w/BPvlNKwZs3Zr8KCpeH88ZhemymL7oNRSKee7T8vn0gFu
         GiTupzuek4TK+fn7YWHeg6o7t12JrFsJeWuIZrACWgsgQfVyszfi2uIczoCrdUmREj4m
         4of8y11J8eHNS0wN9MDCpuTyyIYr01zR0mEYxB0T0+TL8OPlxm9h/9ILVEmJtONaJ82t
         cb0Oe/GMnNxcBWK2ONQ3GlfYp5HbPR457PX7LKwv1phdg4FtZFYnDHJH/nNz04AqA+f7
         B3FJ0kNxvmT/Ez/6+5D2891kRV7ItEnH1lZhEZey2wO+Y/nzU1tPnDqnP+6y0sSKY37g
         CFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
        b=mM3702S4omopiLj77M0riBu/p2M9nM4apeqcYwzA77X1TVbYlAPCAUvwKR1jygTei/
         U9GyuGkyulnPAB8hTQS0tvj7JvKZRGSUrshwdM87LNpofRwt+MmPIGtzmsv/t56DzSM8
         4Btu3rKVTjQMJBkh7qpgbSSAy1RyB4Bw6wQgJZeE9fsif2OkuVtzWBKJu3NM/nGwg5+P
         DZ8oNDzSbfPMGJWUY6CNnQZNiay5qPZtinjm6QJ8ZRRP0ug6QBItWa6zbOebPOEXDexn
         ekYxdtBgQfJPtF4Dzwh/AD50mRyzk+2aDZZefENlJiVX+1C3UyMFX8tU0Fu9JVPvXwn2
         kfnA==
X-Gm-Message-State: AOAM533ae21X572+3iC9g3byG8eVSQEfpYp3Hf0fFWswMW5uJdGvX1mH
        IoHBppzSYrVT1HrKUSJqTcE=
X-Google-Smtp-Source: ABdhPJw0aEKpP6kGBge9nyKMlcuAMHE77hovCenDMfAimtSL6cGoyUszAQL8AU1AKI3ysXIT9I9FVA==
X-Received: by 2002:a5d:5981:: with SMTP id n1mr11975957wri.82.1631882124773;
        Fri, 17 Sep 2021 05:35:24 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l21sm6122049wmh.31.2021.09.17.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:35:24 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch
Subject: [PATCH 10/26] drm/msm: use new iterator in msm_gem_describe
Date:   Fri, 17 Sep 2021 14:34:57 +0200
Message-Id: <20210917123513.1106-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

