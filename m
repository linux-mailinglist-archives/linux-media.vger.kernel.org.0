Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86F743DD47
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 10:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhJ1JBD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 05:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbhJ1JBC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 05:01:02 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611C6C061745;
        Thu, 28 Oct 2021 01:58:35 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o4-20020a1c7504000000b0032cab7473caso4258443wmc.1;
        Thu, 28 Oct 2021 01:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
        b=a49w+C/y2sbZAU5tKWLTRIp351EX7VpCOI6BKaM8KxWJvC5HzCpafogg+jEZ2O+f5a
         Nm/7cC3SJ2uXEmJ5bCkyV63be86lADCvdtC8euPvITGkeSRYZyQw7Sa1680UshZFXQz/
         9UlHdHthOhGAcl73+AG83bWY/CJaTpkPfDA8/GzGX6HalbIti0y/6sjgY6/P/BSNDBiA
         6GbgPHZ0q87VEgCbsxXdTsCQsRmlq0C4KnFUbX8xR46d4POBvvUr9nkVwcviOHxCqcg4
         kXZB1y8qbCNJRdsRMQ3DMbG2/5NN1hkF5HeNQMo34c5Uwz++WzYb5AX+49xiwcLK3kJX
         90hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
        b=Zgn3srV+S3SVNsQucR2SXksrfqlQapICKqUjmP7NwKZMoEYMLi3JtJtGKhjimvwoQF
         NSWpsqJiDaD55Q3tMRiYvf9jFG6dhhokAyrNo0oZSqybAFTdeUliblXQ5x4aLGBDspcv
         9qcvIy1MrIBQe2HH9vVOsA39CmtP/HrY0pRCC/LAjXdqKRl0c96Lm4eIjrJFfzj1Luf7
         Mbmn1HMRNpyaT9ytUZslOH0USpAUgs3eQ17ZIR/7wE6oHKVHmUemA3lCfXGWLC3whuCy
         LjM+4+Uf39I8Uh49pRshJ4U+saBpEuNy7I8/SGKTr21J3Z5QtfSFF19f0uogGguoSHUc
         mScQ==
X-Gm-Message-State: AOAM531IQwwVjnIFVH7TTox8hzYlOWr6zqE+qbFCJFfAsoN+1PEpshZg
        3h7tsMYzj4CzzoBHw5PETp+RylmdWDo=
X-Google-Smtp-Source: ABdhPJwOvkH0PJNa8GaEqN3ST8vn3EFPokaEJKjsSgERJyLOcZWZ1yA+NuGzCaCXn2rkSVmKVfClTA==
X-Received: by 2002:a1c:540c:: with SMTP id i12mr3048967wmb.6.1635411513954;
        Thu, 28 Oct 2021 01:58:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id k22sm2412143wrd.59.2021.10.28.01.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 01:58:33 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/qxl: use iterator instead of dma_resv_shared_list
Date:   Thu, 28 Oct 2021 10:58:29 +0200
Message-Id: <20211028085829.1726-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028085829.1726-1-christian.koenig@amd.com>
References: <20211028085829.1726-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I'm not sure why it is useful to know the number of fences
in the reservation object, but we try to avoid exposing the
dma_resv_shared_list() function.

So use the iterator instead. If more information is desired
we could use dma_resv_describe() as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/qxl/qxl_debugfs.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 1f9a59601bb1..6a36b0fd845c 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -57,13 +57,16 @@ qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 	struct qxl_bo *bo;
 
 	list_for_each_entry(bo, &qdev->gem.objects, list) {
-		struct dma_resv_list *fobj;
-		int rel;
-
-		rcu_read_lock();
-		fobj = dma_resv_shared_list(bo->tbo.base.resv);
-		rel = fobj ? fobj->shared_count : 0;
-		rcu_read_unlock();
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
+		int rel = 0;
+
+		dma_resv_iter_begin(&cursor, bo->tbo.base.resv, true);
+		dma_resv_for_each_fence_unlocked(&cursor, fence) {
+			if (dma_resv_iter_is_restarted(&cursor))
+				rel = 0;
+			++rel;
+		}
 
 		seq_printf(m, "size %ld, pc %d, num releases %d\n",
 			   (unsigned long)bo->tbo.base.size,
-- 
2.25.1

