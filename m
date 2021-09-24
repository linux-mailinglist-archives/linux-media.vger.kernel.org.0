Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02CEA4177AC
	for <lists+linux-media@lfdr.de>; Fri, 24 Sep 2021 17:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347204AbhIXPdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Sep 2021 11:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347182AbhIXPdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Sep 2021 11:33:12 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76673C061613
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:39 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t18so28761765wrb.0
        for <linux-media@vger.kernel.org>; Fri, 24 Sep 2021 08:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
        b=Eqf0TsStDMRTsdGFJuWVnJf2v0hiU5Gee3VDgqFxAzZ4shiQx3J5v0f2tbpNl4fudu
         QxRSbr4FinII9L6a7uTnPsMcOD4Q7sr0QVgTVMlE0IQQ7UhgKNEdKBSbKw8dAaBHx0QO
         HhzVzmR5sssTD29ad7XRYJJM5oojlUuZEXL6Zpek3SMvs/GxmhfaMUB44UdSBa94IRpz
         X8iDf4MhkoUZgslH5G25e2hc7lC6G4WAVAP6Vc47lfyFwNdQUa3v0sSFf1LoN3K7lRC8
         e2j7Ij8aQLyPV+xNhlUM039IQ0xM8NMqbs7yLdau8szJe3EfJ9EDmylj0pzwlLX7VXz9
         4o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
        b=i0JJG78vTJTx2nu/UxssvXXZnE8+d71T7WVwE7u+zh7S5CboxUalbvWtLeTEjnxD2q
         MeIx5SVpOHyeG7POsAJxri7S57YXqZaPqG4EeeEmhy3R5Bj+uC79shIQXEaTBfwjy1Tp
         lt4wSlnw/iSu8v1/zSNrFQ05hbHmeU41VI19A2TZl+mq+VrEy0RCUlUbquNgR8QB18bk
         xrXkM+g6T4u7xVtLhXF6H4oXLtPHvjHd7qZPmHfIeGWDzUIB1BCGXTL7rQHjYp6OwYDP
         LVtYMCILzyoGAam2CcRaHPXCgR28xf+ASU70MdQSQAqMF/mwgFBoM1NNxN4PguAjHpEN
         /MrQ==
X-Gm-Message-State: AOAM5334OObrvF8Yp4+mWXvsgHjbzMH24WXW3Z0A39J0GmBUNFgBJ+ev
        BuzuX0mnAFfFtImw6bmBCiM=
X-Google-Smtp-Source: ABdhPJyEIbwNagKQjRCKtbLDbhGeGif8L2hXwXVmEhLFr3BzHmPyroyuxSsJRkQX4iKyLiCBG6iiCA==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr12540258wrw.327.1632497498031;
        Fri, 24 Sep 2021 08:31:38 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id u25sm9902248wmm.5.2021.09.24.08.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 08:31:37 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/27] drm/i915: use new cursor in intel_prepare_plane_fb
Date:   Fri, 24 Sep 2021 17:31:07 +0200
Message-Id: <20210924153113.2159-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 134a6acbd8fb..d32137a84694 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -11290,6 +11290,7 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 	i915_gem_object_flush_frontbuffer(obj, ORIGIN_DIRTYFB);
 
 	if (!new_plane_state->uapi.fence) { /* implicit fencing */
+		struct dma_resv_iter cursor;
 		struct dma_fence *fence;
 
 		ret = i915_sw_fence_await_reservation(&state->commit_ready,
@@ -11300,12 +11301,12 @@ intel_prepare_plane_fb(struct drm_plane *_plane,
 		if (ret < 0)
 			goto unpin_fb;
 
-		fence = dma_resv_get_excl_unlocked(obj->base.resv);
-		if (fence) {
+		dma_resv_iter_begin(&cursor, obj->base.resv, false);
+		dma_resv_for_each_fence_unlocked(&cursor, fence) {
 			add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 						   fence);
-			dma_fence_put(fence);
 		}
+		dma_resv_iter_end(&cursor);
 	} else {
 		add_rps_boost_after_vblank(new_plane_state->hw.crtc,
 					   new_plane_state->uapi.fence);
-- 
2.25.1

