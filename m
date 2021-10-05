Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDEF422534
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 13:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbhJELj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 07:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234477AbhJELj4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 07:39:56 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F80BC061749
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 04:38:06 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k7so36616192wrd.13
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 04:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
        b=Q8EUxwvnAaw0KU8R9kZ0Sz+WeJ22WlDpfAEoJOb7XLrNnpTLSLMRzcx6RlGvoS/Amg
         i3Mi4/rvMmTh9KKheFN771iKJ1+xRJbTILtLHNdXPW3cS11jVXm47mQCeYaWdiO+5sVO
         sKDVxWqU+qfD8UunB/fwMoTsU+Fgpztynk9j3oeMaP8QNprsq+KTCS6BFDyZLOu93gjO
         N/WEvtA1iJuUkzHUCsvWtW/SQlUzENXrKHoBeZclFiDHnHV45eZnSnghl7YA5mCmQv5r
         o75JjeEVUbuiCw1MNgbszDij3OINaNWqYkFRiIE1lr780ie+fG8gB005VSQ0dxlJc789
         giiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ETFFVmDbRxb5cxrXOen58gkxhSGsPJL2Y8O/7sOAJto=;
        b=ZZ4Db3ndib8/urbST4qcINdgoSmxmBOTAtAOXe/4YafXzp9ncTEU7BUXfGC9NsZ0EV
         iZmfaGS7v3+fi7mxVe9kRfJbJA+NjX/d4e1UoWrkikH8RVHq3FywpnhpNRjba8QmhWqM
         XXzyHHJfH5v0QpEfo1r4KBzVx1yThH+wcB88fn0B/DzAYbsubLN0nuQp0Zj4hj5a7oQl
         sFVCV27Qkkyo8DIurCSX5IvH/JLfVGpZiTYjOT5dPbMpRS3ki+PA8xTQPo2ggFA+RcKo
         xneudFyYbpPQtHrBX2iVF3rbtQueKypDNQOPibxLCmmVCMT5tYEstpWXDFWfh8CI+VFb
         fVbw==
X-Gm-Message-State: AOAM5329fmfjcrCYCOl0x5lpnWRCDQngGt3lds+RlTCGaJ0U/8d4i5G2
        WPa8nePpfzwydfV6gtNhmLw=
X-Google-Smtp-Source: ABdhPJxHAmrnhVoif7im+jImnXfY9tw0u6/XOS5J2l/2vyGHeMz9zAZjxIcwRbxfexG/MHiPmUURng==
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr1176818wrn.219.1633433884867;
        Tue, 05 Oct 2021 04:38:04 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
        by smtp.gmail.com with ESMTPSA id c5sm1739912wml.9.2021.10.05.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 04:38:04 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc:     daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: [PATCH 22/28] drm/i915: use new cursor in intel_prepare_plane_fb
Date:   Tue,  5 Oct 2021 13:37:36 +0200
Message-Id: <20211005113742.1101-23-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

