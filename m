Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891E9443E24
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 09:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhKCIPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 04:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbhKCIPP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 04:15:15 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A5AC061714;
        Wed,  3 Nov 2021 01:12:39 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id d5so2269341wrc.1;
        Wed, 03 Nov 2021 01:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
        b=g9U1aSa+6bfag8lo3nJKStn7BnOsmwJb6j1n4QC0Lkp1bDff6m9nVVeAoToH3yAudW
         4jTbxb8/cz27CKva48/O/RblrmnLlJa141hwjr/7zvWE1IjnsP9KKu7Zbc4G7kGQ+bjy
         TRMIQFhu0WKSRP/jVfYGghycdSFltphYSAwVFMpZt91dTudt5/B1Bw7LABU4HXO3tbv8
         q9Q62IJ8avbKVgS4KTNxIMKbWGcXUxKEB+i3t+0ZCrlwNWFLXmBmD/GZCpKLiZFgIp3z
         8zW847hVRQ1jOayX9XCwct3J+rN0aZqVN6CWHmMOhJF6kywpn1Xl6nxJGDznecM+bw+q
         2k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4CDt1ISjRTMYLH7FxvvLqp3He8TQZQtgj+2GfXtaN90=;
        b=Nt1r0SdMZ/hOD5nOIftdZQ0/6Q4702jHt/GqDXEpOAs1/+SI4QTIzefXMksUPbflub
         FtlBqvTGBIQntUvxNtY1pNmxNWPZcAcTjXY53eCul9i9lFg2Y/kwiQR4HoSjuj6L4BEO
         sjviNlux380Lzv58LU2gd74ma4ZerHlKRp2ORSZ12nDvI09MzaMV4DRGyuk/UrwHDvCs
         ewCkBb5S7vXLioQJZAJrz4JuWCZkKqeD+rXT+7C9v7pnSdxsDhRZu8Ypczh6avNSDyxU
         u0PfLe9H8FetiS/LEbXcmsRFcgU9N/g6R/WPuFJC5jvoLnx15Q7HHPsOCY2K+R/QYC7u
         Ivbw==
X-Gm-Message-State: AOAM530VkUBtqYOvHkSIgJzM5AX0lFPQoVvA4GeZWG5MV8V0BqGxCS+M
        C847hGGei3tRsCpT6+pb0D0z6DdT4fo=
X-Google-Smtp-Source: ABdhPJxlY/OJLgc774nRzsIwvqJo4XvP/pZEzGcq0XIZGbOcmmVvVYVPx0RKwrS16P8UJv2gUPvNvA==
X-Received: by 2002:a5d:6dae:: with SMTP id u14mr53757436wrs.46.1635927158385;
        Wed, 03 Nov 2021 01:12:38 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id l7sm1450088wry.86.2021.11.03.01.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 01:12:38 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linux-media@vger.kernel.org, etnaviv@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org
Cc:     sumit.semwal@linaro.org, l.stach@pengutronix.de, daniel@ffwll.ch
Subject: [PATCH 4/4] drm/qxl: use iterator instead of dma_resv_shared_list
Date:   Wed,  3 Nov 2021 09:12:31 +0100
Message-Id: <20211103081231.18578-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103081231.18578-1-christian.koenig@amd.com>
References: <20211103081231.18578-1-christian.koenig@amd.com>
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

