Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F952F83CD
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 19:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388233AbhAOSPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 13:15:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388125AbhAOSPT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 13:15:19 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5305C0613D3
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:13:58 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id l12so4977998wry.2
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 10:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YdGEIo0hl2Rfpl/h+Jq0+PenJy8U5mbtMlzqWbcxCkg=;
        b=nn+YQQ3tBavKBlOFL7sT7bojtBwspT5MdJqIVfqTvMbPS+d2dEqAdBTVblOgzuynOQ
         Olk3p9M/630y78Ld02C5b4c2E1yI/CegVOo0NaSyJtAcPz1l3o0q4R5R3R9iIRuOn77r
         kxrI9Zwdd4q3BS9xicvx8dfaNIuzw3CoE9v2aObzi/BiIN8qVM6nCVaQXl+pIU9nxsya
         O4/5uD8YtnZJ1rj3KZJsnJ8wHzNbOQfDmlS1/7bIW1dGKnk2aqMM/npcyjg7b6vVqE1S
         jxW3enZtU+ZYPgAUpoXU9klmE3OVP67lIRz99VbnxcfhwDsy7TPk5Ojc3EAfpVqLU24B
         5xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YdGEIo0hl2Rfpl/h+Jq0+PenJy8U5mbtMlzqWbcxCkg=;
        b=UUr2FWwVLe0vxMCR/p4NEy6tpRGq+RjOYwP8nRy176VN35sc6ISmhvabZJOeCSxcFA
         4lUmRL8VFrvurOrCncmDUTB+AFFC9u9HNQfjpyOPHyjmOnmWtismtXRG2tHw9mbczkbJ
         c9CoLGwLHfCxIY96NmXuUwgVv7E80BDRbwFPS9Hbp4V6MsykxNvSA2S5ofzFx11xzn1L
         vZENn169CH+mNu1t+/QymiR0uT8LUx56ySNxGjOGGJtUSFnDx6CgBu1JSAo/bn2403D5
         20qnQr//YmzS0JvfKdxkqg76o81NbcrAaDBuofTRdwXp71bIvh5RO7LrhIkyv/oAv3lX
         0KBQ==
X-Gm-Message-State: AOAM531UEXctZmnAZGjdiVZbY847M5C+ZcuH4ngiO8CoTivEm6L83UqT
        PkrkLlkqAEkdwtS5FeclulUMyQ==
X-Google-Smtp-Source: ABdhPJwoFUexa7yf+5Xx+spu+w33pAquyESNB70QCWuq5Md9/k32C45VD2bWHG3JLcExMyxXr6tD3w==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr14553458wrn.23.1610734437578;
        Fri, 15 Jan 2021 10:13:57 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 10:13:56 -0800 (PST)
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
        linaro-mm-sig@lists.linaro.org
Subject: [PATCH 26/40] drm/vmwgfx/vmwgfx_fence: Add, remove and demote various documentation params/headers
Date:   Fri, 15 Jan 2021 18:12:59 +0000
Message-Id: <20210115181313.3431493-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
2.25.1

