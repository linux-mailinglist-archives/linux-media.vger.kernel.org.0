Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4DE32C714
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355568AbhCDAa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:30:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447353AbhCCNsy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 08:48:54 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C683C061D7C
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 05:44:10 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id e23so5215559wmh.3
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 05:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yJ/EY0CpLytL31e4vbvBGoD9fXz/ITb5FniloFYVPls=;
        b=fth9eihhtdzQbeSYvJf7E98nX3F1qwaKJid/2LAs8W8ejpmJFd5zCTTAu4t22jj694
         4q5PYQxQxmsJL4MzqFOwHepz7BE3Ig0p+xL0EH0m3wXa7KowSJaYJrOmawSXWuNcjVo8
         sPAf4GjUb7uB7kBrcejlHDObUvjzfH8jPeovCJ0/2uXTKy0bsQpNFjvrGPIqYZAljZQP
         m3z4DKaEqxXv1osCoSW+anx0GtTEaeiBOA4hqedbmew4eadlIw0bhmrb6d/5j5b0FxSQ
         wxrxxCwZY0uqH5JUbDmmLAYfrRMDknTei8gcYxkuRxquA/AGG3Xx8QvzLP8Zwg2CHACt
         Fgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yJ/EY0CpLytL31e4vbvBGoD9fXz/ITb5FniloFYVPls=;
        b=LSEPzlsHJJVbh0iLMecDTGyNcaOCQXjmEamo5mXN3MBuMYgoAk6oYrKRB5scbdCrAy
         /yddJ6CXxKImAkFDw/JbrskIZJPzHPzOAOzH/CecRjPgyld0jYNwvulEUmPKMVjNrFD2
         dQDI2Xk5XWwLxMrAyLgW8wYohWCew4qU9cIT9YG+yziZl1TNNQW7CTuXOtvnfzMfMsCV
         78W91FMyOsDcCUIjU5Og5x+ik6vFC7XYEr+GFRLuuN62+Wwzrtsl/0A0jIDKxlsIDWb9
         2N0o7eEXu9PtznstRnAh/ENWX+xqhbaEVKE4wXmIJ/wKTIyOD0dM0kYWhcF/TgjGmd63
         Hh7g==
X-Gm-Message-State: AOAM530ycrOaFxknMsqJW/zriTOrZFCEPFtoCpOOlhrih+H9DNkR84Tt
        wZuc1U9+G9S27IeYCV1EFmgAKA==
X-Google-Smtp-Source: ABdhPJymPplH8CwKDFxrcRRiZiYA8Ux92xOTrZFP2tFVqN/jar/Y7KFcD5STbFd19rQ14V9vbUJFmQ==
X-Received: by 2002:a1c:de05:: with SMTP id v5mr5495703wmg.25.1614779049321;
        Wed, 03 Mar 2021 05:44:09 -0800 (PST)
Received: from dell.default ([91.110.221.155])
        by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 05:44:08 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, Zack Rusin <zackr@vmware.com>
Subject: [PATCH 34/53] drm/vmwgfx/vmwgfx_fence: Add, remove and demote various documentation params/headers
Date:   Wed,  3 Mar 2021 13:43:00 +0000
Message-Id: <20210303134319.3160762-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:82: warning: Function parameter or member 'event' not described in 'vmw_event_fence_action'
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:113: warning: Function parameter or member 'f' not described in 'vmw_fence_obj_destroy'
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:261: warning: Function parameter or member 'work' not described in 'vmw_fence_work_func'
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:720: warning: Function parameter or member 'fman' not described in 'vmw_fence_fifo_down'
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:963: warning: Function parameter or member 'fence' not described in 'vmw_fence_obj_add_action'
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:963: warning: Function parameter or member 'action' not described in 'vmw_fence_obj_add_action'
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:1021: warning: Function parameter or member 'tv_sec' not described in 'vmw_event_fence_action_queue'
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:1021: warning: Function parameter or member 'tv_usec' not described in 'vmw_event_fence_action_queue'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-27-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 378ec7600154b..23523eb3cac2a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -58,13 +58,11 @@ struct vmw_user_fence {
 /**
  * struct vmw_event_fence_action - fence action that delivers a drm event.
  *
- * @e: A struct drm_pending_event that controls the event delivery.
  * @action: A struct vmw_fence_action to hook up to a fence.
+ * @event: A pointer to the pending event.
  * @fence: A referenced pointer to the fence to keep it alive while @action
  * hangs on it.
  * @dev: Pointer to a struct drm_device so we can access the event stuff.
- * @kref: Both @e and @action has destructors, so we need to refcount.
- * @size: Size accounted for this object.
  * @tv_sec: If non-null, the variable pointed to will be assigned
  * current time tv_sec val when the fence signals.
  * @tv_usec: Must be set if @tv_sec is set, and the variable pointed to will
@@ -87,7 +85,7 @@ fman_from_fence(struct vmw_fence_obj *fence)
 	return container_of(fence->base.lock, struct vmw_fence_manager, lock);
 }
 
-/**
+/*
  * Note on fencing subsystem usage of irqs:
  * Typically the vmw_fences_update function is called
  *
@@ -250,7 +248,7 @@ static const struct dma_fence_ops vmw_fence_ops = {
 };
 
 
-/**
+/*
  * Execute signal actions on fences recently signaled.
  * This is done from a workqueue so we don't have to execute
  * signal actions from atomic context.
@@ -708,7 +706,7 @@ int vmw_wait_dma_fence(struct vmw_fence_manager *fman,
 }
 
 
-/**
+/*
  * vmw_fence_fifo_down - signal all unsignaled fence objects.
  */
 
@@ -948,8 +946,8 @@ static void vmw_event_fence_action_cleanup(struct vmw_fence_action *action)
 /**
  * vmw_fence_obj_add_action - Add an action to a fence object.
  *
- * @fence - The fence object.
- * @action - The action to add.
+ * @fence: The fence object.
+ * @action: The action to add.
  *
  * Note that the action callbacks may be executed before this function
  * returns.
@@ -1001,6 +999,10 @@ static void vmw_fence_obj_add_action(struct vmw_fence_obj *fence,
  * @fence: The fence object on which to post the event.
  * @event: Event to be posted. This event should've been alloced
  * using k[mz]alloc, and should've been completely initialized.
+ * @tv_sec: If non-null, the variable pointed to will be assigned
+ * current time tv_sec val when the fence signals.
+ * @tv_usec: Must be set if @tv_sec is set, and the variable pointed to will
+ * be assigned the current time tv_usec val when the fence signals.
  * @interruptible: Interruptible waits if possible.
  *
  * As a side effect, the object pointed to by @event may have been
-- 
2.27.0

