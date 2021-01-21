Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9B32FEED4
	for <lists+linux-media@lfdr.de>; Thu, 21 Jan 2021 16:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731924AbhAUPbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jan 2021 10:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731136AbhAUPas (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jan 2021 10:30:48 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96139C061756
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 07:30:07 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id 6so2158327wri.3
        for <linux-media@vger.kernel.org>; Thu, 21 Jan 2021 07:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQqaT8UYGQz8L7g0JLcTot7nUww5cRF59SXRrTnxyAY=;
        b=RtlRto7FIAR01mThjCaQw2DIK/138q5EvZ/Sif3qLz3BP3WCyWwoX4PV98gKZF5E2h
         VlejywJ625D08vpGG5M+43jKfqAtZV2Qnmk7pSfSzjskXbTQ6TmtSkZ0Nev/nb/wZd/d
         s3sih/8XhECB8mC5M53kHA3sZ3/NhMuxYdS8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQqaT8UYGQz8L7g0JLcTot7nUww5cRF59SXRrTnxyAY=;
        b=JQjtD26HsCZ9+gzbU6/Mo2eAZ+EGQwtmB/5k52NYboxMPp3fSAdSNN82qle27ery/j
         xD8FmTgOWKIzmnnAVOWvSsFMiVnhMiLAiJLYMZ1mMN4yvZYvmnhgGm0yHqoZxxGqI4S4
         TSnj9EPEMKXHyfsmKF74500PxrYO+zAf5BlJUrMzNTrp8SKOK1Xvjdek6lEGn64wI96U
         p87EkQeos5MbDP/H9bFuVV0P25NbEEmXgVJepJbiQ+yNVk0QscLd4nME5uCEozgIS9Zh
         pDiLTERDHn/G/HQn00ainsi3W0NL3nN6zc7PBSMLZPRrqFy/zR2x4WyLqFfUL9BzXZeN
         2TJA==
X-Gm-Message-State: AOAM530R3sZt3pnCCC6fsuptLKdfW+oOSvgGKwH1/mA3pysdAmPtqOyz
        vdu8JXq5wDhVDvzqzgPeATOsIw==
X-Google-Smtp-Source: ABdhPJy56lBNijm0rnpDyCooI1W7B4dBY5qKeNx3LAjvRcXvNknnWIDNGWlspYAS82Fa2JWqZqJ7xw==
X-Received: by 2002:a5d:49c1:: with SMTP id t1mr33182wrs.56.1611243006402;
        Thu, 21 Jan 2021 07:30:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 07:30:05 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH 01/11] drm/atomic-helper: Add dma-fence annotations
Date:   Thu, 21 Jan 2021 16:29:49 +0100
Message-Id: <20210121152959.1725404-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a bit disappointing since we need to split the annotations
over all the different parts.

I was considering just leaking the critical section into the
->atomic_commit_tail callback of each driver. But that would mean we
need to pass the fence_cookie into each driver (there's a total of 13
implementations of this hook right now), so bad flag day. And also a
bit leaky abstraction.

Hence just do it function-by-function.

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
 drivers/gpu/drm/drm_atomic_helper.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 4a66768b6057..69121d2925bd 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1567,6 +1567,7 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
 void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
@@ -1578,6 +1579,8 @@ void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_commit_hw_done(old_state);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	drm_atomic_helper_wait_for_vblanks(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
@@ -1597,6 +1600,7 @@ EXPORT_SYMBOL(drm_atomic_helper_commit_tail);
 void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 
@@ -1609,6 +1613,8 @@ void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
 
 	drm_atomic_helper_commit_hw_done(old_state);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	drm_atomic_helper_wait_for_vblanks(dev, old_state);
 
 	drm_atomic_helper_cleanup_planes(dev, old_state);
@@ -1624,6 +1630,9 @@ static void commit_tail(struct drm_atomic_state *old_state)
 	ktime_t start;
 	s64 commit_time_ms;
 	unsigned int i, new_self_refresh_mask = 0;
+	bool fence_cookie;
+
+	fence_cookie = dma_fence_begin_signalling();
 
 	funcs = dev->mode_config.helper_private;
 
@@ -1652,6 +1661,8 @@ static void commit_tail(struct drm_atomic_state *old_state)
 		if (new_crtc_state->self_refresh_active)
 			new_self_refresh_mask |= BIT(i);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	if (funcs && funcs->atomic_commit_tail)
 		funcs->atomic_commit_tail(old_state);
 	else
@@ -1810,6 +1821,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 			     bool nonblock)
 {
 	int ret;
+	bool fence_cookie;
 
 	if (state->async_update) {
 		ret = drm_atomic_helper_prepare_planes(dev, state);
@@ -1832,6 +1844,8 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	fence_cookie = dma_fence_begin_signalling();
+
 	if (!nonblock) {
 		ret = drm_atomic_helper_wait_for_fences(dev, state, true);
 		if (ret)
@@ -1869,6 +1883,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	 */
 
 	drm_atomic_state_get(state);
+	dma_fence_end_signalling(fence_cookie);
 	if (nonblock)
 		queue_work(system_unbound_wq, &state->commit_work);
 	else
@@ -1877,6 +1892,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	return 0;
 
 err:
+	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_cleanup_planes(dev, state);
 	return ret;
 }
-- 
2.30.0

