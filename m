Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E01C1CF00A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 11:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbgELJAU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 05:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729475AbgELJAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 05:00:17 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AA6C05BD0B
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:17 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y16so7171503wrs.3
        for <linux-media@vger.kernel.org>; Tue, 12 May 2020 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tFPcYYVPEczCJNqu565ZZzRL31Ro7iqoJLud+V9/W6s=;
        b=gVfBqrMKYAzurJ/RstzwJY91qBLOOMNjuPIDPoBrD1wsTDF47Xk6LAJDfP1paQCHue
         hb7A0jpibe9rCFhP8vACHxcmJAL+/3WLLIF1ayojzTlGhgxI0AD/lpcfFzQsuaWtCNTF
         xdX3NuhPackoyWfVuA8lxXykjw+ve1/2YT27g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tFPcYYVPEczCJNqu565ZZzRL31Ro7iqoJLud+V9/W6s=;
        b=dEMxAiuLira04Lp8ThuODCjRiuLaiJCZIUPaJTmmn46L54fbGwmsh3z4ajhjuM/uH5
         xiOGFWbT4NbGjWOcgn8r8d9PkEUJ5YLVUVZgUgfQQ/ngWFQljhzYDD1PdMnohAdu830f
         Y1td9/SDq7Dv1AsXMbQpx1XwG71T30vFiiegm//mXpGHeMDWxEho4Hlpc7PYua4LCYNV
         s+Z/Ueu/e0w4gQmGPLwMrbb5XhVxMKvb4wGuHcOjW7g5vu9fCK2CId6yYsOxRceYWcpY
         pADmozHZmS45A5e/fZFCEDwC7oQp4PHRWs8LW+U0JFfGBeWoMsrssahR60eiWm8Dmi8c
         h23A==
X-Gm-Message-State: AGi0PuZ8NQRXrZ4H2evnSLp8pOAkwa3JRGd6jtHxBJf3q2zYwGTw7PJ9
        ef2bu7abu5X5hqv8WcbEMgJGCw==
X-Google-Smtp-Source: APiQypIbabYyHNtuDrEHDjujDbV60fZeSSVWGyjvdD4rzzfjplG/fVCJt6XewcV7pRKQdnM6iDktMg==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr24833712wrk.92.1589274015818;
        Tue, 12 May 2020 02:00:15 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id y10sm18845457wrd.95.2020.05.12.02.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 02:00:15 -0700 (PDT)
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
Subject: [RFC 17/17] drm/i915: Annotate dma_fence_work
Date:   Tue, 12 May 2020 10:59:44 +0200
Message-Id: <20200512085944.222637-18-daniel.vetter@ffwll.ch>
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

i915 does tons of allocations from this worker, which lockdep catches.

Also generic infrastructure like this with big potential for how
dma_fence or other cross driver contracts work, really should be
reviewed on dri-devel. Implementing custom wheels for everything
within the driver is a classic case of "platform problem" [1]. Which in
upstream we really shouldn't have.

Since there's no quick way to solve these splats (dma_fence_work is
used a bunch in basic buffer management and command submission) like
for amdgpu, I'm giving up at this point here. Annotating i915
scheduler and gpu reset could would be interesting, but since lockdep
is one-shot we can't see what surprises would lurk there.

1: https://lwn.net/Articles/443531/
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
 drivers/gpu/drm/i915/i915_sw_fence_work.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence_work.c b/drivers/gpu/drm/i915/i915_sw_fence_work.c
index a3a81bb8f2c3..5b74acadaef5 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence_work.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence_work.c
@@ -17,12 +17,15 @@ static void fence_work(struct work_struct *work)
 {
 	struct dma_fence_work *f = container_of(work, typeof(*f), work);
 	int err;
+	bool fence_cookie;
 
+	fence_cookie = dma_fence_begin_signalling();
 	err = f->ops->work(f);
 	if (err)
 		dma_fence_set_error(&f->dma, err);
 
 	fence_complete(f);
+	dma_fence_end_signalling(fence_cookie);
 	dma_fence_put(&f->dma);
 }
 
-- 
2.26.2

