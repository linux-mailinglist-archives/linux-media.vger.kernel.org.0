Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1603740D8B8
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 13:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238185AbhIPLcZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 07:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238199AbhIPLcY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 07:32:24 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3A2C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:04 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so7119394wmq.1
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S9Hd2E/Qpw61lQsH4cIVU2nxOsEUFiGZ/6cSSR0b+MQ=;
        b=UNyJUqywH99MZUewMqfuHAyRR9k0ZDG2hlA54YvbD1BFn7IuWO7Hk/VawAuA8tgOK8
         RaDxZ1olqGN2esx0aeHkP38wv+cVnzrsaycL7aZ86g7aRhsRxG/CyQa9netS/JwZ0Nbe
         fZ17s0rdh91VWhhUarazp43XFF6svifzFvdZ2KyLfKV55nNd4K+fMr0fU0FaSPBYixJo
         SZ4nuhd/HWgUiRPEnKttRyINO6POyW7LXVl9y5OAO7WL8AA3cNH7NNp2wQZ6QTeqQ3u+
         l6Q40E7spPkd0z7TOIa+b8acjY3KjiR+K8XZm+rlB7GlI5mmlwlZKpdtDapUbBhUaSb1
         R3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S9Hd2E/Qpw61lQsH4cIVU2nxOsEUFiGZ/6cSSR0b+MQ=;
        b=OHlx72rMWc5Ew/cHT0C6n5CS5Rwose3zkjhHYqIT6Nnn//vMDKN7Pno2djecxa00w0
         SNaPPbn55049PncbBGRWZiIWnWDDq/WIDKGP+jESwfpcjHv/GLwvlmMegzy7UdiDT890
         3QmFCIZj6eaNtK8SM0rTE/f/Mr7wifa7PXnLYZN9PHUVA3qE0PvVaswXADpYC9G8pFik
         lhPkDA8Xa0xeRzQnQjikSjN0bylftCcrNTtn6Vk5itC2sGwDlsrNRDX1nUUFJmP+spK7
         AXht7dKXJCSOusN57IPducGYZMuKeT90VoIWFe/2HPGTm/Wozb3Q38xvsnahxxmArX8+
         +Eyw==
X-Gm-Message-State: AOAM532DFb0fHJZUrJABsP/Awtgl/GLiuN1QD4S6tI2JgE2Rsd39WX7K
        AcTcPhTLQicKIVhnXW96Hd8=
X-Google-Smtp-Source: ABdhPJw+n/81+bpgY1iJPJEdQb0d1AjWt4CwW29ZoleJlOjQCEcaCayiyhG72d8upanpa4b3XJHf+g==
X-Received: by 2002:a1c:1dcd:: with SMTP id d196mr4409956wmd.9.1631791862891;
        Thu, 16 Sep 2021 04:31:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c17sm3803674wrn.54.2021.09.16.04.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 04:31:02 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 19/26] drm/i915: use new cursor in intel_prepare_plane_fb v2
Date:   Thu, 16 Sep 2021 13:30:35 +0200
Message-Id: <20210916113042.3631-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

v2: add rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 134a6acbd8fb..fa73a6754373 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11290,6 +11290,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
+		struct dma_resv_iter cursor;
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
@@ -11300,12 +11301,15 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		if (ret < 0)
 			goto unpin_fb;
 
-		fence = dma_resv_get_excl_unlocked(obj->base.resv);
-		if (fence) {
+		rcu_read_lock();
+		dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
+						 fence) {
+			rcu_read_unlock();
 			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						   fence);
-			dma_fence_put(fence);
+			rcu_read_lock();
 		}
+		rcu_read_unlock();
 	} else {
 		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 					   new_plane_state->uapi.fence);
-- 
2.25.1

