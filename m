Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D462461653
	for <lists+linux-media@lfdr.de>; Mon, 29 Nov 2021 14:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234285AbhK2Nac (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Nov 2021 08:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbhK2N22 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Nov 2021 08:28:28 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB28C09B076
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:27 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a9so36271493wrr.8
        for <linux-media@vger.kernel.org>; Mon, 29 Nov 2021 04:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
        b=PrARlWxKE10sEnLh/awOxujQsuzZME2kfIbZ+NkhLa+a1Qwd2/2TqBRn0A5c6/U+/H
         6cze3wVzcIwRa5jjPtk1yQFK1it42KOsc0sNHCn1mnIhM4+GyfkCZoVfDiuSrnASA9vH
         wHoxJ4svxVIoKDsb3JHo0J94QdXFxViXp3S6M/PBc60kQNefGtT6wk1U4ee0/YeJk4mj
         JfWgPkr4UhBwlZeeoJaD0bRumi/tTc/PeO3CDiQ4LG21GIaroOmlXTuF7EvxwIfhaVoR
         IENliQaPJQdjz9B63cWkJ/0fU5uDoP2kGhujJGfAtObxIZKwCFEV1beEvQReHNPlywyD
         ib4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
        b=sECj7sEdjYpq6cDkOvfB0VyEUmtd2YgaoLxgZ69WOqYejX0oZTG3ch7qzEQ53+kbf1
         X/WQffDj/sckmCTwORBV9DjU6fY73RIukeg1EYCbDRW0sNlQV0WK6PbEqzvNRchi+EVh
         yacxGp9hUaZ1unlvd30lL2hmqHGAM5G9DgmTSP9oUbLVZegfX4l1IUs8w8c9y1dv39d5
         RZqmbknieT4ZF+jshrd192P6BvWTxWKNSnvFG9fidTW972jtL2SQQ9sHSdDnh8z2UpCz
         7Sl7sZTY6KyhVKaGKs9cDdjwrYo3rHrWDq8D4X2eFAwiO9JxdKi9qs8Grij76n+EAmam
         eluw==
X-Gm-Message-State: AOAM531uG07QOslRhGhhkBz/WtgEBdFU2ulYO66BzLGbyHeTeGJ48Onx
        RIdJzxJjvF/klylN1LtKpu0=
X-Google-Smtp-Source: ABdhPJzzdlceodIRBmlFEQhUB8Cs4Zy3gLWxC1Aw5MEGHc38yEUkK/zYjhOxO867+NmHzoUgucPFdQ==
X-Received: by 2002:a05:6000:2ae:: with SMTP id l14mr33388815wry.142.1638187646630;
        Mon, 29 Nov 2021 04:07:26 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
        by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 04:07:26 -0800 (PST)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     daniel@ffwll.ch
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 19/28] drm: support more than one write fence in drm_gem_plane_helper_prepare_fb
Date:   Mon, 29 Nov 2021 13:06:50 +0100
Message-Id: <20211129120659.1815-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index c3189afe10cb..9338ddb7edff 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,25 +143,21 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
-	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
+	int ret;
 
 	if (!state->fb)
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	dma_resv_iter_begin(&cursor, obj->resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: Currently there should be only one write fence, so this
-		 * here works fine. But drm_atomic_set_fence_for_plane() should
-		 * be changed to be able to handle more fences in general for
-		 * multiple BOs per fb anyway. */
-		dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(obj->resv, false, &fence);
+	if (ret)
+		return ret;
 
+	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
+	 * to handle more fences in general for multiple BOs per fb.
+	 */
 	drm_atomic_set_fence_for_plane(state, fence);
 	return 0;
 }
-- 
2.25.1

