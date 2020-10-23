Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2AC296E69
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 14:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463621AbgJWMWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 08:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463615AbgJWMWn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 08:22:43 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47F1C0613CE
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:42 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d3so1293375wma.4
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2020 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oo+WCqNcRY4hz8ARHU44AzglCk3LcvfnVh+Q+d4r9RU=;
        b=QRe2K4NDzMa3XvVHnklPYEQBWwaTYYKSqPpSchH+IzdO7uoZMOJmLrYKxFyPuFedgt
         hBGRQ8jSDsXFVPkf4tno5kbL04YE1J5uETPopMp2haTMemX81cxn8GM2SG8tLS8LW1Tq
         3bmfMo7wGggEbrwFcrXY/XzlIA2yGcA0FzNrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oo+WCqNcRY4hz8ARHU44AzglCk3LcvfnVh+Q+d4r9RU=;
        b=HAMhS2OGNccGt189EHiw5g8xCgDKZ776A2NSXqLPoZFCSpo1IpKs1sL1DpGNzz0Rm6
         QmIbtU4BBm15eUfjQbFkS77alMAJMBM5n9Uu0eAwPxKwzJB4blD6sWCOn8vxQ4Llwx13
         bUAF4I3xlJV4oelMphmHrbH4D6rEpbjPQQyo2hg7yas/qGSkZB2ayHX5U42HtEhgXQPl
         n4Lms7mT9irnhWkyto+ZRP2JofucItNTSWm+/X0r3tDHr0+omzafnzA/AZT22jfvHMBJ
         nXb+vouNWANAGi+4CwiJrOryIi21ncE6FDagfl7urvS0i0LdxDc+yN+qEIlvBDWrkzET
         EWEg==
X-Gm-Message-State: AOAM532MIXN1oh42B5PrN5+8lrpSLLbo8sT3LGuG2vETsENNxWtVLPKb
        8hYQE2rABwfwsrGq2DosodQBJw==
X-Google-Smtp-Source: ABdhPJxmIrYyotlMUykKvZ8yFRoXhmXv4OuqQiJQL/V4ipGjIXJX6Lq0IMzK4dvfWtQS6XzUEHIJNg==
X-Received: by 2002:a7b:c401:: with SMTP id k1mr2023294wmi.120.1603455761598;
        Fri, 23 Oct 2020 05:22:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 05:22:41 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 17/65] drm/scheduler: use dma-fence annotations in main thread
Date:   Fri, 23 Oct 2020 14:21:28 +0200
Message-Id: <20201023122216.2373294-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the scheduler rt thread gets stuck on a mutex that we're holding
while waiting for gpu workloads to complete, we have a problem.

Add dma-fence annotations so that lockdep can check this for us.

I've tried to quite carefully review this, and I think it's at the
right spot. But obviosly no expert on drm scheduler.

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
 drivers/gpu/drm/scheduler/sched_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9a0d77a68018..f69abc4e70d3 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -764,9 +764,12 @@ static int drm_sched_main(void *param)
 {
 	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
 	int r;
+	bool fence_cookie;
 
 	sched_set_fifo_low(current);
 
+	fence_cookie = dma_fence_begin_signalling();
+
 	while (!kthread_should_stop()) {
 		struct drm_sched_entity *entity = NULL;
 		struct drm_sched_fence *s_fence;
@@ -824,6 +827,9 @@ static int drm_sched_main(void *param)
 
 		wake_up(&sched->job_scheduled);
 	}
+
+	dma_fence_end_signalling(fence_cookie);
+
 	return 0;
 }
 
-- 
2.28.0

