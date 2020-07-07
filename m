Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265102178CB
	for <lists+linux-media@lfdr.de>; Tue,  7 Jul 2020 22:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgGGUNE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 16:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728648AbgGGUND (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 16:13:03 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0165C061755
        for <linux-media@vger.kernel.org>; Tue,  7 Jul 2020 13:13:02 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f2so18610057wrp.7
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2020 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WFOW4gT++YmCnjEMBR7D68rnZUAaxpD2kN9hzahCniw=;
        b=NjaGAbSC6ieCw+o13JLknjpy1WVp7+Fj2e9N0C2b6OCOtbyYMDjN0SFZbLHfb+xfUZ
         ojz1MHnaHqXj3KkbChlVYuP3Ya4lN7G+SHI5sOuLTS6lleUGlrq+uhR3KmuQGNpyuPWO
         zST7Qbzq97VIRBvuRY3fbcNcRnbFTDngLqmoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WFOW4gT++YmCnjEMBR7D68rnZUAaxpD2kN9hzahCniw=;
        b=SathNuxdto+ebTz1z7IWiADriCvRQemsE8L6rUVvgOmW3k1koDZKX5/1XJ6R2yz4uz
         Dj7/VH4Bw5eLIF5Pws6SL4MkpdPWIlwMRphmnLzrVWvBaqjAZ6nUZaAVeOAVZHB0uIis
         Jh0oJp3sinePrgGXIO2i+VZZfSMDnroKuDBe+PuBOzc+0PnxPUuxnZsqEvKCgneqpA5r
         uv/FZGeF4fG1N2bRA1UeyAR+QNgZLQmrSKoMtbVIjRdaFWX/DPNBc5ScS3WiqZ9uRU+W
         MnazcwAgPn25a6BYeICTggi5nmTUCioU+KHVgiKR+3BmHEMJZmFl9z0ePOMb8wSE6wOg
         wV/A==
X-Gm-Message-State: AOAM533te6hGwUyjIy09AvfV442yo84Kr/68KJ6hEGVs0Sppm4YPwTO6
        xN5hF1j4lAIdpniI+uS9V6XHiA==
X-Google-Smtp-Source: ABdhPJxz2+QUQcXCyxki0D2e+ndxvRp+10YXL0LWJsIgkTzFIG0bV94n9tB2byQ48J/mXJg0xj2TXw==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr30381378wru.147.1594152781551;
        Tue, 07 Jul 2020 13:13:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:13:00 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        amd-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 17/25] drm/scheduler: use dma-fence annotations in main thread
Date:   Tue,  7 Jul 2020 22:12:21 +0200
Message-Id: <20200707201229.472834-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
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
index d6eaa23ad746..52f1ab4bc922 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -765,9 +765,12 @@ static int drm_sched_main(void *param)
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
@@ -825,6 +828,9 @@ static int drm_sched_main(void *param)
 
 		wake_up(&sched->job_scheduled);
 	}
+
+	dma_fence_end_signalling(fence_cookie);
+
 	return 0;
 }
 
-- 
2.27.0

