Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D501EDF31
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 10:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgFDIMu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 04:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbgFDIMr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 04:12:47 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F21C05BD1E
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 01:12:46 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g10so4293338wmh.4
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JO6albsu9ail3aAxe1jjEWcSoPjULvK53jZ9O0zdFWo=;
        b=lnZAfT6Yff+IJyU+6wsUrqsOgP2Gj+BMlZtMrYghbDpPPGSv/zoqP2grdoO4AOw05E
         uLOJb/YvDpIETJrOA8RWtcCTW3/8iagYeIGfCzBgEwAJEkP3SyZ5oE2wCQuq2Ve1iyQR
         bh1mKlhPqlAZFzfugxhI6xRlys9QcfRU1N110=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JO6albsu9ail3aAxe1jjEWcSoPjULvK53jZ9O0zdFWo=;
        b=p8cN4bgjLykCOas0gapyD+xGNk5wM4qNdyQHnkycWXMeGj/iXkCBe7TZ/7VXrZSZiD
         i0o1gxHzCmULNIiriRaxqP9bQUmT63owER+Bc0DKes4buulZ+DtJB87w3yeFB+quwOfD
         /hjcC7UETDEzQO+IWVvmyYOUQZ1uh1W/ogrm4l7jjxZCCsT5MpuI9n9BVOXKkcRq6g2L
         v3FGN9bILr9pTuZa5zqLIMrJBwnQWRVTzOwzkZ3VWJZoizqxy6dP6SdpUH5N09dXLpF6
         DoUDfLVo4W1d9bh9EHd/I2H7xNQ9Lgz1EjLn7AXh9sRA5Eg0jWL/7lfZmRV4lQc8dHfw
         iKRQ==
X-Gm-Message-State: AOAM531HT9zmhBAFGzxaNdiXBEUqrrXcLkStn38vd4Rdfqw4Zw6aVLQj
        AcEHHAOr+4kc44uv1pq/zaGgKg==
X-Google-Smtp-Source: ABdhPJyn8WC4htH2TFhAJzXT32NdRtoD972Y+p3loDxohFz/ONHD+IEVEXE5SDKPFz9SSfLivB0maw==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr3041559wmj.121.1591258364877;
        Thu, 04 Jun 2020 01:12:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f11sm6873305wrj.2.2020.06.04.01.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 01:12:44 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org,
        amd-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 10/18] drm/amdgpu: use dma-fence annotations in cs_submit()
Date:   Thu,  4 Jun 2020 10:12:16 +0200
Message-Id: <20200604081224.863494-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
References: <20200604081224.863494-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a bit tricky, since ->notifier_lock is held while calling
dma_fence_wait we must ensure that also the read side (i.e.
dma_fence_begin_signalling) is on the same side. If we mix this up
lockdep complaints, and that's again why we want to have these
annotations.

A nice side effect of this is that because of the fs_reclaim priming
for dma_fence_enable lockdep now automatically checks for us that
nothing in here allocates memory, without even running any userptr
workloads.

Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-rdma@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index a25fb59c127c..e109666aec14 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1212,6 +1212,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	struct amdgpu_job *job;
 	uint64_t seq;
 	int r;
+	bool fence_cookie;
 
 	job = p->job;
 	p->job = NULL;
@@ -1226,6 +1227,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	 */
 	mutex_lock(&p->adev->notifier_lock);
 
+	fence_cookie = dma_fence_begin_signalling();
+
 	/* If userptr are invalidated after amdgpu_cs_parser_bos(), return
 	 * -EAGAIN, drmIoctl in libdrm will restart the amdgpu_cs_ioctl.
 	 */
@@ -1262,12 +1265,14 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
+	dma_fence_end_signalling(fence_cookie);
 	mutex_unlock(&p->adev->notifier_lock);
 
 	return 0;
 
 error_abort:
 	drm_sched_job_cleanup(&job->base);
+	dma_fence_end_signalling(fence_cookie);
 	mutex_unlock(&p->adev->notifier_lock);
 
 error_unlock:
-- 
2.26.2

