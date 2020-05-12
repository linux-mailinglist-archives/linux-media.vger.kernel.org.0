Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656871CF07C
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 11:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgELJAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 05:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729392AbgELJAH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 05:00:07 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C1CC061A0F
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:06 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y16so7170668wrs.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QpRcEBLBFti7+uwIPhFpaG5e28opFzcZsYVebGatC0I=;
        b=QOpkeUs0h0wN4sti4X0g6ThD3SrxXZsFWkczPFMfaK9K848FuZY/LBbwUozpO63nQf
         eTJs+eMU1PYoj07tdTFH4MaPU0yMQAi0jxHqRvYdOuXMTkIN/Mt01aR+HFippq1ZJM2r
         G6xGmiSojmbfOZiM1YCpKK0rOM2Epr1zxLZfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QpRcEBLBFti7+uwIPhFpaG5e28opFzcZsYVebGatC0I=;
        b=HLoom1W6BJH3eR6sOILeQ62dFUZDFg14bZ+2fEhWxNRIWxKyliOnhtIOztRqxIKydz
         UXS4LMG9KrGyY6FKvt/SXWetf61aNPrVsYKsedmgKBg8YigqX4+BLddknATM60Ehh0y/
         fRRo4y7S5fVgaXtLW0+Qg31PQL9kmqo1ywr5FjpkWtDkUC/hhGjr3HDEaieEstzSxheD
         ms9HugEgdmcZzFQYDD/bL2cDGRlxnFuQytJEBkyg8vwfKqYhEqC5TNb/6sjEQ2AK4lmc
         VZnh7GtP3lVL5E7krXXuVJVHsUhimkv6DvCGGbwLRif78P2OOz/MKaXOsAwJ1Wps0I5l
         gw4A==
X-Gm-Message-State: AGi0PubASu61Vwo2faa90Lde+qRR7pTCwXeeL9MVo9saHvqG4cN7SeW2
        r9pjJA0J9fD+tYjLScqn/tmGCQ==
X-Google-Smtp-Source: APiQypKd1E6Oeu9FhxQgfCRXfBgs5PqqzFNBcX4uC9QIYdSJsh2y79L6Is6aCs3MeuVyGs7xUaybiQ==
X-Received: by 2002:adf:8302:: with SMTP id 2mr24564990wrd.114.1589274005258;
        Tue, 12 May 2020 02:00:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.02.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 02:00:04 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [RFC 08/17] drm/scheduler: use dma-fence annotations in main thread
Date:   Tue, 12 May 2020 10:59:35 +0200
Message-Id: <20200512085944.222637-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
References: <20200512085944.222637-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
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
index 2f319102ae9f..06a736e506ad 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -763,9 +763,12 @@ static int drm_sched_main(void *param)
 	struct sched_param sparam = {.sched_priority = 1};
 	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
 	int r;
+	bool fence_cookie;
 
 	sched_setscheduler(current, SCHED_FIFO, &sparam);
 
+	fence_cookie = dma_fence_begin_signalling();
+
 	while (!kthread_should_stop()) {
 		struct drm_sched_entity *entity = NULL;
 		struct drm_sched_fence *s_fence;
@@ -823,6 +826,9 @@ static int drm_sched_main(void *param)
 
 		wake_up(&sched->job_scheduled);
 	}
+
+	dma_fence_end_signalling(fence_cookie);
+
 	return 0;
 }
 
-- 
2.26.2

