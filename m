Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3889841EA6B
	for <lists+linux-media@lfdr.de>; Fri,  1 Oct 2021 12:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353475AbhJAKIX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Oct 2021 06:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353462AbhJAKIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Oct 2021 06:08:18 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0155AC061775
        for <linux-media@vger.kernel.org>; Fri,  1 Oct 2021 03:06:34 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id g19-20020a1c9d13000000b003075062d4daso6382214wme.0
        for <linux-media@vger.kernel.org>; Fri, 01 Oct 2021 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
        b=QZ7jIyUtRkqWi3/s0K0fbEd02lkzUinpljPHbXZlqpmhMVHLiSbCFHJYGGybWrA8Jm
         HmlcLkCjz/B3Fueg7T2MO5A8CIU/W5rd4QtclWoBYabjupoj8UeoRe+umMh0ARSQw0/u
         LfYvx0aumLyVdqSznnKPD5m3G2+hL4QJPRT3HnfhrMe6+oTZBmZ1CCYjBgEaNjOExPEA
         sLEBaYfijWq74Ou5RZjifErnWjzojo2EBTlbg1IhoybYLlE2at/N66Jh/qcjIUH8RRmk
         LIs88T6grbCdFtMQCcdovIRrzZPeQToDAmDTSo6MlGwmippZzNCB4Ffi/D6qJipiYHLB
         +p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
        b=rLDOU1FxrD24FL5NjdPjsWdv+BrCfPPDMcAeaopticii9PdvaVlQDGEgXs+anod5Z8
         bcLpzPcKv1pYQC64+37V4X/VPaK7AgdlO5LVcvFo3KYOFKNbMMvXLjT7lAURwr/PQoLS
         SLFaSHkrfFRQ0HOLZC1zQ4IvFBTh8Rfyvg2tqfq7qw9iIwCwfaDTaUlC09h0eEAGUbEt
         qYE8Wmt8AuuhQ+FfrPGnKXvYkyKPHYIxkj1sysa1NuryTqzzHp2evU4ZMEpZUmrDqbOO
         bkhfN47Q/FQkc13ldH69J/UbdR8j3iKhWT668M5oEJakgr0ZChgwgs+2m6FvPDywW5OK
         vo4w==
X-Gm-Message-State: AOAM5316lq3XI7Es/ReM9ZBIY1BpdA88dvRmXXZXLEml3ohGE3L0eUrp
        BSxWmYvIelctO3BXfYCdyrk=
X-Google-Smtp-Source: ABdhPJwnczMK6QJ2ymumuKHZRC/JtWjIcbjAHbL+u7jejn8qlHzl8dTw34Cn0jdZd2kK2n/HjgmQuw==
X-Received: by 2002:a1c:f609:: with SMTP id w9mr3585301wmc.24.1633082792628;
        Fri, 01 Oct 2021 03:06:32 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id v17sm5746069wro.34.2021.10.01.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 03:06:32 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 22/28] drm/i915: use new cursor in intel_prepare_plane_fb
Date:   Fri,  1 Oct 2021 12:06:04 +0200
Message-Id: <20211001100610.2899-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

